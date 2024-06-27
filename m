Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592A91A10F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 10:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749798.1158045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMk4C-0005Dh-Hb; Thu, 27 Jun 2024 08:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749798.1158045; Thu, 27 Jun 2024 08:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMk4C-0005Bo-Ea; Thu, 27 Jun 2024 08:01:16 +0000
Received: by outflank-mailman (input) for mailman id 749798;
 Thu, 27 Jun 2024 08:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMk4B-0005Bf-L8
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 08:01:15 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c6c4cb5-345b-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 10:01:13 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52d259dbe3cso2464652e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 01:01:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72745d077e7sm601111a12.37.2024.06.27.01.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 01:01:12 -0700 (PDT)
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
X-Inumbo-ID: 6c6c4cb5-345b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719475273; x=1720080073; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ecNue83XO5T68nH08GCvk0yWw6PYIJxula9SXfUI4yo=;
        b=RJJ5joMnYquztrKNgQE6/yOrqpxH4SemwYDT5gRRNob6NlT3XywpGNVVjshnQPz+1I
         MwIVW1qKeK05clEnO3/K1Db/3NoMg9XGcOM0xy+FxPYUKr/Xz+DiUcX6jDJCfNAMqgc+
         KUeIOvBZcLfal9pdYEVuDGuhdrx7UmEQns81dWlZy58YIQSQ2DLXnjEwK6uZEthbFwza
         hU4TjEsmT2uAxb7JiqAJbEKsHyhzMEAjb6HwPOVoTvQ6uP6s0eVfdkQYPjZ+kPWvKnBo
         XNYlvgzO5H2JMAMkw5Sn1gQ2z9L6wI2TyCSVe9veo7WtiHFsroufnSEs7LpAXFBj9M3g
         5qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475273; x=1720080073;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNue83XO5T68nH08GCvk0yWw6PYIJxula9SXfUI4yo=;
        b=qPFJUTo5W30Sewe0t3sG4gvwHts7HCJiqFGlPPaiJOrtxcxPZQ7IzQ5hv2u5cirHqI
         lB7ud1YLtbPChDabP57is4hzJloxjriGzeS4/bajW3p6QuvTJdE9LVwhkOsdGN2S8wrd
         +kNQpuphOpt25YaRyuW9FjrRpIYVdAYJp6dKTenToALdG8HpGbZjmrNXHftBKU0WXVQI
         z6545f3+x447EBJr2IG9otvhWtdT5Dn0usstShthUxvQF41plVezBbe8FEMowdq1Onp9
         KVqVz2bQvfBtAcCzvWUwAmrv4CEgliMN5FtJE0jXKqS0MMSXfaXqmaEgVue5yplFUFyw
         +jfg==
X-Forwarded-Encrypted: i=1; AJvYcCXTXrvkJsq6qqW7AYow1Zbuk4UY0QexdxU2oC1yCDoOpZMg0Tfh12JBIX4sGdDiEdPoECN99JRmy8sUuH9f1q+C3uMYuYJ2lz/uxjjncok=
X-Gm-Message-State: AOJu0YzNhWwuxqLf1iQRUaSF4Mn+SXEUqWJC19NGr8GJBHC7zMjTPmVl
	n4esrj7XcUkfSGXiGoASINNOwqoyiuq3UBVTYABa5d2Y7qchlIstWo/C++MUQw==
X-Google-Smtp-Source: AGHT+IEoqMXKAByh38Y66A01VDwn6Wlt498BsogVjwV0meToi9ptolputQFyajlbCTqPS5YNXCqGkw==
X-Received: by 2002:a2e:3e13:0:b0:2ec:5685:f05f with SMTP id 38308e7fff4ca-2ec5938a771mr87073551fa.49.1719475273338;
        Thu, 27 Jun 2024 01:01:13 -0700 (PDT)
Message-ID: <30c1c508-daf9-40df-b9ae-0a1584eacc0a@suse.com>
Date: Thu, 27 Jun 2024 10:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/xstate: Switch back to for_each_set_bit()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240625190719.788643-1-andrew.cooper3@citrix.com>
 <20240625190719.788643-7-andrew.cooper3@citrix.com>
 <59201cf5-9d86-4976-a331-2a7f8bb9635a@suse.com>
 <961f5371-3616-4476-ae12-e1d91cc56345@citrix.com>
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
In-Reply-To: <961f5371-3616-4476-ae12-e1d91cc56345@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.2024 20:09, Andrew Cooper wrote:
> On 26/06/2024 11:24 am, Jan Beulich wrote:
>> On 25.06.2024 21:07, Andrew Cooper wrote:
>>> In all 3 examples, we're iterating over a scaler.  No caller can pass the
>>> COMPRESSED flag in, so the upper bound of 63, as opposed to 64, doesn't
>>> matter.
>> Not sure, maybe more a language question (for my education): Is "can"
>> really appropriate here?
> 
> It's not the greatest choice, but it's not objectively wrong either.
> 
>>  In recalculate_xstate() we calculate the
>> value ourselves, but in the two other cases the value is incoming to
>> the functions. Architecturally those value should not have bit 63 set,
>> but that's weaker than "can" according to my understanding. I'd be
>> fine with "may", for example.
> 
> There's an ASSERT() in xstate_uncompressed_size() which covers the
> property, but most if the justification comes from the fact that the
> callers pass in values which are really loaded into hardware registers.
> 
> But it is certainly more accurate to say that callers don't pass the
> flag in.
> 
> There isn't an ASSERT() in xstate_compressed_size(), but I suppose I
> could fold this in:
> 
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index 88dbfbeafacd..f72f14626b7d 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -623,6 +623,8 @@ unsigned int xstate_compressed_size(uint64_t xstates)
>  {
>      unsigned int size = XSTATE_AREA_MIN_SIZE;
>  
> +    ASSERT((xstates & ~(X86_XCR0_STATES | X86_XSS_STATES)) == 0);
> +
>      if ( xstates == 0 )
>          return 0;
>  
> 
> which brings it more in line with xstate_uncompressed_size(), and has a
> side effect of confirming the absence of the COMPRESSED bit.
> 
> Thoughts?

Definitely fine with me.

Jan

