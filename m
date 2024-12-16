Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FAB9F33BD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 15:55:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858228.1270480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCUf-000412-9B; Mon, 16 Dec 2024 14:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858228.1270480; Mon, 16 Dec 2024 14:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCUf-0003zZ-62; Mon, 16 Dec 2024 14:54:45 +0000
Received: by outflank-mailman (input) for mailman id 858228;
 Mon, 16 Dec 2024 14:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/+0=TJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tNCUd-0003zT-Ng
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 14:54:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2418::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id addc9f98-bbbd-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 15:54:42 +0100 (CET)
Received: from BN9PR03CA0225.namprd03.prod.outlook.com (2603:10b6:408:f8::20)
 by SA0PR12MB4413.namprd12.prod.outlook.com (2603:10b6:806:9e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 14:54:38 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::94) by BN9PR03CA0225.outlook.office365.com
 (2603:10b6:408:f8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.18 via Frontend Transport; Mon,
 16 Dec 2024 14:54:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Mon, 16 Dec 2024 14:54:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Dec
 2024 08:54:37 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Dec 2024 08:54:35 -0600
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
X-Inumbo-ID: addc9f98-bbbd-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLwaWLyg4ubZ9GzuxPoGl02ZQ89wF1SYQ3weEAonkyKboamlFnGaG2bJFIuSf36/gvgvQcq+3xnX9d3+/JrF5hy7pQLGKyLEzj9wjzQOuY/rKxNLGdIkx7ZfRkGBnDsKOQj7f8VGrq08/wP2fhHACSnnrEifrbmXseDYz7nnckNc5pr4GUMgLB3iplSgpsYGI0D3LcVrqHAh5AFJBVx+plBFGIeFv6PfqOOevoF0Qn0ZBcFgX8iU1uZfbVLJjljiyV9YpyHPaWBvG/H6z5CjtrNaKr5WhRnM2+PJrnfkiX4jS8SgcOxrxd4Q8X74g0EiAzWZgt1r5ehWtzz9vhwXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jx4YTWH4aXYEjjuOnHuBsDma2MLcE157dQwiArtFHQ=;
 b=ePc+of7i31GAG9mHKKtnW1HkW6r5xJvgCvCgacX9SiHVHK7YsaLV8Vl/gRH5GEhvAZM4WEj06Fo+eyiNA9+WqFqBP+eoH5AP/YVMzTHnX/x+dFoMLrd7EUklVcnKGuTcp+dnisWPm7mvfvMUhJnsoCro/S2TfJglBr8x89AydUj0pxd/qmfToLj32+B6dRp7GmR+KQ5GCQFm3vW6jVK92b7r0V76c/MY/9VhMLa/0TnTHA2TMwwD5yPQl01cLoLGCKRVdhBUXa/YhTK0QUwRiI9Qvrs596Udr0V7JuGICkUpG5xBlwEA1oLItiKv4lA4Wol9V17k4tGC5un18ZjFwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=minervasys.tech smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jx4YTWH4aXYEjjuOnHuBsDma2MLcE157dQwiArtFHQ=;
 b=PLmZq+SaeSi4YwLK6mvif9LeWrflgVJtPPWlrTYkpZ0kDFirwVPGItADcDt910yde9PcydFG3cSEKgSbmZfgn9Yy6gyyh5FLZusCOY4MKOHrDGmdXDrRHuk+ynoigIko3CvC9kWAvD+EuxiDEk6D7IKvfy1Amdfp0H4/j9UznWU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b1832dcc-90af-40ff-88ad-4a98b8c41c5a@amd.com>
Date: Mon, 16 Dec 2024 15:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/12] xen/arm: add cache coloring support for Xen
 image
To: Carlo Nonato <carlo.nonato@minervasys.tech>
CC: <xen-devel@lists.xenproject.org>, <andrea.bastoni@minervasys.tech>,
	<marco.solieri@minervasys.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-13-carlo.nonato@minervasys.tech>
 <dbbc649f-b705-46b5-a071-760d688aa2cd@amd.com>
 <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <CAG+AhRWrXAYfKXXKfp6949vNMdGDy9qWOY11SKAigJuC8oUvDw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|SA0PR12MB4413:EE_
