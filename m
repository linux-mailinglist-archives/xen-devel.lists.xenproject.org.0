Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C83989B23
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807020.1218166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAcs-0007Q9-N6; Mon, 30 Sep 2024 07:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807020.1218166; Mon, 30 Sep 2024 07:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAcs-0007My-KX; Mon, 30 Sep 2024 07:15:22 +0000
Received: by outflank-mailman (input) for mailman id 807020;
 Mon, 30 Sep 2024 07:15:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svAcr-0007Ms-LL
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:15:21 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfe596a0-7efb-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 09:15:19 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53995380bb3so608512e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:15:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88240c598sm4090874a12.39.2024.09.30.00.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 00:15:18 -0700 (PDT)
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
X-Inumbo-ID: bfe596a0-7efb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727680519; x=1728285319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xbkBl4B3nRGv5cSReaSbd2oBA0byG+KD3mbveIFbf/s=;
        b=egKLq90LD4jT6UlY7f0zHIpe7k92N3lIuYFeL/t4g+IMibsi47HylmN62SQIwFzdRo
         ch3xSVe7Fg0iW8tuT9BauzvbD9olDxlm4iGci6zdcxAPbHHptoYbtn32HQDeLJAUTOGJ
         /X5A2b6LUzvbJ81qPHSbRvY6mF0tHBSS4Z81XDnJeDIU+QBvpAfZW7wcq5QPadEqwq4K
         fg2GGRg4XACDoQTBX/imx3Eb6iwIo//5u+cK/5SKVBSwCJT7/KmQcjW+H3+PFu08CbxV
         JtpHwdlUGzDIVkBbY6rM3/R1tcd9Lwxl/LxxIgsVyWUGf2cNy5r32NxWms3VZSq4mEaX
         L4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680519; x=1728285319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbkBl4B3nRGv5cSReaSbd2oBA0byG+KD3mbveIFbf/s=;
        b=MIT0jVBsXSSXxNaFeRUzhdq7FfEyDGCqCvHWygpBMnwtFT74XXYJifu9LJuMat9UCO
         mmVDpAma+CxWLwZIgx1jCna/XnbhXmkslTp09mmOyXLAKwKI1L3hVY74Epv5bNtm65xL
         qMx5gv6fEG/6Qa57rfXmm1tZPSVq2p6tATwKX7oZx2rNs+/H4bu10xr+9iaVwtURlVkh
         uzq4wovhtnLxRLp/JyLfRZglbOP4uMiCPREcZn0MtXESjjoJzXd9VT3TYMH4t1oGW0fF
         UOrQvxsS5BI4QTpe67HDCX4Kg2wx83jntf07ty54tQyE/AxZoXKkn3/OLDPJYmqnoxtv
         5EIA==
X-Forwarded-Encrypted: i=1; AJvYcCVkMGxOrnAEDFmLcIGmVCq9jWWr0wsqubSNr72miiIOe/AcEvKHLaTJqDk/qJCzoVeLztva8iDUJ4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzk0IkvCR4d0JkajTQTum8ULwB5g2ewD+5VFz5c+oyDGL7cVGcl
	RIdONhxjhUVxPJ3LxYoN1o9baB0TsSPdF9QjYs2TKnWtv8/4b6YLGpCJvDjEYA==
X-Google-Smtp-Source: AGHT+IEmxQMCzQPN38LpKVzEgqkBDyGiKQrifs32v5cUkkp/QId0gxXVGSl94bjzciYMpq6iVVNIvQ==
X-Received: by 2002:a05:6512:31d4:b0:539:9092:809e with SMTP id 2adb3069b0e04-53990928175mr1724456e87.50.1727680518731;
        Mon, 30 Sep 2024 00:15:18 -0700 (PDT)
Message-ID: <9eedeb40-6bdf-43c5-b25e-82a693176521@suse.com>
Date: Mon, 30 Sep 2024 09:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm: introduce kconfig options to disable hypercalls
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240926095806.67149-1-Sergiy_Kibrik@epam.com>
 <6f7961ff-3940-4f56-b497-9af779b15d46@citrix.com>
Content-Language: en-US
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
In-Reply-To: <6f7961ff-3940-4f56-b497-9af779b15d46@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.09.2024 14:36, Andrew Cooper wrote:
> On 26/09/2024 10:58 am, Sergiy Kibrik wrote:
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index fc52e0857d..ea0557aee5 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -64,10 +64,14 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
>>  obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
>>  
>>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>> +ifeq ($(CONFIG_DOMCTL),y)
>>  obj-y += domctl.o
>> +endif
>>  obj-y += monitor.o
>> +ifeq ($(CONFIG_SYSCTL),y)
>>  obj-y += sysctl.o
>>  endif
>> +endif
> 
> This patch is tagged ARM, but as you can see from this bodge, it's
> already used on x86 for SHIM_EXCLUSIVE mode.
> 
> (I came very close to insisting that it was done like this originally,
> but alas.)
> 
> Please incorporate PV_SHIM_EXCLUSIVE at the Kconfig level, and turn
> these into simple obj-$(...) += foo.o

Which in turn may want first dealing with the inverted sense of PV_SHIM_EXCLUSIVE
that you've been voicing concern about when used in "depends on". A patch to deal
with that has been pending for over a year and a half:
https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html
Naming there of course is subject to better suggestions.

Jan

