Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6DDA77220
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 02:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933297.1335300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPs4-0001Zy-68; Tue, 01 Apr 2025 00:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933297.1335300; Tue, 01 Apr 2025 00:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPs4-0001XG-12; Tue, 01 Apr 2025 00:52:52 +0000
Received: by outflank-mailman (input) for mailman id 933297;
 Tue, 01 Apr 2025 00:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dnoa=WT=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzPs1-0001Vj-P0
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 00:52:49 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1db7de8-0e93-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 02:52:48 +0200 (CEST)
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
X-Inumbo-ID: a1db7de8-0e93-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743468767; x=1743727967;
	bh=xy+Rn46fun91syrPY3ZLIJ9vjLWYFH0FTIVp7v5cQ80=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=blLYzK2HVp83a/yMjTd34LOlCYWV9fKn0Mlr1SvjJ3Fgv/Wp1zTxe8VdImo16FpKe
	 FvtLBxjk1is9hPlWfOd6UyfkFf8HNwKHgddseVdlQ6ST/MvN6M3x/jzYUojxYoX8yF
	 Hzv6QRfzg3iAj82X3B473JD/abkIuXQnwKlCB9fZfJFuPvuEFfIIJhc9FsIQpuJF37
	 MScUtCRHDpB4UttOvYKus9kuO4OIWCgMa2MNC0WRA5vDSFCKQIwQS/BIrIbs5P2BMA
	 lcrsNQBZGqvcB8fuKQfGS02+TrLEOfwan6/YcMYyI5Ng9s4LzVwf7Inu2gVarz9HU/
	 oSWoffrJY7P1A==
Date: Tue, 01 Apr 2025 00:52:42 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 2/3] x86/domain: add helpers to simplify emulation flags management
Message-ID: <20250401005224.461325-3-dmukhin@ford.com>
In-Reply-To: <20250401005224.461325-1-dmukhin@ford.com>
References: <20250401005224.461325-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2433a0764aebe7bc34d954ffd0da932cc05b0f2c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Introduce XEN_X86_EMU_BASELINE and XEN_X86_EMU_OPTIONAL to simplify
d->arch.emulation_flags management in the code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tools/python/xen/lowlevel/xc/xc.c | 4 +---
 xen/include/public/arch-x86/xen.h | 7 +++++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/=
xc/xc.c
index 9feb12ae2b..2c01d47575 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
=20
 #if defined (__i386) || defined(__x86_64__)
     if ( config.flags & XEN_DOMCTL_CDF_hvm )
-        config.arch.emulation_flags =3D XEN_X86_EMU_ALL &
-                                      ~(XEN_X86_EMU_VPCI |
-                                        XEN_X86_EMU_USE_PIRQ);
+        config.arch.emulation_flags =3D XEN_X86_EMU_BASELINE;
 #elif defined (__arm__) || defined(__aarch64__)
     config.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
 #else
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x8=
6/xen.h
index fc24879866..55802720f8 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -290,6 +290,13 @@ struct xen_arch_domainconfig {
                                      XEN_X86_EMU_VGA | XEN_X86_EMU_IOMMU |=
   \
                                      XEN_X86_EMU_PIT | XEN_X86_EMU_USE_PIR=
Q |\
                                      XEN_X86_EMU_VPCI)
+
+#define XEN_X86_EMU_OPTIONAL        (XEN_X86_EMU_VPCI | \
+                                     XEN_X86_EMU_USE_PIRQ)
+
+#define XEN_X86_EMU_BASELINE        (XEN_X86_EMU_ALL & ~XEN_X86_EMU_OPTION=
AL)
+
+    /* Hardware emulation flags. */
     uint32_t emulation_flags;
=20
 /*
--=20
2.34.1



