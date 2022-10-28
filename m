Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5D76111E3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 14:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432036.684726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooOoD-000307-7T; Fri, 28 Oct 2022 12:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432036.684726; Fri, 28 Oct 2022 12:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooOoD-0002yE-3t; Fri, 28 Oct 2022 12:50:01 +0000
Received: by outflank-mailman (input) for mailman id 432036;
 Fri, 28 Oct 2022 12:49:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ToJk=25=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ooOoB-0002xh-73
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 12:49:59 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05f727d6-56bf-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 14:49:57 +0200 (CEST)
Received: from BLAPR03CA0014.namprd03.prod.outlook.com (2603:10b6:208:32b::19)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 12:49:53 +0000
Received: from BL02EPF0000C407.namprd05.prod.outlook.com
 (2603:10b6:208:32b:cafe::30) by BLAPR03CA0014.outlook.office365.com
 (2603:10b6:208:32b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.29 via Frontend
 Transport; Fri, 28 Oct 2022 12:49:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C407.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 28 Oct 2022 12:49:52 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 07:49:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 05:49:46 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 28 Oct 2022 07:49:44 -0500
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
X-Inumbo-ID: 05f727d6-56bf-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMD3YJJfx4DdAA3SI2NCUFPbKgYlPPmDReq6y/MTP0rLaqJpvQ3uE8r/D9R2WngY4ak03BcfszYPxMfsrhze6uetoTgsVczuUbrCSB69hxbILMK9x1MCu/d8EKeV90b/VrUala5Z/fUAUzXGa9GiGdRvEXiMmNaDmtcMbOnaPyoL1UtmAlEUmXNBGjxycqsOf/yno/fczJVE7Gdxoxtd5rEKX3liJMohpFBrcXrOa9ldQQzKFVzBjbQh0Qv6ZTkvHeiudvYS2Tv99RL4U4ZZhb0dwhUM+Q+0AEr8Q9nC9uCtaOX4SG2OKuv+0j33DrftDTY/zJnKfsXzSg5hkUoZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRgEOTS1Rmgglb4+SH4FFiPgR6NU5Z4DYRT+gL0JZcA=;
 b=YSwU8EkmXfOfmbzPPA3cIolwhiOtJYqLtLKosiv8JvBXcnC+WJgRTT9BSJLZYa8LbjFRTFf8WqDjhvEuWb0jxXg9TDnU8fhgeHUUST3OBuBV3CGCNrvK9+LeSNYj9VD3V0UCsPeAogdLrw3hEKlUlvNiyVMel4rxm9MR2zvtCL19Hi9SnsDc+TBoznCybQnIIiMCVATsCi7b/XrqkhbtiJ/CHeeiYIWMeFbNExt/Bvg5yp4IlWVVVZcIpbP+Kph2ODg51nKmnxbHcrogSeoBv0ZqO4lBxghjueLxq79jR1zrAfhak3eVpYhaHFlO//+hQcHyQZzkVyI6eH35AMVWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRgEOTS1Rmgglb4+SH4FFiPgR6NU5Z4DYRT+gL0JZcA=;
 b=BXnosmD6+Ryarey/82vSM3Ki8WhyEm9LZHxsnPO4LmoJL8miq1Qg2tY52ntSUY/kFlPesoTyJOCH2Zm5wO8R9eqbI+XkJvFWi9MqwFEAO5QuaHvlzjXFMY6SedhBSHAD+lmX6vB5UB/9NV4zZ58A2KTZwllc+eXiRJANt0H5cqc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Do not route NS phys timer IRQ to Xen
Date: Fri, 28 Oct 2022 14:49:37 +0200
Message-ID: <20221028124937.27677-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C407:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 765ff581-ba31-43b9-ccbc-08dab8e2e840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XT6ITHF9kZbGL//bFDa9JaYcVK9XRoSy9HqxyabqWKRqqs7jZsxb1N1LmnGi3Z/D4bYyn6q9CWAwZmMEG+Y2/amgF0J6KsWxQ3WPumVZn8l32nL+Do7pp/ffciBwtxGoY4ncHZQ1YaZ91l/ujymz4KJAYESeOXJfnQCm7xuhYVPEHOcm4Lydhan3TZmUPLvd9Drkq4M6PRhd7zn8+te3++N4Am8JopMR53qd0ZTcyTVamNWorgtK5k8oYdfYV0fnLUDhgSCJVCRTh3+Vn0Bbj+mYr14CI3eGTjEsGofzupDlukUCef1X+YruQTwQ98F9Dmmjq/gZ342UIYqf+AafuhbgbYGluc2jWe6mUDeXWATUtJ9H21KcNVc3p07Oz+9WkrraQiw6Ip+svf9lDPd8nTLbqZfkDOgQ5vceRHqKOueT3tm93UjIlHD7jhNdE7WWMlseirVAGyt8+hAT+jmOyQ2tGA1G7ybEI8PZ6ylGboIobz4RElkl6SKRXiQfPPzrHcKGDVBQFdq+bpJyx/WqMBjYfQ3+vV7RAnUolzBnEkO2ZizMuck69J2Dpt00p4UniKF0of/t4Ooe7LdYwqsAbVYJ29AqcxqlorvgEWxH8WsURXZTbgmCMr4ac82/7e2AK2o5FMgrBSmHGsVHp6/H673Dz2TB4khR0k/4VuFxgv6YcfHw8NR4gKIdkJIpho4gxiZeN3hIRg2Ec/HEiZR/mKh566PJKSYZ0A8/E82NVlu8fZfPQhvLZVv4BLd1shTFQhrLPT65wo6FjlWzs/JpycDfAJdSy/bL1GkOoQddi2gd6f2We+IG7LtPwW4lZzncDZRsvZ1iPve+4/NDuTNS8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(36756003)(83380400001)(44832011)(2616005)(47076005)(426003)(356005)(82740400003)(966005)(186003)(8936002)(81166007)(478600001)(336012)(86362001)(40460700003)(41300700001)(1076003)(70206006)(70586007)(2906002)(4326008)(5660300002)(8676002)(40480700001)(36860700001)(6916009)(54906003)(26005)(316002)(82310400005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 12:49:52.4558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 765ff581-ba31-43b9-ccbc-08dab8e2e840
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C407.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580

At the moment, we route NS phys timer IRQ to Xen even though it does not
make use of this timer. Xen uses hypervisor timer for itself and the
physical timer is fully emulated, hence there is nothing that can trigger
such IRQ. This means that requesting/releasing IRQ ends up as a deadcode
as it has no impact on the functional behavior, whereas the code within
a handler ends up being unreachable. This is a left over from the early
days when the CNTHP IRQ was buggy on the HW model used for testing and we
had to use the CNTP instead.

Remove the calls to {request/release}_irq for this timer as well as the
code within the handler. Since timer_interrupt handler is now only used
by the CNTHP, refactor it as follows:
 - rename it to htimer_interrupt to reflect its purpose,
 - remove the IRQ affiliation test,
 - invert the condition to avoid indented code and use unlikely,
 - improve readability by adding new lines \btw code and comments.

Keep the calls to zero the CNTP_CTL_EL0 register for sanity and also
remove the corresponding perf counter definition.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - take the opportunity to rename the handler, modify the condition to
   avoid the indented code and improve readability.

Based on the outcome of the following discussion:
https://lore.kernel.org/xen-devel/d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com/
---
 xen/arch/arm/include/asm/perfc_defn.h |  1 -
 xen/arch/arm/time.c                   | 34 +++++++++------------------
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
index 31f071222b24..3ab0391175d7 100644
--- a/xen/arch/arm/include/asm/perfc_defn.h
+++ b/xen/arch/arm/include/asm/perfc_defn.h
@@ -70,7 +70,6 @@ PERFCOUNTER(spis,                 "#SPIs")
 PERFCOUNTER(guest_irqs,           "#GUEST-IRQS")
 
 PERFCOUNTER(hyp_timer_irqs,   "Hypervisor timer interrupts")
-PERFCOUNTER(phys_timer_irqs,  "Physical timer interrupts")
 PERFCOUNTER(virt_timer_irqs,  "Virtual timer interrupts")
 PERFCOUNTER(maintenance_irqs, "Maintenance interrupts")
 
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index dec53b5f7d53..0054cf2b7b78 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -220,27 +220,18 @@ int reprogram_timer(s_time_t timeout)
 }
 
 /* Handle the firing timer */
