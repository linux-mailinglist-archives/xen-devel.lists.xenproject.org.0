Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9921980590C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648065.1012013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXbz-00016x-6m; Tue, 05 Dec 2023 15:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648065.1012013; Tue, 05 Dec 2023 15:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXbz-00013H-3M; Tue, 05 Dec 2023 15:45:27 +0000
Received: by outflank-mailman (input) for mailman id 648065;
 Tue, 05 Dec 2023 15:45:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXbx-00011j-8l
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:45:25 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d3a07bf-9385-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:45:23 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-333536432e0so1308747f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:45:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i18-20020adfefd2000000b003334a1e92dasm5619094wrp.70.2023.12.05.07.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:45:22 -0800 (PST)
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
X-Inumbo-ID: 4d3a07bf-9385-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701791122; x=1702395922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F752FJDv0lL6He1JsQDOS7E7JD7qZHZ3sbRhf2iA3sA=;
        b=IUUChb6pJ22mSO1JomprpG4Q4+TZVQ28SYGl7cl1TyxQI9NsSqvtO8Gq/8zKJulDuu
         A/3/TIvx5pThw8nkjfsU+p+gMz9Dd3tb5iicRz1iIWa+BizezGiN2FaW9bi2HP6cR/cf
         xnSORUYayDwoXf6wWVKhTJAFM66ldZl/Ehs2CkN2LhT0s48WB1mrryb+I+xptJ3QKrd+
         lYiSdJ6YPEF3Hcx/riix3QcXSk20xR+oh9pJC89A0VS+jFu95I2+zcQ8Qkx87+nJkbcM
         mqLob4Vqvmc/2h81owD6Ef/yG/MUZRFvWT/PhIWkEi6LKwt3z7OCWwzDaWdspgNZzBqb
         GgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791122; x=1702395922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F752FJDv0lL6He1JsQDOS7E7JD7qZHZ3sbRhf2iA3sA=;
        b=jA72ORZEW7RndE5PfTsPGMhTCapxrIXJswW2ukEiqZOGQSAz5rMNLSJSCfvls3O326
         2eB2cFGpTzm85i8buofvpW62f8U4eUc2+Wl69v/jgZmNR6lJc19AKQg6AyM1JaHh2XVE
         NjkhX1d+YQkAIbcWJfgcdpO1syO/r189x25O6fXanNdvd4iuRz6O8Kpi8JVyCsgUDbYb
         UwwUl6QoJuQgx8pyxVDKAqOPSScEV4CbY9y1XJY+bh3TwYaF0gxhNCYrLFPJ+u0+2n3I
         3FENid6efzLy/zV1Pa0zDx744XlU70PBEyJOlX66xp4miT99Xag0XNyxg/tPWdO+cQfq
         TlLg==
X-Gm-Message-State: AOJu0YyfyEk4oGnFpqOMCXTlBAVoJ+DJk6Xb1lv1i4Sk8k2wAfjLZY3b
	RfMxfWLqV71ljcCkhtDuyiGd
X-Google-Smtp-Source: AGHT+IHmPa+Fh04Egs9qsR/amBSYFsYWmSjyzgPH+1Olcgy97k33HQdN44ZuA+n9IgMF/KE+Y85QDg==
X-Received: by 2002:a5d:4102:0:b0:332:d07a:6f9d with SMTP id l2-20020a5d4102000000b00332d07a6f9dmr4236650wrp.53.1701791122726;
        Tue, 05 Dec 2023 07:45:22 -0800 (PST)
Message-ID: <39c16b91-ecd9-4d97-8fc2-497929103e7e@suse.com>
Date: Tue, 5 Dec 2023 16:45:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/livepatch: set function alignment to ensure
 minimal function size
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-2-roger.pau@citrix.com>
 <ddbf1fad-e0c1-4b7c-9734-71d4997b5aa0@citrix.com> <ZW87Qq3Hw4ql-ZFw@macbook>
 <29b2d864-2b3f-4a74-9d61-534523e842cd@suse.com> <ZW9DkoiVHhlzM6yA@macbook>
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
In-Reply-To: <ZW9DkoiVHhlzM6yA@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 16:36, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 04:14:57PM +0100, Jan Beulich wrote:
>> On 05.12.2023 16:01, Roger Pau Monné wrote:
>>> On Tue, Dec 05, 2023 at 01:42:42PM +0000, Andrew Cooper wrote:
>>>> As for the subject, it's not really about size; the function size is
>>>> still going to be small irrespective of the alignment.
>>>
>>> What about wording it like:
>>>
>>> x86/livepatch: set function alignment to ensure minimal space between functions
>>
>> This still wouldn't be right, as there may be no padding at all between
>> functions (if they're just the right size).
> 
> But no padding would still be fine given the text above, as then the
> minimal space requirement is already meet?
> 
>> Maybe "minimal distance
>> between function entry points"? Getting long-ish, though ...
> 
> Oh, I see.  You want to explicitly mention the distance is between
> function entry points, as otherwise one way to read the subject would
> be distance between function end and next function entry point?

Yes, I saw no other way of reading it. IOW ...

> It's indeed a bit long for my taste, but I don't mind adjusting if you
> think the current wording could cause confusion.

... it already did cause confusion. But maybe we can still think of
shrinking the result some ...

Jan

