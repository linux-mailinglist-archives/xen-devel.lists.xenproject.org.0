Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC1EA82735
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 16:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944207.1342747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2W6n-0002XC-Bf; Wed, 09 Apr 2025 14:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944207.1342747; Wed, 09 Apr 2025 14:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2W6n-0002Uk-8n; Wed, 09 Apr 2025 14:08:53 +0000
Received: by outflank-mailman (input) for mailman id 944207;
 Wed, 09 Apr 2025 14:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2W6l-0002Ue-Qd
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 14:08:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28d21a52-154c-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 16:08:49 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39727fe912cso3107023f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 07:08:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8940012asm1746202f8f.94.2025.04.09.07.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 07:08:48 -0700 (PDT)
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
X-Inumbo-ID: 28d21a52-154c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744207729; x=1744812529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mutNYkR/8MqaIGKCe6d0ZbV8t0HE5cf+BppHA0LU13M=;
        b=JbJkqmBW72eSaaRvC0GVcObsUm705X/S3Q0BIgvJEKc7ZMJVcRHdJ4OXZJmwBwpBjU
         sgjwmdm2/d2g5x7xQLhlSSrFtAYvDHXtHZNIjncOMbTPCSY3NmFT9r+dmtU3YPwcPdQa
         BGEBS3+aITyyTEYbaK/YEcYvItkQdxbIyMQtPVoifuz1XhRYAvdVNt/PSsn/SPOXBh4N
         fg5r4NPm1y4n5JMFoN/KM/3aLLpL5zmJV4YiBUEMs243LcGrjKwd+gUWTSp+qyGI+wbE
         eNn2y75JcWxsNJqSShw18XKGXCMcE1LONq/a9yt2moyLZcirczuk2T4O1oEQwTWiXYHi
         iMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207729; x=1744812529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mutNYkR/8MqaIGKCe6d0ZbV8t0HE5cf+BppHA0LU13M=;
        b=u/+F7M1XY93QCUGQYx10PEp5T1i0yn7Gp6GRAP6A6rO8bGkRLkAhi8IcqoU8SWK+bt
         bD+ZNlNS+fuJD71oU5KoM6Fm5FLxYzFp6haMdxG5NSB+3QjqvzcuvlViWuaoWObSHlMJ
         baswr3Qd/kGiGH04Wfnm1a1u6ti0msu6ONwxCC9cWjkG/TdnWpIEhZebip7lJzpWwsyJ
         BX4RZ6A5roDLcVmBgGk9dUQT+FRl1eTB4Z2feal1JnyMu5fUcsS+9zRM1o+1R8TlvuvM
         U7WwW7+MN+OY2n+PrhkP4diY7G8VxVjjz2DPuneOKnmM/8MN/fU0tbX9GcAuhTErQFzY
         ZSsw==
X-Forwarded-Encrypted: i=1; AJvYcCVNho59XyzxYSRYXaSz5NRirXPNvnCH2g+oaoLSYwKhz8oaJvM6Nih1999XFw1lFyJLmNB2kQbJwpA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy1VVt50oA76dP9rxZoXEDnYJ5hsiuO0X4iu9K/77vFwgBEm0g
	aDi1DueRTNA9DGbVTz1O3SoawwGpuRRc3fft+OCBJ5KzJeq+tA1SWmMYLvegPA==
X-Gm-Gg: ASbGnctl8Vy3eiDX24nJ/u0Jx8OM3n4SPiMKzqu6vg8vsgZwtxMbbidYBI+A5PPD/2y
	8r0FvSYvysZ49dgPy4vLYvFdezlJSFt7dSnxX9X4LV8ah70APIOrkSl8p/BX82OVRU5FT5IiRFB
	T/sr06eR0zbzLNXZT33ww6Bqpf6qoeb8dbLUMh2qyjYOPnTQ0bxSZQVAQbdg/hGR62vZc4JW+dU
	1hCqtCB6cn53E3zYwzywAuXk9YiYykD2Vv8TIU0uuj+5o1doXg3nHJBCH5WFY/iePWS+/rkdS3Y
	YiIH6laTDCKElCeXG5S/d8fFdJn7l0ZyUqc2oA4ponsSIuz/cWYvTzEBVtVLL0fKEz49l5MJqYR
	t4hXSEHEhidMEJiqFolNZEEtG0g==
X-Google-Smtp-Source: AGHT+IGu10HgDZklWTSZww2I1M+7hNODvCYXl/t+AihZtmC3k40M7i2KZF8QZuVWxO4BXHASPEEYJg==
X-Received: by 2002:a05:6000:1447:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-39d87cdcd87mr3086575f8f.55.1744207728798;
        Wed, 09 Apr 2025 07:08:48 -0700 (PDT)
