Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4497AE82C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 10:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608359.946786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql3Yp-0001qv-3U; Tue, 26 Sep 2023 08:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608359.946786; Tue, 26 Sep 2023 08:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql3Yp-0001oV-01; Tue, 26 Sep 2023 08:36:51 +0000
Received: by outflank-mailman (input) for mailman id 608359;
 Tue, 26 Sep 2023 08:36:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zadu=FK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ql3Yn-0001oP-D2
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 08:36:49 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4112736-5c47-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 10:36:47 +0200 (CEST)
Received: from BL1PR13CA0345.namprd13.prod.outlook.com (2603:10b6:208:2c6::20)
 by CH0PR12MB5107.namprd12.prod.outlook.com (2603:10b6:610:be::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 08:36:42 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::a7) by BL1PR13CA0345.outlook.office365.com
 (2603:10b6:208:2c6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.20 via Frontend
 Transport; Tue, 26 Sep 2023 08:36:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Tue, 26 Sep 2023 08:36:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 03:36:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 26 Sep
 2023 03:36:39 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 26 Sep 2023 03:36:05 -0500
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
X-Inumbo-ID: d4112736-5c47-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtdKHhKF+NqiBXH0d/U0R6JEy+l+4hYV+ckw+UXU71mqkIRi75tUo0ffUVePgDXOFPsGhadep2XQ3oqbEQznnC5VG59/+b8nDPiVKbjRWe90moVVwdmouZa8Abo929CDzP+C/CEpgRJGEboHpenZ15X/9RKLW/teOYCywwMBHqbTeDdKu5iirys2tj45/TBIXz2s2ABBxo6Fe28UC07R3oyo61DPGrnc6XK0C7oYaoOSdQrGHFtcXdzNEZ31hFdJPhN7eJYZNPziFYhwvqKxu211f4yqqZ9w3kKG3U4irfoESEHT7GIc9X8NjGar13JDrDH0a0FgMaOthb2lydY2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJDLhCR314p+O+W8iM1wkVF4IyFJUY+coostCiKCla8=;
 b=UATuKEJmIwml4zLOkCdQoBIdqtZqd6BBbA4VcoGTLiYZfryifCapSZQvNQDh+MBkFLfbHNV3ycpqeUhvtmUVA2kHGyzdQWqoZ0MvN+8XN4c1uw6bAaCS0VBzpwnTfHZ4Ix5q6Jw70oN4TNTQSPWtjCKyhlcoD/Yg75exYwDyqLkvKRZibsftt+7XzA8e4SmW/MzDucMnyqsgE8oBYHtdVfnVolFB/vuhKMPeo9SbAi9XVfRHI5Igen3sb7bFXg2F+sEdB9mCBHhRNPhJIKb3T8opW7ZqAg4dUjG2/IDBHx1JQSOBSMTHFy7yd5akTYpkeuWFdu0bgV29jTeisQSkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJDLhCR314p+O+W8iM1wkVF4IyFJUY+coostCiKCla8=;
 b=yim16/PZWnG9DzfKZOe5Etx2tmnzgP8W2j3GLvd+IkJgVahC81QO2td1fFofscWWOAHUSaxBTXngZeGJaLL+G6ydig2d3Yd+rNy+T/hL87ClMdvt+SXkIdsWSF0zT0SaaVB+krdjR+kUIUG40oJU/M27KtTHZY8jv9G1PUo+QxY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b0d2494a-8223-a101-5d10-f3803629f2f3@amd.com>
Date: Tue, 26 Sep 2023 10:36:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] xen/arm: Skip memory nodes if not enabled
Content-Language: en-US
To: Leo Yan <leo.yan@linaro.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20230926053333.180811-1-leo.yan@linaro.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230926053333.180811-1-leo.yan@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CH0PR12MB5107:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ec2808-9a52-404b-322d-08dbbe6bb5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZfaVP7/ygXMRCgjovH38ip5wFXz5WZ2C1nd/s/Dy7aEaWggGEb2t5ss5ZAom0idN0MUdQ0ChnMSDU5l0YgCWFgZ2biAEUbZZR/YhCUV+vZ5SCCRBgfzWJiqRst7DkUoHu0GxETzCOUg5LRfycIBqg286GEMNrtBoflP9lQGBaxGfXJXTScF50hqlncBygC/Vi5SXmjUcloXogI34ENO4exQ9T2sSdAOwgXoLB2a8/Ki2/IR5v7LU2vB7zm0hzTJvoxrpEUB/CnIbACGaEY3PxrIfmPpnhCGhKHNZ7CQbwrdU4+bzojKmr2CEtw7tWH7QvAZEa0CwybiKUNteGBTXqPPumjQQgZ3WM1c5UGSvIFVIgzwVipgfqMoKgnVl+ZJBrNWA8F02Eyw6Xz3kAV6jehLmW+MogZpgZUShluK3nFStEn3P7IKDalA46CxrOnlW7bxjt/2uwxVxawvJuSCJTWZis+/pQX4ue0W4g/mo249/rsp+btovFqpnad2Aib/huEL42WKJsu/t7AyEW/uex5Ukg36j5IY9sjwfeYJ+ivx2V/8ut8uZAoVflK4jh8p+a/eIj1AAS3W8yeuexackoFgOTdpg5jCl0OqjnHQIJg5QYryGtPT4n0KeTdlbVTF5ENSgH9lrOz00iPL5DTIZgZNLYneRloIOiafKhSlQOo+c8O+Pudr/rJkFOifYoHZA2IDOEXVpL9jNrLwkztxQDYy3P1wjP2OzRNSNyVqk/r/blCH7CyioUqEEZ+VJ7/0xAYd2oiUOqoozcIJhARoQ7CfM5a2aFIBt00o1PUlJ/BHALVJgz2XBkf2k5Vm0WQPV
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(31696002)(86362001)(36756003)(31686004)(40480700001)(478600001)(54906003)(336012)(4326008)(426003)(53546011)(110136005)(70206006)(70586007)(316002)(41300700001)(16576012)(8936002)(5660300002)(8676002)(44832011)(26005)(2616005)(47076005)(2906002)(40460700003)(356005)(82740400003)(81166007)(36860700001)(83380400001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 08:36:42.3228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ec2808-9a52-404b-322d-08dbbe6bb5c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5107

Hello,

On 26/09/2023 07:33, Leo Yan wrote:
> 
> 
> During the Linux kernel booting, an error is reported by the Xen
> hypervisor:
> 
>   (XEN) arch/arm/p2m.c:2202: d0v0: Failing to acquire the MFN 0x1a02dc
> 
> The kernel attempts to use an invalid memory frame number, which can be
> converted to: 0x1a02dc << PAGE_SHIFT, resulting in 0x1_a02d_c000.
> 
> The invalid memory frame falls into a reserved memory node, which is
> defined in the device tree as below:
> 
>   reserved-memory {
>           #address-cells = <0x02>;
>           #size-cells = <0x02>;
>           ranges;
> 
>           ...
> 
>           ethosn_reserved {
>                   compatible = "shared-dma-pool";
>                   reg = <0x01 0xa0000000 0x00 0x20000000>;
>                   status = "disabled";
>                   no-map;
>           };
> 
>           ...
>   };
> 
> Xen excludes all reserved memory regions from the frame management
> through the dt_unreserved_regions() function. On the other hand, the
> reserved memory nodes are passed to the Linux kernel. However, the Linux
> kernel ignores the 'ethosn_reserved' node since its status is
> "disabled". This leads to the Linux kernel to allocate pages from the
> reserved memory range.
> 
> As a result, when the kernel passes the data structure residing in the
> frame 0x1_a02d_c000 in the Xen hypervisor, the hypervisor detects that
> it misses to manage the frame and reports the error.
> 
> Essentially, this issue is caused by the Xen hypervisor which misses to
> handle the status for the memory nodes (for both the normal memory nodes
> and the reserved memory nodes) and transfers them to the Linux kernel.
> 
> This patch introduces a function memory_node_is_available(). If it
> detects a memory node is not enabled, the hypervisor will not add the
> memory region into the memory lists. In the end, this avoids to generate
> the memory nodes from the memory lists sent to the kernel and the kernel
> cannot use the disabled memory nodes any longer.

Interesting. So FWICS, we have 2 issues that have a common ground:
1) If the reserved memory node has a status "disabled", it implies that this region
is no longer reserved and can be used which is not handled today by Xen and leads
to the above mentioned problem.

