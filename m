Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF454AB39AF
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 15:53:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981505.1367900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETaV-0008DC-EA; Mon, 12 May 2025 13:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981505.1367900; Mon, 12 May 2025 13:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uETaV-0008AR-Ap; Mon, 12 May 2025 13:52:59 +0000
Received: by outflank-mailman (input) for mailman id 981505;
 Mon, 12 May 2025 13:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uETaT-0008AL-TO
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 13:52:57 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68733490-2f38-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 15:52:56 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ad24b7e0331so234739866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 06:52:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23f91bc29sm372746666b.96.2025.05.12.06.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 06:52:55 -0700 (PDT)
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
X-Inumbo-ID: 68733490-2f38-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747057976; x=1747662776; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8/RLF51UJaNE46KzrtNql2Sht6Sf0h+ntpwex1lsjaw=;
        b=MO56Txc3y+e1KZbyeL4w70+PivRHRGjmGFUjvvOoLLwCNops2Ipz2W3KoHvzXStb4q
         ut788U2chErtL0JH5MvfCLvTJe6EFn0duTKu2L7oa81SL2D/1oo324W82+Qi6wfbYoLk
         6AbvD0xo4beIT6vWgjZrLftdZ2q/6m5iSU8c775p9nK6jpgk6reLJslx51zS3u95/IwU
         ttD4dWu/oEPZ1xbfms6Avp4vC25/yrfiadBXd2dVM3FiPOypQ5vVh0L9JdoH5xIzRuDe
         kucDUoPRxTf95idtwfb+onGLsDkgXCBH+P4Lc6UUJWbsTcqkY6zxxvihrLtbf4zE7Q3k
         yC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057976; x=1747662776;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/RLF51UJaNE46KzrtNql2Sht6Sf0h+ntpwex1lsjaw=;
        b=Q7F51XrBmia19PlaAHw5cq5yFIxX4X9xZTvnbfIFYiGmznXRnNfpwOE5t/I2+Yc2+3
         FO7AOy92cQ1ZXCmlPLOvZXudXy2qAeXXFgrRS4b+Dlcy7XAqYm/4C6NHtOpLJxBOWfQt
         QDFgCwF77ky5jJszL6Ib+BAQWdN14sg6o1zwsZLk+K8pOJXAuzpeiqdI7dUi1sOYjjJE
         lTYM40aOQNBWReIVSQB/9pT3FjtAbB0VLIhT9W9uBaqea537GJZYAS3DlJu3oZNJcE+t
         gawZzS60j+K3TwuVuIOS8SGG6Hcjrzmg+ne6MZ4F/D1vPS8ie8JjL0ZLuDwG2AtARV4W
         DYFg==
X-Forwarded-Encrypted: i=1; AJvYcCVy0RNfFSdYKjKuHe0VdezGQtfUBTgsSHl5RcKMVbyblGcN9sr7Jua0MF6NYGr05HZftPiB2gJmn94=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzoop61B8Y7kw2SqxsFrqCrgEIFJ1v5clAkIrb+Vp24XJj+tVDx
	U65eAK1qQ9zffSkIuUPDQ30S5mctSgJEoSrKDIANOT8hiI3L2vQzF6wBBYA/nA==
X-Gm-Gg: ASbGncvEz8aV9Y/BeDIqSrdGH1PCDqxBz/yt/11jH3JJDiwlGU5HbWX5R7ZZX6l1ypk
	CbJ/sZOuZRXlQXCvv2oEff1uPbgmsDlVl9cVh5WeHRSRiM9doZO3XKh1lA5ht0dib4jaWGWQb0k
	8nzL3Y6WVMwaaWEH3ZlaUJrEDqc6eW3X/gQAgumyZ1aGbGrOy+sQF1UlBzMvvzky8+EQYJFV8YS
	VkpyHVY3BWJxijUQH4zZ68FyFhYUlxekTtHivfygobFY+Q2OZrP3UIJ9QyA6dlpK6GWkhsFf9ve
	SdBt2HBKbxAs+q4W5xa8gpOWzqVpa9UxZVg9/oWY4IIHVDm4lMrWZ8y2+tY/m7TINAZtOxTGspn
	R49p+wmrCOXEHuCCz8RrjCgUcmdMcVaMdAfcI
X-Google-Smtp-Source: AGHT+IHxXff6MJLgLPZ54zNa+aijA+HxXc0tRlIYu9AMGaodAOKw+tvZVLWpbbu8vZLdtwaOGdWb+w==
X-Received: by 2002:a17:907:72d0:b0:ace:6d5b:e785 with SMTP id a640c23a62f3a-ad2192b6b17mr1196407166b.47.1747057976081;
        Mon, 12 May 2025 06:52:56 -0700 (PDT)
Message-ID: <38d1e57b-4991-40f3-b826-935e3416bbdd@suse.com>
Date: Mon, 12 May 2025 15:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/idt: Minor improvements to _update_gate_addr_lower()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250512115821.3444375-1-andrew.cooper3@citrix.com>
 <af50a50c-599f-4cf9-92db-7d2aee8cedec@suse.com>
 <c7d2a090-dc03-449a-bf6c-10479cbf1ec7@citrix.com>
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
In-Reply-To: <c7d2a090-dc03-449a-bf6c-10479cbf1ec7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 15:48, Andrew Cooper wrote:
> On 12/05/2025 2:21 pm, Jan Beulich wrote:
>> On 12.05.2025 13:58, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/idt.h
>>> +++ b/xen/arch/x86/include/asm/idt.h
>>> @@ -92,15 +92,16 @@ static inline void _set_gate_lower(idt_entry_t *gate, unsigned long type,
>>>   * Update the lower half handler of an IDT entry, without changing any other
>>>   * configuration.
>>>   */
>>> -static inline void _update_gate_addr_lower(idt_entry_t *gate, void *addr)
>>> +static inline void _update_gate_addr_lower(idt_entry_t *gate, void *_addr)
>> Considering comment and name of the function, ...
>>
>>>  {
>>> +    unsigned long addr = (unsigned long)_addr;
>>> +    unsigned int addr1 = addr & 0xffff0000U; /* GCC force better codegen. */
>>>      idt_entry_t idte;
>>> -    idte.a = gate->a;
>>>  
>>> -    idte.b = ((unsigned long)(addr) >> 32);
>>> -    idte.a &= 0x0000FFFFFFFF0000ULL;
>>> -    idte.a |= (((unsigned long)(addr) & 0xFFFF0000UL) << 32) |
>>> -        ((unsigned long)(addr) & 0xFFFFUL);
>>> +    idte.b = addr >> 32;
>> ... doesn't this line want dropping altogether? Or at best be an assertion?
> 
> That's what _write_gate_lower() does, hence why
> _update_gate_addr_lower() needs to calculate .b.

To satisfy that, idte.b = gate.b would be all we need (i.e. just like
_set_gate_lower() does). Or else I think the "lower" would need dropping from
comment and name here.

Jan

