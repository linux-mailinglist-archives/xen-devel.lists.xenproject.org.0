Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADEF8B5E30
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714290.1115465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TKe-0008CS-8m; Mon, 29 Apr 2024 15:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714290.1115465; Mon, 29 Apr 2024 15:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1TKe-00088z-5r; Mon, 29 Apr 2024 15:54:20 +0000
Received: by outflank-mailman (input) for mailman id 714290;
 Mon, 29 Apr 2024 15:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1TKc-00088t-Rz
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:54:18 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc193871-0640-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:54:17 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-346b96f1483so2522729f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:54:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s7-20020a5d5107000000b0034c61e211a5sm8758410wrt.63.2024.04.29.08.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:54:16 -0700 (PDT)
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
X-Inumbo-ID: bc193871-0640-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714406057; x=1715010857; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmzksNUYocK59OOWW6MINKHDuzBfaHWGIq6UDu7QLVE=;
        b=D0GNIcyk50rWwzFzL8+Yk4ee6BoF1VH6Yq/SkPoCmKZs7e0yW16j8Mf0Pvsy5vRBiI
         KpReRvKbST4JsyYgaakFj/yoi34Pwko9fgzLQ9sFB95U07CKdtuY4StBDqO1Q0bx1L76
         XQ600UjO8vH0urVKLK1U3zs37idn2+ekxLsJkxjArJ5yndXehAtGFTvTTueOy6CuCSaV
         5V13+8ROyJIvikDYswf/+UIKaZRSoItlblT7R/gidxqwBgGKRqsMd+0ZEtdt6a6TZWjF
         Nw9OQmNHKYXRPmUFpPP/WkoP03tTlMwyx1aI05RgCRwUbtRVIT+eu27Un6ubzb52usoM
         xz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714406057; x=1715010857;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmzksNUYocK59OOWW6MINKHDuzBfaHWGIq6UDu7QLVE=;
        b=aUxyZjUM0OdrCGRKlEOAYFs/7mIuQAWhU3IGwcCU7Luxk6LsYGcelmfCpD/LZpd7PV
         9mlv+elCI5Rgmo03ZxG5TUsxCK6NFsNzcAyMOa3ES3eSrSBkKnMJbXO0mr4UowXza8nU
         9V6c+qIVgKn5FxVB/Ncu4drOJlSAyG9vzjORB68TBtNF8j+HqE1hVkHY/WX9BlftrQmb
         zVZsAXSIRuDUImSiaQTlXmYoaFFoKtfa6vNzq1bgefh/grwg8kQSlx174Y0iJq7UkylP
         2lBVw/qz4HsLfh3nBnv/0RoY7A8G3P10pIwGufy0/3d/YFUovLekeRifuQFwR44S8jUQ
         EIHw==
X-Gm-Message-State: AOJu0Ywn9s78xMCnUZrsMFViHitQNx0/fPFFFDsYpdQsDpUuVTNNOVUQ
	I9xeVE/96iX/IRXF5ogNfc+bkFErE9hc1dn2vixwPenHd0IkqALdITLA2/QGmw==
X-Google-Smtp-Source: AGHT+IEiWITMgIxHHpw3f8GpDPA/ijju5reJvnki1C/JJYHYaTqBgm6ax2QpuTvXOWBxicg6yiTPEg==
X-Received: by 2002:adf:fa0c:0:b0:34d:2353:b94 with SMTP id m12-20020adffa0c000000b0034d23530b94mr48923wrr.17.1714406057134;
        Mon, 29 Apr 2024 08:54:17 -0700 (PDT)
Message-ID: <a0cde29c-2b30-4b6b-a6de-135b10d7f165@suse.com>
Date: Mon, 29 Apr 2024 17:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 7/7] x86/MCE: optional build of AMD/Intel MCE code
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <82df6ef350a2b4f42ec7adf12a90ebeae1d133f6.1713860310.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2404261615250.3940@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <alpine.DEB.2.22.394.2404261615250.3940@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.04.2024 01:16, Stefano Stabellini wrote:
> On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/cpu/mcheck/Makefile
>> +++ b/xen/arch/x86/cpu/mcheck/Makefile
>> @@ -1,12 +1,10 @@
>> -obj-y += amd_nonfatal.o
>> -obj-y += mce_amd.o
>>  obj-y += mcaction.o
>>  obj-y += barrier.o
>> -obj-y += intel-nonfatal.o
>>  obj-y += mctelem.o
>>  obj-y += mce.o
>>  obj-y += mce-apei.o
>> -obj-y += mce_intel.o
>> +obj-$(CONFIG_AMD) += mce_amd.o amd_nonfatal.o
>> +obj-$(CONFIG_INTEL) += mce_intel.o intel-nonfatal.o
>>  obj-y += non-fatal.o
>>  obj-y += util.o
>>  obj-y += vmce.o
> 
> Awesome!

Almost. I'd appreciate if the ordering of files would be retained. It's
not quite alphabetic, but still. Moving mce_amd.o and mcaction.o to their
designated slots may or may not be done right here.

>> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
>> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
>> @@ -24,14 +24,20 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>>  	 * Check for non-fatal errors every MCE_RATE s
>>  	 */
>>  	switch (c->x86_vendor) {
>> +#ifdef CONFIG_AMD
>>  	case X86_VENDOR_AMD:
>>  	case X86_VENDOR_HYGON:
>>  		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>>  		amd_nonfatal_mcheck_init(c);
>>  		break;
>> +#endif
>> +#ifdef CONFIG_INTEL
>>  	case X86_VENDOR_INTEL:
>>  		intel_nonfatal_mcheck_init(c);
>>  		break;
>> +#endif
>> +	default:
>> +		return -ENODEV;

This, while perhaps desirable, doesn't fit ...

>>  	}
>>  	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>>  	return 0;

... earlier behavior, and hence is somewhat unexpected in a change which, by
its description, looks like a "no functional change" one.

> For consistency in all other cases this patch series uses IS_ENABLED
> checks. They could be used here as well.

Hmm, I think for switch() statements like this (see also comments elsewhere
on this series) using #ifdef is overall better.

Jan

