Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21CD47E653
	for <lists+xen-devel@lfdr.de>; Thu, 23 Dec 2021 17:23:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251127.432374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0Qs1-00008N-8t; Thu, 23 Dec 2021 16:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251127.432374; Thu, 23 Dec 2021 16:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0Qs1-00005a-5M; Thu, 23 Dec 2021 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 251127;
 Thu, 23 Dec 2021 16:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cjH=RI=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1n0Qrz-00005U-Ry
 for xen-devel@lists.xenproject.org; Thu, 23 Dec 2021 16:23:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ad197f2-640c-11ec-bb0b-79c175774b5d;
 Thu, 23 Dec 2021 17:23:05 +0100 (CET)
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
X-Inumbo-ID: 9ad197f2-640c-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1640276585;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=7hzbK3gy7YX7ljX+ayb8kqwNfu76Q1Tcy0UrKhN4VcY=;
  b=cSpmZPo7eRv0VjteKXMCxbrlmhkFQpm8I82l8aN1b6LnSqIvjVHHXRYq
   HSpSkf67C8X/TDq7OMRTj/NpHc3ZcO1A1uMbfHBbSo4XRfXEFyBoS6fRh
   H5LwWpRWEnAyRK+S84sauxOxdvxoa+wuv2CdTFFgCOsA2b2J5KaTn+nmQ
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QEEgBh/VahF6FDSr1YkqcGf6/2CmgYw1Dt+Gx5KQPLtpZ94teh7fSWXMeFNP5nNRnfW/NAdvoD
 eD9WiANW5StGd2wYMOl3uGAAs/sYhNE/3MLo+Su5RlmWrCWXI/ecsTEUmktvFIIFRoEttsiPEX
 Xi2yo07lHu7FAPyAoNCSUDZST5GpRxQVAc+jGsq4QQPnOhU0vmkCqc3v4GdQPT6BzDUxS77I1S
 rvrZcbH9ahZABHGJsNbXdlCmXGyXYICS75GhNpwUpY+Hx1WP2gGacyrtXX18ZuUr6GUameEIQA
 ThEnOO7iklhfFwTsZIdXW2mM
X-SBRS: 5.1
X-MesageID: 60692699
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qCbN0qtv9BkSt/KN9lJ1BI5u9+fnVH1ZMUV32f8akzHdYApBsoF/q
 tZmKWqEOKqKNjSkKo8nbIjg9x5UvMCEyYc3TVM4r380RCwV+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy24PhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5bDqcVgYNaz3teUGWStlIxhjGrIZweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 5RIM2Q+PXwsZTV1HV0YKZ4Ou97xg0nnSjoB93aUiZQetj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPWZXutHg1BT4AYgGb
 RVJpGx+9sDe6XBHUPGtc0eA/0+PvyUxWsFaIdAK0Ryq1fXttlPx6nc/chZNb9kvtckTTDMs1
 0OUk96BOQGDoIF5WlrGqO7K8Gra1Tw9aDZbOHRaFVdtD8zL+dlr1nryosBf/LlZZzEfMRX52
 Hi0oSc3nN3/ZuZbhvzgrTgrb99Bz6UlrzLZBC2LDwpJDSsjPeZJgrBEDnCBsp59wH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3wI3Rshxpmr8oCP5FWy13N2ZDB02WvvohBezO
 BOD0e+vzMI70ISWgV9fPNvqVpVCIVnIHtX5TPHEBueikbAqHDJrCBpGPBbKt0i0yRBEufhmZ
 f+zLJb9ZV5HWP8P5GfnGI8gPUoDm3lWKZX7HsugkXxKENO2ORaodFvyGAfUM71isvrb+F69H
 hQ2H5Li9iizmdbWOkH/mbP/53hTRZTiLZyp+cFRaMCZJQ9qRDMoB/PLmOtzcI15haVF0OzP+
 yjlCENfzVP+g1zBKBmLNS8/OO++A84noCJpJzEoMHapx2MnPdSl4pAAesZlZrIg7uFik6J5F
 qFXZ8WaD/1TYT3b4DBBP4LlpYlveU3z1wKDNiaoehYleJtkS1Cb89PoZFK3piIPEjC2pY01p
 Lj5jlHXRp8KRgJDCsfKaa3wkwPt7CZFwO8rBhnGONhefkno4bNGES2pg69lOdwIJDXC2iCei
 1ScDyAHqLSfuIQy6tTI2/yJ9t/7D+tkE0NGNGDH9rLqZzLC92+uzIIcAuaFeTfRCDH99Km4P
 LgHyvj9NLsMnUpQspo6GLFulPps69zqrr5c7wJlAHSUMAj7VuI+eiGLjZtVq6lA5r5Fog/nC
 EuA9+5TNaiNJM64QkUaIxAob7jb2PwZ8tUIAS/Z/KkuCPdLwYe6
