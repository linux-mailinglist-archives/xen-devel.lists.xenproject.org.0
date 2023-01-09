Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C24F662512
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 13:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473585.734282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqxD-0002P2-4g; Mon, 09 Jan 2023 12:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473585.734282; Mon, 09 Jan 2023 12:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqxD-0002Lu-1i; Mon, 09 Jan 2023 12:08:39 +0000
Received: by outflank-mailman (input) for mailman id 473585;
 Mon, 09 Jan 2023 12:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPNl=5G=citrix.com=prvs=36677a302=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pEqxB-0001pa-35
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 12:08:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57ecce77-9016-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 13:08:36 +0100 (CET)
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
X-Inumbo-ID: 57ecce77-9016-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673266116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8U+oMbjFcnCWKV1GHRn181dRulE+W90T2RctIPLLxek=;
  b=iEvuOkm38xhLg8CC9uODx5ELqS16A68TvM18bHfSTo1i6WgGPr6HwmY4
   BfIg73wcQkpshyJ9QddV3THqckAaMtbYZDwfQDBmO2llR4hIKLLS9eLqq
   27yhkvUvv0VxUEGFqarik2TREkH/q3ApD613PtIKEcuW0hQ4tMUKnJpck
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91779491
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:b+85kq0sNJ2BzgzCevbD5RJxkn2cJEfYwER7XKvMYLTBsI5bp2YCy
 2QWWj3UOf6PN2b8eox/OYu/oxkOvZSHyN9jHQc9pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlD5gVmNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJjkR1
 eE+KSg3MgmnoeCy27S5dOJeiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKkSbC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TbHJoKzxrJ/
 woq+UzGIiMLMM2T0wGq73yni+zgvQflf5orQejQGvlC3wTImz175ActfVmmp7+/g023WdNaI
 mQV/DYjqe4580nDZtrwQRy+5mKFtxg0WtxMHul84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BU0oaDIATAAFy8L+u4x1hRXKJuuPC4bs0IezQ2uph
 WnX8m5u3N3/kPLnyY2cpQ/nnhStvqKVVyoT5AHMWGCb5TF2MdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFoSbLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNDK28gjlmOMIZmOq7EMZGOyatM5jFyhRErE3GE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzyIH8ihkEj8geXCDJJwdVvjGAHUBgzexPrayDg5D
 v4Fb5fao/mheLGWjtbrHX47cglRcClT6WHeoM1LbO+TSjeK60l4Y8I9NYgJItQ/94wMz7egw
 51IchMAoLYJrSGdeFrih7EKQO+HYKuTWlpnZ3d9ZQb5hSd+CWtthY9GH6YKkXAc3LQL5ZZJo
 zMtIq1s3twnpuz7xgkg
IronPort-HdrOrdr: A9a23:hjsV8KM0FOT0JcBcTgijsMiBIKoaSvp037BN7TETdfU1SKylfq
 WV98jzuiWftN98YhwdcPq7SdW9qArnhOZICOoqXItKPjOIhILAFugL0WKI+VPd8kPFmtK0/8
 9bAsxD4dfLfCdHZJbBkXCF+/pJ+qjjzEiE7d2uqEuEYmlRGsNdByYQMHf8LqUsLDM2fqbQRv
 Knl7B6T2zJQwVrUviG
X-IronPort-AV: E=Sophos;i="5.96,311,1665460800"; 
   d="scan'208";a="91779491"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 2/2] x86/vmx: Support for CPUs without model-specific LBR
Date: Mon, 9 Jan 2023 12:08:28 +0000
Message-ID: <20230109120828.344-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230109120828.344-1-andrew.cooper3@citrix.com>
References: <20230109120828.344-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Ice Lake (server at least) has both Arch LBR and model-specific LBR.  Sapphire
Rapids does not have model-specific LBR at all.  I.e. On SPR and later,
model_specific_lbr will always be NULL, so we must make changes to avoid
reliably hitting the domain_crash().

The Arch LBR spec states that CPUs without model-specific LBR implement
MSR_DBG_CTL.LBR by discarding writes and always returning 0.

Do this for any CPU for which we lack model-specific LBR information.

Adjust the now-stale comment, now that the Arch LBR spec has created a way to
signal "no model specific LBR" to guests.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 17320f9fb267..c76b09391c76 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3555,17 +3555,25 @@ static int cf_check vmx_msr_write_intercept(
             goto gp_fault;
 
         /*
+         * The Arch LBR spec (new in Ice Lake) states that CPUs with no
+         * model-specific LBRs implement MSR_DBG_CTL.LBR by discarding writes
+         * and always returning 0.
+         *
+         * Use this property in all cases where we don't know any
+         * model-specific LBR information, as it matches real hardware
+         * behaviour on post-Ice Lake systems.
+         */
+        if ( !model_specific_lbr )
+            msr_content &= ~IA32_DEBUGCTLMSR_LBR;
+
+        /*
          * When a guest first enables LBR, arrange to save and restore the LBR
          * MSRs and allow the guest direct access.
          *
-         * MSR_DEBUGCTL and LBR has existed almost as long as MSRs have
-         * existed, and there is no architectural way to hide the feature, or
-         * fail the attempt to enable LBR.
-         *
-         * Unknown host LBR MSRs or hitting -ENOSPC with the guest load/save
-         * list are definitely hypervisor bugs, whereas -ENOMEM for allocating
-         * the load/save list is simply unlucky (and shouldn't occur with
-         * sensible management by the toolstack).
+         * Hitting -ENOSPC with the guest load/save list is definitely a
+         * hypervisor bug, whereas -ENOMEM for allocating the load/save list
+         * is simply unlucky (and shouldn't occur with sensible management by
+         * the toolstack).
          *
          * Either way, there is nothing we can do right now to recover, and
          * the guest won't execute correctly either.  Simply crash the domain
@@ -3576,13 +3584,6 @@ static int cf_check vmx_msr_write_intercept(
         {
             const struct lbr_info *lbr = model_specific_lbr;
 
-            if ( unlikely(!lbr) )
-            {
-                gprintk(XENLOG_ERR, "Unknown Host LBR MSRs\n");
-                domain_crash(v->domain);
-                return X86EMUL_OKAY;
-            }
-
             for ( ; lbr->count; lbr++ )
             {
                 unsigned int i;
-- 
2.11.0


