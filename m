Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74261592EDF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 14:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387412.623626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZBZ-0003Dd-W8; Mon, 15 Aug 2022 12:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387412.623626; Mon, 15 Aug 2022 12:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNZBZ-0003B2-TC; Mon, 15 Aug 2022 12:27:13 +0000
Received: by outflank-mailman (input) for mailman id 387412;
 Mon, 15 Aug 2022 12:27:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNZBY-0003Aw-Nt
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 12:27:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 967072ea-1c95-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 14:27:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6981.eurprd04.prod.outlook.com (2603:10a6:20b:103::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 12:27:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 12:27:09 +0000
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
X-Inumbo-ID: 967072ea-1c95-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoGh6z9YfeNr4QRkn3azunn4Nn4skxlK2NlbaoI/UIC87et8f3xgOeu2MyL4qmlj13uZVQIBO1W5mb7OuCc9nrBxNvO9I7v8g3qCpOR8YeXS7G4nhbE8ZHMHq7+aCYnQOGs19eQuLQTZCWv9/VbE1dVLtzyE+W8V9xbxibLOjTpP5R5XSG8WjW42K8YvCZYcclqzBOddR2P4l3YOy/JYMaiViC4pcMUb0Tu602jEdDxxnbH69qfxpiGCAtYjNH9V105ksXmUbjn45KvxgRPHt83LJNjprJyCt1LqqdsOnntGkmHBagmeNelMjX2sfbAcpjPdC53iadG5UbskYI6Egg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri7srvcfFaLIkvSc3BfmGZtcsqYBhgWWRtcMM8QMR4M=;
 b=LtHGkBw5XseRBsYC7/aeoTW0Qv3gBk3rQQ20r5izR7o5hUqR1VuoAUNOJHq89oT8Ep5GW+tpHEs60KJ7Agg/NfeEe4jyGIrJwbklKT2j9YE4w2YiNiHWJuhDXiL9KmrgPYRV/TBcQINvaNZGAteWhnaZ0yJmjrD/B9YgqAuO6PF6ygUdQ/N7EWItvefDASBfGq10q8jXhWrgR0QKsXdcDaV1Q1g3FshMVriyC37/prHmLrs27x5D6YCQlbTsnyae0nARTuxOznY4idHfDubv6e7rPSspNNAKbAAXAaPY8UsPD5EWZRMel4dEQKF0FEC5hIxkkd1UbYePp9pxBJwUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri7srvcfFaLIkvSc3BfmGZtcsqYBhgWWRtcMM8QMR4M=;
 b=S4u2EYkyGBYFFPAwFZwo3tchBiocmhSyPKfCLndjaKdICbSLeO0Pruu31TgveegG34FksoZaV0oNUHSu9JG8BdF9mnKDHU528PyUAwTf5QOPXuQ9QM2dgc9BEyZ+Kn3u1hfBEXyV2PGwPCxlM9nwek0cXHsZWcCdDENsLwaIkvpJHeN8MMClVogQtfhyw6Vvb6c9fxaMv4wr3RxNib5M/O1NTtGjjisXBQWItkEr9sJ2mXh6CRZEBqXCFxC+spQP0NR5qoQgGe9LJBr+UrhLj18SNzNqIH+aO0cIe/AKcVIt9IVs8AzDwrbvHni3niOGS4jZlSYgLDEpy3VFwYN2Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <572e8652-93b8-448e-1e68-f30fd0c88974@suse.com>
Date: Mon, 15 Aug 2022 14:27:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/3] xen/sched: fix cpu hotplug
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Gao Ruifeng <ruifeng.gao@intel.com>,
 xen-devel@lists.xenproject.org
References: <20220815110410.19872-1-jgross@suse.com>
 <20220815110410.19872-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220815110410.19872-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd6694c8-e405-4962-c81f-08da7eb97930
