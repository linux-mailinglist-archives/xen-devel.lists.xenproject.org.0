Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E2A826B1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944163.1342717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Vop-0004OM-En; Wed, 09 Apr 2025 13:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944163.1342717; Wed, 09 Apr 2025 13:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Vop-0004Mu-B9; Wed, 09 Apr 2025 13:50:19 +0000
Received: by outflank-mailman (input) for mailman id 944163;
 Wed, 09 Apr 2025 13:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2Von-0004Mo-No
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 13:50:17 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91253fbe-1549-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 15:50:16 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so6049053f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 06:50:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89361186sm1733317f8f.14.2025.04.09.06.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 06:50:15 -0700 (PDT)
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
X-Inumbo-ID: 91253fbe-1549-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744206615; x=1744811415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HCd4xVwhoWf3cvNU17d4nLXZZhhVHyTRBZWQhbfI068=;
        b=gViqOFY0GkxehxqEsd/o9Ao7nV4y45g6JwS4pJeJJ5egTIF+eCYuWV0IfDhVCwdXA2
         FipZO+3ekyucPM/yiwbuZ+EEgunIoOsmjE3U/9inp4EHHmPDqZp+KwX9XHKS277XxduR
         FP43oRCktkXjjzSggtVyKcCtYIqbHtnRIbPdmJ5rSew3g1kDeBjniNrF5j+x6N4f8YQv
         OoD0Pqxsy+8uLlOPoExa4EhcWCscYtxOxLqAt7MQlRQ8zL0z0luvZEmAUWnC0fUUq4mg
         oQswLz2hzL5PpRNkVQVainCzyyyXOEK8+tAAYKOGaYKCsBTFQ2TZlvu+bVoyHsK3FC80
         B2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744206615; x=1744811415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCd4xVwhoWf3cvNU17d4nLXZZhhVHyTRBZWQhbfI068=;
        b=AdjYrQ/TumJwl3PgW0+28qKxCIejWpYSxpt8Tqjqg3JD0pl73/2VMrOhBVY02AgWtO
         FH09GF8CsY3KEPPDjiO0niZ3QSFOX74C7PmCEv17G0tFy6tR7R+Zxx+otsdhQLPBqDIO
         ncU1arDaxlwcmwBAsUU5p8g6Co6xZ4JVJ8LGG5q52WrgEDYRu2q01WHX5ulLtrJRrSG0
         3pdjYKxLEdyUyWLagQobVgXiUOg5LqlF8rfd9FnqsVOMR6d9OhSP8C/fWQT8nW6H8JcF
         LwRo51qXNGebIV0YNevEqh2DWaFHc50dJhSL/K8u818G1JkNped7QAVeYY0UHPs1YwV9
         5StQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7MaKL9nNgqIRVHAwXM/Ny6gXZ0PCYhTyDyp5gL7HSVB0eWaiWn/7DCzj3EnRa+vxOjEz/vdpVGc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx/ygXepDfY79dXh0bEVgwaRjHMNGEjsM3d/RM1umrlJCk3RNW
	IXLztWei360LwbfVlShMws1RsJWw5ZcWC5sjaVcM2lmYaMld2cPdUXUai4pTwA==
X-Gm-Gg: ASbGncu0Tc4oGYT6d7P5QhgdQzstVWHsgJdFsrNG8A88PpCtPCgArlLXTOK1ZaZVBDi
	KEBvg3vFjsgZBkP9c6sLaxgaZdWwdhqiO+BGRYtbENA9TbTiPKVw2X3c9+9roPDL9FolqywzteU
	dwd8YBHhpIIoRd56uNUe3nSYZP6u+1EVO5qd9UavpxIHssqcXvE+9gWDP5YJF/pRAf07ggnuOWD
	UeHPe6r2o1wdmylYVdFNAvsheKAMkIvHYN+egF1oeH4prQDjmYKeZ7IsP9rsuyE0mBR1dX0UHon
	nDx/8qcbCFN2Hw+CqFgcl+qefa/UxrQAZGN6oLCCC6wwruFbVKqoaXNv3tmI7IwBEDIVohqWJgZ
	WSnkN1Q9GBy7IwnnXHdT9i6GgDg88Wi3qmwWH
