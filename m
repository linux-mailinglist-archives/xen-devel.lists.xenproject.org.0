Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F997B3A78E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 19:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099782.1453512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urgEs-000635-Et; Thu, 28 Aug 2025 17:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099782.1453512; Thu, 28 Aug 2025 17:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urgEs-00061W-CB; Thu, 28 Aug 2025 17:16:42 +0000
Received: by outflank-mailman (input) for mailman id 1099782;
 Thu, 28 Aug 2025 17:16:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urgEq-00061O-IA
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 17:16:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2416::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0af379b-8432-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 19:16:38 +0200 (CEST)
Received: from BL0PR01CA0018.prod.exchangelabs.com (2603:10b6:208:71::31) by
 MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 17:16:28 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::55) by BL0PR01CA0018.outlook.office365.com
 (2603:10b6:208:71::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 17:15:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 17:16:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 12:16:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 10:16:27 -0700
Received: from [172.20.7.230] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 28 Aug 2025 12:16:26 -0500
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
X-Inumbo-ID: c0af379b-8432-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiW6Gt8nLbHF91SiMLbv+ybUihk7i6sMupfXnZ02lXGoGPTiDtXyNxflSQuJjY1/96nXuZzkV+kIuSBBKcf0ud9gc9CK/0NkVmkeb4oxLjt1BACdfTVR0nPWuQIC/Q5JHKZfbC5P2h88lM1jK7WujiAYZzhf1QF5QtzrKERH0zPzrXrwh/FqImKawz2919YZgoiu+B+Nb0zOiyhIzbuYzRt5lUsnO9A/hBMRaowfwz1XAsx7B9bsCx3yhXkwrKX/fRiGgwwIm2BiiwaBnQ+vQKNkywDTPRGBArq6fndiD9bvJpywhZBwe+7AVymLZD+EBmBxe3a9xUn1kQSwMctk1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW4cJHaShagW13xBVGHYT6aHXe8PZHmg3np/hi9J5TA=;
 b=R4eZArnSc0lHcYraeVy/O1sdSlxED8jMea34h1GWw7zdCLHY34W1BfW8pGtOTIZ9baE+k4rrlLCHwSZHpgX0d2P3Bde//TH+0KBdFsBF/fqVNT9rnn3gzNkTu5a63lnakrdC2YxUTSYnXmuJENDXEEA+1IL/J6hanxZL2JLa4tcM0VsDntIDwkTLxQGD4YxBqlJwed0NrmcdY0bYVmi+mYhxQrjLYJFDxz3DIMyXJSWcRLSRMIkBeCYtPQwFwp8iRywsiWj9rJQYnQkATTdWXY65N2fHIZ2bKzcZ/NcSR8FQBm+w98zssqGkyLB8PhTEawqtMvfnQ64YZfHSdf2FXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BW4cJHaShagW13xBVGHYT6aHXe8PZHmg3np/hi9J5TA=;
 b=5X2alMi+WCTG+O0xZO4Gl8DD6JfDyVsDdvMc96YMLVytRWB0N/YVgPXxPXsUQ/o4sehEhqOWt1/EfRC5wx5OTYAv2hLSijAGCtdZJlfwnIyX61QXzRv4xVYdXGRPPR6HOTeo5d8i0GCrfHSzatlFabU3JDWXIfWKwAzci6Oje3w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <773a5f4e-2f73-4b84-bc56-90aee660acd2@amd.com>
Date: Thu, 28 Aug 2025 13:16:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] symbols: arrange to know where functions end
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
 <24fd00b5-3053-43ae-8342-887eee94869a@amd.com>
 <d934d8a8-93c0-4cb6-baa4-f2aedb719f25@suse.com>
 <e9eaf331-4a32-4c80-8b0a-5f36d8fd9022@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <e9eaf331-4a32-4c80-8b0a-5f36d8fd9022@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: c586007b-7d2e-45f2-cdd9-08dde6569ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFZKWVFoUUNXZ2doek9lWE0zdXUxVFN5THQ1Z2FDd3QxcWlKVWNrSEVRSFFp?=
 =?utf-8?B?aGJNUEpyaTZGbi8xMDBjSkw4NXg4NnkwRFgxT0NaYlp5bmhXY2FLVTNVL25p?=
 =?utf-8?B?Vk5tTmVkMURhSGRFUmdjT1VnRXNFZW5IN21VeVNJZjdFNFRCdm9Vc0J4dEVy?=
 =?utf-8?B?ZlAxYjIzSjVKeEhqTENJeVpqbHlvdVFTWTJReTUwY081QnV4QUdlbUFuaE1r?=
 =?utf-8?B?cDdOTFk5Um05cEdKT0V4ZmxOTHlJMmFMZC9NbHVpc0k4YTB3ZHpGRkhqTTJ1?=
 =?utf-8?B?UjZML3hEYkFJY09GSzZQK3FFaS9iaXRsUHJhQ0wrNm9IRXdEcXVJZmlOU252?=
 =?utf-8?B?bWlpc0dla0pqdmVBRnYxbzl2WWNVMzBGMWhrRFJLNTJEZ1lkRkZoeHZSUy9F?=
 =?utf-8?B?OGJrYXlYT3pPcTF5ZlhqWkRkek0wSmd0N0FwZTlmSWZ3NVY5dDJ6aVlBSE9w?=
 =?utf-8?B?RmsvdUJRRDVnTHZtdkxqTnhoMHdDNVVjTTcwajNsaXJUYXhKQWdZaFk1cW5x?=
 =?utf-8?B?akZMYzJiY24xa3hveS9vbmx4UzJiWGxCMUxtdmQvZFpEakVKOWVuQmxVVFZM?=
 =?utf-8?B?YklKVzR4QUlwREN6cm9xd3VNeERYb1pDR1psb09kYXFsK0U2OVJhUW90Umto?=
 =?utf-8?B?bnkwcTV6OHJxZTU4K2Q4RC9FQStMRnZ2SW1ZOFB5V0RYQ2l1bzRmNjlPclVZ?=
 =?utf-8?B?WjUvQ3AyQ3o1cnI4NzdoMnJlUnVqWnVmVnJvazB5cUl3U2RPTDV6VEJCU0ov?=
 =?utf-8?B?YWNhSkdvL1VKNWQvMFVYbS9yQW9pZ2VCbW5FczE5R3U2d0NreEcreURIUGRT?=
 =?utf-8?B?RFRLWGpTWWJSWmtNREYwdWpIcEsraklRUDFRUytFZjBJZWRSNFNCdEFrVUN2?=
 =?utf-8?B?YjYxMEFUVHNHbVFkdDAra1BsZXE5bTEzRFNTWmJlRmdpR3VRODZyRGpkOFNq?=
 =?utf-8?B?SmNVam9BWlh6S0lPelhHTStVR29pNXh5QUc2Z1ZwWGZvWnFtd2NISlJ6c1Qz?=
 =?utf-8?B?UGZsWHdKL0N2RXlaZkluTzhMb0VDNURwZ0lSL1pCNmJiOVgxZnRrRWF3NklF?=
 =?utf-8?B?OGZvejRwaVI0b3NWS00rWGxxa0pIaHRyTXYvb0hkQmtoUE5lQXhpYUZJcTh1?=
 =?utf-8?B?c2ZVcXdnaEovT2ZMN3lEaFpZMThoMWkzZ2Z6Uk8zbXM1SFNmd3NwRVRPYTd3?=
 =?utf-8?B?SmlGMHFxNk1VTTBtSEJteStmd2pweU5pWmd1SzFNQjV1YzA1SkpoZGdpOUJp?=
 =?utf-8?B?WDhxSWtYYXd6cTZLUW8xQVJWdjFaQXdzMVpiSFg5OHYyVGZHNnlPZU85Vk9L?=
 =?utf-8?B?SUtldncvTDF6amk4alRucGxydGNoSHJrOVFDZkx0c003ZXlnRldjbWdzeDFR?=
 =?utf-8?B?QXA3TTBuUjMybHU1OXg2eUpIU2hBVUN6VlU1cW8yTWJmYUIvTERzRUZ2RW8r?=
 =?utf-8?B?OW9uWk0vc3B3UnJBbTdFZ1BJK3ZOZCt3NzRMMUp1M1lPUkNvSUJ2OFJGcEJB?=
 =?utf-8?B?QXdiejFZNXk4SzJrNjhYMGN5bkc4TzV6UTRyci9oZ1dQZi95TTE3R25selFm?=
 =?utf-8?B?bk9kRGYxSWJKRk13UVJZdkFzOEdqTEVxVE1XN2s3NHNpMTN1SmVkYWoxT1E0?=
 =?utf-8?B?R3YrVHdoNnNGMlA4OVM1ZW5WSWRKWVVNamdYMFMyRkVVVFlqUk5wR2liQXJu?=
 =?utf-8?B?VTE3SDFLTjlrWFovVGhmSFllU2pabUNobnBrbUI2YlpsY20wSGZYSmF5MElo?=
 =?utf-8?B?c3lTRkR6SkdHTittTUJ3dlBWK3h6cE8xWFo0VlFlTlZiSE12eW1NSDVpMXRp?=
 =?utf-8?B?QndjYnpWOWpUdjZYN3FEb3Jva3dpRFRJbUs2M3hZekdBcFRvcXdpY1NMVktp?=
 =?utf-8?B?dWFVVkp4NG1CK20wdEc0TTNObitLOXZyNmptbEJPQS9ZT081UEF1WFI5U3hy?=
 =?utf-8?B?L3NPaHJwYWs3Qi85Y2k4OXZTM3N4a0NMRlBXbXFBZ2R2bkIwVmxJd1l5cjkv?=
 =?utf-8?B?NzJ1aUd5eTEvYkl6bUErZjk4dlBmYnZaSExPREtmTExOM1ljK0JmN1VteXRw?=
 =?utf-8?Q?kz+23z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:16:28.1691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c586007b-7d2e-45f2-cdd9-08dde6569ffb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200

