Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E230B797320
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 16:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597452.931687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGDK-0003Mb-Gm; Thu, 07 Sep 2023 14:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597452.931687; Thu, 07 Sep 2023 14:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGDK-0003KY-Dm; Thu, 07 Sep 2023 14:42:34 +0000
Received: by outflank-mailman (input) for mailman id 597452;
 Thu, 07 Sep 2023 14:42:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeGDJ-0003J9-5T
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 14:42:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2070.outbound.protection.outlook.com [40.107.13.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6adad36-4d8c-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 16:42:32 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8209.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 14:42:02 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 14:42:02 +0000
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
X-Inumbo-ID: c6adad36-4d8c-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZrJS4J97EsvkkAQhE6+FKxMYS+7Z0+8IWto9wsir3aPNrDsg2SCJj8xCaaOLypo91MQmjaDIvOWWH2ziPvXx09f36eh4ypw7+6J5LUj9MAhFG+P8SHDXKTUmbeBRjzd8bhrMh+o9LQMHOaycxMa5uogvpthFgzYVCb44KRXNmI9ol4ZSV9AFiX3o0wBRlLJzB/bKO861ic9ecoKHKyOCov7j12bWrEEk6r2JPRnzJ6AqlVZBKqor7B7q43Iyi5rrZpGLfayHPLlbx8E4u9nD6t0cOHpfm4mBRA2if/YUGqA+3W7Hd0zo92aOmR0F2dO/WMzrjXGs/lPJ6HCw0lS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8MqWQShLtJZF65BGOTIhLMTvQRDxJAdNyLYZVK8wYM=;
 b=U10HBwkkxKKzM1it4BR931RLXKOaaImxpZICcI3l7lh3D5ptQQmqefQD7ma/PL5LURWyyC6FjxdTIHk4VDgqCzy8Hfof6uCFD5fqh9pWmt3CsU4AG+9hQbxKEFpUh20JJaukC04blJe4ZocFCqY4kFl8ibaO6yOpp06Ob36OEk8TGRZwbncS3EFSUAAtkSLQnk4eiPlhRNXZxuA85Akb1/wisVVoWMOn5yxVAcxlloYsw2ZilBSf5++0KXFK+9mTB6UxH2rH75jcTCS3NsdU+Jd0Tmb/qjp28pJzDclf9O9JLKfJEtc2PjzpWgp6hDqFPsvcmPazkt85zci+n3WHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8MqWQShLtJZF65BGOTIhLMTvQRDxJAdNyLYZVK8wYM=;
 b=pkSTp8Qys1y6hDRbc7qt9WuYDexJnEkUDQsqnbUXRzD3w6G6z4BkM2xuU40Pb4/oSG5mX8FvA9wIFWYdZxleaT+PYd58hF01fS4JF56mh8U64OHVvNmS8JBub1VUBDWUMmIH7smtOdcZShDIESufT4qey994M5JrYFf8HK8tOh9FqeKXPTk1rmQkoa06w2smEThu9sdWCt7tnUggI9FSnhKcdjgaeS6zkV1CwUcB7ehDrobKDYYdBQVaFUWaxZZ6gB0BIjJ7sBvoDrmg9X+VT1bNtHdR4+lvOcT61odxQM3wdWkKqPMnh97B2TflKFvgROrJVZXO3sou2ESOGMASmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce6e7abd-40ee-dd9e-b17c-10c39ca0e422@suse.com>
Date: Thu, 7 Sep 2023 16:41:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] coverage: update gcov info for newer versions of gcc
Content-Language: en-US
To: Javi Merino <javi.merino@cloud.com>, Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230902151351.10325-1-javi.merino@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230902151351.10325-1-javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c96f934-4535-4dc1-e719-08dbafb0990c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YJ7BFMqjRz/jV4H656C4Js1adKzcpdrFC0DB+HOMN5O7S7E6l0oYxblF/63d8hgbNK2FiEeIdv4G2FDY/vq0ABC4WMjY2NaG2BJrBNO34k9VIK78y074aMOKVPrvYiSR8KHuzO43AZZWUSu50w19te/bgWoFGZqwn/sTBL+JauIVZrhmjyWrNzg0/aitw2yrE+M5EWW7T2h6zf5elC43iqUvCcB/VuGsbAvQeTcT+VGCn/d4jyuYQGfdGsH3B5Me8GjiFXTBdgP8Sc/M1hUOqs+fsipFCZjeLt3ArjjaLYcCoT57NrBH/AEtuDTzRt7sqpqJc9uVN8guUkI26ZFH/8hHNBIZ4/+1Zfd90UKx56CFGWKN3hhX8FVHPm5BD+Bpuo+a2irSIBSmMZUj+SsTIA7G08zi301Ov/DUg8c7AX+byoRIasJio08gvLQDkbw1l+X2OkFLQOjm00MtzpEs3/4byKrx05cEgKTtCSt2VBkjdhd25/X/aLYy1V3KGK0o//LR8hSbXru3wJtSg+MXb1+sKlwCpB0j3gDm64hvoxccdAdyOTnL4TZ6WhlDlqqvggnNPvOI7QxW+wT6J2tzO2hsrLbs8yq5qB+KwNU1jN+4vc23kEbctbEEaZ3mOhDhG2b+Xz7M7d7nSRyEmOVSwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199024)(186009)(1800799009)(5660300002)(6486002)(4326008)(8676002)(8936002)(6506007)(66946007)(316002)(66556008)(54906003)(31686004)(66476007)(41300700001)(478600001)(110136005)(2906002)(6666004)(53546011)(6512007)(26005)(2616005)(83380400001)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVd1akhBMDZsZlVCOE9OUG5GcXJUbjJvdlNIdzU2U0RXK0pON0Q5ZkFVSlRS?=
 =?utf-8?B?WklJY2R5NUJ2ckNKK2Fqekp5RHJuY1QzS2ZEK1JDWUZYaW8rS1JvUk1STi9M?=
 =?utf-8?B?ZkIyaVVtZTMraFJkOVZJOFNEQ2Urc0IwdmJJMGM2cDVWOExxc1RPQ2ZCWVIx?=
 =?utf-8?B?cjY0RHE1eXhRNnZ4emNhZDY5SnRBUVJobHpiQ3luRUtFQW83WlJaazBkTkkx?=
 =?utf-8?B?R0xxUnVIaWdLOFZSNE9abEczMWQrOFhCWE1ydmZVRWtKWnhlL1cxcFpMUldi?=
 =?utf-8?B?UDdnR3NiMEVPMjVLV05rL0RKMkZMMzdiRm11K3VkQXNrNU81c0w4MlBaZEMv?=
 =?utf-8?B?NVRqMmIvL3dTZG9DblEzQXpYcUx2N2d0ZFVCSXpXeG04ZnRrTEN1VzFCa096?=
 =?utf-8?B?Y1dDZEdqWWpBR1RQL0RBOEhSN1REbGdjOU9mUVZ2QzNXdkFoRFI1SlBMSHAy?=
 =?utf-8?B?TkZNZUNiaWUwcXQ1bC9tV3RWQzV0YVdIUGFTbWJnaGFHMXkzbklwb0ZyY2l0?=
 =?utf-8?B?eEhxVktGcnRmelhONmVUNWpEN2QyZVZwUVBvbGYwQU5OcExJWEh0UXkydm1P?=
 =?utf-8?B?dXhNNG5WWjZXU3pqSDU1VGlSN0tscStVanZJNzJnQXFJY2Z3YzNpd0JqUnFa?=
 =?utf-8?B?Lzg5NHRNb1pUY2xTd0U4R2hnZm5SdVEvL1N2cFRRd3gvbnJpNjJCOGl3eG5u?=
 =?utf-8?B?NmtCSWhheTFVVEo4RmFhMnJ6ZWNkZEdSQjdDWmlpdkh0MG12Zmc2Q0hlQ043?=
 =?utf-8?B?a1hDM21EaitjbGFldW1SUWMzWUdaVHh3dlZ5ajRjWnBmMUo1Tmp2eGxZclV1?=
 =?utf-8?B?cENWU1pKcU8wOVhva0F2aU9yMWRnQ2V0WTZ5YVhZZEM2QTZnV3gyY1k4eHRJ?=
 =?utf-8?B?cXVuZXNyd1JPb1lQb2t0YkFuK1VMQ3dzMHQ4MFI3c3NpdkJoZndvT2dEUlBw?=
 =?utf-8?B?b0o2Q1hadFUrZFBnMTlKZXFQR2Z2eWpOT2FVQ1laeGdxbmRZUTUvdkQ3c0J1?=
 =?utf-8?B?OExnZGtIQUhCQkpXWklyOXE3R1V5VWpra0x1UC9NQm1QczFpMUNJMVFzQlFU?=
 =?utf-8?B?TjJ1Q0NsQy9BNjFUcnMyUFgzT3RndDRJM2ZURWRIOWJvRDQ0VTJ5a3hRV05q?=
 =?utf-8?B?ZXMvSkNGMkRkcGdMTmh3azFkdFdmTU9hL2p5OG5KRnZZQVh1eFZEc3pJVzNl?=
 =?utf-8?B?K1dXa3JNc1ZBL1YyblNkVXlldjNtbUFTYW0yQ3hxQ05KS0NEbDhTUVc3UHMr?=
 =?utf-8?B?amN0SFRmRnBNNjR3S3E3cklPYnA5Wk1tZ1NjcW5xQWp0ZHVNc0sycGdGd2dF?=
 =?utf-8?B?Mmk0T3V1RU42RlNyenNUaE03T3JjRkVyeFA0OGZuNm1DT2tpSUZOUnI5Tmt3?=
 =?utf-8?B?bDZvUXpXY1FmMklBOS9LejBHNjJKNXcyYk9GcFZPenowYWtyWk1WbDlFY3BN?=
 =?utf-8?B?QStTN2Vaa25ZcndBZmdEa2M1OGFhdlo5YmZldGwzMFZuMUU2ZXpLL3JyTUlF?=
 =?utf-8?B?a0xRNVhkRURIMk9FV0pzZFBEODBNNDRmK2NqbU96TzAwS0xKcnVFOWxwcjVk?=
 =?utf-8?B?OXdwZjI0Yno2TXk5NWEwU21zdkFyZjlxRmJ6aXNhd3YxbG1CejZsV1FJa2d1?=
 =?utf-8?B?bzNPejBkcVJEa2dySHpYQ0VHajdEUm4yK2U2VXNKQWhhVUxqQWpuN1pUYTFy?=
 =?utf-8?B?d0pmeE14OS9vTWZEUnVtVnE2aHlCekJIWGpWc1YwK0s3dGMxeFFhZ3NacHZy?=
 =?utf-8?B?QzUra0NvRk13clhkZFJtdis3ZUljT1ZEUTljc0ovVml2SUhqMEo4bUc4aTds?=
 =?utf-8?B?bm1rTTg2dnE2U25ERlVYQmxNY0RvS29CMGQvZ2dvZmtpditQK0o4WEpzN3ND?=
 =?utf-8?B?Wmh6OTBtZWlnYlptbFJhdWNHRVpVZS93Z0RackRVb1dXN1NBVjQxVWFWQ0t0?=
 =?utf-8?B?VWI2c0ZHV0RsWGNIa1FpK21XUWxQSUZqU1UxYVZTTFRQMCtkTDZPNjg3VndL?=
 =?utf-8?B?dXRXSzhuSFAzdnE0c1A2Rlp5V1A1bXNUV0NjdEV1dzRGdkVXZ29qeDR4bk1o?=
 =?utf-8?B?MXBXUWZuSGVJVFE2bXBLY1V1SFNnNW5qbHlJY1ArMmp5U0FnYzVERVJMTFhV?=
 =?utf-8?Q?jkNfsIwPUPO6AtZAnK+Piqp+w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c96f934-4535-4dc1-e719-08dbafb0990c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 14:42:02.0894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsB2IMf18pa7LdHvbI+nGgijddq9CUFRJJpTbgJ2TZFCjPmkMkp6f5zlE1nm56NmXy68Cfn/pSMO/AZsBNpMuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8209

