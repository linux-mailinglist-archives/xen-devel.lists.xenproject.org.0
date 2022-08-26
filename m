Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D435A2926
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 16:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393904.633110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRa5g-0004CC-QG; Fri, 26 Aug 2022 14:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393904.633110; Fri, 26 Aug 2022 14:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRa5g-00048j-Na; Fri, 26 Aug 2022 14:13:44 +0000
Received: by outflank-mailman (input) for mailman id 393904;
 Fri, 26 Aug 2022 14:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cVPj=Y6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oRa5e-00048d-Rc
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 14:13:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49782364-2549-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 16:13:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0402MB2934.eurprd04.prod.outlook.com (2603:10a6:4:9b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 14:13:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 14:13:39 +0000
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
X-Inumbo-ID: 49782364-2549-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqPrZF0xzWAPn09+pZIhij8Jo08cjhtdouZ4oGYJ9L5G31MXiMFV3zRcNM9MpiZVh4uxKKMylw4/eYPr9fYU99/rq4fKDwzWOFC3s+3iCxRIABHY8dNBShyxURpdsbGwOc+xeW72y75x8K4QGB1pWm6vtPmszj6b1agYt2o2u1olnptU60Keaw5McAmkkdpHBwmNk/nZLG/f/8cvRA7var+SyY19gVLZQHLNnC/0Sr6zPT/TeIODSvmhjKso9mkHs1AizMI1EPXZD1RtiNUY4SBsEwN0V1pz0P6Kf1pe95UBTlJU6WMIO/YRiwVe65qAJ+r8hxPWHG1sd9Li0Qfgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDSqoc/kHXcDb3Zoc/tNtgIufqo0db/FBmvIaxl2+OI=;
 b=fBmkR8tnbUWarl6NtWDB/S8vSz+l8zj++Ec9Xir4vbigfCjv0UOB/N7Hdn3TYxPQNVtQJl1OwcWBIqjMS2nxogGrf264s0ubn0UVGHwZhwnM8QWLcH5ajTDvDfCJvswq4Rt5qQjlSAV6uOATQJ6UhYxgkU6jWwNWnnnxnpDwxvAHTQIchNvCNSBr1b8oNovVdV/g/A/A+Kx2QzGOVeANjcMlULSnO6X6eyzT2ZEZ0eHnOGEgEqPfyNN29aRvh5mzNLqR8WLVdC0o5b7z/N6MatCcI9nYUT2MqmoCTm7Vb/coVpzqTtnKyKOfjtCEUFKwvB+4NDqqQILKCk89qUdHnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDSqoc/kHXcDb3Zoc/tNtgIufqo0db/FBmvIaxl2+OI=;
 b=bUEhMrUnQ1RQ1FN5EmrWQgdaGPRXASWoqzpbDS/yXQpfOXaRmxOFMpIcKvoTUdNM7ViI5HKGArdhlocQmRlixmfWPv/FdYwilsPa+1sYP+F0YcKCFSm5iwefGX0+2PHjWDn37NxptH5eBCNrsMmmUYWYXap6bPJRUw4oaVTsa4ckBtAccpxJwoVFjR5v2hQo+sHd4JdYfZ/5CK2JsdJ6rrTYvBD1FVcV9NeT20gJaOLMpN1/JsvaKQhsIna6iJkh5029ows/InKpMECFQB7j24mevK9VqmTMW15qZEpQLjK77GQtn4OoXZeV+J5l/sTur/kldaiPON7Yd31uki/XEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5da3c51d-a43b-a967-6f0f-22c1d3ba497d@suse.com>
Date: Fri, 26 Aug 2022 16:13:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 07/12] xen/common: add colored heap info debug-key
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-8-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220826125111.152261-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa2861ed-3295-4a3e-6dfd-08da876d2bda
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2934:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3ShuyUDIiKZjHl7sRCrSOpv0MEas1ZFGIP3J0nlcDDZPO6dUb5DA2ARTqB1FYuInYOcBc4nGCMT6zZQ5CcWuc588fzgmwq7zhA4xZ5WdcHi42MlF3N3ZWQB3SqHSlWcv4ls1qmUXXUXpMIqDa7ngJsky4Z+GGnros+MNSRT732TSVOXt8QO5vpda4po/Lh3f6RxsCEu4KCOPkC5Uz0vRJHMdsucvu7LtB56wt3JCphY1n4dzIpf8BtVxhl9lrSMOg6b+n0mD2ExoZFLru27BLEp5QrmqOZKSaB1Q2Nu5JzgdMP4nZmq+3drOEIWEJtJPS0DfmCweXKComS+gDDFXW9FFgyvnN/+F7KyBE2zedc/xhVgjMSf4KVn+cqt0zpPw0nECOpGP+XrEDs0qxAu3sDYKOChpQ1N/xa+/NMVmVoyRgT0VQVuW6u7srEqQlag4TLSAIZlgbkjcIQE8aspnGENwAHR3vkCdq0Djk5ZaAuisMy2lVpmRycHLsU84t6MMiPAJf7UEvlSo/Hhr+AhdBPSDKtgqYI9MxTjCRuZsjXxmycTULsrPinTRM7mO54eyxut4texadJ0F4Ib0opb9XFBQN6cNAUSDO8C6jl8QF4uH1F2uW6A/AoLatYG2UkDuTti4b+ig6UkWu+f4a6vBc1nQWXyr+GpKHqjSdGvrZ6yXWeoL6oDHnXGL98LJP5BMNkVOkY2B+GkU0MdhHymDefgfJRDf0t/l320j/9+Ztf3nRbnZoTaSb4PJIhs8/U3bAh4u3+kdXpcA9O1CN8OlxZhrfG3irzecPXt7coBxxC0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(376002)(136003)(396003)(346002)(31696002)(38100700002)(66476007)(66556008)(6916009)(316002)(4326008)(2906002)(66946007)(53546011)(8936002)(26005)(5660300002)(7416002)(6512007)(2616005)(186003)(6666004)(86362001)(31686004)(6506007)(478600001)(6486002)(8676002)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1JMMUdHODR1ZGdWWFNoeEdvSHVNVXdjSGYxTFFSYVBwd0pXYUxRdE1BRlBL?=
 =?utf-8?B?aHlHL0J2TThTZnYwMm9Cc1ZlWXdNcmVCNUxRY09DWTdHTnBMMktuR1NPV3k4?=
 =?utf-8?B?cXh3Mk4zTm9peDdyZjVzY1doK3FkUnRJV2VnU2srSlVNRDZRQU5xZFBWaGRR?=
 =?utf-8?B?VUVwTnpoVEFhbXJwNCthb0diWlBZU0MxTUltTUlrdjBMcjBIaU1ud1hWODVS?=
 =?utf-8?B?ZTZCaE8yajhmY3dwRlVuMTlGUmhsWlhvUWh5ditOOWIxMEdUNzNJQW9GcEF0?=
 =?utf-8?B?SGRPeWFlRE9XYnlSMHNaczhxS01VVk1STzRUR1d4amNkK2l6dFJ3b3psdkNn?=
 =?utf-8?B?dzQ3MjdiY0RzWUIyQTB0U2dKYU81Q0UwVENkREdwbk85VThPZmZiMlpYbWtk?=
 =?utf-8?B?WVhsMGNmSGEwdjljNHd4RWNDaGxrOEViVUpHbGF6WmlpUTdlQlM0L08rYXl3?=
 =?utf-8?B?T1p5dERORy91Z1JiUlV6VjF5VEVhUUg3YVVkcUwxdVZhMytJRDErZG91aHdT?=
 =?utf-8?B?UUZPcnJFVHVxQUtoYUIyNENiT3VLczBIRjhQaURtdzV5QTd5OHZodm5JNHFR?=
 =?utf-8?B?Ui9CZG9oWlR4UFBIdHlmSk8yRElRbERpUG5OUFhBdEdLdUZHOVFnUGVYaEpk?=
 =?utf-8?B?b2w4dHV6c2k0NjZUUVUwU3E1cUtQeTFGSlNPMnIvU2QrYld4a2VLOFBlT3Rz?=
 =?utf-8?B?OHVjYkkxMC9WbTNsUXVONktIMHJBMjRqVHBUTWtqWXJYZlVmM08vQldTUjA2?=
 =?utf-8?B?azdHU1cyN0VMZzU4RnVYTXhpRVhFUnoxN3NkRHVmSjVXZXRBNjBFNnJxK1BG?=
 =?utf-8?B?cUVBOVRzcVBaVS9laUpYVmFBOFNvSFFtSVRYSEtZbHVDcFROWHI0eDM5UnZL?=
 =?utf-8?B?NzU1RmhsRTl2Z28yeENJZWpVZlY0d3ZwclRrdWlMbkxCNXdnRGl5RGx4OFhG?=
 =?utf-8?B?NG1IbU13Rmt1ejdLQmNhNVpVS25ob1JYMHVkU3M3aXlvazYrK2NLUEVyaGVl?=
 =?utf-8?B?WDFQNEN3MHBDb2kxQm1YKzRZSmVsT0J1ZmNONWRBbWtwZUxyeWNvc2gvVDJs?=
 =?utf-8?B?UjA3RWVMVlAzWlVGNXE3S251T0YzTEZhTzQ2NkdRL3JUb0Q0SnpLQ3BQWUdv?=
 =?utf-8?B?NGZ1c1BLNWY2MFhwcXRPK1F2RDlIZFViOUhEaEdYYy8zM01CWTVXS0h5Rm02?=
 =?utf-8?B?WnhGeDY3QUtqRTJqTm56T3VGa1F2a0FmUDRRWXNVSXNXVmd0NXZhQ3laOGFE?=
 =?utf-8?B?VzdjRk9GL1RxTTVmTnBCU2gzOWIydi9ieDdaM01UV0d1UmNqVENvUURWMFRS?=
 =?utf-8?B?T3RWbTl0UWhMdk94MlJGUlo4d2g2NzhLRkQ5WWdudU5nWkorckxTVzBXVWN4?=
 =?utf-8?B?TkVUYVlFSEd6aGVxYSt0THJnYWN2RzVxSm1uYk0xKy84aVJiRzAxNE93eDBP?=
 =?utf-8?B?VjEvQzd2Sng1a0dsNTdqK0JmaHlWVFhoS0hxYzUvaUlJR3VhVDUwU1BLZUpK?=
 =?utf-8?B?N25OZEN3OEViaXkyZ3lRcFlRNFFBd2ROdDJCbDdvVWFub0JxV2ppOGFyNHlj?=
 =?utf-8?B?QTBZWjcvRU02aUhhTVdDUlEvZ2VlcndtZkdvd294RDc1MzU3WGVGVVhCaUJz?=
 =?utf-8?B?RE9WMzRabGdiK0R1enhMeWlLZnFSZzBaNmlxQ2F4UVBBNmdtWVM0cFBmZ0I0?=
 =?utf-8?B?d1pCaVdVMnRHUGxhVkJYeXJPOFJXUmJjZ2lkRk9Reno2YmVUOXFISEc5bXNG?=
 =?utf-8?B?Y1hXWkxGanZyZzdSZnozRTNwUHZHMGtxV3VqOTlRdlhyN2ZxNGNNTjFnVFVH?=
 =?utf-8?B?WmhkZTNENWhOUkJDL3A4WlU4ZkM2YjJFM3BRTGZMQ0d0UGQ4UEJlbDdnK2ZZ?=
 =?utf-8?B?TXN1OXdwZFM5VmQ1Z2xRSVlvN3NoeVJaaXdvYlh4OTB4bWsvZ1JwTjlBQW8w?=
 =?utf-8?B?b2pKbDVuNXA0WThQZG4renJ3VTBsaFZWRjUwTUx6WjhSOHJvVVFZdi9GblJM?=
 =?utf-8?B?VCs1MnkwdncraFo5M01YRGlrd2ZwZ0NnZFFkaXBTTTQ2U2RoeDFWNlVxYWRN?=
 =?utf-8?B?MUhlamc4bnhtSklCODZFUko5NlZTQU85cFA0NjJqVytLRGtLR0V1d25NWUF4?=
 =?utf-8?Q?xgMvXgShnueuZLVPM3saL/IFx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2861ed-3295-4a3e-6dfd-08da876d2bda
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 14:13:39.2485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WQ2No1HfixBX90dwjMiaI+x+N1MPPIXHTzF+dKJRcsdXJDMMP6QW09JMNt3viK2I7H+3hClaRyP63G3qk7N9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2934

