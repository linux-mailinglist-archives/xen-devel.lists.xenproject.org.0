Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DFB56BE15
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363580.594186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qiB-00057c-1p; Fri, 08 Jul 2022 16:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363580.594186; Fri, 08 Jul 2022 16:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qiA-00054m-UZ; Fri, 08 Jul 2022 16:20:10 +0000
Received: by outflank-mailman (input) for mailman id 363580;
 Fri, 08 Jul 2022 16:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i666=XN=citrix.com=prvs=181ea21da=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o9qi9-00054g-8G
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:20:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3865ac0-fed9-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 18:20:07 +0200 (CEST)
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
X-Inumbo-ID: d3865ac0-fed9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657297206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y7mZFxS2RWldNtqgu6etUWYDAXOJTO/Jp6WEGB9hmEo=;
  b=bJ3eI7g30OBSmoeUAMHccUQUrTyCITL/a6+vAPJx2VehqOdUvcj8YFjm
   4oAPKYf1OhIiv6yiO+/XZHbDWCfv+5ovdjJdXLVk7bfd/0guTijFabTg0
   BZaO7LLyHVoT1l8qnFUSuPYc5jDJWwuPTeTpzNn8WANFPkS9KIOo3NkF2
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75816900
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wCPpcaj9TiUZUcn0wHrrmBq4X161BRAKZh0ujC45NGQN5FlHY01je
 htvXDjSafyPZGD3LohyPojj80JVu5XSztcyHApprikwEigb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXFvd4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSB5EoLco7klaghVQihSD4NF5r/5ClHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xNmc/NUqRO0Un1lE/MZ1itfqjuSLDTxoHiUqvp4UIwHf/01kkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPS94zeY9nOnhsfUgDj2HokVEdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imqmob78z3EPlEVQ29IRO4It9E2excDg
 wrhc8zSOdB/jFGEYSvDq+jO9G/taXR9wXwqPnFdE1ZcizX3iMRq10+UEI4+eEKgpoetcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJGT9bxgbQjxawcRLt1t3HY1
 JT+p+CQ7foVEbaGnzGXTeMGEdmBvqjYb2eF0QE/Rcd7p1xBHkJPm6gJsVmSw28wa645lcLBO
 heP6Wu9GrcJVJdVUUOHS93oUJl7pUQRPd/kSurVfrJzX3SFTyfepHsGTRfJhwjFyRFw+Ylia
 cbzWZv9Vh4yVPU4pAdass9AiNfHMAhlnjiNLX06pjz6uYejiIm9E+1bbwfSMLBpvMtpYmz9q
 r5iCidD8D0HOMWWX8Ud2dR7wYwiRZTjOa3Llg==
IronPort-HdrOrdr: A9a23:8F9pUKqxzpLiLKEmmJzEj4MaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.92,256,1650945600"; 
   d="scan'208";a="75816900"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/spec-ctrl: Add fine-grained cmdline suboptions for primitives
Date: Fri, 8 Jul 2022 17:19:34 +0100
Message-ID: <20220708161934.10095-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220708161934.10095-1-andrew.cooper3@citrix.com>
References: <20220708161934.10095-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Support controling the PV/HVM suboption of msr-sc/rsb/md-clear, which
previously wasn't possible.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 docs/misc/xen-command-line.pandoc | 12 +++++--
 xen/arch/x86/spec_ctrl.c          | 66 +++++++++++++++++++++++++++++++++------
 2 files changed, 66 insertions(+), 12 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index da18172e50c5..de33ccc005fc 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2257,7 +2257,8 @@ not be able to control the state of the mitigation.
 By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 
 ### spec-ctrl (x86)
-> `= List of [ <bool>, xen=<bool>, {pv,hvm,msr-sc,rsb,md-clear}=<bool>,
+> `= List of [ <bool>, xen=<bool>, {pv,hvm}=<bool>,
+>              {msr-sc,rsb,md-clear}=<bool>|{pv,hvm}=<bool>,
 >              bti-thunk=retpoline|lfence|jmp, {ibrs,ibpb,ssbd,psfd,
 >              eager-fpu,l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio}=<bool> ]`
@@ -2282,12 +2283,17 @@ in place for guests to use.
 
 Use of a positive boolean value for either of these options is invalid.
 
-The booleans `pv=`, `hvm=`, `msr-sc=`, `rsb=` and `md-clear=` offer fine
+The `pv=`, `hvm=`, `msr-sc=`, `rsb=` and `md-clear=` options offer fine
 grained control over the primitives by Xen.  These impact Xen's ability to
-protect itself, and Xen's ability to virtualise support for guests to use.
+protect itself, and/or Xen's ability to virtualise support for guests to use.
 
 * `pv=` and `hvm=` offer control over all suboptions for PV and HVM guests
   respectively.
+* Each other option can be used either as a plain boolean
+  (e.g. `spec-ctrl=rsb` to control both the PV and HVM sub-options), or with
+  `pv=` or `hvm=` subsuboptions (e.g. `spec-ctrl=rsb=no-hvm` to disable HVM
+  RSB only).
+
 * `msr-sc=` offers control over Xen's support for manipulating `MSR_SPEC_CTRL`
   on entry and exit.  These blocks are necessary to virtualise support for
   guests and if disabled, guests will be unable to use IBRS/STIBP/SSBD/etc.
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ba64a09048be..328862bdf549 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -147,20 +147,68 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_rsb_hvm = val;
             opt_md_clear_hvm = val;
         }
-        else if ( (val = parse_boolean("msr-sc", s, ss)) >= 0 )
+        else if ( (val = parse_boolean("msr-sc", s, ss)) != -1 )
         {
-            opt_msr_sc_pv = val;
-            opt_msr_sc_hvm = val;
+            switch ( val )
+            {
+            case 0:
+            case 1:
+                opt_msr_sc_pv = opt_msr_sc_hvm = val;
+                break;
+
+            case -2:
+                s += strlen("msr-sc=");
+                if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                    opt_msr_sc_pv = val;
+                else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                    opt_msr_sc_hvm = val;
+                else
+            default:
+                    rc = -EINVAL;
+                break;
+            }
         }
-        else if ( (val = parse_boolean("rsb", s, ss)) >= 0 )
+        else if ( (val = parse_boolean("rsb", s, ss)) != -1 )
         {
-            opt_rsb_pv = val;
-            opt_rsb_hvm = val;
+            switch ( val )
+            {
+            case 0:
+            case 1:
+                opt_rsb_pv = opt_rsb_hvm = val;
+                break;
+
+            case -2:
+                s += strlen("rsb=");
+                if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                    opt_rsb_pv = val;
+                else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                    opt_rsb_hvm = val;
+                else
+            default:
+                    rc = -EINVAL;
+                break;
+            }
         }
-        else if ( (val = parse_boolean("md-clear", s, ss)) >= 0 )
+        else if ( (val = parse_boolean("md-clear", s, ss)) != -1 )
         {
-            opt_md_clear_pv = val;
-            opt_md_clear_hvm = val;
+            switch ( val )
+            {
+            case 0:
+            case 1:
+                opt_md_clear_pv = opt_md_clear_hvm = val;
+                break;
+
+            case -2:
+                s += strlen("md-clear=");
+                if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                    opt_md_clear_pv = val;
+                else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                    opt_md_clear_hvm = val;
+                else
+            default:
+                    rc = -EINVAL;
+                break;
+            }
         }
 
         /* Xen's speculative sidechannel mitigation settings. */
-- 
2.11.0


