Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD6E610BC0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 09:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431527.684362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooKEa-0007se-Vg; Fri, 28 Oct 2022 07:56:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431527.684362; Fri, 28 Oct 2022 07:56:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooKEa-0007pz-Sg; Fri, 28 Oct 2022 07:56:56 +0000
Received: by outflank-mailman (input) for mailman id 431527;
 Fri, 28 Oct 2022 07:56:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ToJk=25=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ooKEZ-0007pj-G9
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 07:56:55 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 156bc132-5696-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 09:56:53 +0200 (CEST)
Received: from MW4PR03CA0058.namprd03.prod.outlook.com (2603:10b6:303:8e::33)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 07:56:47 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::88) by MW4PR03CA0058.outlook.office365.com
 (2603:10b6:303:8e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Fri, 28 Oct 2022 07:56:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 07:56:45 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 02:56:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 00:56:45 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 28 Oct 2022 02:56:43 -0500
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
X-Inumbo-ID: 156bc132-5696-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+HlRMoj1jel+9LmkrPf5qA3D/Y+VKFuGeAai+D9BfDsY9DbY8+creOFsFPGxMMv/e/KJ8zcn9A8ORYiad4RKfy/cIEyvCAdRO3tMzItoJrqOEypWmtso82mjdUvs8YxRo6pddaXDfRucQXTrQXR7HHjq6GNYB8ZC9uR/NPiAWPachxgeH43DuwBTdp2qEHgET3gbmwlxJxPz7+fnUdoDdWKLjeY7QNcTdjRhM6ozk4AWpdhzF8rkWhA/UJGJKdaEtI3t36M7EBUiWopeedFKrgy2nf4hCFRHjpH7Rpmxtqm9XR68XBPw4ROGg/SGY9DOdYVL+L9SR4Rj6D7WuAabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wutamKw3Z7Q+Eb/ceHGMavXxD6AMVnBkePAKZWrFltM=;
 b=SMFAnIR9Wx1nukn99obgPTUquMwePHjEkTBoTxBq+BdxqRkB+cvpv+wL0Mq/hHOTe+qqzbTY4B03rbPY/M+TtcpeQcWkaJvMk3aoVrWl0pxN/PHDcgxZnernaX4Nnf2/q/bCxBZD5QfDd6X6GcRG/jIo3ypxfHRuRNJsBmaJmBdO6e80r47jegejhSqYYutkCvwYn5UtCgGW6nnqPrkB194d3GrIBxl+f3WlIygpEQYN+FZQMU7A2ZH20mQAgHp86p5kEkm+f53pBWzNxpjbNI7b6JGMpU0ZUeN9kHhM/AfVIjZDuyEiOTfAqlYQNa9/GHaO8sDOyN66ii9g0pta6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wutamKw3Z7Q+Eb/ceHGMavXxD6AMVnBkePAKZWrFltM=;
 b=dU0Xiwq8yPtSXaqk8sTsHFWpUvARpCS0genpJFDA0m3XbOIMVMIaumUWViDUKUxOqpYcw/lnNs6PA3zhbKGLbcoGUTK5omvFjzcoVeI9RP2+KNLtj7d5HyJipSGgkCFNjPBcXQlxHunK1+8Ynj7SE/L67884XUH+fte0rDhGqdQ=
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
Subject: [PATCH] xen/arm: Do not route NS phys timer IRQ to Xen
Date: Fri, 28 Oct 2022 09:56:30 +0200
Message-ID: <20221028075630.32261-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT106:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: c11ebadc-10f4-4542-4d80-08dab8b9f5de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lzEr5mg7urmT99AKQ6boJr3h0zCqzmZJu3Im4awNKd8OQrKNtENljsFn5g15GbyrR6jdGV+cyrpHW1zaGnuokudICvyNQZNuSRtWs0R95EnRiaBBHv1UCwepeIRRbX1y6gY7JRgO0SQDtL9wYfU1yYsq3bhI8WAmD8+S5bqTx8e9OVKT24l0rU6W+z9A9lV0tYK9yU3YeF/zXMuLs6ScbBmpsAL6pOJA8urcwS8Ph5Wf5Njo5xwAOkHuF63y2p0fW+oA4LyuV5L7urHvHrDTcR9XdivrPymoiAe8s/QcYW7VQfSzJpykijbtQo4Prnz1GqH57AFXbnimTRkiiF8rY2AeKoPXr+Da9jmoEmW8WP4CK22OVRooeKLkeJ1ME8d2rMB7+uTxyymw2DTtCDkW+sNDKEPBvxw5ZIgpsn4pKaOLVjPVq6YLKxfOYgM3tf4CM+RVi3kXLTEVvWQqmAs+Vn9A5IgUysW/lfbXm8PKK5xG5/EJDe4x7uHv3zetNWn5rdFGXoSCu4T0xs71IlFy6ZJo2F5Bzl0JUqbandT5pITdgEVugZvCcm4C/ePQA8F+giyjpjVPs+iQnF6VE52ri7MyjPpgxEcsGld5npAt1/Lo4BbQP72hj98e2CZeNmAFGuYPeA29MITcFjtVhw8MgylLBvY+lb98/CKq6REpREEnobxN3CZI51u/KQcoJxVWwTMo+ZkotdzKiBzxuvX7Zat/h28aKe2N4of+OtYuB1NZk+7y4Gu37nBGdYSgfL3HLlnNij+NzxcKlYMM/bfjrhFMXSBm+GtiTdv5q7uEQ9uT14H3DLGKMUlqePRlpG3xKM9iYbdxzWZNzHaER2xhUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(41300700001)(8936002)(5660300002)(83380400001)(70586007)(70206006)(2906002)(8676002)(966005)(36860700001)(6916009)(82310400005)(6666004)(316002)(26005)(4326008)(478600001)(47076005)(36756003)(426003)(54906003)(44832011)(40480700001)(1076003)(356005)(186003)(81166007)(40460700003)(82740400003)(86362001)(336012)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 07:56:45.8231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c11ebadc-10f4-4542-4d80-08dab8b9f5de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728

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
by the CNTHP, remove the IRQ affiliation condition. Keep the calls to
zero the CNTP_CTL_EL0 register on timer init/deinit for sanity and also remove
the corresponding perf counter definition.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Based on the outcome of the following discussion:
https://lore.kernel.org/xen-devel/d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com/
---
 xen/arch/arm/include/asm/perfc_defn.h |  1 -
 xen/arch/arm/time.c                   | 16 +---------------
 2 files changed, 1 insertion(+), 16 deletions(-)

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
index dec53b5f7d53..3160fcc7b440 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -222,8 +222,7 @@ int reprogram_timer(s_time_t timeout)
 /* Handle the firing timer */
 static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
 {
-    if ( irq == (timer_irq[TIMER_HYP_PPI]) &&
-         READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
+    if ( READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING )
     {
         perfc_incr(hyp_timer_irqs);
         /* Signal the generic timer code to do its work */
@@ -231,16 +230,6 @@ static void timer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
         /* Disable the timer to avoid more interrupts */
         WRITE_SYSREG(0, CNTHP_CTL_EL2);
     }
-
-    if ( irq == (timer_irq[TIMER_PHYS_NONSECURE_PPI]) &&
-         READ_SYSREG(CNTP_CTL_EL0) & CNTx_CTL_PENDING )
-    {
-        perfc_incr(phys_timer_irqs);
-        /* Signal the generic timer code to do its work */
-        raise_softirq(TIMER_SOFTIRQ);
-        /* Disable the timer to avoid more interrupts */
-        WRITE_SYSREG(0, CNTP_CTL_EL0);
-    }
 }
 
 static void vtimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
@@ -306,8 +295,6 @@ void init_timer_interrupt(void)
                 "hyptimer", NULL);
     request_irq(timer_irq[TIMER_VIRT_PPI], 0, vtimer_interrupt,
                    "virtimer", NULL);
-    request_irq(timer_irq[TIMER_PHYS_NONSECURE_PPI], 0, timer_interrupt,
-                "phytimer", NULL);
 
     check_timer_irq_cfg(timer_irq[TIMER_HYP_PPI], "hypervisor");
     check_timer_irq_cfg(timer_irq[TIMER_VIRT_PPI], "virtual");
@@ -326,7 +313,6 @@ static void deinit_timer_interrupt(void)
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
     release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
-    release_irq(timer_irq[TIMER_PHYS_NONSECURE_PPI], NULL);
 }
 
 /* Wait a set number of microseconds */
-- 
2.25.1


