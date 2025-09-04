Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE5B433DB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 09:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109667.1459180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu4LA-00087B-J8; Thu, 04 Sep 2025 07:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109667.1459180; Thu, 04 Sep 2025 07:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu4LA-00084Y-Fy; Thu, 04 Sep 2025 07:25:04 +0000
Received: by outflank-mailman (input) for mailman id 1109667;
 Thu, 04 Sep 2025 07:25:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uu4L9-00084S-3G
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 07:25:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4440129d-8960-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 09:25:00 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aff0775410eso207377566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Sep 2025 00:25:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04190700a4sm1087796866b.63.2025.09.04.00.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 00:24:59 -0700 (PDT)
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
X-Inumbo-ID: 4440129d-8960-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756970700; x=1757575500; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OfeT1Se81zUkeC4IRHtpFJi1bgBDIe5kD6wRBMQJTog=;
        b=FkGYxcU7uNGWI4y5GuOmXZ/RUhyaCd3KlTcnnUJ9wE1AiyhFi/EXPCbG8AbWTdmdKy
         7hTnm9EyCxP090bYcoF6vMQDviCmZ5KblMn0yBt/ZCuHXmYQLIWdXwff3gEe4550lgCu
         luD91EZoX1uhpXR6RX5GGpN9qTBLpDvPcY8R5USErJ4qbwjz5SJbl4/2zLZ14996pBxS
         Pdd2rYRsIQPMZCK/CucgyQ1YwzN9xTbPAt2J3wn4h2Nn6E9sCp5SY6Iy+GbTxaDj2g4Z
         9tM+rjRd9cBlH8T1kH/wo/IdzmlOMbXj95w0yVPD4lr1HDPs/kLG33NM+/5btk/1eIzA
         Vyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970700; x=1757575500;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfeT1Se81zUkeC4IRHtpFJi1bgBDIe5kD6wRBMQJTog=;
        b=kgRgOirEA9QvKnP+asWE21N0iixGbEMh1H4jugIYqeqv3FGHIRdtBqGsh1HhCZOhpv
         fSF7UpHgPpctHp/rhUcGKUCuf+VE7pLre59pwoD+xqi00Rl6+4OvgegcHZnjhxkbCa/I
         rCuHTqXac3qggBDfdwStDLRYQ0cJB06EcEbB5VChUN5pnZziuyC+vVEMMJ/+f0DbPtIC
         uVE15xryL/3jI5eDViow9VsAuWDDJLXmo/q9h/y9uDKdtiApw55Qps4eX0QExhCkvjj0
         SlO8zkIoxfDKIhw++d4ZrOG/4aw/UYawH+O2F8rP+/mFOMHt618dJT7xLHc2wFq/rgjG
         a0dw==
X-Forwarded-Encrypted: i=1; AJvYcCV2z7MMgIMXnGBjkNzb7Cd9/Oxha0j63l0CNGwcS4tkc4D7lzuD8suaAQtyGz+wlHc8lvDWat4wmXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxhPCQiIdawYzH2kxQoQ1GwcdPNlTr3HeB6OIGzq8ViJ9+0M7o
	oZ/Jqr337XnOAlNCI6C2pvF5SFngdG7cydYTwxmobFs67bGVSfU4I0oZC2rE/4cM8w==
X-Gm-Gg: ASbGncuZZDUNGYWn32X0BAEV64h4/uG83olDahy4SRrORR2Gx3TeAsKC/S+yl3JkUqy
	G5YVR80ByERGgOljZAPfYPe4BluNNkyDvIZcVt7KZGYEFAY/JgkIuxj4x6ml2KcdRoa2Cbq5jun
	QXW+Wlp0NIGZO8W5flsOAj+LmhjLREWKKfDdT7jjq9upOOuXM4PwUguKnmksmqk63WI+Zc98VGh
	pYXJSYQA68lFuPH1ZAbTHUOajaAz06Zjx35mLK4/OMq+1exKOXbeXO6Nec8rkMSwjlqvkR8lPxk
	W5WPqVGHGDHFCqeNahI7uD4KiXlL+1nGq5ip9mMJEzErrtA6X3V2A+YAbUbTMDx4jqv83AJkCIf
	lD3OjR7vqlOorqJzNKlIqiUFDsgc2F5TUAQo7jwBCWdm9wGi8hrtLdryfHI1pD3NwUKzj500nWi
	V0cRigYHha91xcj4AhrQ==