-static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
+static void htimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
 {
-    if ( irq == (timer_irq[TIMER_HYP_PPI]) &&
-         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
-    {
-        perfc_incr(hyp_timer_irqs);
-        /* Signal the generic timer code to do its work */
-        raise_softirq(TIMER_SOFTIRQ);
-        /* Disable the timer to avoid more interrupts */
-        WRITE_SYSREG(0, CNTHP_CTL_EL2);
-    }
+    if ( unlikely(!(READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING)) )
+        return;
 
-    if ( irq == (timer_irq[TIMER_PHYS_NONSECURE_PPI]) &&
-         READ_SYSREG(CNTP_CTL_EL0) & CNTx_CTL_PENDING )
-    {
-        perfc_incr(phys_timer_irqs);
-        /* Signal the generic timer code to do its work */
-        raise_softirq(TIMER_SOFTIRQ);
-        /* Disable the timer to avoid more interrupts */
-        WRITE_SYSREG(0, CNTP_CTL_EL0);
-    }
+    perfc_incr(hyp_timer_irqs);
+
+    /* Signal the generic timer code to do its work */
+    raise_softirq(TIMER_SOFTIRQ);
+
+    /* Disable the timer to avoid more interrupts */
+    WRITE_SYSREG(0, CNTHP_CTL_EL2);
 }
 
 static void vtimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
@@ -302,12 +293,10 @@ void init_timer_interrupt(void)
     WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
     isb();
 
-    request_irq(timer_irq[TIMER_HYP_PPI], 0, timer_interrupt,
+    request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
                 "hyptimer", NULL);
     request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
                    "virtimer", NULL);
-    request_irq(timer_irq[TIMER_PHYS_NONSECURE_PPI], 0, timer_interrupt,
-                "phytimer", NULL);
 
     check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
     check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");
@@ -326,7 +315,6 @@ static void deinit_timer_interrupt(void)
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
     release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
-    release_irq(timer_irq[TIMER_PHYS_NONSECURE_PPI], NULL);
 }
 
 /* Wait a set number of microseconds */
-- 
2.25.1


