Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609B6672F5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 14:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476145.738168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFxMN-0006Qj-2z; Thu, 12 Jan 2023 13:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476145.738168; Thu, 12 Jan 2023 13:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFxMM-0006NW-W7; Thu, 12 Jan 2023 13:11:10 +0000
Received: by outflank-mailman (input) for mailman id 476145;
 Thu, 12 Jan 2023 13:11:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFxML-0006NQ-SJ
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 13:11:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2046.outbound.protection.outlook.com [40.107.22.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fd9a662-927a-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 14:11:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 13:10:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 13:10:59 +0000
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
X-Inumbo-ID: 8fd9a662-927a-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsEj8FBMnPzSm+X7RHzWq9Ui07w5qduz2StPOet9pvZeYATGdqrYqcdd2ajcDp/RN3zmRL7sRO91eu+RzgsJCeILCF9CDv1g7ohRxL3jC+V2X3LyYD5zWvGmoW3wN7AfCm0yp0QrDTft5Yx6fTHFMiUL4KREQYVU9G7Ilgc7sa8IGYDcpAqv6BXX+fiy9OEgObmaeXPN0nHsnHUn2CwVQqYASJzEFYJgzOoPZJcQJAGCxct2Uek4hVeNlTUkacS7dskik4bf3CVTknEEYDlWjXYlwdT7qvmnn5lj3+8GfV3PV5O6NTRR5aVfuv4pWGF57FcsABxJBFMOdkDiWTRAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8pvCEsvK9DpiCgrrDOLt2avq5yLrFutttlavfM94sM=;
 b=ejICGx2iUpleIm22rl3I8wReweV4VPHxr8y7hbifV2jVNHYBKIiwRoWKGWdqnOHf7574Hv5lnydXtHSLSe0bYqYkb+P71Ae4tmHgbqiO1gQA+tvPO8WBrEBAi/Dw/f0yb+uZZCRxH+Hif4M/Zb72xFvZv17yRHEsr4fAV7GjBzVDe1kHtSuSdcQSrntebGcf8QDHIyMrtZLVm3sTq5Nnwk1aH/xGneb9nvByt91GtxBTrPjCGfsHh20AnDApDN3akjTB2XyNIuDjOoaHdlKxUrAWJk2zhYPvgvLjmB6w6cOROAfiDi93fQBq6145mcs39lgSFGLYkHdofngNSLldfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8pvCEsvK9DpiCgrrDOLt2avq5yLrFutttlavfM94sM=;
 b=LMegPTetlWDlGmug1H9BtNzMomCE9PVRL08RkmupY7y3BemrPLRiVPbPLWgXvdBweGuSS7kbsDySEUMbqhuZ9xEgB3EhK2rQN8JV7jFf2JQ243yHgeZxOGNtNqy/WTXLTgMoFu4BkmBGeSCCzbnc+MVMBI1cj5yYUiFxKsVtNou2mOTsi1lsVvd9ot0C3y02s1ERcizppBxA8b8ZIfRn4Sc03C//G1MClUJcVrRQnkt4KxEylFOMTgptJupkUIr6TX9JJDWViCARk4YUeP2bvArQAFFiHlhbUIisaYk9jVgcIh0IjXWLDiCSyhouy2vo2zywCgWnN4Mqq6mUJE3epA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af2b74b2-8f37-223c-b830-c2bb3bc6d467@suse.com>
Date: Thu, 12 Jan 2023 14:10:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/8] x86/hvm: Context switch MSR_PKRS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230110171845.20542-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d6084f-7bd5-462b-cc0b-08daf49e72bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YjNWOzP9YMJRrJDrbSyr4UiC1qbgX1Rh45W1uPLWzHm0zhwsADHJUzX1PwbDRCF1EujubJZZmEDeXVrIHD5dj4lro3xDb6bIsJonEXOKl90U3I0uz8p+bwXN8mSKBB6ddVipDozgynY3/nq05xix4jR8xpTDBoJPs0RzRqIPBZNMf6+EwVZe/LtBulo4Veua/tnXRyy72XypcMvg0PR2DGMtze5wsiJQdyOfzq0BHxZDQLDCPdAWXZJqKEymOPdZqyFccFDb+IKAiYtuSVTnyNxzV8BY7Q4b8g2ZR+9SJko88iEOgYlI5DcTXhxur8RIFjLWfm+hJDkvWBnDGu8Oivbt/KGk/BfMA+v8aCkF38T+IyiCnE9FGZ7iOEmxPpwIViOsxm+WiEmWXKfxzBxMlxPNlUzcKcbdt9HqxxksM3xwvf1/xEpkDH2+1JHOpekLoy2aiUWQT1SU8/Ds5ehjD4NKr4BiD4akDIcW6CF9UGmIcNMOggba52qPDVN5YncEqVswHq56bGB5fqyUO43zuwtmnGOMcW5TYBTOmx3TvjaqQQymjYO7dzB8wO2j/pbwIFMPIHGQC9TcL1+Wir8HjGu+g1HSH6UtgJbxLqpoKDtfMDPk9S/1t1DuQtVcPS7dYeOsDsKvLMBKY8k54C5trn5xhZZnqD42y5KWTCr8JFEB68QtaJFrsZcFdTiZ4MZlPQrF4L8oCfR+BXXvDLECWM8M6TL0rjKcKHIzViw4g3s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(53546011)(31686004)(2906002)(6506007)(6486002)(26005)(478600001)(6512007)(186003)(8676002)(83380400001)(2616005)(66946007)(36756003)(54906003)(316002)(66556008)(66476007)(6916009)(4326008)(41300700001)(38100700002)(31696002)(86362001)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlgvTTEzOEZxcHFXTnNhZU1qWmVCcXZmSFJzOWNsdmJhU2hzS1h2dzIzMEtO?=
 =?utf-8?B?OUEybXFLb2xBZTZ6ZzlhOGlSc2tnUXdOUEVtYnJYYTF3UTFmdWFNQlJxNXJW?=
 =?utf-8?B?UEIxd2dsWEZ6Vi9aaTFhR1lKUzhqaVdmSkZTT1A4SWZXazRHWndLU1FjdHVK?=
 =?utf-8?B?Wms5QVpJQjByWGdUZ0pPbW5pMC9KUzQrdVpEM2IrcURta1hOaDZ1TUVaL3Nq?=
 =?utf-8?B?YkJEanZ5OWhLdEVaeFdXTU9Wam9XSGtvTkdSMFFrVzlucVFzSEpXTnQrVUZN?=
 =?utf-8?B?Unl3R21qZTNYTWJXQit6QU9KVFh2eGhVeXV3K2hISnA0c2xZcG96ZTFneW5I?=
 =?utf-8?B?VVdRd0dvc0NPQUhkdUhXVkIyUyszVUpJQ0JZUzNZUlhaaDZUL3dBdnBGbGRL?=
 =?utf-8?B?SmFDbkJ5ZWtxL2F0YytFQXpCVG11WFVIRVpyK2ZUdjAzd1BhbXRqTkNJSHBp?=
 =?utf-8?B?U0tUTm8zRVpDZkNhdnZodmRTRkpuc0oySDV3WDhrVi9aMEFyUVNQOFBsUWp0?=
 =?utf-8?B?NnRmeldjUzB5MmJqVldjRG0vNnZzZmZjVnI5dWt3OVF6Wk5RencwYWdnL0Rm?=
 =?utf-8?B?ZlIvTHllblJsT0xTT1pyMFgrMW94YTF1TkFwMWtlMnNsNG4yK1c3cnFicldO?=
 =?utf-8?B?Z0JpSUpTNCtrQUhFNFptbmNxVXhuQ3pXVjlPN1MyUFB3RVBDUW4wQjVJc29j?=
 =?utf-8?B?WUxKVnJ4NjhXb1ZqcmxmNVE2U2RYdkpORjhvdHVsYllCVThWVW1OeUw5NVBX?=
 =?utf-8?B?U0lYZ0pmYUhxRW1yakUxeDRUb3FvTjYrOGt0aFpmZmZlV09md3J5eEduOVJk?=
 =?utf-8?B?K2dCdTFNcmVmNi9yVmRUNlZBYWhFNVFyNE1nOVpSblZhNitKU0xoc3gyUEZk?=
 =?utf-8?B?OG03ZERQQnZmdXNZbGFPbXIrN1JBSWNOQkhUQnBadVFncy9yQlpFV29Kcml2?=
 =?utf-8?B?SVJMWFlvQkttRDVlMVFBWVQwTnVQekpacnZOSnhBSjcveEhvOGhhQ0pyOUpj?=
 =?utf-8?B?MTNGcjB3c2Flb2VwMmNyK2R3TTh4S09IUVZtRjNoemZ3aXpoeTYwR2c4bzc1?=
 =?utf-8?B?NEVWOTZjaXlsLzFOM0NRVkhBdkJwdzNxSEtZeXJZL0Q5bTM4YWN0MENRL0p4?=
 =?utf-8?B?QWZkRk5oKzRkV1FyZ3NYeFlvMVhSTTJzYnM4cVpTYWY3Tk5ZcUpTQTdSdUVH?=
 =?utf-8?B?L2NoS0xUYU5oc2tLWStSOVc5ZGtmN1h6cS9RMFZIVnQzd3lRaHlBSnRHNll2?=
 =?utf-8?B?ZkdiQjV2anhWQnZGZ1RWYXc5QXVMQTd5TSs1OTFUQ3Y5Ky84MVB1Nll3QVhh?=
 =?utf-8?B?bmljdHhqOVRFaHJmWS90QUYyUDV5QUZJaWlmMHFrdzVmSkZ2RCtHY2dtNFIv?=
 =?utf-8?B?bG10RS9UNGpzZURoeUdEa2RrOUZUQ2ZIK1Q2d2Vqc1V1cUJOVnFZRnBJWWdw?=
 =?utf-8?B?cENLN2lLMi9YVEloWkV2cnQxaVZjNklDS054R1VucTM5T1RyanRMYm8rYmdy?=
 =?utf-8?B?a2ZUNzloV1h5UW5JN0cwR1lVRmtyT251anZ2N2pwck5zWHBpQ3gxUEVnaXcz?=
 =?utf-8?B?ekc1ZFBNeHRpeTJVRjVteCtLbUZ6eHV4TWFZNmRLU3pvdlY5bEpnRk0rZGFw?=
 =?utf-8?B?Z2hSNUtuMWwzbnFMYjFTY1J4Q0QvNGk0SnVDcnJ0bGZaSFoxOW9aMXJ3MVpC?=
 =?utf-8?B?VTlLTDhrbUoxbzNVWkRoU2Z4TExVaEZtVUQ5ME5jWEJpWWd1cmpXTCszMHVR?=
 =?utf-8?B?Sk9ubGV2SUI1L1FvZllRTHNUWno2ek9NWkZydHNmTXJmdzB2Nkk5K1FzbWVL?=
 =?utf-8?B?ZC9UMjVmb0ZOc1EyL3MyV2t4L0Y0NXFIWjk2aU5Fa2hpbkVGNjZWdHpLNitO?=
 =?utf-8?B?UWlZRkhmM3pzRFQ2NmdENkdNdDlMOEVWVHNPOGRzVm5DZk1zQVkvRThldS9t?=
 =?utf-8?B?ZDdiUnlhYzRhSVMxU3RnVEVnbTZQaTRPOTAzc3ZRK20yYXk0UFJMQVRad2ZZ?=
 =?utf-8?B?elo3NHF1RWpGRno0ODBpL21VeUt6RDRPQ28xaUxSRTZZQ1lJNEFXcVZjTVpx?=
 =?utf-8?B?Qit5WFJGcm5Qd1NJZWZVTk5PSkJUeFgrTFMxSGxHUUxjbStBYktnOXg5Wno2?=
 =?utf-8?Q?+O+wBWq2EsQQeHLbxD70lX/KJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d6084f-7bd5-462b-cc0b-08daf49e72bb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 13:10:59.4672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pi7mg7qTRKVFM+6T2EL1e/u7UxBwOkPFXZqO+7y2WsHZ9uWeG4hylSKW1ty9WAEqzemQIeHzCuwoD1+yDM/agA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

