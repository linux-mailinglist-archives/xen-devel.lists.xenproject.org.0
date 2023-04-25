Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8BE6EDE77
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 10:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525901.817421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEKc-00005W-2g; Tue, 25 Apr 2023 08:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525901.817421; Tue, 25 Apr 2023 08:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEKb-0008VD-W8; Tue, 25 Apr 2023 08:47:25 +0000
Received: by outflank-mailman (input) for mailman id 525901;
 Tue, 25 Apr 2023 08:47:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prEKb-0008V7-DF
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 08:47:25 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cba86e65-e345-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 10:47:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 08:47:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 08:47:18 +0000
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
X-Inumbo-ID: cba86e65-e345-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEMvFQgCXLCKxepuJhgbqhycbVqswZtWUGmxPApDpetL4mxdtrhCjOSRcwITZSSDmccUXLABBGEBunkwmiv/ZFQ+hyq6bpVVrIzwoK5zw0mbpCH0ppwTsqhKNXD3zchZr/c/ePXoTCzylP3nFVChmRNhY9fE7bB2gXv0d8dpdmWs5VNrqxaectV2V8fBKdLBzSTyct1uiOnxaQdFaxOcSNi8H7zn0E55fit/oB/mOj/ryLMs/rhv3fsFlVElytw/53d4UFj7w9R13x/tbB+qRjNG8+vycyGMZ2TZ215UsQlgqL6O4nKhyFxuxP/wneDEtB35iIsruxfTIG5POYirKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEVbymheg/pi0H18lPXe04kKTgelT+WrQ6x2GWgpn9I=;
 b=B9+kgu0oSLcNrIoIQywCf5pe2LBub97KciVvC6/lAOqQUOeKiwJD5lI9w/KQe/ikT/cvf1EqL33Ae+XzuhDNWtzTLev/EeIl5GXMbCYf47y3u2v3WE2C0a5rZ+SX+fMJyVgJJR/fl81DeFgVnI3UK6L0Sf0GkKjqAo7AIA7kaYNi+9oWOk3Gc3IuOpzfzLABpMbOgrwq7kqjRMBY3VPPaYMiOOuvWyt+Md70lMYTaLD3Yco4xY00JbHMiWxl9TiSjdhUyHnNsjhAEsnbwZ2/8Z7yMt9pzOeuIyVLA+Pq++dRKTHzsw7FzxPtlGPqzqziS30rCM30wGalwYsyag8JwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEVbymheg/pi0H18lPXe04kKTgelT+WrQ6x2GWgpn9I=;
 b=nHOgBYE2/r0R+4SwA/hXMEiExLNCnRdEJPa1z/HTHu/+VxB+lJ4RNd7tZT18pcWfRYHtcZ0I1xkQK1KH30rVgavLWgISAE0RMZ6jxhdVfBZfzwFDGN5tcCG1gzShc06vQmXe5T/OJZtU0WoJxmAeSPnH764MLHWOX2orXzgaklHqAKGq0pkOQ4OHUhVIRNc+YK/wgX2sQ8k+UWVoV7jzNH9+n/TZwDM3WhDEPoFnMiX+e/Xm/2ZSSy/Tupv+B7iuLgRM3PS2k38/OMUSHPC7dPvcgkEcvfBJltHoEVtAWOq9DVpAi+3oFSu4mFyIfUGJtpdJR7XN9M56t4LdVZ1bLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d998b0cd-d8da-6022-3ec4-acfb798d5d3f@suse.com>
