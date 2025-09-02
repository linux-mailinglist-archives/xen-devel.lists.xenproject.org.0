Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD7B3F6B4
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 09:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105746.1456592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLQS-0000Cn-4O; Tue, 02 Sep 2025 07:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105746.1456592; Tue, 02 Sep 2025 07:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLQS-00009V-1R; Tue, 02 Sep 2025 07:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1105746;
 Tue, 02 Sep 2025 07:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvP2=3N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1utLQQ-00009P-QC
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 07:27:30 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:2417::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47e5dea0-87ce-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 09:27:29 +0200 (CEST)
Received: from CH2PR16CA0001.namprd16.prod.outlook.com (2603:10b6:610:50::11)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:27:26 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::cb) by CH2PR16CA0001.outlook.office365.com
 (2603:10b6:610:50::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 07:27:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 07:27:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:27:25 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 00:27:57 -0700
Received: from [10.252.147.171] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 02:27:24 -0500
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
X-Inumbo-ID: 47e5dea0-87ce-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs4QUvXR/hMjPbJGs7OjAKnY4LCyBzrbtZHO1ir4hNPBGr860gHQBHMhKmTXo8nty6b3bMrx4+iLihdQxqV2ib29C/6I3YsGL5n1omiQnJ4wKJhwkuRL2ydjU6/VhlD7V+Sx/g1+IpkpO1/i8ZqdRC9yzYPDRgXcxpOQtXpZNX9F0LTrIHbCZ7AMJJgxxAyx+sio8Flqfpe1/A0QNutdeVZuPIeExHzMvpDCh/BPYZt49r+x3k+CqnRVZitu/i3n7dbVemzZPdaI4lGqjpz/IGevLaJJ1gUEJk1D7j9q+8ZSfF0R4HxbDQPmZFkKv+Qv1GQTD27FmZY/wUElAXgBTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI/oTIsEH+yF+vdp5hZ8znu5avii+Lx+745u0RHTIhI=;
 b=zHpC1WboxZzy3HCPylSie6wH9Wer7la2UbDO9M18ncTglS1k/VyCDSAfLymGQ9meX8FQ7kI09X/RBCKGl5Y1ad/7gFZt0hf1uPRWtyuwmEJwDy9KQv+zmzSt9ZBYTbj5v641h1TWQEQJNUjrLmiFHFh8tpdwIOQa4X/emMK8Ksk7nlIzJlBrk4YFeHLt4d2ISKVmWNbWaB0N5Vznm6hWXAv+w+Hkn+b7k2KQfaXC6NKIzu8G9fKLRiM1Vv/szkxUYiyHz5nQ9CHh6cM+DPEJcXVqHMhQatOH77yulEB2RHUe5x38W+C5RZSCiCe0C1umwG1dER7+bXv9v5wWD5RwKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI/oTIsEH+yF+vdp5hZ8znu5avii+Lx+745u0RHTIhI=;
 b=vkBhaWlg3KfkVkqalTv8zm+qDDqdwGwD6dsRsCN72+XdU2EWRGJ/q3gAOKsdnvGbNkekjVo5g9fx9LwOJpCh5b/EqhVeNO9hY6xi3zvh0mq6q9sQ9lgMQdHgOSFpGPe2KO1n3ZhtWRyh08/N6IWZ01Pzgft51cYgkiawWLG7w10=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <5d670f97-5e04-45b8-b9ad-81e42706bc47@amd.com>
Date: Tue, 2 Sep 2025 09:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: arch-arm: Drop XEN_DMOP_get_ioreq_server_info
 from supported
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20250901125837.1271101-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250901125837.1271101-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|MN2PR12MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df24562-4c49-4526-a31c-08dde9f22a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blhNUy9WWWJqTVJUSGhtZVRSeFJxajFyb1lJZHJwdmJOa05JVWFmUEs4WEoz?=
 =?utf-8?B?TDc1Sy9aa1hnZXRzbmNtbnYvQnVEcVZLY0JUOUNRUno3NVBvT1pWSERjazl4?=
 =?utf-8?B?N3l3aXlGYy9pYW5wVm1nVnJoY3cvWWRybVNpUXZIVlV3RlF0c284YTZiUE9z?=
 =?utf-8?B?cHROeXBLZmU3ak9NSXJ3ZElSN0NZSGJTRFJXM3hNV3dNL0dFa1FiTGx0Z3VF?=
 =?utf-8?B?Wld6R25Mb09wbk9wekg4S3BwaisxZkJGYkQ2bGFqSlo3M1VwRXhrckMvU1c0?=
 =?utf-8?B?ZEkya2M1OGlObWdKY3ovRDV4dUVkWWt4MUFRZGtXd1QwWll4eTUvK2dibitM?=
 =?utf-8?B?QTBaaGl6L1dyRS9vNFJlUFA4VEU0NFJneWJtT0dvUnNKSDQxVHRkdWV0VVlX?=
 =?utf-8?B?U1ZHRFlzRkdBWWQwcmErVjR0NVFHSlkxOWMwSkk0TWd5MEpWZVZlemdkdGUv?=
 =?utf-8?B?RFVUNlNnK2g2cGxWNktRbE5aVlliSVV3Y3BldVBLbGRIdGp5QUZSSlgwcERN?=
 =?utf-8?B?dnk1T3lSQXNLTmdabHFLcW9YOWZ5S2cxVFhlOGF5KzFqQnpLbE43M0ZCSmUv?=
 =?utf-8?B?UGNhamVqUkVnT2M0akZZSlVNKzBLb00rTXM5MkQ3R0tnVnNic0Nxd2JROUd6?=
 =?utf-8?B?bFVUWS8xUEhHTzVWZytWZlROUU95OXFVaXZhbkZya1pROFdHN1MvUUFZbTR1?=
 =?utf-8?B?UUQvMzBjbkRUbFdUbDJ2VzNWU1ZURThTZkFzVFU4VnNCcVNwdURiWWRCZzJk?=
 =?utf-8?B?MldGUlFobmZqS09Eb2MrcjBsZGNrU0N0TWJtM3J4RHV6OExuUm1rd1M2M3dD?=
 =?utf-8?B?K2pJWEljNk5MUmF3Q1FPNlFTNjByZURQaVRvWCtuZlFoWE1LekZBdWt3Wk83?=
 =?utf-8?B?SHZtWXZZcks5UlVabmpxUm1iRnUwYSt6WWtXN1NITU80K1BjMkpNOHJEZ0hP?=
 =?utf-8?B?L21WUGhPSU9kNzdBeFFVKzZZUXZOMFZJZGx4SVJlanpaWVJ4cW9EOXRQc21h?=
 =?utf-8?B?NXdkZXJDMlltTTUya01hZmV2YW1mQUdhWGVFZW1UV1pyemhOMjdaaUxPTjht?=
 =?utf-8?B?RGlWL0U3YW5wcDEzbDZZWmNhMVRGTHkxd1JmZnVQT3lMWU5FZTd2T3hucEJ1?=
 =?utf-8?B?Mmxxb3A3bndsMkFqVHBwdkZ6WmkreHBrY2ZYUTh1azVxRWs1K3ExejhheUpG?=
 =?utf-8?B?OFp6MDMvSjlWdGsxR1dpR3VDYWpuaithVjZFL3MyejNqNG84cmZEWVJjQzgw?=
 =?utf-8?B?WTByaExkZG9WZnViOGkwOXZESTIzTU53TUpwQkxJZlpGTVhmRUV0enVHK1FO?=
 =?utf-8?B?OXpxMkJqRk5SbWtvV0t2dXN1dmFocVJkTVhSbWRQT3JVUGRNK0owYk1EdWQ3?=
 =?utf-8?B?WDBUc0pyeERDOTNVWkVZc3NYdkwwb09EbmRQKzlPL1N5OUJxd3dCUm5VcUpy?=
 =?utf-8?B?NmE3Yjc1V1ZBa3o2SlRidy9qYjdjUUtzeStZejZGeHFrZzVvS0R3Ym9PV3dx?=
 =?utf-8?B?Sitha0tYRE8xR0lKQTFRUCs4L2ppTzdOZjNLcDZDUmZydDR3aUIzbzFCdlNZ?=
 =?utf-8?B?RWhQMWR4V0RiYlFWTkdKbnJ4YjExaHhMb2hRcFhDK0pKeXNYeWRHeWhjdHNn?=
 =?utf-8?B?S3hONGd0VzBjZG9iYTlVV3ZFa245a3NsZm5yVXd3VFJIVTZMYmk5OTlSNk4x?=
 =?utf-8?B?T2ZMbXEwNlhoMjl6Wlg3WlNOa3VKcG1pSWJvcXRRNXRhZy83czg5NktZUldO?=
 =?utf-8?B?clc4YldrTDNmKzNZL1dIbU9PWWlTMHMzVDRxK1JYVW5FMGhIQWJiWSt3R1JQ?=
 =?utf-8?B?ZzVJY1o2cUM3MlYvNHJCTkxrTjdtV01SZW9tMzd4cXluc2daUTZOdENKMno2?=
 =?utf-8?B?VUduNXZlS0h5N1c2Z3p3RmRwTXQrNmJjY1JPeVU5NjZSM3A5eEJGbXhuR3ZE?=
 =?utf-8?B?M1U4bkZoV1B3SkowZkMyeG5NaHRVSit3NExpNFc5Unc0anVmaVlIOG1HZzF5?=
 =?utf-8?B?eHJzekdnZmNKaHdkRXZ1OVI2Y2wzMnFXTnpyOHc4RDNDczdXZ0dLVEp4Ti9i?=
 =?utf-8?Q?zaQP3c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:27:25.9710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df24562-4c49-4526-a31c-08dde9f22a76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224



On 01/09/2025 14:58, Oleksandr Tyshchenko wrote:
> The said sub-op is not supported on Arm64, since it:
>  - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
>    cannot be returned), please refer to ioreq_server_create()
>  - does not support "legacy" mechanism of mapping IOREQ Server
>    magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned), please
>    refer to arch_ioreq_server_map_pages(). On Arm64, only the Acquire
>    Resource infrastructure is used to query and map the IOREQ Server pages.
These points are valid. However, I don't understand why you mention Arm64 only.
What about Arm32? It's the same here.>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  xen/include/public/arch-arm.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index e2412a1747..023cc2f468 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -130,7 +130,6 @@
>   *  HYPERVISOR_dm_op
>   *   Exactly these sub-operations are supported:
>   *    * XEN_DMOP_create_ioreq_server
> - *    * XEN_DMOP_get_ioreq_server_info
>   *    * XEN_DMOP_map_io_range_to_ioreq_server
>   *    * XEN_DMOP_unmap_io_range_from_ioreq_server
>   *    * XEN_DMOP_set_ioreq_server_state
This list is kept in sync with the op_size array in xen/arch/arm/dm.c.
I think we should drop this op from there, not only from the comment listing
supported ops.

~Michal



