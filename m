Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F4E7A482C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603938.941092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCE1-0007oc-Dd; Mon, 18 Sep 2023 11:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603938.941092; Mon, 18 Sep 2023 11:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiCE1-0007m5-Ag; Mon, 18 Sep 2023 11:15:33 +0000
Received: by outflank-mailman (input) for mailman id 603938;
 Mon, 18 Sep 2023 11:15:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiCE0-0007ly-2z
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:15:32 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe13::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad932b8a-5614-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 13:15:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9213.eurprd04.prod.outlook.com (2603:10a6:150:28::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:15:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:15:28 +0000
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
X-Inumbo-ID: ad932b8a-5614-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nx4nAWDXsDB1XEZJFzCQQ5YQpw77/ta8NzyMggHSBrCsxVPWYFeebvbETdCGpdT2vLnM4C6BRRB83lNFoMJKriKOFd68mxrhPN/umupHrMy14uyy1ASuaq4J5geQWPy12IVSOErdmNvvN06bHuAVJOoUNYTGi2xBwc3vRI6mCVuVpTfoepczC56BwPyDEYDKSll/LZdOHTQHE3u5WuB/usGyG4za7Sy3Z4MR7daKIO3L7OpFigzA6gs03rAJvzNESXilEO80cPmwIrM6Bh61nt/B+/ZH4SBISW6wrz9x1ixO++WgE6BxBd9/5HvuGQtLHkjiwWRMaYRN9yPYcZ/gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We2/Sm4p1Sy8kvdJTxK9/X8195fSmiib0HSmoY9alFw=;
 b=CKmlD/s9HEMng+XkmINk1KnkkIsJAE1OCDbztCPeJiH5stbLPesGta7EZNJnZajksjwB1ALUGRS5aj7y7g4CdRR3kQ/asrvbyhOEQC/m0VhOvoZiCkCG+uzfACZeHUuYD82byrwJTRaOYpR32ohZh5PlGPGtgCxmQ7/GM73/nbRW2WxTRsnfQVRfeojSENWNo3mA1uIP9AiZ9ZeLqdzyPIRJ3Rm4GKQ+RH6BkKl1+hNcf/uEHEKTx7RwMxs+dJv3I5wO1Xrflf6Ujm7q7xwAQte76LTApgo/VWuza0+HewYa3M3lmVWCOZD3NZO+bUqCcZwQI6Z4KS5byw2pmaHWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=We2/Sm4p1Sy8kvdJTxK9/X8195fSmiib0HSmoY9alFw=;
 b=RBzwMw80xzrMOLWndfnwPAoddETnM4nTbke4rNV+fhsSlbJTE6b9iCr4ATNZrG0FiWXb0Uhf/7oMfBPZO8uHLQjnvQmgzrlHQaaLVEu2NNaJrNxbo3K4NaiyS0S05Q7FXcp7Rp4oBala5HcwtKE2mdVQ22VSa6RCZxt/Oa5BiPZNhHVsVNQFUyMOaK+Ixg+RAKbtKWxr6fW+S91f+HAHijKN29s8TXrlcT0ox4BVwmgq6iH7NheJ9LmvQR5g8xk/dmnZp73XQEnlz4LzeRuby7HthFW9ZWWr6aHSsm/IFmnkE/N18nX570qOiQU1irBTsCTMj0Yur82sKB8n58Hl/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13289cc3-c419-0625-06c9-e7ffd79f9890@suse.com>
Date: Mon, 18 Sep 2023 13:15:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 9/9] x86/spec-ctrl: Mitigate the Zen1 DIV leakge
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915150038.602577-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 748a3475-6bae-4455-0eaa-08dbb8389059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5F61yeZFM9bzuHfE/LMV9RQTomRjYMPGZoFMy2joiLqiZorWT9c7fy6Q4LsrkypYmNSQjVoPe5elUUUSHH/WSv5NbJYKMYuKbpgOow7fBra9YnxPCFFnRTIb10lKlVj8lGkfFZosLDYbYQ+JS1CttD6p71YGdwhAqPpzsQUoFu3M2TCOgxsN3eFku+0ED7qHEkAg3noiuKcc2jilOVyz5TWiUbpE2NzIamC5GoGanw41ckbYzza5O2JCUn9IhgpMhftvVAN88cLIuk/RNpi/kBoWKgUqZ2LzDyqnzCqrEJiFFtkAUqgKtALi2KFglek5ucbjC2jgj8l3tFvJlk0ZFM2u5mEq+iOsUWFySqH3aNu0GMkAzpiIZOatSKOp59fCkmu3jsXa1jYoAMV2Kwc0R9IFGMo76D0DT4xSScRXDSZPaRk7sksh0F9C2aEcF4Yzwo8VQFPALStgOSTTsIUj+IQyEwSRo9uUWnRMljyfLo3wLVJa1AhgKzQjJ3B702MmA36wgU57sxziL+fzIzeNZEv2LUKBvsa4B2/LssObmSKNazOH7M4Nk6pDT2fGs43Se0Q55LPcFfrzhCfeKpNJg3JWalQiJ6ioP7gdFNq5BTHWmEmFW3rdoOAkT0lbTi0XLO1aUnmWKbOWuhIN1au1yQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(366004)(376002)(186009)(1800799009)(451199024)(6512007)(26005)(2616005)(6916009)(316002)(41300700001)(6486002)(66476007)(54906003)(66946007)(66556008)(5660300002)(8676002)(4326008)(8936002)(53546011)(6506007)(2906002)(478600001)(86362001)(31696002)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXRmaVV6Rk9DT0ZVbHd1bll5azBVenU2NmU0cGpIbjN0c0gveENSVHdwSUVa?=
 =?utf-8?B?RlZjWU50MTlvOTJvbEdlV2lFT2w3bmpzZ0dCVzdrTUZnZVB1UkVWQWJ0djQ1?=
 =?utf-8?B?bys4alcyejZyQWhJQ2ltbkJ0MVV2QnN3bEJFMzB6alNnMkM3SGcyQmtrc3pN?=
 =?utf-8?B?eCtZVGN3WVdHNy8vTVhjd0tDanN0U3d0VERHS1lBR3BOZHBlL3ZESlMzV1FJ?=
 =?utf-8?B?ZmtYaldmUkxPRDRHSGxJNUhvdUhIV3Q1TmthTktLMExIb2dZTHRHQ29MZmtY?=
 =?utf-8?B?U0NmRnNWWTJMSEVpMEwyeFlRQ0ppMVVKSDVQVTl0NzZiZFoxTGN3YW1ST1JV?=
 =?utf-8?B?eGx6ZE5UQnpnTDVQd2FTSlZoVWZkRFcrVnFPYXVUUzQ2OFM5MmgvbkJIV2Rm?=
 =?utf-8?B?cHBTMUpoY3FvaTRzODV5WmZPa2IvOWlHbWIvRTlaN2xtYW9LWVZGUGlueHdy?=
 =?utf-8?B?STNIMVBmemlSbVMwQ0NEaVhKRDZ6aFppd2E1YThpaTZmTUh6RnRvNzJycVVL?=
 =?utf-8?B?R3p4MndzL1h3bys2dmQxamZYTWxPL3VnK2x5OGpmZ1VvRlZ1a0tDS2c3akl2?=
 =?utf-8?B?YUttZTdjakJMdThFVDR4L0FnK3p5N3VlS0QyZE9RL3IyRThzalV3ZnVxeVc1?=
 =?utf-8?B?eFQvUytaY2VTUmNYVTUvaERJdGJPV2FsQnhNVE9PUWw4WFB2WGJxeGpCSGtj?=
 =?utf-8?B?L29OMkZQU3ZQcENZdVByVW1ReVV6cHdFRHEzOTRxWk93NEhCakwrSVBac2E0?=
 =?utf-8?B?aGFKbGtFT0l0NnU2WWcwaENiOFJrQS81Wk1ZNytNS294bWxSZ0oyVFR2d2Z2?=
 =?utf-8?B?ZnVqYU1GcmhYMktaekY4V1U2Ly9EOHpxM0xLb0JKVUllMlVpT1RCQ1BoV2N3?=
 =?utf-8?B?MXR2cC9WVlR4TWplT1prdGtacllGWWdsdk5TK3R6ZytCOFV1Z0U3Zm1xeEk3?=
 =?utf-8?B?ZHY1dk1IcEJQc2QrVHMzOVhDZTg0dFdaenJjV0ZGZjlqVUdQdGtXSGdqUllH?=
 =?utf-8?B?TElDY0xEMFlaZGpOV01xd0lTQW9XRUFBQzY1ZnB3RzlyOCtVeU9hMHJmT29P?=
 =?utf-8?B?MkpKL0tzSnBmUnFJU2ovWmptRUxmeGRldzhmQTBkQkxOWFk0V3ZVRDdJdXZj?=
 =?utf-8?B?NWlyQi91NGp1T2hqS0dUNFo4dVFHY0xxa09uZW9PVkpzLzV1dFFRTjFidndl?=
 =?utf-8?B?Y0xGcVRSR21xN0ZEU2RkZ3FlZ2FDaVJ1UzlsaVFTcUxRdFJYTWF4R1d4Ukgw?=
 =?utf-8?B?L0tKT1QxMG9tNllJcHR0YUIwcTJwTS92cXRWWjZ2UTROd3dsSk5PV0ttNGtu?=
 =?utf-8?B?NUc4MktBUWZNdVR0M083QWxObnRMWVc4NnZpbklQaXY5cG03bmJKYWJGbnlB?=
 =?utf-8?B?SG0wSDQxT3V1WEZtWU51bzVYK1E0dGMxWFJDT1c1VHAzdklJbDNSQlRHWUlk?=
 =?utf-8?B?WlFmYVVra3FKKzVXeWtvc2xoMys2RS9lL0ViOUtmckNvRGp4cDg3K3lNUWhF?=
 =?utf-8?B?S0piSS9VN1I5UVlnS1RwQ0l1cXM3UUY1dHdydVovYWZ2bjRBbTFKSWZLMEY2?=
 =?utf-8?B?dXE2YVNGN0xCdVhQaTVlMWoyZnp2ZXYxTTlvREVYcnowbDNNbkk3UG9ORU84?=
 =?utf-8?B?bVZzT2dZK245Z1p5eXQ4a3MrRklIWmhXUCtvYXJaVXBrdldxb0NObkttcE52?=
 =?utf-8?B?S0JGLzcxbEhKUW1rbnpJSnBBNERiVEpqSTVpOTcrNlV3eFlQcVREbG43MlZF?=
 =?utf-8?B?bVl4QXpNbStYOWZ5aHNUTUU2RVJHK0o1ZHIycU5aNytHVWNxbW9VKzJDVHdu?=
 =?utf-8?B?SzYxa0g4Rko3RVBLaVpPTkhZMm9RNUVTUWIyS2VsMUFFam5TZnR6MHp4bUlQ?=
 =?utf-8?B?ZWNwOFk1dTZxMHQwZWpieXRtQTRPV0FTbE9sUU1ndXJpN2MyODQrc1lUSHpF?=
 =?utf-8?B?M1J3NmV4bGdlNkgyQWFEL211b3h3Q2ZFNWJYc1hUR1ZJb3JOb3Z4VWhDZWY2?=
 =?utf-8?B?UWhZSW5mU1NXVmVCMWk1TkdzWHVBbG1GVXFtYXRadnRtSG9yaDEybWh2TGN5?=
 =?utf-8?B?amkzeUpQcDJvQy9iZVJTTk93czk0a3Fma2lyWTJ6VDRZSmVzQTcrbFJLSUNx?=
 =?utf-8?Q?tNZbtTmFPBfz45vxQ8Tm2LH94?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748a3475-6bae-4455-0eaa-08dbb8389059
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:15:28.3884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NaI5MvSVzJg6HyJ1n19BRMvwaHXJSO3O9BQfsNt9B/7flZFJpFACagBGO2e+HKla9NMEk4v6JthiIG8nU42Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9213

