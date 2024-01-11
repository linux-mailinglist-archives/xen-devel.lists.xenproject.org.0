Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA2E82AB5D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 10:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666078.1036515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNrkQ-0001J0-KB; Thu, 11 Jan 2024 09:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666078.1036515; Thu, 11 Jan 2024 09:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNrkQ-0001GW-HZ; Thu, 11 Jan 2024 09:53:14 +0000
Received: by outflank-mailman (input) for mailman id 666078;
 Thu, 11 Jan 2024 09:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ESFV=IV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rNrkP-0001GQ-5P
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 09:53:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b4876b-b067-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 10:53:08 +0100 (CET)
Received: from BY3PR04CA0003.namprd04.prod.outlook.com (2603:10b6:a03:217::8)
 by SJ0PR12MB8614.namprd12.prod.outlook.com (2603:10b6:a03:47d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 09:53:02 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::c9) by BY3PR04CA0003.outlook.office365.com
 (2603:10b6:a03:217::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18 via Frontend
 Transport; Thu, 11 Jan 2024 09:53:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Thu, 11 Jan 2024 09:53:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 11 Jan
 2024 03:53:01 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 11 Jan 2024 03:52:59 -0600
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
X-Inumbo-ID: 38b4876b-b067-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEdJ+TdocBz5GmC9WwzNZ2Mi6Kp3ckRBlurLME5wXagFQf1gi+sb+HlW9qgtk7MuuuyfM3j+QhWlLLwQnRvegiuLrbfHdSdSWnsgzf+7Rz9rY4Qw3Hm3wwHm/EUlX8rCowh2rPa7QUGSMXnLqFcKiZimEBKSeGVYLSll6u/7wxjG6EdUrL0xq3l2WKYgCX1hr7JdpbIZ7oPnql12eAjG9EwQzK+Mep9b5x1+UXKaiLWn3jEGcrYmeE+XMV4v3SDrCEsz5sZQ3hrMc65JHE5sHFh7sYHJDSOo+u3V6uSMzK26MCqV9TwlPNPz+ckKwJDHrljjqwdMY7Uz48/sanx2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVzDmR+MQOaefvyu+uituOnKQ428yCq7W71q6U5pxzg=;
 b=idtY+js4po6v6lT3YS8QaxDtLh73CB+hdtuEJJ865MQMxooxMKsB9Wz/RoQmz7QCmv6QeVVQ7pFZkdOcQtJJOkpKPa6tdpB1YuPVPvyahvdxY59wUMGlxfXYT9bh1Itc+r4uARtCPi6YppOpEtGEwauuGV4VP1HGocT26NH9Q78/jXmoHqPMbLOzED6KDQ9AGdJf20Gj3sM1UhZi9uf2OG/6lGipoHtNLbLzbHHYrkUtRu/kgvZR4u9s6oGTiUcnsmD8FoR+EdB4XE2Tlu2jCno6QsUFD9uJiSD5Lyvleh8akLtBsgXsHuMRFvwNNddbwLRUkzNQGPKoq0rld04t6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVzDmR+MQOaefvyu+uituOnKQ428yCq7W71q6U5pxzg=;
 b=XsGYw4CjVR+zZE1xhlsj2te2PsLGVHCXOjG2mcbQtyX5g6vN3IurKFqwrJT8htT7n6ZSxrBP24cPk8fyx3tB5Xu1Ve9FbxVxq3Ff4Qh7PgLhQ7aZVF/jNBGtj+3/V/kWOCweqV8k3AGmMMMZS8gDaKxR8TA8dVDyvk4jBiHldqA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1ed510cd-d542-47c4-abac-45f395760c13@amd.com>
Date: Thu, 11 Jan 2024 10:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] limit passing around of cpu_user_regs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|SJ0PR12MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: 16546d5f-7342-414c-8dc9-08dc128b19de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	60Mtv9wT5k3Ydsu4sNf60+I+oKDQUzQlbjIU15cpWmlI6dQsWKrgjyfDQ2nx9QVzWtC72fRV6goMWKaojGzzyyNNfMUUqH5GeWeor3W2TykRC9z5zI1S4B1zWB1Ws971lPF1Fbu0Taxqdv5pYDtgcQQGR4W+cSu3QnuVNKX/5XikR1bBjhl2EDENd2x+YT4FxVYZQXXdFyEB375PcGhYuSgh26HdTgjNtcsn+sUHhjqHjcayc37SDRlabPSAPiB/SyWoA2Ed0FKzFv+6P8Eu/gXEymBiPYFNpuDR+6vRvcpNtSDJ4sWdUhDNIYMKi3BVlEchB+HVyiNZ1D5iWQPyKrTzoRwtNaILQdkMr8uZr4QOMeTCavIpNF8ALAqACdtgyxbVcIrvfXDRYyxEj9jzx3d0P0k2QOA2idHCEKTAKTo7SqBYYT9N8JIdUMnTxZdq5UQ/ZlT79+bjaSCvg2sZ0eA/ze/ODSldTnSI37S55cvG0knzcHWiIpqlQUPISPlOaVmmCEe2y1OvSuWkTc5Zz1RC9rtOhkQPaeAHzZ5tH3I47JNl83RnLgvx7fCYYAT36d3ChuqCU9ohaETkfymqY2LQnGySi9+SKbT82z4FkXmPAyLCZD6nAHuJBZCYq+ESbBnD/nz1gy9ETphDuWp2jDeQRu2Hipq/uqVA/0eI7Glxaqp1AVKKAIecYtyviggGaH7vHPLewi3k+11QMlhqazVZO+0A0UnRoo9ALaxG1PyI2ORnWja1uRMoMLGBbyKQ6IcudBK0aNVd1oTeuCvZMuUCmE5DECYUvglh2KR0oACEaS5XyJPUqr6er8ve6zef
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(47076005)(2616005)(70206006)(70586007)(41300700001)(31696002)(40480700001)(86362001)(31686004)(40460700003)(356005)(81166007)(4326008)(36756003)(26005)(82740400003)(110136005)(316002)(54906003)(16576012)(478600001)(336012)(426003)(5660300002)(53546011)(44832011)(8676002)(8936002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 09:53:02.1818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16546d5f-7342-414c-8dc9-08dc128b19de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8614



On 11/01/2024 08:31, Jan Beulich wrote:
> 
> 
> Unlike (synchronous) exception handlers, interrupt handlers don't normally
> have a need to know the outer context's register state. Similarly, the vast
> majority of key handlers has no need for such.
> 
> 1: keyhandler: don't pass cpu_user_regs around
> 2: IRQ: generalize [gs]et_irq_regs()
> 3: serial: drop serial_rx_fn's regs parameter
> 4: PV-shim: drop pv_console_rx()'s regs parameter
> 5: serial: drop serial_[rt]x_interrupt()'s regs parameter
> 6: IRQ: drop regs parameter from handler functions
FYI, I did a build test on Arm and there were 2 build errors. Fix below:

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index b5c84c51a20a..da011413c5c0 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -642,7 +642,7 @@ static void ipmmu_domain_irq(struct ipmmu_vmsa_domain *domain)
                         domain->d, status, iova);
 }
 
-static void ipmmu_irq(int irq, void *dev, struct cpu_user_regs *regs)
+static void ipmmu_irq(int irq, void *dev)
 {
     struct ipmmu_vmsa_device *mmu = dev;
     unsigned int i;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index f820c5500e08..c3ac6d17d1c8 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -929,7 +929,7 @@ static void arm_smmu_combined_irq_handler(int irq, void *dev)
 {
 	struct arm_smmu_device *smmu = dev;
 
-	arm_smmu_gerror_handler(irq, dev, regs);
+	arm_smmu_gerror_handler(irq, dev);
 
 	tasklet_schedule(&(smmu->combined_irq_tasklet));
 }


> 7: x86/vPMU: drop regs parameter from interrupt functions
> 8: x86/APIC: drop regs parameter from direct vector handler functions
> 
> Jan
> 

~Michal

