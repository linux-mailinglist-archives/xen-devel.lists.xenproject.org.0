Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FEE6F3F5B
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 10:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528389.821458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptlXA-0003he-Qn; Tue, 02 May 2023 08:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528389.821458; Tue, 02 May 2023 08:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptlXA-0003fD-NZ; Tue, 02 May 2023 08:38:52 +0000
Received: by outflank-mailman (input) for mailman id 528389;
 Tue, 02 May 2023 08:38:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptlX9-0003f7-5K
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 08:38:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c25d6db5-e8c4-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 10:38:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9981.eurprd04.prod.outlook.com (2603:10a6:10:4d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 08:38:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 08:38:46 +0000
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
X-Inumbo-ID: c25d6db5-e8c4-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgyPGO1kksQmiFNu/Kmo6csu45oBbMdf3mtqKjvozgwEIuyaupOZM2nP/H9lg2wpREH1kkTIgTKtH0zmOjgA7V1n+XQZNarmk1Kf+yMimm+yh6NX7UD9Ep+YMfbBjfdXRpfgRWtEKt0EOglhEvipF8CEmtFPeQg58ebKTygPazEvANqMqfjYLag2Lah0ZVvCxqaZFsv16WyRII5oZQxzEHnd7ADu6vEyv+OJO2opQufJ6hGAfQILyVhwhGxHwSB0lXscK80NTrqz7C0Lg9TBEldRRkIAFMhTAC7Y974J4qyk5A0RLc+VRMW25ENWYfupxwnh2pZNZ71MT+hXLG8uUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xuhrjsvox4jEM2bJBgm4PuEwQYTn8ZcnwU6nTDq3t+Y=;
 b=Fp3h7WbOh3Hekd+IwRQV+qzZOnzdbfVVgN3zs7qbZ0r0JqrLYepW8teNZo49VIc6JMNN5tVc/z0zStWUy70WWAtM08dJ6PARKJXbK+XFMv0Y7FVXGq5hX0AuXG1ro1Oc0uciY1A/zIcmK6mdHku6EhoGXVk6umwZ9TlDnX/pyrcKzu2A7XU+v3X2fUKDDCNR62L/z87+59+GYqvqJUGqc/ccDp47Bjouxw3r9AMIyimQX5VJQ0mk9yMnY9R/oG4Bk+9XYK0a8D2A0OCk4li0KXcygbxbQ8nzF9usOlQLY/uHGUOd11GBfYTN5uSgqP0EBLi4+L3AcCHmoqpnbG1nbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xuhrjsvox4jEM2bJBgm4PuEwQYTn8ZcnwU6nTDq3t+Y=;
 b=EfAtQOdEHEAhCwwZCtwF6/ysvKn7eLbxrFN4oBCio20mbUdB2tjLNk/Nn9iSK0LBILwxvdjDcqJkbVjMFVlhdRIGCp3NNzHL9MDNdbyXo5GEIvjZh04vK/KaknmYXnJRlyD5HJtcmLDzjxJ3c3+3i1FLb+tJo2jiGFbUg+5157RAM3644Q0f35fhAaCS+2SX9jCpwou3Rwb1o0z610CatGPMjeB8hv7I7Blo7l6+5ZQIPD/+u5t397UhxJ2b/XMkqJqA8djcsnfKAyCX4nIOl9I19C2QyiHrRLdREHc03zwzXHenvS+ilzBu8gFb5EGnKsaDVttGI7f4FVGe9HFn3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <11eb3319-d03b-ef5a-7006-49f0cbb2826a@suse.com>
Date: Tue, 2 May 2023 10:38:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] xen/grant-table: Properly acquire the vCPU maptrack
 freelist lock
