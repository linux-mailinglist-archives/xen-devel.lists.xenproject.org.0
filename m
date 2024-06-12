Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362E9051A7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 13:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739255.1146246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMX3-0008JT-VW; Wed, 12 Jun 2024 11:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739255.1146246; Wed, 12 Jun 2024 11:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHMX3-0008FZ-Qq; Wed, 12 Jun 2024 11:52:49 +0000
Received: by outflank-mailman (input) for mailman id 739255;
 Wed, 12 Jun 2024 11:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHMX2-0008DZ-18
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 11:52:48 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4888322d-28b2-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 13:52:45 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6f0e153eddso499071266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 04:52:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f2942b02fsm299228766b.167.2024.06.12.04.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 04:52:45 -0700 (PDT)
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
X-Inumbo-ID: 4888322d-28b2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718193165; x=1718797965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0GtsBUhKtUS/+Nyih41jc/QcusLWAMSW99BhU1x1Fl8=;
        b=MJXxQXBZrO10EoYG7ZNyX35yfp5ZfygYAJaEp/PUtl4Hd022OHZ3NUqWyZMpWKBiuC
         K4Fz6pPCQWF/187gtlh3QXvwTkSrl5HjV7ZX+Y9OXkVyz+Q1xw4Guf43OZYjuUSupdLR
         M/BBmvRNW159aujIy+lPHkR9RApxBt4B1f+XgUD8/BqE+Rz/oJG3OQ9G9A8nusG2C15a
         kETu715T0LBfLaBoewBRLVoCbP8TNsEj8d0uWn9wWtZ9M0xGIwnSd7F7MO0AyTY7ZzFI
         U548reaO+wlWyCJFmelJoK1TDtdjP8wFQLHlsFM4mxSwVUfd+HPMj2iG+NeiZQr06ftp
         XZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193165; x=1718797965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GtsBUhKtUS/+Nyih41jc/QcusLWAMSW99BhU1x1Fl8=;
        b=k4WqKkEdEmKUqZld0gc5ioTFRX7kdMA+IAGwEKPFjUFeQckfv4Vn8hgtcpRMfEsnis
         HSBKt653Gxg9BNAI1hlm+egHLKZsScDiODTKARn3HOBgiuVouWN8bJItHyKdD7fTnAWf
         B9d8cVjACzRBmteqbK3LnRQhvPaKV8GmasPtE5989ydMXAY3rw/ufcyYgr8VjXSQxkU5
         MsKWuXCljce4xqz+isj1ltJuYPyoUbHJKuKs1VLTYPA9ll2urdomolk0mBME+PJ6tNnY
         aQaLAih8M4qtJfigqhAJvaWDxOSr0NArlYUpdBecp1l18avQhFC510ZMVJNbTSJCSjTo
         EbTQ==
X-Gm-Message-State: AOJu0YzdeQ9iU1ofv3NSl5OZQnHzQn/bnAqFAwc0KzVUZ6jxW9RFUpTa
	toMYClunYkFgGKiz6juF6gmAma+037K+TZyajYVTbhA24S8RDZt11DiZRxznlQ==
X-Google-Smtp-Source: AGHT+IHENud6V7zSoeaqUpCmDgKudaSsfadMj1optQt2VFipfDengS1K4o3GLdbzxBKKkAwlLdk4iw==
X-Received: by 2002:a17:907:7e87:b0:a6f:4b7d:599b with SMTP id a640c23a62f3a-a6f4b7d6bf0mr76758666b.33.1718193165251;
        Wed, 12 Jun 2024 04:52:45 -0700 (PDT)
Message-ID: <cc7442c2-a218-4fc4-bc03-638faf41fd97@suse.com>
Date: Wed, 12 Jun 2024 13:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
 <Zmf_k2meED8iG3H5@macbook> <a11259be-7114-4332-b873-d1b163687a3e@suse.com>
 <ZmgStGbVRuGaNUD_@macbook> <f171c98a-c78d-41c8-88d8-7d631b80333b@suse.com>
 <ZmgwKmcLDJDhIsl7@macbook> <b076dc8d-701e-4a9f-a147-c54673959009@suse.com>
 <ZmhWtEyuwjTuIAxK@macbook> <beb67703-c1f0-490a-a3ad-36e2f331f5e4@suse.com>
 <Zmh5mw15_FwITnj1@macbook>
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
In-Reply-To: <Zmh5mw15_FwITnj1@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2024 18:21, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 04:53:22PM +0200, Jan Beulich wrote:
>> On 11.06.2024 15:52, Roger Pau Monné wrote:
>>> On Tue, Jun 11, 2024 at 01:52:58PM +0200, Jan Beulich wrote:
>>>> On 11.06.2024 13:08, Roger Pau Monné wrote:
>>>>> I really wonder whether Xen has enough information to figure out
>>>>> whether a hole (MMIO region) is supposed to be accessed as UC or
>>>>> something else.
>>>>
>>>> It certainly hasn't, and hence is erring on the (safe) side of forcing
>>>> UC.
>>>
>>> Except that for the vesa framebuffer at least this is a bad choice :).
>>
>> Well, yes, that's where we want WC to be permitted. But for that we only
>> need to avoid setting iPAT; we still can uniformly hand back UC. Except
>> (as mentioned elsewhere earlier) if the guest uses MTRRs rather than PAT
>> to arrange for WC.
> 
> If we want to get this into 4.19, we likely want to go your proposed
> approach then, as it's less risky.
> 
> I think a comment would be helpful to note that the fix here to not
> enforce iPAT by still return UC is mostly done to accommodate vesa
> regions mapped with PAT attributes to use WC.
> 
> I would also like to add some kind of note that special casing
> !mfn_valid() might not be needed, but that removing it must be done
> carefully to not cause regressions.

Hmm, in the meantime I have myself sufficiently convinced that with a
small (hopefully easy / uncontroversial) change to ept_set_entry() I
can arrange for having the guarantees that neither INVALID_MFN nor a
truncated for of it can make it into the function, allowing the check
to be dropped (as you had initially asked for).

>>>> One caveat here that I forgot to
>>>> mention before: MFNs taken out of EPT entries will never be INVALID_MFN, for
>>>> the truncation that happens when populating entries. In that case we rely on
>>>> mfn_valid() to be "rejecting" them.
>>>
>>> The only caller where mfns from EPT entries are passed to
>>> epte_get_entry_emt() is in resolve_misconfig() AFAICT, and in that
>>> case the EPT entry must be present for epte_get_entry_emt() to be
>>> called.  So it seems to me that epte_get_entry_emt() can never be
>>> called from an mfn constructed from an INVALID_MFN EPT entry (but it's
>>> worth adding an assert for it).
>>
>> Are you sure? I agree for the first of those two calls, but the second
>> isn't quite as obvious. There we'd need to first prove that we will
>> never create non-present super-page entries. Yet if I'm not mistaken
>> for PoD we may create such.
> 
> I should go look then, didn't know PoD would do that.

I've meanwhile checked, and indeed we do. That's what with said prereq
change I hope to make no longer be the case.

Jan