2) If the memory node has a status "disabled" it implies that it should not be used
which is not the case in current Xen. This means that at the moment, Xen would try
to use such a memory region which is incorrect.

I think the commit msg should be more generic and focus on these two issues.
Summary:
Xen does not handle the status property of memory nodes and ends up using them.
Xen does not handle the status property of reserved memory nodes. If status is disabled
it means the reserved region shall no longer be treated as reserved. Xen passes the reserved
memory nodes untouched to dom0 fdt and creates a memory node to cover reserved regions.
Disabled reserved memory nodes are ignored by the guest which leaves us with the exposed
memory nodes. Guest can access such a region but it is excluded from the page management in Xen
which results in Xen being unable to obtain the corresponding MFN.

> 
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  xen/arch/arm/bootfdt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 2673ad17a1..b46dde06a9 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -206,11 +206,27 @@ int __init device_tree_for_each_node(const void *fdt, int node,
>      return 0;
>  }
> 
> +static bool __init memory_node_is_available(const void *fdt, unsigned long node)
This function is not strictly related to memory node so it would be better to call it e.g. device_tree_node_is_available.
This way it can be used in the future for other nodes if needed. Also, I would move it somewhere near the top of the file
next to other helpers.
Also, node should be of type 'int'


> +{
> +    const char *status = fdt_getprop(fdt, node, "status", NULL);
> +
> +    if (!status)
white spaces between brackets and condition
if ( !status )

> +        return true;
> +
> +    if (!strcmp(status, "ok") || !strcmp(status, "okay"))
white spaces between brackets and condition
if ( !strcmp(status, "ok") || !strcmp(status, "okay") )

> +        return true;
> +
> +    return false;
> +}
> +
>  static int __init process_memory_node(const void *fdt, int node,
>                                        const char *name, int depth,
>                                        u32 address_cells, u32 size_cells,
>                                        void *data)
>  {
> +    if (!memory_node_is_available(fdt, node))
> +        return 0;
I would move this check to device_tree_get_meminfo()
> +
>      return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
>                                     data, MEMBANK_DEFAULT);
>  }
> --
> 2.39.2
> 
> 

Also, I think it would be nice to add ASSERT(bootinfo.mem.nr_banks); e.g. in boot_fdt_info().
Otherwise the panic from Xen when there is no memory bank:
The frametable cannot cover the physical region ...
is not really meaningful for normal users.

This is just my suggestion (@Julien ?)

~Michal


