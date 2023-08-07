Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D3772549
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578400.905884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT07Y-0003he-JP; Mon, 07 Aug 2023 13:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578400.905884; Mon, 07 Aug 2023 13:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT07Y-0003f7-Fb; Mon, 07 Aug 2023 13:18:04 +0000
Received: by outflank-mailman (input) for mailman id 578400;
 Mon, 07 Aug 2023 13:18:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2NL=DY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qT07X-0003f1-Gy
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:18:03 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4de8776-3524-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 15:18:01 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by LV8PR12MB9449.namprd12.prod.outlook.com (2603:10b6:408:204::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:17:57 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 13:17:57 +0000
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
X-Inumbo-ID: d4de8776-3524-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyB8Odyutmt1zWUMzkwMoGMMH9ZicfPxzqKzl7mQ2iA2GN1LeSqBJYXVpdfCR4e9TcF4nGqC5jAH94PxLFEjH5Cm8EJcpZFKQ1WOEDbVrl0ojjbtFx056oWpLYBlEipOn7yPPRCNu+CoSIfsEdDZx8owJ69CeUa2LJn//K47+NnKUoSDHIAahHuHeYPI7VumQDYrWpDrMB+uM4GRWHGz5P9tNUC0kNd+V6YcSaTEvdkAthGYKwktFeXqJM/qpkH8/c4nKP+jkt1jxLRAJdU0ICCm2E4f9AKPQn+/FnVMmjgUzXSmFefKDaYHFx/LuSR8efCb4jzLMSUsnL0ymAcRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQjljf0GrI0GEV5K85/Ec4Yt7l2YjEXQ+Dx6GkfqNxY=;
 b=hmeTWojeXPc3ic4UBllxeua2yCqe2MnNdQIJpZlIc/spvMRzRZIFJkMGAoS98pHhwh8GVpyV8mRcZUjbFRV/Ivqm40Nr4JqVVAKaTbZJvWZ3dfhd2qjTn7e5PECeBGBgwrp2F+JLwwdQDzAQn9rZwDTGmgqakQJUVk0jEc+SHblHk80NvApaDC+iRD0XLIMES2MG47qTgNOhZIdmQjccPZsKcHIEbol/18e/C1D3UryQttOv44DdOPvZy5lZvYJ7KIwKJzkPqpq8ca+y3g2ywvB/oeksRRm+qX2g051IC3DUX2zsw6bhVolIgztkJqhiqjX0ezQ70IY1IMnwii6nYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQjljf0GrI0GEV5K85/Ec4Yt7l2YjEXQ+Dx6GkfqNxY=;
 b=g7AO/XiP3d0oxY2vzpJO29JkHFsf49tOOEZSgMT7MHCmsv/WNKvEfWzy5WrjawsTs082fO4H4l3I3pMCNMwhVM+OWJHCHNqQ3iImfjeE5wDn2gqvb8RX5XmmPROm+IshaygdZv5agxrNEmTVEk/H7evX60t0IXcVLL5A96Sfbvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d6ef94ff-0477-bc23-fa09-454287bcf19d@amd.com>
Date: Mon, 7 Aug 2023 14:17:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 02/13] xen/arm: Introduce 'choice' for memory system
 architecture
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Wei Chen <wei.chen@arm.com>, Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-3-Henry.Wang@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230801034419.2047541-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0348.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::24) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|LV8PR12MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 1507a9bb-febf-4e84-062d-08db9748b741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/H2lqS1q7ZujHPmFbCz3GgRSvaeQDKQe0qaukueGQzeIVaJPHuPBst/QPZP0trS6Q+o2IGjF7n8ANRV5eip7Cr+JY3wkLANt1CGqP1WbegCh/DDNkUGLyy88H8fkQOLoRO6N29FY6k8IS34sH+Hxr3SX4jnpAYI8kAY3sJ7fSqX+uopwizxzPe5Tdks3/lgT9MIdc0AQy/Qf62v1IeGlEZr5zyqhudcqBLogG0ij1zQhhppbgOHclqwvfGQeWqaIBeF67LuRG9dsmFhzRPzY2xUw/sR8j9JZGTXKHIA6gR83QavGUjDebOAwuWevdnssu8kjPId+jnXocXi/yf4yjlculdBne12yFPNXVJQc6G3Vn8Lq5APSvGgCVri6I39Sn8/hTaYaHbf1JZDQdGLnc3oxZxy/NAMyAw73rvZrhKyTGjjKwHziPSSzUpcCTnAoUzP2MfnIoyQeCew8g4nTTvVi8IEIVQHu1JPc1SIepFll+118b0+Fgq8QdlczsCVd4YCL3GNnkQGyof1DuJsKPNFKJODRcinZd0elZs2P4qlgmPpDM1eEi0JA66gQkJETcK3h6VLKF46PawASihPorszFNG69+J0MPjzmymCih1PTBV+XMJkIBPUo5ZRmNd/Y0CreKdEBUC4Mr8uxD8zwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(1800799003)(186006)(2616005)(6486002)(6666004)(478600001)(31696002)(6512007)(26005)(36756003)(6506007)(53546011)(41300700001)(8936002)(5660300002)(316002)(8676002)(54906003)(2906002)(4326008)(66946007)(66556008)(66476007)(38100700002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eURNUjRiQTkwcWpGTWJvazhtN3BQV2tFZTljTE5tUjBqaGtyanRiZlBvMFA1?=
 =?utf-8?B?cWZHbVdUbHFMMHMxWHhjS1FWakpsbWszeGVQUEduaGxUclQ3Mi85eURjODcw?=
 =?utf-8?B?SDBhMGErVDM0V2taM0VtRk8vR1BhOFRHNC9oWGNaTm1PaDhYdkROVUF6blQ0?=
 =?utf-8?B?SnZQekdkSFRrekI1Vjh5YjBpNFh0eVpYTXFWa283S09Bc0VOMTBTeS96d1Rr?=
 =?utf-8?B?VjEyWmthbjlTNldNZXV2NjNXbVVKRFFHb3V6dDhQcG45L0RUWlRPSVA1RndI?=
 =?utf-8?B?VGRVM3hxQ2FQZFcyVEh2YSt1YVdrcGRocnFvbEppY0FQOGZ2RDlIZS9MU2xZ?=
 =?utf-8?B?THM3aVJYY2dwQm1VWXRET1UyaU9UUmIyNnBhZ1NnclNZUENaS1BYcUlCRXp1?=
 =?utf-8?B?aEJQeWl6SVpQS01vNzdmQWNxcnhhK0pscDRoM2t4V1ZnYmQ5eVd0ZS9hd2E4?=
 =?utf-8?B?VEExRlVYRElacDlkdlh4cnJZWXZmY3htNUpjRnVURXlxc2p5N2h5ZFR5dWww?=
 =?utf-8?B?YVZjSGFxc0JVVmp0bjBCZlpYQXFBYmlySHhIUlF2ZjJpL1BDMk9JRldGeGtl?=
 =?utf-8?B?UXMyUFZsUyt2akhUeVRidXM5VG44UDZHOGJIRGo0Z28vSzM4NmlGZVdOY25x?=
 =?utf-8?B?ZHVOSnAxd0xFK3ZwNkE0UWVWcjg1SjZuNTZhdHZRWmQwcHpNUXJpYzBVN0Va?=
 =?utf-8?B?UlZ4Y0pBdFlKRnNxOGplM3BPVTJXd1k3Q0xPVkVKK3k1SGFZOWpmNW1YWmYr?=
 =?utf-8?B?QUdwTjA5MDdQTkUxMDl3SUEwOXFrcWFZRG5teDZ4VnVNQ0dVREhWSjNXU1hC?=
 =?utf-8?B?NEUyUzhlUHpPRzlXZkptR2lYZ1hjNVZlTExNRkkyN2ZXa3JQeWZnVXlvT0FH?=
 =?utf-8?B?b0kxcE91R01HNXl4RmQ5STBhQXN6clRtZ2RxQlNDTFBmWnlYV0dVRmNicFhW?=
 =?utf-8?B?T0taMHp1Tml6VVIwbmZVeWU1RmVGWUFaemlIYW9rZk53TWQ1QTRVdW16UVda?=
 =?utf-8?B?Znc4TW5YWkJpSXdhTU1EamsxNFJJK202WUlkMTRWcDVVRkxoeFFtS29CM1I2?=
 =?utf-8?B?QW50enF3aDY5Y2xWQWhmN2tOTEx1MDJFU29hRU5hYWFub2JudnBaTGhuVnB4?=
 =?utf-8?B?eFJIbjk5WXdvL1c0TFpVanFTNVQ0Y3lOTktZQ2ZINEpaNU51aWhCS3luaDdW?=
 =?utf-8?B?ditMV3VsalByT1FWRDZzWkFaSVJEWWJNM3hGMnFydndFWm85SEZNY2hNNkxG?=
 =?utf-8?B?T1VoTnNhNnR1Y1ZsQkJINldWL3Nxc0wza0drSWtQaVZRZ3hNY1QxczFxZHRF?=
 =?utf-8?B?a29wRXFjbGpjeGdLT1BYSkllc21wVzF6d251aUt4Nk9PQ2VKaU9aRHpzTkZ6?=
 =?utf-8?B?b2ZqUW4vZmw4NWNaNlpFeFU5ZTJaT0txeDkyK2V4dDJBQ2tuR3pnK3AwT2V4?=
 =?utf-8?B?R0x4KzgvM0FBZVY2bjBIa2h3K2p2eHBWeTZuQUFJV0ZoVUhIVGJlbHM4cWpX?=
 =?utf-8?B?eHJBZ1FhdmR2eFIrZTB4eFc2OThpZTZoRXY5WlN2RS9uaWZ1QTMyaFBjS1lh?=
 =?utf-8?B?ZmlDZjZRbHJ2cjZHZEZ4TlJrcEpPZk5BK2d3Q1FmdURpSnpOcWluQkRKNWdK?=
 =?utf-8?B?SXAyVVBVeVdXRWQ3eGdwVm9GNldyRGRldUZaa09iT3BIL1BBajV6VTB0N2dG?=
 =?utf-8?B?cEs2dCtOQVo1eEpPUTlXZHIyNkxKTnJvUjlqeDkrQmtaOFVQZVg1M2hKdDNX?=
 =?utf-8?B?K1RTdmZjcW1aOHFHZFpyQkwrZHhaU1E2QXNqN0g0dnZvWEhOWUtaM2NGVTZR?=
 =?utf-8?B?YlB2bjZoSkQ1WWFEVFYyM2dUdWRJTE1pYUppTGZoMnBoR2RtVElmMnVZTkpK?=
 =?utf-8?B?QlVrbHhKdTl5bHZxZWVTYUtVcmdOSGNYQWlvcnJrOWRzT1JEeXRiMW5aMUFG?=
 =?utf-8?B?czJyOXI0OWUwNkc5Y2piZjJJRDhPcktDWkovSk5ZUlVIZmJubVg0ZGRqM29Z?=
 =?utf-8?B?WnkzNllPaG5XanRUbzhkSjlRRHovRkVZck9Yd2tWNWRvaXRyZVpnd2VZMmVv?=
 =?utf-8?B?ejR2b1dkeUlkSEppUUd0YmcrSGdYTGpBdDIvalA0Y1dVd003Mmd0YzcxSWho?=
 =?utf-8?Q?zjICOfVN8Z9dTQElMjvQHiurn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1507a9bb-febf-4e84-062d-08db9748b741
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:17:57.3163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgzCLpULLIyWlu72Lxo7SpPkezYwjEqba77ALeRoCjM2PkoGJ6FciQ0MUZKzzYmGAFPtOIJuQ0RvB/YpIC2eHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449

Hi Henry,

On 01/08/2023 04:44, Henry Wang wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> There are two types of memory system architectures available for
> Arm-based systems, namely the Virtual Memory System Architecture (VMSA)
> and the Protected Memory System Architecture (PMSA). According to
> ARM DDI 0487G.a, A VMSA provides a Memory Management Unit (MMU) that
> controls address translation, access permissions, and memory attribute
> determination and checking, for memory accesses made by the PE. And
> refer to ARM DDI 0600A.c, the PMSA supports a unified memory protection
> scheme where an Memory Protection Unit (MPU) manages instruction and
> data access. Currently, Xen only suuports VMSA.
>
> As a preparation of the Xen MPU (PMSA) support. Introduce a Kconfig
> choice under the "Architecture Features" menu for user to choose the
> memory system architecture for the system. Since currently only VMSA
> is supported, only add the bool CONFIG_HAS_MMU to keep consistent with
> the default behavior. User can choose either VMSA or PMSA but not both
> in the future after PMSA/MPU is supported in Xen.
>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

The patch looks good, but it does not cleanly apply

b4 mbox 20230801034419.2047541-3-Henry.Wang@arm.com

git am ./20230801034419.2047541-3-Henry.Wang@arm.com.mbx

Applying: xen/arm: Introduce 'choice' for memory system architecture
error: xen/arch/arm/Kconfig: does not match index
Patch failed at 0001 xen/arm: Introduce 'choice' for memory system 
architecture

- Ayan

> ---
> v4:
> - Completely rework "[v3,06/52] xen/arm: introduce CONFIG_HAS_MMU"
> ---
>   xen/arch/arm/Kconfig | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index fd57a82dd2..0e38e9ba17 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -59,6 +59,20 @@ config PADDR_BITS
>          default 40 if ARM_PA_BITS_40
>          default 48 if ARM_64
>
> +choice
> +       prompt "Memory system architecture"
> +       default HAS_MMU
> +       help
> +         User can choose the memory system architecture.
> +         A Virtual Memory System Architecture (VMSA) provides a Memory Management
> +         Unit (MMU) that controls address translation, access permissions, and
> +         memory attribute determination and checking, for memory accesses made by
> +         the PE.
> +
> +config HAS_MMU
> +       bool "MMU for a VMSA system"
> +endchoice
> +
>   source "arch/Kconfig"
>
>   config ACPI
> --
> 2.25.1
>
>