On 10.01.2023 18:18, Andrew Cooper wrote:
> +static inline void wrpkrs(uint32_t pkrs)
> +{
> +    uint32_t *this_pkrs = &this_cpu(pkrs);
> +
> +    if ( *this_pkrs != pkrs )
> +    {
> +        *this_pkrs = pkrs;
> +
> +        wrmsr_ns(MSR_PKRS, pkrs, 0);
> +    }
> +}
> +
> +static inline void wrpkrs_and_cache(uint32_t pkrs)
> +{
> +    this_cpu(pkrs) = pkrs;
> +    wrmsr_ns(MSR_PKRS, pkrs, 0);
> +}

Just to confirm - there's no anticipation of uses of this in async
contexts, i.e. there's no concern about the ordering of cache vs hardware
writes?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -54,6 +54,7 @@
>  #include <asm/spec_ctrl.h>
>  #include <asm/guest.h>
>  #include <asm/microcode.h>
> +#include <asm/prot-key.h>
>  #include <asm/pv/domain.h>
>  
>  /* opt_nosmp: If true, secondary processors are ignored. */
> @@ -1804,6 +1805,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      if ( opt_invpcid && cpu_has_invpcid )
>          use_invpcid = true;
>  
> +    if ( cpu_has_pks )
> +        wrpkrs_and_cache(0); /* Must be before setting CR4.PKS */

Same question here as for PKRU wrt the BSP during S3 resume.

Jan

