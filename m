Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8B599DC1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 16:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390363.627745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP3Pw-00066l-0Z; Fri, 19 Aug 2022 14:56:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390363.627745; Fri, 19 Aug 2022 14:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP3Pv-00064w-Ty; Fri, 19 Aug 2022 14:56:11 +0000
Received: by outflank-mailman (input) for mailman id 390363;
 Fri, 19 Aug 2022 14:56:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oP3Pu-00064q-Vi
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 14:56:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f6b4222-1fcf-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 16:56:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3683.eurprd04.prod.outlook.com (2603:10a6:208:d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 14:56:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 14:56:07 +0000
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
X-Inumbo-ID: 0f6b4222-1fcf-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/6ifCAW8gW318oRTZqNIsDz7SU3Q7ty1vHjJG7opUGAKJZ19Ew35H0sbjFWaYIslhWVojZs5ldkRZHfXm9b2raoPycYcoZWqdUQ9K+88p8FKyMoKs+uGPW16E8VTumSN5EBhNL5yb9Tkx7gYUilgb2RpEVQd6um4PoCzgcS0cXgO9VR4/3NUoN4HghEy04gBt3bbk/bCEK7Z9JmtXJKDlxqlw2k7ZCJ+zGMITcWBR0J90Bl8dXrYHpXoCbrEwdvgklmvK1uZYRqtYlSIAy6K8659xeY1Y0lZD1uxeU9qSdNVuuHcXPcFMzvq0MSRVDGzOcMQfmEg7Iv9ovU1G+V1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAE4ajIzBGIWPLYM69sgRqx2ZRTgZcDz0hEtzpPXQZ8=;
 b=bFUK10kd1FTvT8YNmfufsaFqxWUMZDbRf72NbvxZyKQeu18jLuZdRjPlqsg8l0AQjUSxp3tmdwxxUHSWe9ehc2IZ/bKFC6B1LN5TuxD9iDeQYCHvMh8bX6AlalgzCVxZmt8QgP3GLWlZPqU9VSxs0ltBBF13j+HXM4H0xdvxb9qY2o2Fjdsrb+qVtCGbOOpagMrqvuITJ7OG81l9zUnOgrVGg0rXPrhmxZnrgyQ6p9JOLT8YzxH57FNcb+RHTV3pbxqc2P+co1zLSUdx60wLH79K9ERj9hQLxFWBn2zdkZJCabeJgEKegeLaWNN6NT5Kg816IK4rQYCZ3UR4AA7iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAE4ajIzBGIWPLYM69sgRqx2ZRTgZcDz0hEtzpPXQZ8=;
 b=CcvWJ7/+PTJy1mVTn9aSdOjIrNH/od/eXiYf60irmB/pgS9BbG6rCIiCI54TanjY/+u1t5G7Qc+dmfaDzp62dei9vIj8Q/C7cMxgBUZRGaMkaz2wGPZEaXe3FleMU6k9fS0YskgsPQew6ar61BKiBVnYdQJe/5ooLhWbURsVaEgX16pym/0cZqwu+gmSH8YWsiJKtE3lIGtoZvzuyoFMPwoHAgBlHdIWrqK1NunMqEx5E/vDRVVbM/bvnCwFdQori0JmjZP4Hi5vyIeFoDRw7sgrkALx1oYFuaglInULfpv0VUt87wAXBP5CEgr/ABGWZvqCH32VvdGWRjPOnUjlgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcc16cc0-4bc1-d6c1-53c5-92a0c1dde9eb@suse.com>
Date: Fri, 19 Aug 2022 16:56:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [XEN PATCH v4 21/32] tools: Remove -Werror everywhere else
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan <tim@xen.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, David Scott <dave@recoil.org>,
 xen-devel@lists.xenproject.org
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-22-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220811164845.38083-22-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0366.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10460e7a-a964-49dd-aa72-08da81f2f287
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3683:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/1Nytqz312Yk2+mLEgfOLuaRqsUntPG/D+5W86z/z3e5ZhG1n7EilnbrwnfABSpBh9a34LU+npon4myrf3rszPpz+TKfJSnm6sY5lPKTeIZgw31CcKikeUtfodbk2aHL44+uVVVutbxIqAr6ewrTDz3jGVAi9kOaePswzuKGlE1dHoPos/fZq3MQHVNHGpQMdNl11ahl4TBX5XZ+vwwRNEeBBYbHdsx7Hr4KqAaxp1No2QQD6O4xwLJ5pYj8MxmE+RIgwIKqhjLGxwlQb+FsAxOxk2O/iA4BHH+Wsi/MiR5oSTQiGLuCr/+86r1Tl6kA1JbgcQU1hbhwmFU4dLMbTIGgtkNkbZ6ckLpeseoAqcBTysB534u1DQB/pBJveZWIj8BKWlK39hqbg/TRkd/WOmt3/UYfoS1l0ycqo0YC7LMaBbK0pal4blKnVvtHCct0nYIJSMlxJAax6LwcRz8ZEysl4DxGgBJjfToMZcBIxF0R9u4SHzRlWbMGZYe/01zz1aLhBT5WkEp0KW19DgJxDPUnT32KsuWTOE2W5s26ESjdcQasducR0dCDVyE3T+Vbk5Z4sl5GLUFlpW6fKxX8+Q0bYw2k068Q6fYL1QpBzA6LOImQhKQ9kDoit2tifcUl4RMLsvo0vI9is0kuHQl4/+Qz7kfcKdviZvC7lsGYFmCSV6XJUQCQaoyCzbXFeW0x/b41oE23KnQ0bSTL2UGxqKfgM4BdiShFYcZxxeTR/jtFimyvVqv/B7xEwbACkVzgAv+jXJSfHi0fRSYlqiuGNJpH6WrMy6Jm7hDE/6/zq6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(136003)(346002)(39860400002)(8676002)(66556008)(4326008)(66946007)(66476007)(316002)(6916009)(54906003)(5660300002)(8936002)(36756003)(2906002)(6486002)(478600001)(41300700001)(6506007)(53546011)(6512007)(26005)(2616005)(86362001)(31696002)(83380400001)(38100700002)(31686004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0dNSWxwdHB2OFpsTUNScVZTQmdHU2xNL0E3MmNZYVNxY0FLKzh4RUVBQUgr?=
 =?utf-8?B?cXBnQXI3eW1Lcm82NFgvN3VMRHVxbmU2YWNvZFJEUm84L2FzUGFIZHlvbngy?=
 =?utf-8?B?VCs2TSs4bUIwNkZSRmFCS2txSzF2T0VGdGsyZ3IyWFdXY25KNVU2cEVZUnVQ?=
 =?utf-8?B?OWdiVDdFWnM2eDNtSk9CaXNIalcwUlBvVU9PcnA0SWgrZGRxdTAzK3Zzc1hw?=
 =?utf-8?B?Q2UvWVFxVmFQVlJMQlRJbS9xdzdDMEFOa3Noa1lzVHNTZkZKYnAzcTlFZ05R?=
 =?utf-8?B?VmFhaVBqV0ZFZWZGNkxwaks3Q2I5S2g4WlpiRXZoUnEzV2ZGRGc2RHVjbU9z?=
 =?utf-8?B?T2F3YmFaQWE3UEtkRUx1cWJNQjNEbU8wYUFIWGlnc2VuK0pjVjcza25YMHFj?=
 =?utf-8?B?TG9xbTErY2sza1N3cFIwd1owWk5nZXpFUlkyUlA5MUJBeXUxNFQycm1LR2ta?=
 =?utf-8?B?T1cvc2IvTy9wVS9pSHIzK1NvbDRNOUhMTHZ2UmtPLzE5Vmw1Qk14am92SVlv?=
 =?utf-8?B?TFFZNkJkWEd6UzdLcnRSK3NkcG5JL3QrWUpIc2loQm5ITzNuTGpzeVFEOFNr?=
 =?utf-8?B?NGZrVjlxVVl3a2ZJZ1o3cXNSRW9LNHNUM080L2FLa05BMlRlTkptRW4vM0ht?=
 =?utf-8?B?QVpTMlN5b05DQ2llUkZJTGlRNXZLak13SE4yQnBKK1ZmS3ltdFpaSnRaelU3?=
 =?utf-8?B?RHRqZURuaXpyU1F1czRBNHh3VGZnTG9xVmVMQzFXQmxYK28vaGRvQjJCbGZY?=
 =?utf-8?B?Wm5STm9CdzdlZFpUb0dmYmJpMmpEZTlmdStkWDZzTmdsSmxiWTVldFByZmN1?=
 =?utf-8?B?OWIzV1dhRkFsR2FHN1RIcENPbFRjcGkrSGFySDFPMm1oV0h2clBXYWNzNkt0?=
 =?utf-8?B?SVFDSTNXT3dpUmhHNnlkMXV3MjBQVThUdUNUbG9GK1B1cEtJUEJCNGo3cGxm?=
 =?utf-8?B?QVRKNGNVQTdJSGJnamdYV3ZKV1pjOUNlTE5tdGlPck9Ub1lmWGpTaUZZcVlR?=
 =?utf-8?B?NXJrbm5ubC91em9NZGRJZ1R0R0tITklGMnRxNEs3eUE1c1ZVRHltdHlRZnB5?=
 =?utf-8?B?M1gxdW9NVEZ1VGlrdTNseGQ2cERwZGNDWWMzalpyYmhLZWU4QzM1dHRRaWRS?=
 =?utf-8?B?SG8yd2hTTExORXkyUm5kSEtoWnpBNnovdHFUZFVxRUNxQ0RmaVZTd2pXVk5v?=
 =?utf-8?B?UzB0ZWVzWUFQeEllVTF2TDluTzBaaWxHejJQV0lrbGFGNm8yb1A4eTRHT0gy?=
 =?utf-8?B?SFRlZ0h2T1VhRlQvdXFGNGpqWnB0SHZQSlN1WExzTXNYQTdFd0t1empCNC9E?=
 =?utf-8?B?Ukxzd01OamZPMGJZWkVCWktJUW5xb2RvdENwUlZLRVhrMjN0YTB1QjFFR3d4?=
 =?utf-8?B?UVRtck02RFk2ZnQ5TE1QU1dTeWxrU2ozM0N3ckdhZ3JVVERmcXhPUnJVR2VT?=
 =?utf-8?B?TUJiNGhLeXk4YmU0N1pqeUJqYjVvemlqS25xVDVmWGhhYndNVkdKTmpINzhJ?=
 =?utf-8?B?NEVsRy9jc3B4QnpGVUk1anF1aHNLNkppS0pwQXNSRlFLdGdTM1Nub1g0YlVw?=
 =?utf-8?B?cnZFNTNZdzNtLzBoN0xjeFpteVVTMW9yMVZtdW9HcjkreTZoY09RTVlZQ2xz?=
 =?utf-8?B?Ky8rUXlpTE95ck4vVkc4MjA2Y3ovVnpXM2ZvUm85L2pVVU9LSC93ODVpLyth?=
 =?utf-8?B?ZUdwQmdqZUptNjNYb3AxOE1WSHVISjRTTHcyUGkzbXhvZGpLQTdEVkZjdDk2?=
 =?utf-8?B?aUljZXZTM3NCNW5BcWNiZlN6YTEzeU10engydGRuSEk0aVBSRmlxQUtDZzh0?=
 =?utf-8?B?MTIvOXd2UDRGQ0luY3ROenVyV3R3NGM5SG05S0NqWWFoUGtCa29KL0VnYWp0?=
 =?utf-8?B?Qm5pK2JEUWkzSTFsNGFXcklhMU9UVHRVc1d5V3NvT29IMFRhRzJSWC9JOXFJ?=
 =?utf-8?B?d1dKUjY1SElkcmIxUFZtRlJxMy8zT1ZvT2s3cmFYaWp0QnJyNUdqcU9zNFZD?=
 =?utf-8?B?MUl1ZlJuTlJSSVNoeFJQb1MvQ3JMZ0hUemlnK1l3OFBldWVXVjc5UkVkekxP?=
 =?utf-8?B?c0pzNXFXWlRydTRYTm5KK2cxTEdCdGZrbEkzckxJeHNqd2xyTUluQ3d1OWZ3?=
 =?utf-8?Q?XWR/I1vPcNWxMnKPwXB0brj/W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10460e7a-a964-49dd-aa72-08da81f2f287
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 14:56:07.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ha1oNm4JZvp/ovoGRGKsrlpE87tCHOcfsChEp+XH7LMM7uPiC0/iEAH2bMJcwzGKJmbpXUEI2PPzevKcPvTZZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3683

On 11.08.2022 18:48, Anthony PERARD wrote:
> Patch "tools: Add -Werror by default to all tools/" have added
> "-Werror" to CFLAGS in tools/Rules.mk, remove it from every other
> makefiles as it is now duplicated.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
for the tiny parts where it's applicable.

I'm curious:

> ---
>  tools/console/client/Makefile   | 1 -
>  tools/console/daemon/Makefile   | 1 -
>  tools/debugger/kdd/Makefile     | 1 -
>  tools/flask/utils/Makefile      | 1 -
>  tools/fuzz/cpu-policy/Makefile  | 2 +-
>  tools/misc/Makefile             | 1 -
>  tools/tests/cpu-policy/Makefile | 2 +-
>  tools/tests/depriv/Makefile     | 2 +-
>  tools/tests/resource/Makefile   | 1 -
>  tools/tests/tsx/Makefile        | 1 -
>  tools/tests/xenstore/Makefile   | 1 -
>  tools/xcutils/Makefile          | 2 --
>  tools/xenmon/Makefile           | 1 -
>  tools/xenpaging/Makefile        | 1 -
>  tools/xenpmd/Makefile           | 1 -
>  tools/xentop/Makefile           | 2 +-
>  tools/xentrace/Makefile         | 2 --
>  tools/xl/Makefile               | 2 +-
>  tools/debugger/gdbsx/Rules.mk   | 2 +-
>  tools/firmware/Rules.mk         | 2 --
>  tools/libfsimage/common.mk      | 2 +-
>  tools/libs/libs.mk              | 2 +-
>  tools/ocaml/common.make         | 2 +-
>  tools/xenstore/Makefile.common  | 1 -
>  24 files changed, 9 insertions(+), 27 deletions(-)

Normally these are sorted (as are the actual patch hunks), helping
the quick spotting of individual files of interest. Was there
anything unusual you did to prevent the (full) sorting?

Jan