Content-Language: en-US
To: Ruben Hakobyan <hakor@amazon.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230428102633.86473-1-hakor@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230428102633.86473-1-hakor@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9981:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2eb96f-1957-4363-6937-08db4ae8a4f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ar/flNsbbs3iq++bvZBgFotxcVttPfyqEBUzYSVUNx8IA6oUvCyuh354j1cRg1myXRLY4d16DCQ/w2zi4RMaxvY7rwbybV+JkNxUhlMzhCR0PiPXeO/zfMftsiyzBAdMvasRJxz7vq7uS1eO48tbsadvfQIBZdfa/ENIIOEpY51U/SHL9/vn7t4gHPJmI1wlpFg88NPDKS8TsZk+65l5imkuyOEYe3vK+q3RcuctyZES0dqILdKRwfrq5Er4vvo2pOmJKBFxpQnepHUNFyzNqfDDAVCei8FFyHgCH7j6lc0JojInm8riFy/JZLX0hAp6RYLrkDP8Gp5E6ZNHCZ8cdoivpycTogJKceuyTk0wVF/0Klr7AsHNKv6BK8zO8NEB/y1FchbYzCeeUgPstFKgBgIgSjbt1b/UNboQq3Iei/ckG1V4b3JHRr1oCv/6FfhTWkXf3kezV6w8qJF4j+zakCO0RWZwO/22KiqZPneBBf3uGwQz1KHPqGNrg4Lt1Cw8k+pKg1zaCB+eKJVeHRS990k5oFbFqH4RrkqlZx8WhIAiLD4eUxRn8eE8K6kN43aOoqGvg60vVQilqRJl8FHMKBq5Q99Pk7VioS5ZQ2GgQn+3PQ1BWxpGzsYN84JEQPoTj3p5sbQFYvxu/LhYFPtc6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(26005)(8936002)(2906002)(8676002)(2616005)(6512007)(6506007)(53546011)(41300700001)(83380400001)(31686004)(5660300002)(38100700002)(316002)(4326008)(6916009)(66476007)(66556008)(66946007)(186003)(36756003)(86362001)(31696002)(54906003)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDQ0Skg2WTFrWWNGbytTQ3Fma0FQMklZVnpxc0Z0Z1YrMjFzVFJLMlRSOHpr?=
 =?utf-8?B?VEdKalJNTlFuMTN6QnBwZndnRFZwa3ZLb0Q5eUt0a2V2REd6N1lnbWNPdEJX?=
 =?utf-8?B?NDNleUt1VVdxNWxJYWhvQzBhODdZN0Juak9tU1gxc28rckk1NXQ3SnV3d1VQ?=
 =?utf-8?B?bWRmUzVHQTBPTVFCSDJOQ0VqVWxUTko4WkJHOUxLamNjZEU2NDdpaWtBWEs0?=
 =?utf-8?B?T3g1c0NDMk5JN1hBUnZHVlY5WnBvWnF0YVAxNlpFYkVaMjdhK1I4VjZTcGFw?=
 =?utf-8?B?cnc2RS9SRENVV2RKVFF3SXVmeFhYOWNDZko2WkdZbTlHMGpXVnQ5ckU5YUV3?=
 =?utf-8?B?NW8yVWhOd0tyV0lZTG5GUjdURDdCMW81VUZxRTI0Ykx0RldLTVZLZHkrbERL?=
 =?utf-8?B?NHpUQ0NER1ZscVl6cnZVRVhvUDNrYXNUTkh0R1kwU1VEazZiOFlYZmxibzRo?=
 =?utf-8?B?aHFmMGQ1UlVGUDJtaEV1QWVkUENVRjNMUjRsbDVwT21PZHFsMXFtbzJERVNN?=
 =?utf-8?B?U1p0Mm5CRk9ITUhlNXN5M3hnQ1lsVDkwa2xRNUh5YnVYTE1OWis4TFRNSEhT?=
 =?utf-8?B?aTg4ZE1tTFNBNTM1aFg4VENkTVp6UFIwZVl0WllTUSttejVPV2VyM1gzY3BN?=
 =?utf-8?B?d1Z3eU03OXVKR0Q3NnRSQi91TUNISGpHNnRNM3dUWm9ubW9Xc01xRWp6VE5l?=
 =?utf-8?B?R3NmWUZLZUFLY25yNUVmalhzYXRJcGxaRlJHRFo2SFlSRGFFNzhsdVZQS3BY?=
 =?utf-8?B?MkxQbjNXRWJVendId0J5aFZxNHFIQjNobkxTOTFnMGNETEQ2c0FZMmhzNjg2?=
 =?utf-8?B?SEovS2paVkQ3YnpDWittOUZBeGRnVlcxcmxGYitPNFplQnVyTmFWZVJ3eEZV?=
 =?utf-8?B?WFFvck9DTy8wM3I1N01MZ04rbTJGRjJ0bXhKTWdTMlRwQ2dWMUs3R3FTcElt?=
 =?utf-8?B?LzM4d1BPTUNER2dZRVZNdHh3SGl0LzlzdnhNbGVyd3hCQUpBS29CdXA3dHlY?=
 =?utf-8?B?RWRGL2pKdWxySXRZV1dhV0tpU2pwNUljZ0l3bkVHVnBJVFJQamtCSTFIYTlM?=
 =?utf-8?B?UlBYOGRwZUIyZ0k5bWlzYjVHWUpGYVpIT2wwTGZ2cDhBQXd4cVZieldZbmc0?=
 =?utf-8?B?WUtSWWNqVGd4TVkzMUlRdmtUY3dRd1dnOGtIVWFsQ0tES0dhTjk5T2V2RTc5?=
 =?utf-8?B?RlZEUm5UTGVkVnJGbXBDRnB3eFVkN25IRkNTTko3THdmSTNGU1g5MmVQNjZK?=
 =?utf-8?B?SzNvUkpmb2FaanNYV2VCT016RmJIMGZDQUU5SndZNXprRDJZcXp1UUJGdmt5?=
 =?utf-8?B?cU1pb3lDYmhDbURNcDlIN3NEMnc3YWJvU2YrWmlETi9MSTBFbFpEWS80Zi9w?=
 =?utf-8?B?VUJuNVRTTnk2QWhacXRpbFIzNVE3QmhmV0dpUkdPWmxtT01LaFFqMW5wcFdC?=
 =?utf-8?B?WWtUOERNTkl0czBzcFFmcTNtWllrQjRSZDJsWFhwVW9FRUV0ZEQ2ZHNvek1W?=
 =?utf-8?B?MEpvdGJGZFAvZS80K1BhQStEVEhkMXh3UGxIcEwvUkxFalorSEtFeWVQaVRY?=
 =?utf-8?B?ZzFsYXN5SGdoSXNGdmlpOWhGSFlaZU5oLzk2TDAyVXJCR1czZmdvUGkwaU91?=
 =?utf-8?B?Ujl4VHFqNVYrMFkvbFNUelBjOERnMjJDSVF0TjFkVWNMc0dMYktkRXBudVM1?=
 =?utf-8?B?WFdSSk56NFBKTnVEM3h1bnlCbVFPTFhSSDg2Y1hyM0MwbXZXQVZEeno3T21m?=
 =?utf-8?B?WGVpaGVNYlFVRXpTRkdkY3dudkp0Q2U1WmkvRlJ0b2VTQmsrSzhWVEZmQ3lh?=
 =?utf-8?B?Y2dpTW92eHFucHovN3h4VXhqMnVjekZ5eC9XbWg0UmlqK2Q1YkJkV1dLanpM?=
 =?utf-8?B?Uk10MHBOSWM3ck0vVUFoUGdacmUrT1FJeTJDVklySFdaSkx3UVpCaHNMVEtn?=
 =?utf-8?B?VEhwRlZTU1VabndGbjM5OWNNdXFld1VUY3F0eUwxUjN2VVVVUW1wbmNucTFv?=
 =?utf-8?B?RndQTUlrZXhHdkJhK0wxTWc5b1llaHNjbzB5dzJVNWR6K1F4TjBHMGJqcDRa?=
 =?utf-8?B?d0VaRTcwMmdnOEpuUTFXWXBqakZKdTNFRmZFSkt2c2k4VHFtUnNtQXl5dkJm?=
 =?utf-8?Q?MTDrxG2t74xWNPd/+bnTleCTU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2eb96f-1957-4363-6937-08db4ae8a4f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 08:38:46.4926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stFiVwYEEacLnhdC26P047dlW2uX6MEap5XMaLHEYwydGVLmx5hHvPJa7GHqrlkBwgHQH9Yh/gqwysy0ey4HWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9981

