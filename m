Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566FD96D820
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 14:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791068.1200837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smBQ4-00081D-TV; Thu, 05 Sep 2024 12:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791068.1200837; Thu, 05 Sep 2024 12:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smBQ4-0007z5-Qx; Thu, 05 Sep 2024 12:17:00 +0000
Received: by outflank-mailman (input) for mailman id 791068;
 Thu, 05 Sep 2024 12:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smBQ3-0007yz-9x
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 12:16:59 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be426035-6b80-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 14:16:56 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so65154566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 05:16:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d37fsm127996866b.119.2024.09.05.05.16.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 05:16:55 -0700 (PDT)
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
X-Inumbo-ID: be426035-6b80-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725538616; x=1726143416; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xrllUNRNyeZX2nnSZ8ISOA5mfDYSa4AqGYoy8uAh744=;
        b=CwN2l3YTsH2YkFnY1A+5SIpL31QG6o2fcB/kdiHUl1UzC+1UZuDAnwRpuaZ0+3xj3a
         xFw41VjIvW5sKQ6KR1HzFbdafRFuX0XDQ1Wn0qm82qQ1KQ4In5zEUnF75pXIloLppvrX
         ZQtsnXXc97/ZgCBnI46j9+ltzbTrO/AVqZOT+mdNFNi/XaZGmMxKiW2S8qIjI2+KcL41
         W8l4fcoGGlno6liY7jZfdFO1boKjE+Spv8cmSKQxhlc9d9zGVD2Qddgr03naivrSAlZS
         /ElpAwAHwkKTN3z+HxauYJf//WYRH2jdU2n9AOFzRN5QXjGcAqf+FT1HlNgOxn2uSGaK
         VxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538616; x=1726143416;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrllUNRNyeZX2nnSZ8ISOA5mfDYSa4AqGYoy8uAh744=;
        b=Twb7aPAGhctuWDeKz/0OSi0viSD9ypyHNN5QPfElOZKl8HrIqudK2Go+jgqTwffaMI
         249vdc+j4e0f3Kwfb7n7SMBYN8WQYyJmHrO9DUkSLIDO+ScxATM2C/jJEndo+f3IBtse
         Ho+VuxHyljaIm9bZ2zl6R+o5fHBlRMVuLmc+lKw1EJXT8lFWTeJlq3S3j1/l6YUj4SBu
         FZaRp8Dq2f2KfXjKu8RdlkzaqtcB4cLs8LdXu1XSaVhyWcg0xsKRSTkwoKkKVXVolPna
         1B2ZkZ182QeV0Mgsq/vSpN+vX2u6VAMIPgl2VFB2YTiGPSMfaSAghDqXvhelHrs5jecf
         +eeg==
X-Forwarded-Encrypted: i=1; AJvYcCXMvb06xiVQ2YpG7S5EeSmD+Flebypq1YMRAtcAs3sMhPaEwZMYzrribXnGudZw4PuT6JCIV+gC4Nk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxR9EHnCOoyc4QLhr3IXQrCpz7jzCWMWmRVtPLDvnTUC/AOHgVy
	2HJ7yYco5KJ0m6p8TPf7LFme2bXj9hTA/mJ9rLRO3v6RsGqJYM5Y6unBQPgORQ==
X-Google-Smtp-Source: AGHT+IHzIm0Ba1eq6tAjl26h3sYkTp5T9xJk1aw660+Fn1r1td77u5EoIm8caH0WdL5RBMrriemXvA==
X-Received: by 2002:a17:907:8004:b0:a7a:c106:365c with SMTP id a640c23a62f3a-a8a431b540fmr447164266b.34.1725538615871;
        Thu, 05 Sep 2024 05:16:55 -0700 (PDT)
