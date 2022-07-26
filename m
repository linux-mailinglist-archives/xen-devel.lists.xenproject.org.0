Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F735813FD
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 15:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375305.607609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGKOR-00048S-L1; Tue, 26 Jul 2022 13:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375305.607609; Tue, 26 Jul 2022 13:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGKOR-00046G-Hw; Tue, 26 Jul 2022 13:14:35 +0000
Received: by outflank-mailman (input) for mailman id 375305;
 Tue, 26 Jul 2022 13:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB1L=X7=citrix.com=prvs=199b7977f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGKOQ-00046A-Sa
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 13:14:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2fd7e16-0ce4-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 15:14:33 +0200 (CEST)
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
X-Inumbo-ID: e2fd7e16-0ce4-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658841273;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jaOrvQ16dO/XQyfOPMOgXIJZcD928SKh+qF+agx9Tic=;
  b=Z9b4s89iBgOlmOJFvK3TVrdGlykpIvjSsoMLI/N9F7Ow/Btm5IZFHpn2
   ehQTKO9FHCDlQ8/sBPFuClyUdcggkizdhelDKPriHfd6p2tUNaOUC5euZ
   Mf0P6/2w/WGneG44+GZzNJNRqZDha/5JRngXBz1ZryyRznfl9hTZgUk6X
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 75928194
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OrKkp6wER95NXWCDSjh6t+c3xirEfRIJ4+MujC+fZmUNrF6WrkUPz
 mtNCmqCO6yLZ2CgeYtyb46x805XscXUmtJjTgs5pSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb90ky5K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1RVlMxYII6o9x9GGpS9
 f8FazQGMDGq0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzpZRFVN0hRI5U5hOqy3VH0ciFCqULTrq0yi4TW5FMsgeK9aYuJEjCMbfVzx2bfl
 kyYxU6jXygmHsKu9h+q7Fv504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTvfC8g1X4X99ZJ
 F0Z/gIvq7Q/8AqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOluU7WDgr3
 V+hhM7yCHpkt7j9dJ6G3u7K93XoY3FTdDJcI39fJecY3zX9iL5pnBWSQfQ6KqSshcH1Giyzx
 zvUjQFr0t3/kvU3O7WHEUHv2mzx9siRFlRuv207TUr+sFonOdfNi5iArAGCsK0edNvxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNJWfh4B3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CK2EMYUSO8ghK1LZlM2LWaJ39zm2+HXAbIllY
 cvLGSpSJS1y5VtbIMqeGL5GjO5DKtEWzmLPX5HrpymaPU6lTCfMEd8tbQrRBt3VGYve/205B
 f4DaJbRo/ieOcWiChTqHXk7dghQcyJkVM2n9KS6tIere2JbJY3oMNeJqZtJRmCvt/49ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:Yj6wvK0DDbCz5rkmINSE2gqjBL4kLtp133Aq2lEZdPRUGvb3qy
 nIpoV96faUskd0ZJhOo7C90cW7LU80lqQFhLX5X43SPzUO0VHAROoJgLcKqweQfREWndQ96U
 4PScdD4aXLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="75928194"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas.lengyel@intel.com>
Subject: [PATCH] x86/vpmu: Fix build following vmfork addition
Date: Tue, 26 Jul 2022 14:13:57 +0100
Message-ID: <20220726131357.13722-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

GCC complains:

  arch/x86/cpu/vpmu.c:351:15: error: conflicting types for 'vpmu_save_force'; have 'void(void *)' with implied 'nocf_check' attribute
    351 | void cf_check vpmu_save_force(void *arg)
        |               ^~~~~~~~~~~~~~~
  In file included from ./arch/x86/include/asm/domain.h:10,
                   from ./include/xen/domain.h:8,
                   from ./include/xen/sched.h:11,
                   from ./include/xen/event.h:12,
                   from arch/x86/cpu/vpmu.c:23:
  ./arch/x86/include/asm/vpmu.h:117:6: note: previous declaration of 'vpmu_save_force' with type 'void(void *)'
    117 | void vpmu_save_force(void *arg);
        |      ^~~~~~~~~~~~~~~

Adjust the declaraion.

Fixes: 755087eb9b10 ("xen/mem_sharing: support forks with active vPMU state")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/include/asm/vpmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index 8a3ae115623e..05e1fbfccfcf 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -114,7 +114,7 @@ void vpmu_do_interrupt(struct cpu_user_regs *regs);
 void vpmu_initialise(struct vcpu *v);
 void vpmu_destroy(struct vcpu *v);
 void vpmu_save(struct vcpu *v);
-void vpmu_save_force(void *arg);
+void cf_check vpmu_save_force(void *arg);
 int vpmu_load(struct vcpu *v, bool_t from_guest);
 void vpmu_dump(struct vcpu *v);
 
-- 
2.11.0