On 02.09.2023 17:11, Javi Merino wrote:
> --- a/xen/common/coverage/Makefile
> +++ b/xen/common/coverage/Makefile
> @@ -5,7 +5,9 @@ obj-y += $(call cc-ifversion,-lt,0407, \
>  		gcc_3_4.o, $(call cc-ifversion,-lt,0409, \
>  		gcc_4_7.o, $(call cc-ifversion,-lt,0500, \
>  		gcc_4_9.o, $(call cc-ifversion,-lt,0700, \
> -		gcc_5.o, gcc_7.o))))
> +		gcc_5.o, $(call cc-ifversion,-lt,1000, \
> +		gcc_7.o,  $(call cc-ifversion,-lt,1200, \
> +		gcc_10.o, gcc_12.o))))))

This is getting unwieldy, so I think we ought to try to limit the number
of different files we have. Already gcc_4_9.c and gcc_7.c specify the
same GCOV_COUNTERS and differ only in the version checks (which could be
combined). Therefore ...

> --- /dev/null
> +++ b/xen/common/coverage/gcc_10.c
> @@ -0,0 +1,31 @@
> +/*
> + *  This code provides functions to handle gcc's profiling data format
> + *  introduced with gcc 10.
> + *
> + *  For a better understanding, refer to gcc source:
> + *  gcc/gcov-io.h
> + *  libgcc/libgcov.c
> + *
> + *  Uses gcc-internal data definitions.
> + */
> +
> +#include "gcov.h"
> +
> +#if GCC_VERSION < 100000 || GCC_VERSION > 120000
> +#error "Wrong version of GCC used to compile gcov"
> +#endif
> +
> +#define GCOV_COUNTERS 8
> +#define GCOV_UNIT_SIZE 1
> +
> +#include "gcc_4_7.c"

