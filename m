Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1C2830214
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 10:19:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668300.1040367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ23r-0007Wm-1k; Wed, 17 Jan 2024 09:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668300.1040367; Wed, 17 Jan 2024 09:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ23q-0007UF-Um; Wed, 17 Jan 2024 09:18:14 +0000
Received: by outflank-mailman (input) for mailman id 668300;
 Wed, 17 Jan 2024 09:18:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ23p-0007U9-Bi
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 09:18:13 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 556ef412-b519-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 10:18:10 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e8d3b29f2so31075e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 01:18:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fk4-20020a05600c0cc400b0040e7efb1ff2sm7552202wmb.37.2024.01.17.01.18.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 01:18:09 -0800 (PST)
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
X-Inumbo-ID: 556ef412-b519-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705483090; x=1706087890; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M8DyqexMij1sKwKdg5LgDvK53F3Eitit3+gAFfHBcek=;
        b=OMVN1yPOMWfRNikjq0icIAIJDoXnsjp2rqRIJbiG3kf/cE+T7ndBsl2iMQiTMfXbU+
         8O5pheHcnbp1FBLrmjcyMazAkO2HB8BuyDyvtvp8f0SyaN1KGG2xprDnvD+Jsv/9U5br
         dgs+KPjG1BTtVkHGCJZqhOGCdtWdqe6rEYB7osS5u7mE8/eM+7J1xu5LzsnDAUAYRjMv
         IEZPTEGoyH8Y08LgvRza+XTA6hZ5Oj6jpsWgiu0lgXJaB15P8F0CBkbhA4ZB9RXkOD7I
         caSJMSHHgGyQlgtM43ccRk3o2G+3sxmlSuTlUFpZzBaB1N1r4hWlhYsi5Je3qaXF/99z
         Xotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705483090; x=1706087890;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8DyqexMij1sKwKdg5LgDvK53F3Eitit3+gAFfHBcek=;
        b=OubMHDRoOk7xiYINdELrL2Kf3iX2ibmULKuNVk1PC9sVu+6hqzN1kqncywKQzvhgE/
         fp+0Uy4jzREMaXCqt/82Pjx0OOB2hivV9lS3Js6P6PVcly6GTX1WuFEeSGOl4fvuMA8+
         jzXfajfGkfUmi2oF9lDZWT3fuKHHGyN/Nf6pYMYvfMZAYzNnBI/RypsiooHFxgTKsjiQ
         yvTRrJCbiRcy0UdhvLkZHPnEmjJALuNu58/2/3tAcuIkG8y76EjgYwXmSp8F7e7HXiMR
         cE9FyyPepP/fALGmZwj+eMJWMnXFQUYjI5o4r1h2izi2Y2ggnOwRnMhiRe3ZZ4wzFmf0
         Elbg==
X-Gm-Message-State: AOJu0YyRIdcLJ0xmnM/EpXAfQQl26NYia5rGy+AdpfB/J3INIOjsYN68
	dCeRnngn1muQd0oGBs1D0GeY4vBAlWFV
X-Google-Smtp-Source: AGHT+IFF+Ki7pCzdu5FBIAaRrUZHVIAQWVw609Zt5d3lA/yJkk0wMRXKI6TeV6zeEiR9bEV99jrjew==
X-Received: by 2002:a05:600c:2611:b0:40e:4bb0:14b3 with SMTP id h17-20020a05600c261100b0040e4bb014b3mr3275986wma.191.1705483090296;
        Wed, 17 Jan 2024 01:18:10 -0800 (PST)
Message-ID: <244e13fe-a79f-41b3-9410-dae622cab3e9@suse.com>
Date: Wed, 17 Jan 2024 10:18:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PV: use altcall for I/O emulation quirk hook
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5f7afa11-3216-4175-b05b-3ff78920fa00@suse.com>
 <3623ab9b-903e-4576-81b9-c6debe0f900c@citrix.com>
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
In-Reply-To: <3623ab9b-903e-4576-81b9-c6debe0f900c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.01.2024 18:31, Andrew Cooper wrote:
> On 16/01/2024 4:58 pm, Jan Beulich wrote:
>> This way we can arrange for ioemul_handle_proliant_quirk()'s ENDBR to
>> also be zapped. Utilize existing data rather than introducing another
>> otherwise unused static variable (array); eventually (if any new quirk
>> was in need of adding) we may want to use .callback and .driver_data
>> anyway.
>>
>> For the decision to be taken before the 2nd alternative patching pass,
>> the initcall needs to become a pre-SMP one.
>>
>> While touching this code, also arrange for it to not be built at all
>> when !PV - that way the respective ENDBR won't be there from the
>> beginning.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Obviously the file may want moving to pv/ then. I wasn't sure whether
>> to also fold doing so right into here.
> 
> For PVH dom0, we allow almost blanket IO port access.  We could do the
> same for PV dom0 by setting up a suitable TSS IO port bitmap.
> 
> That said, x86-S is soon to revoke the ability to do that, so maybe we
> just save ourselves the work...
> 
> 
> I'm confused about "rather than introducing another otherwise unused
> static variable (array)".  Why an array?

(Again) in anticipation of there being a need for another such quirk.
Imo that would have been only consistent with the use of a function
pointer. However, ...

> In this instance, you could use the same trick as the ctxt switch mask. 
> Whether we match DMI or not, it's safe to clobber the ENDBR.  We could
> also consider a __{read_mostly,ro_after_init}_cf_clobber sections.
> 
> 
> However, it's probably better still to have a `bool prolient_quirk` and
> a direct call.  No extra vendor hooks have been added since this was
> introduced in 2007, and I really don't foresee this changing in the near
> future.  Lets just simplify it and drop all the alternatives/clobbering
> games entirely.

... I've now done this. Will send a v2 soon.

Jan

