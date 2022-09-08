Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F1F5B1C8C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 14:15:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403289.645352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGQZ-0002BQ-7v; Thu, 08 Sep 2022 12:14:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403289.645352; Thu, 08 Sep 2022 12:14:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWGQZ-00029d-3z; Thu, 08 Sep 2022 12:14:39 +0000
Received: by outflank-mailman (input) for mailman id 403289;
 Thu, 08 Sep 2022 12:14:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWGQX-00029X-NT
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 12:14:37 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140079.outbound.protection.outlook.com [40.107.14.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdba628a-2f6f-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 14:14:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8005.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Thu, 8 Sep
 2022 12:14:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 12:14:33 +0000
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
X-Inumbo-ID: cdba628a-2f6f-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfBLSAvQ1E3cJqAIwS9w0vd0OD5vvMQZoXqHAHd7Lmf9KP0VVRZFO6oaVHMgTXMS4SQ340nHQb0+kk37wDnLedNu6EbKJBTWdWV5abIo0yv8K18TP6YzGSBxTxWBzq/QfTlwiSaNnBU1VI+mfLktypbHQ2r7BpBkH7b5AubZ907DZlN8UFe+NnIEstzO95GEsiIkv2GgsZ6BnDIV86bCkFAFX/QPRH7Hsd1nQHTzLAHwRt8d4cHLRfI35saaXxCgLc9dKdHWcTqY50lUZUtfLiq9H8p9IEBXhrBHv5RjfSKdvBqAVrwtgGEULTqCXXd82sLxB2Dpx5cndopWaCxnkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cm/G9Hs8NmUWA9WJ5vqk4aPFJh6yZoF9Af7brcooRcM=;
 b=Eq6Upoogm9iTR2/mgvsPnuRc16eBFhflJA8YGPxBc9HtXRwfQMpVgPIFqCD7nEba3daYJdlFZa+YEuoyR1rQvt30R4acD/o3FsH8BGsUJfZ0TVxHYC8gWPzKHNyTJRU6dwJuhkTVjCrSxJaK9S1gp1JEvISJ5KBtLl1wR0KPy3YQNp6IDOOabr9a3T8IAI53tyhPmKEMe85x+DLgu5L082jnsl0XOFKZpgZStmUihN/8SB1qtuRkodVreFnauE6KLmbkaARUsEQqw6cctVdXaNhHOuFAgPCSI7fSZpVwZ0LxlbSXnhO8p3Pqgj9cMYoQKAeWdPxhE6bQ8AybYDX+tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cm/G9Hs8NmUWA9WJ5vqk4aPFJh6yZoF9Af7brcooRcM=;
 b=T51robzxZ7twrhMfsUCwn8q5Yy2uCyD21guUQxmecxKI6ncGgNYOzf6kvnPOtduV3sxmdUmOAt5OkwmDyfQolMGEfS2YoqihU8nIWwNVX2g1YNpIVBC64wGWi1x8E8dJ9uVVsJIIHVyrfx1TjvyVQz2tRUbYqk75smgfMlUyZbwAIxL/Mdws9xBdqJc+qFrFKUGVIlf1m++ETpODv1euDis3uH69+XMaT5l10lanH3+KZKZaKd+wvsMWFI6JmdKt/sdkdV9f0WZ3JUPR+ORBvLPgdLAZ9bs2fCEplU0fDmYQHuc8cuL9i9h5suBM/b2/H40B7qWQ4HpjHRcu3J9U6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <feec52d5-488b-8214-fde9-b2b26f78a5b5@suse.com>
Date: Thu, 8 Sep 2022 14:14:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 4/6] xen/x86: use arch_get_ram_range to get information
 from E820 map
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-5-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220902033121.540328-5-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec04983-db4f-4720-9d08-08da9193b092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UVRC8mUVm4fQVmAW9UOx1EkNkiKfo2dEVdW8hPMKPjlKpzFH8sLzAkDJuCQurLU57rfpeyHgfT7o79darntkKccBPM1bMcUQbOHFBUfDDyUw+osk5CK2UsX9KTw2wtAXPK1nMX/1yMl8IBwYs0mXn5TmYJyBZNs7oKVI1QjuEfx88EJJdG9R1HBz3GgYKxA7pBFhifo6fidO39RzXJQ0G1SLQJoPsC5Rb9Yxr2cyaEyay735lznQJ+FlltATbBtdSptVYjSXzL9puszCdSchVlio2L0VylJdVqTb/BFD+dwpTelukk0sIjNv2kpLGpTIBj+C+l9DXwCzrfMuTHRfIrU1yX7UFAmhIWhWLxUcNjQHk97A61vnRuCizjjoSFJl8HXirpGOPhqER15YK6frBa7Ls+i3KyGzRp62yeANGLc+cHDK/nbVAxDQ7UOEcCbUBOkJLDA4xnrtftCfW5iRInae+dDKrdd3eIiZjZ/xLKMHy+afq6cNa7g97A2a5DG8gPPfLy1QCgm7HAIpgKGMdHULLir1lF6g8ZE4IrxPG0SG6tDvcdbn+wZjbGMunpr8IsaBsbZ/QGTWbLGN1cp6WE1ifuAnW1TyPFjfU+iQo0rotqDOVKA3T2X6VJpC4GwVKvfieS0O6yP75GBvNfSXNWMM6BGyTmQX0p5+jhjYcENLsjNlzsRZFrFcdgJYwVNJq+oui0HDKIrLVemfm8rocxTDKDmWE3r1muXJnRRxD0a03OQuEMSiQbTYEkIn1wtakUcrOWPbarxTBNr5IUVatyt7OkpYRrWmcB/lO1OTVJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(136003)(396003)(346002)(83380400001)(6506007)(478600001)(6486002)(31696002)(31686004)(4326008)(186003)(36756003)(86362001)(66946007)(66476007)(66556008)(2616005)(2906002)(5660300002)(8676002)(316002)(54906003)(6916009)(6666004)(41300700001)(26005)(53546011)(6512007)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUlJOXBEV2JZY3A3YVkvTC8xNXVuSGhJK2s2c0NFY1huYXRPZlE1K2VEZkdi?=
 =?utf-8?B?bUpxeHBZL2JqSHFUMWNkK2Q0K20vV0tiRm51VXNHaXpkREJVQnRCWkc0RGY4?=
 =?utf-8?B?K0lTQTZGWWlCK0c0bjdoQXYzUkRFKy9xZWh2eEQrbEJtYThnMStLVTBGNVQv?=
 =?utf-8?B?ZFIvby9KbUhZWjQ5Q3pRakZJazRmN2VBb3hVQ3BOTGVrSlRwajFYWE5MZTdr?=
 =?utf-8?B?UW9aWTFua3BpWDN6STNoM3hZRHkxaWZvbUQ5eVhZNXdLbzUxZGd4T3dRWU1G?=
 =?utf-8?B?U0RjSlg2Wnhzd1dFd2E1MWo4RGRneEV5Ynp2MithbkNyZ1QvcWhBeUVOd3Nx?=
 =?utf-8?B?VEhDeHR5eEJoYWNBZ0pSbFRiRVFVTjA0MVhSSEV1VnA4bDI0c1JXVnk5VkxB?=
 =?utf-8?B?VlJVU0FqNEhXTXVlbHF1eERGQVJDbFFsSU9jVWQrY09udmgydlFETnFJbmxx?=
 =?utf-8?B?SGxxK0k5RHVsMnJYajkvbENFVEpVOHhseXJTRFliQWJwM3dQTHdNMWhPUDJx?=
 =?utf-8?B?dzJvangvSmdLYlh5S2UzOGRpam5qRElZalJVOHhYNlZ1aTJZL0wyMFdqWG5Y?=
 =?utf-8?B?MWtMcUord1pTRTlTQVdsdW5UbmpvSUJBWXdHUzBPaDdwMktDYm1PcXFuWGlH?=
 =?utf-8?B?dlFOaDEvbWhZMlZwNnFkTkxjc1Z6SGIxbldCUndycUltbVE3bVFqU1J5bm9w?=
 =?utf-8?B?eGlQZ0MzVjZxbHRrT1FIWHlveFhkaE4xaytaOHNISlhqa1RSSXZ1Qzd5U0ZQ?=
 =?utf-8?B?RHBpNjBscDRHYTFBcmhDWFBuU3pOdkcwWnp0WThRYWFPRTZSK2pHOG1ZRjcw?=
 =?utf-8?B?akdmZVJLck5WSnUvN1FISTg3TTdxTXRESnBVb3AxT0NvMGorWEMwTHFtOE9z?=
 =?utf-8?B?NUNtcTlLRDM0UndkVkVQUVFzSUcwZSt1TTVLRFVtUEJJM0xYbDJNYWZ3dGJO?=
 =?utf-8?B?YkxiTEpZNk8wUFJvQ0hRTkozamdoOU82ak5nZ1AvSTFxWnJncWVJdWRZV2pW?=
 =?utf-8?B?L2srWHBXTDdSWkk3N1hIaXVpN0VXVkx4eXp1TGVwMnJPYkNoNlRHRUNTcXhR?=
 =?utf-8?B?Sm9ZNWNteDJhSWJaWkYzSW42OXJoYkxTMHNXZmtPNlI5Y3djdkVrWTUvV2NR?=
 =?utf-8?B?ZDUvZEJqTjFEcUp2UGVNVkZNTU9BN3VHeFhXZmNYQUs1SEtqTEZHRDc0amlY?=
 =?utf-8?B?dEJOZ1RxVUozMkwwS1lpT3NydjlFc0JpK2NsaWF6Zk03R2Z4REx4UXNOTncx?=
 =?utf-8?B?Y2RNZDF5dUFTRFRxYVlndGU2ODlvWDNJcktYeCtsZ3oxc0hlN0g3RnhzT1Fr?=
 =?utf-8?B?c0RLY2lNOGhycEhDd29uQUxaV204VDd1OTV4MUNJQVBFZXBiYnVnUDBpM3Bl?=
 =?utf-8?B?UzlwVTQzb2ZpeE5oREU1SnM4azhCbnVwR2xXeVJTUG8vYXlkK0ZzamNmQm9R?=
 =?utf-8?B?NUlDcWw5Qy9BbHRNanE2cks1NGt3NTVHd0lRUVlNVnVLMHovQUlKUGYxa1RY?=
 =?utf-8?B?SnBYUjNQM284NTRLYlhRR3V3RmZ5cXdYVm9IMGdwVUJjeEIvWHVmN0tVWjEw?=
 =?utf-8?B?RUdvUm9EZEl0a1N0WkZWaVo2K0Z3ZGk5Nnc4RUEva240a1l6ZmVFeW5JLzRr?=
 =?utf-8?B?NC84ME1zazdUbFBSd3JoZ1JQb0k1L2V5bmZMNHV2a2hZN29uc21tSDA0bEUz?=
 =?utf-8?B?V2FDY1NMMnlQRlR0aSsrcUcxMFE3aGJlcjgyK3lJL1EzMVZ4RFFrcHorcHor?=
 =?utf-8?B?L3U3eDdjUXhzclNTdGQ2MjMwNitBakpvUWZWSzM0UzYzT0hvMHhLdmM3OXp3?=
 =?utf-8?B?MHRFS1poS3U2QWo1SFhiaWlKVXFsbXFuQkJZbGY1UzhFQk9IeDhpbCtVQU4v?=
 =?utf-8?B?T2dxd1Z5MTRNaHpNdXBFYlFCQy9tZjJvT2pkT2NIQWc4SEhWVlljcTB2MmF4?=
 =?utf-8?B?UmxxNTZGenRGTkpHUmwweFE0QUR6SW8zTm5OblBHNUpkbVltQjU1VGdNYUFv?=
 =?utf-8?B?RjhPVm1YcGN5SGlIMHlpRWtYTTI2dUxlaW9VbnlIbVlISDMxN3YyV21ZTlFW?=
 =?utf-8?B?LzRJdWRUMzlmVVh4aW80WjNieFRsbnhSSVc5NmptS1B2RWxSQzJjTVJhdGsx?=
 =?utf-8?Q?GWpoA+Nn0hB4SKI6cbyxg92Ew?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec04983-db4f-4720-9d08-08da9193b092
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 12:14:33.7152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C/LuC/XrpUEkOe0iWz+EkxdV+BL/nDzh13C76ruWgV8ST5sFSoRWVgiStnoawcJEFKR0RgBAJzmOgqzZNk2BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8005

