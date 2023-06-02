Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C351271FEE1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 12:21:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543075.847688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51tv-0007JT-5C; Fri, 02 Jun 2023 10:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543075.847688; Fri, 02 Jun 2023 10:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51tv-0007HP-2T; Fri, 02 Jun 2023 10:20:55 +0000
Received: by outflank-mailman (input) for mailman id 543075;
 Fri, 02 Jun 2023 10:20:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q51tt-0007HJ-NS
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 10:20:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2059.outbound.protection.outlook.com [40.107.7.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 262e783f-012f-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 12:20:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7430.eurprd04.prod.outlook.com (2603:10a6:10:1aa::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 10:20:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 10:20:21 +0000
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
X-Inumbo-ID: 262e783f-012f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQVa6nkkBN1WB7OOnb1++YbXvYJFaojxuIhS8PFtk8vnYllx1VcCFkJDvdM5kJ1NR5VRmmzHoTfBVSSVQC7u9/ledy+MthcMou0OzbcJ19w+ktsEejz9NyNZUVxC1qi9npd8yW6BLNzY7rZkAB5Altp3gEcXbvOw07FUwN5xZ1IGxCOB12zrRCyRBEjDBw9SL7DMHcCrIfAz75g65rRPvk/zvaxJW9gxc4WGbjzZl/HIEDGV9RWSJh0es1g/dLS27jOzWNLX3RxSwJqKo1pp4pS+9rKof7C3W3tlktxRnB9HVKdDleT2N6Q3OJoVLeqSdNn/O5BgnJSW0ag/4xGsPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBsFjGD3+jKSEeftv2gzESuerJ44HzCH2QPGO/EjaQQ=;
 b=SxsszsmdqogC76s/xfnSNNlKSTnLfOUZBoDhYKUyJr+e8XQ/qVtqH6+alVbdVuoszsGcnkPa2uVOZabhN+QzmcWqZgzCdQf6slenkgThxiVJs02MrOu9p2tTOiALclcWtaNMpx7q44j+WBN4h8fvv+WLXqk7tMu+jSVUVts2R8GCIMFJ9vEGDMvawiyXLDeM712lFT9fY8VSM3HWI7pgIGVNQONtELZJkehW+w3v3ZRr8Y6tEWlr1hWv2b9PdUC6e8vOMyrG0+eYzUuEyRCxVy0/+Do7f0YyDqd0KtjK5GF+tLxdH0LLgLhgxUocYQ5RMTrKdEMpGV1oaVrqqaSyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBsFjGD3+jKSEeftv2gzESuerJ44HzCH2QPGO/EjaQQ=;
 b=IpR+/57uz/9fOlpJEcK0GlPhh1UQsC88aIxNEjcq/Rz5LF7s9tmWaNcROruHO2lINp/RVTUw5hUUqH5tv4Uow9C35vTGBujIMYeXQNufndQ9E4CguSlJ84QomdRqbGhGDNLBlXxL/unZj8LwcCX0YaFehObKnaNb1Gz/HJyHZmpqxhZ61KjOwCWmNo5JvEeSf5egzjZLK7bGdmbnNfqCTVzrgnT2rxjoYY8VKQa6TJQsCbQN5VOxLZalS4CiTMx7EWujbL7chkH8tfMyxYfCogjr3rpfydDCQdJqElTaXt/DoPOWN6gQdhPuK7sWw3LfxbsOEJ0mQ32GNAsN6JUJuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ce6bd53-089e-e8ab-3b54-2720a3fd2c12@suse.com>
Date: Fri, 2 Jun 2023 12:20:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/3] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601144845.1554589-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0194.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 655b38d3-77b7-4cf9-e913-08db6352f882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fzl/QouXTzU3xUxopgyOzS+SS0E/acPqf6R18tLz4w2W4eLbheoQvNbOsR5GFB7RDPF2J0RONhuHI2uI5nUusOkdkZlQB3L45lU7oYsBxNudnE2cfv1L6AV9SCnU6YCgvG2XeQun+LSJpkaFgJyQ3QXNqkTKY+cyVBMd5v2uqNIydYVRJ+uXDaIn5O3zfL+IqyE9qt9AFDqIjYjIblnttN366dNzjGx5QLnJr0QJww5j1TM2aNo2gQ6Em5JCX/7bCVnfDymP64y7Csom65S8FryD7COc5fRjR+5NKslLXArAF81kQI/KaBWtMjlLSTKJQIPEIwOhroerUFeKUFOuO5miy6Kpe+6NNvMgQupPfyu7EVpgLkeY8ItWHrz/OJVrLHu67YiQsuNKXkXP2eiHvKll+fj5KMA00fudEjAPd1Y8uL5bE0JBknKtA/OfNqUjBCiUDmBxtJZcprVpK40ZAvFMqlpFKDXOu3HWfjrx0hYnYDBiCLNTvPCCxDcZUYZ+p9Lto7KFl98koHXunIMVb627VqEdp9w86bdhn4HEtTAIPwEXXEsJO4YzsxwRt0ARzKifSYqN8xhVODyHtdivIWgQzxFmVdn7u7IU7qToAMCzpKlAVH6w0FmHAH/shdRpFI5WvqVa4/LDUMGxFpaOHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(38100700002)(6486002)(41300700001)(26005)(36756003)(316002)(54906003)(6916009)(4326008)(2616005)(5660300002)(6506007)(6512007)(53546011)(66476007)(86362001)(66946007)(66556008)(31686004)(186003)(31696002)(2906002)(83380400001)(8676002)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGpwcVN2WFZYVTY1Q3VSb3VyRG5rN2xVUDI5Wk9udU14M3BiR1hBUWlta0Vi?=
 =?utf-8?B?R0lVZCtBYUxVVDlycDNuMWYzcWI0V3VTVVc4cmplNFhxUG9JR29FTTJYcUFM?=
 =?utf-8?B?Rm5FTzVPa2k3bHk4MjV3ejl2TEZuS1NuazNzR2JoUVYxcVFkcGVkbFpWS0Fz?=
 =?utf-8?B?Q2JNYVVrMmtYTFV6MEdTQkdVU0dtMU9UK0JkUUlwUUF6aERYakdST3dQQTlr?=
 =?utf-8?B?WG91VXBBVmNTR2pZc3VwdDVHdW13QlFwYml5YjNPSnlSdnBKV3BjeGp6R1dv?=
 =?utf-8?B?YmNwK243Tnh2bnlQRjVwMEs5NHZMS0o3S3ZCTU1rSlNROWMrS3BzSUI5RnZS?=
 =?utf-8?B?ZUZQZmw5TUk1a2RteXhhWHlpMUdkaDlyQ3oxRGFWYXYzaXBvU0svMkRmNWVS?=
 =?utf-8?B?aEJOQnhlZENaZWpYTk1JNWI3TEQrZ1ZPM2hoZE04Zktnd01tdGJBN3MrV2JX?=
 =?utf-8?B?M3VDT2g3MlRYbDAvY2FBREVPS2ZvYmJ1LzkzQi9BdEVKQURnelpybWpncUxh?=
 =?utf-8?B?ZWVEdzVGMjAvVnZ2TUZqc0JlczNidXd3N29UOUtEV3dCUWFFd0VUV2JDaCtv?=
 =?utf-8?B?TVpnc29YTUpmL1d1dDdzdWpNN0Q3TDQ5ZDBuNjNHcytGSk5oTTZEMFd1NHdX?=
 =?utf-8?B?NHB3MGJPYVpTVVdJNkdWZ3VEQnA5UStWQ3ZvOG1RQ1ZJblhXNTlwY0xvcnEw?=
 =?utf-8?B?Q1pqMnFWTEF6T3Y2N3pHV2ZYL2p2bkdnLzBsbU56ckkwRThaekQ5Q0hSSEFS?=
 =?utf-8?B?NXh6dTFkYWpmUUJyRC9rWW1rWG1BdTNHbVdqdzVhVW9UZzZxTEtLMW9VS3NN?=
 =?utf-8?B?bEdvWGtwUXJSTVBrYjYrYnZ6ZVpyUWE0VFRTQW9MM3JWNHBLb1BDNUdtSjc0?=
 =?utf-8?B?Yzk2L3pvcXY5dVAvM0dUTTI1b00wcnJ1L0ZIenUyekRHVEJETDRVMlZaMFpy?=
 =?utf-8?B?SHlTa3FaZDdXYmg2emVJVUxNTTJGaWxkZEdlNTcxOTZYTlVQdzk2WjF4a1gr?=
 =?utf-8?B?c0FEaElvdkdDLzlmMGJlQjZGVzdLWTJFWmJ6Y0lLeUtSQjZaMlpQVTdidzg3?=
 =?utf-8?B?SXY1L0Vpd0pjaU0rRm9YWUFjcExUclA0aklIUFhQS0t2YlNHNE9RZXBleWht?=
 =?utf-8?B?eFNJSjB6UEVseXFnaDZxbWJFbEJzRk5ZMWtteVp4MmtaSWc4YUI5T2NSQURU?=
 =?utf-8?B?NW5CS2F3YUZRdEZHTWx3TllUN01CbEg1bDczZ0xxT05jY21KTTJURDkyWGFZ?=
 =?utf-8?B?YXhWYzBpZ044NTQyUDZ2NWNJTjhDbjc2Tnh3OThaQ3k0SGYrc1ZSMnBwTDAx?=
 =?utf-8?B?V1VyOFVZSEFHdkRZMzZ2SUVGUWM3NUF5TWtBZU5PYTd3U2hYTDBneDl0QjJP?=
 =?utf-8?B?aHN3WVlLYWROa1hUaW5rYmRRd05RZkNwZURDNW9WVURod1A4Z3JYSmV2ZDFC?=
 =?utf-8?B?cEFHQjBqS0FGb0xhWjkvSUJmNTJDbXovdER1L0JmM0dpWG9WU0JwaDROdUtm?=
 =?utf-8?B?dWltTVpnOVRabFFUaWM5aW9XWWRTc1VEUzd5bUNzaXFzM0Q4M1A0OGJvM1gy?=
 =?utf-8?B?RTF1a0VUWG96NXFZVFJrY2d4b0JPM1lGamI3WjhqVzVoa3dZM0RqWkY0Nllx?=
 =?utf-8?B?aC82RzBMa1RwczZ3UUkzb2MzSTFLZDRsWnZMUGpVTEJsUFgwa3hCWWhmdjJr?=
 =?utf-8?B?WFIreVdLQXRBNE5EUUpwdWo4bVF2WG8yOEZaRzhZRTFlenZWYWZEYWlhR2xJ?=
 =?utf-8?B?ZHRiM2tFRTNObStsdEhIQU9kVXB6cWRESStGVS95SFlwT2NTckUrc3lpN1BW?=
 =?utf-8?B?NVRlM2hiUHlkOTRDTVorNVlocys2SHJDSmlFZ2ZBbEVlWTVEOWVHelh2TG1p?=
 =?utf-8?B?TE1ZRnU4blVjOS9HYmVMZm5DOG9Ccy94ZmNpWVgvU2J3QlNmdDlHWjcxV2pv?=
 =?utf-8?B?dVBCYXpGUnkwVWpLZkJGSmk0UEphdzZBdEF6ck4rc3hJcWRzSXdjNE95bzNR?=
 =?utf-8?B?c2JlV2VSRjE1QndubWQ5Znp4bjduNmVCQ05TL2oybzBPc05jRkplRzdKdWcr?=
 =?utf-8?B?QUoybDBLdzlPazNBTEpwRytCSWRBV1hWZStVMVh4L0hVeUZpRnNrMEtEMnlj?=
 =?utf-8?Q?CejKDRlblED0GJG5FCR7bZ/RU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655b38d3-77b7-4cf9-e913-08db6352f882
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 10:20:21.2675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAeCWEGNOZUUbsk2SdethQJ0EVlU1wIPKSFdon4LFuVUM+/0O3j0N4oOfqgniGo9+tYqzjChNs6Bkp/iMrKeCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7430

On 01.06.2023 16:48, Andrew Cooper wrote:
> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
> predictors when empty.  From a practical point of view, this mean "Retpoline
> not safe".
> 
> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
> statement that IBRS is implemented in hardware (as opposed to the form
> retrofitted to existing CPUs in microcode).
> 
> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
> property that predictions are tagged with the mode in which they were learnt.
> Therefore, it means "when eIBRS is active, the RSB may fall back to
> alternative predictors but restricted to the current prediction mode".  As
> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
> 
> CPUs are not expected to enumerate both RSBA and RRSBA.
> 
> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
> linked, absolutely nothing good can of letting the guest see RRSBA without

Nit: missing "come"?

> EIBRS.  Nor can anything good come of a guest seeing EIBRS without IBRSB.
> Furthermore, we use this dependency to simplify the max derivation logic.
>[...]
> @@ -532,6 +541,21 @@ static void __init calculate_pv_def_policy(void)
>      guest_common_default_feature_adjustments(fs);
>  
>      sanitise_featureset(fs);
> +
> +    /*
> +     * If the host suffers from RSBA of any form, and the guest can see
> +     * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the guest
> +     * depending on the visibility of eIBRS.
> +     */
> +    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
> +         (cpu_has_rsba || cpu_has_rrsba) )
> +    {
> +        bool eibrs = test_bit(X86_FEATURE_EIBRS, fs);
> +
> +        __set_bit(eibrs ? X86_FEATURE_RRSBA
> +                        : X86_FEATURE_RSBA, fs);
> +    }
> +
>      x86_cpu_featureset_to_policy(fs, p);
>      recalculate_xstate(p);
>  }
> @@ -664,6 +688,21 @@ static void __init calculate_hvm_def_policy(void)
>          __set_bit(X86_FEATURE_VIRT_SSBD, fs);
>  
>      sanitise_featureset(fs);
> +
> +    /*
> +     * If the host suffers from RSBA of any form, and the guest can see
> +     * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the guest
> +     * depending on the visibility of eIBRS.
> +     */
> +    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
> +         (cpu_has_rsba || cpu_has_rrsba) )
> +    {
> +        bool eibrs = test_bit(X86_FEATURE_EIBRS, fs);
> +
> +        __set_bit(eibrs ? X86_FEATURE_RRSBA
> +                        : X86_FEATURE_RSBA, fs);
> +    }
> +
>      x86_cpu_featureset_to_policy(fs, p);
>      recalculate_xstate(p);
>  }
> @@ -786,6 +825,20 @@ void recalculate_cpuid_policy(struct domain *d)
>  
>      sanitise_featureset(fs);
>  
> +    /*
> +     * If the host suffers from RSBA of any form, and the guest can see
> +     * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the guest
> +     * depending on the visibility of eIBRS.
> +     */
> +    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
> +         (cpu_has_rsba || cpu_has_rrsba) )
> +    {
> +        bool eibrs = test_bit(X86_FEATURE_EIBRS, fs);
> +
> +        __set_bit(eibrs ? X86_FEATURE_RRSBA
> +                        : X86_FEATURE_RSBA, fs);
> +    }

Now that we have the same code and comment even a 3rd time, surely this
wants to be put in a helper?

What about a tool stack request leading to us setting the 2nd of the two
bits here, while the other was already set? IOW wouldn't we better clear
the other bit explicitly? (Due to the EIBRS dependency or RRSBA I think
this can really only happen when the tool stack requests RSBA+EIBRS, as
the deep deps clearing doesn't know the concept of "negative"
dependencies.)

Similarly what about a tool stack (and ultimately admin) request setting
both RSBA and RRSBA? Wouldn't we better clear the respectively wrong bit
then? People may do this in their guest configs "just to be on the safe
side" (once expressing this in guest configs is possible, of course),
and due to the max policies having both bits set this also won't occur
"automatically".

Jan

