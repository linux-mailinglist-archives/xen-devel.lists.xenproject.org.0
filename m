Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4378350F70E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 11:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313599.531216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHMq-0001fe-0A; Tue, 26 Apr 2022 09:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313599.531216; Tue, 26 Apr 2022 09:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njHMp-0001cz-T3; Tue, 26 Apr 2022 09:20:19 +0000
Received: by outflank-mailman (input) for mailman id 313599;
 Tue, 26 Apr 2022 09:20:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njHMn-0001ct-Nl
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 09:20:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15a1253c-c542-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 11:20:16 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-J2tDk-h2M9unXc8YMuWRZg-1; Tue, 26 Apr 2022 11:20:14 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3567.eurprd04.prod.outlook.com (2603:10a6:803:c::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 09:20:12 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 09:20:12 +0000
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
X-Inumbo-ID: 15a1253c-c542-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650964816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlthTxj6EWGBFF0coUuh7CPEUxrvDwcDZDRl6EyQg1Y=;
	b=Mh6P1Y1af09z21FIxgt3YmoAxJodYY/bNBs+p1IC1WEC+h2fNqOoBmVCP4IaqWGweNNzVm
	Lgzq2qx0KlnJoekUF9yjhTVegPfUTf/F0AQ1dAB9iDO5CCwmyyX06nQd7+ddbLM5s29FZR
	D+pFpp2AA09TllmNK0Xl36/3kem71iM=
X-MC-Unique: J2tDk-h2M9unXc8YMuWRZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFNfesPaOj9tWjQAiIxkXhSLcgCsBlc9/cD3LsDriUjf5XPGAaAHdcfIvpmegf0/cXcWx1AO0TwpdortDpZQv++MrgJY1KgHm3PTOaU8nwlInHDi75BmdqW26blaArgbHh7+ahAV/83nMfaNfnXAFkkNU+X3HCX3LQrWnttu4KCsopuN7jrjhHkrKTtFLC+C+ZKxwVNiM+16lU7hef4YJvo1hhYUWKjhKp+uOxLDaqobkkFL2Y09YhwdZXjroRBnpSkISywWcQ4YBJ7ME+tGaYPGXkDlEC5PlRtSxisO8pl3R8o2m8R9umAWsDBXk9tVPjWK5LyULIu4Rv6eEboneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlthTxj6EWGBFF0coUuh7CPEUxrvDwcDZDRl6EyQg1Y=;
 b=OU+srI7cE1EI7YYJKL9c0U4+SgQCWoQNiQCTbnvrXHl2xDww8yt8c14zeCDjGTvn68Wx/Rzm0G7kXKZrK37x+7lzlVUC/hA+Ip+4iVrV7e/r7kFmL3L3fMV7gBLLECT6JeqHJD5dNlF5UhabRSJF7Lx/CatfOdDjwHT+rxYRk2XZZ1HCIfhQXZhDY2eJvuvGeJTiybWUblh/VqfDKLfhxIP8hGLUJwIz5pKvA9Z6IDLLAV/h5TSVQx+BB2yHrQRnHc73bzrn3rOFEgRa8yow3NyTBtwJwIIxoC+dNcLd3wqH1EgSgEdV8HDeQYP2LMOyq/waXP0C1J7suPUQ0xd0iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22591300-a09f-1ab2-fd6b-6c4875641035@suse.com>
Date: Tue, 26 Apr 2022 11:20:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 10/10] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-11-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220418090735.3940393-11-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0033.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59c0f04b-3a92-47a8-a7e8-08da2765f743
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3567:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3567391D17F495DAB0326CC6B3FB9@VI1PR0402MB3567.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnlNVQsOBk4kv5f8UN+uc3HQM6nLiP3kNGb8lrxV+BRo7ASYYCQg/ukOJ3TAOpdoGzkuzoLj6uSYqHkzX7IGbdQJ74YnpJFtGPgwjQ9ChSGMdUgO0mo5eekL1OW0uoyIAU2RdaqXZnWcucTLO68OiuuOWK/1XIv23gvjj3j+APqrLjsHtI+MqjyjcKqlke9bzbxzbzP6LNmPGEJZ8RARvHSR77RlMS/qvgJ1Igh9k/9FJ42Rl4V1oUooaslzVeWefScVbP9PjfNaPA23YVGpZhrPVmhpafVeaQKj2i969IL9OHZ4lDDZ1zQ3ju9zDaPaNgrrk2hXfthD16hkERWvVtosRYX5DmJTWa+xO/kTxMwNI57d0ccshbue4RyvEvAKCD51a6Q7oEQJUL+xmpgBKfDHZ5PXwePyBMYo/D6R4gSjtxihB5PwMiSLCsiFHbIuCIcLX8hVRqm7iFT12G2Wvq6oaMtLcvXEL8CLa9XBKfbXNmarutCL8loq+Etuv2EGcXg2LravMXvR99Peb2wejgN8Dd+0SgLuiEFS2BFKauPHS0NkSM8IJdEkYvWUCkknms9FawQL5E7aio5lbGRgi2gxD99JNgxHSeOVRp9ZouPretpaXNqwbHfu7IxibI7kjXs897cDw+Vw4MzoII8izQaqtLU0FER4zjp5+BIMW+DCaHtNkj+wBlaTJHJLHi8tQB2K1vQjH+S+TO+NjJxO71/6GKRsP21+1fixI+6igBZyc2zp7QcCbLGPvI/xfuAx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(4326008)(8676002)(2616005)(66476007)(31696002)(86362001)(316002)(83380400001)(66556008)(54906003)(66946007)(6512007)(186003)(38100700002)(5660300002)(508600001)(2906002)(36756003)(8936002)(6486002)(31686004)(53546011)(6506007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUdyNkNNTFZsZ1pTVWNjL2l3VzRUSDVGSGFtR3NHYys0NW5Ka3BPNzNmdlNp?=
 =?utf-8?B?NDl3VGNUZkJJK1dleC9NUjlFQkU0azRZMVU3ai9neDNXcWVjaEJjQ25YR2xz?=
 =?utf-8?B?YzFaRW9vU2YwTEhWeFRWa2c1cWkyQzhQVDV2a1daLzU0U2t2YlNod2U4RFg0?=
 =?utf-8?B?ZytsR2VlcjZkYVlTekkzczlxYTFwbERSaTR0bmtjWkZGQzJJRWE1QytWSE9H?=
 =?utf-8?B?UzJXUHpmQjBma3NEM1VRR002K3h4aVNMQUhxdHdQSW9xTDFNNmpZdlJIbk90?=
 =?utf-8?B?YWhTYVNLVE1Ed3BZZ25HS01YZmIrS29GclA1Y29tUUxzOC9IMjZiYkNueXdQ?=
 =?utf-8?B?eldvWGpYZW9OQ3V5a25qUko0dVE0bFFoQVc5bFhBdzA0MG83YkhBazVzZTFS?=
 =?utf-8?B?aFdGR3A5K2tPTUZ6UUZ0ZmJyeFNDUHdKTTFsVFhqUE1ob3VwSFB6SEcrbENN?=
 =?utf-8?B?RnFDeGJNR3Y1dERVQkdQcTJneVA3WFdGVmdxUzdpUGlIVkQwWlNPeFdhc3Ju?=
 =?utf-8?B?QmhHWGhkWjFMK0Izc0NzNzFDL0ZMSk4wVVdTS1J3UjI5a0s1ZnZkcCsxbUhX?=
 =?utf-8?B?ZHlIOHZyZTdRbk1NYy9FVFBkVDNLUGN2MDF3UUJyMkdaM0g2dEk3VlIvbGZz?=
 =?utf-8?B?UnZqWm9IcWJDUzE5RjRMcjdadVBKb1VFNU9vN3VXaEJycjZlNkZUcG11ZURy?=
 =?utf-8?B?c2lMZTJCNmpOV1ZTTVVVb2EwK0FiTElYazNhVStiTEd6dDZSN3RWVXYrUlho?=
 =?utf-8?B?dkhVRDJueGFvNXloV1hHam51Q1J1cXRteFdmS1hnT2Q5NVNqTTJCeFJQMDlZ?=
 =?utf-8?B?dVdyVEFoYloydWR1bmhwWHdZZHoxZGt3SmtaM0Vwc3BzbzB1aUpiejlkeThR?=
 =?utf-8?B?S2VZeVErUHV5bTdabDVlOEhRZkF6dVZJYVh4VVFMQzdNcTNFZWJndUlPS3hX?=
 =?utf-8?B?K2FpSlRoa29VYjZLNnh3SHFmTDhtaHFqRzRnM2NiZTg0ditmUlZhM1dUVDU3?=
 =?utf-8?B?V1g4ZEdoRmhvZlJKVzg0MHplOE0wa3YzN0JGUkNUcEpJclBhR0ZKVHNXRUdw?=
 =?utf-8?B?UGhEd251VVMyNldiTWdYVTRwWWFrVUFyZmNjTDc1d0hIQ0tQdGJLRWJHYms1?=
 =?utf-8?B?dFJNRStMcDcrK0RJUTdseW1VZytzN0VrL2dnUWFvbCtLOE1xd0t2MXZwOU1Q?=
 =?utf-8?B?ZW5qSGhaUTcyLzhYSUNLNUxvVWlOeVhvajVwa3RnYmZkK3UxMG1JYUlLVW1V?=
 =?utf-8?B?VmdBZEltRHhJeDNUbjF5YUl5YWJQZ3paR1VIaG9iRCtjMlBtSk1RWVg4ZVdT?=
 =?utf-8?B?cWh0cytSbW15RTF1RFhmdml6R2NmL0VXd1FjeHJSd1YvSHVmWkFGQVIzbFpC?=
 =?utf-8?B?blloWXRjb25KTmx3VkEvckliSk1oVkxWbW04WVRxMG1ERmUzQXFIY3hMOEs5?=
 =?utf-8?B?WUovejVrSzdHQS8yMW5Ud2NoN0lPUVREOFIrRHFPaUtwZnl6a20zc1l3UEdO?=
 =?utf-8?B?c2lSVDRaNnJYMzg2SjViaTZpM0VRbm1FTjVqbStrMWNYY3d0cERzUkNBZXhx?=
 =?utf-8?B?Q0JrKzhXcXN3dEFhQlVmYlhWcVY2d1pkeVNYTDRKazlOZE9rUFNaS1ZzdTMz?=
 =?utf-8?B?cFBuY2EzRFNKQThiNHVaKy8zOG5NMitqMDVod0tveUJSbUp3NFdOamZwWGNw?=
 =?utf-8?B?MG5JelYzam1yRjJEUTBTRU54U0ZKQlU4RlQ4R2RjL0Q3eVpIMFhldXJKRWNT?=
 =?utf-8?B?eFQ1aHRHRWdjczZ3N29TdjJaTmpXYkFZMmFxa1FHZkVCeml3S0JjYjFFOHdw?=
 =?utf-8?B?T1V5bXVVVFBlczFOT1FTOGM3MGkxM2NuZ0hHMmNOOUM2akxXblJCMVlZd2w4?=
 =?utf-8?B?bUFQMEdMT3dJNkN1WHVDR2lPSGFFQlVWaFAwMkVkTXcza0haaEdldDJBdktK?=
 =?utf-8?B?TmYyUE1FeXJrQndEdjlxOG10T244cjNwRWdxaTQxTGhSK2FvQ1VBMk14aHJ0?=
 =?utf-8?B?MldCT3NrMEhTNXhKZXQxT3pyaEp5NlBTWnQrWXpYSEdMYUhFeWpDSGpIVHYx?=
 =?utf-8?B?RkQwU2l1QWl3T0tXMEZmWS90Tzk5dktjam9URzVYazg1TXMrR1N6VkRreVZV?=
 =?utf-8?B?RWdTUnV5RzBkcDJGMm13ZlU2aVpKRDBPQ2xwYmo2NVlWZmhCVnA3Zy9POFY1?=
 =?utf-8?B?WlJtNnc0VkV5Zy9Ta1RCWTF5TDFVbkZkN3Y5YWI2SStkVXFLMFhKcFBnTUt1?=
 =?utf-8?B?Q3pxRFZCeDZsZmtqSlZtMjQyNFZXVkJBNS85dEtpczFpODlsWUpHbHkzTTFn?=
 =?utf-8?B?ZlBZdG1ocE1zMWF5MnlGUmZUSWQzUDVKYlltcnF1R0ZrTkx1SHBIZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c0f04b-3a92-47a8-a7e8-08da2765f743
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 09:20:12.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlntY5fSi7Ar9F35KinfqtTJwMjTwuaQ88ahgns7+OiYHdocLW0xtbybOsrRKswPQIXg00tKjO7uKTfgRIxALg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3567

On 18.04.2022 11:07, Wei Chen wrote:
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -271,6 +271,35 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
>  		       pxm, pa->apic_id, node);
>  }
>  
> +/*
> + * Check to see if there are other nodes within this node's range.
> + * We just need to check full contains situation. Because overlaps
> + * have been checked before by conflicting_memblks.
> + */
> +static bool __init check_node_memory_interleave(nodeid_t nid,
> +                                                paddr_t start, paddr_t end)
> +{
> +	nodeid_t i;
> +	const struct node *nd = &nodes[nid];
> +
> +	for_each_node_mask(i, memory_nodes_parsed)
> +	{
> +		/* Skip itself */
> +		if (i == nid)
> +			continue;
> +
> +		nd = &nodes[i];
> +		if (start < nd->start && nd->end < end) {
> +			printk(KERN_ERR
> +			       "Node %u: (%"PRIpaddr"-%"PRIpaddr") interleaves with node %u (%"PRIpaddr"-%"PRIpaddr")\n",
> +			       nid, start, end, i, nd->start, nd->end);
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  /* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
>  void __init
>  acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> @@ -340,10 +369,22 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)

Just up from here there already is overlap detection (via a call to
conflicting_memblks(), and you even mention that in the earlier
comment). If that doesn't cover all cases, I think it wants fixing
there rather than introducing a 2nd checking function. But afaics
that code covers the "fully contains" case.

Jan

>  			nd->start = start;
>  			nd->end = end;
>  		} else {
> -			if (start < nd->start)
> -				nd->start = start;
> -			if (nd->end < end)
> -				nd->end = end;
> +			paddr_t new_start = nd->start;
> +			paddr_t new_end = nd->end;
> +
> +			if (start < new_start)
> +				new_start = start;
> +			if (new_end < end)
> +				new_end = end;
> +
> +			/* Check whether new range contains memory for other nodes */
> +			if (check_node_memory_interleave(node, new_start, new_end)) {
> +				bad_srat();
> +				return;
> +			}
> +
> +			nd->start = new_start;
> +			nd->end = new_end;
>  		}
>  	}
>  	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",