Message-ID: <b1e8e761-ddf9-4e4f-b5bb-624b2e7d012c@suse.com>
Date: Wed, 9 Apr 2025 16:08:47 +0200
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
 <8709e7af-5827-4c96-9f6b-1f548045040d@suse.com>
 <Z_Z9unJ-wS2dXxUV@macbook.lan>
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
In-Reply-To: <Z_Z9unJ-wS2dXxUV@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.04.2025 16:01, Roger Pau Monné wrote:
> On Wed, Apr 09, 2025 at 03:50:13PM +0200, Jan Beulich wrote:
>> On 09.04.2025 15:33, Roger Pau Monné wrote:
>>> On Wed, Apr 09, 2025 at 02:59:45PM +0200, Jan Beulich wrote:
>>>> On 09.04.2025 12:39, Roger Pau Monné wrote:
>>>>> On Wed, Apr 09, 2025 at 12:00:16PM +0200, Jan Beulich wrote:
>>>>>> On 09.04.2025 11:07, Roger Pau Monné wrote:
>>>>>>> On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
>>>>>>>> On 08.04.2025 11:31, Roger Pau Monne wrote:
>>>>>>>>> When running on AMD hardware in HVM mode the guest linear address (GLA)
>>>>>>>>> will not be provided to hvm_emulate_one_mmio(), and instead is
>>>>>>>>> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
>>>>>>>>> always report an error, as the fault GLA generated by the emulation of the
>>>>>>>>> access won't be ~0.
>>>>>>>>
>>>>>>>> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
>>>>>>>> generally whenever .gla_valid isn't set).
>>>>>>>
>>>>>>> Oh, yes, good catch.  I didn't notice that one.  We should move all
>>>>>>> those checks to use a paddr rather than a gla.
>>>>>>
>>>>>> Really that function could just be passed the offset into the page.
>>>>>>
>>>>>>>>> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
>>>>>>>>> when the guest is PV.
>>>>>>>>
>>>>>>>> This narrows checking too much, imo. For VT-x we could continue to do so,
>>>>>>>> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
>>>>>>>> the gla_valid flag visible there.
>>>>>>>
>>>>>>> I don't think we should rely on the gla at all in
>>>>>>> mmio_ro_emulated_write(), and instead just use the physical address.
>>>>>>
>>>>>> But you can't validate a physical address against a CR2 value. And I view
>>>>>> this validation as meaningful, to guard (best effort, but still) against
>>>>>> e.g. insn re-writing under our feet.
>>>>>
>>>>> But we have the mfn in mmio_ro_ctxt, and could possibly use that to
>>>>> validate?  I could expand the context to include the offset also, so
>>>>> that we could fully validate it.
>>>>
>>>> How would you use the MFN to validate against the VA in CR2?
>>>
>>> I would use hvmemul_virtual_to_linear()
>>
>> If you mean to use the CR2 as input, you wouldn't need this. I said VA in
>> my earlier reply, yes, but strictly speaking that's a linear address.
> 
> I was thinking about using the segment and offset parameters of the
> mmio_ro_emulated_write() call.
> 
>>> and hvm_translate_get_page()
>>> to get the underlying mfn of the linear address.  But maybe there's a
>>> part of this that I'm missing, I've certainly haven't tried to
>>> implement any of it.
>>
>> Hmm, I see. I didn't think of doing it this way round. There's certainly
>> at least one caveat with this approach: Multiple linear addresses can all
>> map to the same GFN and hence MFN. Checking against the original linear
>> address (when available) doesn't have such an issue.
> 
> I see... Yet for AMD that address is not uniformly available as part
> of the vmexit information?

Even stronger, I thought: It's uniformly not available.

>  As I understand the checks done in
> mmio_ro_emulated_write() are to ensure correctness, but carrying the
> access even when the %cr2 check fail wouldn't cause issues to Xen
> itself?

Well, "wouldn't" is too strong for my taste, "shouldn't" would fit. The
checking is there to avoid guests playing games. Whether that prevents
merely in-guest just-bugs or actual XSAs we can't know until we find a
case where the game playing might make us do something wrong. I expect
it's unlikely for Xen itself to be affected. But an in-guest privilege
escalation would already be bad enough.

So why don't we do the linear address check as we do today (provided a
linear address is available), and only use the alternative approach when
no linear address is available?

Jan

