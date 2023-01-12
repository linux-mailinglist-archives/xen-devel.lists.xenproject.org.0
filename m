Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196586672C7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476138.738157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFx9q-0003pL-SI; Thu, 12 Jan 2023 12:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476138.738157; Thu, 12 Jan 2023 12:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFx9q-0003mv-O5; Thu, 12 Jan 2023 12:58:14 +0000
Received: by outflank-mailman (input) for mailman id 476138;
 Thu, 12 Jan 2023 12:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFx9o-0003mp-Hv
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:58:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4736321-9278-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 13:58:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8841.eurprd04.prod.outlook.com (2603:10a6:20b:408::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 12:58:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 12:58:08 +0000
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
X-Inumbo-ID: c4736321-9278-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFMYx3rn7wtE7mWuxpi/794htkqQyjJ0vlySlU2qcRTcQJ4FxyNljbMp0E8GS//SQ/y5JAReoJk72WmrjI60I+ZSxVZOPp4lWCns5H2rac63B/kWIENwIMhiU2ghWne59gp+1IpJYS0878JbKnLP6Ba6bXwnXCesCtznfyVd65j3Ufy57lqpiefwaUEGUxnG+Qbn9CL9FE6AdKh6QcCoS3SbwQVnsc1b5v/MK+CJdnbxLTsv/HiqdXZbpASNT7WrNI66qlJqYdoK34sL952pL4LYjkmssevxidDcTuIm4beN9qQJ2AwUywzM9a9QM1l+DtMs9G5i4LvDijWLZFezHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D26GuqKYX6gPt9im9t3yBAAtCPZw3qa90PikQLoD9uQ=;
 b=H6U9yEeQFWjs+9MBoUe84yf70a98Q/oYuuEWdYR0HdzejNJVQYMJe+CRkyMJ8wOvEUohg99QRr1Mv0VOee61AhX1CRh12JANJ53FCDepBWkEcufXwwqda4//Q2GYrfDZd0oyGuMYv43Gd3+5vfRMIICY5MQInB0hJYWxrOm57yymKCteQUJT/e45ohmLBOwOiWJKAGU9uW64+6WKc//fAlvarSMuRYZGoq5CCELZNEH2akE9NboXzXbM9es+g+bKql3EZL+LfBw6uJ5Zv4C6La/vnsXN5Zfesr3O+w5gD/v2uGGSKRthjZMf/4VfhM+lZpsH0UlMB9s9pe+yzCDNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D26GuqKYX6gPt9im9t3yBAAtCPZw3qa90PikQLoD9uQ=;
 b=ryFLB0Bo1ntp1y1U565RyrjJ5IqHj/2mphcHaoBE2pd6s18ufHkqpZ22jmukQTi8nhxABb/QwpXOub2FnaOTFI+3k0WOC7oXGF9XDtqom5d1ba7I3f0JcxP47EB1SoW/FupB+6pM2xrkwk0PTxA9T7pLfLSi4YwO+YI33KfxvuuiRE+HFc6cOJmRxVx2QbqMmvcPzdWG5nvhLmcQtglpSUFHN1W2sxs/5QnUEzLxqcRbIxSLn5GDYRl7vTym+436CVDCqmgrHftUGq1VdVamDfVD+vROgsoiaeW+TXoaKhC1i7cV8Px6n1PNasmfEYSbOrzQ5Oya3PAXpX4kgNyA0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97d16968-57fa-0114-1a93-4d0d253b8172@suse.com>
Date: Thu, 12 Jan 2023 13:58:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] x86: Initial support for WRMSRNS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110171845.20542-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3dde32-d52d-4efc-d948-08daf49ca6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PYwl/QHIzmTdQ/YuEuvYtyOi+bVzyWBcA81SFXmYdUuBdhbsPtBASTxY+oXCRGxaaOdx6QRN3AEX/iGoS3Shw+10ywdaJ1OE/YSlmFp7+ljqxCv6wuPi+X2/TNr5pYuaplhxDWYbPpzI6PdHEBZZ1zAV+j4yMtgb1EMtdx4BtKXf0Mg1UfuPWw79jKQksG+22opAVmdtT1TIkihOS17BedFfedTRl4YwjB3mffeSVi2jPLEpudfNSsEwt3wSa7fYHH5eMpXSKbwc0FTedk4Qr6ETIZC+m9sN4pLyzT87NKLjRNu/cjZ+MM9O9f7DZpoEePiXtXk7n7cJV4fMV0cOqzvoaSofdMS+bAfiN5tQ/bmLVEyS5hv4g4JpwhxcTjuRa8rHC5IuccHCLCKH4PgAZ4yolk3J5VPCzQqaTJ3Q1/PWgcFGJahd1tlg1IG2SzW6nn9pdJ/BPCZ3+jFnZnQiPpX0P56FION/8glCOJDE3SzQa9feC79OtRzQKC9xdzM8eTbtexUO2m117sBAz0sB2dqPJacy3SktBr4XqNkSJb1zGjAv2W2DUAG2D53D3z93nWBB0sDz59wYbT6TcHXGu2caI4DFvesAImVX3LjCHKMcEkqemXcpu8GPxYQoMDVhTDWTBUyZ367walNloyA7DnLVY3oLBaBcmCnoZpP1Tyeh7TNxowv0bwvoevEsfiqG7IB32PE1caS5luT9ufc70S8ayojeOtSf5joczeMOAKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199015)(6512007)(186003)(31686004)(478600001)(26005)(66476007)(66946007)(53546011)(316002)(66556008)(6666004)(54906003)(2616005)(6506007)(8676002)(6916009)(4326008)(6486002)(38100700002)(8936002)(5660300002)(41300700001)(86362001)(83380400001)(31696002)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDlhYjBveEtBWE5BbDg5cC9GY2cxczVSSVUxU3RpMy8xNHNGalE2bW5naWRt?=
 =?utf-8?B?TVdZR1B2MTdHbzBxMkR5MVArU0RCeVZtVVVwc0NEWjZ1S2h1RnV1MS9BWU8v?=
 =?utf-8?B?clZNeHZvdXFSZis1TnJ4eWhkNWNVRVRzc0RZcHBVS1R2R1l4UXk1aTRtU2xF?=
 =?utf-8?B?Qzk0ZXcrQnVzY2tteTVheGhBQTlrUWhSVXpXODA4Um1WaHhpVDRJNk1GRmtV?=
 =?utf-8?B?V2dHdEhkc0QveHdJQm1nWGtjVk5UZmVMQWZkMnpZMlpPcW5sTFZsUUozb2kz?=
 =?utf-8?B?UjZ6OWlaOG0yZ3BablM5VWtuTy9wT0p2MUx1Z05XTUdPU1diR3FuNXYzajNa?=
 =?utf-8?B?WE5pZTdGRzI4bFY2eDZJdy9FQUVaUTNFcjdHVzY3VDNQeWM4QXFvYTNlYTFC?=
 =?utf-8?B?UlZQbDdpTHkxdVphWXRmVGFZRk5iRjd3dzFjTTRlTXBuUUY4OXpLL2YwaDBr?=
 =?utf-8?B?Y0wzbUpOUis2RWFnd0NIVi9YeCtJcnMwNlNUQUhNNWJLS25sMVNRM0dBL0Rq?=
 =?utf-8?B?T25vZ1BDMXlBalBNOUtoeUl0QWZoYTJuN1dXZDB3SHZnQ2NxVmkyTnVZeldl?=
 =?utf-8?B?dzZCQlN1ZlJGOXlrVG4vRnFmYTA2ejF0NVBzWEZQeVZiN2FQazFEaURxdmlO?=
 =?utf-8?B?VFlsczd0ZHVnSEM2aEJnNEEzOG9DRXBrVml2Zi9OZlVocjMrVFZyalFYd3c2?=
 =?utf-8?B?Yk5ZeTRYOU5scC8vQ01TL0g3Y3ZTbUNkZWhiUkxUajRxUm9vVFlhQ3B6VEhC?=
 =?utf-8?B?UUF2RFZ3Y2hzL0tGc3JWSjZtN0RkR3RITStac2tPUmQ2Wk54SWZncjllVXM5?=
 =?utf-8?B?bnZ5Wll3MkJUTjltaW51WUs1NXd5MEE3VnZuQkc5Q0RLeVBPV2licW84TEp3?=
 =?utf-8?B?MGFxYW9QMlcrVll3YmJWa1orTGFMV0hOWEQvb3VSUkhhZlZaUk4wS0QxMTRP?=
 =?utf-8?B?VHo5VFNZNzE5US9CYWFldG1sNVFaajVYZlZ0YjNXU1RYN0RZOE5jVCtsZDli?=
 =?utf-8?B?Y3cwNnlZaUFnUW5xYmJBUHB3MVEvVklhLzdmekNURll3K3l4RXBQVmRzNnpV?=
 =?utf-8?B?NFIrZW1OZWtlUEd4aytUYW4vdy9OcE0yRktjUlpxMWdVZmNCdURFSEFZTXZr?=
 =?utf-8?B?NGtFMFNUMFFaeHlWanh1cWwwVGMxWHczNzJOek96SFFiL3RwK2lQQW1BTWk2?=
 =?utf-8?B?cE02eWhvY0hvSUdCQWovc2hqaXM1WlF1Nk9UOHJOQ2J6S3g0aWYvTUpzWWph?=
 =?utf-8?B?c0ZZR2ZFV0RNSnZxWkY1bkZMQjlqNkI0eEE5Y2x5SG9CK1g4dEc2Q3pydEFK?=
 =?utf-8?B?N0NpMVZkWS9icFJVZTR5WDJuanJ1K205RVNoYzIzL0duV0JpUHE5SmpQMGFB?=
 =?utf-8?B?T1prR2NneUV6dVU3UnN5UTlYWktUei82Q05Vamp0ejNIaDhOVi9Da1p0ZGtF?=
 =?utf-8?B?Uktxc3YzaDJsRFIxY0RFY0RubjQwZCs4WGkwNC8zZDA0NXN4cnlYQlcyWFVk?=
 =?utf-8?B?ZXRjd0ZmNHo0NXp6UklEYUt3RUI1cEh5b1dCMWNraFdOV1ZYMFVDcFRsQ2NJ?=
 =?utf-8?B?Q1JkNWE5WktiOVBYRFNTMm4rMDJDWURCdFJzREI4dnpwQURJMHFtQ3pDbTFt?=
 =?utf-8?B?MmdvM25mbDl1dDRFaDlZVzBvMFBZT3JwRUlWdWxaOWVvKzB0d25CTFg0VmFn?=
 =?utf-8?B?SVlSTjEwSGxUOHpVSWpBNDdRdmJWR3NodXZxNnBQNHR0ajF1UHlLUys3cmhJ?=
 =?utf-8?B?ZXZVVEozOHhVMUQ0WG15VlY0YnFocFlrVTE4NGh6eTlMOXRjNFNkdkdLSXNH?=
 =?utf-8?B?c1l6WjlnTVlVWXk3eHQ3cUovc3lZc2V4dVAvNDdENzJyWG9Cc016dVppdm82?=
 =?utf-8?B?b1U0aFZCSnhib1RTNUUzMkVwbElEd0dWd21FQWFmZ3FuN1pmcXVSVTI0TGVJ?=
 =?utf-8?B?M0t3SlBCTU4wakFXcnU3bnFsSWwwUjY1QTRIclJGS0lRdWdEdUdZcm1pbkhs?=
 =?utf-8?B?dk5qaTdqSTRrN25LWCthM2NMZlFMZStJeW9HbEhsT2RnRjdxQndnaVJ5bi9X?=
 =?utf-8?B?OW5pMFhIMXc2SWhOMC81ek8wWjFDQjZEY01EMXBzbzF3dTIwc3VSaThOYmpH?=
 =?utf-8?Q?cN8EZRgs4tDEQNCDd6DhXXfSH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3dde32-d52d-4efc-d948-08daf49ca6f0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:58:08.6254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OizL/KZwFk0fTX27Bk3LG5sj7lWZ6O4wkAD/5M84DaafQRLShKDGaic/F+AZfKbrtFWswOmku5eqfeI7u7X55g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8841