On 26.08.2022 14:51, Carlo Nonato wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -605,6 +605,27 @@ static struct page_info *alloc_col_domheap_page(struct domain *d,
>      return pg;
>  }
>  
> +static void dump_col_heap(unsigned char key)
> +{
> +    struct page_info *pg;

const and perhaps move into the loop's scope?

> +    unsigned long pages;
> +    unsigned int color;
> +
> +    printk("'%c' pressed -> dumping coloring heap info\n", key);
> +
> +    for ( color = 0; color < get_max_colors(); color++ )
> +    {
> +        printk("Heap[%u]: ", color);
> +        pages = 0;
> +        page_list_for_each( pg, colored_pages(color) )
> +        {
> +            BUG_ON(!(page_to_color(pg) == color));
> +            pages++;
> +        }

This is a very inefficient way for obtaining a count. On a large
system this loop is liable to take excessively long. I'm inclined
to say that even adding a call to process_pending_softirqs() isn't
going to make this work reasonably.

I'm also not convinced of having BUG_ON() in keyhandler functions
which are supposed to only dump state.

> @@ -2853,6 +2874,9 @@ static void cf_check dump_heap(unsigned char key)
>  static __init int cf_check register_heap_trigger(void)
>  {
>      register_keyhandler('H', dump_heap, "dump heap info", 1);
> +#ifdef CONFIG_CACHE_COLORING
> +    register_keyhandler('k', dump_col_heap, "dump coloring heap info", 1);
> +#endif

I question the consuming of a separate key for this purpose: What's
wrong with adding the functionality to dump_heap()?

Jan

