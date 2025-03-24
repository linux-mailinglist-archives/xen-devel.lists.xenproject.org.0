Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82870A6D7F5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 11:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925222.1328096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twecK-00089U-Gc; Mon, 24 Mar 2025 10:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925222.1328096; Mon, 24 Mar 2025 10:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twecK-00086M-Du; Mon, 24 Mar 2025 10:01:12 +0000
Received: by outflank-mailman (input) for mailman id 925222;
 Mon, 24 Mar 2025 10:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twecI-00086G-Sx
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 10:01:10 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8774381-0896-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 11:01:08 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so323231f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 03:01:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ac3ce3dd1sm1998912f8f.88.2025.03.24.03.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 03:01:07 -0700 (PDT)
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
X-Inumbo-ID: e8774381-0896-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742810468; x=1743415268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GFpdikgwLmY0D/jjnJ6ueShRTFb72hZmDZqDiGCR3cg=;
        b=RQBVWkWyxspzyUhuafnnG8mjqc+0b7oLDj9WXHUjqFw1D0QPmxxI+OS4dD3mrX5Cl0
         lmCzBj6oGEhSpgjHsvKb5US6sKqoMvk1jWB8W0HJ/l5rLuXwIsgf0wKRVRd+UnffSTzA
         DJVA/H2c3FFDERjw6IN2nebfZswSC7cOGN3woaHH7UT2O+yhLE05NytjZiG7Wu43oFhe
         FwFXT9QTTXXWkic5OimpUJ5/xvKGnFp9kYSaQJD+UgpoTTREAQnZjNTMXgA+/RT4+9fu
         XFjoABNJzR44Xdm8FdcY9ywu7/J1CV8F+84ievAcRxqfo73rBDFQsSo9tK8j9k1hqxyS
         M0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742810468; x=1743415268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFpdikgwLmY0D/jjnJ6ueShRTFb72hZmDZqDiGCR3cg=;
        b=KqNca3rOMtKBNVp4sh9Z7Uo4SACgBevBJRq+qhf9gdUkC3uvKaUi+GzRzYqGFXF+5d
         n5avdnlmdp22DkPl82bFmde06JwW87WIu+WWm9I7EwgSy0kHCwalRtNo/mkdmlJPvj5N
         tHdrL3gL2dC1T+x3MotGldIz6wY3Epke6qspfi6Ne9wKrMqEuKtiYkT2fPrIVFEyawUM
         8UC8Zih479T5mGsU86Ps63pqTnH8O3sf+mp/eP+l4sLGP4w9stOvxOYO9tyEkXpHGAeE
         /OxyDUTi2eVvQGEMjKERRLvBCWr7mk3JoGeE6f8SyH4Nv7Mls/gKUiPxg6JTk36W2eZH
         b0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLPVHvGXW4j0riiYEBt/AWCmqsNnWLftRP4kT1mm96fngZ0oCiVke0lCawnJvFcdl8fRDSZ2jX/Cw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM/BWY75NcTpEk6eEqEoeKN6Nc/jSeaXLbWxdzb6lEc6pnYpdf
	Jl8rMG66XybiGbl0MdJZ/pr6RcoA5oz//aiiui6aHaWcVrkz7T/YIyVw+BmtjA==
X-Gm-Gg: ASbGncsirVMt/1a0DbTtkryMjX7lQk3lDApmOdBEbiXx/io2Z89WT2s31w0w+V9aoJs
	8TYm2xhWnp/S4KEmE3YWTXkK90/eg47BgKeV2PwehnCh+nkfHzAR0UODmw17aLDWXYnqcxuN4sy
	Bc4OwzU6EzfesvRwtaARj6CE2fwDKH7N2CvuzTRlXWv2EjR9MW27fG2oqifD77Rm3BjeHyTB8Qi
	aJUtiP4oktZuJ7A9g18qAVZVfOn8b9Xp8YWr1BNl4+8wLKa9GiKvHHaVwMAtj3XTAiz8+A0u9Qr
	RNyRI70WLmHbOwvXZ+WPgorq2YzzjRnQEoBPjk/Peto4KYPvl0YpknB8F1B1xpJhPuxtOfZ/xnx
	WM7t6oAU0Nas2a1qVZgYGy21qU/kjOA==
