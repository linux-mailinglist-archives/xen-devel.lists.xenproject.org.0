Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF192706C81
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 17:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535964.834053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIwH-0007bg-4V; Wed, 17 May 2023 15:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535964.834053; Wed, 17 May 2023 15:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzIwH-0007a0-16; Wed, 17 May 2023 15:19:41 +0000
Received: by outflank-mailman (input) for mailman id 535964;
 Wed, 17 May 2023 15:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzIwG-0007Zr-05
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 15:19:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d63abca-f4c6-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 17:19:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7684.eurprd04.prod.outlook.com (2603:10a6:20b:287::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 15:19:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 15:19:36 +0000
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
X-Inumbo-ID: 3d63abca-f4c6-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hko9pL/g2DWc4aIvZVvbqbEIdpcaX90Ao4fHkzQWhme4+bTJg6cd3tBRer4HIB8waZsd3lQ5Zf50Dt7/1x3sb51v/ibDy689Kr0cIBwlOJfZR85eI4dHk+DdTaQL4fLwyI2XWE8CEFsIRYv3WWtlPMSBK0xTntglHchCle+4PC0jiU34mlOnBtbLF8LTqE2jQvqo/CtpF1Gl6lL3TAfBiiDVlRPk3sZ3ykdipPpubkbkBbhsLDbrlUxx/Y3a+JdxOAVEO5MZB84sRz2aZR9gpDQhDSMTiYziTphmYIEnUEa9gRgd5kG39AzCxtyTXzd7e8SuawfKu8Sp+d3VyBrpow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5vcVeveCulmaT20Mq9/HRE4T1HPjtyjAXudQ6NRWhE=;
 b=TZleMC/VLUxKykxOA8CtjkEHh1Y7RJMaIY7T+JF/w2HnqhPUnD3w4J8i5SE1JsqaZ+kt05vAg8BpL2KqxGRUt/aU9PJ8sYXPv/RaM/a0H6mqQHFbhJoP9ayJ7qdN/V6wCUzRuIirkx/ijc2DrU8pdsY+m4jMjx386gCvozmpAYGnmYSqtOQ40llDL6okWC9MFtGlADKxwqBXqJWTiIJD3GDdlh1taxv963Q4RJbFKIP0gZ786CAov6/LynVmm2y3WAmWieesT72NCN5SGP1O2ddiNSnlZAnopvsMCLDsTDOC4eTC0votqD0nf3jWuZqrA3mx03eHZNgvxX7hGnK0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5vcVeveCulmaT20Mq9/HRE4T1HPjtyjAXudQ6NRWhE=;
 b=etVsbcQe11YXhkNYMc7CPyGWHGQo7SnW3BFwi6zJRTgaHXZMf7fjk6oQadnSNaYYwrNckYFCwR+nLsI9x2w185g2vq/CnK6rquI7xebeEDhV1h+8uiAheW0fjKc+dUACUt6S5aA8RL1KSJQ2tJjk0OXzODl6aENdB2wxoSQwmKGK31+jdn+s/aZ30M43bxgxMux+01dv7hjiRQXvwiI9NbJzyOqAkUVHIKwPEopWBHbni8GeyK8kUPYLiBHJ7bJn5BtqEBVLMdT7QLVIGDtKmTxYKbj8LyTsHBVMAJAGIcHowZRe7bIuh2/MJrsxyi4EUlNlbP4MqCjv8FSeTaYlKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <599f18f9-880a-c016-9e98-4090e135fdf6@suse.com>
Date: Wed, 17 May 2023 17:19:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] MAINTAINERS: add more xenstore files
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230428132756.8763-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230428132756.8763-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0050.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: bf2afef6-cefb-4fea-b09a-08db56ea1fd7
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O+wsHShee6ZivqFmAdIMzrBjm/TjFzp+uedtXu8aKi4NHEYJ1qvTydDM7iRu+B93fu2n3VlzUzQv3Q4fs8NpHUhJl3tWDIh8J8ifN4qVXD1PIDOkZEPbh6VkZYPwR+8IMNt4sNx7pPhHxyT3jKfw2kEgjgqZie3k/ppc2HDa7ZLVHaq7uPEsZ6X23rovYUDjgB/f2lv59JL0Bl5eqf0TeEr9m1Nn6WullT+55/0sO0WyLE7qiazEw1uKmeBvVhQi1mGBAFBn03mjpiYEBIIUJrPNbPXFnSK5ukdjVydQXtjSnO/LrtuTjcDXZB/HBkkKTVwGXCV9QnrGKIpq3OnoCNnJPm5dAHrEJSJWftxP1iX07suWa4mJwL3A88Uh2lq3rTzDzzTi3j7y0kNXMbcuSH4g5tJtnZ8YJJvMIm7VzZ8Ar2ltErbtfj324fEi+EWLZzUZy/eJ5+aW4sL9cOFpOSIxmaxV2T/oN6GulamuqSZ8A67LANNlE0k3ApCDLj5xNlj8Dh+eTrYnHyy6RTRcEv033hIqvSjAAlCDmid+Rti0DP1OdqrJ6Xka/WseGPFNmc2U+f1/Gt1XnA/LGpXD/CRKcE/zavU1wH/V3a8wnwTulugBqJkpi+6mQfDu2k1YTRHp3lvb1HchHPz7/aMA7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(83380400001)(186003)(26005)(6506007)(6512007)(53546011)(36756003)(6486002)(2616005)(4326008)(316002)(6636002)(66556008)(66476007)(4744005)(66946007)(2906002)(38100700002)(8936002)(6862004)(8676002)(31696002)(31686004)(86362001)(5660300002)(41300700001)(37006003)(54906003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEl0V1o4clZGWnVkVHUxWmJ3MTF0bVdBQmN2djdvMm1PNFk5UytFUlM4aWEz?=
 =?utf-8?B?NUZoQlgzbWRPZXk3Y1hLWExyN3pBQ2xWbmh0MDUvOSsxRkFCYlFYb2crbTND?=
 =?utf-8?B?bDBNTWdwZUtDWDBNVUlhMU13bGtBZko1MWVTTUQwdkNydGpVLzRQTUN6M3JQ?=
 =?utf-8?B?Y3NpTVV2dUFBeWQ1NzEzOHgzOE0rSDRabENaUnl3eW9kSDdOdUFXeXRpeDNW?=
 =?utf-8?B?ZVEyWHpJVmNvTVlzR1JnS082V200TldvckdEOWxRT25RcjNJVXlyNkc1eFVF?=
 =?utf-8?B?dTJuLzhaeGdoQnNCS0xlcC9wUmU2V2FJRHdCTmdIa0RGVDdSbFBESUJiQmR4?=
 =?utf-8?B?a2NrQXlNRE5zS3o1V1VXYnFhOVVBRnJ5L3dRcGhIOG5JZDZ4blZWZkdaa2tD?=
 =?utf-8?B?bUtBbkxIcHMza05icHpZdWtVN2RnaEwxQWF1aFQ0bHIyY2Z0VXJyOEhGcW9E?=
 =?utf-8?B?Q013L2ZXMXp4ZzNMdHQzZ2RCeWNaMVBIS3ZTTllHWUJzemZtNk5NODBtMStE?=
 =?utf-8?B?bEFITm5tdTkwK2U5ZFNjS254MzFEOUg0WkVJcXBnUTFXZTdwY1FIazZVdWE4?=
 =?utf-8?B?SlN1aldkWTN1QUdMQ0szL2F6UndsMHhxTGxJdjJYbEFMalFiS3k4a0RHZ3g2?=
 =?utf-8?B?QlJJcUJiaDBIY012d3Y5RDJBOWNHd3F3NjZseW8zc29wZlpmcTByMGdwR0hZ?=
 =?utf-8?B?bkNhUHpJOW82ZFZLVVR2c1MzajBqRXhnK3VvU25uRFFhVjJCTE1FcTlZVmNw?=
 =?utf-8?B?ZnVCWTBKdG5nRzNXcENEeWFjNXFsdGJ3ektXM2RXTDVaMnl3SWxRNVVPYTd3?=
 =?utf-8?B?Z014YmVJWDBjTGJ6OXBuLzZTcHBtYzkvSlI3SEZaNW90d1o4Ulo5bW1aVzdJ?=
 =?utf-8?B?bWZDWE92V2JhT0tNMlRKNXRMV0dIVzZzZlRBTkp0ck9yOFNjQTVKY243WC9N?=
 =?utf-8?B?d0RuV1E4L0FNaitiVkxUb0ZHdEtXUjFQTkloVG0rTkFrd1dWdC9xdi9BVzUz?=
 =?utf-8?B?SForTFJSbGV2U3cvcVZhK0NCbm5ZQ2JiWjAxaEVsNjc1QUNod2VPUDVLY2ww?=
 =?utf-8?B?ZFVCNTE1eTdNSjk1QnNodmpCZS9KdGx2RWJibTAxcXhzUFhZeXhyNE56bGI2?=
 =?utf-8?B?Zjhnb0haQVFrNi9KZGtFOUFXUkxKeVlDbEljcDRrTXF3K2hJUzlZcE1OaldS?=
 =?utf-8?B?QU10VE5KWXhiNUVPdGF5VEZnMTZYcUZseWdXbjZJcUlVbmY4c1NKcjZzZjhE?=
 =?utf-8?B?OE5yaTBBODhYOUY1K1lHTERlK2gzNkhzcm1ld05tUThVdmNMOCtISDhndllC?=
 =?utf-8?B?c0w2aFkwcEJGc0xBLytPMDVtZW9Jd1cwamk2Qjd4Mk9EWmJoKzlSdDRtN3RR?=
 =?utf-8?B?ZURwZEQ4dGFEWk9CbkNDVzd5b3AycGtZbldadmYzbHh4dFFaMUYxVUJ0RTdQ?=
 =?utf-8?B?TW4rZDdXNXdEclBxRGludEpnVjRXa04xdEY0V1d6UytxNHR2WVJEcWhQN0ZR?=
 =?utf-8?B?WmFxN1Y3bDF3czltbnpDWTk5KzZQN256bTFhc0hWRWJ3aERlYjFKbG5QUHVz?=
 =?utf-8?B?Mm5GMUY3Y2FjMUREbU5RRGJkTCtQYmlRTVVzdFZScUtENDhpL216RUhlSlkw?=
 =?utf-8?B?anVZNHpVM0JYYUp1RG03eGxFVm5qT2ZITklDNXg1ZVF5Y0dtM3NVeFhNdVg4?=
 =?utf-8?B?N3NVM3o3dDBoVCtMRkJIbGZhUjNhOWlrd2NyVlhOY1ZxOVc2T0twOU85QXQ5?=
 =?utf-8?B?amxGMDdRSWt4MXlEZWh2OWErOHJTNW1YU21BaytpWG9QaFNCNENTb2YxNDhq?=
 =?utf-8?B?MmZQZGJ5U1QwUDhra0ZTaU9Jd2w4T2RZYkVPWGNJakFLc2xLM3JaRFZCdkxV?=
 =?utf-8?B?NHVXL3ZXQzZNOUVINjJnS05lTHRkdEZNODBxMzUzZ0tKbFVrZTBwbTRwS0hX?=
 =?utf-8?B?RngvMjZjTnZhRHZRUmNOZE8rQUJzOHBjYldsdFVTVWNCVVRiaDg5ZXRsMG0x?=
 =?utf-8?B?U3BzVFN4RHlBRkJPRkNLZFVTbkJHQ1VtMUJPUWQzOVJmMmZYSzVHQ1JnRlNL?=
 =?utf-8?B?amlicGxEM2pBMUdsSnpkSkd3KzRGSEE0R1k0MmFUMlcvQ1NKTzJuYSt4d2k4?=
 =?utf-8?Q?BWIO2h1KpfdB9FQc6JxAe3Z9I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf2afef6-cefb-4fea-b09a-08db56ea1fd7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 15:19:36.1832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIX+2zXz2ehAltoSkqdnPVGfgMFVZCmkf2YHlnDI3FFoQ2lWJVwlv+oJ3jMr4gT1yJ1UZYUX7SQ38gi1DLr8mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7684

On 28.04.2023 15:27, Juergen Gross wrote:
> Xenstore consists of more files than just the tools/xenstore directory.
> 
> Add them to the XENSTORE block.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0e5eba2312..f2f1881b32 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -653,6 +653,11 @@ M:	Wei Liu <wl@xen.org>
>  M:	Juergen Gross <jgross@suse.com>
>  R:	Julien Grall <julien@xen.org>
>  S:	Supported
> +F:	tools/helpers/init-xenstore-domain.c
> +F:	tools/include/xenstore-compat/
> +F:	tools/include/xenstore.h
> +F:	tools/include/xenstore_lib.h
> +F:	tools/libs/store/
>  F:	tools/xenstore/

I wonder if at the same time xenstore specific include files shouldn't
have been purged from LIBS.

Jan

