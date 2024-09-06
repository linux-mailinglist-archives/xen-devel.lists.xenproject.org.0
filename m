Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9096F0C1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:01:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791656.1201590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smVmF-00022l-Jb; Fri, 06 Sep 2024 10:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791656.1201590; Fri, 06 Sep 2024 10:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smVmF-0001zw-GC; Fri, 06 Sep 2024 10:01:15 +0000
Received: by outflank-mailman (input) for mailman id 791656;
 Fri, 06 Sep 2024 10:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxVg=QE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1smVmE-0001wy-O0
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 10:01:14 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20603.outbound.protection.outlook.com
 [2a01:111:f403:2407::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1e0c1c8-6c36-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 12:01:12 +0200 (CEST)
Received: from MW4PR04CA0057.namprd04.prod.outlook.com (2603:10b6:303:6a::32)
 by IA1PR12MB8237.namprd12.prod.outlook.com (2603:10b6:208:3f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 10:01:06 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:303:6a:cafe::8e) by MW4PR04CA0057.outlook.office365.com
 (2603:10b6:303:6a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Fri, 6 Sep 2024 10:01:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 10:01:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 05:01:04 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Sep 2024 05:01:02 -0500
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
X-Inumbo-ID: f1e0c1c8-6c36-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szFT9m3phbYjWwXnkkC1fOahHunCpHFXczZ8PGvs7KAsqX4f6RJAtutMzXO4/q6R6FSOgazOQX0kuF3JUGelxpyhgpXClZ4ASAKobGmuy4oshoSeRdOgC5TO5sWqxAplDI7bdkdjos2Ie/1KR3prKoHsKgdUzpdQPQkCr34TJ6wgGvcD43fjsK13sBGYrLVBVraQ0FWsWL7UjLGb+iNaSul5LYudkW9+M0JEviBk2A4BU965hNH4KT9OblP+RwmNHpoiBI74HrSTrshojBIkRxhm7X2NrsdCcMDk0ypipJaEFdNUfyBzGVB7iUJKHeuTo6w9MKnQmxag6bZwBQ6mFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf9ru7ndxOoW1VuxPaz2CQj5p7ZktcZCh6eiMHi2GK8=;
 b=ABg2esDwTz005C51D1f7TPMvJPQhEv09pYLRFyudRtCiEd6A9M7DUfvzb1AM1WQSxHCLv7quL1lacLd+CEgQRPxJvdlBpQbtw1zlIJXmZhQdpCNJA9gPCRLCn0Az8QRVAThCfYoIryxvZLjoTIUqQ2MPNBBDaox0bjQTdQMcyE8RweDn56pG6VL7GMd/O+ObNWM2Wch1lArE/2zx3sBhdA9cSH4jy2W2vyZofKy1xeXGL8hBi9NePsQnAtEJerrIkaU0S02phKveiJ2coKNrE+9ftTuk0LF3bBxSqKgUP4wxC7cTTHO+PxD+B7ZXmir2Gf+5NKXJ354Q/4mn+xFsKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf9ru7ndxOoW1VuxPaz2CQj5p7ZktcZCh6eiMHi2GK8=;
 b=ebRQmxItaLv9Gg/kO8guEUwBr7FL7JYsJhem5UJWCjHG+v39D8aHOQc1XO7P7LGxY2sgi8CcUgzBKyD1lsmJBrNKEnFuQzQfHMCsk4w76iunWEt5txjs3GKnWU3ruOL/mjbUHXbSwXVVhUMIul3UOueLnz/2VBnX3LZzepJDrCk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8a4d759b-07b7-4b96-8866-3c9e8b8351cd@amd.com>
Date: Fri, 6 Sep 2024 12:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for emulated uart
To: Bertrand Marquis <Bertrand.Marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Artem Mygaiev <artem_mygaiev@epam.com>, "Hisao
 Munakata" <hisao.munakata.vt@renesas.com>
References: <20240829133314.4042845-1-ayan.kumar.halder@amd.com>
 <D326B71D-283C-4CEB-9C52-23CE42683284@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <D326B71D-283C-4CEB-9C52-23CE42683284@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|IA1PR12MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4c521a-415f-4532-e3f4-08dcce5ad2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnB1R0x3Rk9iT3Z1S29wN3pSVTM5STM3NUJNMFg5ZEdvbDN6V2p6OG12dldI?=
 =?utf-8?B?ZlQ3Nm5rUEZiVGNtZmMxcHdnZGg5OWNMMlJsT1FTM0RZYXJHNkJTdmtDK0p5?=
 =?utf-8?B?LzQxZ2lvaStFcmx4SlJtVUlFemh5YWlaVVBiREJtYTlUTDE1NWNCQVhCWUIr?=
 =?utf-8?B?YVU1MVF5SGViU01qVExrRVhhQkw3VzF6cWtLeWxmSm1rcHZqN2szbWo0amFD?=
 =?utf-8?B?aFhXQnc5VDB2V1ZCSDM0elF0V1Izcm9qZXVmNXpuYWlaYmk5YkdnQU55RHdi?=
 =?utf-8?B?TjBycDNld0ZDMnRoblo0dE94ZFpHUUpWdlU4M2Y0a3ZvVmM5TVhkSnBlWDA3?=
 =?utf-8?B?Mk1CdFlVTGhDSVZRRGd5cnF3KzIyV050MkZBa2FNcEdncGRRTDJ2RlVObWlO?=
 =?utf-8?B?ZmhlT2N3ZDEzVHRVbFRqNTlnUVM0VkZYTXA1ZlljMXRzNmVtRmZCLzROK1dQ?=
 =?utf-8?B?VnBjeTNrSnhRam82eHdhMW9JV2pZZWRYVS94Y1N1bEJMdXNJWlA0aVpmbnBz?=
 =?utf-8?B?RytiVUNEN2t3eVlwc2VNcnMwYzJ1WkdsNW5IUEc3SWZtYUJXZGN5cVFrNyto?=
 =?utf-8?B?QmdHOFdFdmNNSGx3MENrWUxMUXJCQWxmUlVBanFvTVZMWDBkUkczMDVQTmk0?=
 =?utf-8?B?K1hjV0ZIT0FBcng2QU96M1hKdHFNZDNSbU1ObFVKVmxlOWhFWTZIdU9zL2pl?=
 =?utf-8?B?dDdjdWdQSmszUXZsTk9GRE5QcTJsUE5lVk9BQ1FtQzZKTTlBRXYvd0UvNFpk?=
 =?utf-8?B?ZlQyalMyVnV5aWJibzgzVU44ZlJGNGtxQjU0Rlptbm53M1RScGUvc3RLeVhP?=
 =?utf-8?B?cjhmWm9xcDhMY0tKekFqdTQrVUg5VUZZRGJtenAwNVhPbUxFMlJMeTIzOUM5?=
 =?utf-8?B?S3NTODUwa1ZvVmZwZEhvaVJBNS96amR5VFpWeURqM1hQVTlQcEpVOThPWXNx?=
 =?utf-8?B?UHVRdUJJRlA4SG13a3FRa20rY2JhcHNaQk9sVDlNemtuTDB3UXNoRFhyVm9s?=
 =?utf-8?B?MlFhQTlnRDE2dFNwTmcwL0N4NkxZTVNyZ09sVmJ0NVBzYnpnYldOWElRWFlC?=
 =?utf-8?B?b1pTcU5jWFNGVmN6UHdJbHFRbURZaDFBbERTdFVOcmQxYWYwMDVPcUVONDZz?=
 =?utf-8?B?blEwaGF2ODlTK3FkLzM0K0ltMHBoWG52UCtMa3lHTW5JS016eDJMWEh2V1My?=
 =?utf-8?B?dWlNaDR2cmNMcldFTjAxUVZNRUU2N1hEUHJXTjdzekNOUUMyM0RkWVpxdlVh?=
 =?utf-8?B?dGVUUm1oYjhBNEk5dFFhR29uSWF0TEhBcyt6Y0h1TzJEZCt4UlJmdXpPeTZv?=
 =?utf-8?B?cUE0NmtQWFp2V1RkOHZleU9WN2ZYM01yY0JkVDRoSDB4a1Q4VHNmL0FWbUhm?=
 =?utf-8?B?WnNEU3RuendmNDJPanFReGlvckw2M0ZaSkFqeUNqNVR0VXdUV0dSN1F4bVhh?=
 =?utf-8?B?UkN4K241eUxVeGhsdFFPZ2t6RWVnMFROaFZkSXIxQXZwZEpZMHR6V0lFZURQ?=
 =?utf-8?B?VzhzVmlkZktTbmRCYk11ajVRem52NloxR09GeHpZdXoxQTFsL3pJdDRIZ1N4?=
 =?utf-8?B?d28wUkxlSVppK1gzVDdBS0w1WlR3MGs5M3R6V2I1TktHYUFhSWlQVE92UnU0?=
 =?utf-8?B?UVgzekNTTkk0OHk3ZDIvTlQ3VmREOC85QVZDaDdBSitnWUk1N2NNR05kSC9v?=
 =?utf-8?B?bTRNOXpBdmdOUEtabGduOXRkVzNTb2xYay9OZHBvNXJYendpZE9keCtEUThU?=
 =?utf-8?B?RXZ5azFERVNmaEVpVEVUNnh4eXQ4aU9xUld3N0l0cUNkZ3Npb1p1UTRMV3Ar?=
 =?utf-8?B?WlpteEUyZDJJQXpPQ3ZCR3RsSGxkMkpRYzZFdzZyM29Kd29VV3dIWVQvSU1L?=
 =?utf-8?B?TTVzWVVsOU93MU5OM0Y3VG1TZWkwVHlFMExqbnYrTHN1REh6eDZvYThpemhz?=
 =?utf-8?Q?BQkPvr+sQe1J+yRPn4a4YBLH1q4ocvXN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 10:01:05.6047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4c521a-415f-4532-e3f4-08dcce5ad2ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8237

Hi Bertrand,

On 06/09/2024 09:56, Bertrand Marquis wrote:
> 
> 
> Hi,
> 
>> On 29 Aug 2024, at 15:33, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> Add the requirements for emulated SBSA UART.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> .../fusa/reqs/design-reqs/arm64/sbsa-uart.rst | 224 ++++++++++++++++++
>> docs/fusa/reqs/market-reqs/reqs.rst           |  31 +++
>> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  21 ++
>> 3 files changed, 276 insertions(+)
>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
>> new file mode 100644
>> index 0000000000..aac3facce6
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
>> @@ -0,0 +1,224 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +SBSA UART
>> +=========
>> +
>> +The following are the requirements related to SBSA UART [1] emulated and
>> +exposed by Xen to Arm64 domains.
>> +
>> +Probe the UART device tree node from a domain
>> +---------------------------------------------
>> +
>> +`XenSwdgn~arm64_uart_probe_dt~1`
>> +
>> +Description:
>> +Xen shall generate a device tree node for the SBSA UART (in accordance to Arm
>> +SBSA UART device tree binding [2]) in the domain device tree.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +Domains can detect the presence of the SBSA UART device tree node.
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Transmit data in software polling mode
>> +--------------------------------------
>> +
>> +`XenSwdgn~arm64_uart_transmit_data_poll_mode~1`
>> +
>> +Description:
>> +Xen shall enable transmission of data in polling mode for domains.
> 
> I would use support instead of enable here and remove "for domains" as it is implicit.
> This corresponds to the view of features from the guest side of things and enable tends
> to make the reader think that this relates to something to enable in hardware.
I agree. Support reads better and we don't need "for domains"

> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Transmit data in interrupt driven mode
>> +--------------------------------------
>> +
>> +`XenSwdgn~arm64_uart_transmit_data_interrupt_mode~1`
>> +
>> +Description:
>> +Xen shall enable transmission of data in interrupt driven mode for domains.
> 
> Ditto
> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Receive data in software polling mode
>> +-------------------------------------
>> +
>> +`XenSwdgn~arm64_uart_receive_data_polling_mode~1`
>> +
>> +Description:
>> +Xen shall enable reception of data in polling mode for domains.
> 
> Ditto
> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Receive data in interrupt driven mode
>> +-------------------------------------
>> +
>> +`XenSwdgn~arm64_uart_receive_data_interrupt_mode~1`
>> +
>> +Description:
>> +Xen shall enable reception of data in interrupt driven mode for domains.
> 
> Ditto
> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Access UART data register
>> +-------------------------
>> +
>> +`XenSwdgn~arm64_uart_access_data_register~1`
>> +
>> +Description:
>> +Xen shall expose the UARTDR register to the domains.
> 
> I am wondering a bit if exposing is right here. You do not
> expose the hardware register, you emulate the register to
> provide the functionalities equivalent to the hardware.
> 
> Maybe something like:
> Xen shall emulate the UARTDR register to the domains to
> provide the same features than the real SBSA register.
I think, the following would be enough:
"Xen shall emulate the UARTDR register"

As you wrote above, we don't need to mention "for domains" and providing the same features
as the real SBSA is implicit. If the emulation behavior differ from spec, we would need to mention
it in the safety user manual/arch spec doc.

> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Access UART receive status register
>> +-----------------------------------
>> +
>> +`XenSwdgn~arm64_uart_access_receive_status_register~1`
>> +
>> +Description:
>> +Xen shall expose the UARTRSR register to the domains.
> DItto
> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Access UART flag register
>> +-------------------------
>> +
>> +`XenSwdgn~arm64_uart_access_flag_register~1`
>> +
>> +Description:
>> +Xen shall expose the UARTFR register to the domains.
> Dittor
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Access UART mask set/clear register
>> +-----------------------------------
>> +
>> +`XenSwdgn~arm64_uart_access_mask_register~1`
>> +
>> +Description:
>> +Xen shall expose the UARTIMSC register to the domains.
> Ditto
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Access UART raw interrupt status register
>> +-----------------------------------------
>> +
>> +`XenSwdgn~arm64_uart_access_raw_interrupt_status_register~1`
>> +
>> +Description:
>> +Xen shall expose the UARTRIS register to the domains.
> Ditto
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Access UART masked interrupt status register
>> +--------------------------------------------
>> +
>> +`XenSwdgn~arm64_uart_access_mask_irq_status_register~1`
>> +
>> +Description:
>> +Xen shall expose the UARTMIS register to the domains.
> Ditto
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Access UART interrupt clear register
>> +------------------------------------
>> +
>> +`XenSwdgn~arm64_uart_access_irq_clear_register~1`
>> +
>> +Description:
>> +Xen shall expose the UARTICR register to the domains.
> Ditto
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Receive UART TX interrupt
>> +-------------------------
>> +
>> +`XenSwdgn~arm64_uart_receive_tx_irq~1`
>> +
>> +Description:
>> +Xen shall generate UART TX interrupt when the UART transmit interrupt condition
>> +is met.
> 
> Correct me if I'm wrong but there is one interrupt generated and then a status register
> in which you get what was the reason ?
> Here I would make it more generic and point to SBSA behaviour and let the details
> to the design reqs.
We need to mention that Xen shall generate UART IRQ when transmit/receive interrupt condition is met.
I think we can leave these 2 reqs as they are but s/UART {TX,RX} interrupt/UART interrupt/

> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +Receive UART RX interrupt reception
>> +-----------------------------------
>> +
>> +`XenSwdgn~arm64_uart_receive_rx_irq~1`
>> +
>> +Description:
>> +Xen shall generate UART RX interrupt when the UART receive interrupt condition
>> +is met.
> 
> DItto
> 
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~emulated_uart~1`
>> +
>> +[1] Arm Base System Architecture, chapter B
>> +[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
>> \ No newline at end of file
>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
>> index 9c98c84a9a..b69699e5fb 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -15,6 +15,22 @@ Rationale:
>>
>> Comments:
>>
>> +Needs:
>> + - XenProd
>> +
>> +Run virtualization unaware VMs
>> +------------------------------
>> +
>> +`XenMkt~run_virtualization_unaware_vms~1`
>> +
>> +Description:
>> +Xen shall run VMs which haven't been modified for Xen.
> 
> As discussed during Fusa meeting, shall be removed.
> 
>> +
>> +Rationale:
>> +Any kernel/RTOS can run as a VM on top of Xen.
>> +
>> +Comments:
>> +
>> Needs:
>>  - XenProd
>>
>> @@ -32,3 +48,18 @@ Comments:
>>
>> Needs:
>>  - XenProd
>> +
>> +Provide console to the VMs
>> +--------------------------
>> +
>> +`XenMkt~provide_console_vms~1`
>> +
>> +Description:
>> +Xen shall provide a console to a VM.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Needs:
>> + - XenProd
>> \ No newline at end of file
>> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> index 7aa3eeab6a..e90f275148 100644
>> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> @@ -17,7 +17,28 @@ Comments:
>>
>> Covers:
>>  - `XenMkt~run_arm64_vms~1`
>> + - `XenMkt~run_virtualization_unaware_vms~1`
>>  - `XenMkt~provide_timer_vms~1`
>>
>> Needs:
>>  - XenSwdgn
>> +
>> +Emulated UART
>> +-------------
>> +
>> +`XenProd~emulated_uart~1`
>> +
>> +Description:
>> +Xen shall grant access to "Arm SBSA UART" for the domains.
> 
> We do not grant access to the real hardware here, the sentence is misleading.
> 
> Xen shall provide an Arm SBSA UART compliant device to the domains ?
I agree.

~Michal