X-MS-Office365-Filtering-Correlation-Id: f39c6a76-1ecd-4ca8-114a-08dd1de19026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGdVemV6VGt5NWFFUmszNTVKY1IyY1J4MHZENmdkbXFMSUZHdUVsOXl1eVRD?=
 =?utf-8?B?Tk41cjZtQWxCTDRTclFDOWFzL29CblNKZE9TYWNZTGpScE9Tak9nek1mQ3dy?=
 =?utf-8?B?eW5haHVqVnF6eXNqb1l0dEt5c2VUVG9WQlJVb1A1cmZodU1heXJmeGRkeHZL?=
 =?utf-8?B?VW1ZL2dla0hJTm53VUhPdndWLzdGaldBdSsvTVZBTFFrWnVkbjVzUWFxL2RJ?=
 =?utf-8?B?RldmcnU2UHdzaldQa1NyUnNKemg0N1FDQU85UVIxKzdwZWZRbVFWWHd1Y0Zx?=
 =?utf-8?B?NjJkdzIxMkFxbHV1dVBHdDFqS1lTOXdZd0d3NUxxZ2FyTWE0cEJ0dkg5ZCtE?=
 =?utf-8?B?VWxKbnpCTlphLzVmYjRIb2xzMUNQSlVJbGR3ZC9LYlNzK01JMVJUc29HcWFw?=
 =?utf-8?B?OTFtaXkvdzNCd3YxUE4yUytycGtUVEtmTURlVU5GeUVhV1dUTFpUOVplSkdv?=
 =?utf-8?B?cEpITWhyK0lmeWcyR1FXR2ZDcmFDSXhhbFZoQUNJb0M1WjB6clA5b3NlZWJE?=
 =?utf-8?B?UkxHZ3c1SWNVb2xNcStKSU9kRGRWc0FSYmFPSjY0Nld4bXBPTSsxYTlSNGU5?=
 =?utf-8?B?SEhaNGpCVElWcmRndWF6OGQ5Ykg2Z2lrb1BDQ2phazRHTEg5QUV6dWErMjBZ?=
 =?utf-8?B?QVRCNUhiMnY3QmdwbmFKSmtFVWVzbHNHK3NYL3NkQ3djRXlVSFNTNFpvcEV1?=
 =?utf-8?B?Vkt4NDI1NFR0b3dxUEg4SnBFa09OY2ZHUWVQdk9RSnRNR1cxZk5lWDhwaUN1?=
 =?utf-8?B?bStoUnlzbHpaRW54UzU5RWJQYzM4c0VHcTl2RmV0RlBkZndEV0MzYzR6b3Nw?=
 =?utf-8?B?bk1KZjYyZTlPMTVjVGJkNUVQblBQYnJGdjlVam1nYWJqNTg1R2dib1F4WERM?=
 =?utf-8?B?RzVORklpdDg2eFcxVEZURGNvc1c3YmRJcE1CUitqeDVDUzk1aXZjZzlNTGRJ?=
 =?utf-8?B?d1M2akxaT00ybXVqcmUrLzYrTHJJZmo0QlNiVTNBcTJsOWZyOWZZSldjNzVZ?=
 =?utf-8?B?MXRIcytyRkt5eG40RTR0V3M5S2NaM1NXT3ovMlRzSjlKaUQrbjhpb1czK2g4?=
 =?utf-8?B?bkhGN2QrbjY5R1BwNWNVb09uYXlUWm1jVEdrR2RTQ3VFMFdodGU4OUtydXlp?=
 =?utf-8?B?M0xUeFFxSFF4ZGU5cHBKRnhLY1V5RWZwYmhkQkVBY21WVktGbTRtVDREOGxG?=
 =?utf-8?B?VSswNEpGQjcvbWJ1NUFzTkRpcUVXREJBb28zT3p4dXB3cEYxa0ZYMDNid29P?=
 =?utf-8?B?RnhDQkpOUHFMVW82NTl0cmg5cENHUDlWVC8zeUMyZSs5LzZxK2ZMOGJtbWJE?=
 =?utf-8?B?VWxRbUhOQU4yN2t0NmQwK2lJS1VTU0llZUxJL3d3QUFVSkErbndQQnhONlVY?=
 =?utf-8?B?UmhqL0ZOREltOTQwbnUzeFlmU1VTUzBsT010K28vWklOdHFoSEFLMFlvT1A2?=
 =?utf-8?B?QmlXb1FEdm5tcVY1eWVrdWE3aFdQNmoxYkwxTWFFejc4bW96cHExWGNJNDJJ?=
 =?utf-8?B?UmR1RVFQZzY0V2VxVW81aGNTVTZkNVpOR3NLLys3VDczaHM0N04xRTNNMEc1?=
 =?utf-8?B?N01yTmk5M094VUhMcmd3aEhURHJlTjJiVUdmelkrTi9GdERQcWxVVVp3NVAv?=
 =?utf-8?B?T0NqUDVhMHFreFBhNHRzdGRWK1RVVldKbExBUlU3R0J1blliQ1A3ZTJsOXR6?=
 =?utf-8?B?SDVBdVQ1YXdUUkgyNmZpcnhqOWp5Myt3aVdvMUpOQ28rNW9RUEhjOXM0L1BI?=
 =?utf-8?B?R1J3bTJlVFovSXh2VEs1RHRzSU4zNFNrWXhaODlCM1pJU1hlV3hoc2lCWlB0?=
 =?utf-8?B?dDV1cDFXMkFXWEhYejFIbkNCeXE1Zkt2T1d0clo4S2tMZjkrZlpDcTkrZTBh?=
 =?utf-8?B?QWxFeE5HSTl0MGZWZ3F6TXNiMXF3UnVsQmR2eWJjWHhsMlF6T08wcVhBZDNH?=
 =?utf-8?B?eWtMeWdjT2czdnlGMTRGcVNzdWdqcVZjWmpGa0g3c1lSVm5kbnZKRjdXYUYw?=
 =?utf-8?Q?TK6RrW8Eb08+4wE0yijPu4LvuftuF4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 14:54:37.8956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f39c6a76-1ecd-4ca8-114a-08dd1de19026
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4413



