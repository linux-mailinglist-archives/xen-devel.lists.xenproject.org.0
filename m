Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662619C1724
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 08:44:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832249.1247659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9JfH-0003uz-8S; Fri, 08 Nov 2024 07:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832249.1247659; Fri, 08 Nov 2024 07:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9JfH-0003sQ-5s; Fri, 08 Nov 2024 07:44:19 +0000
Received: by outflank-mailman (input) for mailman id 832249;
 Fri, 08 Nov 2024 07:44:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t9JfG-0003sK-4d
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 07:44:18 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ebdb1f2-9da5-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 08:44:14 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d8901cb98so1736146f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 23:44:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e62dd4sm24235145ad.218.2024.11.07.23.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 23:44:10 -0800 (PST)
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
X-Inumbo-ID: 3ebdb1f2-9da5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmIiLCJoZWxvIjoibWFpbC13cjEteDQyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNlYmRiMWYyLTlkYTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDUxODU0LjAxODE3LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731051851; x=1731656651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/gHfzJ/P6xQFpsm3WRa4Drxldim7T6UdxNC5/e9gzA0=;
        b=S/ZtD1siHGIGlqaU2DdHeiRSQC2bLWd96m5cr39kZZixwmpuVX26TDrm9u/dkw9Ppk
         dzY16aj7/EZXCp0mgM/czOqWGuGoeBgJNomnyJqf8FNu36U9fdCIP3jqOn7PAM5rn+xa
         etsRk0cHtUXV1ZOur1qODOn5I3NJ4VpLf/NUnajnOUT32TFwEoBIo5ZmzQZPt1a8enBE
         WOpPgto5b7hONqZf2pulvWClBdPWS014SU3wBNOSiF3QiyrXEnTfhMp3rNXJdwmhOEWJ
         M/tL6cL23dmS5ArKlsYRHxrW3AAeipC2nk7lO2/kwWUNqrlRB4zgBi+UUJob4gb79qby
         lACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731051851; x=1731656651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gHfzJ/P6xQFpsm3WRa4Drxldim7T6UdxNC5/e9gzA0=;
        b=GV8rj08wyAlKhevtfvuKlNbR0gzZ+jzlPuMaUc0tA7dGswA/+M/LV+1PAdwmzAgF4Z
         vtZIrSdcyrzAC/OzaS4TGKOLNxDoOAAEJQZfpilMUwtfzYPStLFcu5I6dOsUET8+czbT
         qYJhgWHHGv7s6LB9xG7Shytw/NFsP4tDXY+oRyS6w5JmNrJt3fQDxQYp8RICK16gjdr9
         QnAuT5V4GO1P7/pybtML6MqiG6sd9pU3evdH8VAytLq9ZcQb7mT5Fqb/SsC+6GCfdEZ+
         El4CWk+0HtUuJDmDUDKhXpq2+PPnfQJOw9ycgeFkhJ84xn2lhgtoWAyJTRELiYiY+iyN
         y5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWLSQJ7N3E3p+O+ysDUhPL6r58owrxXNNvpbd8S37DtI0oH3mTwLGNkV4ER2poaceVqUGeHYk+alRc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0UZXMuItu7e8lSz+KXq27Twle9vsBx3ugD9oa/iVwpSh2tqFA
	a7wVeQLxHBPn859d7TSJyWwujlRz6yAMpJbpgKhrdZZjPymr4AiccgGPl6O1zw==
X-Google-Smtp-Source: AGHT+IFBrjj0DHk9Z+3vSAh74JNTpioLg2QQ41I9E3tuL1vK0BhjlU3vqY6OZhrmJtDqKMtZ2Q+ITg==
X-Received: by 2002:a5d:64c7:0:b0:37c:fdc8:77ab with SMTP id ffacd0b85a97d-381f0f57f22mr1881814f8f.7.1731051851517;
        Thu, 07 Nov 2024 23:44:11 -0800 (PST)
Message-ID: <535d6835-8823-4dea-8671-eba1527a6e1f@suse.com>
Date: Fri, 8 Nov 2024 08:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] x86/mm: special case super page alignment
 detection for INVALID_MFN
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-3-roger.pau@citrix.com>
 <2d11d5c6-4e87-4520-af48-844c90462620@suse.com> <ZyziLfZGLZJBSEjo@macbook>
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
In-Reply-To: <ZyziLfZGLZJBSEjo@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2024 16:52, Roger Pau Monné wrote:
> On Thu, Nov 07, 2024 at 12:06:41PM +0100, Jan Beulich wrote:
>> On 06.11.2024 13:29, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/page.h
>>> +++ b/xen/arch/x86/include/asm/page.h
>>> @@ -202,7 +202,8 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
>>>  
>>>  /* Check if an address is aligned for a given slot level. */
>>>  #define SLOT_IS_ALIGNED(v, m, s) \
>>> -    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)
>>> +    IS_ALIGNED(PFN_DOWN(v) | (mfn_eq(m, INVALID_MFN) ? 0 : mfn_x(m)), \
>>> +               (1UL << ((s) - PAGE_SHIFT)) - 1)
>>>  #define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
>>>  #define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)
>>
>> With this adjustment it feels yet more important for these macros to
>> become local ones in x86/mm.c. This special property may not be what one
>> wants in the general case. And m is now also evaluated twice (really:
>> once or twice), which a "random" user of the macro may not like.
>>
>> I'm further uncertain now that this is the way to go to address the
>> original issue. Notably for the 1G-mapping case it may be better to go
>> from the incoming flags having _PAGE_PRESENT clear. After all we can
>> always create non-present "large" PTEs. E.g.
> 
> Hm, I don't think we want to do that in map_pages_to_xen() as part of
> this change.  Doing so would possibly imply the freeing of
> intermediate page-tables when Xen previously didn't free them.  If the
> CPU didn't support 1GB mappings we would always keep the L2, even if
> fully empty.  With your proposed change we would now free such L2.
> 
> I'm not saying it's a wrong change, but just didn't want to put this
> extra change of behavior together with a bugfix for an existing issue.

I can understand your concern here; perhaps indeed best to keep that
adjustment separate.

>>         if ( (cpu_has_page1gb || !(flags & _PAGE_PRESENT)) &&
>>              IS_L3E_ALIGNED(virt, flags & _PAGE_PRESENT ? mfn : _mfn(0)) &&
>>              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
>>              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
>>
>> Thoughts?
> 
> I was doing it based on mfn because that's how it worked previously
> when 0 was passed instead of INVALID_MFN, and because I think it was
> cleaner to hide the evaluation inside of IS_LnE_ALIGNED() instead of
> open-coding it for every call to IS_LnE_ALIGNED().
> 
> If we want to do it based on flags it would be best if those are
> passed to IS_LnE_ALIGNED(), but again, might be best to do it in a
> followup patch and not part of this bugfix.  I fear it could have
> unpredicted consequences.

Here, however, I view the flags-based approach as simply a different
(and imo more correct) way of addressing the issue at hand. The special
casing of MFN 0 had always been somewhat bogus imo, just that in the
old days we didn't even have a proper INVALID_MFN.

Jan

