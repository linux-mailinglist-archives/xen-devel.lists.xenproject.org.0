Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9493456BA05
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 14:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363397.593890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9nOT-0006hf-4y; Fri, 08 Jul 2022 12:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363397.593890; Fri, 08 Jul 2022 12:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9nOT-0006gG-0d; Fri, 08 Jul 2022 12:47:37 +0000
Received: by outflank-mailman (input) for mailman id 363397;
 Fri, 08 Jul 2022 12:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rYmb=XN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o9nOR-0006gA-Hu
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 12:47:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60051.outbound.protection.outlook.com [40.107.6.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23049203-febc-11ec-924f-1f966e50362f;
 Fri, 08 Jul 2022 14:47:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7718.eurprd04.prod.outlook.com (2603:10a6:20b:29b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 12:47:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 12:47:32 +0000
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
X-Inumbo-ID: 23049203-febc-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRJS0N/M9NrPVqXJ37EsuD9va6dhsKzEuwQ+skpuZJNs7VMsM7688980sLfZjQl8Qs47n+dZHbIHnvISkV/W5bT5cNooIvw90GUC7BhsMWpa6ibyfewiM/nX6oOX9WJP3+BdRAKBCfRV/xp1hubC0s+WKT0AOEPa5VXE22Dnn1k21b0IN+B351YCdBPC+8B2x+QDdzZVBtI2GTdyhfqljZjaCW1YVE5aLSKR7rt9K/wa/xQoyAi/7ynh1TfFs9s1zgs4f/b1/tGygu5QFECzuEbS+uCGessAytRZ2z2lsFhoITDYL5QiHfIb8sds6MwEBkmebAeSx/SLm687LEPYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVyHVNHwCl4ADOxL1R+EKqCtpgikFenruIqKwPh0kqM=;
 b=G8gkSgmadp5A6zNHocxcwD01U6nvvUtj2SQJ6WbZmhVOE2Y8XkRe+c9IQC8LzvrlHh6Yk74y9Z/esQy32cX3S+R3RlqtbIvi85DMnjxaLo8v0QTBsZKcDx+87HMd7dB1TJzvdXVF2Ut9Pv/ti0/tH40vBaOGlAbTzZaoQpoSSLP+Ftz22Wu/D4jTDT/bX2Qu7CQsf6NWWt5uNrDL1jBFu8jLpWrT7dxuD2masR/qk0ZczJpcuzDX5ZeF3vtUFDp+YOQiEociJvpbQX+Y6qJ9E0mDQ/0jaPUg6dhlxm+HHJVpN4YpXHv4i+c4v08LoC5MLhsKLoD4I8l4ksPnuWoKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVyHVNHwCl4ADOxL1R+EKqCtpgikFenruIqKwPh0kqM=;
 b=moh94dBriudnGC3Qw6OsX/W54XlZxNYhCuXkCbkLqUhZhhqUKr4HJVGYfKtLNLt/GudeswPmWr5jL4esHEw3jDC4ZygAYFMIzisAYLQu6T0BjhhhE0EZQKVvWxwM8FdLk0QGdUaWM21Ypkj1sbdDO3tRS6KMVusOzpCkv4przSJc/BR4k2RJTXYSlvsrXqUMQPWsqI1XAajS0K3FpU5aolhF4VoXBZgqXTB1oqQ0BQfpKGyd9SSm6MNrMps8uC+Qf77aU6LL/VqdkC3SD6uTqpxUySDMwBpgONwBXjIEeLhS1nzlUwoQoJZsMqJ8zlbxEJ7SjvDj1W/QoXs0780Czw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <670588e9-48aa-779c-ec5e-88d6b9d12a76@suse.com>
Date: Fri, 8 Jul 2022 14:47:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220707092244.485936-1-Penny.Zheng@arm.com>
 <20220707092244.485936-3-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220707092244.485936-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0051.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1b9af74-d3a4-4b9f-cfec-08da60e006af
X-MS-TrafficTypeDiagnostic: AS8PR04MB7718:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QDw09LXXgvtdAk9Ifv9MeKFFdeoWX1Dtzo/B70EYXOpDHyx6FZC2YPYVwjqeyPEwOapalvD5ryOEIRNwTUeoSbmE04t6UnHorcl9ZVII8+Xap+mQXJbIA3pHYBNa0aGbBKL0rFiKZ7TFwct5wHU8PFMwZnNnCDRgGoPWmUVBd8WP7dKlJoQbS/Jqq/kS0dqSdQGuZ8xjL1eDbNxXhUkYI3zSFRfxTGnqbYA7XOwpsv6uNCUDNI0hTMFLgt/ksKIOKJBVDW96itfK3aWUQMtFA/p4Z6pz+jyOYU5OHvAqIwpnl01q0TyH/H4SUZKpIjsF3VUELgUOhhkMJWNXCdkdpgyMyTubJaBUD026iSOTBf79HL4IibuakljssrUutpKfim/lTQEsTsHYKmZwDJhOU+CqQPYUN+6FoyMjKZ+gOAeb5ZgTPsJkbCo9Xf0J7u8odhbo/BNWLehCtU6vECXM3VsVOzRoESgO8/KKHH0xE1MvhxtBZC6s3ulc/96Bfxro+nYc9m0HdNopL+HK75a7SFURSAeAAy+2kIkVB4Ovm4Jw1DXOivoxLRvZnNRhtjsBnpCngpS5l3J3SvsJAQb2ZdLfOkOjPPR7REgaFSzq+opgv3s7PmN6DQvEOlIrIUX2PFNWss22udoO/hpniejrXDZQHxYpwuEr2DzHe7K3S7LpJY5JMGUXaLBGNLNrYJByiyX0deR4Zv52351V9GwMYlgZYkaJYnIAX2hO9ZCqOGegyzPwqoGpB8iwFQ8QuDqW1o721TrZyRK2xW5FgReLfvp0AJCvy0ca+Hr4hSCiFMNK5trfs4+WWGFvQdA/1mN87DKZ2tfe5xxa3Cfs+7a/bPCFQh5llkzELvprxbMf8E8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(346002)(366004)(396003)(5660300002)(7416002)(8936002)(31686004)(36756003)(31696002)(2906002)(86362001)(38100700002)(26005)(6506007)(6512007)(54906003)(53546011)(6916009)(2616005)(6486002)(186003)(41300700001)(478600001)(66476007)(66556008)(316002)(8676002)(4326008)(83380400001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkxheXczZHNYTVl5YXVpT0VXN2NHdGV1RzNCN1pTNFhMUmkxdGgva0k0ZjR3?=
 =?utf-8?B?dDR1ei9vYzFXbitkVHc4NC80OVlHdmQ2eEY0T21CV1pZU2FTd2FjVVFPb1dk?=
 =?utf-8?B?bzBiS1AwZkgwZ21wODdPaEI5eVI0Q0VSMWxqQW12Vm1jUnZhOEo3Mk9Xb3gx?=
 =?utf-8?B?VnhwMjRra3M3bmVTa2FJMEg3VlYybTE0aG5Lc1VwbkJNQmIvVHpVN0tUT3l3?=
 =?utf-8?B?bXNHYjV3Q1MwNVV2aGNjN2MzWW0zUFZ5Rkd6RVZJRTMyR0l0MEIyVlpITXA4?=
 =?utf-8?B?YlZiUERoanY5S1NPVWhHY0JFNm5zSXVqcjEwM24xYno0b3UrR0NuWW1IbVd6?=
 =?utf-8?B?aEFxZ2ZSc0RMdmtadzQ2ZGxwOU1YRytKRFhxb21zVDc0M01lUkNJaGpvMHpV?=
 =?utf-8?B?bS9iZkNFd1FuS3oxak1CbXRpVTFhUDliSlB4ODFDSUxJSm1pcFQ5UHExM21r?=
 =?utf-8?B?c2tuRmRwRFgvUzY4TGhtbUxkL1VORVhuK2NjaTZTTnpQV1dzekVHandudkFH?=
 =?utf-8?B?c1VlbnR2REdTb3lEdkZTZ0F6dURPRFpacmVYZDhOMnIxL1JXK1hYZGxEMnFT?=
 =?utf-8?B?b3EvQkwyeHJoTTNINXppNlY5aTZXMFhJS1dMcjJxZXJhdUhPVTBDdTBWb0dE?=
 =?utf-8?B?MVBULy9WVkxXTkgxR3N0dHRRNldLemd2bU8rSlpTRW4yTzVWMjFHbFJwZTZC?=
 =?utf-8?B?TTNTRTlzQ2tRcGNTK1NMUTNGb3VZNTNmR1djaTJncW9ZNU1uNkhXZSs5WHJo?=
 =?utf-8?B?bC9lVFZLeWRPcGx3L1h3THczWVNNU3NVc2czZ09EbmlQL0pzNGZTOFcvNUl0?=
 =?utf-8?B?QTJKMFFMZmlPUUlDbnZKQytXcFgxQ2ZCdUlEcDNsQW4zTkRPNk9NRGtNSFQ2?=
 =?utf-8?B?RXhVYlhrLy91R0tCUmJyR1Iyd0pML1V5TUlhS3krMDRIN3lvUmFJQldOSDFj?=
 =?utf-8?B?Qjh3K0Y5T0JDb1hnNWlCZlBrUEt5Z21qWWhDS3QzdDhwZGdOQlQ1N1lYK2M5?=
 =?utf-8?B?RkpZSGh6WlhiUjE4amFDR1NOdXdFMWRQdjYvakFzbGdjY21EanVXVy9UV3Vv?=
 =?utf-8?B?K2I4b1pCQmxrc0Z4SFNUTURSdzU4UnFMVlhMU2V6eGJyeFU0eFY1akh4eDRk?=
 =?utf-8?B?UXNnbnhsQjVZMDZiUE0vZ1FsVmhpRVU4ajVJUkg4R3FLTUp0c1pBQ1ZyYnIz?=
 =?utf-8?B?ck1LOHVmM240MFo2eE5mNlc1dHdMMGpudWNXSkpuamFSd3FxUlp0VldVL2Zt?=
 =?utf-8?B?WGRpaSsyM0JlRTNra3NzNGtKQWl2NHNkVzlQNGozNnVDWmhVRGFSYXVtL21T?=
 =?utf-8?B?YlNYcEtKZ3VKL004dGsvZFBhSGxueFBqV2pSMnEzMGRQMHFmenNHdHJMdmt5?=
 =?utf-8?B?Q1F3U0RWVFdlNGZiNlRPRDE0RDFrYWpwVXl1OXRXMXBpQnFRU0U2cVluL1Rz?=
 =?utf-8?B?L3lwTHhYVGMvU2NYNVoxK0hqSWRhSVQvS0dQb2toeVc1SXpEVXZtNnExQ3hZ?=
 =?utf-8?B?SncwQXphcjZmM3V1Snp1alFGTGcvMzBIRXpJTHBHeVVFcisyTTJFVGZ4VTFV?=
 =?utf-8?B?Z3BOeXJGV2t5QVdGMU90Wk9hUWdsejF4T3pJSm9vSGFDamJWaGJEVGtGNUlW?=
 =?utf-8?B?ODVBb3pjUnRTdHRmbXd3ZnlWMGQ1UlI1OTgrcmhsajY2SFdWVmxuWlgxSWox?=
 =?utf-8?B?YVVURGJnT1hYOUszZ3lKTkFJMVBqYVJBb2VoRGo4M0FsaFRVZy82aGZMZzg5?=
 =?utf-8?B?bS9yUFBBT3drYkpFQlFBckR2ZGFmYVR2OUdLQmltTXVTQkpxOUhCTWRibDF2?=
 =?utf-8?B?bDk4S2FVNnQrUU1mWkRhSjJHS25sRE13VnpDWXJvR2x6aVRPQUJPYWd1U09k?=
 =?utf-8?B?aU1vUFl2Y3htd2dUTy9XdjJFd1MzRjkvRUtsOEhmQlNRK01GU0Y1WUdBZ3BN?=
 =?utf-8?B?UHpyUnRSK2hWTC85bStBYThWSnQzc3poZkpJcVkzYXRUQk5wS2FkdjZtbUQ0?=
 =?utf-8?B?dE1WYml0RUM2UndSeDFOV2VwQzRKL205SytITnpJb2xDZGNXckhjUXQ5MXhj?=
 =?utf-8?B?WUtVMUR2VVJFN3lKV2xEaFhuWFV1MTZ2V1lnVlcyWTZqalhZK2hFOWp2c2pw?=
 =?utf-8?Q?3MRzwLJAwScjekKW9O8JGaGTF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b9af74-d3a4-4b9f-cfec-08da60e006af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 12:47:32.9191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbPuuC346m2iNyoyvu//3Pl+mHm8/JdYUz20w+F5v3WscLDXgy/wXffUyQKv+r/XdgkZGJBur0nPK/aD48UKvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7718

On 07.07.2022 11:22, Penny Zheng wrote:
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1622,6 +1622,8 @@ void put_page(struct page_info *page)
>  
>      if ( unlikely((nx & PGC_count_mask) == 0) )
>      {
> +        if ( unlikely(nx & PGC_static) )
> +            free_domstatic_page(page);
>          free_domheap_page(page);

Didn't you have "else" there in the proposal you made while discussing
v7? You also don't alter free_domheap_page() to skip static pages.

> @@ -2652,9 +2650,48 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>              scrub_one_page(pg);
>          }
>  
> -        /* In case initializing page of static memory, mark it PGC_static. */
>          pg[i].count_info |= PGC_static;
>      }
> +
> +    spin_unlock(&heap_lock);
> +}
> +
> +void free_domstatic_page(struct page_info *page)
> +{
> +    struct domain *d = page_get_owner(page);
> +    bool drop_dom_ref, need_scrub;
> +
> +    ASSERT_ALLOC_CONTEXT();
> +
> +    if ( likely(d) )
> +    {
> +        /* NB. May recursively lock from relinquish_memory(). */
> +        spin_lock_recursive(&d->page_alloc_lock);
> +
> +        arch_free_heap_page(d, page);
> +
> +        /*
> +         * Normally we expect a domain to clear pages before freeing them,
> +         * if it cares about the secrecy of their contents. However, after
> +         * a domain has died we assume responsibility for erasure. We do
> +         * scrub regardless if option scrub_domheap is set.
> +         */
> +        need_scrub = d->is_dying || scrub_debug || opt_scrub_domheap;

May I suggest that instead of copying the comment you simply add
one here referring to the other one? Otoh I'm not sure about the
"dying" case: What happens to a domain's static pages after its
death? Isn't it that they cannot be re-used? If so, scrubbing is
pointless. And whether the other reasons to scrub actually apply
to static pages also isn't quite clear to me.

> +        drop_dom_ref = !domain_adjust_tot_pages(d, -1);
> +
> +        spin_unlock_recursive(&d->page_alloc_lock);
> +    }
> +    else
> +    {
> +        drop_dom_ref = false;
> +        need_scrub = true;
> +    }

Why this "else"? I can't see any way unowned paged would make it here.
Instead you could e.g. have another ASSERT() at the top of the function.

Jan

