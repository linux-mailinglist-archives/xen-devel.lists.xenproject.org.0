Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFDA4B50D3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271578.466062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauV-0001YY-SI; Mon, 14 Feb 2022 12:56:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271578.466062; Mon, 14 Feb 2022 12:56:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJauV-0001Wm-PH; Mon, 14 Feb 2022 12:56:55 +0000
Received: by outflank-mailman (input) for mailman id 271578;
 Mon, 14 Feb 2022 12:56:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJauU-0001Wb-4a
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:56:54 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 936b9f78-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:56:51 +0100 (CET)
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
X-Inumbo-ID: 936b9f78-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5PEQQ/t+uQZA4fZ6sVBA/WN/mnXeBHxy/ygwI1pyIvY=;
  b=UNWjCus7gZ0E78JL6p9Q+IzjpzIRIhJ/KBofSrEHnQRMYZesRevVW8Bl
   bGX9XF81fKMqNwTh1xjwoW7ioYqAp0mMt+RMwoGSBZDbeg4JoAaj429/x
   iCtbmlrkzx7GYdhR0X3XJ3PMJZuGnkDp33cM4fQZV2Jix0WHHcP97tW4j
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: m2EkVewb1vahR/r+JHRysfu1ZNgbrrv4szf28kTfkMw8j9nyP2VCXoMmmo/NXoJNzYYLSdjGBK
 rWmRMhGy/te638LFeR2boY87SbYNTST6qi2BkP/zk47jpUZett2qwx10BrSij1TGXNa8NPr2WT
 81oeZBqRg6/z1/bT/Rc3ZysTDu7/nw/MjSshHhpUcHeLPeaDhUG1KindsCAahJThHRP+gwvHcV
 RmEUKW7Vx2QoW1LlDy59o0JCS3Fq1xoIOfQdl4ztBDM/Wf9vG92q5KKNsA3QbXqc1WCahNkSce
 xG6uwEtrgu8RrI+loWr8qov0
X-SBRS: 5.1
X-MesageID: 66373620
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KUs1xKvSm64PCejjaSMrIZ1kr+fnVGlZMUV32f8akzHdYApBsoF/q
 tZmKTyFa/2IMGCmeI93ao239BhVsJbVzIVlT1E5+C0yE3wX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl5b2dTyUpPLDwycsZUAFRLApAAPQZ5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ZFGMmQ1NHwsZTV3IHIoELwht92Fh1PcfDJgoVyz+Yw4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO70bxQevyqjJ31e2AmscRwFqVuF/69BjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAKzARVodt/xory9U
 J8swZb20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4MvG4udBo0ap9fI1cFh
 XM/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5rUm00HCrWWj+u+2dd7EG3m5EMTXfjew/G7vMbaSua/MG1+WfLX3507fIlpw/ZcmuvSp
 ynvUU5E0lvvw3bALFzSOHxkbbruW7d5rG46YnNwbQr5hSB7bNb99robers2YaIjqL5pw8lrQ
 qRXYM6HGPlOFGjKomxPcZnnoYV+Xx23ngbSbTG9aT0ycsc4FQzE89PpZCX18ywKAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIUzcn7/lP46Jc0IOC7v/DrC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59aj+N
 +VYy/bwbK8OkFpQ6tcuFr9qyeQ15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e0QlceKT0sYvmHyfxJyCLZ6u44IRmi6SJ6lFZdvZ6+4/VYZPRhEYZI
IronPort-HdrOrdr: A9a23:BhIo76xSkGhTxw7hj4IAKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="66373620"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 7/7] x86/vpmu: Harden indirect branches
Date: Mon, 14 Feb 2022 12:56:32 +0000
Message-ID: <20220214125632.24563-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As all function pointer calls are resoved to direct calls on boot, clobber the
endbr64 instructions too to make life harder for an attacker which has managed
to hijack a function pointer.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Use __initconst_cf_clobber
---
 xen/arch/x86/cpu/vpmu_amd.c   | 2 +-
 xen/arch/x86/cpu/vpmu_intel.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 5963ce90150a..9bacc02ec135 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -518,7 +518,7 @@ static int cf_check svm_vpmu_initialise(struct vcpu *v)
     return 0;
 }
 
-static const struct arch_vpmu_ops __initconstrel amd_vpmu_ops = {
+static const struct arch_vpmu_ops __initconst_cf_clobber amd_vpmu_ops = {
     .initialise = svm_vpmu_initialise,
     .do_wrmsr = amd_vpmu_do_wrmsr,
     .do_rdmsr = amd_vpmu_do_rdmsr,
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 48b81ab6f018..8612f46973ef 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -880,7 +880,7 @@ static int cf_check vmx_vpmu_initialise(struct vcpu *v)
     return 0;
 }
 
-static const struct arch_vpmu_ops __initconstrel core2_vpmu_ops = {
+static const struct arch_vpmu_ops __initconst_cf_clobber core2_vpmu_ops = {
     .initialise = vmx_vpmu_initialise,
     .do_wrmsr = core2_vpmu_do_wrmsr,
     .do_rdmsr = core2_vpmu_do_rdmsr,
-- 
2.11.0


