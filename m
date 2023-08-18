Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766097805E2
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 08:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585787.916968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWt3e-0006y9-NQ; Fri, 18 Aug 2023 06:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585787.916968; Fri, 18 Aug 2023 06:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWt3e-0006vK-K9; Fri, 18 Aug 2023 06:34:06 +0000
Received: by outflank-mailman (input) for mailman id 585787;
 Fri, 18 Aug 2023 06:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWt3c-0006ux-DF
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 06:34:04 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe13::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38acf06f-3d91-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 08:34:02 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Fri, 18 Aug
 2023 06:33:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 06:33:59 +0000
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
X-Inumbo-ID: 38acf06f-3d91-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJhkY5SmtK/z3dnXP9CJNuDhVbg2VPA5jctnfFdbR10+g2KD/MvJKDWYiymib6/CQ+2VwhKUVJ2AjMtqgGUd+Fp8vu/S678Q7d7m4KvGVqVbJzmOfB8GBMK3folfc8EdAMGsRezvMNLEIE+C4Sy71IkWCGCBBwiPZtKJXNdukz8SpcadxWpXEPMJDyPeJYF0oysM5Tybl7ufbBsJYXoPgfVnzs+sSCikyc4ahT4aku2CBDZE4qGWUJciyNnOunKrXeu8IjVB1gvvA0R9XY6HXNZztmN/IstSJ/MLAg0CHKJf0Bizrck4SeWrBfr7OUD25/5CXJBjtPgltDG3Po5SKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s2ilwCuOWNUjnatMaMSFRZxcydlEoeOTKJCCAKifNA=;
 b=BgAmn/rVSP4+HfpRCkZ1gg7Cs35holR1VE9DPm/C5FCYezCuEtDdjiUEAbeJcrtkfRqSDLlAY9dI6Z+qV+Ncq43ILKVJNECyBZZhHSxFv6HrUmIwZ8U9sstUZDbL/D99VnXmr5weYH9f5nqINFjjhAuJpmhEmn+E5j55B09QgxTSGEchVcigy/XXHkU1kG9Xoa2en2BDU9EklfyMn7RDCqGn9I3UCcqpWMJFXHdlqIzA8Pj8wlSD/ERbEydx3vfEdNfZfdd02DDWD2/Fkz5d6wXiqsXlIe1mq6fBQu7CWZpDC2oJf9Xrj16Muphvx1xu3G62x8vBiKbv9yHqu1dsFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s2ilwCuOWNUjnatMaMSFRZxcydlEoeOTKJCCAKifNA=;
 b=NKtIpA8nXfGZMzQWad7YDHClRKhClg9AfNhGLMG0LTN+sSAhso5v6965sUBfRDf517JOkURdi7aPFB90rrJggPeGsy/5MjTdaUNKiqvoD9Avf6HIcWbwT8A6BZjM1XJUzf2wOWbkXU8h5tvSQmWFoFHjYsPHWdbazlyDaKjc9a5AQA2gSB6vT3Hdpp9DBkRK/zizf3gxLwnyjX8f0/pSiWA62kfpd+K7nCscpFYJGmt7sdtqlMOk83kpC2YztqvqApRU5eDEH5FLlLbNsdgIL51iNJSDLVwiSCcBEGo+Vbtw6alwNsMyJpxA42HK/qZnaW2A3PPfjrwE58tVQlJFOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
