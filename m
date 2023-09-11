Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FAB79A540
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 10:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599099.934361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbqI-0004BP-5n; Mon, 11 Sep 2023 08:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599099.934361; Mon, 11 Sep 2023 08:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfbqI-00049B-1K; Mon, 11 Sep 2023 08:00:22 +0000
Received: by outflank-mailman (input) for mailman id 599099;
 Mon, 11 Sep 2023 08:00:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xbw8=E3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qfbqH-000495-3t
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 08:00:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4075f027-5079-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 10:00:20 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 08:00:14 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:00:14 +0000
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
X-Inumbo-ID: 4075f027-5079-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enV+fEx0TXQcBQrThKaCm8SFQ0Q0Gfw11r2HjITkxa7I3PrTk+IgQmhvB2JwzaIsxhCFPsX2p8nqOstI+pBpzgUnVAwX/WNOCWZYf1Vg36/fn4IlAAJYsUOKpVH5IkQlLXwjnpgOY5rdTdKwcWGvs6b9LIq2Gkt3Eby4T5XVswJIbQaispwEsFkdCZdODTwlWCXZAaSZaJyZ3+MAa+9qBa/Xtd5OMfqWSxRG8SqglLJjebEiR06Am5SRRNtuXXrFEHiBQRZh1wmz5vqhjW+ZoCCGW4uFfBVnQ48XqXbTpeFk/MfG5Erky4ZSNCX6YgbFS6oTm7X7lE+SznENcrCkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75BNbPyAY1wdDn9ABHQ42HIRMsPtHGo3oyWMPHCkA8I=;
 b=BX5yBm9uMju7HHlxXz7zgv/yHWMbvbDJs5tVqqJJnmdQeybfTs3aySS+goKB25/u0WzcoEbEddDjj5c1gbU+S5FKxfhq4orJQsUHZITE5ACVaFOzM0MsIP93ijZMdAgbIONHYl1gkx3Neq+EGGuZSkeAw6B0y7M+HW8SayxneSZDMJEVYFsgdvpl+Jt1UVDHbRWIHC/Sn/InHd+/f9OEtap1m/OKdRYA9RCRrTpaTA7bHfmPL1ilZD34tysGBXf6uLKvpxs0y29P8W0OMQ0x82JY0kd2DZjD6jIhWs1TD+ujlr14RS2BMXjK+huIHhdPNYXWyAkpSXWqiFIua0p0DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75BNbPyAY1wdDn9ABHQ42HIRMsPtHGo3oyWMPHCkA8I=;
 b=gDW5tGlChvMqWcYmz5XgWFIFx+czEehxooat0bYjNuByqd2uvV4ImvbY+OXhyg3WQ2hpqYNKUq/m/D3LA/bTB1xCbmPYr6EPyLCUcmrHQUGZ9lThAzvAm8Qzv6i+cVX3mBfrKSNy8fil6VqZ32FeWGKxGn4A6GvPMYMFu34tuGleoWji+4kAlc8bOT7cnp3oeogUZQnk2tuU5/+GTuv7IuEgsSTtjxh4qF4LcMjAGY1Vcft/0ZzxwmrgbdjHFasqT26eG83vQghfo5V+miAhyHGO+8wdZrfU/IlKJ6LPgy3xpixFjmkC9qXSI7bzFX+MAPaINbW0vlGKOQdheyHVUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8890cb3e-4538-9b88-cb3c-ae302b7109af@suse.com>
Date: Mon, 11 Sep 2023 10:00:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 2/2] coverage: update gcov info for newer versions
 of gcc
