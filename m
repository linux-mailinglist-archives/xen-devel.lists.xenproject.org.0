Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D14B50D0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271583.466112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaua-0002kG-Rb; Mon, 14 Feb 2022 12:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271583.466112; Mon, 14 Feb 2022 12:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaua-0002ck-H3; Mon, 14 Feb 2022 12:57:00 +0000
Received: by outflank-mailman (input) for mailman id 271583;
 Mon, 14 Feb 2022 12:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJauY-0001Wb-Tg
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:56:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 955ad2c9-8d95-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 13:56:54 +0100 (CET)
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
X-Inumbo-ID: 955ad2c9-8d95-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mNfie2MP8cG2OgPaZ9Su1HgYG5WuL0YllF2ieG0fnJE=;
  b=BJW87xX7vA4vhnS5jjLLg60j6+WVq5cK3/EIdz3u3Vm6Nw2sfakxl5f5
   qON0BYKghu8nsIv0vpL3RMzglz8g/CsncEyVDtJtPo6hdTqfYJDGS9TRk
   Taw1p5UrXV17Y3hdYCao/cGKHRzwWiSWXq4LKm3wo+eQTP7utpHPVadiZ
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 5fwCK46QNMINHaSODo3dbe9bwNd34zbkmByn1roMykKdwEluZshOOOzrf+BHQL8W3mmgOHjo02
 WFPM7Qm/4We8QH2wMprEhZAnGVIE3gfoQ8qBPcbYTnFyM/yUU5CMeHEz72CmpTndMojnReikJU
 3XjDzQbFmKvPNoLYlCNnNYBncfOsXSpb4cWCCaK7b2JwHXMUfuCmsj0EooIS3y9JQpAKtgbp+A
 uesMuQi+HOUeybjNLxqYjEV20VeuCfJ6y/fqqe23QasiL6y+QCTl9lyn3XXl6l82w83e9qUiM7
 n2vmTys8IA+M5cCki/Q+iw5A
X-SBRS: 5.1
X-MesageID: 64148580
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lGd3sKtnr8WgXqPMkLJOvq260ufnVGlZMUV32f8akzHdYApBsoF/q
 tZmKWDXOvzYY2b2KdggaojnoE4E6sDUx9RgHgVtqi43ES1H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplur+gSDktBpT1x6cPX0lZQw5DPq9DweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5NFOWc/NHwsZTVRZngNCqpls92yj0HiQwVVkV6Qlbsetj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+IZ+ACzzpLt2lnaFGRUT25uVd8ksfZjEFTGy
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
IronPort-HdrOrdr: A9a23:anNxi6A1HdEPhzrlHemu55DYdb4zR+YMi2TC1yhKJyC9E/bo7v
 xG88566faZslossTQb6LW90cq7MBXhHPxOkOos1N6ZNWGM0gaVxcNZnO/fKlXbakrDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64148580"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/7] x86/hvm: Use __initdata_cf_clobber for hvm_funcs
Date: Mon, 14 Feb 2022 12:56:30 +0000
Message-ID: <20220214125632.24563-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All calls through hvm_funcs are fully altcall'd.  Harden all function pointer
targets.

This optimises away 106 targets.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/hvm.c     | 2 +-
 xen/arch/x86/hvm/svm/svm.c | 2 +-
 xen/arch/x86/hvm/vmx/vmx.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index cdd1529014f2..709a4191efe8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -88,7 +88,7 @@ unsigned int opt_hvm_debug_level __read_mostly;
 integer_param("hvm_debug", opt_hvm_debug_level);
 #endif
 
-struct hvm_function_table hvm_funcs __read_mostly;
+struct hvm_function_table __ro_after_init hvm_funcs;
 
 /*
  * The I/O permission bitmap is globally shared by all HVM guests except
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 63535a74b504..b80d4af6cb90 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2513,7 +2513,7 @@ static void cf_check svm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     }
 }
 
-static struct hvm_function_table __initdata svm_function_table = {
+static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .name                 = "SVM",
     .cpu_up_prepare       = svm_cpu_up_prepare,
     .cpu_dead             = svm_cpu_dead,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 41db538a9e3d..758df3321884 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2473,7 +2473,7 @@ static void cf_check vmx_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     vmx_vmcs_exit(v);
 }
 
-static struct hvm_function_table __initdata vmx_function_table = {
+static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .name                 = "VMX",
     .cpu_up_prepare       = vmx_cpu_up_prepare,
     .cpu_dead             = vmx_cpu_dead,
-- 
2.11.0