Date: Tue, 25 Apr 2023 10:47:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 07/17] xen/arm: introduce a helper to parse device tree
 processor node
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-8-Henry.Wang@arm.com>
 <8ce925a1-dadd-79c3-3b0f-c3ab45b1a669@suse.com>
 <36e27df0-7fdc-5f1d-ebb7-0b021bdae2bf@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <36e27df0-7fdc-5f1d-ebb7-0b021bdae2bf@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 413161c0-c1ec-4661-9f3f-08db4569ad4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kj91R8jnIFJex2YDar+AUfjYRL4RIr78dB9aZ0uz4zbHj683b7igWXUjctrfbrTpxEitP/yHwcB9eOgBulqFNRsx+dLkYXXkEaedvqFF3iERQ4ld1HFoJQksTRQ3dv6fE2nslg8neHOLtqVWwxviZzd3iMBQZAzBVHyZFW7LI3PJT0PQc30EZHuHj8hnB5H/l+Etbp2YY3evcdNt1G/X8OyutY9gCncWHgmW+TdcSZSjiFDR4Py+gW8RzcUdxkPduwILhsSJ2vrQd1r0bPlbFyeZkP/t5IUgy1OQpv7ZdX/iy55LNMQFinuJMxz2qgsjce8OChJJt14Jq8dlfGj1eyudHV71vf30k0/IQjA5mcLJyr40xB0XVx/egcGLM+j7o4xZH5x1eGTl6PJRrK15+U6/o6bxXTC8inuIQcSuH+dlBRPuikE55ZRarKdCNcQIM/92+lydUDK9UE9pliVtIr+GAkDR1qKPfuaVaa/fBQzL4Mngokpyl9zibbnmJqyUgezSl77iWZ9UE61AUVtS2upuA4HWukRcx1zr5OHGYwxqiFiPSeTlb4kEHWHee/zAXuJffH7zRlG5LqYkUZGdVcMR+9Z0BKOkR7ZJeXGBxb4QmUl7apfRMPQgjLG1Um56rSery4+2Li+c9SRMdIDpMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(478600001)(31696002)(54906003)(86362001)(36756003)(186003)(53546011)(6486002)(26005)(6512007)(6506007)(4326008)(6916009)(66476007)(66556008)(316002)(66946007)(83380400001)(2906002)(38100700002)(8676002)(41300700001)(31686004)(5660300002)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1Y1QVA3d2E1SktLL3EyNGdmV21Zd296akkvSEVDNkhWV3VEbXpFWFd1eUw2?=
 =?utf-8?B?a0phK1ZaMTk5cmxJbFNjSFlaV04rZzBkQnV4c3hPdVk3ei8wSjM5L2NFSnhw?=
 =?utf-8?B?ZEV6bVR6ZW8rR2dxQ1pISVgrSUZveG1BWDBod214d2NWSWZTbU44NnFTNSsx?=
 =?utf-8?B?UUgrQVpLMW9ENVJQS3JoMWsxa2R2N2VUZ0hsMjNVYXpOQVlmTUZMUkdTM2JU?=
 =?utf-8?B?OVZMM2NQYWZnYUlURlJHUEM2TlJubDVMVHNONkdWdXlidlJFUjRqeXlXYkVE?=
 =?utf-8?B?N0F0WTFtVFFickx0K0NyMndYTFhSbnlaQVEzWk1WME9IOFNtb08zQ2U3T0hS?=
 =?utf-8?B?QTExdmFOOGhHNjBkS0xGaDdFSGZzRFQ1Q3JKVWhpeUpzK3U5WjBYRWxYOUFt?=
 =?utf-8?B?UGJ0VGVHTXVwNmd2OTJyajBsdGRLRmRISUo1T1hsWHNGTlFrenNhM0x2NlIw?=
 =?utf-8?B?WEhwLzJKR0kwdkl5RGU1UDd6eGdrZFBKQkFmVXpKOW9mZmUyemtMbTRXdjJ6?=
 =?utf-8?B?MmZWeWlPM2FxK3NVdHBQQ1ludzd4VDY2OUZQNEl0NEJSWHlLYmMxZnVsWXFk?=
 =?utf-8?B?cVZJZWZKUlk1L3VRNzJvUnpyZDBnN0pOMnNZeVpaVUN6UklWZDI4WEZHZGps?=
 =?utf-8?B?Yi9mYXY5b0ZNT0Y5SjV4MzdGNmJ0WlR1NTRXZ2JNZ0kzalNLMHJ4R1NNZVNO?=
 =?utf-8?B?UEhVZjlHTEN4OVJGYkt0Z1VtemFnakJLMmllNFJrQll5WGpIV1NHVldZSW5w?=
 =?utf-8?B?anFnQ3lxcmNYblRYclR6eFFJd1JaSktFczlBWEtGbGlucllTcElsckNJKzhp?=
 =?utf-8?B?NnZSNEVxZFFwWkhYVlRvT3p2WTNtWnhWUzZDcnN4cmdoekZNNk5mUUYvR2Rw?=
 =?utf-8?B?OTBINzRaTlF3b2FmRXlMTkxibktMNnVUVHVyejh3bmlhTU9zbkZwVWhMaTA3?=
 =?utf-8?B?R1Ixa3d6dndVcnBNOEZsOGlGVHFNL3Y3YnlIK1ZQVTgyell6NUNQblJjem9a?=
 =?utf-8?B?SHdpNytmRjRGeTJkOTFYNVJudGpkYkhwNXdDMVU2aERoRHFZMlJlcWxpNEs2?=
 =?utf-8?B?SXRSbm5vdXFYL2Fjc3hwTmF3V0hjMHlBNEE4RVg1QWlRRjV2VmQ0bUVtTG0x?=
 =?utf-8?B?eWFleWpKVTNiQzZBZkVPREVBQ2lYUFVDQzNKZ3JrK2E5VnpnTWFSRlZEdVlX?=
 =?utf-8?B?bVgydGhFd1Q0blpNR1pybllwbHYwL1ViYzUrMTd6SjRNQ1JicVhFVE1lSVMx?=
 =?utf-8?B?bHBYRGpqZSt6cFRoYmtEUTR1a09rMGR1UjBSYzBlSUE2ZzBBWldxQlc1ZHBq?=
 =?utf-8?B?NFNSeHp6TlM5VU1GWUZVSzVJN1lDRVB6VFg5aUVIM2t4Wjk0OE1sWHVoVlJB?=
 =?utf-8?B?UDNZb1Vkd1EwbTJFM2UwTUE4MlplUWJLTmsxTXA3dmdwWFYvVzcwNkhDTDAr?=
 =?utf-8?B?bWpiODNhUWxSWktYVUE2SG15aG9XYUtzZElBeE5pSlJrL1lPNmJXajd3aE9C?=
 =?utf-8?B?SFV3VFBOcVlUTUhBazRXWkg4U09pY3dRaTB2dVFSMElHYzUvK1djTE45UmxG?=
 =?utf-8?B?YjRIUm9YS1VvVzRldnAzWkZxenIwdHM4aHdrTGtaK0o3RXptVTVoUjJRWjRz?=
 =?utf-8?B?cUNXc21uTmpBRHM1UUYvb09tbEl5bmxDSmF2MmpxUW15NkN4Ulh2MWNzWHFH?=
 =?utf-8?B?Y3RuMjZWMm9ESjMxcDh5OVpTY2lUb0g5U2MwUHVlZ3ZaQXNuczdCMTA3K2lX?=
 =?utf-8?B?ZkM2TGFvd2VJUDlabXRZNHRaMllieEpDMk5tekF6WmVXNklDemorRWNIRFlr?=
 =?utf-8?B?WTZpTjlzUnhDTFlvUnltLzJNbWN2N2JKMTVmdXB5K3k3UzRrMWR5dnlWZU1y?=
 =?utf-8?B?NGpTME5KODhKNUxXZ3UvRGZyOXptU3habmhzeGdOa1BGZmYrem9kSUhYc3lP?=
 =?utf-8?B?QytDU0hIVTFlTmdsOEtETjA5bGhMcHFuRitCTkRYeitjc1NUNituSmZSWGpr?=
 =?utf-8?B?bkd4NkFJc1dRcFhRR3RDWENMQ1gvT0d3THlLcXZLdTJ2MjlkMTJiMnpmNm15?=
 =?utf-8?B?dE13bjNSb0k3U3hDUFJMdW5YM2lTWDRGKzFaa014czNsOFVaTTdwMTAzV1A3?=
 =?utf-8?Q?nQ+92gEH7Sjh2sMlV/S1BsWYc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413161c0-c1ec-4661-9f3f-08db4569ad4a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 08:47:18.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5HQMe8wT0hMROxo9ENe9JKcpet1CDf88YxgdjH0DBbs4bTWVQByC+HU0010Tr3fy2wPMGPBsVFbJWQzN5hNWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9287

