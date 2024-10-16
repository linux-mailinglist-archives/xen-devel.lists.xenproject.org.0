Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930589A052A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 11:14:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819713.1233128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1062-0004M1-Da; Wed, 16 Oct 2024 09:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819713.1233128; Wed, 16 Oct 2024 09:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1062-0004Jj-B2; Wed, 16 Oct 2024 09:13:34 +0000
Received: by outflank-mailman (input) for mailman id 819713;
 Wed, 16 Oct 2024 09:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sXg9=RM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t1061-0004Jd-9F
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 09:13:33 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e97c42b7-8b9e-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 11:13:31 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4305724c12eso48277935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 02:13:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4315003b77bsm17145275e9.11.2024.10.16.02.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 02:13:30 -0700 (PDT)
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
X-Inumbo-ID: e97c42b7-8b9e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729070010; x=1729674810; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6XJAmjeGWKRRytQ/d0fJZrOi68XkeC/sjEipn/cjjRo=;
        b=ObvFm1SB/vOz6KmY7fQf/+ImbMw+lgQA8Wh3B6vmZpzbtOLzcVa78/NgvxUqgzbaZV
         tYMMYYLV/UTjq5jINuVO3+N59zf1kORK8w3e1bDMPEgNeFLTcG4m/rbYVFDS79ZFO+X1
         c6oAzcjc8xJQYwT18qeWSgQrBmjGB1XGLMDiF0Va9SUrpxmJJkaE4W+ah52ivCnjah+6
         GFk9BxbV4ggHL1QqAg9M9uS/NEerMB/Lt186EUPJu8drRTeyv5DOzI6DThw2bYyINcsP
         162UccU7xNPRvzdWnlchbk+AfCUpyda0FM4ZEiVkeSmalIQ4lJPIGhjisV6waDpluhax
         mHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070010; x=1729674810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XJAmjeGWKRRytQ/d0fJZrOi68XkeC/sjEipn/cjjRo=;
        b=KZbdB8uohIBBwk66oDGB3gG9Vt2nOSAFW56jr2idSl+C7EjnZrHeKWcTY7jROMY+Lj
         vR1YxvOhrcgluFk6YbFpXfWACk42q5Jmyvkner0qiYEPX3gMwcWD2Lj5ahMzf8dust2H
         XuZ7ViZeg+iZ+MV7QJUraNwpdVQ+Q0Ksg60JGMMBQvNnwi+CO7siN9rwt1wy2Bvn8+XH
         /bG8m7iwiNS25pj/ks5hmqIi2Ew+iBLmtr3ysbBg96PF7j69zY6UJ3hjkOUT/W5jj0dS
         xyqu0BGVMOMHhNOkEMR4R+kmP+en7TrmillLI+Y+4L2IeTwpgjoC9007x/lIfNaJoPly
         ukTw==
X-Forwarded-Encrypted: i=1; AJvYcCUe09iZCImjMgcMiKZ4wC9zCKeP0DzxOQSjh1fws3WBeaolioxE6Xb+5kZoA6qlY0BSEkGXBk+dCc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgbXoklzs/GyLv8Ne7J0xkhLAl+tSiBub38VbW5U8Giko4jRdN
	1MpnrAjCa85Jn/zhpHCf2tHnUaBpmBn+YMKCn4UFggTcVujLVYjdLql+vXCiRQ==
X-Google-Smtp-Source: AGHT+IFJIOyZt8ke0d7FPk4ygwh/a9/j4efcFu4bFagtbRJMM/zMmDiX6xFbgu6wTJ+zQaEMPeoJ+w==
X-Received: by 2002:a05:600c:1d91:b0:42d:a024:d6bb with SMTP id 5b1f17b1804b1-431255e76dcmr108308795e9.20.1729070010505;
        Wed, 16 Oct 2024 02:13:30 -0700 (PDT)
Message-ID: <c1f1d35f-beeb-4241-ab41-4ac143858f98@suse.com>
Date: Wed, 16 Oct 2024 11:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/riscv: initialize bootinfo from dtb
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1728481578.git.oleksii.kurochko@gmail.com>
 <70c98147d7f977649ca3eb1a82cd76aeb0df1b14.1728481578.git.oleksii.kurochko@gmail.com>
 <7e3399d7-f41c-4696-919b-dc7f57168bf9@suse.com>
 <fce8372ee3bac4a0a3c6de58d7c7757df6e6d0a3.camel@gmail.com>
 <9ff389f6-874b-4bb1-8685-d1e0e2281c59@suse.com>
 <56f7ee95390a36202dafe9e0ba64531549b4c4eb.camel@gmail.com>
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
In-Reply-To: <56f7ee95390a36202dafe9e0ba64531549b4c4eb.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2024 09:50, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-10-15 at 14:32 +0200, Jan Beulich wrote:
>> On 15.10.2024 11:11, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-10-15 at 08:33 +0200, Jan Beulich wrote:
>>>> On 10.10.2024 17:30, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/setup.c
>>>>> +++ b/xen/arch/riscv/setup.c
>>>>> @@ -50,6 +50,8 @@ void __init noreturn start_xen(unsigned long
>>>>> bootcpu_id,
>>>>>                            _end - _start, false) )
>>>>>          panic("Failed to add BOOTMOD_XEN\n");
>>>>>  
>>>>> +    BUG_ON(!boot_fdt_info(device_tree_flattened, dtb_addr));
>>>>
>>>> We generally aim at avoiding side effects in BUG_ON() (or
>>>> ASSERT()).
>>>> With
>>>>
>>>>     if (!boot_fdt_info(device_tree_flattened, dtb_addr))
>>>>         BUG();
>>>>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> I can make the adjustment while committing, if desired.
>>> It would be great if these changes could be made during the commit.
>>
>> I've committed it with the adjustment, 
> Thanks!
> 
>> yet once again I wondered: Why not
>> panic()?
> It could be panic() here; there's no specific reason. I agree that
> using BUG() here isn't logically correct, as technically, a size of
> zero for the FDT isn't a bug but rather indicates that someone provided
> an incorrect FDT to Xen.
> 
> I will use panic() in the future for such cases.
> 
> It’s not always clear what should be used and where. Perhaps it would
> be helpful to add some explanation somewhere.

My rule of thumb: During init and when the call stack / register state
aren't relevant to understand the details of the issue, use panic().

Jan

