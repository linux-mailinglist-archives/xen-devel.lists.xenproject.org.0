Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191B0746D5C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 11:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558189.872057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcLd-0000J9-AG; Tue, 04 Jul 2023 09:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558189.872057; Tue, 04 Jul 2023 09:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGcLd-0000HS-66; Tue, 04 Jul 2023 09:29:25 +0000
Received: by outflank-mailman (input) for mailman id 558189;
 Tue, 04 Jul 2023 09:29:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvOH=CW=citrix.com=prvs=5429f199a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qGcLc-0000Gl-Bk
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 09:29:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 409f4fbf-1a4d-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 11:29:20 +0200 (CEST)
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
X-Inumbo-ID: 409f4fbf-1a4d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688462960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ecB0iOwB6Af2HwnYBz9C/QeRWz5MlTffw9iyZWO+Nps=;
  b=S3W5qaS/OxruHi/jR99ZIjKdydGX7Tt88HMSzRPKXNway+rgIuFpssqq
   O0GXdPYmkFLDuId5WgT4rZVEjMRv0M9Ye4ela9XQOvsi9JzpeJQQzdlHE
   0bF091M1JQITelA7UKFh92XeNs2+Mu1TZr+Vv91253RnDqo+ISF2Mgmc8
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117657058
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:9ecr0qynbHgdTSVdkZJ6t+dNxirEfRIJ4+MujC+fZmUNrF6WrkUHz
 GodCmGBPauIZGWgftp+Pdywp0oE7JLczdZjSFdr+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPawT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWJC6
 cEVAypWUjegptO2/o2lV/But+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMwRjF+
 TqbrwwVBDlFLIODxQOHyEmHl/XrxgnbfZ4LBIG3o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cBaTM5QCAfuOXEg6ACjizwUMt6Ep+c24id9S7L/
 9yakMQvr+xN3Z5XifzmrACvbyGE/caQEFNsjunDdif8t14iOtb4D2C9wQKDhcusOrp1WbVoU
 JIsv8GFpN4DApiW/MBmaLVcRer5jxpp3dC1vLKOI3XC3273k5JbVdoMiAyS3W8wWir+RRfnY
 VXIpSRa74JJMX2hYMdfOtzhW5hynPK5S4i5B5g4i+aihbAoJWe6ENxGPxbMjwgBbmBx+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcWKtMWnAvuqWTA503/i9K2PSfFIYrpxXPSNojVGovY+lSKm
 zueXuPWoyhivBrWOXaHqdJKdQ9WdhDWx/ne8qRqSwJKGSI+cElJNhMb6elJl1BN90iNqtr1w
 w==
IronPort-HdrOrdr: A9a23:KUMiE6G8N667OOz1pLqEU8eALOsnbusQ8zAXPo5KKCC9Ffbo8f
 xG/c5rsiMc7Qx6ZJhOo7290cW7LU80sKQFgrX409+ZLXXbUSiTXfxfBbKL+UyeJ8SGzJ8i6U
 4DSchD4azLfDxHZJ3BkXCF+r8bqbHtzEnrv5a9854Kd25XgspbnmJE42igfHGebTM2dKYRJd
 6z5tdnuzHlQngedMK9b0N1JdTrlpnklI/GfRVDPBIs6BCPgTS0gYSKaCSw71MxUy5v3bxnym
 TOkxX46qK/99m3xwTRzXW71eUnpPLRjvVCGe2RgYwuJjLghh3AXvUYZ4G/
X-Talos-CUID: 9a23:t9UWiW1elbo3D2Z3OhY2A7xfGcw5T3D21izsBGyZOGZXd6OIUF2h0fYx
X-Talos-MUID: 9a23:lx/+yQvPwams6IWb9s2n2yk9KMtR4Z6VI1EXtc4sm+yYLDxMNGLI
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="117657058"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen: Correct comments after renaming xen_{dom,sys}ctl_cpu_policy fields
Date: Tue, 4 Jul 2023 10:29:09 +0100
Message-ID: <20230704092909.3635899-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230629102600.61262-1-andrew.cooper3@citrix.com>
References: <20230629102600.61262-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fixes: 21e3ef57e040 ("x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Fix domctl too.
---
 xen/include/public/domctl.h |  6 ++----
 xen/include/public/sysctl.h | 10 ++++------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index e2e22cb534d6..a33f9ec32b08 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -679,10 +679,8 @@ struct xen_domctl_set_target {
  * Query or set the CPUID and MSR policies for a specific domain.
  */
 struct xen_domctl_cpu_policy {
-    uint32_t nr_leaves; /* IN/OUT: Number of leaves in/written to
-                         * 'cpuid_policy'. */
-    uint32_t nr_msrs;   /* IN/OUT: Number of MSRs in/written to
-                         * 'msr_policy' */
+    uint32_t nr_leaves; /* IN/OUT: Number of leaves in/written to 'leaves' */
+    uint32_t nr_msrs;   /* IN/OUT: Number of MSRs in/written to 'msrs' */
     XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) leaves; /* IN/OUT */
     XEN_GUEST_HANDLE_64(xen_msr_entry_t)  msrs;   /* IN/OUT */
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9d06e92d0f6a..33e86ace5140 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -1047,12 +1047,10 @@ struct xen_sysctl_cpu_policy {
 #define XEN_SYSCTL_cpu_policy_pv_default   4
 #define XEN_SYSCTL_cpu_policy_hvm_default  5
     uint32_t index;       /* IN: Which policy to query? */
-    uint32_t nr_leaves;   /* IN/OUT: Number of leaves in/written to
-                           * 'cpuid_policy', or the maximum number of leaves
-                           * if the guest handle is NULL. */
-    uint32_t nr_msrs;     /* IN/OUT: Number of MSRs in/written to
-                           * 'msr_policy', or the maximum number of MSRs if
-                           * the guest handle is NULL. */
+    uint32_t nr_leaves;   /* IN/OUT: Number of leaves in/written to 'leaves',
+                           * or the max number if 'leaves' is NULL. */
+    uint32_t nr_msrs;     /* IN/OUT: Number of MSRs in/written to 'msrs', or
+                           * the max number of if 'msrs' is NULL. */
     uint32_t _rsvd;       /* Must be zero. */
     XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) leaves; /* OUT */
     XEN_GUEST_HANDLE_64(xen_msr_entry_t)  msrs;   /* OUT */
-- 
2.30.2