X-Google-Smtp-Source: AGHT+IHhjVQsEfPZJ6EM9ZjWu4GFSa4gaSk0ZhleQjH+dGUqJy1XLk/VpJZsVZQ8gC/6dCT/m1eexA==
X-Received: by 2002:a17:907:a45:b0:afe:8bd8:e2c3 with SMTP id a640c23a62f3a-b01af2e0a2fmr2167487566b.0.1756970699845;
        Thu, 04 Sep 2025 00:24:59 -0700 (PDT)
Message-ID: <e6324252-d8e5-48a3-9607-d53c8eaec446@suse.com>
Date: Thu, 4 Sep 2025 09:24:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: avoid absolute paths in executables
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <1071997f-efe6-4088-b753-b74d3a045a09@suse.com>
 <795b069f-12ea-4d05-bdc4-877a6a93fe7c@citrix.com>
 <6f310470-60f3-4c8e-a1fd-1216fd44e4ea@suse.com>
 <dc8047f3-215f-42af-ad42-76f206e4d557@citrix.com>
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
In-Reply-To: <dc8047f3-215f-42af-ad42-76f206e4d557@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2025 18:40, Andrew Cooper wrote:
> On 03/09/2025 5:12 pm, Jan Beulich wrote:
>> On 03.09.2025 17:26, Andrew Cooper wrote:
>>> On 03/09/2025 4:13 pm, Jan Beulich wrote:
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -448,6 +448,8 @@ LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin
>>>>  endif
>>>>  
>>>>  ifdef building_out_of_srctree
>>>> +    CFLAGS += $(call cc-option,$(CC),-ffile-prefix-map=$(srctree)/=, \
>>>> +                                     -fdebug-prefix-map=$(srctree)/=)
>>>>      CFLAGS += -I$(objtree)/include
>>>>      CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include
>>>>  endif
>>> We do want to be taking a change like this, but it's also definitely not
>>> limited to out-of-tree builds.  I have full paths embedded even for
>>> in-tree builds.
>> In xen-syms I see only two full paths - in debug info, supplying the base
>> path to the tree.

What I'm missing from your reply is clarification whether the mentioned
instances are indeed the only ones you see, or whether there's more in
what you have (and what I'm not seeing for whatever reason).

>> That's okay to stay imo.
> 
> Not for reducible builds it's not.

Yes, I realized this later.

However, I can see benefits to both: When one wants reproducible builds,
no absolute path whatsoever should remain. In other (debugging) cases
having a reference to the root of what everything else is relative to
might be helpful. So whether to replace these remaining instances may
want to be configurable (in turn making it necessary to deal with that
independently for xen/ and tools/; for xen/ that would be a Kconfig
option dependent upon DEBUG_INFO=y).

In out-of-tree builds similar references exist to the build tree root.
Once we zap both, the result is at risk of being ambiguous. I wonder
whether it would be possible (supported by consumers) to replace both
references by something macro-like (along the lines of $SRC/ and $BLD/).

>> In xen.efi I see a few hundred, but they're all the same as above. As I
>> learned earlier today, SHF_MERGE processing isn't invoked when linking
>> ELF objects into a PE binary.
>>
>>> To be useful, it wants to apply to everything, not just the hypervisor,
>>> so does want to be in the top level Config.mk.
>> As per my first remark then. But no, I meanwhile realized that this can't
>> go in Config.mk: For the hypervisor we want to use $(srctree), i.e.
>> including the leaf /xen referencing the xen/ subtree. I expect that for
>> e.g. tools/libs/ we'd want something similar - eliminate the entire path
>> up to the base of the component's source dir. So it will need to be
>> piecemeal.
> 
> Relative to the root of xen.git (or the source tarball) is the only
> sensible option.  Anything else is intentionally misleading.

I disagree. In-tree builds record things downward from xen/ only. So should
out-of-tree builds do. Every individual binary (i.e. including all the tools/
ones) has no need to record anything more than is necessary to unambiguously
identify the source files. In particular us bundling hypervisor, toolstack,
and stubdom (and there we expand various external packages) in a single
repo / tarball is an artifact, not how things normally would be arranged.

> In fact, Marek had a more-correct form of this patch in
> https://lore.kernel.org/xen-devel/0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com/T/#u
> which seems to be waiting on you to reply.

I can't spot anything expecting my reply. What I can spot is a promise to
submit a v2. And, having entirely forgotten that there already was an
attempt, I only now realize why the options coming into play seemed
somewhat familiar.

Jan

