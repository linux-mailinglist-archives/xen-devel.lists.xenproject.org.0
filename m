Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73C7D7DCD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 09:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623540.971462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvv3k-0002M2-8v; Thu, 26 Oct 2023 07:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623540.971462; Thu, 26 Oct 2023 07:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvv3k-0002JO-6D; Thu, 26 Oct 2023 07:45:40 +0000
Received: by outflank-mailman (input) for mailman id 623540;
 Thu, 26 Oct 2023 07:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvv3i-0002JG-Ki
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 07:45:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a61e2801-73d3-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 09:45:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7170.eurprd04.prod.outlook.com (2603:10a6:208:191::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Thu, 26 Oct
 2023 07:45:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 07:45:33 +0000
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
X-Inumbo-ID: a61e2801-73d3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWXBWYyIIShx22jUSjnoXnab9lNuioRKjq0SJ/aNhCixkvQ3TtJmM01sKUxzB4fMgWL3dtwPyKeU/561cXROUlsl0ZDlgV0rL8L+xmKqvvu48Yf5h+sWs0h/7f2d1X5iQ/cNM0vjSJr53fJnTJGXekaMtIFNIsCLM1iodxhPC7E+QNf7IOauxkpWAot1rfvljR8QduzvCOl8qYhLbnVBGFfx0PjxjEgoo0DVkmu1Anhc1X/Tl4W5q5GMNzif1yX785tu1hhZGUtdpOmHui8bhmsHh0nS4i+77E+oSSv1fiNojqnLLp8mBjhMHBOqzMVLVtRX59NjeyoQKT6b77LRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGVaZJl990xqzRXMv5PLviGMafAstKUXR/YKeKebAIU=;
 b=Oa3hHomwt3Xmhqq/MZs+osVumwemM8IHRCTyQLoz7ODNF3x1XPEIh+Z1POg+fNdRFWC4FyfWEPs60QDTxLJFkYouJDh/8T3oOjSlQ9mNsG92qOMdZ39KfYcSXdsNiICCUzY6n0EXjiy/qcNC+XT9KSD3m7Cs0bVd1JQT4E351zyrjlaOAW2G+ccnLKTM6zGdt2UdTbnPCqPRyBsJQX4G9mywh6/b/uEeh/n/f5+awi5i0i6lPByivVUK6tdckocTbkhXnngb3kKgLjmQjDk9HsuJeqxpMf2l7tBqSwK/QhamUf8u5FCvkcIIEEVYxFg1f6BnVKm4G38KkEmd5F/1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGVaZJl990xqzRXMv5PLviGMafAstKUXR/YKeKebAIU=;
 b=zmacOzp6AlXuXio5CebjIOPws1aYbbmYw1m2jyoecJDLcOdhTGn0XTV2btDaYupvtDoWofuF1W3pmKHFK2WihSTGhHNIpmtWj+NGPKAVZzu/unLy65CyCYjx61al+3El6DNtPra6G0gY2Bgs5oc8KpwuMt32Xc9V/AzP6j9gDcSaMFJriZIoqDiivMAiL2AgAFkHBUvPDUizCpmdknVmOQadUE6SEFlLQ1ApQWmMsC2d/7BIsYB3ZZ+jrEFVHmn0ZiCSm6SQRtncLmYyfLhc3qp7O1G3IBg2Y6g0CYF+ZNlYB9AjkdLOS/E47QBmDkaEoyIiwW3Xxci85a3vfqld9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af70a4b6-0bdf-e6d2-80ae-822a273573f9@suse.com>
Date: Thu, 26 Oct 2023 09:45:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] x86/ucode: Move vendor specifics back out of
 early_microcode_init()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
 <20231025180630.3230010-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231025180630.3230010-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e37b2e2-4c5b-4042-c009-08dbd5f7892a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dxmwkqy8moNZqCikTa4TXy98XLgeqdvxYvR2yJhHYi0cpXW7WHvrtDogDfDRnQ9JFXwBxuAYmRexpQ6EWIRST6mO+SAm+EEQ/DkK8R27KH3VgH4shTgPsGxJwQQOTOy7Z3W0jelFtc+dmXfufKuapJebxllkDCeaYSQDDAtCn8MW8AohoAvYzSGGdrVtvBbEeZqF6u6DysTAbgmmH61lsokm2fdagSxk6TUt184a9eanj/gk6payL92pyFlrtXShysmkfG4DvHZvg+ae4Jk3u+B9NhArlfqAEJkm913ON/TmJELRTwo8uIcGBqiIB3ZZ7uE89QZD6fOXdMmiqnhXaNQSUu02eGZesUiJLVKOAXT1YmVQrxKB7CF/Seg30p/EJxa1DYyqFNyYfpzNM4btjC4K6L9Ayp1YPrHVKImHBKhqYibSYJ7LDeaX6tUjYOav++YqF1mHQeMrmO89zRGix6BZbQSIiXkvL5uN28SpDNyjiUGxFeca66li1dIzblztBwAlf7RrBt8LrvB4i7T/e0IQ48Iy6+jzy0zbJCzxX3nc3JDls1GgcJNZnWYUYoX6uGC0QNW3ebn7H2slCUbimIsUbaXZO3lq2HgUSrWf3XZoSvWiilSaX+zkDQedSqS7qTNrQrBhQxG4+U/jBCV4CA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6486002)(6512007)(316002)(6916009)(2616005)(38100700002)(6506007)(26005)(53546011)(66556008)(66476007)(66946007)(54906003)(31686004)(83380400001)(478600001)(8676002)(4326008)(8936002)(41300700001)(5660300002)(36756003)(2906002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FRS1NuRGhJZWtNdVFESDdBRmFxNDhIaTIxMUt3TXRPM2JyVk81QVZhMmMx?=
 =?utf-8?B?RTk3RW1FSUFaQ0trV2pjK1hvRWFIN3g2ZnQ3Ymh1K21QQlp5WUV4cVZrRWJi?=
 =?utf-8?B?LzRYL25LWERpdzhiSkFDQ2FWSFd3c2xsN0VNYkhicWQ1TWdYSm1vZnBWVGZt?=
 =?utf-8?B?OE4yR2JGZmJ3ZjFQd0J0VVlISVo4Z2hBM1ljc01vZTdpQ2lBSFZJTStFT2hQ?=
 =?utf-8?B?d1huY0NrcWFaRDZHTGFBSkNNano2eUhwYkVIczc2V1V5a0E5NVQrYUFUZERy?=
 =?utf-8?B?eDlTUlhnS2JtcURwOUVRejBlSjlwRUJpTUxsaEF3K0d3aWVoV2VjaHFZa0NO?=
 =?utf-8?B?a1ZOd0c1RHBlWEJ1QWxWVGlQalRDSGNEREE3RjJlQ1B3VDFkeTgwNXNrVFpE?=
 =?utf-8?B?TnFIWTQ4NVRqdFFvUjd6eEpwb0dkMGV2Nm1mbzZ1L1liSkhENXJXYVlMNzFs?=
 =?utf-8?B?bkQ1UEJRUVBOaDV5SnlibFdGM0lGNnA4M3BHVk1NdFlOd2lqcGtydHBHVWJC?=
 =?utf-8?B?Z1J1bmpVY3RxSW9nVFlqZ3E5SldTeW9Bbi9GODJKeXoxN2RDM1FLWGNxT3ZB?=
 =?utf-8?B?QS9rK1ZqRlI5eTNuYUVYdlpobkQ0cHlaRGEzWXVFTDl2eU9qMFEwSXd2ek5K?=
 =?utf-8?B?N2FLSXQ0UmUrcjM5S1NjTjVzYkNBd3ZpKzVnRjFmcDdva2tJeitRM3M5VmFp?=
 =?utf-8?B?WlFjUS9jMVlIZko4TzcyNUxrNmpCaHY0bEQ3ODJZcEJUcXVOUFpxdWQ1SWJU?=
 =?utf-8?B?VFZlQVZCUC92NVJtK1lsUzQ0aXloNU1ndXZhZkthSW5sTmYwcHdManlDbnMz?=
 =?utf-8?B?a050bTZHREVVT0dicUMwNlQ3NjJSUlNRN3dFb3RSaWk3QmRJT3hFekFabklu?=
 =?utf-8?B?UGxmS1FtS3dFamcxM001R3ZWTFdnUTRHSlhtZTB2T29zYzRTbllZZU9iaEo4?=
 =?utf-8?B?cVY4UU1tbmFtd0JkYUxIejdLM01aTW0xQzFLUlhhS0ZTbUFqaXo3b2trUlc2?=
 =?utf-8?B?UXlwNmlIRDZQRWdCRkx4Y3BYdjJmbVBLNExWci80dDZOKzd6MUpaNlpwb0g5?=
 =?utf-8?B?OGN5Vy9mNW1hQzNDcU1JMExIcWtFSHpGcGp4a3cxM29nTC9lREp5UjRnK0VM?=
 =?utf-8?B?YmJPWjg0QTE0N2V6Z3JqZGRGWTdnWlFNWEJFNlVGd1NTSVI2bC96d2t4WXRP?=
 =?utf-8?B?YWZHOFRVNWE0aStScncyc1VabmtQa3pvSnh3Mlk5Qjk1N0Q1NGNTTmE3eTZK?=
 =?utf-8?B?bCtSRWIzNi90MGt2a0srWWw4dFl1TWdaQXBiSU9tVDFpMVdINEZYaENUVW4y?=
 =?utf-8?B?dXNVcDltZnFuaEhaQ3BwVlh2dXdkUm43ME9wditpY0o5a1BWbm9HdlNwdktu?=
 =?utf-8?B?eFBCaFRuNUt0ajNHRWlJNkd1RnY1aTJNazRDMTF0WDZ2TGN0dXdoR2RWLys1?=
 =?utf-8?B?NWQvQUcvZkhjOUpWajBKdkxiaUc3NjR5cTN5QS9LYlZ6bW1iMDBmUmlDZkx3?=
 =?utf-8?B?c2h4bWhYVnhOd2htK0R4Q0tCSVptNzFld1d5Ym1tQzNQVnppNFR6aUNEY2tX?=
 =?utf-8?B?cDl3ZzFFVW01ZzJBWVVtcDF2M0w5RE5US1dZNitORExSS2RFNVFpZXR0M0FV?=
 =?utf-8?B?ZWZ6citqNHNMeUZwanFOdWJyNDhKYittaCtSZTU2TndKQkJqRUFuelRjQU1q?=
 =?utf-8?B?NkhhbEFNeGNyRFdzQ3UxNzB5U2p1aVBBNmJpSk12V0N4a2dBaXEvem81UjE3?=
 =?utf-8?B?cDZCd3ArUnlTall6QmtGS3FDdUhmdGFTd0UvOFBXRjk3ck1aMEtpQmhwR2Vm?=
 =?utf-8?B?QUJwdU9JbWQ4Q3lPYmI3U2ptZGxzTnVjcW5mdmF1LzBERjMzUVpURGU5NGF6?=
 =?utf-8?B?TkJuWFloOVdjVmNScTRkdDhQTFZjRkdtblltR2pEM1RGaFhtaXUrOHZDRDFu?=
 =?utf-8?B?eVhMUjY4SnYxejU3d0oxWVJMOEpnN2lNcmNnR3VGWjJ5SEZEbC9uMGNIcjR0?=
 =?utf-8?B?cGlTaGtkN25lQWQwb3R1MlJxU05LTTRXWnpUR2UrVC9BUFRvUHExTXZqMEUx?=
 =?utf-8?B?OHNvaHZja1N5WkxES1FMQk12aTNWd3cyU3RSVGtveVh6MFh0QmhiZlovZFpX?=
 =?utf-8?Q?cHTTWoKEIhHiMcDSnJIyxT4En?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e37b2e2-4c5b-4042-c009-08dbd5f7892a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 07:45:33.9081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbVBdLpi7m4lWKOUuqbWaIw5t20C14lXWT1YVNaZXhBS17+8DNFIa6aaJ1S9tcNUcG9GdAoVdj3BMJMG9wnzKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7170

On 25.10.2023 20:06, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -847,25 +847,19 @@ int __init early_microcode_init(unsigned long *module_map,
>  {
>      const struct cpuinfo_x86 *c = &boot_cpu_data;
>      int rc = 0;
> -    bool can_load = false;
>  
>      switch ( c->x86_vendor )
>      {
>      case X86_VENDOR_AMD:
> -        if ( c->x86 >= 0x10 )
> -        {
> -            ucode_ops = amd_ucode_ops;
> -            can_load = true;
> -        }
> +        ucode_probe_amd(&ucode_ops);
>          break;
>  
>      case X86_VENDOR_INTEL:
> -        ucode_ops = intel_ucode_ops;
> -        can_load = intel_can_load_microcode();
> +        ucode_probe_intel(&ucode_ops);
>          break;
>      }
>  
> -    if ( !ucode_ops.apply_microcode )
> +    if ( !ucode_ops.collect_cpu_info )
>      {
>          printk(XENLOG_INFO "Microcode loading not available\n");
>          return -ENODEV;
> @@ -882,10 +876,10 @@ int __init early_microcode_init(unsigned long *module_map,
>       *
>       * Take the hint in either case and ignore the microcode interface.
>       */
> -    if ( this_cpu(cpu_sig).rev == ~0 || !can_load )
> +    if ( !ucode_ops.apply_microcode || this_cpu(cpu_sig).rev == ~0 )

Here ucode_ops.apply_microcode simply replaces can_load, as expected.

>      {
>          printk(XENLOG_INFO "Microcode loading disabled due to: %s\n",
> -               can_load ? "rev = ~0" : "HW toggle");
> +               ucode_ops.apply_microcode ? "HW toggle" : "rev = ~0");

Here, otoh, you invert sense, which I don't think is right. With 2nd
and 3rd operands swapped back
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -398,9 +398,17 @@ bool __init intel_can_load_microcode(void)
>      return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
>  }
>  
> -const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
> +static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
>      .cpu_request_microcode            = cpu_request_microcode,
>      .collect_cpu_info                 = collect_cpu_info,
>      .apply_microcode                  = apply_microcode,
>      .compare_patch                    = compare_patch,
>  };
> +
> +void __init ucode_probe_intel(struct microcode_ops *ops)
> +{
> +    *ops = intel_ucode_ops;
> +
> +    if ( !can_load_microcode() )
> +        ops->apply_microcode = NULL;
> +}

I was wondering why you didn't use the return value to supply the pointer
to the caller, but this override explains it.

Jan

