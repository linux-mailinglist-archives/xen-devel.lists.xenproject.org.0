Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F1AA989CF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 14:31:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964571.1355328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZG9-0007pw-9c; Wed, 23 Apr 2025 12:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964571.1355328; Wed, 23 Apr 2025 12:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZG9-0007np-6j; Wed, 23 Apr 2025 12:31:25 +0000
Received: by outflank-mailman (input) for mailman id 964571;
 Wed, 23 Apr 2025 12:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7ZG8-0007nj-Kj
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 12:31:24 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd10a0ee-203e-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 14:31:21 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so46741005e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 05:31:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d4158esm24130665e9.38.2025.04.23.05.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 05:31:21 -0700 (PDT)
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
X-Inumbo-ID: dd10a0ee-203e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745411482; x=1746016282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GBcS9G1uY7lCuqevO1VuO5IR3pR48cqI8az/OBMeaTw=;
        b=Ik9Xw9ObnyBkGCeasWxcZfKuraQUoAFuBmkOz/wjLgr8meZfgJtiXKuvnOnwLJCRuV
         60fuiIRJspYNu0FO9FEKrPLfUWShezMo5gCwCbbc3PmUNyUZzDyUi2lBY9w2/oFerPa4
         qL9aq7ViSa0z879Yeea6qhvgBxRP4k2UptUGRhl7wxS7pO0J4+xZ8nKdQZfHyXgaF4Ug
         uei7eqjWFps1chTR9XgUhO+np/4k4EG3RTEoXQ/RMlsjQfxi+BveSQwNhwvDFx0AyKlr
         Y7sVM1RpR50j7uDI5nKJGLZOo/64pnjIsU1Dkr29nlwrkwQLpiKCkuK0TeGnD6XBWHGC
         HSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745411482; x=1746016282;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBcS9G1uY7lCuqevO1VuO5IR3pR48cqI8az/OBMeaTw=;
        b=stqE3zPsjL6DbsaDPBYWkUxS1dnHhkCvIoYCiOFdzSr5EMHivK7aBo2kWnuywlKEQB
         OWtLLUoNt9SAPZCUsNQ8nSrX4+/C3jFXz/x7mm4Yr/s0Z6oH08gIznacGrkwQ9SoP1vy
         Azf8GC6WbcaRIne7PiDfx5a6V21iNOEWQLt/2bj1nHUtp7NTIY5PZe4jQ1upYSPKryNN
         5RSV6jUOvRIJMlhpfDXeefi9Ve7oO8/kLTceianHUs7S5w9V1at9Pio98Ertn12HvDU/
         KKMZutfGM2VzCMXo6LP/RSk32qCfmsLBxtpwER38q37B6J3rLLKxQah2BF/NKETCY+yq
         gy0g==
X-Forwarded-Encrypted: i=1; AJvYcCUj+3gL+Eg5WYnYnVp5X2XN9sie5yVR1kAQdJcDwCTD87LgDijBmBu7/w5cz6Wq1czsufNkMgcVxpI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9X/4pYl6HXTK5FsqsRUnDsGtsSqU0089wTT7ob1kkjNU1D2sL
	iwu51GO6MOhgXhyVROxB+ABG7hhV2FrOUFTHMRX4lTBQaFqCJCyhAwM3+5Woeg==
X-Gm-Gg: ASbGnct6rnXO+dl1l4vjSLNho3h6kdVJuc9KDScCSDd81wvSGLWuj+TXdrxQVJcAdjF
	YKNisDPGIUdXp1aopf6DmgWiEkENQYsXlnvg0mhqR/2AnPCx9r2/UhPZprCm8qHTn0UAN5GBasn
	DDihacnnymIWxEKB7k2Sew7+NUPQI3N0dWWVMuvUMkSA145aLaD/e4mvhT+/UEXyw3GJFOjoOTe
	Yze1Mmk34NGisDN5u5jEN3H596onV0rkYiOf0NOXCy5dvQWXoJ9LO7zZWvufCEDlMvs9ByR8fjw
	0gANDDKZs75wGhfz7pvBzKMVjL2dfK/nkLtI6+fzFAYcpImO9THrzhiScEIwtaFpdai/xSCnP1N
	gq73A2mEiBzw5YnaTRxCVCu2gtGazL8D4h5qM
X-Google-Smtp-Source: AGHT+IGXWMEnQlOXV+AULJQx5JZOdJxXzJMp5XCrUzqylx3RkgcsDzbntMlXOrQOMIv7cBvMbzR5Qw==
X-Received: by 2002:a05:600c:3485:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-4406ab7b67bmr155986095e9.6.1745411481785;
        Wed, 23 Apr 2025 05:31:21 -0700 (PDT)
Message-ID: <1c25b268-3229-4d98-8d3e-10d5610e367c@suse.com>
Date: Wed, 23 Apr 2025 14:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: adjust BSF/BSR behavior as to EFLAGS
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df3f3203-d660-4b7d-b771-871d16a8ec43@suse.com>
 <fc49cdec-69aa-4ae0-8d8e-cf6d6ba8fb74@citrix.com>
 <23a4d3fb-f700-4830-959f-d67b4d4cd980@suse.com>
Content-Language: en-US
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
In-Reply-To: <23a4d3fb-f700-4830-959f-d67b4d4cd980@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2025 13:09, Jan Beulich wrote:
> On 23.04.2025 11:49, Andrew Cooper wrote:
>> On 23/04/2025 7:13 am, Jan Beulich wrote:
>>> @@ -5286,25 +5284,23 @@ x86_emulate(
>>>              else if ( !dst.val )
>>>                  _regs.eflags |= X86_EFLAGS_ZF;
>>>          }
>>> -        else if ( zf )
>>> +        else
>>>          {
>>> -            _regs.eflags |= X86_EFLAGS_ZF;
>>> -            dst.type = OP_NONE;
>>> +            emulate_2op_SrcV_srcmem("bsf", src, dst, _regs.eflags);
>>> +            if ( _regs.eflags & X86_EFLAGS_ZF )
>>> +                dst.type = OP_NONE;
>>
>> On Intel, BSF/BSR writes back the destination register.  Notably, it
>> gets 0 extended per normal rules,
> 
> That's also only on "older processors", as per the other footnote.
> 
>> which is why you have to be extra
>> careful when using the trick of preloading it with -1; the result must
>> be interpreted as (int) even over a 64bit operation.
>>
>> This needs an amd_like() qualification to override dst.type.  This
>> aspect genuinely is different between them.  Alternatively, we might be
>> able to set the operand size always to 64 and write back the entire
>> register as the processor gave to us, but I'm not sure if that will have
>> effects elsewhere.
> 
> Besides (as per above), amd_like() not covering all cases, this would
> then further need special treatment for 16-bit opsize. Plus promoting
> to 64-bit would require manually clipping the result to 5 bits when
> the original size wants 64-bit. That's imo far more complications
> than gains.

I guess I viewed this as more complicated than it is: We'd merely need
to zero-extend the source operand from opsize to 64 bits. The one
uncertainty there would be whether the undefined arithmetic flags
couldn't be dependent on operand size.

Tangential to this: Software having probed for the specific behavior of
the two insns (EFLAGS and/or destination register setting for a zero
source) will break when migrated. Therefore in principle we ought to
prevent such migrations. Thoughts there?

Jan