X-Google-Smtp-Source: AGHT+IHzvZInTwLg4wRJ+Vh7yzYmIulJNvivPy+ypqPeivhvWnYqjL6y4ABDnr1/okEzK8WbFO5BSw==
X-Received: by 2002:a05:6000:4108:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-3997f9366c7mr11092964f8f.35.1742810468130;
        Mon, 24 Mar 2025 03:01:08 -0700 (PDT)
Message-ID: <cd63949e-841c-4ed8-8dda-9160f759afa3@suse.com>
Date: Mon, 24 Mar 2025 11:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] x86/domctl: Stop using XLAT_cpu_user_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-6-andrew.cooper3@citrix.com>
 <703471bf-d5e7-4f97-b17e-61dffdcb828d@suse.com>
 <9385c155-eb01-4247-8bf5-6e0758f79749@citrix.com>
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
In-Reply-To: <9385c155-eb01-4247-8bf5-6e0758f79749@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2025 17:01, Andrew Cooper wrote:
> On 17/03/2025 11:38 am, Jan Beulich wrote:
>> On 11.03.2025 22:10, Andrew Cooper wrote:
>>> In order to support FRED, we're going to have to remove the {ds..gs} fields
>>> from struct cpu_user_regs, meaning that it is going to have to become a
>>> different type to the structure embedded in vcpu_guest_context_u.
>>>
>>> In both arch_{get,set}_info_guest(), expand the memcpy()/XLAT_cpu_user_regs()
>>> to copy the fields individually.  This will allow us to eventually make them
>>> different types.
>>>
>>> No practical change.  The compat cases are identical, while the non-compat
>>> cases no longer copy _pad fields.
>> That's fine for "set", but potentially not for "get": Someone simply doing
>> memcmp() on two pieces of output might then break.
> 
> It's not a fastpath, and I'm not looking to not break things, but I was
> expecting it to be safe.
> 
> The pad fields for cs (inc saved_upcall_mask) and ss get lost on the
> first exit-from-guest, and the pad fields for the data segment get lost
> on the first schedule.

Are they? If these fields on the stack are only every written with zero
(which aiui they are), all vCPU-s would properly observe zero in the
padding fields.

> So while there is a change here, I don't think it's anything that
> current code could plausibly be relying on.
> 
> Furthermore, when we get rid of the vm86 fields, we don't even store the
> pad fields anywhere in Xen, so they're going, one way or another, by the
> end of the series.
> 
> Finally, disaggregation or not, this is an unstable interface so we do
> have some wiggle room.
> 
> I guess I should discuss this more in the commit message?

Yes, if you continue to be convinced that dropping of their copying is
fine, the justification of that would be very desirable to have in the
description.

>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Should we really be copying error_code/entry_vector?  They're already listed
>>> as explicitly private fields, and I don't think anything good can come of
>>> providing/consuming them.
>> I don't see a reason why we'd need to copy them in arch_set_info_guest();
>> arch_set_info_hvm_guest() doesn't copy them either. For
>> arch_get_info_guest() it's less clear - toolstack components may have
>> grown a dependency on them (e.g. introspection?), so I'd err on the side
>> of retaining prior behavior. (Of course there's then the corner case of
>> someone calling "get" right after "set", expecting the two fields to come
>> back unchanged.)
> 
> Introspection doesn't use this interface.  Regs are sent in the ring,
> and don't contain these fields either.
> 
> Also, for HVM guests, we set the vmexit rsp to &error_code so we only
> push the GPRs, without the IRET frame above it.
> 
> These fields, (inc saved_upcall_mask) have different behaviours under
> FRED.  I don't think we can get away without them changing, and for
> these at least, they were clearly marked as internal.

And you're reasonably convinced that in a tool like xenctx it couldn't
make sense to dump such simply for informational purposes?

Jan

