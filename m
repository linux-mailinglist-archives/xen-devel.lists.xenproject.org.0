Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 582A0673A06
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481055.745743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUtZ-0002z1-W8; Thu, 19 Jan 2023 13:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481055.745743; Thu, 19 Jan 2023 13:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUtZ-0002x4-TK; Thu, 19 Jan 2023 13:23:57 +0000
Received: by outflank-mailman (input) for mailman id 481055;
 Thu, 19 Jan 2023 13:23:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DP+J=5Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIUtY-0002wy-77
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:23:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84f30e3e-97fc-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 14:23:54 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 13:23:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 13:23:52 +0000
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
X-Inumbo-ID: 84f30e3e-97fc-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htqmZVaDyToog7T8KvEoVUfW6zC8ChsIbnqunZ+f9DB6ZDrmD5FcFXOEiQGdral+2SRtlMl8qQlnm5qIxCOlYwqJbD9IhtWY/dWYBvFl/GfJF7fUHraHAEwzjBZY3iRm6TjlvRc54/Z8jAxev5zVrrnRaTC9Rs4yUeb2tkp9jm8wtWFTUEoBY2hQY+85zb+CI/9ey5iLZhzhXwg0VB89IgplXWIO2KoRVjWKB9PxUrbGbkR/0Y5WZn+DEDVF7zroXBQS7Bv3qSiMJU56Lbkf1GfD9EDbRs+nnSvdYJVgXfRJhEMztSC4cELhNehY/IACq9Snj6PHACdZ4mM4b4+NXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIikQV39SMjuhG6HnwSum4oSPVVScefkQ1pRnIx2Ogc=;
 b=CnLy8uzmKYL/RKUkKjs6ViocsJoHhhcVh9dEIKbUkpIzCoxspOXSsVSEEjcmGe2ZC6jmHK8hKsWS5NPRMftR/C2UZCHCDLqNrH7OA5AgSwMiFNSpgQ1MN7UteieIxp1g0aOCOyAB52SUS3QRMyimtpQBLJzqPo7Vv06t4oTgiZSoQWD2kG9XLwJ51u+hEOS75qu5DCI28HlsXrglFyO8G7YAYtGO9/Ns50Fyot2aMLt3hiRkmJNyW9/8u0yvlxcZ3WOvUVSSdyLEo8I5AMsg8cg39jwAEJbh5FXLJoMsNItqHMyx3KdQYLK+6kQqMnisHyWsC48zjhDu1w86z5/i0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIikQV39SMjuhG6HnwSum4oSPVVScefkQ1pRnIx2Ogc=;
 b=3eARjhY0R2iswlPqVVHXx/jOHkrx5/UjqRar721ZWQL516UapR5bzYyGGMAfR0WLuUJvjhKddNBzXUB7KW6QXFnE0sm/eYIoAgTx83WyXnCdfZ0DNP5OTJVblq8ZdZLtoJBfjtbQWjfO9kfcJvjbdrkQSngLYUbTUEXALbFc059uDcJ2Cpdo5xo3gsCruWjnGSquqlrI9p5mSgshC7NIv6o04BgUn726nMXodp9AZgvyQ1csL0z842oiWbrz5XJpkvysk969w2f1omL64J9e+Dc/5BpLf4BZhidh4QIqwIOjJE9T+8qlsC+ElK8gQIedOMue1TgqBBAL38ETFN3i6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8577d0f-b5d8-4e1b-8006-31fd91f83220@suse.com>
