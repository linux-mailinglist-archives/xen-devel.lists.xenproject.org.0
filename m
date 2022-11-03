Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3486180AB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 16:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436626.690723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqbpq-0000QN-6m; Thu, 03 Nov 2022 15:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436626.690723; Thu, 03 Nov 2022 15:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqbpq-0000Nk-44; Thu, 03 Nov 2022 15:08:50 +0000
Received: by outflank-mailman (input) for mailman id 436626;
 Thu, 03 Nov 2022 15:08:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeB9=3D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oqbpo-0000Ne-Bi
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 15:08:48 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69120864-5b89-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 16:08:46 +0100 (CET)
Received: from DM6PR04CA0021.namprd04.prod.outlook.com (2603:10b6:5:334::26)
 by PH8PR12MB7349.namprd12.prod.outlook.com (2603:10b6:510:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 15:08:40 +0000
Received: from DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::95) by DM6PR04CA0021.outlook.office365.com
 (2603:10b6:5:334::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 15:08:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT100.mail.protection.outlook.com (10.13.172.247) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 15:08:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 10:08:37 -0500
Received: from [10.71.192.110] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Thu, 3 Nov 2022 10:08:35 -0500
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
X-Inumbo-ID: 69120864-5b89-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8Z/iLNNNOzm4QG9eC+AePu4GET5M5OBqvGrMJmQ2WOqV/pzZb5PjUgtxpDAbF6kNUD6k5JvLtaLfapu7KthjpdEeSGOWzsBnWohKNdkyDlp6GzKTEJMBGYEoj4gXKMULt6EMhNla32lx57zBVab7YQWin+9gaDRed7daQYeY+9qamvKc1RTeyHS0qRJJoxMYmN0B71OLVIT+kv4FEJv53TDY5imNkdo7sVuc2vla8QLzIjs4b6bQriSbyTDVh4Ylku/bXarnm26ntp3VdKj9B5VkPEnyv4FwJRnRRGElOXQJQfzptMSCd7lC1IeS9dxzpkBL6Qh5xGAiqBB0/wQng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUamV8ns79Uz6qy1FNonxnhqJWgCwThEMbkZfgiAeFU=;
 b=lUDh187gMpSlO8uR5Mp/6sqKrAouITPA7aXU31ymMRLavU1VrotaHsxwAAWoTuq6LpkzfVMussfeZjII376vdQrFVIb17fUGyteQCuUjdH/UGMZGvJJ1Y0CyNYxfZvR3boD56PDgjVX2IHbPWa1hHx4w3qyKiD4hlszyuFS8M6Xos7AGQNIUG6W8QXmO+qrKhGbasXh8rOF5wbBDEFCluzJBZcHS3zLiYr6Bt3vQy9l5hg1F0iKsokzwzqNBmJoHVYxtyriSG+dO7lh93tTLfhPQb6Omg3FA1yFoT/26I+8OtOMGRx7e5O/WE1Ov1/C1zktvn/Ln5wSVva0WHuS3/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUamV8ns79Uz6qy1FNonxnhqJWgCwThEMbkZfgiAeFU=;
 b=TrufrXPs+g0Cy/H46qXB3O8XxqDxgVtmbmQ9vpVCzLBnOLig84GOssOKgK/yIAx+0QEcNhd9D2cQqq2NINIqbyoG9VosESLMrdA4Rn+q9tlIyva+q6RISTATOspK+OJL8CEeA7eHNjywi2kU5+7z7bOPbQGByj2Kwd7ltIznpJk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <dfdc0cfa-70ee-d591-bbb4-1b8426bafaab@amd.com>
Date: Thu, 3 Nov 2022 16:08:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN v2 09/12] xen/Arm: GICv3: Define GIC registers for AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-10-ayankuma@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221031151326.22634-10-ayankuma@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT100:EE_|PH8PR12MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 60dc4a5c-2d1f-4d35-a1ba-08dabdad4a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+cevpXBz4iEKL8ssCTvKYaBeINlUHUhnQ74DKwPMrBDqcOq+loma0Tw69FBw5GV84lj4TDN1QPwW/wQRHcEMWe5tVQ5x+uh9s/GU4EDP4GXzf66DM37eIjtu9x0wilqCfQtvOFBJQjvIbOn+McgwmRrO28d6uGHF4RZlMQ0wvS7SIxhT0cEv1FIDIk9Y0iLTqkVTkNp3JIZ+F2Tam9FGay0svCjFO+Zbw2z2y0mlKgaTwJBBJNpJd0lqjNF6/Mmf/aMXOWu4mSdiE3MuGZi5fmWy+C+7n/Cb2hhP6mL4GgMnLVbL8qZHjYJBoFpT0ZwFejlgm90aSNoFigQgnzj/OkOOOfSy6fxQHTK6mBvtebfmc6UA62XrSybXlwj/xRIs+O6qCwguAQkOptiqhH0VRNssl1jHBai24l2XS14jScTBqkeQKmUQUZNCJ6D06Vmhf7IfcH1kNM8pFxXzhycW4mOywzrdrXI5kuhbiLdDGqlfTcLh5M0dc5V7DDVdBuTIZFVrVadJt0/U/iSy4Pu+q7DSEolUQNt8xlKtCsYBgo9mohIHU4e9Pwzsw5XFdK1uz0NSIF+2pGAbqB8AV2svB2Whg5VfEyYbVkJPTcv+yBsjLgccDCrTsIGN5cpw/KkSKhU/9DHsYnuE150yaHT7+5FP3AceeFQCsXUzcHMrM9Lvj98BtgdNr6SOPOeeXoljGCBE27HmRuvjO9S/dcpEg5cHN2pHlhGDLf7Ln7ODROwKspP0leJttNoYHuzVauMZUAQn7kZp+dCwlfQ01MhyCg6MMRoFfZYc2fIZ5lz+yjyIzfjxdckGTyVD3X3E1HjhzP9XhZ54nyyUd8P5RVQXag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(70206006)(36860700001)(40460700003)(2906002)(426003)(478600001)(54906003)(53546011)(41300700001)(16576012)(26005)(110136005)(8676002)(4326008)(40480700001)(186003)(70586007)(8936002)(336012)(47076005)(83380400001)(31686004)(31696002)(316002)(2616005)(5660300002)(82310400005)(356005)(86362001)(81166007)(44832011)(36756003)(82740400003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 15:08:39.4243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60dc4a5c-2d1f-4d35-a1ba-08dabdad4a02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7349

Hi Ayan,

On 31/10/2022 16:13, Ayan Kumar Halder wrote:
> 
The title is a bit ambiguous given that the previous patches were also defining GIC registers.
Maybe adding "remaining" would result in a better commit title.

> 
> Refer "Arm IHI 0069H ID020922"
> 12.5.23 ICC_SGI1R, Interrupt Controller Software Generated Interrupt
> Group 1 Register
> 12.5.12 ICC_HSRE, Interrupt Controller Hyp System Register Enable register
> 12.7.10 ICH_VTR, Interrupt Controller VGIC Type Register
> 12.7.5 ICH_HCR, Interrupt Controller Hyp Control Register
> 12.5.20 ICC_PMR, Interrupt Controller Interrupt Priority Mask Register
> 12.5.24 ICC_SRE, Interrupt Controller System Register Enable register
> 12.5.7 ICC_DIR, Interrupt Controller Deactivate Interrupt Register
> 12.5.9 ICC_EOIR1, Interrupt Controller End Of Interrupt Register 1
> 12.5.14 ICC_IAR1, Interrupt Controller Interrupt Acknowledge Register 1
> 12.5.5 ICC_BPR1, Interrupt Controller Binary Point Register 1
> 12.5.6 ICC_CTLR, Interrupt Controller Control Register
> 12.5.16 ICC_IGRPEN1, Interrupt Controller Interrupt Group 1 Enable register
> 12.7.9 ICH_VMCR, Interrupt Controller Virtual Machine Control Register
> 
As said in the previous patches: this may be my personal opinion but sth like this would be easier to read:
"
Define missing assembly aliases for GIC registers on arm32, taking the ones
defined already for arm64 as a base. Aliases are defined according to the
GIC Architecture Specification ARM IHI 0069H.
"
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Moved coproc regs definition to asm/cpregs.h
> 
>  xen/arch/arm/include/asm/cpregs.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index bfabee0bc3..62b63f4cef 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -415,6 +415,22 @@
>  #define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
>  #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>  #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
> +
> +#define ICC_SGI1R_EL1             p15,0,c12
> +
> +#define ICC_SRE_EL2               p15,4,c12,c9,5
> +#define ICH_VTR_EL2               p15,4,c12,c11,1
> +#define ICH_HCR_EL2               p15,4,c12,c11,0
> +
> +#define ICC_PMR_EL1               p15,0,c4,c6,0
> +#define ICC_SRE_EL1               p15,0,c12,c12,5
> +#define ICC_DIR_EL1               p15,0,c12,c11,1
> +#define ICC_EOIR1_EL1             p15,0,c12,c12,1
> +#define ICC_IAR1_EL1              p15,0,c12,c12,0
> +#define ICC_BPR1_EL1              p15,0,c12,c12,3
> +#define ICC_CTLR_EL1              p15,0,c12,c12,4
> +#define ICC_IGRPEN1_EL1           p15,0,c12,c12,7
> +#define ICH_VMCR_EL2              p15,4,c12,c11,7
I did not check this in previous patches but in which order are you defining these registers?
I took a look at arm64/sysregs.h and these regs are placed in assembly aliases name order.
So for instance ICC_PMR_EL1 would be defined before ICC_SRE_EL2, etc.

Also, I cannot see some regs like MISR, EISR that are defined for arm64. Did you decide not to define them
for arm32 because they are not used by Xen?

~Michal