X-MS-TrafficTypeDiagnostic: AM7PR04MB6981:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3fR4gNfjijZ0k6cseOybp5FGPZ6dch9ALE9Hw4UY3Q4L2BXwhvpNQqI7ytQtUN4nkjHBXCBkLi+Hqz4L9K+e/yez7TuMjW/7Y7ddUitCALN4aUd+UDLMd4ihLzQjy/w3gfYDZQhwCCjI49ofiWV/U1WUqr4o2jheyYxQ5EQlZs2ZdD4Awdnk/zHWk90uB2J6LIHSDcN+ztjOdWG2ZxjEpy6OVGX71NDy+VlAAqrezQwsei9LhASt9fOQoMWc4Fyz8a1WGqWRbgSx0UkrZ23zP5cdNzf8fxAKqkkYGGuoSXHjAswtpxNLdwXYpjr0sm6A8GbzFMCuLbe/88hxO8i06gyqEplgni7p/lywgoS09OT1h2Vfr4cBjQMRdHmkz8kPBncD093zsfWJN41v93LTXRtR6eMIkoAyFZKw8a4nENo9t1PemtIxYTdxutIz6IkWgPXnC+jjc0IenWCozIOxOd9IQYYGnLDEmucSK4pveXyaiOyp9FNI817AYcdvoemv+VjuOfMSqp0P2gw1miLt7QAIQNnU6qk7tqmStQeJublQwJ4gxRD1bamkw3R2sip2Ov4tB8ea7xfqICZVNs1k1v9Zy/5Ad2Z3C3G0ne6313Dy7qJt3IIiUFmX+nKaa+Kja6CJSueH4TKAGLCh+++aK0pw8ynqnbF2C5i+OwCB7Uj+OqSlK8ljKYu7aaG1ItUMeVt3QB2g73icvk9/KZI+m7Ohk+GZVCLhbrJJndwTMAlYlzMAMSKsjMgJW3akYLVKtgmQxlZDDomhQAFv0zuDGX5oC8w8ZI3tpj8rpGUqvsUuNKOemi0533eThV6ujpkI51Z28yznsFYW9czIG4BqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(346002)(376002)(396003)(136003)(54906003)(316002)(5660300002)(6636002)(83380400001)(31686004)(478600001)(37006003)(6512007)(2616005)(186003)(6506007)(41300700001)(36756003)(53546011)(8676002)(66476007)(66946007)(4326008)(66556008)(26005)(6486002)(31696002)(86362001)(8936002)(2906002)(6862004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1E3KzdpcXNEN1dJalJKYzdJVTVmeElTWm9iQTEwVnVzQ3RrN3hvdWlVMVgv?=
 =?utf-8?B?SkV0b0FRMUVrUEE3N0VDRmovbk1TNlV0cUhzMzlNNW13MTNtekVqemE1ZjIr?=
 =?utf-8?B?NkQ3Q01jSlJ2NkthMTlKNmZFSGxaZ2RoMTBBZ0RFTHBEdjRyajd2QTk5K1pH?=
 =?utf-8?B?STFjYXVXNFczeExXVWFhcGNRdXpUc0s0dVlOb3hnVVI1RlpVbXdIdWdWVFpa?=
 =?utf-8?B?UlBYRnBEcklDaVRMcTRINm5ZcDVTQkk0RHA1UkRNc0gxMkFFU3hpWm53M0pW?=
 =?utf-8?B?NzlhQ2QwdHhuajVPTzBkQ1ZEU0hJTHRkUHV6akJVNXRJa3pWNTN2aml3UEhi?=
 =?utf-8?B?VHRyVDRWQmFFbDdSdjNjRzRselVQb2lqRksycGhKTUVXNCtSL015V2JQTklV?=
 =?utf-8?B?RW9QUlJVWE0wanBsUmptL1IxZFdDZlYxOGhaZGZhN3dSTzk5azJ3Y25KcHUy?=
 =?utf-8?B?aWI3MVdFWnB4MVpkUzNNSEZ4eDhYRm03SUNmVnVTMUhCTzNoM3BWdHExWThM?=
 =?utf-8?B?N0pEZThBb083Nm14ek5JL0lTRWc3dk9IU2dnSEd0RVZTbDVTdnNDRG11WDhv?=
 =?utf-8?B?dWVRUTB4YUZSWmxxazg0bStsVXZmL1BrTklFSC9SeGp5dHpwb1VvOGdHMG1m?=
 =?utf-8?B?SGU5dUFRcWlwbi9MUmZPN3Jndk9qNWJieDZqbE16Q1dVN3orSVZZTGsyNHEx?=
 =?utf-8?B?Y2h5d0E4bFFhci9qdmVBYVBkNzV5S3Bhdk9BaHFxTzFKdVg4cUtVUlhSMENY?=
 =?utf-8?B?dDA4N0lLdDhKT2x2NEFzWWxFKytCa3FNeXBER25VbzhIblpwR1V6dVJSVHhx?=
 =?utf-8?B?MUhIbVUzbmludHNOdlZvVU9keEFlM2szVkV1NjYxditSQWk3c3BJRWhyVU1t?=
 =?utf-8?B?UzBuYkliTE1KY2Yvd003WEpSdHRKRURKMVhnS0g2cGY3eHI1bVdNcmZnbEVO?=
 =?utf-8?B?SUozQ2p4YmVXMXhDOUJxbk5UazRWby9pZTJ1UWZTdC9qaHdOOFpYcW0xL0hE?=
 =?utf-8?B?VDg0TSswVGp2V2JMNDRMVkN2bjBrdXlaaDZjUFJhc1BHbU5OM3B2ODZFdWJk?=
 =?utf-8?B?Uks2WkU3OXVLbjZ1YnRiNENuMUFpUnJyUUcrRGxYc0xXNFJCcTFPMUE2UVd1?=
 =?utf-8?B?WDZ2cHF3S2FLWUVrcWFJUTNJT01GRHNFbWREMXB5dG01YUdDeHhzQ1RMVGJm?=
 =?utf-8?B?ckZzb0drL1grVmJPZ2hEdFlxKzlNSWhDdzdmWFNMOG0ydlhMZWxFLzlSdnVG?=
 =?utf-8?B?LzhhMXUwclhFbWd4bzRGV2Q5N3g1T0g2WHhFNUVVMVFjNXVpNWtzSE0yZU84?=
 =?utf-8?B?aVlQMzBxUjFsSi9kYVVkVldjei9SR3QxaWlOalJFbWNtUlV5ZFJFaVhJemlS?=
 =?utf-8?B?bFo4TVhvamd3M0FMa0xCeDZsWDROcno1eENCREpZOFZYOUVwblFpTlJmRmxX?=
 =?utf-8?B?S3hrek5PVDk0WXFuUkdTQ25JelZtL2lLMkpVTjJkSDJRYzMrQm40NzhaWXF0?=
 =?utf-8?B?OHpMYjUya0NpZ2JPMU5Fb1V6Ui9hUUN3a3FKZHdSOElQNWduSGxPZ21lODd4?=
 =?utf-8?B?elFYbXVXbC9QVTJzTjVwZDNybjYvalJuM2J2SGFzb2J0TmtEUFMyYmg2aE1L?=
 =?utf-8?B?TDRuK2dja1dBZ0ZrQVdZNm5aK0d2aTE0ZzBKZHdFVGdrNmFPb1pJcVQ5ZEdD?=
 =?utf-8?B?VG1PM05Za0hJV2krVmkzZEVSUGJTbXVkWHlqWFIveGp2Z3pyeG1NL0NOSk91?=
 =?utf-8?B?ZHJ4eVBoeW1SWE13aS9IREIvY1RrNlltYVVHaEZ1K0N0VTlXTURWRWZFUmRX?=
 =?utf-8?B?QmlNanRFNC9PRWxLek1tRVZ3L2k2dUpiK002WTFWRDZrM081VDBDSklPMzlO?=
 =?utf-8?B?NkZmbk4wR0lwTzBjaG1EL3RKUitDOG10K0ZWZ1RURVZHQ2g5eWxMdVl6R2hH?=
 =?utf-8?B?RXVHWUd2ckp2ZGpWSDVYNy9WTkY4NnFrczhVSGdCaXROOENMTUx4bWdFbmFC?=
 =?utf-8?B?dG9kZ2g1T1lTTlBKL2dVNXl2M01ydi9VUnI0bHdSTmh2R2twUWdhb1hlMGtv?=
 =?utf-8?B?d2ozaXV1cTBtUzIyQTRLU1VxZ0NBcldhMkhwbnVBTitGOUxWdGRBTDRrbEVz?=
 =?utf-8?Q?IxJYixckezAPqKD2KB6O9/Luk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6694c8-e405-4962-c81f-08da7eb97930
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 12:27:09.5042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhTLLUacyvhsCNMDrGCNF7f9JJvPlVioBwnbucdXR9T80ZC1YW4OWtE6I2UciKrxvcLxQndBbAMNdiJFYrLE4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6981

On 15.08.2022 13:04, Juergen Gross wrote:
> Cpu cpu unplugging is calling schedule_cpu_rm() via stop_machine_run()
> with interrupts disabled, thus any memory allocation or freeing must
> be avoided.
> 
> Since commit 5047cd1d5dea ("xen/common: Use enhanced
> ASSERT_ALLOC_CONTEXT in xmalloc()") this restriction is being enforced
> via an assertion, which will now fail.
> 
> Before that commit cpu unplugging in normal configurations was working
> just by chance as only the cpu performing schedule_cpu_rm() was doing
> active work. With core scheduling enabled, however, failures could
> result from memory allocations not being properly propagated to other
> cpus' TLBs.
> 
> Fix this mess by allocating needed memory before entering
> stop_machine_run() and freeing any memory only after having finished
> stop_machine_run().
> 
> Fixes: 1ec410112cdd ("xen/sched: support differing granularity in schedule_cpu_[add/rm]()")
> Reported-by: Gao Ruifeng <ruifeng.gao@intel.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


