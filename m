Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAD59C02F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 15:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391401.629199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7Ae-0000Ma-7G; Mon, 22 Aug 2022 13:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391401.629199; Mon, 22 Aug 2022 13:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ7Ae-0000JX-4Z; Mon, 22 Aug 2022 13:08:48 +0000
Received: by outflank-mailman (input) for mailman id 391401;
 Mon, 22 Aug 2022 13:08:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oQ7Ac-0000JO-HL
 for xen-devel@lists.xenproject.org; Mon, 22 Aug 2022 13:08:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d3af37b-221b-11ed-bd2e-47488cf2e6aa;
 Mon, 22 Aug 2022 15:08:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4026.eurprd04.prod.outlook.com (2603:10a6:5:17::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 13:08:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 13:08:43 +0000
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
X-Inumbo-ID: 8d3af37b-221b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnUb4jHmE1MtDc0akfbUDOiARFll+HXX3lN+MeLU9KvlReKaIE69lO8sJlIjg4y0uJhq5qvA7AIxy9GGaaEsvPd4R7BVWxCXROXVcGRZoWFAk+bbc+IjMeJfykOXkFCmUYV4K9CWeB0mZgfIIgPM/98eBfzzz4GvFyupPMGlHQy4MsKTdY1l0Z5yXX7ebVeQJDy8fs6t1Loh7OHFoBs8Wh4v/f9sEJ4e3YP8MFMMrDbCBh4ki9N9+x4aDZiJriKwIboxRa4z2U1eIpybS3fJfOixkyhTTvi5muS+X5yzpLr1vpvyWDAmvHuzKlNK2gSTSGn1NJTTmhN5CmDAVfHw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jQLl0qPwS/GMz6jDSKqSq/5BzIgJ5xzlaCwk8+lKsw=;
 b=KHgIFlSQaKd/a7leTSHTsSHrDMOVySVUlxYreZgKi9N6bpfaTHgAXg0igVJ3b9F1O0+KMpcD8bAfalu6AEWoosL6dPYK/xqkWQLREm7Rd/Ir5YTEic8AQdNupSIAGNOGEPhjxqqEDjsJHI0Yf6cXI86a6Yv6YmClIL02xYsqk1/0Q0PDFmurJVRjUpv+rhZ6j17/Vn6kc5mIXieCSyvbSalaqxCTF3Xr/chih0YSDlzv5+HJtscw8nESzWtbEAFcIN35EwMn1Nehq9FpB23YAQy2U12+2frXzEr3F0vPOhU8Bcfut+pj4QMyQGBtGssjN6sw6h51Ah18Jh2GzyBMVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jQLl0qPwS/GMz6jDSKqSq/5BzIgJ5xzlaCwk8+lKsw=;
 b=ObE4HdqdXgtpXPGzlOdwnHu3leelY/84KI7F6kIpqYR5u9CuPPP3ALK9JcxB9p9YzGvkhfZ7klitwybd354UyPgZYi+zjZeN0XdMXIqPDWRGQtpvMXyKFNbNBunEA9FOtHsSWWOj1XJWvthEKNQfW4knVNUWtib93nAd7lxSrfgrDznqIgN/HI4IkM83r0m6hvINrtmGcVda0E4ozCXSI2OUwLddGcEL7GpLNV0CqGfGdKTO8Y3a15U7smkzoi4uKYnY/TiqeSR0r9eaDYxANqcLLwUQZBuL/MXQJJm04FhN6d/L04yP1ToGZr0vhAtnzUAoREXBk69bNv98tZp4xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <90ea98d7-58f1-4808-b691-c3a773a0476d@suse.com>
Date: Mon, 22 Aug 2022 15:08:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/7] xen/evtchn: Make sure all buckets below
 d->valid_evtchns are allocated
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1660902588.git.rahul.singh@arm.com>
 <710e9e6477270212136d6f2047fd15a033fa7d71.1660902588.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <710e9e6477270212136d6f2047fd15a033fa7d71.1660902588.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2835b791-b365-49ac-c796-08da843f7052
