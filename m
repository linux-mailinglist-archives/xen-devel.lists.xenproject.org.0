Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E984CB1EB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 23:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282586.481352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPXAz-0001sm-JQ; Wed, 02 Mar 2022 22:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282586.481352; Wed, 02 Mar 2022 22:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPXAz-0001qw-GP; Wed, 02 Mar 2022 22:10:29 +0000
Received: by outflank-mailman (input) for mailman id 282586;
 Wed, 02 Mar 2022 22:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HSw=TN=citrix.com=prvs=05368ea7b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nPXAy-0001qX-Ol
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 22:10:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f5572a2-9a75-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 23:10:26 +0100 (CET)
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
X-Inumbo-ID: 8f5572a2-9a75-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646259026;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tnU5OZzouBn4AHcK0NyTMJDBZStBopfGXyfAs2tmiog=;
  b=OUTdXBGKaGN7BI8QVdC3SFeAIfPbttct5BA09yeFA1J7z1fv+zU8uhlP
   weZ4C2koiOzupg+BHHNKKb1XutmjfY06zprTRO/QzXXAbzZf3LzmgqraT
   gEfmj0velXjdTRvQrLABsKnx5tpLG3wEIsZRtJYqGZ47WPzSe68dSpbbY
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65749612
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:vknyQ6O+x1hxyVjvrR2il8FynXyQoLVcMsEvi/4bfWQNrUongjRTy
 jQWCjiCaK6IYWWmKNt0YISy8EhQuMTQn9ZhGwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2tQw3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 Ox3sbKNeD8TffPXhOhBbRwFTT9UIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQKmCN
 pRAM1KDajz6ewYMZ1EIAq4YlfmKrGjRQhtE9Aqs8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+ppKekU1TC18OmK+BqVWlYBE2BfQsNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iJsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ieh01bJpVImC0O
 Sc/XD+9ArcJZhNGioctPuqM5zkCl/C8RbwJqNiOBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WlOniHqdNIdAtSRZX5bLivw/Fqmie4ClIOMAkc5zX5m+tJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:OrKnj67gQx2x6VzUHgPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.90,150,1643691600"; 
   d="scan'208";a="65749612"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/CET: Fix __initconst_cf_clobber
Date: Wed, 2 Mar 2022 22:10:05 +0000
Message-ID: <20220302221005.16636-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The linker script collecting .init.rodata.* ahead of .init.rodata.cf_clobber
accidentally causes __initconst_cf_clobber to be a no-op.

Rearrange the linker script to unbreak this.

The IOMMU adjust_irq_affinities() hooks currently violate the safety
requirement for being cf_clobber, by also being __initcall().

Consolidate to a single initcall using iommu_call() (satisfying the cf_clobber
safety requirement), and also removes the dubious property that we'd call into
both vendors IOMMU drivers on boot, relying on the for_each_*() loops to be
empty for safety.

With this fixed, an all-enabled build of Xen has 1681 endbr64's (1918
including .init.text) with 382 (23%) being clobbered during boot.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I was unsure whether to go common or x86 spefific IOMMU code, so went with the
conservative option.  The final hunk can trivially move if preferred.
---
 xen/arch/x86/xen.lds.S                   | 12 ++++++------
 xen/drivers/passthrough/amd/iommu_init.c |  1 -
 xen/drivers/passthrough/vtd/iommu.c      |  1 -
 xen/drivers/passthrough/x86/iommu.c      |  6 ++++++
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 83def6541ebd..b15e5b67e4a4 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -210,6 +210,12 @@ SECTIONS
   DECL_SECTION(.init.data) {
 #endif
 
+       . = ALIGN(POINTER_ALIGN);
+       __initdata_cf_clobber_start = .;
+       *(.init.data.cf_clobber)
+       *(.init.rodata.cf_clobber)
+       __initdata_cf_clobber_end = .;
+
        *(.init.rodata)
        *(.init.rodata.*)
 
@@ -224,12 +230,6 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end = .;
 
-       . = ALIGN(POINTER_ALIGN);
-       __initdata_cf_clobber_start = .;
-       *(.init.data.cf_clobber)
-       *(.init.rodata.cf_clobber)
-       __initdata_cf_clobber_end = .;
-
        *(.init.data)
        *(.init.data.rel)
        *(.init.data.rel.*)
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 657c7f619a51..2e5bffa732e7 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -831,7 +831,6 @@ int cf_check iov_adjust_irq_affinities(void)
 
     return 0;
 }
-__initcall(iov_adjust_irq_affinities);
 
 /*
  * Family15h Model 10h-1fh erratum 746 (IOMMU Logging May Stall Translations)
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 6a65ba1d8271..f70d51580657 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2119,7 +2119,6 @@ static int cf_check adjust_vtd_irq_affinities(void)
 
     return 0;
 }
-__initcall(adjust_vtd_irq_affinities);
 
 static int __must_check init_vtd_hw(bool resume)
 {
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 58a422fb5f88..6ef580215bc2 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -462,6 +462,12 @@ bool arch_iommu_use_permitted(const struct domain *d)
             likely(!p2m_get_hostp2m(d)->global_logdirty));
 }
 
+static int cf_check __init adjust_irq_affinities(void)
+{
+    return iommu_call(&iommu_ops, adjust_irq_affinities);
+}
+__initcall(adjust_irq_affinities);
+
 /*
  * Local variables:
  * mode: C
-- 
2.11.0


