Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D67CAA78B9E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935515.1336906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzur9-0007q6-Tp; Wed, 02 Apr 2025 09:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935515.1336906; Wed, 02 Apr 2025 09:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzur9-0007nQ-Qp; Wed, 02 Apr 2025 09:57:59 +0000
Received: by outflank-mailman (input) for mailman id 935515;
 Wed, 02 Apr 2025 09:57:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzur9-0007kq-AC
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:57:59 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4ec942f-0fa8-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 11:57:58 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so3953605e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:57:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5fd163dsm15243615e9.14.2025.04.02.02.57.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:57:58 -0700 (PDT)
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
X-Inumbo-ID: f4ec942f-0fa8-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743587878; x=1744192678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzi83+Z3rcqC/DTXNkxSkmIU4O6+LWZXSNfqsU7U8v4=;
        b=D8ASt0agAjagDMN4e/uJPiCh6+XaGkO1Y34fsBs+OQrRyfoENnRwjZdx0rQck3ZNHO
         +tOsbG2fwQMxpoWbDZ9FjD9P939F5FzUCYmuCaVoDb0ul5pPJM4YQ5etjl3wFWsWvPr/
         0RKEZol4EtFyQiFAp2CVDZV7aUpkh9uyVH6PpYE9kfbUgsJM3Iqm6q0mqxadAaN381n2
         6uDALsS2aRSY4plmSmJ/uH+BOWvQsGr3/JzCSnGFOnwyUpv7IGVww9qfzxzuH064H46D
         Mgy9PETPQ1WIOCR9bWIrzeFhrxNxWy7dSpIFRtbx6E6UWZru5EHrb+eQb0MXUPBQgng6
         PTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743587878; x=1744192678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzi83+Z3rcqC/DTXNkxSkmIU4O6+LWZXSNfqsU7U8v4=;
        b=jX6ZDhtb3ABBwuKhboebF2VUVBDGvnWJnFPqR2lxp5VJNvTc3/vVvc71cwos4UZR0A
         AwSITeCtaFeSENFVlvgQeD2CM2zcyrF/ZLqa/X439ZcYsSiJ3Lr0XDxr/Vqp5148zAdx
         LGRfXGjrpYgETF4kXpnZ5J6gVS3QYEdiPOTFjsa0iiZZAgQZmKnfJ4CXVhiPy4WEZ50A
         4WztjgBTmr77lKNj8RQgGRVl94FZ+oTyVvSt5LMf5t9MS28tmsUAhC1WWj+w4MvR4W5p
         XWWBOiKGJTkH4vSK0JXcoH8OtKLq1bzHvV/mwoUCHCFGmKrUcsqA5QPTtkwkEFQpeznx
         sKWw==
X-Forwarded-Encrypted: i=1; AJvYcCUr8v6HZS8dDuyuJcjxlLlEzyrTrnuNHGceXHQa/NQGxuOkgKXzKvQElDJeLQql4J29Q9bDD9Lg+Zw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK7gj8v55KX3sajY2yMGp3yS82U8F9/5ASumYaumMrhHsCraK6
	tKa+hx8knced7Qbg7WWyN3V8I/JcoNOpQTlXMC0xYqKM4Cy0tfPmEffAlOBh+g==
X-Gm-Gg: ASbGnct6Yx8al8zHqDFe+tQCNZ8BvPPo4KUM50bC8HFgajgcVlxedSrKlT+eolla0Nj
	QAoicI0lOlxjdzL8iQvUB1zOrwxYy++CBEdrp74wh6sba0qL46Ls9szfjsAfFDNYuk6CAOj4v6j
	IU0wmaA+d9NPA+UuKCEHsrCTumKAZaSRe9foYxtbN5nu/SUIyBWB+pYd8QuT4UgJ/EvjfpxzyBM
	5dq4Rf+VkvHYEYOeaN9kT08/m+dnlhsuOEGu8J2B+soA6Em8dLRrVwgy0o4sw3YQA6JKirveB2T
	awaKnlsdBxoQeRGorXzm2aKERlKsB6DcdJFblHD19IXxyb4fuFiI8IdU0aYarHdE0HQ227R50QD
	aYnnQCTPJahOKyC9xBeV1+ithKWdztrf7LhPPNDwx
X-Google-Smtp-Source: AGHT+IFxpkxKFFuSR3NFMbLkravCZQ+aTY6GyXGdcGfCwp/HhoLH6cx5GhQxXnjQDsTf5gsJRD91kQ==
X-Received: by 2002:a05:600c:1e0f:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43eb6fea736mr16740225e9.3.1743587878257;
        Wed, 02 Apr 2025 02:57:58 -0700 (PDT)
Message-ID: <a92e034f-ea62-4213-b1a8-c49038c6348f@suse.com>
Date: Wed, 2 Apr 2025 11:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/vmx: Use asm goto() in _vmx_cpu_up()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmkhn@proton.me,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
 <c84ee77b-2a5b-49d9-ac4e-018ce359f67c@suse.com>
 <093d7c80-b013-4f33-8fb5-29d6133f85c3@citrix.com>
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
In-Reply-To: <093d7c80-b013-4f33-8fb5-29d6133f85c3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.04.2025 11:52, Andrew Cooper wrote:
> On 02/04/2025 10:40 am, Jan Beulich wrote:
>> On 02.04.2025 01:34, Andrew Cooper wrote:
>>> With the new toolchain baseline, we can make use of asm goto() in certain
>>> places, and the VMXON invocation is one example.
>>>
>>> This removes the logic to set up rc (including a fixup section where bactraces
>>> have no connection to the invoking function), the logic to decode it, and the
>>> default case which was dead but in a way the compiler couldn't prove
>>> previously.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: dmkhn@proton.me
>>>
>>> RFC.  To be rebased over Denis' general cleanup.
>> LGTM. Can't this actually replace some of his cleanup? Judging from
>> base-commit: at the bottom this isn't based on his work. In which case:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Oh.  I was expecting there to be far more debate on this.

You had indicated many times that you want to make use of asm goto(),
and for situation like the one here I'm actually in trouble seeing
any objections you might have been expecting. Were you maybe
expecting me to object just for the purpose of objecting ;-) ?

Jan