Date: Fri, 18 Aug 2023 08:33:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230817214356.47174-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: 2427b4ff-dd2d-41a4-59e0-08db9fb51b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	htbi7RvHKkLU+WrDBUKLPZUCapMoN28BrXLFOPDHn1/K8EsmZJtfCRz8RxbemxTfSdRVuISt5wHSEuX3fsmJYy4FParfkVl/FSpK0m5j5akKtL/cx3kM1TQek437b8W9aL4wT1jye4VX3Emd2AmCiipCAGsGWMGXC0yhEXu0bZJ66qKludmB1MWMIHONueAVcAkVJdPQ/hTYEKlc+npfsxf8FyaBDRhrR6r2TcDwTRN26ZVhEhTglQNgSh2X746SHCly1C0eSoMImzapOPrKlb6Wu0w1YOIx8e+3r4vXstcAoV4vX0+vgPRKOrIVogW9ooSzJWjK4vVkKpyEGGTOYgyRfc/KJp2n3q6I09kJLaRRUNO39G9iTJakyPL1+CKZVuNnLgiJMM7x1/iYt/+dlGhCgEyUizNDt/OdhfVo3C07zWrZEw21GlQ9M9wQeiZo8quJYSjbWjwzKx04ZBny/ePn2ohy5Nk7bBHdsSBPqKGgQzmeOomWW86RIVlTpYTZF9UEH69uJS6KPlOPt7zoxW7H37rkFy9cZb3H8J1rP9d+PK0pIUjR3RyeeUbxAI/hbh86Cagl7tX1Bjxjavx+XsQCInE6SHuBtZStkm1aWviBYJijPgD/jNjK7bgQo6kcfrx5z2t7uK+r24Mj6E7f6g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(31696002)(2906002)(26005)(86362001)(478600001)(6506007)(6486002)(2616005)(6512007)(53546011)(36756003)(5660300002)(41300700001)(54906003)(66476007)(66946007)(66556008)(316002)(6916009)(31686004)(4326008)(8936002)(8676002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0xFY1VJQmkzblQvdEQvMzFsNk9uY1JvV2FLeGxMbllpdWZIcHo4cDBCbE82?=
 =?utf-8?B?SndmTE11VzVRK1RuRUVJaGYzZXEyTjNva0IyNTBIUXlSZ3pFbC9MSTFLcUp1?=
 =?utf-8?B?azVteWJ1bFR6QXdBem5YYVRtV3RQZjB3VEZlZHhwa0wyczg3eml0bWxMY3Jw?=
 =?utf-8?B?RHJuOEJEb3lQNmNjWmQ5dWJzRzltSlhlM2t6eXlVOUFhdWNSbXhrK0s4eEVk?=
 =?utf-8?B?QXc3NmIvS2J5WHN2cnVQMGxEck5yN3M5S0FuOExZUlduTTRRcEUzci9OVStJ?=
 =?utf-8?B?OElWM0VvTzFOUEZIY0J1alFnZ0hrYlZDbEdmR043dEFUbnc5WmNydk1JbS9X?=
 =?utf-8?B?OVQ5QmlpNVdWVUZiRUxTekZlVWpPQVpzVGlkciswR0hrUHBWY2FjN0R4MUUr?=
 =?utf-8?B?UTg0Y3JieElrS0xrNjBpUkRXdThKWjVHa3hlbkVFcTRJdktuK0J0WmpDRnE5?=
 =?utf-8?B?QzdqaWdNZ2Z6QXNWLzk2YjJmc2tSamZXUHZSMURiaXZZU2ttUUNVWnBXd0li?=
 =?utf-8?B?ZndpZHk5bUdMWUZYeXFpU3FwMHI3allGcFQ5T3ZtQThmdE1QRDB1TUZuSG82?=
 =?utf-8?B?UVF3VS9DL3A4MEF4ZWJxcjZkbFZQZmtmcVgwOUNlOXB0SnhWVnYxRlk2SzR4?=
 =?utf-8?B?b0ZBQW12UHRla20yUitNZEdOQ2xIalVkaUN4R0FXN3lSWGZFQW9oSXp1MWMz?=
 =?utf-8?B?by9iVnpXOUdxMUdNL21ENnlPN2xIbFY3bFpLbTRlRE5UWUZZcTFYK1NMS0Zo?=
 =?utf-8?B?WTQ3NzF0RTFHVGFPTThYNjBmZ0kxUDlNYjAxUGt0cW1wSnhqN0NhS1dDR2Rn?=
 =?utf-8?B?dnBXZHduQklqSnZBa1RVM09MMVByTDRWcHoxODlzQ2Jyd09SSGhJOThsY3NX?=
 =?utf-8?B?a0d5WEtZY1hqV3dYNVRwRnNOdG80d2VWSXhuc3REam9pME9ZT3RpZHU0QlZl?=
 =?utf-8?B?WitlY1pZWURGK2lCMDM3RG1QZ3pOQ0h3NlY4eXY3UFZPNUVidW5zT2lqeXhM?=
 =?utf-8?B?QWZsbnY1QlJQd2xlRDM5M3ZTTEhQenlQdm1Ybk16a0pHQmVHeU15QWJjT3gw?=
 =?utf-8?B?amJ1RE85elFPYktSTEdObFlQTkM5SnM1bzlkMWJCOVJUQjBxU1RwMnVIV294?=
 =?utf-8?B?RVRmYXNxSGhOVVR6aE5ORHpZZHFRNTR4eVE5Q2Y5Wml5bzZhS3dQRCtpU2tw?=
 =?utf-8?B?bnppL2I0THgzRUFrOGZDd283SndIeUx1RUJDbGJ5SnpiOGhmYUx5UG5HZjNV?=
 =?utf-8?B?K3B5Uy9ZM0dINFNMU2NkT08wSnZpZmtBL0tITSthZnkyQ1p6L3FxSkdHK3lD?=
 =?utf-8?B?aUNOZ2dPT0pBRHlVY09ZTi8rMGNRUndRY2Zwek15WWhaUDBINnRQVS8vRE1F?=
 =?utf-8?B?dHN4MEFQSnZHd00yUE9JQ1I2Smo3aFhSS2p2OTRpeHI5cTR3VzRIRk40ODBI?=
 =?utf-8?B?alVEK3M3aU1QZDY5RS82S0dVV3lmVTZZUDRhVlBvREJIQWtQZlNERnFXdmxr?=
 =?utf-8?B?aHdIVzIrZ0tlKzZtUFdJLzFVRTRDUnNiNXhJOE5NOHJUZXhLUHVRZy95U1ll?=
 =?utf-8?B?cGFTWUg5b2U2WGVlNlJDLzI0RjhId040S0pWNUVxNnlRVFd2UUp3ZzBpU21Z?=
 =?utf-8?B?SjlXNzJLSDRXbDFzMmx4R0dTdjA1VE5ndjRXN3lYS29iMTRoSE82QWUyWmJj?=
 =?utf-8?B?TWhFREUyOVhiS2VwYlZTOEtycW1BWVZVbzU3WUNZemcwYjZqRXROMlFlMFA0?=
 =?utf-8?B?Q043NWdaSSsrTTVhWmtYQlN6dzZWTU90eGxna2VDd3l0c25MTjQ4c2FBMith?=
 =?utf-8?B?aWp0UElud1J4aXluZVA3OThPNmt4QjAvY3NRTHJHd2tVbDBDdi9WR2tJZzRZ?=
 =?utf-8?B?cWFSL3JzeTliNzU0dzhWTUt0WHJTMGhLQWIydUx6NDVyYWtlMjl6a2poc0dw?=
 =?utf-8?B?Uk5nR3pYTWxVMVUzc0FtMDcxWnlzeGNzckNpQ3JFbGJJZFJFWXIxNmY5Smpo?=
 =?utf-8?B?aGJNL3ArOFRkcXhwSEQ2eHhtRCtlNzJYdXpzVUx1UDBBK0ZMV3IwYk5YLzhV?=
 =?utf-8?B?SXdQdnlqN0tFSUdJSk91QjZVcGZpSW9sUmEzaFFpZjRrcUF5ZkNpTTNlTTQv?=
 =?utf-8?Q?jqFaezpNLwioQqR2YyEaVgBvR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2427b4ff-dd2d-41a4-59e0-08db9fb51b09
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 06:33:59.6038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6KCQtQ2L/L9DCn7Dqnd8kcgAzxZQO+k2opo1D+40fZYw61nSOUOSmx4eqdRAlZVvflhePpOQqiNg8yjQgJUrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9383

On 17.08.2023 23:43, Julien Grall wrote:
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -339,36 +339,36 @@ typedef uint64_t xen_callback_t;
>  
>  /* PSR bits (CPSR, SPSR) */
>  
> -#define PSR_THUMB       (1<<5)        /* Thumb Mode enable */
> -#define PSR_FIQ_MASK    (1<<6)        /* Fast Interrupt mask */
> -#define PSR_IRQ_MASK    (1<<7)        /* Interrupt mask */
> -#define PSR_ABT_MASK    (1<<8)        /* Asynchronous Abort mask */
> -#define PSR_BIG_ENDIAN  (1<<9)        /* arm32: Big Endian Mode */
> -#define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
> -#define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
> -#define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
> -#define PSR_Z           (1<<30)       /* Zero condition flag */
> +#define PSR_THUMB       (1U <<5)      /* Thumb Mode enable */
> +#define PSR_FIQ_MASK    (1U <<6)      /* Fast Interrupt mask */
> +#define PSR_IRQ_MASK    (1U <<7)      /* Interrupt mask */
> +#define PSR_ABT_MASK    (1U <<8)      /* Asynchronous Abort mask */

Nit: Did you mean to insert blanks also on the rhs of the <<, like you ...

> +#define PSR_BIG_ENDIAN  (1U << 9)     /* arm32: Big Endian Mode */
> +#define PSR_DBG_MASK    (1U << 9)     /* arm64: Debug Exception mask */
> +#define PSR_IT_MASK     (0x0600fc00U) /* Thumb If-Then Mask */
> +#define PSR_JAZELLE     (1U << 24)    /* Jazelle Mode */
> +#define PSR_Z           (1U << 30)    /* Zero condition flag */

... did everywhere here?

As an aside I wonder why they're here: They look like definitions of
processor registers, which aren't under our (Xen's) control. I ask in
part because the presence of such constants may then be taken as
justification to add similar things in new ports. Yet such definitions
shouldn't be put here.

Jan

