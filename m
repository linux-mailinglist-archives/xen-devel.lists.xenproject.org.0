Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1AAA5F935
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912423.1318676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsk7D-0005Xl-Su; Thu, 13 Mar 2025 15:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912423.1318676; Thu, 13 Mar 2025 15:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsk7D-0005VA-Pr; Thu, 13 Mar 2025 15:04:55 +0000
Received: by outflank-mailman (input) for mailman id 912423;
 Thu, 13 Mar 2025 15:04:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsk7C-0005V4-8A
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:04:54 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82155378-001c-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 16:04:49 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39130ee05b0so1086066f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:04:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7ec14bsm2351809f8f.100.2025.03.13.08.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:04:47 -0700 (PDT)
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
X-Inumbo-ID: 82155378-001c-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741878288; x=1742483088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BzgDhyGUNoS43ZUDF27a1tC5fdoF5dyODzOY/sUqlVc=;
        b=ae6eqc8uubCgPvZ3pqtq4qrVtc5keyRFNNWdNsZn3HCTA9FqFAxXdGnJxBnLgcbIRo
         b+8HMV0als+gAehk6b62Od5jxjmNMnH8IBl5ck+wFAgZ46E96bEeksJEgN05kVVXxSov
         CD9LNMbipjXueNoma7hb+WyzAGcJeoaMKZWF8kVs3r9NA9t3B5/sU99ft72BRzYrgqq4
         ivjwM09f3vs3+dpUB/z7AnVwTq/+HlvXvnYcTe1h/ryeGoMbUyaaPgF2smvRp944gP6u
         pu71pGQr5QLhHGVOF7wXosp2PJfJGXbWrYo7Dl3rC0xNPJ4Y242qi350gIO/ftnZyhYj
         NM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741878288; x=1742483088;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzgDhyGUNoS43ZUDF27a1tC5fdoF5dyODzOY/sUqlVc=;
        b=ESa04OyRnwUP44T+OQ1ATaZqLYqI7CLGeNRwsJIhVCZmeEgeUlOwxURaiwQLBwd5C9
         6hAxPTc9wNC49OCo0DAA6YHheDoz2/14PlNjqnHDxky3x4uDSwsq+U2z+BbNY6hTqMkx
         RUpzZE2hxHnhwPtU1o+fFKNawjyR92RNCJmqp2Do2WE5QdPkFJYWceXM9AL7k8O4IGZu
         BGY1CP2M6GgSDN7OlhzkQ5Hdv/gJ6jBYG7GWTcXO5Wr1xHNPcepSSxOjCEO5/a6+veeG
         JLwSqrkn0uOBthRizAmfF/VD51KIuJdI0MX47hgjxkYZ8okAT1l/qRE1PRlNiW4Rh5QY
         P7vg==
X-Forwarded-Encrypted: i=1; AJvYcCUAZkObWgrP5sDb9UoPRiDtoO2OnYAGPsW97yjqIbSjiB0u1jpKUfHUIDuczkya0/bsHOPQ8bpQZiU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA3c0A5rBM33E+vHNVjE0a7WdJFPwWYN7C3vfbUWhtTItUrT6L
	31Mdawy8XN9pHOuetYqyrB3dajDkGiVwHT3t+fcbtDQJKAn9iJmvGEBWkGUn+Q==
X-Gm-Gg: ASbGncsgUTzBGK1Y5as1eqctNXdNShH/qVTc/tNjh6NDHkO5sOe6dFsXURs/moSWeDC
	xJyxZApsW3h5dKvIqPoyq5TSx9DxjHCSsk8GXGZa0g/jFAfKi8Fx9J7pAZ5RUZMQDPDizQjhRyn
	cP4d2TWhOQr5jI5/2qmLQnk5xa69KKgxSkMxfXqEpvywglg0syczsIzJlgllv6yPqfqJJ04ox30
	PZZq6R7rnYlHVYcBOzrjHIy5wgrtmXQ8+pk3+n7+5t3zlttJj4oiGOsCULHeZpJbYn1r/dRVMn7
	UDhdoPjWtoMsbuGCS69AmUGNqES0mxLi9c9H/d93WIDF+r3YnQpHBjalObe052gZbhDA421yl1v
	mA4/GmImnsRtoUBSeZAK0CQ4ZshZxXA==
X-Google-Smtp-Source: AGHT+IHV13ef9GiZKPeJeqOLimhEgDkyupz2sHDaN6hkL9OvKCcyA3ZMdiL7DLwBO8LzgDY/i6HW3Q==
X-Received: by 2002:a05:6000:1568:b0:391:45e9:face with SMTP id ffacd0b85a97d-39145e9fb7emr15325204f8f.54.1741878288315;
        Thu, 13 Mar 2025 08:04:48 -0700 (PDT)