On 28.04.2023 12:26, Ruben Hakobyan wrote:
> Introduced as part of XSA-228, the maptrack_freelist_lock is meant to
> protect all accesses to entries in the vCPU freelist as well as the
> head and tail pointers.
> 
> However, this principle is violated twice in get_maptrack_handle(),
> where the tail pointer is directly accessed without taking the lock.
> The first occurrence is when stealing an extra entry for the tail
> pointer, and the second occurrence is when directly setting the tail of
> an empty freelist after allocating its first page.

I don't read out of the doc we have that this is a violation (the lock
still fully protects the list, just - as you say below - that in two
cases taking the lock isn't necessary to achieve that goal), and iirc
the relaxation was done quite deliberately. Did you, as an alternative,
consider making the doc more explicit?

> Make sure to correctly acquire the freelist lock before accessing and
> modifying the tail pointer to fully comply with XSA-228.
> 
> It should be noted that with the current setup, it is not possible for
> these accesses to race with anything. However, it is still important
> to correctly take the lock here to avoid any future possible races. For
> example, a race could be possible with put_maptrack_handle() if the
> maptrack code is modified to allow vCPU freelists to temporarily
> include handles not directly assigned to them in the maptrack.
> 
> Note that the tail and head pointers can still be accessed without
> taking the lock when initialising the freelist in grant_table_init_vcpu()
> as concurrent access will not be possible here.

