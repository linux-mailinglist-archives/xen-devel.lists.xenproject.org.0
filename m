Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A238B1AC8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 08:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711810.1112054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsOX-0005x8-O6; Thu, 25 Apr 2024 06:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711810.1112054; Thu, 25 Apr 2024 06:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzsOX-0005ul-LI; Thu, 25 Apr 2024 06:15:45 +0000
Received: by outflank-mailman (input) for mailman id 711810;
 Thu, 25 Apr 2024 06:15:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ltee=L6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rzsOW-0005uZ-01
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 06:15:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e192b0e-02cb-11ef-909a-e314d9c70b13;
 Thu, 25 Apr 2024 08:15:42 +0200 (CEST)
Received: from DS7PR05CA0088.namprd05.prod.outlook.com (2603:10b6:8:56::14) by
 MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 06:15:39 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::4a) by DS7PR05CA0088.outlook.office365.com
 (2603:10b6:8:56::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.11 via Frontend
 Transport; Thu, 25 Apr 2024 06:15:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 06:15:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 01:15:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 01:15:37 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 01:15:36 -0500
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
X-Inumbo-ID: 3e192b0e-02cb-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0KgmFL8Lr4kQ/g1XZO4a4IkXShPZsldLVX9wlCYr1ItjeOOUmZFvDqmjowEyJdXTJORLyxT3hvvfmTuTbJ0FvY3FbEK9AVwT48KBD4WEMRHqP76CwEKFIQi66grFOUocfKxYuPOBpy0xZAg6wAxfDcTPMbhc0KU/ZvtfsA41g8m7fbp9NTLc5qehBmZrNoj8SjX2qdBXf/Jn67A4+4lf50ycbtuWHkSvYYQk/buHESzsFenYX+h64Pygocsv6B13lx3LFi3gxZlS2e6B6jtbMor8zDiKdxQObUoGN7tdpj+vaazQ7n5x5cUdngtMNuTi8DW0KAty8HqQCNUEMQ/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMxc1pNjk5ztSLrJ8+E10iK89P5wq6JGiR//k0syEOg=;
 b=EIXDY1CmiV85FmXrLKShVZyOk4L84WcWZhBgPPf/32TmdWTrldNi5baBDQ1vijv4cTE2e1OJnVMKw28hAoSLUHtYTb+2y4D7j4/NeqiEfUj8PBulgPi+irdhRastk1dz/DC/wksBpkfVnzZP0vKh7J5u8xZP05cgN6GAE13S9Sy7kBhanjdLRL1pNuUcWWPzeLfsrZb90Ejn9PrhUBcZohWhntVjkC7TXQDXs9bg5a2Cixm2Q9rOlKel17gjyZYQkRiTFb+bWdy6IRAjMHYAkYXHh1FwIekqJD2iYd/rL1AG2wH5QhLRkH5BwD8ZJb/iTVEHeXpfHUObVbTyA9VD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMxc1pNjk5ztSLrJ8+E10iK89P5wq6JGiR//k0syEOg=;
 b=SmNzokAcXKw8L480BuC4nw7300bhJEMQ7kNVhOIIMT9tc6vhcoQJH4Wec8dvIYHZsV+YIK6DEfXTqC5Qi+7OTjKDdBKB6w69yWPD7QWG8kF9jpZEpIYLrhxNU0xL2hnQvKnpCZ8AElTsfkymL4xEB5Jr+lr/UO7HnUwrQfCd6VI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e21d93df-58ac-4dd9-a99a-62e5b7e147e3@amd.com>
Date: Thu, 25 Apr 2024 08:15:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/vpci: make prefetchable mem 64 bit
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20240424162726.204791-1-stewart.hildebrand@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240424162726.204791-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|MW6PR12MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: b60632d6-aeae-46e8-dfdc-08dc64ef20d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RDhHb2YwekZMN2ROdEZvU1VPdlRSK1VYZU1WZ1JsZ2Z2dVVUK0p3b1ZaNEZ0?=
 =?utf-8?B?Wnp3bXlpanBRWFBIakxYS1RsYi9NWklrZWw2ZGRvclZMNGRQZ0NVZ3YwWW1F?=
 =?utf-8?B?U3NleVYvMkZkSG5ic25EbFFtY3JMeHhHV0pLSlIwdXY3dmpsRXN0WUxyWlBp?=
 =?utf-8?B?aGQ1TnhhdXVHMWdudGJ0TFJYK2VCR1JndzFOTUYvSUxRNXlvQTd1eFRtWjEr?=
 =?utf-8?B?dzZpSkFGd0c0OW9tY2FvcHFzcHVBbGhYYVIyZk1nMFJjalZsRFo5aUlqTE96?=
 =?utf-8?B?M1ZxZTRWKzBoWXFaUDdlNDVFdG1mbWM5ZEF6SjQ4WFVxQU1TdEY4b0hYbDJQ?=
 =?utf-8?B?Vm9Sc21NRmZrT09XajZCVXpsRjYzbEY0UjZWOUVFWlNSZ1QxQ3h0c0FSVFNx?=
 =?utf-8?B?eU1UK1l1bi91MHUremljUlAyZ2FrS3FzNlNRUEFTWlZsMzN5ZUVpTEVyZTFV?=
 =?utf-8?B?WUxuUHBjcVdiTW43SDJYUCtTRFdFSUdMRFJKMkFqdDVIMWMvZHk4SUI5cGIz?=
 =?utf-8?B?QlNmSlFwNnNpOHJGdk1nY2owSExwbUFSMzNkaUttNEFqZUhvVG9LRkVlcHQy?=
 =?utf-8?B?MU41MjVyaDBBRHR3OTVCc2lqVTZaUHBXeWc2TzNjZTJvSVBVWU5nclBONUxE?=
 =?utf-8?B?NjEyTHBOWSs0WFVvZFRQUmtZSFJTWmV5MzJNQWxhSWFFcFBZT0ZDbWh3VGpP?=
 =?utf-8?B?S01JM3B2NHNRV2twTXQwdHFSU1FGa1lUZUxLYnJFbCtqbVFndFQwdkVMekR0?=
 =?utf-8?B?UjFKRWVlekxGeUZvbGlGdDlPeUZ5OEdiekFJMUt5b3dIYVcyQyszQ0F0Zmh6?=
 =?utf-8?B?NG5ldExpczVIS3I2YUhha0dkR1lSSEQrVDBiNHI3eTM5djMyM2MwYXRmaDF6?=
 =?utf-8?B?cTFlTHd6UWttOWpKL1FjekhVWUx1c1RLVVFZSFdpdWN2a2JXem83am9KbmNP?=
 =?utf-8?B?cWQyam1xUVp3T1N4dkI0Q243OFcxYThINTEvSDZUMDFXTVNsakdtT1hNUlo1?=
 =?utf-8?B?d1IreVNiZnBJbjlWUng2cmhkUjU0QnBUL0N1bEsrTFNJc1NobFpTeEhHd1R2?=
 =?utf-8?B?ajZ6ZDVkZzFlRGYzTHJRdUxqVnI4S0R3VndzTkVBOS9heklaVVl6M05QOGxi?=
 =?utf-8?B?T2xpenVxOVZpbFZEUDNVZWpCNFNoZ1Y4RVdWYmpsdDZJcnF0Wkwxd3kzVktQ?=
 =?utf-8?B?NGMzd25nU2hNLzRMekFFc2c5U2JNemV0Z1lDaWdreDFoUFlyemxFKzlMMVNp?=
 =?utf-8?B?ZG5weGdJNXhuSmJuN1U0dDJxL041UmNnYzRBWjlnTm9jajFVdUJSM1R6UW04?=
 =?utf-8?B?RjVuQ2dDUStxemhPOWc3MWNGYzFYMUc2WHZZNUNKcWo3UWQ3MGdlbUpKL0N0?=
 =?utf-8?B?amQxNmprODNjajIyK0ZPcEtzMnFZcXYwZHZiU2hrdlNsNVFUaFJ0Z2NheVA2?=
 =?utf-8?B?VlF0MEtIMmVZd1pGc0R1VDVYa1lRVXF1Wmc5VTNZSk4xL1FSWk9BU3dxYmlp?=
 =?utf-8?B?SkdKNXc3TGVJNmVOZzExWTNLdEhUcVhYWjNpRnVaTjBuMVFjSHUxdGIwQ0Nz?=
 =?utf-8?B?dkFqZ2tsRUJidUpGWEs1NjNTOE9JQkdlSXBPRXppaCt4QnFMVmE0NUovL28v?=
 =?utf-8?B?eUNqY1dPT1YwdTRzMTA4c1doUTJJWWRrNUd1dmZIMncrWVhMWGgyQ3YzNUY5?=
 =?utf-8?B?SnRVaS91SzlxMXgwYmpEM3E1V1BYdWJJbUxVb1JzNDk0Y2J3Vk01cDM0RTVV?=
 =?utf-8?B?VkplVjcrcXF0bjY4YWVFQ09CTG14a0pCejgreWU5VEhmWmhVQjRhUmRjUVFh?=
 =?utf-8?B?V0xXM1dqWXBoaitSRUx0Tmp1L0N4bjNPZGt6cDBHL2oyeE1rV0ZweWFaZVFT?=
 =?utf-8?Q?l/kuD3E9YAut/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:15:38.9744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b60632d6-aeae-46e8-dfdc-08dc64ef20d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959

Hi Stewart,

On 24/04/2024 18:27, Stewart Hildebrand wrote:
> The vPCI prefetchable memory range is >= 4GB, so the memory space flags
> should be set to 64-bit. See IEEE Std 1275-1994 [1] for a definition of
NIT: would be beneficial to provide chapter (in this case 2.2.1.1)

> the field.
> 
> [1] https://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal

> ---
>  xen/include/public/arch-arm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index e167e14f8df9..289af81bd69d 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -487,7 +487,7 @@ typedef uint64_t xen_callback_t;
>  #define GUEST_RAM0_SIZE   xen_mk_ullong(0xc0000000)
>  
>  /* 4GB @ 4GB Prefetch Memory for VPCI */
> -#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM   xen_mk_ullong(0x42000000)
> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM   xen_mk_ullong(0x43000000)
>  #define GUEST_VPCI_PREFETCH_MEM_ADDR        xen_mk_ullong(0x100000000)
>  #define GUEST_VPCI_PREFETCH_MEM_SIZE        xen_mk_ullong(0x100000000)
>  
> 
> base-commit: 410ef3343924b5a3928bbe8e392491992b322cf0