Content-Language: en-US
To: Javi Merino <javi.merino@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694189143.git.javi.merino@cloud.com>
 <f6495eb4c02f6539c5b95d2850d4a834f2ea94e8.1694189143.git.javi.merino@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f6495eb4c02f6539c5b95d2850d4a834f2ea94e8.1694189143.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::8) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|VI1PR04MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b7222b-756a-44c7-c7a7-08dbb29d2163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eg8uv936uqpvHiwnmweHYbS/AxWN/+Annoe+KEaIqDof/6BY35AN8vxQQDMbRghUMQO1nuvCI+PQKtO4CJsPvD6xmodey8gRTNtTZ/RROM1manxW6Pv5tp2Kv+mta8nkMj5MFJTzej1L+1DZUVrrljhoCBMmdS0zEDLCq3tKn2Uxs3yOQwiSzTS1nNBJf9vpAFilmDs4FOWPClyalSmzP6WqN+DWKgfJguez/3NJyJz1HLFmKcqi9gF2kIoURUqXfGM8uPWUxoqtStpO3OyodMBAi4gxnr8NV2oePSkZrK1DN7mtDwqF80edoa4Z6/azOCe3nHCpcKsxc9/C5WwFb1vVW7sDQDuZAMEL8Ehl5G2fdLGeIA35Ksa3RrLrmXdc/ZVE/CX+argGnLmWCK+WQhN9e25b0SY0mYKdKQJOCRZMT6Kk+JjWwo6cUDCFYL9WAkamajULJXCaWYRXwXgj7tTE7NkaRyQXbrKXaRJIspQaSoxKMe2q4ojZ+a73LQTkH3TJodFemhEBSQzDVcmubCWv1WKLhI1MDPqoKEpdschQCMHGvS3tzXwRPEo/03wTL+5USNSViwcFl3P+TCtzf1Kh2dTM9XJqE2a3VR3Zu9sxGJ2fPaAZlCWyzuaG3EMokrZyKbTZT6yb46qRGmOv4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39850400004)(451199024)(186009)(1800799009)(41300700001)(31686004)(53546011)(6486002)(6506007)(36756003)(31696002)(38100700002)(86362001)(26005)(2616005)(2906002)(6512007)(83380400001)(478600001)(316002)(8936002)(8676002)(5660300002)(4326008)(6916009)(54906003)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmdvVFN0T0w2VGdjVkk5NVlRUnUxRCtwNzdIdVE5d09SdEFpWU1iYURiYTZy?=
 =?utf-8?B?Tk5VOXFZQmFZeEFDSW5XL3Y0T2twUzBBa25odW1QQ0FEUDE2eFpGbTA2dWlL?=
 =?utf-8?B?WnorMkhCaHhtMGFRTzBQSHVkbERmYW9jczdtSXIremx2QXhQcGhmbWYzQk9Z?=
 =?utf-8?B?bG0xODJnVlZ2S2licUc2d2Q5ZVBvVEptMnMrcW0zZmhMMDFVMG1CUmN4eVZa?=
 =?utf-8?B?VjdZNFo4UmZ5WXlyWEpPUUJxMjgxY2JhU1hJcmZpSkdsNGdGQmVuNU1aTWFY?=
 =?utf-8?B?SEtVS2FOS1IzN1ZFS1gxYWFQRnNacHhYTHJyRUlhSVVZTGFYOWVLQm1uTFZJ?=
 =?utf-8?B?QUMwNXgwazcra1pMSHZxTkdya25jMUg5UGMxNXB0eVd0OWozenN5L1k3cENE?=
 =?utf-8?B?czlJb0pyWjNHVkttSmJ1MDRVWXgxckVlY2FhcTBmcTEzbGMzWXBac2M4M1dW?=
 =?utf-8?B?VVVwRUt6bmpWcjNtaXRFdFhnQy9ac1FSODFxb3FnRzg5cW82bDZ4OTNXNlRY?=
 =?utf-8?B?bW4vMk84b0dJc285NXNJZDFrVTAyeTFobnRwc1o5RDhjeG1pMnl3d2FPWi9m?=
 =?utf-8?B?WnJ0SGZodzR1b0dtQjF4YnVvcE5qWjFYRHEybFJtMW9HcnhwZTlEb0hrTXV4?=
 =?utf-8?B?UGFCSldES2JEQkYwRE4yN0IyczJ4M3RvcGtwZUFVLzluZjFLdER6eDYySncv?=
 =?utf-8?B?NCt2VEFhamw5M1luc3hBUEovWDJJb01sdHdIbjJZWlJhR0JZclZBMTJvc3hi?=
 =?utf-8?B?SzF3bk9PblNRaDUxRnJMMklPTFU0Rys4VlliU2RYVE9MWjc0Ym1TSWtYMnRT?=
 =?utf-8?B?VE1JV3M0bUl6cjRZKzJXaUVtTmtFUnJUTzNIWWtwK05WejM0OXpiaFExNlcz?=
 =?utf-8?B?UGZFL3E0TFJIYnV5QzlsSVhWMjg5TTg1a3lJYzk3WGpxcjBCTFFVd00yTjVH?=
 =?utf-8?B?Y3hiMlB3QkFUVDJKTjcvTXdwUXZrZVJqUWZOYkFsOHVhVkNRcTRmNzY3RnI0?=
 =?utf-8?B?dmpjbCtFQS9CMCt3QmNnOEI1b0xFQnhEMUg5UVdkZFdTZ3Q5UmEyVDlsUC9o?=
 =?utf-8?B?b0piVHo2NktVVHJsYmdPeWdncGFCQkFHajVYNW1jeEQxZmhDUjkzN3F4VW5p?=
 =?utf-8?B?LzVCL2Q2VHUzMFFnYU5SWFRtR1lDbmJXT21GSmZUVVRDdGlwRzB5NWhHV2xB?=
 =?utf-8?B?Q09SZXhuTXoxcGVKbUlicGJHK0ZmOWs2bkxwSktwcE0wRjdRYnNtQnVXc1Nr?=
 =?utf-8?B?eDNlMEVQTU5GQ2t0T1hlaHJ2WDhnN1owS3pkOTNJTDE2YXpLOXNnZGdOdUp2?=
 =?utf-8?B?b25aOUFmZVRyNWtNaTdKU1Z1c1V2K0NTQ0dyZDc2UEdyeklFZFI4cS9UVlI0?=
 =?utf-8?B?QW5Demp6MVFLeGpNR3YyVTVZVWgwVndOcDV2L0JjL0VzUVVlR21SOTR4aExu?=
 =?utf-8?B?dVp0UnBIRlcvbmFENElTNkJpT1ZhREcxUUVYMVJVVm03Yzc0TXRxOEUwekZn?=
 =?utf-8?B?N3B0MlJlZ0hBbVNrc1RNMnVVSUhDYmJsZHdkcEpYTDh2MUwySkVHbFl6aXZU?=
 =?utf-8?B?Y0cxOGk2NEZFNURMM2FGUTJuWmRtNVFCVldKOFZURXVsNlp6VlJNeDFvVjY5?=
 =?utf-8?B?TGFWdFJnZkYzbmE4bkQrbGlZWkkzOUIrYzhJaURjUHI3WHB5SUFON0xHcU5k?=
 =?utf-8?B?djNBdGhvVlJuS3hTSThic2t3YlRvK2EzSlkxaGd6UkZLeHV2UzlhWE1qbHQz?=
 =?utf-8?B?OHRFOG1FY2VZcHpKMFlBdERHRUlOZG1vdFlGc09wNXhPQjR5Ykp5S3Vsay9E?=
 =?utf-8?B?ekhESXIwWG54OEgwbkU5VUp6dDFvWE1VMDV4ODcwTnhzTzFNdEswbnFMWnBS?=
 =?utf-8?B?MStac09ZZDY1Vi8zVitwMnEvZFpkM3VrZGI1MTBVaVU0TjhkNWYxMXFVbjV0?=
 =?utf-8?B?NHcxTHNXRTJzRHdPcEpieXFXeVFxVVh0amd5dFVYVkNkKzV5S21RUXQ4a2xx?=
 =?utf-8?B?bFBBMEtZdVBkU21BV1U1bERWVUNNRW5QQVlRTkdndW1uM3g5dllSOExzeUFl?=
 =?utf-8?B?VjBZdzRPS205Y0d0aXJaSDN3SlM5Vy9ZNFNuenducTZvSW5la0c1OWlrVXZx?=
 =?utf-8?Q?uSKFBBUZKlTgNp9RbN7VmFMG+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b7222b-756a-44c7-c7a7-08dbb29d2163
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 08:00:14.4128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3saYPFFThU4o+VMCEVAxC7UL02z9Ff6UBpgQcN2q2RFKLdjmbCKcEl8CL8WuGFkntbYPbJLxyovy1OE+UEJdhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990

