Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621B0765361
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 14:15:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571072.894031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOztp-0004GZ-AE; Thu, 27 Jul 2023 12:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571072.894031; Thu, 27 Jul 2023 12:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOztp-0004E1-7Y; Thu, 27 Jul 2023 12:15:21 +0000
Received: by outflank-mailman (input) for mailman id 571072;
 Thu, 27 Jul 2023 12:15:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOztn-0004Dv-TK
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 12:15:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 401f5007-2c77-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 14:15:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7575.eurprd04.prod.outlook.com (2603:10a6:20b:29c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 12:15:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 12:15:15 +0000
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
X-Inumbo-ID: 401f5007-2c77-11ee-b247-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PR5t8iZQ9AshKDtFG0b7NPqE170QRgpI9UQ8pz/A1+Y5Cbi9n65h/uzW3Oz/eGBP9R6nL2eaQpNfNL95EIZ4rZunR/0vVAs/TMY6GeS9voUQPaYiwuisgdd/OXLX2xg72+wCTSVl+WUcX6Z+IhcZEF4HWHr9Ql412VtY7zT1YzobpHMEdaA/sGwT9lZp9nnNZvSGS3/c0J4APaC3o1saA9/0kUbTH0YpXL4mY/Of7mk8t5h7n2HUpJxw6VtFk4W2KPaEaHWGNdj3b/+AeNmF5v9hoMWPGL3l4BVTvG4ETUyKZDWTk16BU9EJ3imfJkdQRtJOuAg2PU4cKBqQfE6/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rFGLkvY8Qw30FFpaVhWJtSW9PoM0yeIUsss/wKQnpQ=;
 b=RAgZ0HymH9ZG7upDb0KrEMz2qHOlhKQprrbGPzD7GnsX/r6g1pjaY6XoVdwA9X1hJig1vVnzEh+1Cav5Y9uU7hyXRJYMHimaHtFq0+bYKE/81JbYjyPXuViK0J1HOgeowglFS28abB3jbmNJVc1A+y7RM+eK7SBfToHzcoJE12HTRnN+OHqZRKdcnTH1CF6aDY8e+fyHNyGedvvYHmxepC+MnYhkuOD2z4/b+BrsC8k+zjzs9YhpIOZThObEnGjdw9i5h74OIilTPaVyzzjku85UN2aY4hgvvpd6e84A5OwWUvI5tuJfCrz6Bqz1hbYXW5ldQoTbL+2Zl4l173jtGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rFGLkvY8Qw30FFpaVhWJtSW9PoM0yeIUsss/wKQnpQ=;
 b=4CfVfMKhW2xqJpGk4IyEhpukwAi8Del1p7lBJbxXqOxlXduHjawYpXZkj/pcuGH/Exk+PdGX6PCDSvHw7Z8n6EL8X6YNkbhbxX5+Eofawxhnpt2EG3RL51z5H/34TLNSxubffw5PVhv1c1l9Ss+jh36ECiW3NOe+YISAVl/ILJLOw/1Q2t2vFtaLaOlpZRp1s2KJ3f/zgx8Q+mnb3+q2J9XB7VDlQionNk6OpDcHR93o5lDqSFi8C7twSsFwI42hWp9AWc0pLYWpbdP3hmPsYCfsEeAWXQMyQZafDaFIEwHM/CewM+o38OZdPUtm6U4fYKWKNelPNijNtqrEwzztTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5ee3c63e-27ab-406a-7307-16061b65f42c@suse.com>
Date: Thu, 27 Jul 2023 14:15:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v4 4/4] xen/x86: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1690368810.git.simone.ballarin@bugseng.com>
 <3790011b9d9235fd0c3fd2016ee25feb37e925f5.1690368810.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3790011b9d9235fd0c3fd2016ee25feb37e925f5.1690368810.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd91c9e-249a-4a3f-9a82-08db8e9b226d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2sn95Vh114BvEjmDf5SaBbbX0pKWZKWvtFrh/jMqU/GVfBBhZy5wkk8N1ToDb8Twpq2wyrVSROvfSlnRbS4VCIB5YB0bFlIp8Nr/5B5WZJ00PLSFMBBADlY6clhlQ1iG9T0uGAOdxxOeY4Jf50GZdt2ZUIWDo41gCw3eFw22jaCroZrUFZH/cOsG0G21ebGuuHC7ARUgA8L2lkremC6IkNvljavwP7ba4S80+2y+L2q59zodtK68boKZOe/wtxxQaFhPgphkIUAC13lg9i8Pqy3Wco+BnIzaZKPjevtcK1kesc87z1yZNszGTZMMD/L1AreEscNjFipWiT6ixCmmDtMYS3C7zEsx53gy6zwqZ21MVJKwolgGH2iYr7CswN8yynewcGMlp8McwgVeUKkJt9FDM+aU1AS3G+EY9pKAcvsTNQuZjvw9T0f3Xj9t1+zz97zcQB2nNhowH87qTuQcxQbJRJEmb4SboNfnWieH0RCkp+p0MsO1qERry+mcOFwOurYTQxuXNXmpETWeEm6EQOgHletUxkIsHeaegjWv3MXC8W7WhI2OruKQdrI3rHn2bL1V/Ud2CsoZdIVEvzw02Mx0qaeYbKAiqr1R6sq7an17/2kwVrUUyTkiqvHwEMxahwiTOxzf3gYa1EvnFXuYew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(53546011)(31696002)(6506007)(2616005)(66476007)(6916009)(4326008)(66946007)(86362001)(26005)(66556008)(6512007)(186003)(31686004)(36756003)(2906002)(6486002)(478600001)(54906003)(41300700001)(38100700002)(316002)(8676002)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0RzNS9aS2ptaDNNSTNLUGFGNllqTXZpb0gyTDl3L3Jkeld1WGR2NWllSVJ0?=
 =?utf-8?B?dC9sR3M5a1p5YVcxZkoxcjlmT3Uwc05PZzc3SDBGc24zbTlsbUVoYWN2bk0w?=
 =?utf-8?B?Uy9HVnFwZWo3dmZqUElMR3loMTNaT3pNditad09LaEF5bWhaVmYyakgzNFBT?=
 =?utf-8?B?U2hpKzJQLzRRUkVqYnc0Uk9DRC9oV0I1ZFpDWExWUmxpTjZ1Y3hqdTk4Wmhy?=
 =?utf-8?B?TWdqdTBTNmJOZFg5b3RmeTVPY011L3k3OXJNUTVic1JOZHNEWXBaT2JYaE1G?=
 =?utf-8?B?MWJ5OXdDbWxibklRd0N2a3pZMktTZVl0VUp0RGF2eXgveW1FMXZWOWJ1RjZD?=
 =?utf-8?B?eVdKZkM1ZldCNEk0cnVJNVZYN2NKSGd3VGc5TUdNc0FJYUJLNnpTZHNGQjNv?=
 =?utf-8?B?eER6WmZjWElOU0FQSzFVblp5Y010ZGpVdnVRTzNkNDZScC9qb05tTzZZRWtZ?=
 =?utf-8?B?aEIrMFVIZkJIejhFMzFNZ1VUU3I2NXV4WGlMRDd3MThnQ0p3dVNtWSttUmFF?=
 =?utf-8?B?d2ZUVGZRSitndW1zeGxoNzZvZlpxd3ZnNUsrcnllK3pOdThtNm9PQkYrT2hv?=
 =?utf-8?B?T3hnamVBNWwxVUZEbisrQm1wc1k5NUhFUFF4dkRoOUVOS3VKbWtvbWk1cUt4?=
 =?utf-8?B?Y0U4NHRRcFp1bWVQaVYzZm1nbm96djNkcXl3M3hRRktUd0Q1NzljQ3kwajlv?=
 =?utf-8?B?VEpZdStBUlJVMjVreGQ1YjlHN0F4Y2pKN0dHYzB1NENSUGRHNGl4NHpHeTd2?=
 =?utf-8?B?NmNpblZnb0Zkc29OMlUrRytOMm1MQml0MHhXdEVscG9UdFMxaytCYWV4REYr?=
 =?utf-8?B?NmhLZDU2Ym9UL3lXdlFneWJReGZ6YURJTzYreTJTZ1drYWU3M1A5azAvaG13?=
 =?utf-8?B?RnlJT2lZSEpTaDhOdXFLOFJGem5DK2ZWV0czN0pQcEIvUjUvRXJWR28rTFdw?=
 =?utf-8?B?dm1FVG9za2VIOE05cm1DMTFrSkxBYnlFSUp2MGZ4L3I4VGkzMFVZNnpFcHY5?=
 =?utf-8?B?VUJBVXgwRHhBbjNUbnhjU2NiNjJ4Yk5vQ1YzTktSb1BuRncxWVQ3VGpIN3RS?=
 =?utf-8?B?dXA4NmdwR1grSyt5bEpuanJhZlBnaFhCYldpQS83TGFvVDBGaXE5alphMFNR?=
 =?utf-8?B?ZlF1RjFja1dVMVZEc052SklWQjVDQis5MHBLWVdwcm0xeGl6R0VYSHNXZSt0?=
 =?utf-8?B?R25rVjA4OWE1N1hLWTk1Mk5LNEpXRG0zckVQS1FUVHBwcVlzY2tVb0tLVkRD?=
 =?utf-8?B?K2dickU5QVJ1dkJHV1Nja0ZVV1hRcmNvUWZEbEZ3WTFnUkw4ellpV0ZQWDMw?=
 =?utf-8?B?Zm5KTHVXczd3akhKMGtMK0d0ajdJeTFHYW0vZEpoaEt3V1pMQUlLSjVrSkpT?=
 =?utf-8?B?RWlsenlrKy91eXZHK1V2Z0QvckhWYkJCcFM3b1JtcjRhc2I0WHNwcmVSTWNq?=
 =?utf-8?B?blB6SWQvajBsR1U2QjdST1cyRW1wMURCSG1qUjFFMnJMSjJHT1Bya2RBRlBa?=
 =?utf-8?B?Nksvb1dhczJUSFlGTkt2dHBiYjVhMjgwS0hBVlFFOEltaDlVWUlDeVVvQXJi?=
 =?utf-8?B?TWtLVGtwQm9WdWVFaGhyT3NDTUZqdlBDejdWSTU3dm41Q3NhVUlFMW5hOXZZ?=
 =?utf-8?B?WWpIYWlwczRHU3BocjI5cGo4TUtpb21YU011cnBMaDg0WTVGZndPVDJjaWVm?=
 =?utf-8?B?YmNML2tkNUJkZVhqR3hjMmRYMGoyYVVLNm1abzRYRlJvYjFrMlpheG82OXpK?=
 =?utf-8?B?a0hXOGlWUnphdnVWZUxTWEZjK0FIRk5OWCtvV0lDSDQ2blNvSVAzLzhjYmt4?=
 =?utf-8?B?Y0NmQnk2aTJJeFdQVkVQVCs2RWs4dXA3ZzN5SUhNSzNNbFNZZ2dOaWpMUURD?=
 =?utf-8?B?MXVzd2pZVnJXeGpVUWVSNTVrRDNkb0tVWm9YbnFPaUw0SThIZjZTbmhXaE9x?=
 =?utf-8?B?WndrVWx4eWRxVVgxVEhyR0wwdEdzWkdmdkNoNk8yemtyaWJHdm1wUENSdEd6?=
 =?utf-8?B?amZacnp4eC9qcktTSDlDaSt3TVcwQzJkQWV3N3c1WWVmdERUMWhvNnlsd1FB?=
 =?utf-8?B?MXoyRDJBUTJ6NzErOXJML0tvNFVKTWdjS1JFLzFuTzdiSG9LQi9RRUVtOEdh?=
 =?utf-8?Q?pl9AZsVFtexgkl/mROhodC5Ni?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd91c9e-249a-4a3f-9a82-08db8e9b226d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 12:15:15.2934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: id1+A2UHT4Ip8jGucD2/qds5XBfRQkdG0NgkOxMpVAlHh8pwGdxMqs+HwTLNMxmxcb0/xZCggQFq9TrZnMdcoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7575