Date: Thu, 19 Jan 2023 14:23:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/4] Basic early_printk and smoke test implementation
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xenproject.org
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1673877778.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 198e93f4-0e19-4891-721e-08dafa206826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RKM60fef1GRIptbqRscwX+awLT9ASP+FOSq4PzOCg4gTI61FKpq9Upi7qzX51QQqHrDXDHYz9nlA/Wx+UB1DZphLjtwLHA73uGWDKndgHF8iILp/Qgj/do/MpAD3m+8I+JN08EAy8lY0eREAQpta604hmlguSM6Z8BN2IJfxKffxGE4s3x3TkzgCdgqhLyhG+ZA28zgcynYRCOslxqDNFKqDISRRm5xKSJFm/pFqh2jj8rrDfwJcnw++K75D5hNAawHBSM3qEllKlb6x5Vy2ggV1xYFTQRkbtw2lg8cKRk11+DkS4ihMkblh0Mn1dJA0gW/4GiL8Okfmn4bvYSTSmPYSHnUjvadxVSD6b+XU4FM5Mu5d4xcMIulDxI6hVfz1hWTDhFgkYq8m4SIViXnUHis+RVL4x+5iLORrrfnwgr1f5bHYLeWGLiLYjlmSKsQlk5QdvvIbAFwLYmkki3ZQC6sG/GV2WheWCdx6QGMJeL6UkdtB1eX+rclVfAk/FtFbQaRNZm3UDHaMsqqo/Ky7v4puBGqg7mPs4dZiRg9aJ/ddYegzZVYilYjW9UT9+BRVepD9mqrpHTjrqSBCe1sMnE9JwTshrT6Qr5U0q/EIPchJ9hRJnx4JziHsiVZLTP4Nps3g/gLxUSwnqVcAKnikn9YBAb1qKe8+WYyOOxOmG7bvmS/zYWP2DcM5EJXh772RarnOl1Cl3IUhzdBN07SHWWt4lYhr0nv0jQdFWgrDFFM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(36756003)(6506007)(26005)(53546011)(186003)(6512007)(38100700002)(86362001)(83380400001)(2616005)(31696002)(4744005)(478600001)(6486002)(66556008)(7416002)(8936002)(5660300002)(31686004)(2906002)(4326008)(8676002)(6916009)(66476007)(316002)(66946007)(54906003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3J4VDByeUVOaHgvUzRxcHlMYnU4M3NYWGxBSnptOGlsZUFLc2wvYnZsWkZ2?=
 =?utf-8?B?Wm9oUjIxNzk4aDZKRGtXZi9NU3N0bDdVQklJV0g1QnVpeVBOWkRZelYvM0Qz?=
 =?utf-8?B?Qk9lbXNnMWUzZWRaRUdZMTRLMWNzVkkwdDFuSHJ1M2pmalVpNHdtVlB5cXk3?=
 =?utf-8?B?UHpEdzZaOUlJbkw2OHZzbDJrMzAxcFhiUTFJcjZRVWhmUHBTVTF6YTc0UmdF?=
 =?utf-8?B?KzVlZkRRRzIrNE1IU21RSDJxWlhYR2tMSUZNZVF3UW1vL1pqOUtxLzRjZE8z?=
 =?utf-8?B?L1k3L2RaZzhIbVNrRnRWS3JJR0Nwc3Qwd3FMU2RnWG9mVk5mYk44K3FwZFc4?=
 =?utf-8?B?TnpnK0VqZ3ZMaDVwdEtnUnhRbFllL1dFOXF6aWRtWkdtelNxempZTUtmTmpX?=
 =?utf-8?B?NDczbHN1RzhBQWhKb0l5Z3ZKVGVyN2ZhRUhtRGc3RXlEY2llcVlkTDArVWZ4?=
 =?utf-8?B?RkVGRUJ6Z29HWStkTGg5UUp5R0ZpN3BtSmptc2JuMEFReFExcVBLKyt0NVhl?=
 =?utf-8?B?ejBzT2x6OFU2RXNWOUFlV0JsMGhQaXJBeTVCbExQZEs3cHduRHVmb1dYRG1r?=
 =?utf-8?B?WmRoSGZvT1VNWWgwbmVpYWV5SmxOQWVJeUxXNUdxTmZjWS9Sb3dManN4aEV1?=
 =?utf-8?B?eExuSm41M0RSL1NBZjl0U3A1TTYwYzJFTjNEQVNuMHlDUytsM0Evc0hIS2Fw?=
 =?utf-8?B?eUhIZnY5UkVXMmwyYkgxQUU0YVo4Q3M4NmxzSWpvV2tEQnBSRUsweHBxUTJy?=
 =?utf-8?B?OGJmUFhWNmVLWlYyMithVnNUZm1WODVyeTgvdGxGaEoyY3MvWVJWUXJGZ1o5?=
 =?utf-8?B?d1Z5Z0ZnMkFhM0Mrb1A0UzFmOTdicDlDTFZ1TUhnNXpLYnYwY2ZaRTcwMFJw?=
 =?utf-8?B?NkorVG1oYnh0dGhnWUpLaDcvN1B5dWdTM0d0YzJNOWc4b0kwZXE0MVhHL0FN?=
 =?utf-8?B?L0Q4elBBQUMxZGptdG5rUW1MT3Y3eW95bVFibjFnVjI1cG1Obmc1Q1cxOGtr?=
 =?utf-8?B?MG9rVGc0aUJ0a1JuN2VPenc3VVhtUUtLMmhiSU1LckYvdTFlNHVZc0pHZ014?=
 =?utf-8?B?ZFppYzFqY1RZS1RoYllMd2tQejBkd1A0RGgvRWFndGd1Qm1vd3V1dEkwUlZx?=
 =?utf-8?B?S3FzL21mbThRSUtXNGl4UDFHL2lmU0hxZ2IzMWpjZmJHZFM1bnJ0dGZSMlZ6?=
 =?utf-8?B?NEF4bE5vK3V4NytBb0J2THBtTlFadXZkcmRqQ3E2cjZkM2VOanJWOHduTjRL?=
 =?utf-8?B?N253Mi9YUUlpVDFMWXUvOThNdjlTWEFtNXRmajYvQzdLRlhUZURsL0xSSEpF?=
 =?utf-8?B?T1hHamFONEhUOCtxMDNRUlJnekNiWXhzd1lNRng2OTNIUjZ1Q1JlSE9YUndx?=
 =?utf-8?B?MGRYc2FVWkpveXBOdjlmTTFVUXpDN08yYUdyVWZ3Y3hrc09BWG5PMXlNT3Vw?=
 =?utf-8?B?cFU4a05RNExFZ1l2U2NwWnFIc1VyNHRTQmNTR0g3ZWhZVk5nMmt6OGw3ZTl3?=
 =?utf-8?B?eGZpakNwQW5mS3EzVDdwU0NWNlpLL1FJaGtuWkN4VmVhSjVGSmZoSTV1blV1?=
 =?utf-8?B?ZXBvaWZYR01LS0N2Nkxrd3llLzJBNU5OQXhtOVZGclcyOTFYajBLaU5KUFdU?=
 =?utf-8?B?VW1sTXpXamRObVFkUzA5M3NybU00alo5NG00bW4yWjRCWENyak0yY1hTcVVM?=
 =?utf-8?B?ODBWREEybENBd1B1OXFzK1g3UERpcHNKU0JLL0RndkJEMG5uWE9vcGFyS3Y4?=
 =?utf-8?B?eGFEeXFlWHBReDcyYTFUUERpamFNWlhhSmJiUHZFQ1YrT2RIV0xjeHRFeHFh?=
 =?utf-8?B?M21QREE2L1haMWRhN21Wc3VaYU1KZGV5OWhJSTRHWThyV00wR1U1WEdsSEhv?=
 =?utf-8?B?c2ZiVXA1cEs1cmNqZjF2Y3Bxc1kyczlKNzNLNVN5eUJBeVBYRHZldUx1S29s?=
 =?utf-8?B?Z0dRdGdUUklMN01IdW1sUytIajZIMmJBYy82WE5hby9Vb1hOYTc1RHFaK1cv?=
 =?utf-8?B?a0dwWjdBQzB5N21QSE5aSFByZS9HTG9TUTQ3V2VaSVNRS0Q3ZEliQ0NBUXFB?=
 =?utf-8?B?cm8vakdDZTI4bXdJRGo3V1JZMTUzWFhSeGxYQTA1V29JcFBhNGo3RjZMTFF3?=
 =?utf-8?Q?rgrj3egRy1yQRAOAE9bzGbRRr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198e93f4-0e19-4891-721e-08dafa206826
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 13:23:52.1781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SH4LyEihRro0JZCAeKY9ujbk/xfGIfdGPOCK0PxaKwIMEQPLIma56G9vs50ZTZyg9Qi8XLsifSg9500rles6bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545

On 19.01.2023 13:45, Oleksii Kurochko wrote:
> The patch series introduces the following:
> - the minimal set of headers and changes inside them.
> - SBI (RISC-V Supervisor Binary Interface) things necessary for basic
>   early_printk implementation.
> - things needed to set up the stack.
> - early_printk() function to print only strings.
> - RISC-V smoke test which checks if  "Hello from C env" message is
>   present in serial.tmp
> 
> ---
> Changes in V4:
>     - Patches "xen/riscv: introduce dummy asm/init.h" and "xen/riscv: introduce
>       stack stuff" were removed from the patch series as they were merged separately
>       into staging.
>     - Remove "depends on RISCV*" from Kconfig.debug as Kconfig.debug is located
>       in arch specific folder.
>     - fix code style.
>     - Add "ifdef __riscv_cmodel_medany" to early_printk.c.  

Did you really mean to send v4 another time?

Jan