On 08.09.2023 18:20, Javi Merino wrote:
> Shamelessly copy changes to gcov_info structures from linux so that we
> can capture coverage for xen built with newer compilers.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  xen/common/coverage/gcc_4_7.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
> index ddbc9f4bb0..8f6e287474 100644
> --- a/xen/common/coverage/gcc_4_7.c
> +++ b/xen/common/coverage/gcc_4_7.c
> @@ -24,14 +24,23 @@
>  #define GCOV_COUNTERS 9
>  #elif GCC_VERSION >= 50000 && GCC_VERSION < 70000
>  #define GCOV_COUNTERS 10
> -#elif GCC_VERSION >= 70000
> +#elif GCC_VERSION >= 70000 && GCC_VERSION < 100000
>  #define GCOV_COUNTERS 9
> +#elif GCC_VERSION >= 100000
> +#define GCOV_COUNTERS 8
>  #else
>  #error "Wrong version of GCC used to compile gcov"
>  #endif

This would need adjustment if patch 1 is adjusted as suggested, then ...

>  #define GCOV_TAG_FUNCTION_LENGTH        3
>  
> +#if GCC_VERSION >= 120000
> +/* Since GCC 12.1, sizes are in BYTES and not in WORDS (4B). */
> +#define GCOV_UNIT_SIZE 4
> +#else
> +#define GCOV_UNIT_SIZE 1
> +#endif

... making the earlier group also match this one (which already works
downwards in version number space).

As to the comments (here and below): Since the version check is for
12.0, may I suggest to simply say "gcc 12" everywhere?

> @@ -89,6 +98,10 @@ struct gcov_info {
>      unsigned int version;
>      struct gcov_info *next;
>      unsigned int stamp;
> +#if (GCC_VERSION >= 120000)

Nit: Here any below parentheses likely want omitting, to match there
being none further up. Preferably with the adjustments (which again
I'd be okay doing while committing, so long as you agree)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

