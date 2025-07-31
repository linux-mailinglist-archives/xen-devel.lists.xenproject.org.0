Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FABFB17696
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066297.1431558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYrG-0001gP-UI; Thu, 31 Jul 2025 19:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066297.1431558; Thu, 31 Jul 2025 19:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYrG-0001f6-PZ; Thu, 31 Jul 2025 19:22:30 +0000
Received: by outflank-mailman (input) for mailman id 1066297;
 Thu, 31 Jul 2025 19:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhYrF-0008Dk-9Q
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:22:29 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23e1803-6e43-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 21:22:28 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b23e1803-6e43-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753989747; x=1754248947;
	bh=kIimpYN6GgNiR0+OrJRCVWGYJhmcbYVm8uNo1d7eSBU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=L+9BeSYYkQyLyZVDoA8jtSHA4G6WqnHu8neouNdzg73fU6VrDtUgSMZRPCIQvpuBj
	 jOl8kaAEgVATET2n06IbB/K1MnMnG/VQFGx4yeadOiiu9EX3D3nwIc7YG/tN8gb/d6
	 M3wT6gphiBlsMEj3CKFIwF/7MhoVYpLH6yh+GkKcAY80nTokM3f+W/XK6AYSwmhibY
	 LK1g4G568ANbJlLvTjI0yptpbmRNOYHUl2YGdVTbGvLxUHTcjpMcNEb2isMdp0j71t
	 6XHUVNXx8wuC+Vkp2V5OhXM2bcdVYKvfzYOPBRF30mriZrrGLoGtMcawLPQrQnKUyN
	 u7qZUm1zUlttw==
Date: Thu, 31 Jul 2025 19:22:24 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 8/8] emul/vuart: introduce console forwarding enforcement via vUART
Message-ID: <20250731192130.3948419-9-dmukhin@ford.com>
In-Reply-To: <20250731192130.3948419-1-dmukhin@ford.com>
References: <20250731192130.3948419-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9d93de58570b7d4420779220df8efff263239aaa
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

It may be useful to enforce console forwarding over the virtual UART. E.g.
hardware domain uses PV console by default, but it may be necessary to have
console forwarded to the hardware domain via emulated UART.

Add CONFIG_VUART_CONSOLE_FOCUS to enforce such behavior.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- new patch
---
 xen/arch/x86/domain.c         | 6 ++++++
 xen/common/emul/vuart/Kconfig | 5 +++++
 xen/drivers/char/console.c    | 2 +-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 39b0c0b199b9..40ff92ad6c61 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -848,6 +848,12 @@ int arch_domain_create(struct domain *d,
     if ( is_hardware_domain(d) && is_pv_domain(d) )
         emflags |=3D XEN_X86_EMU_PIT;
=20
+    if ( IS_ENABLED(CONFIG_VUART_CONSOLE_FOCUS) &&
+         IS_ENABLED(CONFIG_VUART_NS16550) &&
+         is_hardware_domain(d) &&
+         is_hvm_domain(d) )
+        emflags |=3D XEN_X86_EMU_NS16550;
+
     if ( emflags & ~XEN_X86_EMU_ALL )
     {
         printk(XENLOG_G_ERR
diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kconfig
index ebefd90d913e..1069ca95f2db 100644
--- a/xen/common/emul/vuart/Kconfig
+++ b/xen/common/emul/vuart/Kconfig
@@ -51,4 +51,9 @@ config VUART_NS16550_DEBUG
 =09help
 =09  Enable development debugging.
=20
+config VUART_CONSOLE_FOCUS
+=09bool "Console input forwarding via UART emulator"
+=09help
+=09  Enable physical console input forwarding to guest OS via emulated UAR=
T.
+
 endmenu
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 93254979817b..d142f5511d61 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -597,7 +597,7 @@ static void __serial_rx(char c)
     if ( !d )
         return;
=20
-    if ( is_hardware_domain(d) )
+    if ( !IS_ENABLED(CONFIG_VUART_CONSOLE_FOCUS) && is_hardware_domain(d) =
)
     {
         /*
          * Deliver input to the hardware domain buffer, unless it is
--=20
2.34.1



