Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9920C87C039
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 16:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693325.1081251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkn22-0002YK-I2; Thu, 14 Mar 2024 15:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693325.1081251; Thu, 14 Mar 2024 15:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkn22-0002WT-EH; Thu, 14 Mar 2024 15:30:10 +0000
Received: by outflank-mailman (input) for mailman id 693325;
 Thu, 14 Mar 2024 15:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkn21-0002WN-A4
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 15:30:09 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd1a7950-e217-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 16:30:08 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56845954fffso1295443a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 08:30:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d3-20020a1709064c4300b00a466d1641f0sm795163ejw.123.2024.03.14.08.30.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 08:30:07 -0700 (PDT)
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
X-Inumbo-ID: bd1a7950-e217-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710430207; x=1711035007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YH0oQ8jj10jESIRADjk9ySvuGKF46f+zs1nG8AmLPO8=;
        b=WgCgGMK/9NAL8zFzXbVahMR9Ulg527Wm2oZx+SzfjWL/iIaZl4w/L0WyZqvhHfvI0i
         Vkwp9ATm+EGCZadYSJXiZ3z8JhD/Ol5CZG0juHg+IuDQsKBcNdvgADHz0XA7e9VR7+kR
         BWfZQ/6Q0biWSpIHHSt4V28Pb/qV3LX2bvduCTRsugzRp+3Ug/nrbunyk072rCXotW5D
         YXUCibZtnbWYmB3SNPv8Ws5Fn9Y6fSurKVAhGaCHuEI2PlObVA+XEKEZufTqhMQI+Pd4
         HlyJlUEOH5wBT18+Vsjr3rU21vS3p5ftOmGDbONpJPK+Q5rIJBV2v1pGLuQLm5xGsVbS
         j5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710430207; x=1711035007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YH0oQ8jj10jESIRADjk9ySvuGKF46f+zs1nG8AmLPO8=;
        b=kueta4wsFscA2KARKpuzeraveRie/uET4muHrjGlYveIc6S6N+pG6+64LzLki/PL6Q
         30HyRFYqzoyNos9yiW0Mwmag92NOcnPfUmbckOPx2OoMg77tz9jIP82DyA5Z23bPYWfm
         E1a0kRP5pn3CAOs5OnWXq1pva9JhHwoWc4Jg7a6l2MamCRTLCPkBHmxZBsRUL18Rg5+K
         2thjNd4W8X+1KXLyJxt35/tqu/Ad9w3N8Gda9NgWwykUUwI5OznnDkyC3bD5Jx9tMhDD
         VHgW9eI2G9rLeSHhN7yvH9D/lHfjbcExArL4oe3HFyNAGYhc8zCsOaOhExLBBW2qfrWw
         2wyA==
X-Gm-Message-State: AOJu0YzZB+mrPtHhb3L55+4y3LPhWneZPxdGy62sC8aw3zMZSNS7n79C
	AByKaXWBQDEwN3C8mdCtfzGD2UPmCEifXPhiuFz+CdxDvwke1J5D6BBQgwqgTg==
X-Google-Smtp-Source: AGHT+IF3K4rRN/KBPvxNp1/4QSSPNAElPWrQuZ3rM+GcDXf+ka9odBNf+r1r9PX9CwEI47qG74sPjQ==
X-Received: by 2002:a17:906:1c0e:b0:a45:ebdf:b071 with SMTP id k14-20020a1709061c0e00b00a45ebdfb071mr218277ejg.35.1710430207539;
        Thu, 14 Mar 2024 08:30:07 -0700 (PDT)
Message-ID: <a531578e-ade0-45bb-b916-e195e51e97cf@suse.com>
Date: Thu, 14 Mar 2024 16:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com> <ZfLIBHTbcbGqFAhY@macbook>
 <afb3aa21-cd8b-425d-a4fa-b9ca57367d28@amd.com> <ZfMKuUqopaj-Gubu@macbook>
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
In-Reply-To: <ZfMKuUqopaj-Gubu@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.03.2024 15:33, Roger Pau Monné wrote:
> On Thu, Mar 14, 2024 at 09:51:22AM -0400, Jason Andryuk wrote:
>> On 2024-03-14 05:48, Roger Pau Monné wrote:
>>> On Wed, Mar 13, 2024 at 03:30:21PM -0400, Jason Andryuk wrote:
>>>> @@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>>>>                   elf_note_numeric_array(elf, note, 8, 0),
>>>>                   elf_note_numeric_array(elf, note, 8, 1));
>>>>           break;
>>>> +
>>>> +    case XEN_ELFNOTE_PVH_RELOCATION:
>>>> +        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
>>>> +            return -1;
>>>> +
>>>> +        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
>>>> +        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
>>>> +        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);
>>>
>>> Size for those needs to be 4 (32bits) as the entry point is in 32bit
>>> mode?  I don't see how we can start past the 4GB boundary.
>>
>> I specified the note as 3x 64bit values.  It seemed simpler than trying to
>> support both 32bit and 64bit depending on the kernel arch.  Also, just using
>> 64bit provides room in case it is needed in the future.
> 
> Why do you say depending on the kernel arch?
> 
> PVH doesn't know the bitness of the kernel, as the kernel entry point
> is always started in protected 32bit mode.  We should just support
> 32bit values, regardless of the kernel bitness, because that's the
> only range that's suitable in order to jump into the entry point.
> 
> Note how XEN_ELFNOTE_PHYS32_ENTRY is also unconditionally a 32bit
> integer.
> 
>> Do you want the note to be changed to 3x 32bit values?
> 
> Unless anyone objects, yes, that's would be my preference.

As mentioned elsewhere, unless the entire note is meant to be x86-specific,
this fixed-32-bit property then would want limiting to x86.

Jan

