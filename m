Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82C64B3D5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460496.718414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53B1-0005Xe-Ut; Tue, 13 Dec 2022 11:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460496.718414; Tue, 13 Dec 2022 11:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53B1-0005Uj-Rt; Tue, 13 Dec 2022 11:10:23 +0000
Received: by outflank-mailman (input) for mailman id 460496;
 Tue, 13 Dec 2022 11:10:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nvb8=4L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p53Az-0005Ud-MJ
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:10:21 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bab5f656-7ad6-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 12:10:20 +0100 (CET)
Received: from CY5PR20CA0026.namprd20.prod.outlook.com (2603:10b6:930:3::23)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 11:10:17 +0000
Received: from CY4PEPF0000C979.namprd02.prod.outlook.com
 (2603:10b6:930:3:cafe::c1) by CY5PR20CA0026.outlook.office365.com
 (2603:10b6:930:3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Tue, 13 Dec 2022 11:10:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C979.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.10 via Frontend Transport; Tue, 13 Dec 2022 11:10:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 05:10:15 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 05:10:13 -0600
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
X-Inumbo-ID: bab5f656-7ad6-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNxF1HBVU3Fbs8S7BsUMXH1xP1iMkTNxm2n/9fdQp2Cwj4s4xBxar2O3JDgK4QgPdduvCINYWqdTUoB7gp3IeDxqSGiNavW8celu6lwASu6qj158Gqu45CJo+w3HUuPVB3rMFG6hrCdGusLU4zuLbRMTZQu529jR2xzqYvrQrD69x1k88ScA+JZvVYZRWFA4CezwCPQnLAfVFysC6O2q35d220B4PfH5WFlzoBEO7GiV7mBwSKVOaBjyBWSFu3JTZ3ZWaLq8XTmJqAYjxUVVKiKDThhc1A95ZzOAHo0TFDTkG9XT4KNyhW4eB6Og0eY6r/ZaPtccny6U8BUSWJDatg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epaaIeIAwGR88f0Enbm1nLUuuorgoZwBW9q2x7pQILY=;
 b=cdQLA/3qtulT59cvST81ZVwyttVFJwjDOplzdDkMx0qRvUP3+pyu1MIm1opjK9+D1Ek89PKXRADEBDxKxfBXei6dNmRd4dRyr/PyNRaTBbFVt76GfQLyKXIqL5mlCq3WtCToIYNrg0GtdehNnDZQW8P54ww0TnfTuReF4VHRV7IU58m9TGU6/XyVMiF657fiYLJNvxZ3LXrwQT8l/ncRWI15Cv717c2WAwNaClyVTlZjj1OpRLgMGAFpUC7r4VFGCbZPMvIlujeTEDu511xNrwn/MVYb4G86gqAd0Z7rpgPAXLUk8r5sE/j8Z0w9tW8HJGOYx8kOH1mcFV0/dL9a4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epaaIeIAwGR88f0Enbm1nLUuuorgoZwBW9q2x7pQILY=;
 b=T0tIDybR0eOB1FToQBDEYAwGR3fVM+Q2Vz+g+h+T3NnMNOMlE4ptGin0qeEq4tGrHWkoY5iK/mRDMlt+kzrgX/7VH4Mg3rTgHrNg89ufa27Z20cA9fEuMtrwrFoClAWQp6WMNGqvDsrl1ztipHlMo7ig3IwhiGcWlY2UUo2cPyY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <c88c2c9d-61e8-205d-3117-74c01c144936@amd.com>
Date: Tue, 13 Dec 2022 12:10:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 06/18] xen/arm32: head: Replace "ldr rX, =<label>" with
 "mov_w rX, <label>"
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221212095523.52683-1-julien@xen.org>
 <20221212095523.52683-7-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221212095523.52683-7-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C979:EE_|SA0PR12MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b01a2f3-76c1-4733-63a1-08dadcfa9d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jRwiQsEppS6ei+8Mb05vL/ItnOAC7C0jWGEpC3FmkVY2sNRCvoivj31GJgIzkNyDX8AdfDcd76I07TTTDfa/u7cEZsW86H4TFf+9BLymZdWSpF7somlvBCAx3A8lD8Q8Vl6xwSD69oeAzP7+FktB1RL43HRTKXo42sUMnrjwEpL2L3YO2OQZzEB9YeZu/EFll/2m2Ye5usLqk0zESvBcJfGoqYoTBwVMaxBpDqLlxzvfmj2H938boBqhZZAbl0SNyYBnznsljpHO0JC9qWnL2nnmVw4AnvusliGpBadpc1l8qq8RNQ/Nk7JusmYLh9BBZHdmYB75mP2MVgEigCCCEokDvR3Z/nVXI98ahlNnOFpwWIYhq0bsQZMTdt8KOGqCW4L3ls9b1Ks4nvF0VEx9tpS7bN+KWjBa05gFLZkpj2Gp4dKG8ktlIBAT9kRdsFOhtigGvoDjIn5iL14TNgxm5PQoElIrc5nbps8gadeDWbvpcuL0t+G7gxVZZnrtqn800d31KXnLBV0CDmJyXo93RgWtdbFbmaI2XNrQWfZhEaDVTGxZ6zJ62RSQQLRnNlsxa3+81QFToAFImr3RR4RrQZeaeKihL7lvMg70IIU1sttIlvu6VpMsJmwJ6nTbhUpIGS38ahdZfUp/KgbXcVo4Yhj3L14bilWluOrO88CanpOasq/zR8Hzu/DmdR1RT4bDOS8enodDG1NAmacHTGdrW22hDy2dR8fZsWwh+6FT0JVBg00QQDj3zUfa4QOtXzjRvuiJQYbrIOe5j6a2BKpjbx2SQ8oluZ/r9LtOkv4hjQc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(336012)(47076005)(478600001)(186003)(426003)(53546011)(81166007)(356005)(36860700001)(83380400001)(2616005)(26005)(82310400005)(40480700001)(8676002)(70586007)(41300700001)(4326008)(316002)(44832011)(54906003)(70206006)(2906002)(110136005)(16576012)(5660300002)(8936002)(40460700003)(82740400003)(31686004)(86362001)(31696002)(36756003)(21314003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:10:16.9328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b01a2f3-76c1-4733-63a1-08dadcfa9d9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C979.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398

Hi Julien,

On 12/12/2022 10:55, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> "ldr rX, =<label>" is used to load a value from the literal pool. This
> implies a memory access.
> 
> This can be avoided by using the macro mov_w which encode the value in
> the immediate of two instructions.
> 
> So replace all "ldr rX, =<label>" with "mov_w rX, <label>".
> 
> No functional changes intended.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

with one small change.

> 
> ---
> 
>     Changes in v3:
>         * Patch added
> ---
>  xen/arch/arm/arm32/head.S | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index a558c2a6876e..ce680be91be1 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -62,7 +62,7 @@
>  .endm
> 
>  .macro load_paddr rb, sym
> -        ldr   \rb, =\sym
> +        mov_w \rb, \sym
>          add   \rb, \rb, r10
>  .endm
> 
> @@ -149,7 +149,7 @@ past_zImage:
>          mov   r8, r2                 /* r8 := DTB base address */
> 
>          /* Find out where we are */
> -        ldr   r0, =start
> +        mov_w r0, start
>          adr   r9, start              /* r9  := paddr (start) */
>          sub   r10, r9, r0            /* r10 := phys-offset */
> 
> @@ -170,7 +170,7 @@ past_zImage:
>          bl    enable_mmu
> 
>          /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   r0, =primary_switched
> +        mov_w r0, primary_switched
>          mov   pc, r0
>  primary_switched:
>          /*
> @@ -190,7 +190,7 @@ primary_switched:
>          /* Setup the arguments for start_xen and jump to C world */
>          mov   r0, r10                /* r0 := Physical offset */
>          mov   r1, r8                 /* r1 := paddr(FDT) */
> -        ldr   r2, =start_xen
> +        mov_w r2, start_xen
>          b     launch
>  ENDPROC(start)
> 
> @@ -198,7 +198,7 @@ GLOBAL(init_secondary)
>          cpsid aif                    /* Disable all interrupts */
> 
>          /* Find out where we are */
> -        ldr   r0, =start
> +        mov_w r0, start
>          adr   r9, start              /* r9  := paddr (start) */
>          sub   r10, r9, r0            /* r10 := phys-offset */
> 
> @@ -227,7 +227,7 @@ GLOBAL(init_secondary)
> 
> 
>          /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   r0, =secondary_switched
> +        mov_w r0, secondary_switched
>          mov   pc, r0
>  secondary_switched:
>          /*
> @@ -236,7 +236,7 @@ secondary_switched:
>           *
>           * XXX: This is not compliant with the Arm Arm.
>           */
> -        ldr   r4, =init_ttbr         /* VA of HTTBR value stashed by CPU 0 */
> +        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
>          ldrd  r4, r5, [r4]           /* Actual value */
>          dsb
>          mcrr  CP64(r4, r5, HTTBR)
> @@ -254,7 +254,7 @@ secondary_switched:
>  #endif
>          PRINT("- Ready -\r\n")
>          /* Jump to C world */
> -        ldr   r2, =start_secondary
> +        mov_w r2, start_secondary
>          b     launch
>  ENDPROC(init_secondary)
> 
> @@ -297,8 +297,8 @@ ENDPROC(check_cpu_mode)
>   */
>  zero_bss:
>          PRINT("- Zero BSS -\r\n")
> -        ldr   r0, =__bss_start       /* r0 := vaddr(__bss_start) */
> -        ldr   r1, =__bss_end         /* r1 := vaddr(__bss_start) */
> +        mov_w r0, __bss_start        /* r0 := vaddr(__bss_start) */
> +        mov_w r1, __bss_end          /* r1 := vaddr(__bss_start) */
> 
>          mov   r2, #0
>  1:      str   r2, [r0], #4
> @@ -330,8 +330,8 @@ cpu_init:
> 
>  cpu_init_done:
>          /* Set up memory attribute type tables */
> -        ldr   r0, =MAIR0VAL
> -        ldr   r1, =MAIR1VAL
> +        mov_w r0, MAIR0VAL
> +        mov_w r1,MAIR1VAL
NIT: please separate arguments with a single space just like you did in every other place

~Michal