On 16/12/2024 15:28, Carlo Nonato wrote:
> 
> 
> Hi Michal,
> 
> On Mon, Dec 16, 2024 at 2:56 PM Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> On 13/12/2024 17:28, Carlo Nonato wrote:
>>>
>>> Xen image is relocated to a new colored physical space. Some relocation
>>> functionalities must be brought back:
>>> - the virtual address of the new space is taken from 0c18fb76323b
>>>   ("xen/arm: Remove unused BOOT_RELOC_VIRT_START").
>>> - relocate_xen() and get_xen_paddr() are taken from f60658c6ae47
>>>   ("xen/arm: Stop relocating Xen").
>>>
>>> setup_pagetables() must be adapted for coloring and for relocation. Runtime
>>> page tables are used to map the colored space, but they are also linked in
>>> boot tables so that the new space is temporarily available for relocation.
>>> This implies that Xen protection must happen after the copy.
>>>
>>> Finally, since the alternative framework needs to remap the Xen text and
>>> inittext sections, this operation must be done in a coloring-aware way.
>>> The function xen_remap_colored() is introduced for that.
>>>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com> # common

[...]

>> Also, this function is only executed in case of LLC coloring, so shouldn't it
>> be #ifdef protected.
> 
> Here and in other places (patch #8) I'm relying on DCE to remove functions
> that are not called. This was a suggestion from Jan in that patch. Can we
> adopt the same here?
Yes, we can.

~Michal


