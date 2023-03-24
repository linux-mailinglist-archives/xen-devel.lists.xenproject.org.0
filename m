Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08556C790E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 08:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514183.796197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfc0U-0004fm-St; Fri, 24 Mar 2023 07:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514183.796197; Fri, 24 Mar 2023 07:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfc0U-0004d7-OQ; Fri, 24 Mar 2023 07:38:38 +0000
Received: by outflank-mailman (input) for mailman id 514183;
 Fri, 24 Mar 2023 07:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfc0T-0004cx-9q
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 07:38:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2202508-ca16-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 08:38:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7835.eurprd04.prod.outlook.com (2603:10a6:10:1ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 07:38:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 07:38:31 +0000
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
X-Inumbo-ID: e2202508-ca16-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToTSvPNCUbQpA9stSSjLHPhrC2gvstjQsyoRktYKwh8flBkEgPgVKTyn8L8LRcxzWvGbiDHcUbRque4kBaU8RKyIXk6lR5BO9bLUm1I+BylW8/SIQABN0nveCeQFHbTuQd+gfl+dGvjJdrB5UK//Np0FRvSn4lGaC734bqPvh2CDXdPG0P7wyURaZUen2JiInVaLSOrGHjGNFdtm0Yi2kXXXl1ppg1UoRSWJyBLrZEglAcAZJEhKYxFhmkc9HFQit8sSdHkPCHpT1uhVsVkNeXvH8aA+LkrvZYZN9W8ITCy2G+tWVFcBvFco9XzpEYmv12jUVbYmfixmnlmHkQIBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mU4M9D2JOFYrnmmwzoKIF4yVMNCtTm2Mw5SXVEPUrXk=;
 b=GbOtFvN2oc9KtPANqsrvruis4eIeVFDH+OlOo/WM3qS/JKduu0ov7MzNw15FUmRzthcSJYIOOOlpjUsvFtUumWJrQheQDAZlHcH2Hhs1QB9uBsdguKO2FOD9LANCoJu27TRBVcQeFi7rksGCQPyTxNeNSqZWR2G3RXuzHF8r2wGaVYK5HvB6wpoWQE8yqWnCvgRctmffUNc97070g+jDFWYdAWfv3HuHMd+Ft1TGqf3rXoXFtR/ufBLnEyiVJ3wwh+EKbD5U3NeIJVdjG4S5bzAewT64m7X6cI85pUEMu6Bvf2YV3lr5D6Pgl5etxGWWRx/F1/bgZGV4hBqkWKpr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mU4M9D2JOFYrnmmwzoKIF4yVMNCtTm2Mw5SXVEPUrXk=;
 b=TsyiGPNFF784gdkCgnW4htdleNZ+zY+/tl88tHQC6VsWTbQ/quC5OdRXqpnX16VYb0Mk5gbPiVi4rg/fB+Bv8Lprsldtyf1pjZTJHlzQ5s0u1CO+9YKFx1nTnR7MTfWrzezLB3dTXNdiVvj+4EemJfiDxk8H5dRwEcStzFq8B4czStX5FJTAC6jUlqvtt2aYdink2I7HIqtUTgEnEoa1H5dCW/X09eHBEFCPNpAJZlkT6B5CdjnrHQlPtK7UEkZaK+YpkkqgPIMUNdtaVa+KniugUiS+yyVIfQQ+zwlkTCw4s0ENjF3ZaxM7samcvg9b8boz/A1aBvhEwL7JJMzxNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f148fc2-04c4-5411-2931-8dde4ed9bc97@suse.com>
Date: Fri, 24 Mar 2023 08:38:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 11/16] x86/shadow: drop is_hvm_...() where easily possible
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <5944a3ea-cddf-7ddb-d167-a0a0aa9b4967@suse.com>
 <97c3fe74-89f3-fd26-f8bf-69113df1dc12@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <97c3fe74-89f3-fd26-f8bf-69113df1dc12@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: ce62691e-a7bf-43a8-8f7e-08db2c3ac39c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2yBPZ0AkapKlJ6Kq5DFXCg+nscJMefwtZEd42zeVwbaMhzUPM7zZCs25ejhrOrG5OOKlReRFjENz+4eot0MWCNcHaBgAS5KmpFPnZ5/dBLmb4YreME2/656xZ23c5P++ymYcFw0EQlIdjdJD/1seL+6rtw67ZwLEA3XodrS0F9PIjU36WaOiDTtpCeUm2z935yZ4Vwy+teqZGzA9xfraqX9A3VlOr+pk52gXlwoczv0ljRAKHd6Ifq+SYlnmB6V0npd39VqJsHR1Ya+wdh+S/pzyFaVzzLl0aDCBdDeF/0YN7nGn350mJ/6vtCkXEm7NZp6x79D+iOOELJ6q8BZJSjRmXgsFbwcpm51ORcVUIENoqF24zt8hd9oseIK9ZT+Va4k9/6lsoN1qVQzIaTvuRKjVezbTO7PvI8P2Dc75oQzi9qKzgap6ZJG4iIBkksWTsYw3+kYvPddjCW9C+n1D9uAM1kQ1LHRC+nhjXDthVzallpxL/8kccIK6V0gaeehUZdB6QBJ0Y0Des9BhpkkC8KTFEG5lZ0HZoE9oJgAy8LAS0ACvIqB2flNHDr3YkTMfCH5BnFzSJXWU3NO58LOLloinp9S9ZzsHTe46OvxbblAIWagMP4nQAnN6aCG+003d4F7tzcPdY0szkCc0sa7TWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(36756003)(38100700002)(8936002)(4326008)(6916009)(86362001)(8676002)(41300700001)(66476007)(66946007)(66556008)(54906003)(478600001)(316002)(6486002)(5660300002)(2906002)(6666004)(31696002)(26005)(6506007)(6512007)(53546011)(2616005)(186003)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3ZIV2Q0Y3UyUEx6NGlQVXg5Q3dZY051RWFQUlpLcWxvcnNVY1Bjc2R4bUQz?=
 =?utf-8?B?YW9qbU9vRUY2eXNTdXN1OWRaZDVzampid09Pd2pBam9JeEl5U1prcFBScm5G?=
 =?utf-8?B?eDhIOU1nZHRhMUJ6eGNWZzJYV2F3OG1NZXJIZHREZGlYWFpTb1lVZXNMTzRH?=
 =?utf-8?B?SW43RnBPLzEzMER0Q3ArMG12R3VEd0pHYzJKZU1kMzVROGFWUXpLRW82VTZp?=
 =?utf-8?B?VjBnckpQZW9mcjFyOVY0aVdnLzlJcDk0Wm5XMnd6ZitVaSsreFArcUNqQlZU?=
 =?utf-8?B?UDNBZlN2N1NocWRvcE5mYUZMN2NhcEhOR1VrT01WU1dMNWJHckZrdzNhaWsv?=
 =?utf-8?B?UmJDUXh6TzBydUg4RU1PbmpOWlN0dWJLNXdSMkgyV3pscHVZVlNjQW05L3pO?=
 =?utf-8?B?c2xNUmZQUFpyc0NtU3FRRlZnQ2FVSzVjZ3pwbjNxVXVvbHAvYVdLTzFycFZY?=
 =?utf-8?B?Z1NzZXJGakxrUURFYjYvOG1JTGsyWEdSRFlYZUQzSC9iK2NnaENJYUFHK0JG?=
 =?utf-8?B?OEFIOVFPN1NzVU12YnR4aXgzT1I2amJsQkw5bll1bDJuc25PclhUS29LdCsx?=
 =?utf-8?B?ZEV1QmdDZ1VuTGN3OFNCenBZVjJlQmZiUmQvZWNqZGc3cllwbjJzM1Z0TE0x?=
 =?utf-8?B?YXd6YTM5UzhqR2I5YnBWYkx5YTdRTklNWXdkUjBXcExKUk5RNHJOMlpreVU1?=
 =?utf-8?B?UitzejRhT2ZFWlJLRHRSOXFhdWlpR0daVERPaDJsVEdtd1hUQkFXVFB5SEJo?=
 =?utf-8?B?Y29TeVNaMG1jTkZwYk5Oc0hxcklMam1rQ1liZldFaTNvSmMwZ3VjN3JlZkpK?=
 =?utf-8?B?VGs3a3pXdDJiRk1hbjYzUDJIRks2Ymx2VFpGelBsdGZ2WmlrQVNhL011aFh4?=
 =?utf-8?B?dzdXaDl2L2laZzVKUmdpeUxxTTcwYlVVcWtJRGlZZlhVdXVnRlZLUkl5ZVBq?=
 =?utf-8?B?Zm04N29kK21YRVZ0eXlQaml0ZSt2anJ6azN5Tk5CbmxvbVlYeGZYZi9wZVJR?=
 =?utf-8?B?dCs1V1lyUnM4aStlcUpZWDQ5RFVqdkZ4ampFTGxVcDUxV0tnRWxjaXpwbGtC?=
 =?utf-8?B?eHlUZXZWRFNSTmg3ZXVVUGx3RjY4YWVES1EzNy9rMkQ1YzFmbkprbEZhRGRU?=
 =?utf-8?B?dGFCVmhXMUR1R2FDcldqclVHYVo4Q3VZVWhxY01wQmhkZFpaZFp1dExySzVK?=
 =?utf-8?B?aFE5ejVXQ1h0bkloWkVicXJ5bTN3cDVRY1VGcnluWGczYWovYTc5N3gzSW5P?=
 =?utf-8?B?ZE00UUxrcVc0L0kzTHVCNTBTWENSRXcxSEpUakJscXMxTTZwTkpVWHowU0xx?=
 =?utf-8?B?aCt2TjQydFZwekNKd1FYVEdCb2hNeEN2ZDA0OHFpK2hIMHZ0VmxvbVRlOXBQ?=
 =?utf-8?B?M0F2ekZXdlhoM0RHTzlaa3Q2YXpyd1JnczI3MHNnNUZSREg0NFY5ck81L3pF?=
 =?utf-8?B?VkthTzVGdDUrVy9mSE53MHhZOVpHcW9uVHFkRExnRkwxL2UwazhSd3lnRHNN?=
 =?utf-8?B?cWVkSDVFeFR5WDRRdDE2S1Nmd3ltZlZ5OFdNaEhqY1FmcGtocEJLMnVCWlpr?=
 =?utf-8?B?UDIrT2diOFdUbEhsRzVNcGhUR0hUMXlRTytLek8zS3JNL2FUNzJmcXpWL1o1?=
 =?utf-8?B?Q01STE9jNmdYQnBhVjVOSHpDZnEwYXQ0MnBWUE5PL3RROHhFQU9HTnRmUEZz?=
 =?utf-8?B?azVnTFpDZCt3Qk1meTRBQ0RFOHFTTGN0ZE1NY0d3bWg1RmgwT2VEYTFzdkFN?=
 =?utf-8?B?RWZLL0N2cDR4OVQwMXJtYmsraDdMdWpZbkpmMEZYeHZmcjVKck5US1NZTyty?=
 =?utf-8?B?clYrRkpmZm1XYzRCSHhGc1UwRG9lekpMelY0cnlFSUJiMldqeUJrN1NOaDRX?=
 =?utf-8?B?bmZ5amVQa3NYM1BvZW9kbklYdEpUVUdPcWkySUZJb2VDZmZEZkIzTlFNd21M?=
 =?utf-8?B?TUFmRmJmU2ZHOVY4UkduMFlKOVBBeFNPTUVpSDJiL0hsZitBRlhKMEFKcy8z?=
 =?utf-8?B?YzFpMVIwOTVwZnVqaTA4UkM3Z21VTHd1c1NMMjJJYlE4Zm8yT1pDUlBVMHM0?=
 =?utf-8?B?QkUvNkplbDJGdzhKcXA3azVHaHBQTkpzWTU2SkJBd2ZKYjN0c3BmVElTam55?=
 =?utf-8?Q?ezflXtBBf6Lc70bm3QR5cjXZ1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce62691e-a7bf-43a8-8f7e-08db2c3ac39c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 07:38:30.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBS4ce1dodC4H2hT4D/sX3dgaYocrv2qvxnHtsRwqIS68cUfw76YXfhsZyUU3XFPU0WYLUh6kvOM/sHr6kMx6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7835