On 02.09.2022 05:31, Wei Chen wrote:
> The sanity check of nodes_cover_memory is also a requirement of
> other architectures that support NUMA. But now, the code of
> nodes_cover_memory is tied to the x86 E820. In this case, we
> introduce arch_get_ram_range to decouple architecture specific
> memory map from this function. This means, other architectures
> like Arm can also use it to check its node and memory coverage
> from bootmem info.
> 
> Depends arch_get_ram_range, we make nodes_cover_memory become
> architecture independent. We also use neutral words to replace
> SRAT and E820 in the print message of this function. This will
> to make the massage seems more common.
> 
> As arch_get_ram_range use unsigned int for index, we also adjust
> the index in nodes_cover_memory from int to unsigned int.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit still with a couple of suggestions:

> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -428,37 +428,43 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>     Make sure the PXMs cover all memory. */
>  static int __init nodes_cover_memory(void)
>  {
> -	int i;
> +	unsigned int i;
>  
> -	for (i = 0; i < e820.nr_map; i++) {
> -		int j, found;
> +	for (i = 0; ; i++) {
> +		int err;
> +		unsigned int j;
> +		bool found;
>  		paddr_t start, end;
>  
> -		if (e820.map[i].type != E820_RAM) {
> -			continue;
> -		}
> +		/* Try to loop memory map from index 0 to end to get RAM ranges. */
> +		err = arch_get_ram_range(i, &start, &end);
>  
> -		start = e820.map[i].addr;
> -		end = e820.map[i].addr + e820.map[i].size;
> +		/* Reach the end of arch's memory map */
> +		if (err == -ENOENT)
> +			break;

Such a comment ahead of an if() is often better put as a question, e.g.
"Reached the end of the memory map?" here or, if you dislike using a
question, "Exit the loop at the end of the memory map".

> +		/* Index relate entry is not RAM, skip it. */
> +		if (err)
> +			continue;

And then perhaps "Skip non-RAM entries" here.

> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -81,6 +81,19 @@ static inline nodeid_t __attribute_pure__ phys_to_nid(paddr_t addr)
>  #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
>                                   NODE_DATA(nid)->node_spanned_pages)
>  
> +/*
> + * This function provides the ability for caller to get one RAM entry
> + * from architectural memory map by index.
> + *
> + * This function will return zero if it can return a proper RAM entry.
> + * otherwise it will return -ENOENT for out of scope index, or return
> + * -ENODATA for non-RAM type memory entry.

The way you've implemented things, -ENODATA isn't special anymore, so
better wouldn't be called out as special here. May I suggest to at
least insert "e.g." in front of it? (An alternative would be to check
for -ENODATA in nodes_cover_memory() again, followed by ASSERT(!err).)

> + * Note: the range is exclusive at the end, e.g. [start, end).

Perhaps better [*start, *end) to match ...

> + */
> +extern int arch_get_ram_range(unsigned int idx,
> +                              paddr_t *start, paddr_t *end);

... this?

Jan