X-MS-TrafficTypeDiagnostic: DB7PR04MB4026:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d+DNeJuPi4NOOPXpPg7+RD+QqBz8PmgFE+POmijMaL4JJZNmXNQR3QJoWmh68xhFRovmYMsB7kGdvcvHijOkWo2KfOPgmuB1DXbIEq5/4MD7QVrK0y6XbBuWMCP9p0jlnWX2pwkDffonUm98zf511DGhrZWZkQyexO4vEhohONhoGjuYMebjiwGqCHTa3mwYnZMVqUgN4hp8sKnItRru3d0wFs937WC9tfgAzXHPwWivyZ8mzUF6Pa/GrK0aW+8YT1ANrTZuVD2H6IFUHQqo8uAJzr2J+wyktL4tvvgvzReyfoliv3cJ1pSWnTMmCuPlgSOkRlMQqhj2CTYHgDcbMZZMFaWkXhUB6wuGRbTm/7TyNNJwmHqKwjkLtwXfkpLRg7P8J7wA21gEEZNl1WZfW+BQkZeq1MIoHhVFaFkByJJEpIsnGKEeqBRqX0P9DU4UfcyHCXAyMjIPibZN7v8Mhwnejw2oNYea6nYdVb7QzhOmEgB0ZEZ4vH1wjHGatvssbh6NDO6QAvZjTWWp2KjZvvaY1o8vEqqeyqqMhcNqX3MqnUvmBRFOTf34lOAh45Ye7BrNXzZqMoLSuJdeujAlRuga5BrmKs85hzpvSZitl4Tl1OWmeFXQFpkbUYjdv1lUofYzCQ8yCkxLCk5H+GPWI/1WvqoGsV8qspdBFbEWQ0JEE1wSwk1wsln6X5EkdepjyGe0EEed6RZKUacgNwR1lNGHb5BTjiyQXz6V7jfYPd9NuG3w6IFt4UlP+3ZrYCQBOIFlYSHovCngYTVuHRlF9cyORdHdZnSoUvVk6bWNRTk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(346002)(136003)(376002)(6506007)(6486002)(478600001)(41300700001)(8936002)(186003)(83380400001)(6512007)(26005)(53546011)(2616005)(2906002)(5660300002)(316002)(6916009)(54906003)(4326008)(66556008)(8676002)(66946007)(66476007)(38100700002)(31686004)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Umhjam90bzI1RDRLRTNsME1vdVpRekVBUHdPS1dlUG0vMWdmV3FIelpxcEl0?=
 =?utf-8?B?clpjYzhOZkFaeTN0QzBoQ0dnS0dpSHJVOGQrZTFvRnkzelgwaGp6Tmo1d05a?=
 =?utf-8?B?eWFGRndNTHRJQ2pKNGI0YmVsS0hyOWNXdUduZ0doUGl5RzdDODUxUHVDSGxx?=
 =?utf-8?B?VElBdVMrV0YxaFFRblpvZE9uSVJSM1JLUWhTUFFSQUovOGFkWER2aXNXR2V1?=
 =?utf-8?B?VjVrdzE2Z21PMVFEbDczd1N4c0h6ZWJ2VHNaWjVGT2ExN3NPc3lTdmNRQysr?=
 =?utf-8?B?TE5WWUZnSFIrRS9CNTRWMFlnOGgvaDk5VFZMd2N0UDFxVVRwZU9RWTRKam04?=
 =?utf-8?B?NlR0VVM1ZHZJWllNdXRRek1nV1VENEhIMHIwelFUdTFDKzIzYW1SNWwxNjVx?=
 =?utf-8?B?S3diN2FHYU5XTzlFT1liQW1mN3FVU0JDbFlacnJOWTdWdkFkd2JDNm9aUDll?=
 =?utf-8?B?eENMNmVta1MyTVNKclMrMytFR0FNd0hTbmx1Q0tMclUvaUV4bC9NNlJiWjJS?=
 =?utf-8?B?ZFgzUVhtcGxjMzBUcm1LK0dLa1RnQ05VbGdmMDdjNEJIZi9rWFJ1YTF2NGwx?=
 =?utf-8?B?UVNUelZWVlRzZ1dmTUxZcVZ6Q3BtOHg2RGxGSzVXNXk0dGJ6OGY5ZDZUb2tx?=
 =?utf-8?B?Unp4d1lrajkvdHVyUWxvY24ybENscllvTUZheDJoamFtTFczaDNLZ2ZucTJu?=
 =?utf-8?B?OGxkNzFGVkZnNGd3cFdMTWZGTUNyMlIxZlc2TU5hNDhIcU0yaDVQKzJuODY5?=
 =?utf-8?B?ZjlDYjdFamdXN01Db1o0RE9pRWxVV3hkbTdHditQNkg2Tks4bkZablhXMDdW?=
 =?utf-8?B?VWNRRzdDYXlIZUFXc241SjV4ZXVUVFZJSlU0bDMrbklhVk5Ucyt0ZVYrMDV2?=
 =?utf-8?B?eUVneDBCNkRQb3YyRmo1b1V1MlZTRmlLNVZMY1NUSTV1WjlxZDVrTkVta2Jt?=
 =?utf-8?B?ckw1ZGFNUzhHTmgvRWNDN2FpZEw3TFVSRTVUYWZOakVKWkRhNzMrdnZmYmlG?=
 =?utf-8?B?VW5MZU5LNCsyc2pmUkhEUTdmR2M5NFBxVUpRSXYvclozM0VXdFZHQjR0dy9D?=
 =?utf-8?B?VUw3RmxCNE5pYWFjaVNFOHhKV3NZRFhFQUFWL3h3MHZDdlRWdkczMWRPWE1E?=
 =?utf-8?B?bGVnVUFIcHFvRjZDYk4wZU15TW5ZZ0dYMGpYekdvTlk2QU1KbjdjVkNoN3c4?=
 =?utf-8?B?dXdsZE56N2ZkbHRUd2M5NHpHcXU0RStTOW5CNGxWamJORzE3Y3N0YzRSUFd2?=
 =?utf-8?B?N1NaU3VkTEx2SlN0VDF6MnBkL2hkbUxxT2pwRHZaZ1RPWDdLMU9lcVRBY2w1?=
 =?utf-8?B?MVlKVk5SM0p2KzJkV3ozSk5IWjBueFBrR29EeEYzM0wwY3hXYmh1N0phU2No?=
 =?utf-8?B?ZHdjYkF2WXZuL0hVbE1HbmpvOStiVmZnR1JGUERFN0IzZDBpbFRBRlNucE5j?=
 =?utf-8?B?ME1FclZNaHNUVWdCS3dSY0JHMVpHbVFNbGF2WHpSOUZSeEZaRmd3ZGxkTU9J?=
 =?utf-8?B?U1JCVG5DVHpxblI3YTh1VzhYQkJ0dzRvNUhKVWJXYW0zZkpJQ0FralllbjZZ?=
 =?utf-8?B?Q2E0K1p2NGphQjdsZGpsTlp4Y0Zlc0Qzbmt1Y2cxUnpUNVE0QjlpYW1mVWQw?=
 =?utf-8?B?bWxkVkdVOXdOZE5qQ2NMd2VnMENRNTZDVGFrcUo3UXl6cE9DUUsxQ1VoYWRB?=
 =?utf-8?B?YU9ocnU0aXprK0hUR2lOWHhQaHdKOXZYSGhvMWFlM1BLR0dYcDJyZGppVGNF?=
 =?utf-8?B?dVY4QnliTDY2c3lSek03blZvWEZSZjliOG84cjJaMXJtOFIrNUZ4NWpXczVl?=
 =?utf-8?B?elExMmlKSGVNTXVZTnNUUm1qZUhTcGlJTUxoL2FqOVRYRHRzUmY3TEtyc1Rj?=
 =?utf-8?B?aXp4aHVIcHo0OU42NUZlbkdKVmZTVTlvQzBDTzRqTkxGWDNtc3NqODR5eFBm?=
 =?utf-8?B?VTUxUjl1eTRtRHBWd0p5QnJrSERINUswTHNYcmtLQW5ZYmJWRVRFQ0JVR3Fh?=
 =?utf-8?B?V3I1NVA4Rld3c0kxY2E4SVNiaVA1MkU1ZEZjVEM1L2lYd0MxUEpScnRtMEFS?=
 =?utf-8?B?RDhCT09UN2YzR3ZrTXY0T2VBWVJ1ZGFqbTh0amZtWWRlZE9QNWc4dWJlWGx0?=
 =?utf-8?Q?YYJMQ3sGc3l+rNjI7+WXhFKsx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2835b791-b365-49ac-c796-08da843f7052
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 13:08:43.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2aOq9LD/eWdke0Qxuu7eTE6+QF+W6XRgiUYJnhgstIMFbUv2I7ahlhBdUqRMmXX51XDl82nxBw5tgJJXPavrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4026