On 2025-08-28 12:11, Jan Beulich wrote:
> On 28.08.2025 09:28, Jan Beulich wrote:
>> On 28.08.2025 03:03, Jason Andryuk wrote:
>>> On 2025-04-02 09:58, Jan Beulich wrote:
>>>> --- a/xen/tools/symbols.c
>>>> +++ b/xen/tools/symbols.c
>>>
>>>> @@ -318,24 +334,42 @@ static void write_src(void)
>>>>    	printf("#else\n");
>>>>    	output_label("symbols_offsets");
>>>>    	printf("#endif\n");
>>>> -	for (i = 0; i < table_cnt; i++) {
>>>> +	for (i = 0, ends = 0; i < table_cnt; i++) {
>>>>    		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
>>>> +
>>>> +		table[i].addr_idx = i + ends;
>>>> +
>>>> +		if (!want_symbol_end(i)) {
>>>> +			/* If there's another symbol at the same address,
>>>> +			 * propagate this symbol's size if the next one has
>>>> +			 * no size, or if the next one's size is larger. */
>>>
>>> Why do we want to shrink the next symbol's size?
>>
>> First (see related post-commit-message remarks): In principle section symbols
>> could come with a size, too. That would break everything as long as we don't
>> strip those.
>>
>> The main reason though is that imo smallest granularity is what we want here,
>> together with predictability. One symbol with a huge size could cover
>> multiple other symbols with smaller sizes. We could omit that part of the
>> change here, but then the processing in the hypervisor would need to change,
>> to fish out the "best suitable" symbol when dealing with multiple ones at the
>> same address. Other changes may then also be needed to the tool, to have such
>> symbols come in a well-defined order (to keep the then-new code in the
>> hypervisor as simple as possible). Look for "aliased symbol" in
>> common/symbols.c to see how simplistic respective code is right now.
> 
> Furthermore remember that we can't record sizes, but instead we insert fake
> symbols. Obviously there can be only one (at least in the present scheme).
> If we used too large a size, chances would increase that the end symbol (in
> the sorted table) would have to live past some other symbol, thus becoming
> that one's "end".

The scenario I thought about is something like:

a 0x100-0x10f
b 0x100-0x1ff
c 0x200-0x2ff

If you shrink b, you are creating a hole that would otherwise be 
assigned to b.

But I agree avoiding huge sizes covering multiple small variables would 
better be avoided.

Do you have concrete examples to help illustrate the problem?

Regards,
Jason

