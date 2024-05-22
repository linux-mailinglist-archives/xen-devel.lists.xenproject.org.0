Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F418CC1E2
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 15:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727609.1132149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lps-0006cz-1M; Wed, 22 May 2024 13:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727609.1132149; Wed, 22 May 2024 13:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9lpr-0006aw-Tw; Wed, 22 May 2024 13:16:51 +0000
Received: by outflank-mailman (input) for mailman id 727609;
 Wed, 22 May 2024 13:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzQV=MZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s9lpq-0006aV-Li
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 13:16:50 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a65dcf0-183d-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 15:16:48 +0200 (CEST)
Received: from BY3PR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:217::26)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 13:16:42 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::9a) by BY3PR04CA0021.outlook.office365.com
 (2603:10b6:a03:217::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 22 May 2024 13:16:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 13:16:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 08:16:39 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 22 May 2024 08:16:38 -0500
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
X-Inumbo-ID: 8a65dcf0-183d-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpDEF+CSzSe27gFEpZPk8Q4+mkWZ5+VpkrV87T9qcPbeI7ze3n8WSmmM71cpJV6eaQsCZLZmEkom80iFJdiPzYC6FoMyiFx/Bm7yUjOECBR4BtgTIcuhx4LaBSK6Keyf32Mp1w+HS9/BUsHn9th1zCN2StrZXK8TBLSGoTGpL/8ypvuMRz7brRqTz2o42QOZqy1enP9ZT//WaBfyXe6uRB64RDBqjiKdQaBvHlnF24nv3nDmbub85xEHYEEBc6lhKXiSLphyYnKxO4aNqLGPGh85L5sJdAnHeOU+C1CmtPGfmhYptB4uqXYBRbM35SOhN6T5DDT0l1CNOkVIU/gRSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qezSWhI+vIIqlcOsVgRs306/jm1ivIoR5Jn5pb1EKJQ=;
 b=Z3dnwR/GlL3UAjWNIfZ3tOjr74sN0QGy6oNED0xeKmCzpq02fDfzLA1RhSRwTyoUyTnl7y4d4FV+m/x4QttOwZh40In3z0Ho9z9BA9kKDpa9D94QEly2FbD77SVwYlk0R5jBh8Br6QpIhm0UWvhPjDuGFj64VIHx9+zCU2wcueLt/VjKG8qfbfFLkRYTVBlSF9032RO9G1HBh1dcA7OhMsuC//2ZWHZ6qzHc4hDz+GKun2/CSDllljAJmhBsItJCHEdAOnSKljyB8UFoi6KGGC8BuANanph1xLtxJQ4LTecfF6fe5qZh+wo7U6z0FEfUJBTeiosSMKvtzuiqkkkZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qezSWhI+vIIqlcOsVgRs306/jm1ivIoR5Jn5pb1EKJQ=;
 b=hrZxdG2f6QH0IFYyvvaXtqjrZsfFIrNh9sB1Uy1g5LhxOpqeUrbcCwqNt+XuZwkl5L3YdpuwPITvXSCiveEGyLvGHP7w9jW2UG0m2U0Ol+BwlQUeIbLmBvG5KSRd6wzZkN9eApQeb6+jTsEf9fJzq3FGrowZEbyPoiw9WBysL68=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <309bdbda-a720-4891-a082-ee749f4c9440@amd.com>
Date: Wed, 22 May 2024 15:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] xen/p2m: put reference for level 2 superpage
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
 <20240522075151.3373899-4-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240522075151.3373899-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|BL3PR12MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: d64b647f-d9aa-401a-e767-08dc7a616b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SVBPeU9tclNxcGVsMW95V0greXdiL1lmTEpPYVpJR0lvUFJuNEwvTlEyU0RL?=
 =?utf-8?B?aUZvQ2l1UVJJSUI5TG5Ec2dIQk9uL3o0TjNhcG1JNUYyamdnTmZ2K1hjTEwx?=
 =?utf-8?B?R1pkZHQwbVpURFQxT0h6amZXY3MvbmlkR0lwaWFjekJiQ1BuRjBEU3dmVVda?=
 =?utf-8?B?VXU0UUt3VDQyanJjWDRia00vSWw1MFNhMUZpSm9HUUVrUXBOdjhkaC9abTJz?=
 =?utf-8?B?MHBDY0RhbHdtVFE1UlUvOXAyRm9wd2lHYjhEQkZqVnBWYTRPKzFwaHZhVjR3?=
 =?utf-8?B?eUgxWkJmdWo5MVZURWF4MDMxbHpycTlLZzNKYTJXVDhVcjhYdVYrelF1RXhE?=
 =?utf-8?B?NUlVa1pYY2ZDN1doTzJ1QWcxazBYYytPTVg2Z2xWNXlRR2JvWVh4K0F4QXZx?=
 =?utf-8?B?TlpwUVhhSzBBT3J0OEo2Wmc5c0ZTdDZlbHlGa1dteWFjVC9SVlkwQUZZSlJk?=
 =?utf-8?B?T21YdnVyMEZoNmVPck5VTllJNlRiSnN2eDFTcVNDcElLM0dTSGFvb3l4MXlR?=
 =?utf-8?B?Rk5WdnNjRjB3VEljdkd5c0ZDdm1XNnZHR09UZE4zbVg2N3pQeWphQUVKc0xj?=
 =?utf-8?B?bUp3UTFzQ1pTY2ZyQUVLdHlIODg1K09tVzQ3M1VRcnV5UmgwZEQ5enB6K201?=
 =?utf-8?B?YlhNSFRkeEF1ei9ud3BrMEtLR3pMeVNNU29NTlR3c0JrQ0xENW9XbzdXUjFZ?=
 =?utf-8?B?SVd1WU1GRUowQXB5NEhjN3g5RHBSeVgzaGY2bmNYeEZFTHllY2NQOFZrSjlO?=
 =?utf-8?B?cnZ5cUswV0NCczd3NGkrQkNzTTdraExwNXVDbTM2S0ZyNndjMzRScjh5UjFv?=
 =?utf-8?B?clJPQkUyN09YaWJHL0daZzRJZUVaeVNBeFBYbzVPcktYUndUR0ZkM202dXh3?=
 =?utf-8?B?b2JYenBHdTFCNzdUTnBPYmVzNEZMa1NoblR4N2d5bkZmcUpyU0ErRVRCQ3Aw?=
 =?utf-8?B?Si9TQzhiSmMwemQrcWVndCtXSlRvMlBDeU12c2p1blRudTIyclY3a1krbE5a?=
 =?utf-8?B?MVVRZUdpU21EOUFtWVFCZE5oa3c1K2Uydm5BQXJpZTUxVklGLzlSaDR3ck9N?=
 =?utf-8?B?NWUyakpYQWdHak4weXlsbGJLZ0tRQ3h0aG85VmtRU1U0R0ZaQmlNZ0xjRFp2?=
 =?utf-8?B?VjAyYnF2SEF5dVpGbWt0WGhqelJOUm13VTl0YU9Za3hJSFVSM1VyS3pkSXRw?=
 =?utf-8?B?OUZHenZlaTVPaVpkMWliZnJNenU1cmFrQzNjeUNUT1NJWmhEbHZwR0llMW0r?=
 =?utf-8?B?cXRkNmJtQW5yVlpHMFN3V0p1ekw3TU9lUFBMZ0Z5dnJXWkprV0ZqS2Zsazht?=
 =?utf-8?B?eHZFU0gzYWFaRVBwN1FVSm12THgzREIvRlBQZmY3bGJ6TnBLVENYTHE3eU1C?=
 =?utf-8?B?RW02Ymc0dDM4UG8wOU80VFB5ZXNHUHZVRDJHZ3FyaVhJbXhIRHdrNUUrSy9z?=
 =?utf-8?B?U3JVWGgybGMwV2RIQTJjQkRtTmFuSDNNZ01vS2lkaHNVbWRtbzVWck5wOHI3?=
 =?utf-8?B?UE40S1dVSklVcm0xci8wRGJGbHhOTGRvN21qbzRDcnlHek9kbEhLYWRFZ3FZ?=
 =?utf-8?B?UXl6VXlCUndLdTJnelJYWDlvTjJtTzNKM2RXMmpxT1FOZGJzNEVuUlVRcTh5?=
 =?utf-8?B?SHc3MTV1T3F0ME1ESStnMEFJcGdKZnRONFA0cVk4a3hmbzBZY01LdUFjRDJ3?=
 =?utf-8?B?MjZSbnJLbUNOcVQvOTlpVS9IdGJqeFZuTnVldy85Z0IvMW1Ib2Noa0VtM0pk?=
 =?utf-8?B?NnhGM3VXN2t5aytQR2ZOREhGV2ZsWlMyS1VyTklIVm9NVEN6SjBURTV1d3hi?=
 =?utf-8?Q?oXj91unr1QsSknBGYJ2P1N6ksTrc06EOkJV0s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:16:41.3123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d64b647f-d9aa-401a-e767-08dc7a616b90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449

Hi Luca,

On 22/05/2024 09:51, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> We are doing foreign memory mapping for static shared memory, and
> there is a great possibility that it could be super mapped.
> But today, p2m_put_l3_page could not handle superpages.
> 
> This commits implements a new function p2m_put_l2_superpage to handle
> 2MB superpages, specifically for helping put extra references for
> foreign superpages.
> 
> Modify relinquish_p2m_mapping as well to take into account preemption
> when type is foreign memory and order is above 9 (2MB).
> 
> Currently 1GB superpages are not handled because Xen is not preemptible
> and therefore some work is needed to handle such superpages, for which
> at some point Xen might end up freeing memory and therefore for such a
> big mapping it could end up in a very long operation.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


