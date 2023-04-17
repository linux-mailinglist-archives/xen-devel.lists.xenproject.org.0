Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32246E4A5E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522143.811344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPIn-0003Yp-20; Mon, 17 Apr 2023 13:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522143.811344; Mon, 17 Apr 2023 13:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPIm-0003Vs-V4; Mon, 17 Apr 2023 13:53:52 +0000
Received: by outflank-mailman (input) for mailman id 522143;
 Mon, 17 Apr 2023 13:53:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMb/=AI=citrix.com=prvs=464dae365=sergey.dyasli@srs-se1.protection.inumbo.net>)
 id 1poPIm-0003Vm-Aq
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:53:52 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47b98e0f-dd27-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 15:53:51 +0200 (CEST)
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
X-Inumbo-ID: 47b98e0f-dd27-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681739630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=UOlxbCFg/XDa6iTXG/9aZ11mIf7hbb1IslY0i63jutw=;
  b=KfsxBJSV42msJk3pB3dLOX4Qn3G5OqLIBAtZq0GiVJHZ9CJSUbNBrp+R
   rWRO649wiZcKNLO9yUVoRENu/jRqqF1WUwAq9hz0mK641mSQJVR7RfVrS
   HGdParPeJvT106jOkE1e2P6xOB8wT6XTf+WOIzzenYOt/o/i6pdNhv2E2
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 105714898
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:rII7j6pNHUHZobOXw4SVeUorQnVeBmIvZRIvgKrLsJaIsI4StFCzt
 garIBmAPPiOZWfxeYsnYd6+px4OvJHdz9RkQAdqpS82Fn9HpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCziZNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADstYiqpo86H+puQENlnjN0fcZnPIpxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVDpUiaqLtx73na1whw+LPsLMDUapqBQsA9ckOw/
 zqboD2lUkBKXDCZ4Su1012FmtLMpgTQSY4sCYa9q99UvnTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvBBzN1t6aOYWmA7brSpjS3UQAXMGsDaCksXQYDpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN0uYdUjjvvhuwqd2nT1+8aPF1RujunKYo67xghZaLSPQ6CZ03Hwt8ZLJp+lEwmlo
 mdRzqBy89sy4YGxeD2lGbtdRe3ytqvUbFUwknY0QcB/qm3FF2qLONkJvWogfBoB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMJGPxT4M5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzOKG8+jl0n6juLCDJJwdVviGALXBt3VEYve+FmFm
 zqhH5DiJ+pjvB3WPXCMrN97waEiJnknH5Hmw/Fqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMCg7Muy0BcYh9BrW/0UEZD6V5pTqWq73hI93Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:v9ZHuqgKl24YdpJcsspT+vtzSnBQXssji2hC6mlwRA09TyX4ra
 2TdZEgvnXJYVkqKRIdcK+7Scu9qB/nm6KdgrN8AV7BZmnbUQKTRelfBODZrAEIdReeygdV79
 YET5RD
X-Talos-CUID: 9a23:S61bc2BTFpyKd836EyJH+HQ+PuwUSFT2lkfbKVaEVDZNVqLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AZJs+1A7/fOp8FgmfbKcx3/lcxox504WBIVwwkq4?=
 =?us-ascii?q?hkNiICzFLPmq8sgqeF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="105714898"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: [PATCH v5 1/3] tools/xenctrl: add xc_get_cpu_version()
Date: Mon, 17 Apr 2023 14:53:33 +0100
Message-ID: <20230417135335.17176-2-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230417135335.17176-1-sergey.dyasli@citrix.com>
References: <20230417135335.17176-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

As a wrapper for XENPF_get_cpu_version platform op.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v4 --> v5:
- Added Reviewed-by

v3 --> v4:
- Replaced DECLARE_PLATFORM_OP
- Removed NULL checks
---
 tools/include/xenctrl.h   |  1 +
 tools/libs/ctrl/xc_misc.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 05967ecc92..34b3b25289 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1186,6 +1186,7 @@ int xc_physinfo(xc_interface *xch, xc_physinfo_t *info);
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo);
 int xc_microcode_update(xc_interface *xch, const void *buf, size_t len);
+int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver);
 int xc_numainfo(xc_interface *xch, unsigned *max_nodes,
                 xc_meminfo_t *meminfo, uint32_t *distance);
 int xc_pcitopoinfo(xc_interface *xch, unsigned num_devs,
diff --git a/tools/libs/ctrl/xc_misc.c b/tools/libs/ctrl/xc_misc.c
index 265f15ec2d..90d50faa4f 100644
--- a/tools/libs/ctrl/xc_misc.c
+++ b/tools/libs/ctrl/xc_misc.c
@@ -226,6 +226,23 @@ int xc_microcode_update(xc_interface *xch, const void *buf, size_t len)
     return ret;
 }
 
+int xc_get_cpu_version(xc_interface *xch, struct xenpf_pcpu_version *cpu_ver)
+{
+    int ret;
+    struct xen_platform_op op = {
+        .cmd = XENPF_get_cpu_version,
+        .u.pcpu_version.xen_cpuid = cpu_ver->xen_cpuid,
+    };
+
+    ret = do_platform_op(xch, &op);
+    if ( ret != 0 )
+        return ret;
+
+    *cpu_ver = op.u.pcpu_version;
+
+    return 0;
+}
+
 int xc_cputopoinfo(xc_interface *xch, unsigned *max_cpus,
                    xc_cputopo_t *cputopo)
 {
-- 
2.17.1