This "no concurrent accesses" is the justification also for at least the
"set tail directly ..." case, aiui.

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -660,23 +660,27 @@ get_maptrack_handle(
>      if ( !new_mt )
>      {
>          spin_unlock(&lgt->maptrack_lock);
> +        handle = steal_maptrack_handle(lgt, curr);
> +        if ( handle == INVALID_MAPTRACK_HANDLE )
> +            return handle;
> +
> +        spin_lock(&curr->maptrack_freelist_lock);
> +        if ( curr->maptrack_tail != MAPTRACK_TAIL )
> +        {
> +            spin_unlock(&curr->maptrack_freelist_lock);
> +            return handle;
> +        }
>  
>          /*
>           * Uninitialized free list? Steal an extra entry for the tail
>           * sentinel.
>           */
> -        if ( curr->maptrack_tail == MAPTRACK_TAIL )
> -        {
> -            handle = steal_maptrack_handle(lgt, curr);
> -            if ( handle == INVALID_MAPTRACK_HANDLE )
> -                return handle;
> -            spin_lock(&curr->maptrack_freelist_lock);
> -            maptrack_entry(lgt, handle).ref = MAPTRACK_TAIL;
> -            curr->maptrack_tail = handle;
> -            if ( curr->maptrack_head == MAPTRACK_TAIL )
> -                curr->maptrack_head = handle;
> -            spin_unlock(&curr->maptrack_freelist_lock);
> -        }
> +        maptrack_entry(lgt, handle).ref = MAPTRACK_TAIL;
> +        curr->maptrack_tail = handle;
> +        if ( curr->maptrack_head == MAPTRACK_TAIL )
> +            curr->maptrack_head = handle;
> +        spin_unlock(&curr->maptrack_freelist_lock);
> +
>          return steal_maptrack_handle(lgt, curr);
>      }

While this transformation looks to provide the intended guarantees (but
the comment would then need re-wording some), ...

> @@ -696,8 +700,10 @@ get_maptrack_handle(
>      }
>  
>      /* Set tail directly if this is the first page for the local vCPU. */
> +    spin_lock(&curr->maptrack_freelist_lock);
>      if ( curr->maptrack_tail == MAPTRACK_TAIL )
>          curr->maptrack_tail = handle + MAPTRACK_PER_PAGE - 1;
> +    spin_unlock(&curr->maptrack_freelist_lock);
>  
>      lgt->maptrack[nr_maptrack_frames(lgt)] = new_mt;
>      smp_wmb();

... I don't think this change does: It now leaves the free list in a
transiently corrupt state until the freelist-lock is taken again a few
lines down and the list is further manipulated. Ftaod it's not the state
itself that I'm worried about - that remains as before - but the
supposed implication of the list now always being in consistent/correct
state when having successfully acquired the lock. (Iirc one of the goals
with omitting the lock here was to avoid lock nesting, even if this
nesting arrangement is permitted. Plus of course said observation that
acquiring the lock once here and then once again later in the function
doesn't really help. I don't recall though whether there was a reason
why setting the tail needs to be done right here. Yet if it was to be
moved into the locked region further down, it would need to be
clarified that such movement is correct/legitimate.)

Jan