Message-ID: <84c4d9c9-0cc8-40eb-b1d3-2eee7a6cfadc@suse.com>
Date: Thu, 13 Mar 2025 16:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools: Mark ACPI SDTs as NVS in the PVH build path
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250311092905.991-1-alejandro.vallejo@cloud.com>
 <9cb526f9-fd2c-424c-82b1-7db57e0db50c@suse.com>
 <D8F7L45LN2IQ.1X616YGM6C4DJ@cloud.com>
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
In-Reply-To: <D8F7L45LN2IQ.1X616YGM6C4DJ@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2025 15:30, Alejandro Vallejo wrote:
> On Thu Mar 13, 2025 at 1:14 PM GMT, Jan Beulich wrote:
>> On 11.03.2025 10:29, Alejandro Vallejo wrote:
>>> Commit cefeffc7e583 marked ACPI tables as NVS in the hvmloader path
>>> because SeaBIOS may otherwise just mark it as RAM. There is, however,
>>> yet another reason to do it even in the PVH path. Xen's incarnation of
>>> AML relies on having access to some ACPI tables (e.g: _STA of Processor
>>> objects relies on reading the processor online bit in its MADT entry)
>>>
>>> This is problematic if the OS tries to reclaim ACPI memory for page
>>> tables as it's needed for runtime and can't be reclaimed after the OSPM
>>> is up and running.
>>>
>>> Fixes: de6d188a519f("hvmloader: flip "ACPI data" to "ACPI NVS" type for ACPI table region)"
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>> v1->v2:
>>>   * Copy explanatory comment in hvmloader/e820.c to its libxl_x86.c counterpart
>>>
>>> ---
>>>  tools/firmware/hvmloader/e820.c |  4 ++++
>>>  tools/libs/light/libxl_x86.c    | 17 ++++++++++++++++-
>>>  2 files changed, 20 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tools/firmware/hvmloader/e820.c b/tools/firmware/hvmloader/e820.c
>>> index c490a0bc790c..86d39544e887 100644
>>> --- a/tools/firmware/hvmloader/e820.c
>>> +++ b/tools/firmware/hvmloader/e820.c
>>> @@ -210,6 +210,10 @@ int build_e820_table(struct e820entry *e820,
>>>       * space reuse by an ACPI unaware / buggy bootloader, option ROM, etc.
>>>       * before an ACPI OS takes control. This is possible due to the fact that
>>>       * ACPI NVS memory is explicitly described as non-reclaimable in ACPI spec.
>>> +     *
>>> +     * Furthermore, Xen relies on accessing ACPI tables from within the AML
>>> +     * code exposed to guests. So Xen's ACPI tables are not, in general,
>>> +     * reclaimable.
>>>       */
>>>  
>>>      if ( acpi_enabled )
>>> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
>>> index a3164a3077fe..2ba96d12e595 100644
>>> --- a/tools/libs/light/libxl_x86.c
>>> +++ b/tools/libs/light/libxl_x86.c
>>> @@ -737,12 +737,27 @@ static int domain_construct_memmap(libxl__gc *gc,
>>>          nr++;
>>>      }
>>>  
>>> +    /*
>>> +     * Mark populated reserved memory that contains ACPI tables as ACPI NVS.
>>> +     * That should help the guest to treat it correctly later: e.g. pass to
>>> +     * the next kernel on kexec.
>>> +     *
>>> +     * Using NVS type instead of a regular one helps to prevent potential
>>> +     * space reuse by an ACPI unaware / buggy bootloader, option ROM, etc.
>>> +     * before an ACPI OS takes control. This is possible due to the fact that
>>> +     * ACPI NVS memory is explicitly described as non-reclaimable in ACPI spec.
>>> +     *
>>> +     * Furthermore, Xen relies on accessing ACPI tables from within the AML
>>> +     * code exposed to guests. So Xen's ACPI tables are not, in general,
>>> +     * reclaimable.
>>> +     */
>>
>> When asking for a comment here I really only was after what the last paragraph says.
>> Especially the middle paragraph seems questionable to me: It would not only be ACPI-
>> unawareness, but also E820-unawareness, for the range to be prematurely re-used. And
>> buggy bootloaders really would need fixing, I think - they'd put OSes into trouble on
>> real hardware as well.
>>
>> In short - I'd like to ask that the middle paragraph be dropped from here (which
>> surely could be done while committing).
> 
> I feel the rationale is the same on both paths, so the comment blocks ought to
> be aligned (whichever way). But I have no strong motivations and would be fine
> dropping the middle paragraph here.
> 
> If that's your only remark, I'm happy for it to be dropped on commit.
> 
>>
>> However, there's a second concern: You say "PVH" in the title, yet this function is
>> in use also for HVM, and ...
>>
>>>      for (i = 0; i < MAX_ACPI_MODULES; i++) {
>>>          if (dom->acpi_modules[i].length) {
>>>              e820[nr].addr = dom->acpi_modules[i].guest_addr_out & ~(page_size - 1);
>>>              e820[nr].size = dom->acpi_modules[i].length +
>>>                  (dom->acpi_modules[i].guest_addr_out & (page_size - 1));
>>> -            e820[nr].type = E820_ACPI;
>>> +            e820[nr].type = E820_NVS;
>>>              nr++;
>>>          }
>>>      }
>>
>> ... this code is outside of any conditionals. This imo needs sorting one way or
>> another.
> 
> ACPI tables are populated by hvmloader, while libxl generates those of PVH.
> 
> dom->acpi_modules are populated by libxl__dom_load_acpi(), which is gated on
> the type being PVH (see the caller of this function). So this loop should be
> effectively skipped.
> 
> I called it the PVH path because it happens to be at the moment. Nothing
> prevents this path from being the HVM path too, but that involves rewiring
> hvmloader.

Oh, okay - what I was missing then is that ->acpi_modules[] is populated by
libxl__dom_load_acpi(), and that bails early for non-PVH. So the loop here
will have only no-op iterations for HVM.

Jan