On 10.01.2023 18:18, Andrew Cooper wrote:
> WRMSR Non-Serialising is an optimisation intended for cases where an MSR needs
> updating, but architectural serialising properties are not needed.
> 
> In is anticipated that this will apply to most if not all MSRs modified on
> context switch paths.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

This will allow me to drop half of what the respective emulator patch
consists of, which I'm yet to post (but which in turn is sitting on
top of many other already posted emulator patches). Comparing with
that patch, one nit though:

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -189,6 +189,7 @@ static const char *const str_7a1[32] =
>  
>      [10] = "fzrm",          [11] = "fsrs",
>      [12] = "fsrcs",
> +    /* 18 */                [19] = "wrmsrns",
>  };

We commonly leave a blank line to indicate dis-contiguous entries.

> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -38,6 +38,18 @@ static inline void wrmsrl(unsigned int msr, __u64 val)
>          wrmsr(msr, lo, hi);
>  }
>  
> +/* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
> +static inline void wrmsr_ns(uint32_t msr, uint32_t lo, uint32_t hi)
> +{
> +    /*
> +     * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
> +     * prefix to avoid a trailing NOP.
> +     */
> +    alternative_input(".byte 0x2e; wrmsr",
> +                      ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
> +                      "c" (msr), "a" (lo), "d" (hi));
> +}

No wrmsrl_ns() and/or wrmsr_ns_safe() variants right away?

Do you have any indications towards a CS prefix being the least risky
one to use here (or in general)? Recognizing that segment prefixes have
gained alternative meaning in certain contexts, I would otherwise wonder
whether an address or operand size prefix wouldn't be more suitable.

Jan