... this could simply re-use gcc_4_7.c directly, with just the version
check there suitably tweaked.

> --- a/xen/common/coverage/gcc_4_7.c
> +++ b/xen/common/coverage/gcc_4_7.c
> @@ -27,6 +27,7 @@
>  #  error "Wrong version of GCC used to compile gcov"
>  # endif
>  #define GCOV_COUNTERS 8
> +#define GCOV_UNIT_SIZE 1
>  #endif

If further this became a separate #ifdef, ...

> --- a/xen/common/coverage/gcc_4_9.c
> +++ b/xen/common/coverage/gcc_4_9.c
> @@ -19,6 +19,7 @@
>  #endif
>  
>  #define GCOV_COUNTERS 9
> +#define GCOV_UNIT_SIZE 1
>  
>  #include "gcc_4_7.c"
>  
> --- a/xen/common/coverage/gcc_5.c
> +++ b/xen/common/coverage/gcc_5.c
> @@ -19,6 +19,7 @@
>  #endif
>  
>  #define GCOV_COUNTERS 10
> +#define GCOV_UNIT_SIZE 1
>  
>  #include "gcc_4_7.c"
>  

... touching these two files could be avoided altogether.

Henry - afaict this was submitted after the feature submission deadline,
so you may want to consider giving it an exception.

Jan