On 15.09.2023 17:00, Andrew Cooper wrote:
> In the Zen1 microarchitecure, there is one divider in the pipeline which
> services uops from both threads.  In the case of #DE, the latched result from
> the previous DIV to execute will be forwarded speculatively.
> 
> This is an interesting covert channel that allows two threads to communicate
> without any system calls.  In also allows userspace to obtain the result of
> the most recent DIV instruction executed (even speculatively) in the core,
> which can be from a higher privilege context.
> 
> Scrub the result from the divider by executing a non-faulting divide.  This
> needs performing on the exit-to-guest paths, and ist_exit-to-Xen.
> 
> This is XSA-439 / CVE-2023-20588.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless I would have hoped you add at least a sentence on the alternatives
patching of the IST path. Hitting #MC while patching is possible, after all
(yes, you will tell me that #MC is almost certainly fatal to the system anyway,
but still).

> @@ -955,6 +960,46 @@ static void __init srso_calculations(bool hw_smt_enabled)
>          setup_force_cpu_cap(X86_FEATURE_SRSO_NO);
>  }
>  
> +/*
> + * The Div leakage issue is specific to the AMD Zen1 microarchitecure.
> + *
> + * However, there's no $FOO_NO bit defined, so if we're virtualised we have no
> + * hope of spotting the case where we might move to vulnerable hardware.  We
> + * also can't make any useful conclusion about SMT-ness.
> + *
> + * Don't check the hypervisor bit, so at least we do the safe thing when
> + * booting on something that looks like a Zen1 CPU.
> + */
> +static bool __init has_div_vuln(void)
> +{
> +    if ( !(boot_cpu_data.x86_vendor &
> +           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> +        return false;
> +
> +    if ( (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18) ||
> +         !is_zen1_uarch() )
> +        return false;
> +
> +    return true;
> +}

Just to mention it - personally I consider

    ...
    if ( ... )
        return true;

    return false;
}

a minor anti-pattern, as a sole return imo makes more clear what's going on.
In a case like this, where you intentionally split return paths anyway, I'd
then go with

static bool __init has_div_vuln(void)
{
    if ( !(boot_cpu_data.x86_vendor &
           (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
        return false;

    if ( boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18 )
        return false;

    return is_zen1_uarch();
}

Jan

