Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39EA9B9C9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 23:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966911.1356961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u83yx-0001j6-JW; Thu, 24 Apr 2025 21:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966911.1356961; Thu, 24 Apr 2025 21:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u83yx-0001gy-Gp; Thu, 24 Apr 2025 21:19:43 +0000
Received: by outflank-mailman (input) for mailman id 966911;
 Thu, 24 Apr 2025 21:19:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s25R=XK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u83yw-0001gs-6x
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 21:19:42 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2416::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3ce8b01-2151-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 23:19:39 +0200 (CEST)
Received: from MN2PR01CA0061.prod.exchangelabs.com (2603:10b6:208:23f::30) by
 DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.24; Thu, 24 Apr 2025 21:19:33 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::7d) by MN2PR01CA0061.outlook.office365.com
 (2603:10b6:208:23f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 21:19:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 21:19:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 16:19:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 16:19:32 -0500
Received: from [172.21.185.2] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 16:19:30 -0500
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
X-Inumbo-ID: d3ce8b01-2151-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UENmW8cwfIPIEJJz/UYVMKoDdK7YgINTXU58Xt6XWzZC/xyGXj02DM9a2cbBGbXeApMKZ26ZlaTDDa8zl+MgkfXzCgnUVTq8zb+3oCTRGxX+GnG3AV5ntd/tUu0k4OQGmPpAeJTtLWJNEa0FhJM5H85TiDpTZtsI9hzEt3TjMjgv3t3PnZXhVc9X9F7z2vRsEeQoTNGOJDMZsn38o0RWvEiLQqo08HylWyp4kotsW2zMd1zTi4Y5dmAntfWKcoSU3J82yydxgxMVkrskoKtfshsJBz9K+XtxuPAUJsW6u3LDvIf1gmg72rbKlCWlVoqCfbHlXPyll6KDzz6qG4DpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XObGseISFbDn3fLKRyp6gaJLyL8FnL/Cemzvlv9SZYU=;
 b=F/rQX1LQQjmUFtTG6xmsXSut1s7NxGWyQwkwzYavAASUv/O7hroScMrjfonhVC1wP3pdG+icHMMc7qRnZbF2xVboVno3NH3JM8Q2TBO7NXTmI+J9Y0c5N9TDRgrl5fhlh/YVrbOdgBv/rM79YjRVj4Mo0u1YVV/YVgFC1n4Nt/mw059yzHvQpijf93LbzcOs5RawZ8m/q5DH+CwrWqxudrgW+cwjtwWJ83woFJu6ffyJpfp2brGI0TfAofloGO+vnyr1iEe7QCnRkTrnV84BFyA9SZwv/yCRnj1zC02DwSrwDPQAfCf8auW/cUPiF9A32SAv6kU4j3khizNW+pb9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XObGseISFbDn3fLKRyp6gaJLyL8FnL/Cemzvlv9SZYU=;
 b=kbUwB47JZBBwqi6yJEGEewspuv0vz+vs6W+6+Iej2CswTKHR3RS84/U5VlBPfXT2pzYWni2BWDXipk9eq2TVhJDLy5j9yiLZY9jn8CNrmQISLkyuAMzv1I8wRD94kJcWynfXzYv/MCTTh6268rWinDCZhD5t3U1piyc2E4G6M0k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <775d3ac0-8f43-415a-a32d-14377092b96b@amd.com>
Date: Thu, 24 Apr 2025 17:19:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
CC: "Lira, Victor M" <VictorM.Lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	<Xenia.Ragiadakou@amd.com>, <Alejandro.GarciaVallejo@amd.com>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan> <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan> <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
 <Z_zGdE91KwlYxu_A@macbook.lan> <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
 <aAnvRMgJxAskbCtE@macbook.lan> <aAoPNTsLjMMfsHvJ@mail-itl>
 <aAoW-kvpsWuPJwrC@macbook.lan>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aAoW-kvpsWuPJwrC@macbook.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|DM4PR12MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: bd70f95d-41ed-4948-0f0d-08dd8375b55c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXpDb3VXRzAvUzd0a1d3Zk02MVFRb1MxRWlqKytabVgzWlM5Tm5yeWZCSFZy?=
 =?utf-8?B?bmd0Tkc2bzhhdXlsZVVIcVJ5eEk3MWlsSENoTHM1NlRielBuU2JFblNEVVZk?=
 =?utf-8?B?ODRRZk1xUjJnS1orSkp5UFFpdG9QbjdUcGgybzZnRitlMElZNzFuclVuNTlX?=
 =?utf-8?B?V2dyZ0d2RmN3TTByQk4rV3ZNSCtvMGdZMGEzMVZNNS9uVU9sWUQ1Nm16OW9h?=
 =?utf-8?B?N3luUnNXS0hHL3g2bTJYT3J5bTBqMExuaXpmU0hFN1NNWWdRcWtvc1grRzB2?=
 =?utf-8?B?UkpBRkdzWTRuRTJRaUduZXN4V2tnTVdEQWJSV0VMVkdEcFpwVnQzcDNoN0xQ?=
 =?utf-8?B?UnNnc0dpSWx0MHlxWmtTRUNvZzhDcllkUVBzSzRPa0lWSDhnMktINXNrRzFy?=
 =?utf-8?B?cDkvcFh2Ti96dVdjQk82MUx6T0kzV09zS1h1OTN4SEhsakcvaEdxVjdERzlJ?=
 =?utf-8?B?dkVyTjJ0OGJsRzJCeTVtbFNQbVBiQjByQ3F3dStKdzJlaXVjYkRKajBPb1Z5?=
 =?utf-8?B?SHNtdzd6ZVFpS3NsTzdWMm90RCtqN1pESEJ5bEk2azRUOEhDY2pXa1UzUWoz?=
 =?utf-8?B?RmVDMnMxOHJYcVpBMWljU05kRzRURmNzenRqZUJCZGJBcStBVlFiVlBvM1kx?=
 =?utf-8?B?Q3pLaGtRL1luYUlnMWNEcTJWU3E2SkpmYURsOUNFaHJDQ29JamFUNFNqMUdY?=
 =?utf-8?B?Ym9rbXlKVFdwYXQ5R1hRSUJybmNtelRldkhrcmJBdEE1UnpPbGZiNHRBTlZz?=
 =?utf-8?B?STBER09NL0pOMDBjb1VtMktOb2NydEJlZXE4ckFSbTZ4NCsrUjhVWTB6R0t6?=
 =?utf-8?B?VnRKR2h1aGl5VlpDK3ZOUExHS2hJUHQvTHpIbmszdzl6cWpWUG1ucHBrMmtD?=
 =?utf-8?B?LzlBMDdWaGJDUFJmMVpncDQyQ1dGenNEVUl5bkFVUGlxKzU4aE5HR2cvdGhG?=
 =?utf-8?B?M3JjeFlDckVoWkZuc0F4ZWRxcXRBRjU3bkZKcWFrVW1CNGxHWElkNG8yOWFo?=
 =?utf-8?B?NjRCYmNtOUtHN09aMWk4MmI2L2ljUCtDeDZLNHcvNVoxaG9ZaTZGdW0wSmxw?=
 =?utf-8?B?NmdrbkVSTnBtd09GS3lSM2FZaTl3RVZPUE53Zm9UdGtXeVgyY2lIamFUSEJw?=
 =?utf-8?B?R3JvUyt6d3BTMkdoYkxJbXFCTjRESjZpcmkzek8wdG8zRUgyMDVUNzVtQ1ZH?=
 =?utf-8?B?US9HTnJsUEdJeWRGQzBzem1UbW02OTVyWktyZ2lMekJoNk96b3ZrNlZXaEhG?=
 =?utf-8?B?S3pyR2cwanR5VS9kSkpuaW16QTJoSVg0ZWlQOGZIaTRNZ2J2bFJ1YzRuR0lx?=
 =?utf-8?B?Q1BsZFg4L3pOcm55a2R4SUtTclU1NWwyQWt0dHI0a2xCR2VqL2ZFYnNTQ0J0?=
 =?utf-8?B?eVUxekVwSFVMWmNPTFYzTEY3TWVGai94bFowR3JhdExleGpDb2V1ZklQaGxL?=
 =?utf-8?B?WTBVVHR0MG9EV1h6WjhNUS95enpmNFNkQzdNS0tmc1MxUlVxVUtxOHYyenVN?=
 =?utf-8?B?WU1PU283UkRsbzA5V0hPVXY5Y1RYR3dUbURMemM5ckhpWk8vNkJqYzgvT2k5?=
 =?utf-8?B?TENFeE1lUU5lVlNxWDhDY2g5aC9sKzVNSVpBbHYySzVGRDUrbkt5RkdjeXFq?=
 =?utf-8?B?Mkw4ZlRGNDNlUFE3bHEzamJmbFV0KytLNS9oeFZwZmpmczRMV1Q4d0hnSzhV?=
 =?utf-8?B?NWtLL2NYZzlRUk5ENmRZNCtmWE9pT0Fnd1JKQjdTZWM4YXJ3NWJBOWxkNzJP?=
 =?utf-8?B?aklsZVFndTQ0ZWhkVDRwckJ4ckVsZjdGZlBuQXdna2w4ZGhQODNFZE5jdEJy?=
 =?utf-8?B?SGNuSnJDL3BBcXhLRTd2RlVVVTdaanBYa2V5UTBSRkQrQkt6dXBWS2I3aldq?=
 =?utf-8?B?cTNRNWRGNUF3MmNSRFBWTTlwcTBKSHRYanZUN3BJWDRoT1IwL05hbHlqMVNZ?=
 =?utf-8?B?NUFxNzUzTEtJVzA5T1FKeUsxa1gwTVpKbDF3Uk11ZzdXcjdPKytmVWs4bUFk?=
 =?utf-8?B?N2pmMEVwdlI4WFR1OTVSQWY4ckNyTHBxUzJkMzUrclFwbktRYWlNUENOR2x6?=
 =?utf-8?Q?UKjSln?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 21:19:33.3131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd70f95d-41ed-4948-0f0d-08dd8375b55c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590

On 2025-04-24 06:48, Roger Pau Monné wrote:
> On Thu, Apr 24, 2025 at 12:15:17PM +0200, Marek Marczykowski-Górecki wrote:
>> On Thu, Apr 24, 2025 at 09:59:00AM +0200, Roger Pau Monné wrote:
>>> On Wed, Apr 23, 2025 at 04:51:16PM -0700, Lira, Victor M wrote:
>>>> [    4.570354] Intel(R) 2.5G Ethernet Linux Driver
>>>>
>>>> [    4.579535] Copyright(c) 2018 Intel Corporation.
>>>>
>>>> [    4.588898] sky2: driver version 1.30
>>>>
>>>> (XEN) [   21.644361] d0v3 unable to fixup memory read from 0xfe91000c size 4: -1
>>>
>>> This fault is unexpected, according to the identity mappings done at
>>> domain build time:
>>>
>>> d0: identity mappings for IOMMU:
>>>   [00000000a0, 00000000ff] RW
>>>   [0000009bff, 0000009fff] RW
>>>   [00000cabc9, 00000cc14c] RW
>>>   [00000cc389, 00000cc389] RW
>>>   [00000cc70a, 00000cd1fe] RW
>>>   [00000ce000, 00000cffff] RW
>>>   [00000fd000, 00000fd2ff] RW
>>>
>>> The page at 0xfe910 should be covered by the last range above.  I
>>> think we have a bug somewhere that unexpectedly unmaps that address.
>>
>> You sure? 0xfe910 is outside of [00000fd000, 00000fd2ff].
> 
> Oh, did and off-by-one when copying, it should have been:
> 
> d0: identity mappings for IOMMU:
>   [00000000a0, 00000000ff] RW
>   [0000009bff, 0000009fff] RW
>   [00000cabc9, 00000cc14c] RW
>   [00000cc389, 00000cc389] RW
>   [00000cc70a, 00000cd1fe] RW	
>   [00000ce000, 00000cffff] RW
>   [00000fd000, 00000fd2ff] RW
>   [00000fd304, 00000febff] RW
> 
> Where 0xfe910 is covered by the last range.

This looks like it's okay.  You think the somehow the device ranges are 
unmapped?

I thought the immediate issue is that the e820 marks these addresses 
reserved.  That leads to pci_check_bars()->is_memory_hole() returning 
false.  Stefano's original patch just returned true for non-RAM memory 
regions and the device worked.  That would leave bar->mem rangeset 
empty, IIUC.  Not sure how that would remove mappings though.

That also changes the setting of bar->enabled, but I don't immediately 
see how that affects mappings.

Regards,
Jason

