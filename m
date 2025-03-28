Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F28A748F7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 12:07:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930498.1333125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7Y5-00064L-W0; Fri, 28 Mar 2025 11:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930498.1333125; Fri, 28 Mar 2025 11:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty7Y5-00062t-RM; Fri, 28 Mar 2025 11:06:53 +0000
Received: by outflank-mailman (input) for mailman id 930498;
 Fri, 28 Mar 2025 11:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hnye=WP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ty7Y4-00062m-VA
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 11:06:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c03bbd06-0bc4-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 12:06:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43d04dc73b7so22327395e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 04:06:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d900008d8sm23307705e9.33.2025.03.28.04.06.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 04:06:50 -0700 (PDT)
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
X-Inumbo-ID: c03bbd06-0bc4-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743160011; x=1743764811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LcVbXKDDg6cg6Aa1ERRoXshvTENifCrXHbospDYHu+U=;
        b=KtYos8tvZHjBX0S2Koxa+PbDiFGuY/GFDd332DimpEhIsZslYw+Y0Jp9UPOstzTJeB
         bLP7phhxhsSUxN4+u9xSOhiMYDDWeO8v5RN0vI9+AbABSnsibZQbxLuSoETcbkSLTHB2
         zbNIFzMMJAgndagjLl9cynIqfB9dZV4Pb0dHu/uIe8TaJVVZqz6Szc5gQqtw+9n7hBYa
         JwOq26PX4SOzo+xHpPiWsS2Ov5pfwre5+2eLz2xwpadM3VowtMDCfqFOVbIKW8cEAX0Q
         FPDvkjqc1JMAVYZAt3R4enjF6RcMAp5wyh+3nMlkfzikY/PSakEXjgiGM9T46E6NDokW
         oPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743160011; x=1743764811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcVbXKDDg6cg6Aa1ERRoXshvTENifCrXHbospDYHu+U=;
        b=XdOyKEbqhk20ZvnIXbzr89+P9FG1jE+tZ/8uj2ixHZtbVcpTXgx4qbdOrDeAJilsxo
         OT7SHNWbA7R592ImYYbQmA9FrFR7Cpa81SvOYnKXtgHAM0sHWEZZglnag7TijupU3o89
         uKIEfizoV0rGLX2jSXUmMG/oDIw2z4iE5CFi827FktSuE/u5Egw/y1CujGT8AdQpsOBV
         JKO1nPw7iMpXXLOI6kaIHLLnss4z9g7H3ekHvw7RxSkjVo3BrDFc/Ve6pP4Aqiy99Gd+
         1zU4hqsYsMDMmjKGD+698geYqJuW5Aadmy/mHyub3P7OEdkg1kwexUE3j/dyZuiqqYfX
         GDxw==
X-Gm-Message-State: AOJu0Yw2iT4D9zb5t5EOslOAjpRMgrlCeAzgpVq29YLSKq3siVAiuTAF
	WGXWakywUo7K3Zmz0dJB5WMw6/MjW8rg/7wftXvSZhkJOkz9z/zfzUrdZ5KEuDK+srrrWLIFVhM
	=
X-Gm-Gg: ASbGncuEHtdHpkHTaZE2M2MCtM7m3B20HHcQy/O40MvRYdZHQecLRXtq5aiRxK3WIZw
	1c2MK1Nw6mjOCsJL5O1LKibfJmj8cPBf/EY+BIn+WdceAA3LHp7HJRs9bPt6A/6U+zonjG8h3qz
	lB/Aji3zc6EHAU6YTsrIvvivOM8F9QKfcWamcc65qukhYXmQoaC0X2FdWFiXuGklcSvim9wyk2Z
	HRsyg4JKW87SE4HvZxuZBc9uPtBBQOgK3cMic3APSBdK9el39HHUYv8P1hQp5qUHhCAekmWtph4
	Rx7bGaJ1XrIDHmnceGVoU10YwBuXnQV92pgxo0X64rRmasSCR4+4yZ8YdHty7KKkaMeW8bphaEd
	Z0GAonBBS3AhUdKJD/u+w28BAd0Xq0Q==
X-Google-Smtp-Source: AGHT+IHjyW4o+jEy2yvvGqu1RCsw2MluvAMBUHlYBE7HjFB1tisRq1APFJlHaf/sNw4xpTEG9sqhJg==
X-Received: by 2002:a05:600c:3ac5:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-43d84f5dd9fmr65919375e9.2.1743160010948;
        Fri, 28 Mar 2025 04:06:50 -0700 (PDT)
Message-ID: <741f2dc3-3834-4b20-a420-206e3c5a2947@suse.com>
Date: Fri, 28 Mar 2025 12:06:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libxc/PM: correct (not just) error handling in
 xc_get_cpufreq_para()
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <df676738-19e7-47e6-977f-25d6d13ccc50@suse.com>
 <Z-Z_LokdcNj_K_g5@l14>
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
In-Reply-To: <Z-Z_LokdcNj_K_g5@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2025 11:51, Anthony PERARD wrote:
> On Thu, Mar 27, 2025 at 02:32:04PM +0100, Jan Beulich wrote:
>> HWP work made the cleanup of the "available governors" array
>> conditional, neglecting the fact that the condition used may not be the
> 
> I don't know why the cleanup was made conditional, as long as the bounce
> buffer is declared with DECLARE_NAMED_HYPERCALL_BOUNCE(),
> xc_hypercall_bounce_post() can be called without issue (even if
> ..bounce_pre isn't used). Maybe it's all those "unlock_*" labels that is
> misleading, a single "out" label which does the cleanup
> unconditionally would be more than enough.

Oh, yet more cleanup to do there (independently of course).

>> condition that was used to allocate the buffer (as the structure field
>> is updated upon getting back EAGAIN). Throughout the function, use the
>> local variable being introduced to address that.
>>
>> --- a/tools/libs/ctrl/xc_pm.c
>> +++ b/tools/libs/ctrl/xc_pm.c
>> @@ -212,31 +212,32 @@ int xc_get_cpufreq_para(xc_interface *xc
>>      DECLARE_NAMED_HYPERCALL_BOUNCE(scaling_available_governors,
>>  			 user_para->scaling_available_governors,
>>  			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
>> -
>> -    bool has_num = user_para->cpu_num &&
>> -                     user_para->freq_num &&
>> -                     user_para->gov_num;
>> +    unsigned int in_gov_num = user_para->gov_num;
>> +    bool has_num = user_para->cpu_num && user_para->freq_num;
>>  
>>      if ( has_num )
> 
> I think there's an issue here, this condition used to be true if
> `gov_num` was not 0, even if `cpu_num` and `freq_num` was 0. That's not
> the case anymore. Shouldn't `has_num` use also the value from
> `gov_num`? Do we actually need `has_num`?

Raising this question is where all of this started:
https://lists.xen.org/archives/html/xen-devel/2025-03/msg01870.html.
IOW with Penny's change I think the need for has_num will disappear, the
latest. At this point, requesting the governors being optional, only
->gov_num shouldn't affect has_num. Once requesting frequencies becomes
optional too, has_num would become a mere alias of ->cpu_num.

Jan

