Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323EEA8257F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 15:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943957.1342545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2V1z-00083J-QS; Wed, 09 Apr 2025 12:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943957.1342545; Wed, 09 Apr 2025 12:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2V1z-00080l-NC; Wed, 09 Apr 2025 12:59:51 +0000
Received: by outflank-mailman (input) for mailman id 943957;
 Wed, 09 Apr 2025 12:59:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2V1y-00080f-PO
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 12:59:50 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83bf811e-1542-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 14:59:47 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so5675597f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 05:59:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d6ebsm16387265e9.2.2025.04.09.05.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 05:59:46 -0700 (PDT)
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
X-Inumbo-ID: 83bf811e-1542-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744203587; x=1744808387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6t/2Nq+ydaUI82ZJ+n6IUwFM49DRh+4TKkeUHQXyDME=;
        b=S8g5QNUWjTCcGT8/Qks1BFtreNaCP/qQpt6wSClK5LcGatIZnO0e8LBm/bAsjgYy07
         11Kl6CDH4dSAN0qJA/KeprfXh7FyKnhivA7/pI/LM3jigtZra7Ib7ylFSU94hUeOK5yr
         oCi8WFxeXPz8FTd+OaqDvmUplnSwQP51sH+CBBw1wBaqJGHISdAmpqWjxGUIdbk9g/GO
         U5MSHA5HyvqnwbNzPV81pAlqvZbfC53NbKFoxSg3nNgF4DyiMD7k5dKX8VCI2oNIRbas
         bGX994h9QdP629hI3aCCM7xU4W4+rELsWR42L9PxZSiTGVOlR4XlpmsidDwh1T6mOuQb
         4q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744203587; x=1744808387;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t/2Nq+ydaUI82ZJ+n6IUwFM49DRh+4TKkeUHQXyDME=;
        b=HkdKChVmF/25B0p2/e3r4xZt3c36NQwTlVxc5i7nJIG8nwjvvmycAzkAf3iqSEqYhp
         ERY10EXHTLerhhD+El14jv7s62zqk8iYOoh70grKnrBfJf6bXgafu06UbCG3Qg77DTQe
         /U3nEfKlO5XuKA1PkyjYW3gv80qGf36g/GLM57mPtfccAZYvTbyWdCkFqCzTjmKVKQsT
         FVl6TT4I8lfPH1/HIA0itN9ikX1lSymnnXZS3nlicPx0IUJoP/Oojq3SHowDH0gjMN/r
         2HGYPbFyjy4yBfXkYmKZy2wk26p4d5T9cBVVvcyWE6W5iKCwO/ui+WG4rftqFlCjcN7h
         zY1A==
X-Forwarded-Encrypted: i=1; AJvYcCUr/e4XUAUrahXk8V160NkgMqD6O5/TB+6gGPSpF1bEgpiYAX+dGBXf7WVcieKmUUACyHEtc9yR78I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1YeqMY2W1lyOGgUi+WkVBwwwaQ5TZQy1jifFWZFCZyHreHI4k
	LUHwPK9LMRTjupvatSnkB+ddgq021FGVbAkEpaGP6eVRO45v4T/ejElpIE9lnA==
X-Gm-Gg: ASbGncseu9q88Qa8hIzta+xqLZrc0fzD8rbEUuLwYBaOPWkJm3MRFSl34Ai99CylbK1
	di3QonUl+12O3SKX1ih38NYDl8B/CxLtTLwbJtcYQK0jwY7Y6wJfIkjImtMtfAaZgSpXORJfIso
	qHoyTa1OW1UxQQ7YPb3W7e8sW4nNHC7CAUFou/A+AKrESKYQEsXjym+NxuoebSwbvYbYaYruJBr
	TceNujJiXPKtiIoQDh4bBSWMIoGfIG6Rp7TZODmAoiZTr1OUrplqkqfHN7tUIzkVj6rc9axD1vk
	7UIY43xovVWu0tSKvYClASgQYETHSQrTMJecyfsWl/5XKwoaNAzc454p9S9WIlltwnYVGk+YeZX
	er5yKToOYde9CSeQLLq8w41Ijig==
X-Google-Smtp-Source: AGHT+IHb2LOBQwP2oPnA9pHBf40M/Cp6GktTUQzd71g8pUnOWZ49tDRxZxNLt7JFPfXICxyI1GqxCw==
X-Received: by 2002:a05:6000:250d:b0:39c:cc7:3db6 with SMTP id ffacd0b85a97d-39d87aa7edfmr2506677f8f.19.1744203586570;
        Wed, 09 Apr 2025 05:59:46 -0700 (PDT)
Message-ID: <2df78a5d-2f9f-4866-81cc-03ae09c76d50@suse.com>
Date: Wed, 9 Apr 2025 14:59:45 +0200
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
In-Reply-To: <Z_ZOWAttoFNoFYCV@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.04.2025 12:39, Roger Pau Monné wrote:
> On Wed, Apr 09, 2025 at 12:00:16PM +0200, Jan Beulich wrote:
>> On 09.04.2025 11:07, Roger Pau Monné wrote:
>>> On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
>>>> On 08.04.2025 11:31, Roger Pau Monne wrote:
>>>>> When running on AMD hardware in HVM mode the guest linear address (GLA)
>>>>> will not be provided to hvm_emulate_one_mmio(), and instead is
>>>>> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
>>>>> always report an error, as the fault GLA generated by the emulation of the
>>>>> access won't be ~0.
>>>>
>>>> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
>>>> generally whenever .gla_valid isn't set).
>>>
>>> Oh, yes, good catch.  I didn't notice that one.  We should move all
>>> those checks to use a paddr rather than a gla.
>>
>> Really that function could just be passed the offset into the page.
>>
>>>>> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
>>>>> when the guest is PV.
>>>>
>>>> This narrows checking too much, imo. For VT-x we could continue to do so,
>>>> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
>>>> the gla_valid flag visible there.
>>>
>>> I don't think we should rely on the gla at all in
>>> mmio_ro_emulated_write(), and instead just use the physical address.
>>
>> But you can't validate a physical address against a CR2 value. And I view
>> this validation as meaningful, to guard (best effort, but still) against
>> e.g. insn re-writing under our feet.
> 
> But we have the mfn in mmio_ro_ctxt, and could possibly use that to
> validate?  I could expand the context to include the offset also, so
> that we could fully validate it.

How would you use the MFN to validate against the VA in CR2?

Jan

