Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390676AA22
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 09:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573735.898715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjyM-0008Jy-1z; Tue, 01 Aug 2023 07:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573735.898715; Tue, 01 Aug 2023 07:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQjyL-0008H5-Uv; Tue, 01 Aug 2023 07:39:13 +0000
Received: by outflank-mailman (input) for mailman id 573735;
 Tue, 01 Aug 2023 07:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HeFo=DS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qQjyK-0008Gz-K3
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 07:39:12 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eab::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8091c64d-303e-11ee-b259-6b7b168915f2;
 Tue, 01 Aug 2023 09:39:11 +0200 (CEST)
Received: from PH8PR20CA0023.namprd20.prod.outlook.com (2603:10b6:510:23c::29)
 by SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 07:39:06 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::67) by PH8PR20CA0023.outlook.office365.com
 (2603:10b6:510:23c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44 via Frontend
 Transport; Tue, 1 Aug 2023 07:39:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.22 via Frontend Transport; Tue, 1 Aug 2023 07:39:06 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 02:39:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 00:38:31 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 1 Aug 2023 02:38:29 -0500
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
X-Inumbo-ID: 8091c64d-303e-11ee-b259-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KmeE+KFDCm87pSD5vNh7lTzirNh4pafilivCNyeC3/qkyTm5VJ0vnmzyqsjetjijx1aul06Vxt/itcih2d3TN+QpfkHfooGrPFwKW96+GwqClOdGbzjF7PtwEMmPchxVSyI+BvLvwlb0Zxukngj6NUmvISQT+s5fwHztXYJp8yzV0L/+U2WyGqVLyJptD8rFPQUnRdPud2RO8POGQ1c76A9LLmhV6tMCrr5jUTJzHG1dqAjijn+EDJbODrSJipyLkXuKhRZ1h7vI8GjynKvhcCnt0RphqePlfJkcLsJvexHx63u/pD4CJDppz9uEBsgAmC0F8CGMqSRlyLaEJVSqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrsj4tOqTxTJMHZgg+SgKKHUt7o0rHQ02LTzamC84Wk=;
 b=Zhsnx3KxKEzJznvQqtoDjVFVOUU6l9cFvl+XzxHUZm0nvzd8RnwIgypRvmzcnO95G7+l+XYWoa9seUWMb851sCkPzLcAwuXvbypIhdPEPcaN1IvdUuG1JeqFhvambZ3egHtXtxkrpXacPaEr1JdeFeezm0EiTuXaalOwrsxzOgn2fmOeGFVN60HQxoebJeVDSo4YwJIdnZ1ufZKqSoUtGUHV3s/TbWwcR2UeLr3CkO42mJgnnKZqFbJca0DMniGU9OLPIbQOmiG1j9lqmDACBjK4HcxcExYBAQt321E+g5cizyXslYekPtXzhIqgIhE0usDtCdZNGtLpzmZLXY3/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrsj4tOqTxTJMHZgg+SgKKHUt7o0rHQ02LTzamC84Wk=;
 b=NvihPH95vM3ROJnrO+RQs24fqdFGsKsASXxlpfbUPWv9AxqCCU43H/OcvV1Y+6niQJu/hQXCNtV5LV/BNZ4OLnYs7rKKOFKNRI0xn0Xs4fSFOm/dudLeL4KllV1jDajMarb/J3GR7hGreK1NMbFYdLZpw2yTvTwb8XKN7KM3HNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <99574b63-18e5-20fe-659a-432fdaf4b5af@amd.com>
Date: Tue, 1 Aug 2023 09:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm32: Avoid using solaris syntax for .section directive
To: Khem Raj <raj.khem@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230801002853.556437-1-raj.khem@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230801002853.556437-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SA1PR12MB5614:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d1367f-d600-42cd-a41e-08db926262c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tfeiLE3SFVTxVzURFB+P5NrSA7puGVWnKXI4H1hU5hLJtJslN/ZKUQikEz7VcC0CzKbpagXUtzszpnqqerDcR/sP+9x72fAivIYaWomVSP1euhNL2/VDhx5YPK+LSGIXwGpM1JlJAlV5I+ausbSNZe0TKDchQZFOaPkRI93KtcKvirgkHXjUqJrVhDlHdNNksXB7QYY7Wg7ONVLF5W3aaOWpci1jTzwaJYaogVIUowwxOv78xlAQeD9EzlUAi4fv3pv9mc5Nv2/EzzNxZU3vYLjOtUGm/tZugbw/1GaITGxoUweroClDFkaOnU69miSxOMbB68PG1Obh1Bky14TYYvHIbUAncsEM9GCPYQUNsfe8G08enFBddt7Bh6BXgZoIWccN9eX3UzJYrRHw27BDFRY+QjXDzwiUiZf4DQ4tf4QGIko+hqvAAK1L/2zpHYQ+szlaicOp4xJb6kd8qFXSswLcEPkt9jlj8e77/H+xzyXX6Gn2GnFpIC9mJdyhvYo6+AoTA6thVXwbBUcQQGTQtqsOsXlyuVTeVu4XwoGjJvFw9scPRKRkj/Q7+VUja9qkSx+lkkeHU2YdXV+0BnpgglhAdyxNryOD4ncSInXiU56mCbx/h9VRHzNNIiBW0idfFOZksbr5EFfUhDWz0FpqIt6VHJcPgw98By9HZhNe40MF34ijUJ6P6t8ejWD45ybgiYcY/tREoHedC9v2pNzfPVsBVm7YNeC00UjOJflFmCw/Wg+SEVn/mUM2XsChwPQ43iupywPlPcWaqneuzy9kx7G8Ua+/rks6coixnxiEFRwM51bQqJFscEAMRuWxZilQ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(44832011)(966005)(47076005)(36860700001)(36756003)(40460700003)(40480700001)(2616005)(53546011)(26005)(83380400001)(336012)(186003)(426003)(70206006)(70586007)(81166007)(54906003)(110136005)(356005)(82740400003)(41300700001)(31696002)(86362001)(316002)(16576012)(5660300002)(4326008)(8676002)(8936002)(31686004)(2906002)(478600001)(142923001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 07:39:06.3961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d1367f-d600-42cd-a41e-08db926262c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5614

Hi,

On 01/08/2023 02:28, Khem Raj wrote:
> 
> 
> Assembler from binutils 2.41 rejects this syntax
> 
> .section "name"[, flags...]
> 
> where flags could be #alloc, #write, #execstr
s/execstr/execinstr + there is also #exclude and #tls if you want to list them all

> Switch to using ELF syntax
> 
> .section name[, "flags"[, @type]]
> 
> [1] https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html#SEC119
I think it would be better to add a link to 2.41 docs instead or to refer to the following commit
of binutils:
4cb88cfae843 "PR11601, Solaris assembler compatibility doesn't work"


> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  xen/arch/arm/arm32/proc-v7.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/proc-v7.S b/xen/arch/arm/arm32/proc-v7.S
> index c90a31d80f..6d3d19b873 100644
> --- a/xen/arch/arm/arm32/proc-v7.S
> +++ b/xen/arch/arm/arm32/proc-v7.S
> @@ -29,7 +29,7 @@ brahma15mp_init:
>          mcr   CP32(r0, ACTLR)
>          mov   pc, lr
> 
> -        .section ".proc.info", #alloc
> +        .section .proc.info, "a"
>          .type __v7_ca15mp_proc_info, #object
>  __v7_ca15mp_proc_info:
>          .long 0x410FC0F0             /* Cortex-A15 */
> @@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
>          .long caxx_processor
>          .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
> 
> -        .section ".proc.info", #alloc
> +        .section .proc.info, "a"
>          .type __v7_ca7mp_proc_info, #object
>  __v7_ca7mp_proc_info:
>          .long 0x410FC070             /* Cortex-A7 */
> @@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
>          .long caxx_processor
>          .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
> 
> -        .section ".proc.info", #alloc
> +        .section .proc.info, "a"
>          .type __v7_brahma15mp_proc_info, #object
>  __v7_brahma15mp_proc_info:
>          .long 0x420F00F0             /* Broadcom Brahma-B15 */
> --
> 2.41.0
> 
> 

The patch looks good but a fast grep shows that ".section .dtb,#alloc" in arch/arm/dtb.S would also want
to be changed (I do not have gas 2.41, so you can check it by specifying dtb to be included in Xen image through
"menuconfig->Common Features->Absolute path to device tree blob")

~Michal

