Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF124FF03
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 15:35:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kACcR-000392-4f; Mon, 24 Aug 2020 13:34:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G0tX=CC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kACcP-00038x-HQ
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 13:34:37 +0000
X-Inumbo-ID: a3cbaca2-2d56-403f-b676-1245123df1bb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3cbaca2-2d56-403f-b676-1245123df1bb;
 Mon, 24 Aug 2020 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=poUZBmr/U6aulyQsxBiIVlBmj3SdsKIrL7uZ+Eccr+M=; b=CJ6YKiYOV2K1wogq0E3bGtRELB
 fur/giKlVlQ7SnQVQ2YMVMVjsG7jByCgOgu3ccPTUQVk4FdBfoerMgEtUD7FUN+FXPOz4+T4tea1W
 fOW+X2YmaxkH4nnN6onWgdlt6haU/mpRv2aMni4+IortztYyGuTYvtVCQpCvMIcWeCnY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kACcO-0002wf-Ah; Mon, 24 Aug 2020 13:34:36 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kACcO-0002px-1S; Mon, 24 Aug 2020 13:34:36 +0000
Subject: Re: [PATCH v2 2/2] xen/arm: Throw messages for unknown FP/SIMD
 implement ID
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Andre.Przywara@arm.com, Bertrand.Marquis@arm.com, Penny.Zheng@arm.com,
 Kaly.Xin@arm.com, nd@arm.com
References: <20200824032825.18368-1-wei.chen@arm.com>
 <20200824032825.18368-3-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9667769d-e938-0dbc-c2f5-84880435c932@xen.org>
Date: Mon, 24 Aug 2020 14:34:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824032825.18368-3-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Wei,

On 24/08/2020 04:28, Wei Chen wrote:
> Arm ID_AA64PFR0_EL1 register provides two fields to describe CPU
> FP/SIMD implementations. Currently, we exactly know the meaning of
> 0x0, 0x1 and 0xf of these fields. Xen treats value < 8 as FP/SIMD
> features presented. If there is a value 0x2 bumped in the future,
> Xen behaviors for value <= 0x1 can also take effect. But what Xen
> done for value <= 0x1 may not always cover new value 0x2 required.

Right, but this will also happen with all the other features. This may 
actually confuse the users as they may think the rest of the features 
are fully supported which is not correct. For instance, dom0 will crash 
if you boot Xen on a SVE-capable hardware.

> We throw these messages to break the silence when Xen detected
> unknown FP/SIMD IDs to notice user to check.

It feels a bit odd to me to print unknown for the FP/SIMD feature but 
not for all the rest.

IMHO, the right approach is to sanitize ID registers exposed to domains 
and only expose features we know are correctly handled.

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/setup.c | 26 ++++++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7968cee47d..c7802d0e49 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -99,6 +99,28 @@ static const char * __initdata processor_implementers[] = {
>       ['i'] = "Intel Corporation",
>   };
>   
> +static const char * __initdata fp_implements[] = {
> +    "Floating-point",
> +    "Floating-point + half-precision floating-point arithmetic",
> +    "Floating-point Unknown ID 0x2",
> +    "Floating-point Unknown ID 0x3",
> +    "Floating-point Unknown ID 0x4",
> +    "Floating-point Unknown ID 0x5",
> +    "Floating-point Unknown ID 0x6",
> +    "Floating-point Unknown ID 0x7",
> +};
> +
> +static const char * __initdata advsimd_implements[] = {
> +    "AdvancedSIMD",
> +    "AdvancedSIMD + half-precision floating-point arithmetic",
> +    "AdvancedSIMD Unknown ID 0x2",
> +    "AdvancedSIMD Unknown ID 0x3",
> +    "AdvancedSIMD Unknown ID 0x4",
> +    "AdvancedSIMD Unknown ID 0x5",
> +    "AdvancedSIMD Unknown ID 0x6",
> +    "AdvancedSIMD Unknown ID 0x7",
> +};
> +
>   static void __init processor_id(void)
>   {
>       const char *implementer = "Unknown";
> @@ -129,8 +151,8 @@ static void __init processor_id(void)
>              cpu_has_el1_32 ? "64+32" : cpu_has_el1_64 ? "64" : "No",
>              cpu_has_el0_32 ? "64+32" : cpu_has_el0_64 ? "64" : "No");
>       printk("    Extensions:%s%s%s\n",
> -           cpu_has_fp ? " FloatingPoint" : "",
> -           cpu_has_simd ? " AdvancedSIMD" : "",
> +           cpu_has_fp ? fp_implements[boot_cpu_feature64(fp)] : "",
> +           cpu_has_simd ? advsimd_implements[boot_cpu_feature64(simd)] : "",
So far, each extension name are just a word and they are all separated 
with spaces. With this change, there will be multiple words per 
extension which is quite confusion.

If we decide to go ahead printing the "unknown", then we want to provide 
a full description of the extension on a separate line. Maybe:

"AdvancedSIMD: With half-precision floating-point arithmetic".


>              cpu_has_gicv3 ? " GICv3-SysReg" : "");
>   
>       printk("  Debug Features: %016"PRIx64" %016"PRIx64"\n",
> 

Cheers,

-- 
Julien Grall