On 26.07.2023 13:03, Simone Ballarin wrote:
> @@ -70,15 +70,15 @@ static const uint8_t sr_mask[8] = {
>  };
>  
>  static const uint8_t gr_mask[9] = {
> -    (uint8_t)~0xf0, /* 0x00 */
> -    (uint8_t)~0xf0, /* 0x01 */
> -    (uint8_t)~0xf0, /* 0x02 */
> -    (uint8_t)~0xe0, /* 0x03 */
> -    (uint8_t)~0xfc, /* 0x04 */
> -    (uint8_t)~0x84, /* 0x05 */
> -    (uint8_t)~0xf0, /* 0x06 */
> -    (uint8_t)~0xf0, /* 0x07 */
> -    (uint8_t)~0x00, /* 0x08 */
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0xe0,
> +    (uint8_t)~0xfc,
> +    (uint8_t)~0x84,
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0xf0,
> +    (uint8_t)~0x00,
>  };

Hmm, this stray change is _still_ there.

> --- a/xen/arch/x86/include/asm/hvm/trace.h
> +++ b/xen/arch/x86/include/asm/hvm/trace.h
> @@ -58,7 +58,7 @@
>  #define DO_TRC_HVM_VLAPIC           DEFAULT_HVM_MISC
>  
>  
> -#define TRC_PAR_LONG(par) ((par)&0xFFFFFFFF),((par)>>32)
> +#define TRC_PAR_LONG(par) ((uint32_t)par), ((par) >> 32)