On 19.08.2022 12:02, Rahul Singh wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 01280dc19cf3 "evtchn: simplify port_is_valid()", the event
> channels code assumes that all the buckets below d->valid_evtchns are
> always allocated.
> 
> This assumption hold in most of the situation because a guest is not
> allowed to chose the port. Instead, it will be the first free from port
> 0.
> 
> When using Guest Transparent Migration and LiveUpdate, we will only
> preserve ports that are currently in use. As a guest can open/close
> event channels, this means the ports may be sparse.
> 
> The existing implementation of evtchn_allocate_port() is not able to
> deal with such situation and will end up to override bucket or/and leave
> some bucket unallocated. The latter will result to a droplet crash if
> the event channel belongs to an unallocated bucket.
> 
> This can be solved by making sure that all the buckets below
> d->valid_evtchns are allocated. There should be no impact for most of
> the situation but LM/LU as only one bucket would be allocated. For
> LM/LU, we may end up to allocate multiple buckets if ports in use are
> sparse.
> 
> A potential alternative is to check that the bucket is valid in
> is_port_valid(). This should still possible to do it without taking
> per-domain lock but will result a couple more of memory access.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

While I'm mostly okay with the code, I think the description wants
changing / amending as long as the features talked about above aren't
anywhere near reaching upstream (afaict), to at least _also_ mention
the goal you have with this.