X-Google-Smtp-Source: AGHT+IHxFQ+mU1ybplB8mWFy22ErLzQ8F6HGZxQxdBj4D91MBuccr99euW+XPL/pDfbQsORhQU5fCg==
X-Received: by 2002:a05:6000:1863:b0:39c:11c0:eba1 with SMTP id ffacd0b85a97d-39d87aa1bb0mr2795909f8f.12.1744206615508;
        Wed, 09 Apr 2025 06:50:15 -0700 (PDT)
Message-ID: <8709e7af-5827-4c96-9f6b-1f548045040d@suse.com>
Date: Wed, 9 Apr 2025 15:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
 <Z_Y4xFzaltr_XKO4@macbook.lan>
 <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>
 <Z_ZOWAttoFNoFYCV@macbook.lan>
 <2df78a5d-2f9f-4866-81cc-03ae09c76d50@suse.com>
 <Z_Z3PYYSBH3QWioF@macbook.lan>
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
In-Reply-To: <Z_Z3PYYSBH3QWioF@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.04.2025 15:33, Roger Pau Monné wrote:
> On Wed, Apr 09, 2025 at 02:59:45PM +0200, Jan Beulich wrote:
>> On 09.04.2025 12:39, Roger Pau Monné wrote:
>>> On Wed, Apr 09, 2025 at 12:00:16PM +0200, Jan Beulich wrote:
>>>> On 09.04.2025 11:07, Roger Pau Monné wrote:
>>>>> On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
>>>>>> On 08.04.2025 11:31, Roger Pau Monne wrote:
>>>>>>> When running on AMD hardware in HVM mode the guest linear address (GLA)
>>>>>>> will not be provided to hvm_emulate_one_mmio(), and instead is
>>>>>>> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
>>>>>>> always report an error, as the fault GLA generated by the emulation of the
>>>>>>> access won't be ~0.
>>>>>>
>>>>>> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
>>>>>> generally whenever .gla_valid isn't set).
>>>>>
>>>>> Oh, yes, good catch.  I didn't notice that one.  We should move all
>>>>> those checks to use a paddr rather than a gla.
>>>>
>>>> Really that function could just be passed the offset into the page.
>>>>
>>>>>>> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
>>>>>>> when the guest is PV.
>>>>>>
>>>>>> This narrows checking too much, imo. For VT-x we could continue to do so,
>>>>>> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
>>>>>> the gla_valid flag visible there.
>>>>>
>>>>> I don't think we should rely on the gla at all in
>>>>> mmio_ro_emulated_write(), and instead just use the physical address.
>>>>
>>>> But you can't validate a physical address against a CR2 value. And I view
>>>> this validation as meaningful, to guard (best effort, but still) against
>>>> e.g. insn re-writing under our feet.
>>>
>>> But we have the mfn in mmio_ro_ctxt, and could possibly use that to
>>> validate?  I could expand the context to include the offset also, so
>>> that we could fully validate it.
>>
>> How would you use the MFN to validate against the VA in CR2?
> 
> I would use hvmemul_virtual_to_linear()

If you mean to use the CR2 as input, you wouldn't need this. I said VA in
my earlier reply, yes, but strictly speaking that's a linear address.

> and hvm_translate_get_page()
> to get the underlying mfn of the linear address.  But maybe there's a
> part of this that I'm missing, I've certainly haven't tried to
> implement any of it.

Hmm, I see. I didn't think of doing it this way round. There's certainly
at least one caveat with this approach: Multiple linear addresses can all
map to the same GFN and hence MFN. Checking against the original linear
address (when available) doesn't have such an issue.

Jan

