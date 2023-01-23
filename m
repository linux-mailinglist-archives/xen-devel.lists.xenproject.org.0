Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBFB67763B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 09:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482665.748284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJs6m-00082T-Ia; Mon, 23 Jan 2023 08:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482665.748284; Mon, 23 Jan 2023 08:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJs6m-0007zy-Fs; Mon, 23 Jan 2023 08:23:16 +0000
Received: by outflank-mailman (input) for mailman id 482665;
 Mon, 23 Jan 2023 08:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJs6l-0007zs-8w
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 08:23:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2082.outbound.protection.outlook.com [40.107.15.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d55f9bd-9af7-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 09:23:13 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8721.eurprd04.prod.outlook.com (2603:10a6:20b:428::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 08:23:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 08:23:10 +0000
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
X-Inumbo-ID: 2d55f9bd-9af7-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqdtFWpwphEqMxfZydcDPjZ9SsgyQJ7kMk15i+r+Z7fv+EnrNLHaIGxkopTcGSopIjr2yNsytMv4nyZCX0Ql/4Usj1yvR8ITvxNXvvj61o63BK+KZoy4I2c/dbtCAh1F22I1luY3qTx8DGaCDXxTgnpqzyFIgGIOVvWDEYabtgvsxNK4kAffZls3pshNzArmeMR/VHJwPZV+gX2KO8FD2GLIrFc4DQGvXQTaC81XAudNT+0eMTP5D/Sij57GOzqLFcX8MngGO6Sq2LTG+V+KNI4znsKkWKQfQZAAuISbqarsn3XXnnKrq4GJZsm2UW45rDXXmgErJyYbyrVZEG4oFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdoeQqJGxtq2p6npwItttpM9H0mYHSgyVI9Etpa0NX4=;
 b=d1sxYCfKG7G3KVHS5A5HrQ87NsRCCVicsr0lITNSLrquZQyF2WaY3YX2auaUK30qfiziLjzpXvq3ncmUCTmk2FNf2byokRU9LCf0mXaHGR33yAmfdbJt4qEo/r+tybxKPPLTXQVF5pzGOotZusz43+hp+F3lczToGndsbbwijUOPyHv5HviHFk5Q1DRIDdzrO/ibHbvBySD37HmY/nmPqKP9kBFYuRbEzLrAFJA1AC3uU3Z3B6idl7NYP/nbxJX44YmxtmjCcWPXJknvR/TB6p7iTHX2iRMTlmXrXFawIzQWBb/+45E4c64FEo2CMm87iYsKhmB6LdgRXgFYRIwf2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdoeQqJGxtq2p6npwItttpM9H0mYHSgyVI9Etpa0NX4=;
 b=Vd8+TdQk+jhleLIo3CnGYPD2+vSTzAh7JA1S5JdxcUDE6pElwEWzMO0MGvcnxPeETCuYapvPaVTxoqHh2dxNXzVgmLq6Jnxxz9OncwoVmj4F5LUbwn0exw6NTzcsJeF5ZAftpESy8PWwYHCDlbV/Zmknlmzn2DbJsl3iYrQVgdgLGq7rOCYXdY2+1SmmiFCNIvUxR9K6jmgDMEyaRyO3zyaHuDmYXXwSamTuWgTxyn6jcKZO52v2uJC7s8JVggavxoWsgJRpGJGjCZnr5YTZNHT0PP1HG20I4TcTC6N/ckh/RHX9ci/btWEuIaTrUSh4oKF58rh77quXXvt60BLKNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ded1704-383f-8b18-bd76-c093525c783b@suse.com>
Date: Mon, 23 Jan 2023 09:23:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <ed4d8d85-2ba5-74c1-7c65-0ae65bf0ee06@citrix.com>
 <24a2f51b-e69d-7a44-5239-79f5f526ef01@suse.com>
 <978b098a-d052-09cc-442e-9aafc816feee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <978b098a-d052-09cc-442e-9aafc816feee@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: d6a0b513-53b9-4dfc-2909-08dafd1b103d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+vb7UY71mh63xr68zJpP7Ismacs34qBtQVu8lTrBOkGtXdeDAC4OVDBzlrctz2zlckgltqOVsplUoHG4iyCwoUO3vWaCTWsk+62tHD7dA4aIKk/FMcyowhMXiX20RjcPkMjMOqwzYZwafnbvS1+leUyfYEHkGRiET5U2DfvA/05ahXj5TGbXlFf41hRxhb2fOliLp8vgjy9t0FDrO1S/8NNjp7EyM5qxT8LoJW7tin2RImdAxwxt6YIao6VcgEMsNnt+RcEIGSKF7DjEnuhlsmEv8x++RdkngLmp+//OCejQIbWHmnDFzCHsfSc5unD4QAm/u2xq7iKVcflmIMGfddOqnZTuMNuzixgBvY1bOMTa7QVyplER0AUG1BxrH72h7T1IBIHMRigBwXHpCBnL1IQO9mF0mPZKsQg5KvhBYVz2+ex6y5u6xTiNCJTW8j3QsLGycdyUYtYIAoMGN78k/Uox5JRMx//6sKEUFfs1G4kWVDp3NSLJ9xQw2lfL2RhwpXShusDVlWLb1TrrmNfTE60i/e9jRgkHwhbFtIAGISzgc0skClbn9xpdomGAVxA58ckd9mdbLKX6tw0doctOkyOiWDZZMWPiDweocJsUGtnRV+aEgof39JBaMDMgWKG3bGygPWnmzH5GjZPZQVQUVz2HgB9MFEWkTo1JYgiSFEWCYjUEZU/i/Syc5skxe5hhXd18/kU4ceP+SMEcjV8BunzH7/Cnyyen4t1KDe5VtDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(396003)(39860400002)(376002)(136003)(451199015)(83380400001)(38100700002)(31696002)(86362001)(41300700001)(2906002)(4326008)(5660300002)(8936002)(6916009)(8676002)(53546011)(186003)(26005)(6512007)(6506007)(66476007)(2616005)(316002)(54906003)(66946007)(66556008)(478600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFllRTc3Ry94QkdRTFQ0Ynl0M2ovUmZSdlYzeEFiUjhTQ1o2ajVOWlhaQmow?=
 =?utf-8?B?OEI3ZUE2QnhQYlY2MVVNdE9INUNpZXdObXQ0OXcyL2JtZlV0R1RSaVdGVENq?=
 =?utf-8?B?QmdSbEtyZ1RJSnpmK2pmTEV2Tzd5YjZhcTlQTXp4WUlKOGFIeTdLNnoreVo5?=
 =?utf-8?B?a0V3ejNyeENCMWxFazFsQWlsV216N01Ob290UXNIU1FPaGhtMmNoWUs4d2E2?=
 =?utf-8?B?WnFIcDJvcE1TbTJBcUVsaWV2eVpxUWFRTWx4WXUydlpYS3RiRkl6d25IekxO?=
 =?utf-8?B?TWVHTXdLZEEwS0VDRm1QOGRkVkoreDhQUi8rU1VNTmJhVjZlZzFpNlFLUXJL?=
 =?utf-8?B?a1ROVzd5eWNWQnR5VUgwYWo0WHJkT3NjdWpRSEZManlSKzAzQlhhaFdTc3dz?=
 =?utf-8?B?ekxGdlNOYzE3QUxFK1YrUGhWZHVNeWZGSFVXZFZzWWhyamcxbklVVVcvemRr?=
 =?utf-8?B?TnhkWk5qNFJ4ZG1jV3BjekhsU0hjaEhqUjRNYnp1ZzVEYlkyRkM2amJzQzdk?=
 =?utf-8?B?MXBQTjNoVm1LKy9FQW9aUk85ekFYR2FwdVZXdFJ5M0hzM25ocDk5Qnd5MGhK?=
 =?utf-8?B?T1NBV3RCZSsrZ2xzUmdkUWc1YnAzenRQTi9ib0l3aW8rOFgwdnRhekdIRWg5?=
 =?utf-8?B?TEQ5SHNaTEw2NVNhbU1DYm1KS0Y5ekdWblkyUk9Sd3BaU0dJRTlsdWdybm1F?=
 =?utf-8?B?eTlEd2pDMlRLaVovVUsyVVlSZmVTdDhNd09ZbmJmeEVzd0JMNzdwemxPRFRm?=
 =?utf-8?B?bjFSWUpuOCt3ZEE3WnArNEVDT0ZBVFNadUNxaG1YU08vK245eDVSSW5CSjhD?=
 =?utf-8?B?N2loSnE2UEZRdkVldys1Mmx1RGJjT1lMMXhrVCtxbWFOOW1rVVdJdlZvZkhr?=
 =?utf-8?B?aEgvc3kyYWt4U1Rxd1F3bTlHOE5TaEdQVGpGakxzL0lMRkhJTkcva0hQdkpR?=
 =?utf-8?B?ajFDNEFGLzN2aVRmSUxqZERrL1ZQY2sxR2Q4M1daWkdjQUNya1YvSkY4b0xo?=
 =?utf-8?B?UnV4bjJvV3UvMDk1SXFTTmVkZ3hPVUdzR2VRYVJPTGVNNnYzN2hITFdqOUxl?=
 =?utf-8?B?YzdLMktZQVVmVHNvN2pFcWIyS2UzQnhyRXJML05waUw0dFJYSGRLdklMMUVp?=
 =?utf-8?B?d0k1L0RIc1BYQi9yYjhhaFo5U2Z3dnJjMng5L0hVQ3lMdXlERkNiNWhFZFpt?=
 =?utf-8?B?RnUxMDZFUkFqMjNTcGFOY21qS2d3YW5FeEhiMEZ2RUJxRnlmeVpCcUNIVEZD?=
 =?utf-8?B?M2N5dmVucndCMWEyb1d1RzFsS1lCQkFJU21LcVdtLzllMXJPZGRuRFN0dXBO?=
 =?utf-8?B?TXo3L2dOYW5jbm14ZnRXRTc1Z1FxMy90Qm4rZDkrdlJFYUNkSHg1WnhUSG9D?=
 =?utf-8?B?Vi9Lall3NVRTeG50Z2ZUU3J5b3hMcVhmaGlpbW1VbGIzK0FKSDdvYU9vUjd3?=
 =?utf-8?B?TlpBMmY2bHBmNGZZZVpyWUM5ZXArQjhIWUlyVjhSU0sxLzlxU0Z6eUJjVGcx?=
 =?utf-8?B?Ykp3VnM5d3B5cWtCR2hUbGtYb1pMdzNQVzRhbk5aOWFHWmlhR2FqWG1POURR?=
 =?utf-8?B?VFRDeXRSTlBMZkFoY2dvRS9WSk9zQzlnb3JSVXhKTFEyVVB6eVo4ZTBpeUY1?=
 =?utf-8?B?SHh6Y09JM2RkVyswTmk0QkVkZHVOQ3lHYlMwbU1IYmxFRE1LZWg2NE9oek93?=
 =?utf-8?B?TVRZeDVyUkVKSkVVM3RzMHR5QXRoUVhTWU53WkVrdEhybzBXUmNhZUorMFQ2?=
 =?utf-8?B?a3ZIMHVGRld1NHNSeW91b0lMZ3d0bjU5VjRvRkxEWER6WGVsRnVHLzNWckxN?=
 =?utf-8?B?VlIycVpKMythZGlTeXBSblMxNC9UNEd0Uy8rVFVnbzdhQXkwNzFyU3BmY2tu?=
 =?utf-8?B?Q3VMVld3TDdGNnc1bi9hTlQwaXJpckJKMkozVUxaVWVGOTJGZ3pUSDBpamkr?=
 =?utf-8?B?dVNRRStvNHVGNDZTRXJMaXhKdDdFcGt0U0hZMmlCOXQrNHQzUFJrMjkxeFVM?=
 =?utf-8?B?Q2gzZ1FXalI4NTZyVDlSYzYrNUpaZmt1MDVzWU1ya2ZkM2taVU0rLzFPY1BV?=
 =?utf-8?B?Q1R0T1pNSTF4ODMrMjQ5YkNKTXFucHFLY0xWekNjbzFWV0ZxSkxlcHBmaFdq?=
 =?utf-8?Q?uJFgY5TU9f+jXVkdAdcpTltmC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a0b513-53b9-4dfc-2909-08dafd1b103d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 08:23:10.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRxcVc30rh6xI0QXfq22SAKck5xy010xeXB6YNMtc77EXWXnlFlu9IvcqRdFl3zgyyYYwLpQYRLflVkY/I+KPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8721

On 20.01.2023 19:15, Andrew Cooper wrote:
> On 18/01/2023 9:55 am, Jan Beulich wrote:
>> On 17.01.2023 23:04, Andrew Cooper wrote:
>>> On 19/10/2022 8:43 am, Jan Beulich wrote:
>>>> Noteworthy differences from map_vcpu_info():
>>>> - areas can be registered more than once (and de-registered),
>>> When register by GFN is available, there is never a good reason to the
>>> same area twice.
>> Why not? Why shouldn't different entities be permitted to register their
>> areas, one after the other? This at the very least requires a way to
>> de-register.
> 
> Because it's useless and extra complexity.  From the point of view of
> any guest, its an MMIO(ish) window that Xen happens to update the
> content of.
> 
> You don't get systems where you can ask hardware for e.g. "another copy
> of the HPET at mfn $foo please".

I/O ports appear in multiple places on many systems. I think MMIO regions
can, too. And then I don't see why there couldn't be a way to actually
control this (via e.g. some chipset specific register).

>>>> RFC: By using global domain page mappings the demand on the underlying
>>>>      VA range may increase significantly. I did consider to use per-
>>>>      domain mappings instead, but they exist for x86 only. Of course we
>>>>      could have arch_{,un}map_guest_area() aliasing global domain page
>>>>      mapping functions on Arm and using per-domain mappings on x86. Yet
>>>>      then again map_vcpu_info() doesn't do so either (albeit that's
>>>>      likely to be converted subsequently to use map_vcpu_area() anyway).
>>> ... this by providing a bound on the amount of vmap() space can be consumed.
>> I'm afraid I don't understand. When re-registering a different area, the
>> earlier one will be unmapped. The consumption of vmap space cannot grow
>> (or else we'd have a resource leak and hence an XSA).
> 
> In which case you mean "can be re-registered elsewhere".  More
> specifically, the area can be moved, and isn't a singleton operation
> like map_vcpu_info was.
> 
> The wording as presented firmly suggests the presence of an XSA.

You mean the "map_vcpu_info() doesn't do so either"? That talks about the
function not using per-domain mappings. There's no connection at all that
I can see to a missed unmapping, which at this point is the only thing I
can deduce you might be referring to.

>>>> RFC: In map_guest_area() I'm not checking the P2M type, instead - just
>>>>      like map_vcpu_info() - solely relying on the type ref acquisition.
>>>>      Checking for p2m_ram_rw alone would be wrong, as at least
>>>>      p2m_ram_logdirty ought to also be okay to use here (and in similar
>>>>      cases, e.g. in Argo's find_ring_mfn()). p2m_is_pageable() could be
>>>>      used here (like altp2m_vcpu_enable_ve() does) as well as in
>>>>      map_vcpu_info(), yet then again the P2M type is stale by the time
>>>>      it is being looked at anyway without the P2M lock held.
>>> Again, another error caused by Xen not knowing the guest physical
>>> address layout.  These mappings should be restricted to just RAM regions
>>> and I think we want to enforce that right from the outset.
>> Meaning what exactly in terms of action for me to take? As said, checking
>> the P2M type is pointless. So without you being more explicit, all I can
>> take your reply for is merely a comment, with no action on my part (not
>> even to remove this RFC remark).
> 
> There will become a point where it will need to become prohibited to
> issue this against something which isn't p2m_type_ram.  If we had a sane
> idea of the guest physmap, I'd go as far as saying E820_RAM, but that's
> clearly not feasible yet.
> 
> Even now, absolutely nothing good can possibly come of e.g. trying to
> overlay it on the grant table, or a grant mapping.
> 
> ram || logdirty ought to exclude most cases we care about the guest
> (not) putting the mapping.

It's still not clear to me what you want me to do: If I add the P2M type
check here including log-dirty, then this will be inconsistent with what
we do elsewhere _and_ useless code (for the time being). I hope you're
not making a scope-creeping request for me to "fix" all the other places
(I may not have found all) where such a P2M type check is either missing
of failing to include log-dirty.

Jan