On 25.04.2023 10:39, Michal Orzel wrote:
> Hi Jan,
> 
> On 25/04/2023 10:20, Jan Beulich wrote:
>>
>>
>> On 25.04.2023 09:56, Henry Wang wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> Processor NUMA ID information is stored in device tree's processor
>>> node as "numa-node-id". We need a new helper to parse this ID from
>>> processor node. If we get this ID from processor node, this ID's
>>> validity still need to be checked. Once we got a invalid NUMA ID
>>> from any processor node, the device tree will be marked as NUMA
>>> information invalid.
>>>
>>> Since new helpers need to know the NUMA status, move the
>>> enum dt_numa_status to the Arm NUMA header.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> ---
>>> v3 -> v4:
>>> 1. No change.
>>> v2 -> v3:
>>> 1. Move the enum dt_numa_status to the Arm NUMA header.
>>> 2. Update the year in copyright to 2023.
>>> v1 -> v2:
>>> 1. Move numa_disabled from fdt_numa_processor_affinity_init
>>>    to fdt_parse_numa_cpu_node.
>>> 2. Move invalid NUMA id check to fdt_parse_numa_cpu_node.
>>> 3. Return ENODATA for normal dtb without NUMA info.
>>> 4. Use NUMA status helpers instead of SRAT functions.
>>> ---
>>>  xen/arch/arm/Makefile           |  1 +
>>>  xen/arch/arm/include/asm/numa.h |  8 +++++
>>>  xen/arch/arm/numa.c             |  8 +----
>>>  xen/arch/arm/numa_device_tree.c | 64 +++++++++++++++++++++++++++++++++
>>>  4 files changed, 74 insertions(+), 7 deletions(-)
>>>  create mode 100644 xen/arch/arm/numa_device_tree.c
>>
>> As asked for in various other contexts, may I please ask that new files
>> prefer dashes over underscores in their names? Additionally short but
>> still descriptive names are imo to be generally preferred; in the case
>> here how about numa-dt.c?
> 
> Seeing that you made this request multiple times within the last months, maybe it would
> be better to write it down in CODING_STYLE or CONTRIBUTING? Otherwise, you will keep making
> these requests indefinitely without people being able to know things like that before pushing
> new files (+ this always requires respin).

Well. I could make a try, but getting ./CODING_STYLE changed has proven
to be difficult in the past, and I would prefer to not again sit on such
a patch for months or years. IOW I've become quite hesitant to submit
such patches, even more so for things which - imo - should go without
saying.

Jan