IronPort-HdrOrdr: A9a23:lRR/CqqaTWoJJmA8llnJ04UaV5o9eYIsimQD101hICG8cqSj+f
 xG/c5rsiMc5wxwZJhNo7y90cq7MBfhHPxOkOos1N6ZNWGM0gaVxelZnO7fKlbbehEWmNQz6U
 4ZSdkdNOHN
X-IronPort-AV: E=Sophos;i="5.88,230,1635220800"; 
   d="scan'208";a="60692699"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxc: Drop copy-in in xc_physinfo()
Date: Thu, 23 Dec 2021 16:22:44 +0000
Message-ID: <20211223162244.16198-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

The first thing XEN_SYSCTL_physinfo does is zero op->u.physinfo.

Do not copy-in.  It's pointless, and most callers don't initialise their
xc_physinfo_t buffer to begin with.  Remove the pointless zeroing from the
remaining callers.

Spotted by Coverity.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/ctrl/xc_misc.c | 2 --
 tools/libs/light/libxl.c  | 2 +-
 tools/libs/stat/xenstat.c | 2 +-
 tools/misc/xenpm.c        | 2 +-
 tools/xenmon/xenbaked.c   | 2 +-
 tools/xentrace/xentrace.c | 2 +-
 6 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 3820394413a9..265f15ec2da3 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -195,8 +195,6 @@ int xc_physinfo(xc_interface *xch,
 
     sysctl.cmd = XEN_SYSCTL_physinfo;
 
-    memcpy(&sysctl.u.physinfo, put_info, sizeof(*put_info));
-
     if ( (ret = do_sysctl(xch, &sysctl)) != 0 )
         return ret;
 
diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
index a77aa856fdd6..667ae6409be7 100644
--- a/tools/libs/light/libxl.c
+++ b/tools/libs/light/libxl.c
@@ -351,7 +351,7 @@ const char *libxl_defbool_to_string(libxl_defbool b)
 /******************************************************************************/
 int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
 {
-    xc_physinfo_t xcphysinfo = { 0 };
+    xc_physinfo_t xcphysinfo;
     int rc;
     long l;
     GC_INIT(ctx);
diff --git a/tools/libs/stat/xenstat.c b/tools/libs/stat/xenstat.c
index e49689aa2da9..8bab2e66a7fe 100644
--- a/tools/libs/stat/xenstat.c
+++ b/tools/libs/stat/xenstat.c
@@ -135,7 +135,7 @@ xenstat_node *xenstat_get_node(xenstat_handle * handle, unsigned int flags)
 {
 #define DOMAIN_CHUNK_SIZE 256
 	xenstat_node *node;
-	xc_physinfo_t physinfo = { 0 };
+	xc_physinfo_t physinfo;
 	xc_domaininfo_t domaininfo[DOMAIN_CHUNK_SIZE];
 	int new_domains;
 	unsigned int i;
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index d0191d498484..4f8cde690a7c 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -1244,7 +1244,7 @@ struct {
 int main(int argc, char *argv[])
 {
     int i, ret = 0;
-    xc_physinfo_t physinfo = { 0 };
+    xc_physinfo_t physinfo;
     int nr_matches = 0;
     int matches_main_options[ARRAY_SIZE(main_options)];
 
diff --git a/tools/xenmon/xenbaked.c b/tools/xenmon/xenbaked.c
index 1ed34334c824..7591de7c609f 100644
--- a/tools/xenmon/xenbaked.c
+++ b/tools/xenmon/xenbaked.c
@@ -436,7 +436,7 @@ static struct t_struct *map_tbufs(unsigned long tbufs_mfn, unsigned int num,
  */
 static unsigned int get_num_cpus(void)
 {
-    xc_physinfo_t physinfo = { 0 };
+    xc_physinfo_t physinfo;
     xc_interface *xc_handle = xc_interface_open(0,0,0);
     int ret;
 
diff --git a/tools/xentrace/xentrace.c b/tools/xentrace/xentrace.c
index a8903ebf4625..864e30d50cc3 100644
--- a/tools/xentrace/xentrace.c
+++ b/tools/xentrace/xentrace.c
@@ -589,7 +589,7 @@ static void set_evt_mask(uint32_t mask)
  */
 static unsigned int get_num_cpus(void)
 {
-    xc_physinfo_t physinfo = { 0 };
+    xc_physinfo_t physinfo;
     int ret;
     
     ret = xc_physinfo(xc_handle, &physinfo);
-- 
2.11.0


