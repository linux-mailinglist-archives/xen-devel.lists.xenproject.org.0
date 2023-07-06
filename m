Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3EA7496D3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559699.874948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJn6-0002Gq-Dv; Thu, 06 Jul 2023 07:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559699.874948; Thu, 06 Jul 2023 07:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJn6-0002E4-B6; Thu, 06 Jul 2023 07:52:40 +0000
Received: by outflank-mailman (input) for mailman id 559699;
 Thu, 06 Jul 2023 07:52:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHJn4-0002Di-KY
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:52:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 127f2fce-1bd2-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 09:52:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6769.eurprd04.prod.outlook.com (2603:10a6:208:17f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:52:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 07:52:34 +0000
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
X-Inumbo-ID: 127f2fce-1bd2-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb7+DR0s9cWBhTPuWubiAYthWiHjCzXSzvJJqSG3zhp0//hN1wF0AGYFsoQoFokar9pgYb2sVptIacavr1QlS/Czb0jFJBGohXEn5fCahMGgpRQCcqwh1HFJg4KjAMp6KG+UTX9pjcgTlZt5fsF0WOTo+Z1RduDtynYwC0txQpTq5G6DgQcIvpFEMGXB7hFMf54ilUEGW3XKyzkb2x+Bie0YbwobamnNKzVEBBdGiCW/6xCWRtE6h8jS5ewMtZkYwVRei4h1Q2zKGelNyCfOyKvGSIjDMH1mkaMlgj3w4OhehpBwp96wfSJjK/GVOw+SdCS8WxUQLrqWAwxOxGU8ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNVcBEloDrmt0iivkfMlGV5iUJfAo7HKrQy9dejK0tg=;
 b=X59rieXMTUlz1jPJt93APonCsIIj83+2tUIMu+2Jo0lmFVFB99Rpdo0OfCcpGPkAA4y5U3eS85zktqPAuiA65ynZRSMyb/5Tzq5NN7kX1fdfrp53i8N3aCLum/DHRgPHE9a9nqTrqfGo0UvD8AQ/WQgWbkUGyd0IEVtRa17u898koXSADBFPcjnSm63dbE3wF+bRo1Zo8rV1d5TFBcS2pBCnwsvJFUcVR+Sl053HZH3hTbqdSCq89SwyF9q8xkw5+d9nOzN8E/xRKCaV+iVZBZedfRE9gh2KoBWutwAj0Jc4sZldWPAAeR7gI64rueNQ9VHeCOjAQMMmkHgdCezrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNVcBEloDrmt0iivkfMlGV5iUJfAo7HKrQy9dejK0tg=;
 b=0180pSLdxESxnLdQkHPJGTfn5lBcQ5ZiaV0jkbBQteYfRWBuPx8GygCTo1aFCIjr9WUzlL3GJpxg6phhovrJPkiKN/YNETcJvyKmkGt01bc504P6j9Mo00pzTNEe0sxAbSIuMR0A4C0wEjCd3rilsrKqmj6z2kSMlktgjD6G6fqjmblQ3fIMxz1SF/cecqcacoqUasAPkTJ9noIS4hzlg22PewW4RsCGEkhjqZJw2xO9ZmcV//AHgXYxbbZyrZDadjq2125fKdDsaqZyder5IFfzXqIYzNZ/lhGWmIcWK6QxqqAvF0E2xpRGgwP3AZCE+1w7J0hEGMu45o+44lCJzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4818b88b-10d3-b55d-cd6b-e40d1f2995ff@suse.com>
Date: Thu, 6 Jul 2023 09:52:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 03/13] x86/svm: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <015d7c13dc4e1b481abb23a3eaa254e316b7ca53.1688559115.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <015d7c13dc4e1b481abb23a3eaa254e316b7ca53.1688559115.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b1718f-d6a6-4b1c-9e4a-08db7df5f5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rDPrs1Opkqx+I2hsbXCorqiIB2rwFm5MGV1pibYeFjFzNNQcAdWBC68TG4VkDyf+iOn8pgjD3aJglh5aYC2ndhcbEwL7O+8m0yKwXIzKZLwjgRdHdNLo7lYWcB+MMgsoEBbjEE/WTF3QdyWfevWXRjLnQCHIPERW20JxfJphmaz3WZM5EqE8vWsPR4uG09VtNLXKyAg5TD6jR4p8OZXAue9vz0GMccjWv5siADPIAdX0fL6nTFsKLCFwfKHCRGB6p9lm7d0j0KYjalZUOf3esNdVyeh5W4QW18uCp/cxAhOKeQ3EhIOGIFv0GOSuEQBGGbBEFLec33oEOKqGRtoAu1riPQMqapgmj1PCq/MoX6/FGY0vHM/iGglYl0C1g7gvtE70r5vlXg2fWHUYcnWC5oyO+oUaWJU2h+Qg2YVfYkMj2V4bsmiik9jWSba/nAaJRaWBGwsyXGr5kVHIFlowRD7DhxHGQat750i2diOdwdVsBv098/sGZCkOU9Qn2qjGev0Gx/3lzGilRm2H4GQmf0QqFXA/3WaC2p5jHdYsZ4IrjIgQA1uLYrO8/5tTUd0K7YQGtWHwWqw8rZEdWp6EJUEwItFb7loPx0SmY7BDF2isAmyx0GCP31g0hHoqMrWeZXrP4IFQQ7DLQYLDzs0Btw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(31686004)(7416002)(8936002)(8676002)(5660300002)(41300700001)(83380400001)(316002)(2906002)(2616005)(66946007)(38100700002)(6916009)(4326008)(66556008)(66476007)(86362001)(186003)(54906003)(53546011)(26005)(478600001)(6506007)(31696002)(6486002)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUFRKzJFbHkzNGlQd3JaaEl1TGcrUTlBWjF3c0huK1k1cDJSQzM0OVVNbUVT?=
 =?utf-8?B?S0NJdXQzaVZSa3NESW9MSXBDSys0NUxqWk04dXJHbndVYTNoZ3c2ZHZ0akhv?=
 =?utf-8?B?YU1vWTUxR3lvOGtCZ3VTRE1OWU1ENGV4ek9KV2F4ZU1rNTdKRG5rSlpuNDRv?=
 =?utf-8?B?b2ZsVWxRQmhIWk5JNldHcjFOa1hOYnMyTDMxZnYzVjJJS3pycDJQdEc3V2RL?=
 =?utf-8?B?TFVxc2Nla0NYYUpnbElZMlRrMGJNbXhFbVdIdHJpdVFTK0FlVzJnTERKWnBH?=
 =?utf-8?B?NGZWTTBpUzdNWVNMUDdrNGd3OXpNa1lvNmM5NmJLRWNkaGluTUN1U2NlVDBX?=
 =?utf-8?B?cENoOGZ1Ly9aeFJrQzNHaUpZazdUU1VNTnZoZ3VhaDlGZDY5UVhmN2orRWkz?=
 =?utf-8?B?bGNlc01pUjJ5c3lKMlhrTnV6OXV5Y0pqVXRnUTZRVEJGVFg3MzlBaWtRZXMx?=
 =?utf-8?B?SHdtYmpUSFN2dVdRZVhpWmpPbWpLOGxXeE9TSFU5dS95SFpGUjFWTVhUMHhr?=
 =?utf-8?B?RXRjdzJpcTV0ak5GQ3JzWmlmQXhpcW5YeFV2TzN6WXVSYng2VkNUNnpMdHlV?=
 =?utf-8?B?ZWpJdU5ENDluSlVUb3RlbUxFckhYSU95L3VjUUV4NmV4SDVCYXB3cnM2V1c5?=
 =?utf-8?B?WUdaaUJKRlI0aVUrdlNIdzk0czBCa2trOXl1R0x1S0JhOTA3Qmw4MFJObnFR?=
 =?utf-8?B?djVPblJLWXljZ1BrRXBLMldnNWZaWjBDTGVnYTlMaHBmbTd5dStmeWFmUVQ4?=
 =?utf-8?B?dGYrRitsYUx2UzAyLyszU2ZXbGk1OGw3TTlrSDJUcUozclk2eC9TcHN6Qm1H?=
 =?utf-8?B?c09vbDI4L2M0aEN2bk5vU3lTeEZtbGp0dUdnR0M5MXE1RlVmTWJDYTFNQnlW?=
 =?utf-8?B?OTVhREJoME9pVjhtcDZSVkNBSnVYNzc0RDVuY1pmOHdEeGsvc0VQMzlkbVhO?=
 =?utf-8?B?WExOdndsLzRrRVhsVXdIOHRwUlAzalJsMFVHdnZDU01zcjROYlRLRlFZM3Vs?=
 =?utf-8?B?NnZNdUt5c0poam5nT05JVnFPTVZ2cWdOcGw0di9zZ0szbzRIQkJQUW5xTW41?=
 =?utf-8?B?SVFhcUlScC81RGR4RTZqNnVsWTdGNmx4NmlsK1J6RjB0NkREZXQ4WXh1K1k3?=
 =?utf-8?B?VTh6VXh5K0xIVGFtRk9pbktNb0VBME44U2x5aU9pcVRFaDlPNVpjQWltWStm?=
 =?utf-8?B?bXBIVFh6SzU5dzJRc0dsaGs4OUV4aFJGVUZKaWMvalhXUWRrcnhKcm9nZXFG?=
 =?utf-8?B?dzlCOHdWQmJzT3Q4dFloQlFrbFcxMlMrb1hOTFhVb2FiaXlFVlRwUEtXNXR5?=
 =?utf-8?B?NFBEV3N6c2NEdncwYTVHMTBUV3ZlRmg1YXZpcE5HbGFPRjlrMk0ybkhJKysx?=
 =?utf-8?B?T3JtaWdtZ1RUUi9GcXlwWjdka3FPQ29INXFGdGRsOHI2TUM0OG9HeGpDYXRv?=
 =?utf-8?B?VkJObkRaNUN1cy92RGxoUVVROU1ML2JQNW8zc3NRdkRtejNUSzBZZE5xTWxw?=
 =?utf-8?B?VUQyVXVJWFcwZEVubDVNSC9LTHpuc3Iva1E4bTB6bDdhT04rWVJ6UWkyM3Nl?=
 =?utf-8?B?aG92b3ozUjJwVzh5bHNCbTJTWU1EZFlUeWNZekRkOWFJNk8wQUJGT0dtTUVs?=
 =?utf-8?B?V1VIM0dCQXVkTGVXZUFhaERNbVN3dHZ4NStONmEzaVRZbDY2cDQxcXFLSHFi?=
 =?utf-8?B?UUJCMXdaQjVjYmw5cFZFY0h6VlVZNFBoWmdnd2Y4NnhZV09obTJmSHFjalB3?=
 =?utf-8?B?NTRvek1hb1hGVElhVlhaRVd2Ynhmeng1bWsxb3o5TDh5dnlwRnREZGs3VTFj?=
 =?utf-8?B?MEZVM1loL3EzV2FidDIzKzdDYk00RXhIR2xOSVRpS1JwbFZtM1VWRzFXUVpi?=
 =?utf-8?B?Vk9DaktRSVE5clMyZVF0dzFNelZxcGdwU2wwQ2tncHJqdFlDYmdIOHIrVXdj?=
 =?utf-8?B?VG1xVlNRdUhqVS9UeDBvZ0grNFlIUmMxT0t6bmR3UkpBYmFNSzJuYjc0Y2ky?=
 =?utf-8?B?Q0tYd3FGcTdrT2lZVzIyS29xbmUwTERGQWswQ2FnQzhoUWU2TXk3dXI3eWxN?=
 =?utf-8?B?KzJ0K0xKZFhJdVZzR2ZIenJtWStWUEVVM25EeDdyQ05LUHZzam05NUlsb3hZ?=
 =?utf-8?Q?Y6mpPqTijudKgUbQ2WctPMq3o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b1718f-d6a6-4b1c-9e4a-08db7df5f5c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:52:34.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h4tyjXhLyHRZ2a0i58tTrgYJQx1h9MzMATYWvnTDTCnY2YJZlQfwEdwfaEEof4MAtzHEmaTYOtNSuRHFYbDAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6769