You've lost parentheses around "par".

> @@ -93,7 +93,7 @@
>      HVMTRACE_ND(evt, 0, 0)
>  
>  #define HVMTRACE_LONG_1D(evt, d1)                  \
> -                   HVMTRACE_2D(evt ## 64, (d1) & 0xFFFFFFFF, (d1) >> 32)
> +                   HVMTRACE_2D(evt ## 64, (uint32_t)d1, (d1) >> 32)

Same for "d1" here.

Both of these are, btw., indications that you should have dropped Stefano's
R-b.

> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -30,7 +30,7 @@
>  
>  #define MSR_INTEL_CORE_THREAD_COUNT         0x00000035
>  #define  MSR_CTC_THREAD_MASK                0x0000ffff
> -#define  MSR_CTC_CORE_MASK                  0xffff0000
> +#define  MSR_CTC_CORE_MASK                  0xffff0000U
>  
>  #define MSR_SPEC_CTRL                       0x00000048
>  #define  SPEC_CTRL_IBRS                     (_AC(1, ULL) <<  0)
> @@ -168,7 +168,7 @@
>  #define MSR_UARCH_MISC_CTRL                 0x00001b01
>  #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
>  
> -#define MSR_EFER                            0xc0000080 /* Extended Feature Enable Register */
> +#define MSR_EFER                            _AC(0xc0000080, U)  /* Extended Feature Enable Register */

I understand you use _AC() here because the constant is used in assembly
code. But I don't understand why you use it only here, and not throughout
at least the "modern" portion of the file. I wonder what other x86
maintainers think about this.

As a minor aspect, I also don't really see why you insert a 2nd blank
ahead of the comment.

>  #define  EFER_SCE                           (_AC(1, ULL) <<  0) /* SYSCALL Enable */
>  #define  EFER_LME                           (_AC(1, ULL) <<  8) /* Long Mode Enable */
>  #define  EFER_LMA                           (_AC(1, ULL) << 10) /* Long Mode Active */
> @@ -181,35 +181,35 @@
>      (EFER_SCE | EFER_LME | EFER_LMA | EFER_NXE | EFER_SVME | EFER_FFXSE | \
>       EFER_AIBRSE)
>  
> -#define MSR_STAR                            0xc0000081 /* legacy mode SYSCALL target */
> -#define MSR_LSTAR                           0xc0000082 /* long mode SYSCALL target */
> -#define MSR_CSTAR                           0xc0000083 /* compat mode SYSCALL target */
> -#define MSR_SYSCALL_MASK                    0xc0000084 /* EFLAGS mask for syscall */
> -#define MSR_FS_BASE                         0xc0000100 /* 64bit FS base */
> -#define MSR_GS_BASE                         0xc0000101 /* 64bit GS base */
> -#define MSR_SHADOW_GS_BASE                  0xc0000102 /* SwapGS GS shadow */
> -#define MSR_TSC_AUX                         0xc0000103 /* Auxiliary TSC */
> +#define MSR_STAR                            0xc0000081U /* legacy mode SYSCALL target */
> +#define MSR_LSTAR                           0xc0000082U /* long mode SYSCALL target */
> +#define MSR_CSTAR                           0xc0000083U /* compat mode SYSCALL target */
> +#define MSR_SYSCALL_MASK                    0xc0000084U /* EFLAGS mask for syscall */
> +#define MSR_FS_BASE                         0xc0000100U /* 64bit FS base */
> +#define MSR_GS_BASE                         0xc0000101U /* 64bit GS base */
> +#define MSR_SHADOW_GS_BASE                  0xc0000102U /* SwapGS GS shadow */
> +#define MSR_TSC_AUX                         0xc0000103U /* Auxiliary TSC */
>  
> -#define MSR_K8_SYSCFG                       0xc0010010
> +#define MSR_K8_SYSCFG                       0xc0010010U
>  #define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) << 18)
>  #define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) << 19)
>  #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
>  #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
>  #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
>  
> -#define MSR_K8_IORR_BASE0                   0xc0010016
> -#define MSR_K8_IORR_MASK0                   0xc0010017
> -#define MSR_K8_IORR_BASE1                   0xc0010018
> -#define MSR_K8_IORR_MASK1                   0xc0010019
> +#define MSR_K8_IORR_BASE0                   0xc0010016U
> +#define MSR_K8_IORR_MASK0                   0xc0010017U
> +#define MSR_K8_IORR_BASE1                   0xc0010018U
> +#define MSR_K8_IORR_MASK1                   0xc0010019U
>  
> -#define MSR_K8_TSEG_BASE                    0xc0010112 /* AMD doc: SMMAddr */
> -#define MSR_K8_TSEG_MASK                    0xc0010113 /* AMD doc: SMMMask */
> +#define MSR_K8_TSEG_BASE                    0xc0010112U /* AMD doc: SMMAddr */
> +#define MSR_K8_TSEG_MASK                    0xc0010113U /* AMD doc: SMMMask */
>  
> -#define MSR_K8_VM_CR                        0xc0010114
> +#define MSR_K8_VM_CR                        0xc0010114U
>  #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
>  #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
>  
> -#define MSR_VIRT_SPEC_CTRL                  0xc001011f /* Layout matches MSR_SPEC_CTRL */
> +#define MSR_VIRT_SPEC_CTRL                  0xc001011fU /* Layout matches MSR_SPEC_CTRL */
>  
>  /*
>   * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.

(As to above remark: This is the separator between "modern" [above]
and "historic" [below].)

Jan

