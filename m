Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48718823D32
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 09:12:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661104.1030794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLIpe-000056-CM; Thu, 04 Jan 2024 08:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661104.1030794; Thu, 04 Jan 2024 08:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLIpe-0008TW-9a; Thu, 04 Jan 2024 08:12:02 +0000
Received: by outflank-mailman (input) for mailman id 661104;
 Thu, 04 Jan 2024 08:12:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLIpd-0008TQ-3G
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 08:12:01 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee4ca39b-aad8-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 09:11:58 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e7ddd999bso243494e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 00:11:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r23-20020a6b5d17000000b007bbbe46713asm1332149iob.37.2024.01.04.00.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 00:11:57 -0800 (PST)
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
X-Inumbo-ID: ee4ca39b-aad8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704355918; x=1704960718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=63oIr0HHWvpQUpc7d8B1Atmx1b4H0HYqXW4OQTBgAAs=;
        b=DKZlBm6HrLLwZw/2BcDhem6dMLEcubAKDBTMb6GnSBplO+Wf4HIUyxORNnXasetMn3
         XPLUOBx81jKNn+fpmJR6k9H5cnaDI2wQ0Xd4C5egIZ7mi3JVr/G95jOvLGuQ4BI2YqjV
         nnKdWsBmdoVhGsIUbDXtQ0ocTdiVtDdmkylo3baS8A7UCO5+xqV3EuMdosroTbkVCy1C
         lMecFIQbvAifzSwf1Pd5JAoS9hu6oXdPVtl1CBRpnrxd1O2ubWbiU46vGuQKo/wVq4Ej
         DF4A4MlWP/XP6fIutmPfAgHT6sumbN0S+wqFjrLsd2+Ya8h/xpt3/jxWul2B7DnyFBCL
         mgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704355918; x=1704960718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63oIr0HHWvpQUpc7d8B1Atmx1b4H0HYqXW4OQTBgAAs=;
        b=uDZfWDGAxn2URQgbF89h+VB02xBTYK0IB0iNGB2mGQ6/INzh1CDTPpS6ME4Xd6QPxp
         20xATGJlk7fdhit/kM5p2liegfAO6xjI0fh5K5CYsk1W60EcOqMXgLGSfaNwkXPOoGAJ
         6lurk3AbpigO0vi/N7/FOPzxdeJuWG+1FLKopBeKkSO5waCfILzGDMLThQ1dFYUi8Kqs
         6Hvo7VR+t6ZJFwR4K/ajvCSk3RSMyC/294z6TycWDyGwujY/IH57Kr7ESZ+lGWa3gDCR
         MJjFHy0+DjnnYJ8WNnkRCnQZ/Ku3OHVaNehQAjhCZ12DcYzihSWZcynYeXDR/irbBLhs
         XcoA==
X-Gm-Message-State: AOJu0Yx/RLGQIRb+++WHg6bMzlmaYBAncNU0vbF2FcGGNIAVzrY4xBE7
	8iU3GIcFdfYJT1KJ1WOwUWHo/J8LDb3Q
X-Google-Smtp-Source: AGHT+IFvlsbFNHyNC7+V3f6T39sgf3MogKYinwWmdALANh/aBaXJnvYaBc5e+ynkNN9mF2YYk7FWHw==
X-Received: by 2002:a05:6512:b84:b0:50e:72fc:aff5 with SMTP id b4-20020a0565120b8400b0050e72fcaff5mr181843lfv.36.1704355918194;
        Thu, 04 Jan 2024 00:11:58 -0800 (PST)
Message-ID: <5aea32e3-033e-4299-9088-279d23801ba6@suse.com>
Date: Thu, 4 Jan 2024 09:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [PATCH] Argo: drop meaningless mfn_valid() check
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <580c6c48-9dd5-4296-8696-2b40beac2bc3@suse.com>
 <5d76295f-0438-4c5d-8b2e-73a1abcc96e6@suse.com>
 <CACMJ4GbvMhDdgOp=kUeL_+_j2yS_NVU69P8Xh9QYDLUwJ31Eow@mail.gmail.com>
 <CACMJ4GbNJgsg7tts=9UQPUr9ofsXajuHz7wYO1r5LnevWEL4_g@mail.gmail.com>
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
In-Reply-To: <CACMJ4GbNJgsg7tts=9UQPUr9ofsXajuHz7wYO1r5LnevWEL4_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.12.2023 22:35, Christopher Clark wrote:
> On Sat, Dec 23, 2023 at 12:47 PM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>> On Sun, Dec 17, 2023 at 11:55 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> Christopher,
>>>
>>> On 27.11.2023 14:55, Jan Beulich wrote:
>>>> Holding a valid struct page_info * in hands already means the referenced
>>>> MFN is valid; there's no need to check that again. Convert the checking
>>>> logic to a switch(), to help keeping the extra (and questionable) x86-
>>>> only check in somewhat tidy shape.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
> 
> I'd like to hold off on this just yet, sorry -- the change does look
> ok as far as a transform being applied the prior logic and the
> necessity of the check, but with it applied, it's not obvious that it
> handles all the page types as best that it could there, so I'd like to
> look at this (and the previously submitted patch again) please.

I'm puzzled: This patch merely removes a pointless check. Whatever is
lacking with it in place will have been lacking before. Also can you
please give a rough estimate towards when you'll be getting back on
this, or ideally on both patches?

Jan