On 05.07.2023 17:26, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit ...

> --- a/xen/arch/x86/hvm/svm/asid.c
> +++ b/xen/arch/x86/hvm/svm/asid.c
> @@ -16,7 +16,7 @@ void svm_asid_init(const struct cpuinfo_x86 *c)
>  
>      /* Check for erratum #170, and leave ASIDs disabled if it's present. */
>      if ( !cpu_has_amd_erratum(c, AMD_ERRATUM_170) )
> -        nasids = cpuid_ebx(0x8000000A);
> +        nasids = cpuid_ebx(0x8000000AU);

... I guess it would be nice to also change A to a here, to match ...

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -269,9 +269,9 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
>       */
>      if ( msr <= 0x1fff )
>          msr_bit = msr_bitmap + 0x0000 / BYTES_PER_LONG;
> -    else if ( (msr >= 0xc0000000) && (msr <= 0xc0001fff) )
> +    else if ( (msr >= 0xc0000000U) && (msr <= 0xc0001fffU) )
>          msr_bit = msr_bitmap + 0x0800 / BYTES_PER_LONG;
> -    else if ( (msr >= 0xc0010000) && (msr <= 0xc0011fff) )
> +    else if ( (msr >= 0xc0010000U) && (msr <= 0xc0011fffU) )
>          msr_bit = msr_bitmap + 0x1000 / BYTES_PER_LONG;
>  
>      return msr_bit;
> @@ -2539,8 +2539,8 @@ const struct hvm_function_table * __init start_svm(void)
>  
>      setup_vmcb_dump();
>  
> -    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000a )
> -        svm_feature_flags = cpuid_edx(0x8000000a);
> +    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000aU )
> +        svm_feature_flags = cpuid_edx(0x8000000aU);
>  
>      printk("SVM: Supported advanced features:\n");
>  

... other (similar and dissimilar) constants used (and adjusted).
I guess I'll take the liberty to make this adjustment while
committing.

Jan