Message-ID: <522f1528-fb35-4b06-b2b4-f82ec790819e@suse.com>
Date: Thu, 5 Sep 2024 14:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] x86: introduce x86_seg_sys
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0b9a0ae8-a39c-49d8-b4e7-f2a463128058@suse.com>
 <2848ec72-6e26-4331-a218-0e3e8f16572f@suse.com>
 <ccbdf270-6208-456c-8bf7-6205f5ac921c@citrix.com>
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
In-Reply-To: <ccbdf270-6208-456c-8bf7-6205f5ac921c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 18:54, Andrew Cooper wrote:
> On 04/09/2024 1:29 pm, Jan Beulich wrote:
>> To represent the USER-MSR bitmap access, a new segment type needs
>> introducing, behaving like x86_seg_none in terms of address treatment,
>> but behaving like a system segment for page walk purposes (implicit
>> supervisor-mode access).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This feels a little fragile: Of course I did look through uses of the
>> enumerators, and I didn't find further places which would need
>> adjustment, but I'm not really sure I didn't miss any place.
> 
> It does feel a bit fragile, but it may help to consider the other
> related cases.
> 
> Here, we need a linear access with implicit-supervisor paging
> properties.  From what I can tell, it needs to be exactly like other
> implicit supervisor accesses.

Well, not exactly. There's no segment (and hence no segment base)
involved here. Hence, as said in the description, it's a mix of two
things we've got so far.

> For CET, we get two new cases.
> 
> The legacy bitmap has a pointer out of MSR_[U,S]_CET, but otherwise
> obeys CPL rules, so wants to be x86_seg_none.
> 
> However, WRUSS is both a CPL0 instruction, and generates implicit-user
> accesses.  It's the first instruction of it's like, that I'm aware of. 

With MOVU having got ripped back out of the 386, yes. (Whether to call
such "implicit" user is a separate question.)

> If we're going down this x86_seg_sys route, we'd need x86_seg_user too.

That won't work, as we need to express the real x86_seg_[cdefgs]s
associated with the insn's memory operand. Whereas x86_seg_sys doesn't
need combining with anything.

> Really, this is a consequence of the memory APIs we've got.  It's the
> intermediate layers which generate PFEC_* for the pagewalk, and we're
> (ab)using segment at the top level to encode "skip segmentation but I
> still want certain properties".

Right, for USER-MSR. For WRUSS it's "do segmentation and I want two extra
properties" (just one for WRSS).

> But, there's actually a 3rd case we get from CET, and it breaks everything.
> 
> Shstk accesses are a new type, architecturally expressed as a new input
> (and output) to the pagewalk, but are also regular user-segment relative.

WR{,U}SS are part of that, aren't they?

> We either do the same trick of expressing fetch() in terms of
> read(PFEC_insn) and implement new shstk_{read,write}() accessors which
> wrap {read,write}(PFEC_shstk), or we need to plumb the PFEC parameters
> higher in the call tree.
> 
> It's worth noting that alignment restrictions make things even more
> complicated.  Generally, shstk accesses should be 8 or 4 byte aligned
> (based on osize), and the pseudocode for WR{U}SS calls this out; after
> all they're converting from arbitrary memory operands.
> 
> However, there's a fun corner case where a 64bit code segment can use
> INCSSPD to misalign SSP, then CALL to generate a misaligned store.  This
> combines with an erratum in Zen3 and possibly Zen4 where there's a
> missing #GP check on LRET and you can forge a return address formed of
> two misaligned addresses.

Well, we certainly don't need to emulate errata, I'd say.

> So misaligned stores are definitely possible (I checked this on both
> vendors at the time), so it wouldn't be appropriate to have in a general
> shstk_*() helper.  In turn, this means that the implementation of
> WR{U}SS would need a way to linearise it's operand manually to insert
> the additional check before then making a regular memory access.

We do such for SSE alignment checking already; see the emulator's
is_aligned(). I don't see why we couldn't re-use that for WR{,U}SS.

> And I can't see a way of doing this without exposing PFEC inputs at the
> top level.

Certainly we'll need a qualifier alongside x86_seg_[cdefgs]s, which of
course could then also be allowed to be combined with x86_seg_none.
Moving PFEC inputs to the top level, while certainly possible, would
involve a lot of churn. Plus I'm also hesitant to further grow the
hooks' numbers of parameters. IOW introducing new shstk_{read,write}()
hooks would look somewhat preferable to me, at least for the moment,
if we don't want to have a x86_seg_{shstk,user} flags that can be OR-ed
into the other x86_seg_*.

Jan

