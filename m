Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFBBA332B3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 23:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886842.1296440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLGz-0008Hb-0M; Wed, 12 Feb 2025 22:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886842.1296440; Wed, 12 Feb 2025 22:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiLGy-0008G7-U0; Wed, 12 Feb 2025 22:32:00 +0000
Received: by outflank-mailman (input) for mailman id 886842;
 Wed, 12 Feb 2025 22:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O++Y=VD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tiLGw-0008G1-Cu
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 22:31:59 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 276f6a53-e991-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 23:31:51 +0100 (CET)
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
X-Inumbo-ID: 276f6a53-e991-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=5ig5yxswovhypfy36x7oyogvya.protonmail; t=1739399509; x=1739658709;
	bh=NcTEam6sIrhUBFNWA2/AK3cNU0wcb1PeuB8hUMRu4Aw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Rd5M4kc46F6nzEXKUAybEbl7BFnj6DKlrc/WiUIFItJRBFtc1lZWlCiJTnDG9VRws
	 Ao9UZVbVPBCT7nGfEsr9twUfbEmUTu/gy2Pkkf2VPSemvUX00/M/oGpTtCgAlUgMD/
	 AFYBmb8ucg2OeucnfcaANphEAaApi1CB1FF1NGQikMZXBnyLeMaF7vxxt76SF67poy
	 rvZhtBWGaroCn9OYoV4ihaWjk45B4XM7iYXMu6uEjo1aDO2khm5qAmPfXwQZarDWXu
	 zD++j7ztMBX8Zu2tRcE/E4/JN5ImXcfi9Id5UfNon28TAbNUS2DTqZ8z9TBgepPh4I
	 +gIal8pUWcRMQ==
Date: Wed, 12 Feb 2025 22:31:46 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] xen/console: make console buffer size configurable
Message-ID: <20250212222157.2974150-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: fac4097c759e401774d13273c38d5e8bb05c641c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add new CONRING_SIZE Kconfig parameter to specify the boot console buffer s=
ize
in bytes. The value is rounded to the nearest power of 2 to match existing
conring_size=3D behavior.

The supported range is [16KiB..128MiB].

Bump default size to 32 KiB.

Link: https://gitlab.com/xen-project/xen/-/issues/185
Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Link to the original change:
- https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-15-c5d36b31=
d66c@ford.com/
---
 docs/misc/xen-command-line.pandoc |  5 ++++-
 xen/drivers/char/Kconfig          | 12 ++++++++++++
 xen/drivers/char/console.c        |  6 +++---
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 9bbd00baef..563cdbdd49 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -425,10 +425,13 @@ The following are examples of correct specifications:
 ### conring_size
 > `=3D <size>`
=20
-> Default: `conring_size=3D16k`
+> Default: `conring_size=3D32k`
=20
 Specify the size of the console ring buffer.
=20
+The console ring buffer size can be selected at build time via
+CONFIG_CONRING_SIZE.
+
 ### console
 > `=3D List of [ vga | com1[H,L] | com2[H,L] | pv | dbgp | ehci | xhci | n=
one ]`
=20
diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e6e12bb413..54a3a79da3 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -96,6 +96,18 @@ config SERIAL_TX_BUFSIZE
=20
 =09  Default value is 32768 (32KiB).
=20
+config CONRING_SIZE
+=09int "Console buffer size"
+=09default 32768
+=09range 16384 134217728
+=09help
+=09  Select the boot console buffer size (in bytes).
+=09  Note, the value provided will be rounded down to the nearest power of=
 2.
+=09  Run-time console buffer size is the same as the boot console size,
+=09  unless overridden via 'conring_size=3D' boot parameter.
+
+=09  Default value is 32768 (32KiB).
+
 config XHCI
 =09bool "XHCI DbC UART driver"
 =09depends on X86
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ee5f720de4..73d24a7821 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -101,12 +101,12 @@ static int cf_check parse_console_timestamps(const ch=
ar *s);
 custom_runtime_param("console_timestamps", parse_console_timestamps,
                      con_timestamp_mode_upd);
=20
-/* conring_size: allows a large console ring than default (16kB). */
+/* conring_size: override build-time CONRING_SIZE setting. */
 static uint32_t __initdata opt_conring_size;
 size_param("conring_size", opt_conring_size);
=20
-#define _CONRING_SIZE 16384
-#define CONRING_IDX_MASK(i) ((i)&(conring_size-1))
+#define _CONRING_SIZE       (1UL << (31 - __builtin_clz(CONFIG_CONRING_SIZ=
E)))
+#define CONRING_IDX_MASK(i) ((i) & (conring_size - 1))
 static char __initdata _conring[_CONRING_SIZE];
 static char *__read_mostly conring =3D _conring;
 static uint32_t __read_mostly conring_size =3D _CONRING_SIZE;
--=20
2.34.1



