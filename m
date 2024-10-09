Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD5E99624F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:21:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813852.1226898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRw3-0001mW-PP; Wed, 09 Oct 2024 08:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813852.1226898; Wed, 09 Oct 2024 08:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRw3-0001kD-Mj; Wed, 09 Oct 2024 08:20:43 +0000
Received: by outflank-mailman (input) for mailman id 813852;
 Wed, 09 Oct 2024 08:20:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syRw2-0001k6-Fn
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:20:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e595494-8617-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 10:20:39 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9968114422so229914466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:20:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7d4d9csm625482466b.182.2024.10.09.01.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 01:20:38 -0700 (PDT)
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
X-Inumbo-ID: 5e595494-8617-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728462039; x=1729066839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RBnzNVNHQXaj4pKy6JLWMukrxhLEKIwVCfDR2u13T4s=;
        b=BwI+WscaUiUgOVHF5wd4jLoUbApVSTYHRlyNLTeWgDjeZP89qzxXBpghu/S52ALQum
         W9SoJeZvM48KkTW5IXLsC3KRoQKgShtoNnTUkD+HxDHHiTaGjTRkl4VrpZHcQYc7O6FC
         YrFoeOa2F2XpiA3ujMuW71lb8aTRfKSq0ETXEZjYZEcohxGZ6OJzqyc2Rog9zQDwWJXX
         tByRb2O7VmujGHwJcAPLH0M2WUr4a5t2yIahcqisbQqzQR8x51DQnHU6+sYcROv656pp
         toVc6Mj3BbKLussHra1RPKAXJggJlhpxW4yLUXbXItAZM/oTxC2H21yE7vKBfltVcxX1
         +Cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728462039; x=1729066839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBnzNVNHQXaj4pKy6JLWMukrxhLEKIwVCfDR2u13T4s=;
        b=FEWNDaNRf9bMToyhdvcixCBfi/YaSpJHybJkFw0SY6ezS7+QCP0m+LijAolGVI1n3H
         77m9UZvD4QSma9uKOQntLR+fEqAgYE5m4OOSHd4cYmg7nKmbuyugmHHIsVX7+d+5LmOE
         1pNcNOtlRRs/d5aB/JhsRjFvH0TdX9PoFM7Fw9IiyRs+q9EGIvUf+2pa9WwUGuWpNlKj
         Rj+rWUtjwNUYvgVWRyQ3yBYyq8EGFjGcJruLNH2LT6uyKBJM1Hs04pfIwqpwEVc+4jBg
         B2i161iaW78xrLR8CZ1kDLdp2tgV8F9jxq+qe+Ihx+KyAvsgMXuE9I3nGEp6UV3lI6fR
         rIvg==
X-Forwarded-Encrypted: i=1; AJvYcCWeKvfGlimzxA6rVR2oAwivMnfdWgp0pkSWfv400WJLEMOmL+Oo6tqb3tMTsnUQHQM8N0bzon7t+oY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZf3jXC0yio3i7R1qu1lYA1umIaK5ATNJP4+IbSzDv0O7c/9eo
	lEBLoSZ9ZGkKEUA7RggotHceSVT/4r6NJe3Chw0df5Uy0kkr8nI/Zxora3B1Wf/7h/TRca7DdUU
	=
X-Google-Smtp-Source: AGHT+IFYDjjRNBPWxu0v7BUdcGDH6gHOhv+eNXetqShaAv2ET8oIxeNW93kMg3IcmfbxdTMhXpUPdQ==
X-Received: by 2002:a17:907:1c9c:b0:a99:61f2:49eb with SMTP id a640c23a62f3a-a998d2f7cbcmr137299166b.42.1728462039126;
        Wed, 09 Oct 2024 01:20:39 -0700 (PDT)
Message-ID: <f54d8f4b-e088-4ebe-a72f-ec4a540f9b33@suse.com>
Date: Wed, 9 Oct 2024 10:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] x86/boot: Align mbi2.c stack to 16 bytes
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
 <20241009080439.2411730-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241009080439.2411730-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 10:04, Frediano Ziglio wrote:
> Doing previous testing with an Adler Lake Intel machine the following
> patch (improving MBI structure checking) started to fail.

In patch descriptions please don't refer to "this patch" or "the following
patch"; describe a commit in a self-contained way, with references to
what's already committed mentioning commit hash and title, whereas
references to what hasn't been committed using merely the title (and maybe
a link to its most recent posting). I'm not sure though that the other
patch really matters here beyond having exposed an issue that was there
(latently) anyway.

> Excluding it makes the tests succeed however there was not apparent
> reason (looking at the code) for the failure.
> So I instrumented code to output the structure and tested code with
> this extracted data with and without the following patch and results
> were the same.
> Compiled assembly code from lab was also fine beside not keeping
> the 16-byte alignment for the stack.
> Turning on stack alignment solve the problem on Adler Lake machine.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

This really wants a Fixes: tag then.

> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -11,6 +11,8 @@ $(obj)/boot.init.o: $(obj)/buildid.o
>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
>  $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-boundary)
>  
> +$(obj)/mbi2.o: CFLAGS_stack_boundary := $(cflags-stack-boundary)
> +
>  obj-y := common-stub.o stub.o
>  obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
>  obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))

You're duplicating code, which is better to avoid when possible. Is there
a reason the earlier commit didn't simply add mbi2.o to $(EFIOBJ-y)? That
way the existing logic would have covered that file as well. And really I
think it should have been mbi2.init.o (or else adding it into $(obj-bin-y)
is wrong), which probably wants correcting at the same time (ISTR actually
having requested that during an earlier review round).

Jan

