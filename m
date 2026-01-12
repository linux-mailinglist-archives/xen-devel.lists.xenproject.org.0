Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4ABD11F1A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 11:37:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1199983.1516004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFIe-00004q-Ct; Mon, 12 Jan 2026 10:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1199983.1516004; Mon, 12 Jan 2026 10:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFIe-0008Um-9D; Mon, 12 Jan 2026 10:37:28 +0000
Received: by outflank-mailman (input) for mailman id 1199983;
 Mon, 12 Jan 2026 10:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfFIc-0008TO-Nb
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 10:37:26 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aea53b99-efa2-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 11:37:24 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-432d2c7a8b9so2800242f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 02:37:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432dfa6dc4esm16111779f8f.23.2026.01.12.02.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 02:37:23 -0800 (PST)
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
X-Inumbo-ID: aea53b99-efa2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768214244; x=1768819044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsy5JRy52pNUjoI5qh5aqHNljieCFgusvqeG3TQZs4E=;
        b=aHGuIS0tz6E34lhnLNKdlliCNjNLXHHcCOgltSjpFC0t8qJGfbaa3f4iQ8ojiFDI9O
         SrTFfCg5y+YcNXz3jVNSa0OcrWYelya+41OW1fDYeXwEYybqOGvO25osY/fOuUKPkIL1
         PYAKBvTZsbvkHZfRHKvxIm6dZAutjO2d+vGZJHH840JJUrmNBthj3OWO99XWgD0qTPLB
         CL9GnTyJDHyUdDj6KtCLDYGzHJ8lUdEuXf+4SSn2HTkUL7/N9wyTe8TC3Av2pvfmRReO
         Djgq9FXbKS21bX0IhDljPqWC1FdRsTA5TuAWDB41NwPl/CNL3cnW9Th6jcid6JFebgdN
         R0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214244; x=1768819044;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nsy5JRy52pNUjoI5qh5aqHNljieCFgusvqeG3TQZs4E=;
        b=jEX9cD37u3KLbP1cem8kPGdZ4eewIkflvcZ0PjrDkvPdfVY6YotwgASsbJXNCdE/4I
         PEHO2g29ABE1up9OaGIHKAWqKy5hYoYdRKhZTS9hmfVbjbsNzs2mBN9JET2s9pkHZmOv
         JKHeh4ptQJwkgyG2d6/Mu3FdalrfcKBo2wLyiLrOi0aMpjjzDOI3+5FQAgqfLJe7Xlbh
         3EnBy0DlhZ0mCsRDN7hgeZbUcao14OYzmpm7m1L4zgw7pdqwuR4Q6j4PyAOOOyx8EDdu
         JW/NbIuo0DeyzfwCsh2/JYOnauVMY2CQmp79McAkImG8E7swYCvvs2Sze+LbGRajYd6O
         0O8g==
X-Forwarded-Encrypted: i=1; AJvYcCUOWjoZlGbbXfIq5QmS/jY3NewRk0WfNqOT20MkzpDZOEnbYbC1z0173aq9lAjyg/Y8urnwQfKYqtk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxO3bYmeDB4+094cPpT2noDklSIHhXv5LgXBZvP5Uc+Xyw6ef42
	gNRKakITdK58BIWkV9A8d/l/Ys8t4SDLLh+QwefXDqtoiJGCnSryioUOIszG9gsIjA==
X-Gm-Gg: AY/fxX66MBAtWiB7SflXHTbdG+HCAAMO1v4nNpsX0UxuS6QSOyCvNsQ2tW/zeCsTenb
	UMIEmwfS+ilpe+zFTtBwBIHeaVcv24CECBKXpPMzEILEFbI8/pRBP0YDvSyVBT/7gfmwW0578Ff
	C3IdKUVBb66hn20pAnWng8H6O7a2LEoSHhXIyDkJ2fNbl4v64M7jJ2ygcVYX7UMIuvON+1C3Gfh
	8sBpdF9D2LNpdTs4Zh+08AFIaUZ08nDt8drA9ylKYrAdr0QOxNuhPNSPLtWYFr15ropOTTohHgV
	tUjAC8pPcU75CmE5SfkKEnITtoyVpoNbxYxh/RsbcHFohc5pmQWnBvthPkIoRwvLynlBj469kaE
	r0EUsNf0bQtG0dzFjzlzb6FWVKbTHv9CTI4MnkoFXzUZOFSJXPhzAzErmd58wZkoTe7CHl1oBj6
	nFHCtfp6RrMqQrgioD/EUSlRoAfvJoB6TZDE9aHHRbCuW+DFlEBp4l1PA/0gq/gzfkcGlhWK4j0
	w4=
X-Google-Smtp-Source: AGHT+IH4pOuerbgRrBL4gD+bvtxu23H+Anm2q5brzBDifNpuxcOIcnmKbnLQVDH0Pjhhx6swzMj8+A==
X-Received: by 2002:a05:6000:178f:b0:430:b100:f594 with SMTP id ffacd0b85a97d-432c379b6acmr21873107f8f.50.1768214243770;
        Mon, 12 Jan 2026 02:37:23 -0800 (PST)
Message-ID: <9d65a2d6-12b5-481f-a4c3-47829815908d@suse.com>
Date: Mon, 12 Jan 2026 11:37:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Victor Lira <victorm.lira@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
 <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
 <7514a67c-d140-43b6-bed0-3467530a086d@suse.com>
 <fbe63318-b764-46ce-a377-dd4ce7229abe@amd.com>
 <83eedd0c-dcaf-4e28-ac0f-f4991f053350@suse.com>
 <1beace12-8364-4808-b817-7705f0dd9d79@amd.com>
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
In-Reply-To: <1beace12-8364-4808-b817-7705f0dd9d79@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2026 00:32, Jason Andryuk wrote:
> (trimmed the CC list down)
> 
> On 2025-12-12 08:22, Jan Beulich wrote:
>> On 12.12.2025 02:34, Jason Andryuk wrote:
>>> The alternative is section groups?  I'm trying that, and it kinda works
>>> sometimes, but .attach_to_group fails when .init.text is involved.
>>>
>>> Here's an example that I think would work, I could make it to
>>> --gc-sectrions:
>>> group section [    3] `.group' [.text.vpmu_do_msr] contains 5 sections:
>>>      [Index]    Name
>>>      [   43]   .text.vpmu_do_msr
>>>      [   44]   .rela.text.vpmu_do_msr
>>>      [   45]   .altinstructions..text.vpmu_do_msr
>>>      [   46]   .rela.altinstructions..text.vpmu_do_msr
>>>      [   47]   .altinstr_replacement..text.vpmu_do_msr
>>>
>>> But I don't make it that far.  Other files blow up with tons of:
>>> {standard input}:9098: Warning: dwarf line number information for
>>> .init.text ignored
>>> and
>>> {standard input}:50083: Error: leb128 operand is an undefined symbol:
>>> .LVU4040
>>>
>>> Line 9098 of apic.s is .loc below:
>>> """
>>>           .section        .init.text
> 
> Earlier in the file, there is
>               .section        .init.text,"ax",@progbits
> but the later .section .init.text entries don't have the extra string.
> 
> tl;dr: If I add "ax",@progbits to all the .init.text entries, the file 
> assembles.
> 
> I opened a bug here: https://sourceware.org/bugzilla/show_bug.cgi?id=33779

And I've replied there. I think gas is working correctly here.

Jan

