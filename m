Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF56C6C71
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 16:42:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513943.795729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfN3j-0005Cq-Rr; Thu, 23 Mar 2023 15:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513943.795729; Thu, 23 Mar 2023 15:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfN3j-0005Aq-Ov; Thu, 23 Mar 2023 15:40:59 +0000
Received: by outflank-mailman (input) for mailman id 513943;
 Thu, 23 Mar 2023 15:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfN3h-0005Ak-VS
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 15:40:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1611bafb-c991-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 16:40:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8257.eurprd04.prod.outlook.com (2603:10a6:20b:3b6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 15:40:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 15:40:51 +0000
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
X-Inumbo-ID: 1611bafb-c991-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/IFomENoZjxhMgCe/QW2YEKOagjyP5V6NRguyou9Isy2HTT4bco7yWFDkVcquqQUzXnQWlqnwx/8rUscF6ckCZpV9iVEi9xLnpo9c5ZRzwGLsJFVZmb1fS5dmG2H6GTqYeCggeefV13hW4KWexZ9qVgDRLDsfAps7n/+nKur5cJ/FoIedT9VARNw/ZoBXqSvTNUGAcTDa8RMcNLzpfWBPtBH22lBAvx+Ze6TosZ42K7yHy5jzehf5tqVpK+3/wsjEQ7N5ISh2hlQGAqIx1Qy1IFJ5N/FbrqATNC10FiVMmLRHmMMsIbmTLfFBa6kBtuJbcTOhIbPp3vopbW6duHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1swhVX/o47uENkgSIFpTWemaVHBNgjE5l9fqR0FAe8=;
 b=gQyp3JHTYuWfWnJsS4y2lQzAgp+M76YgSJowiJQlrvGtz52paZ5FCJnl5g0diXvkUUlpWiZwf3kgGvzILVvBHZFX/u7ak6KKEcSzUvrJ2WQgEW/yqvy1AjJJpXgCmXGAiUQJ/O8JhCwUmiufMr9S6WH+Ncdeo64Wr5yBDwRAf+1i1hJgmqaBkPeBqkVqKrsRNQCQaoWp7XTeHj+aQhqe/dRtC5oRtRcNwpT5J878XFTEnTHsAYyfu5KpEX9v5C4kYfy0qK+yt1HqQgwxRNskAl4b18O2xEa2mezvstKEMzAzUfj1P/QSK5wu5egDlrrrOMEgnFy6TQEQ4wT3mIWrTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1swhVX/o47uENkgSIFpTWemaVHBNgjE5l9fqR0FAe8=;
 b=sxtjmDwJiv/hOO0vPtcWMJrenOZTSC0N2A29aPk6sISXtCOdCIO2glzrvrwyH/64gSJqYJ207XlAZeWNGsRMrsm8npRqzaubz5JImHEvZQ748qkm9EQQpNjc6xJoDiqTXfJjxRR+AwmgiAKATFmESTlco03qOiNVCvyNNLwKwdx013L6EoHhfoDZVqOz3LQwSokiFkA1dWaTOiayUsM4FMBGW6OIy2dS3IbQZO9ZDN8NhK46fzeXbJnPVKJH9UTpwDCfjuokWvZKrXuuKqOobg1OhWQ4XjQfY2hZ/RWFqoDdqLwqBRbUulMS7T9RPbqek8dLy1AbSVGxJWzN1cIyfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dfc15fe8-aede-4e01-ecf3-c3457c95563f@suse.com>
Date: Thu, 23 Mar 2023 16:40:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/16] x86/shadow: move OOS functions to their own file
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <88be7d2e-325b-2a32-fe9f-ce762bb7b606@suse.com>
 <253e45ae-4b66-a618-6385-b0fa018e693a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <253e45ae-4b66-a618-6385-b0fa018e693a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 622828c5-40fb-459a-539a-08db2bb4fb80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VrhMAiLexNbHpSUI+MVPWDso8m3+HiX0U8TPclvgYNLCVjaZ6d/MGaNl50j5ssjr/QYkwRxACGCCfPo76umjdtUMbm3B1sg+M2n8/GA8RX8GpyUrZF+FyTVBARKlO8R2wqedBHg7vPc7CPfPMuOhDtRHPCNhU92p44rEkCA948ahRLTxceT7EJAeNZPvXoLzqavfIhS+REWbiNRjbf6mAnLrliVpEIyVaAb2As+VZFKV2JnFHsY527WsKBuaJf0yL4uR8WhITYQRuI3KdQOkfrqYfszJkEzrH5knw3OmOYU/gDFUCsfmqDk1TcE5kgu82YqYu2byqS2cuXMCdwiSeL3CnPhBVgqK0OWCoMZDo36mIwB/NYZrHnjZSKmtQXhqWiMX2B1ENkx3n4D++As3ujNbEaUexMolcJMglT9osZR+D61hT+E9gnH0cViomY6Fg2SRAat84Wn6jl+spsvWHlkLAYxawKY2nIVM/UkymYQIKqR1KVLFtV3HIHAbhOct9bI76JuFN9pslUSmyYG6VX5uQC6LC7AgA6p7hngLs2FUboscsKQRlhz/2gGQR8vvTi12dDxQapzTI5MSOpyj0V2l6suNkm15U0vDkiavsogFaSjQHhaTs0qrL2zEqt5BYcSGAP1JLOx9eDcE5AGxN0SvnOxvdnvF8Z2fSpUpeUCJcJkPHsPZe5A9CqfQY7dFrx4UDOulThpB9oiQJLVqN2UFQUoAid6teOjd1Pfdbps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199018)(31686004)(38100700002)(2906002)(66899018)(478600001)(83380400001)(6486002)(2616005)(36756003)(186003)(31696002)(86362001)(6916009)(66946007)(8676002)(66556008)(4326008)(66476007)(54906003)(316002)(6512007)(6506007)(26005)(53546011)(8936002)(5660300002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QStzSXdnNXpkQ05abkZGMi9zMHpUNTNoSTZnbVBUOWtpQlR4QUFnRWtHallz?=
 =?utf-8?B?eStXRERrVFlTQmE4ZzNXa04vTUd1WTRiSGQ5dU1wYjEzNzU0V0lLN1EwWmx1?=
 =?utf-8?B?ZkIwbmpJZTQ5bDhXaUVnVEppY1lCUGdEUG5wWjJlSVBLUnR5NitRVXZRYzJK?=
 =?utf-8?B?c3Uwd2tVR2xWTFBYbXRGV2ZaRWNHV2pCK1l4ekNsMlBYUHM0QWxINi91MXp6?=
 =?utf-8?B?d21FckJlbmcwSUYxOFpoOXZWYmJDZjZxWjFhZ1N5TVZ3ZWg4cmo3UnRtdDJK?=
 =?utf-8?B?QnZUOHNESzNuZHRYZVd0SXpSejV2TFYzTHFkVlhaQ1B1eDlVVlMwWkRBcTMr?=
 =?utf-8?B?ZHVva2dpamFDNEkrN0pOY0FKWWFoQnJsVFlQdEI3Q3ZFbm1TbElrU1F2NkJ4?=
 =?utf-8?B?Zm1UbStNUENXVTZnekEvcjlYekhWU3dSL2MyNW5pbmFOQWVLUlNmaDdMWWdm?=
 =?utf-8?B?Sk9wRnVXTWxLcll1UVpZNHZMTXdsZnJXSm42anRZRTJ3VnJ2R1NBSEhWSmVQ?=
 =?utf-8?B?cklLd0paT2ZzNUh3RlZXRDA2ckxSQ2QvMGtZSm9LRUxEN0lQRGVOWTVGYUww?=
 =?utf-8?B?YVJPdVVIQ0wwdktZajVhL0ZkRHFFY3c1KytvTmRIbk9BcSt5YjZTVy9rVjdT?=
 =?utf-8?B?cFRrNTF6c0ZuVGpHZVBOVDhKeU9aQnp4dW1NNzI1NGhqb1EwRWQ4aXdrTEdT?=
 =?utf-8?B?emM3MUQwUzNXMmdjdGR4WFZCWDNkcEp1R3hSb01oL2tIUUluKzNvbzIyQ3VO?=
 =?utf-8?B?NGNUQVE4dG44Nkh2SzhaOGJTWmo5VEhXWDNKNWxHMFA3cy9DNjRJSStJVC9r?=
 =?utf-8?B?SzFJeVJ5OVh1YXBZb0NJQjM5Mll6UlFBTmVrazdKeitkb0lmREI0b0xjYjFE?=
 =?utf-8?B?MFFHdVFDcllMRHNabjFQQnBSSVRoRlI5dUxtejR3dHFZRHhoK3U3STNSbEVa?=
 =?utf-8?B?dm05Q0ZkS2ROM05GWitWVitGTC9FYjhJaDlNRUkxRUlPL1oxVlQyb0NZRWJF?=
 =?utf-8?B?U3BabFhFcUI4K0xCY040SGVyVnhMamdwbERhWjFXRmp1M0pDdWxiREZkMWpZ?=
 =?utf-8?B?YndnVTZwQjVraTR4RytrK2toOEpKVUQyZTl2aTRsbU5DbEdvRkVFZlBIV3Ry?=
 =?utf-8?B?ZE5xWm1HYUtpMDJZL0pnbUJ4SDA4cHRNS0NFOC9HTDlXb29uQjdPSnNnMDNZ?=
 =?utf-8?B?Ni9EQ0V3bFNiYkxZYUFLQi9DYUx1MW1OdkJWa2xpemU4M1RwUWo4em5XRERK?=
 =?utf-8?B?WnpsVitSK0c1TGNma0dSeVRXbm9JajdvYVFBSHBuTXgvME5FakZiYmk1OEdZ?=
 =?utf-8?B?UEpjOWhTcDM1L1FMeWJFbHFJSmVTTXJwaE9kK25NcUs3amJRY2E4ZmpYdXMx?=
 =?utf-8?B?VE5QMTBRMkszbTFOR0luL2ZVK0FpVUxHUDVPZWUzRkJMVWg3V05zSDc5bkdI?=
 =?utf-8?B?Q1M0Kzdubm5SenozbWVZb2luSXdscHRrSHFwUXBHZVNJSm8vR05DQkJ5eDli?=
 =?utf-8?B?YjNvNmh5U1M5VmkrTVhFRW9zNGNHY0RJZGVpYXlQbFAxZWJvZW52bkdNMzhE?=
 =?utf-8?B?SUM4WHdYdkJsTkRuSTBLbnlDd0lZZjJjUG82SVhreXNlUmlTS1JEdEVIT1o0?=
 =?utf-8?B?TkoxcnJCY0p3U2lITkJKdjlOMG9ENnFmMWZDS1o5OUFjK3lGdHBhTlZsZ3po?=
 =?utf-8?B?QzhOSCtzSEJrSWgzT2hRS2luZnBPWC9KVDFDc3Jkd0pqTG5XTnh5M3l0NS94?=
 =?utf-8?B?eno1K0ZYYWtZWHorK203WEdIRXBFY2pjOEVZWFB3V0RGYkZGZlFndXI3bzFi?=
 =?utf-8?B?aFk2bXFsaFBjeU5YOTRhQVFNaUM3OGdjYjh5cXlhbldKR1dXb0dpUng5Y1R2?=
 =?utf-8?B?QTVyVS9sMHExdXlUanZVeDIxSXVpSnduWDhCSmVTeXlwTHMyYVpIT2Vqd2th?=
 =?utf-8?B?ZEp1M2lQRmtCOFNvMllsUmFWaXVnVG9nZ0o5OHdaSmJTN2htaEtLREFyVWcw?=
 =?utf-8?B?Lzh1bzJEOXJkZ25Na3dWM3Z2UXhibzZLUUxnY1AyaG9wcXpxTU85UE9JTTdh?=
 =?utf-8?B?eXhZaTNLSnBRb25JZHRzNDdBQk9QZzhGVmwyRWdkVWd0Zm4xRGRpRjNOSDNt?=
 =?utf-8?Q?0OJD6kKEIDAO7/OFeZztAfkgO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622828c5-40fb-459a-539a-08db2bb4fb80
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 15:40:51.7905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9ir01a4Kv9Kvb1AU4ek+5Z6H8cwSuZpONcW54xgqpZVyZ2d0Nsaa/DmAh1n9OasII/xbipSPVLkW0ZxabqbAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8257

On 23.03.2023 15:30, Andrew Cooper wrote:
> On 22/03/2023 9:35 am, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/mm/shadow/oos.c
>> @@ -0,0 +1,603 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> GPL-2.0-only
> 
> The unqualified form in deprecated.
> 
>> +/******************************************************************************
>> + * arch/x86/mm/shadow/oos.c
>> + *
>> + * Shadow code dealing with out-of-sync shadows.
>> + * Parts of this code are Copyright (c) 2006 by XenSource Inc.
>> + * Parts of this code are Copyright (c) 2006 by Michael A Fetterman
>> + * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
>> + */
>> +
>> +#include "private.h"
>> +
>> +#if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC)
>> +
>> +#include <xen/trace.h>
>> +
>> +#include <asm/shadow.h>
>> +
>> +/*
>> + * From time to time, we let a shadowed pagetable page go out of sync
>> + * with its shadow: the guest is allowed to write directly to the page,
>> + * and those writes are not synchronously reflected in the shadow.
>> + * This lets us avoid many emulations if the guest is writing a lot to a
>> + * pagetable, but it relaxes a pretty important invariant in the shadow
>> + * pagetable design.  Therefore, some rules:
>> + *
>> + * 1. Only L1 pagetables may go out of sync: any page that is shadowed
>> + *    at at higher level must be synchronously updated.  This makes
>> + *    using linear shadow pagetables much less dangerous.
>> + *    That means that: (a) unsyncing code needs to check for higher-level
>> + *    shadows, and (b) promotion code needs to resync.
>> + *
>> + * 2. All shadow operations on a guest page require the page to be brought
>> + *    back into sync before proceeding.  This must be done under the
>> + *    paging lock so that the page is guaranteed to remain synced until
>> + *    the operation completes.
>> + *
>> + *    Exceptions to this rule: the pagefault and invlpg handlers may
>> + *    update only one entry on an out-of-sync page without resyncing it.
>> + *
>> + * 3. Operations on shadows that do not start from a guest page need to
>> + *    be aware that they may be handling an out-of-sync shadow.
>> + *
>> + * 4. Operations that do not normally take the paging lock (fast-path
>> + *    #PF handler, INVLPG) must fall back to a locking, syncing version
>> + *    if they see an out-of-sync table.
>> + *
>> + * 5. Operations corresponding to guest TLB flushes (MOV CR3, INVLPG)
>> + *    must explicitly resync all relevant pages or update their
>> + *    shadows.
>> + *
>> + * Currently out-of-sync pages are listed in a simple open-addressed
>> + * hash table with a second chance (must resist temptation to radically
>> + * over-engineer hash tables...)  The virtual address of the access
>> + * which caused us to unsync the page is also kept in the hash table, as
>> + * a hint for finding the writable mappings later.
>> + *
>> + * We keep a hash per vcpu, because we want as much as possible to do
>> + * the re-sync on the save vcpu we did the unsync on, so the VA hint
>> + * will be valid.
>> + */
>> +
>> +#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_FULL
>> +void sh_oos_audit(struct domain *d)
>> +{
>> +    unsigned int idx, expected_idx, expected_idx_alt;
>> +    struct page_info *pg;
>> +    struct vcpu *v;
>> +
>> +    for_each_vcpu(d, v)
>> +    {
>> +        for ( idx = 0; idx < SHADOW_OOS_PAGES; idx++ )
>> +        {
>> +            mfn_t *oos = v->arch.paging.shadow.oos;
> 
> Newline.

I'm happy to add the newlines you're asking for (also below). But ...

> But the variable placement is weird.  oos ought to be one scope further
> out to prevent recalculation in the for() loop, while pg and the two
> expected could be at the inter-most scope.

... I don't want to go farther than that - see "but leave the code
otherwise untouched" in the description. This also goes for several
of your requests further down.

>> +#if SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES
>> +void oos_audit_hash_is_present(struct domain *d, mfn_t gmfn)
>> +{
>> +    int idx;
>> +    struct vcpu *v;
>> +    mfn_t *oos;
>> +
>> +    ASSERT(mfn_is_out_of_sync(gmfn));
>> +
>> +    for_each_vcpu(d, v)
>> +    {
>> +        oos = v->arch.paging.shadow.oos;
>> +        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
> 
> Same for oos and idx here, which would shrink this function overall.
> 
> As a tangent, do we really want all these modulo 3's all over the
> place?  It's a lot of divide instructions in paths that are fast-ish for
> shadow guests.

I don't think the compiler translates division by constant to DIV / IDIV.
It's multiplication by suitable "inverse" and then using the top bits of
the result iirc.

>> +        if ( !mfn_eq(oos[idx], gmfn) )
>> +            idx = (idx + 1) % SHADOW_OOS_PAGES;
>> +
>> +        if ( mfn_eq(oos[idx], gmfn) )
>> +            return;
>> +    }
>> +
>> +    printk(XENLOG_ERR "gmfn %"PRI_mfn" marked OOS but not in hash table\n",
>> +           mfn_x(gmfn));
>> +    BUG();
>> +}
>> +#endif
>> +
>> +/* Update the shadow, but keep the page out of sync. */
>> +static inline void _sh_resync_l1(struct vcpu *v, mfn_t gmfn, mfn_t snpmfn)
> 
> inline can go.

I'm feeling on the edge with "inline". I'd prefer to leave them to keep
"untouched" reasonable true, but if you insist I'd be willing to include
their dropping.

>> +void oos_fixup_add(struct domain *d, mfn_t gmfn,
>> +                   mfn_t smfn,  unsigned long off)
>> +{
>> +    int idx, next;
>> +    mfn_t *oos;
>> +    struct oos_fixup *oos_fixup;
>> +    struct vcpu *v;
>> +
>> +    perfc_incr(shadow_oos_fixup_add);
>> +
>> +    for_each_vcpu(d, v)
>> +    {
>> +        oos = v->arch.paging.shadow.oos;
>> +        oos_fixup = v->arch.paging.shadow.oos_fixup;
>> +        idx = mfn_x(gmfn) % SHADOW_OOS_PAGES;
>> +        if ( !mfn_eq(oos[idx], gmfn) )
>> +            idx = (idx + 1) % SHADOW_OOS_PAGES;
>> +        if ( mfn_eq(oos[idx], gmfn) )
>> +        {
>> +            int i;
>> +            for ( i = 0; i < SHADOW_OOS_FIXUPS; i++ )
> 
> This is a case where "for ( int i = ..." would definitely read better. 
> Luckily, this example is simple enough that the compiler has already
> optimised properly.
> 
>> +            {
>> +                if ( mfn_eq(oos_fixup[idx].smfn[i], smfn)
>> +                     && (oos_fixup[idx].off[i] == off) )
> 
> Given that you mention style in the commit message, it would be nice to
> move the && onto the previous line.

Sure, done (and there was a 2nd instance).

Jan