On 23.03.2023 19:18, Andrew Cooper wrote:
> On 22/03/2023 9:35 am, Jan Beulich wrote:
>> Emulation related functions are involved in HVM handling only, and in
>> some cases they even invoke such checks after having already done things
>> which are valid for HVM domains only. OOS active also implies HVM. In
>> sh_remove_all_mappings() one of the two checks is redundant with an
>> earlier paging_mode_external() one (the other, however, needs to stay).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/mm/shadow/common.c
>> +++ b/xen/arch/x86/mm/shadow/common.c
>> @@ -1522,7 +1522,7 @@ int sh_remove_all_mappings(struct domain
>>                 && (page->count_info & PGC_count_mask) <= 3
>>                 && ((page->u.inuse.type_info & PGT_count_mask)
>>                     == (is_special_page(page) ||
>> -                       (is_hvm_domain(d) && is_ioreq_server_page(d, page))))) )
>> +                       is_ioreq_server_page(d, page)))) )
>>              printk(XENLOG_G_ERR "can't find all mappings of mfn %"PRI_mfn
>>                     " (gfn %"PRI_gfn"): c=%lx t=%lx s=%d i=%d\n",
>>                     mfn_x(gmfn), gfn_x(gfn),
> 
> Out of context here needs an equivalent adjustment.

I'm afraid I don't seen any further is_hvm_*() in this function.

> But in this case, I'm not sure the commit message covers the relevant
> details.  ioreq servers have been made fully common since this code was
> written, and *that* is a better reason for dropping the predicates IMO
> than the redundancy with paging_mode_external().

How does "fully common" matter? It's still a HVM-only thing, hence the
paging_mode_external() check just out of context. Also note that the
ioreq-server-page check is only one side of || (and I realize that by
correcting indentation here at the same time this might be better
visible).

> That said...  I'm not sure the logic here is correct any more.  It used
> to be the case that ioreq pages were in the p2m, but they're outside of
> the p2m these days, so don't see how there can be any interaction with
> unexpected refcounts any more.
> 
> I suspect that one way or another, this change wants to be in a separate
> patch.

I think that if there are further adjustments to make (like dropping
is_ioreq_server_page() altogether, as you appear to suggest), that would
want to be in a separate patch, but the change as done fully fits the
given justification. (Of course in such a patch both _could_ also be
dropped at the same time.)

>> --- a/xen/arch/x86/mm/shadow/multi.c
>> +++ b/xen/arch/x86/mm/shadow/multi.c
>> @@ -3441,7 +3441,7 @@ int sh_rm_write_access_from_sl1p(struct
>>  
>>  #ifdef CONFIG_HVM
>>      /* Remember if we've been told that this process is being torn down */
>> -    if ( curr->domain == d && is_hvm_domain(d) )
>> +    if ( curr->domain == d )
>>          curr->arch.paging.shadow.pagetable_dying
>>              = mfn_to_page(gmfn)->pagetable_dying;
>>  #endif
> 
> This one is dangerous.
> 
> After tracing, I can see that sh_rm_write_access_from_sl1p() is only
> called from OOS functions, but this function itself does its very best
> to look like it has mixed PV + HVM usage, and dropping this conditional
> means that pagetable_dying can, in principle at least, become non-NULL
> for a PV guest.
> 
> I think this function needs to be made far more obviously HVM-only first.

Oh, sure - the #ifdef inside the functions can be replaced collectively
by one around it, now that OOS code is built separately and for HVM only.

>> --- a/xen/arch/x86/mm/shadow/oos.c
>> +++ b/xen/arch/x86/mm/shadow/oos.c
>> @@ -577,7 +577,6 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
>>      if ( pg->shadow_flags &
>>           ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
>>           || sh_page_has_multiple_shadows(pg)
>> -         || !is_hvm_vcpu(v)
>>           || !v->domain->arch.paging.shadow.oos_active )
> 
> This is reachable for PV guests as far as I can see.  What am I missing ?

Well, the footnote in patch 1 ("x86/shadow: fix and improve
sh_page_has_multiple_shadows()") kind of explains this wrt the safety
of the sh_page_has_multiple_shadows() use here: Since PV guests can't
have OOS pages, there's no way SHF_out_of_sync could be set.

> The changes in hvm.c are all fine, and for those alone, consider it R-by
> if you end up splitting the patch.

Thanks, but for now I'm not meaning to split the patch, as per above.
There will be a new prereq patch as per your request.

Jan