> Changes in v2:
>  - new patch in this version to fix the security issue

I guess you mean "avoid", not "fix".

> @@ -207,30 +216,35 @@ int evtchn_allocate_port(struct domain *d, evtchn_port_t port)
>      }
>      else
>      {
> -        struct evtchn *chn;
> -        struct evtchn **grp;
> -
> -        if ( !group_from_port(d, port) )
> +        do
>          {
> -            grp = xzalloc_array(struct evtchn *, BUCKETS_PER_GROUP);
> -            if ( !grp )
> -                return -ENOMEM;
> -            group_from_port(d, port) = grp;
> -        }
> +            struct evtchn *chn;
> +            struct evtchn **grp;
> +            unsigned int alloc_port = read_atomic(&d->valid_evtchns);
>  
> -        chn = alloc_evtchn_bucket(d, port);
> -        if ( !chn )
> -            return -ENOMEM;
> -        bucket_from_port(d, port) = chn;
> +            if ( !group_from_port(d, alloc_port) )
> +            {
> +                grp = xzalloc_array(struct evtchn *, BUCKETS_PER_GROUP);
> +                if ( !grp )
> +                    return -ENOMEM;
> +                group_from_port(d, alloc_port) = grp;
> +            }
>  
> -        /*
> -         * d->valid_evtchns is used to check whether the bucket can be
> -         * accessed without the per-domain lock. Therefore,
> -         * d->valid_evtchns should be seen *after* the new bucket has
> -         * been setup.
> -         */
> -        smp_wmb();
> -        write_atomic(&d->valid_evtchns, d->valid_evtchns + EVTCHNS_PER_BUCKET);
> +            chn = alloc_evtchn_bucket(d, alloc_port);
> +            if ( !chn )
> +                return -ENOMEM;
> +            bucket_from_port(d, alloc_port) = chn;
> +
> +            /*
> +             * d->valid_evtchns is used to check whether the bucket can be
> +             * accessed without the per-domain lock. Therefore,
> +             * d->valid_evtchns should be seen *after* the new bucket has
> +             * been setup.
> +             */
> +            smp_wmb();
> +            write_atomic(&d->valid_evtchns,
> +                         d->valid_evtchns + EVTCHNS_PER_BUCKET);
> +        } while ( port >= read_atomic(&d->valid_evtchns) );

This updating of d->valid_evtchns looks a little inconsistent to me,
wrt the uses of {read,write}_atomic(). To make obvious that there's
an implicit expectation that no 2nd invocation of this function
could race the updates, I'd recommend reading allocate_port ahead
of the loop and then never again. Here you'd then do

            smp_wmb();
            allocate_port += EVTCHNS_PER_BUCKET;
            write_atomic(&d->valid_evtchns, allocate_port);
        } while ( port >= allocate_port );

at the same time rendering the code (imo) a little more legible.

Jan

