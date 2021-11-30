Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1ED4640EC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 23:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235546.408602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msBFe-0006xQ-8V; Tue, 30 Nov 2021 22:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235546.408602; Tue, 30 Nov 2021 22:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msBFe-0006vF-4e; Tue, 30 Nov 2021 22:05:26 +0000
Received: by outflank-mailman (input) for mailman id 235546;
 Tue, 30 Nov 2021 22:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1msBFc-0006Ns-8T
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 22:05:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bfa2e5c-5229-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 23:05:23 +0100 (CET)
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
X-Inumbo-ID: 9bfa2e5c-5229-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638309923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NkPuMSX3r/ujI6gCVPCjBIaJRCROcysn6Lkkj2dT76U=;
  b=Ksnvfn+Va/8sgdhJRGFva6xYxiPlmupVOZxBKI2q9P7VIuxDtghZfE/b
   6rGZlR1CvazPqaoIdxYNs+sweLQwXraJMrWH9HD5Aw8WUubexnLkkWYM9
   4oydeWoIYQFiU8gTMo0xCdPh8iMRqVaAbbxMki9OR1P3UKr01jtdV2bEf
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eg/JkXseT3Qwu2qWHnh8WV/+Aajv9BwpI3pG4xevyJQ1hxzwdUTrH+uIKcOlbMntgXI4ES3qK+
 qnOmhZ9xKjpdfLzlvjmWEN/KrECotd66bIfOOtWbRiByGSSHmAoK4HCK9abz0nLK4DDOkqt8AE
 9uCKjKISekOBFnaL5OHwsjuqUwHmCIa5jw9E/U3rIuzofDY0wMiTJupldSgbuSfOgOFFN9uOBn
 ZugDY4qu0q3T49yHbDdWcfviGINvTGVsEu+c4agAJ/HwsvPpWhhMJiODJZu1o5c4VXbr4HANvW
 VbNR7XmDH3UYLAmfcW2Cmx91
X-SBRS: 5.1
X-MesageID: 58954803
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:y6p+raDdERQ4mRVW/+Xkw5YqxClBgxIJ4kV8jS/XYbTApDMi3zRVz
 DFMUDjTbKreYWekeo8iPou1/R9U7MOBx9ExQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540ko7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/pASumeAu+
 fF28t+UUQ4iD7XRtt8PXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjGZt2pAWRp4yY
 eI9NCh3LwqafSRfYHY7JbkjsuWTgSfGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiFG1mRgsBOt0KKp5zBmEwZvM/iiiFGdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8pDGJGT9bxgbQ+0RqmBN3CJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtAKsW4mdBo1b5tsldrVj
 Kn74lg5CHh7ZibCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDp+YxMI6b9+KYFjgYpPkeLEo
 iO0VkNCkQKtjnzbMwSaLHtkbeq3D5p4qHs6Ow0qPEqphCd/Mdr+sv9HestlZ6Qj+cxi0eVwE
 6sPdfKfD6kdUT/A4TkcM8Xw9dQwaBSxiAuSFCO5ezxjLYV4TgnE94a8LAvi/SUDFAStss46r
 +Hy3w/XW8NbFQ9jENzXeLSkyFbo5SoRn+d7Xk3pJNhPeRqzrNg2enKp1vJuepMCMxTOwDeex
 j26OxZAqLmfuZIx/fnImbuA89WjHdxhExcIBGLc97u3a3XXpzLx3Y9aXe+UVjnBT2eoqr66b
 OBYwvygYv0KmFFG79h1H7pxlP9s4tLuo/lRzxh+HWWNZFOuU+syLn6D1MhJl6tM2r4G5lfmB
 hPRooFXaeeTJcfoMF8NPw50PO2M2MYdliTW8flocl7x4zV6/ebfXEhfV/VWZPex8Feh3FsZ/
 Noc
IronPort-HdrOrdr: A9a23:BodlAK+9Qp+Q2Q6Wx7Vuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,277,1631592000"; 
   d="scan'208";a="58954803"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/3] x86/vPMU: Harden indirect branches
Date: Tue, 30 Nov 2021 22:05:02 +0000
Message-ID: <20211130220502.27624-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
References: <a0212d75-fc55-89c8-7ae2-c893c187ad82@suse.com>
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
---
 xen/arch/x86/cpu/vpmu_amd.c   | 2 +-
 xen/arch/x86/cpu/vpmu_intel.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 903fe1887ef0..e26f4f584e88 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -518,7 +518,7 @@ static int svm_vpmu_initialise(struct vcpu *v)
     return 0;
 }
 
-static const struct arch_vpmu_ops __initconstrel amd_vpmu_ops = {
+static struct arch_vpmu_ops __initdata_cf_clobber amd_vpmu_ops = {
     .initialise = svm_vpmu_initialise,
     .do_wrmsr = amd_vpmu_do_wrmsr,
     .do_rdmsr = amd_vpmu_do_rdmsr,
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 076882c615f4..98a93d1f3c41 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -880,7 +880,7 @@ static int vmx_vpmu_initialise(struct vcpu *v)
     return 0;
 }
 
-static const struct arch_vpmu_ops __initconstrel core2_vpmu_ops = {
+static struct arch_vpmu_ops __initdata_cf_clobber core2_vpmu_ops = {
     .initialise = vmx_vpmu_initialise,
     .do_wrmsr = core2_vpmu_do_wrmsr,
     .do_rdmsr = core2_vpmu_do_rdmsr,
-- 
2.11.0


