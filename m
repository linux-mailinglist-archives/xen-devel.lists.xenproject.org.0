Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B23783BB7F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 09:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671370.1044684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSutJ-0006AY-OL; Thu, 25 Jan 2024 08:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671370.1044684; Thu, 25 Jan 2024 08:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSutJ-00068O-Kc; Thu, 25 Jan 2024 08:15:17 +0000
Received: by outflank-mailman (input) for mailman id 671370;
 Thu, 25 Jan 2024 08:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSutI-00065O-Qq
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 08:15:16 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de01a8c4-bb59-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 09:15:14 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cd0d05838fso76485221fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 00:15:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r4-20020a6b4404000000b007bc3ebacf3esm7404845ioa.46.2024.01.25.00.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 00:15:13 -0800 (PST)
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
X-Inumbo-ID: de01a8c4-bb59-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706170514; x=1706775314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TsVYP8V1WNBgDGLGJluNWLWIKRAhg3pidQ/dxNYMkg=;
        b=FzXpeJZa5ApJyc2V2saLn2w8jpMzkwWSOpsSk+/2ivzrK0emExTIi0muKTQeHySmYF
         SH7wBI94/iHpm5BpnG+4wndhRuxTCbQgHYfQKuVS/i/4TYgQ0gqBCmo1yVsYJNg450xV
         LbJJi/6m67jz10zlovnBAz18NcLClIec7qXPhNjxYn1jRKPLNW1U/L8jNgKnLsfjoVEb
         VsnHWtPrK3kBGRwyr+FafoLNifHSi3+WjA7U2Zvk1xy9NELwB/H+vedK+S8ZfPQfzeu4
         yuAQLMY3KAfaYhW1BheKmBGdxQaAAvwpiOxMiyayStDBkOTnm7DDPKzuXtiAo/HAq27m
         NeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706170514; x=1706775314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TsVYP8V1WNBgDGLGJluNWLWIKRAhg3pidQ/dxNYMkg=;
        b=ePtQ1fJGOyc+pwAUjf9fzRwZoFbNyhT43ouhWList8qZxgZlqG+nBaOmKSmAyIZG+7
         fz3Rox7Bsu+4G780Rdt4lRaHgU0If/iExrWAEScS/kE/1xyT5LrAgX/rzJRJetBlVFeE
         8qEylvskdOPi8Hpg3gfNJCtBvK2mBiyOL3TdYtztjUgQDrzOXlET6Ytd5a8o09UblVwb
         X6Oo5Ovcd/lu99iykSixRUyRB+OBK9WH7pidG/yepMNJAMuwXFY+CPr1sIR9/nWFl/ZT
         TlhH/rdnmWiKQtSAqcwLyG0vmAf0hcTIr6/R79YQ1n0DFUY1kcioZG0z/kl0KU8d1r1C
         T43Q==
X-Gm-Message-State: AOJu0YwUsdxufU8AAM/OKI/rPq5l679Jur7yClmnFgOHjeWAQo0H16CS
	yk8wwAfK7gYVCg9e8bg27zZaSMpTnRRG9q2azrP4R07mCp4s+SWBU5m8M1tzIw==
X-Google-Smtp-Source: AGHT+IEBazSi4tb6211TpYCjtgUZj5mLub0prg1DQfO97nrvFgAvCvcYWssrUsEUtmE7SRdKokQnDA==
X-Received: by 2002:a2e:a686:0:b0:2cf:1586:bd with SMTP id q6-20020a2ea686000000b002cf158600bdmr276180lje.14.1706170514108;
        Thu, 25 Jan 2024 00:15:14 -0800 (PST)
Message-ID: <b19ef7de-b55c-4a70-8b64-d0d4d5a96d93@suse.com>
Date: Thu, 25 Jan 2024 09:15:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
 <alpine.DEB.2.22.394.2401231731570.2287888@ubuntu-linux-20-04-desktop>
 <665b7ea9-77d9-4bbc-a67c-1ac0d9ba908a@suse.com>
 <37afd0b1-a6b3-41aa-8338-c99b68592c92@citrix.com>
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
In-Reply-To: <37afd0b1-a6b3-41aa-8338-c99b68592c92@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.01.2024 02:14, Andrew Cooper wrote:
> On 24/01/2024 7:28 am, Jan Beulich wrote:
>> On 24.01.2024 02:34, Stefano Stabellini wrote:
>>> I managed to get back to read the mailing list and noticed this patch.
>>>
>>> Is it still relevant and needs to be reviewed?
>>>
>>> Are there any outstanding disagreements between maintainers on the
>>> approach to take here?  Or should I just go ahead and review it?
>> It is still relevant from my pov, and everything that may be controversial
>> is said ...
> 
> BUGFRAME_* cannot legitimately modify the interrupted context.  Two are
> fatal paths, and other two are side-effect-less as far as C can tell.
> 
> So the infrastructure ought to take a const pointer.
> 
> The reason why this pointer is non-const is to do with the interaction
> of the serial and keyhandler infrastructures.  Because we're adjusting
> that for other reasons, I was hoping it would subsequently be easy to
> switch Xen to being properly const in this regard.
> 
> Turns out it is:
> 
>  
> https://gitlab.com/xen-project/people/andyhhp/xen/-/commit/4f857075005da1d28632e4f9198c2e7d0f404b9a
> 
> with a couple of caveats.  (Only the buster-gcc-ibt run failed, so I've
> got some cf_check-ing to adjust, but all the other builds worked fine).
> 
> 
> To make the serial code compile, I ended up having to revert patch 2 of
> the regs series, which I believe is safe to do following patch 3-5 which
> un-plumb the regs pointer deeper in the call chain.  If this is turns
> out to be true, then the patch ought to be added and reverted in the
> same series so it isn't left hanging about after the fact.

Hmm, I'm not sure I see how reverting that would end up working. However,
aiui you need to revert primarily for the non-const-ness of the pointers
involved in [gs]et_irq_regs(). I wonder whether, if we followed your
underlying thought here, those shouldn't be const-ified then anyway.

> The _$X_poll() functions are used in timer context, which means there's
> an outer regs context already latched, and that's arguably a better
> context to use anyway for 'd'.

If the timer happens to run on an idle vCPU, what "outer regs context"
would we have there?

> This in turn allows us to remove a #UD from a fast(ish) path, and remove
> some per-cpu or static variables which are just used for non-standard
> parameter passing because run_in_exception_handler() doesn't let you
> pass any.
> 
> 
> This leaves the '%' debugger infrastructure.  Being a debugger, it's
> making arbitrary changes anyway and I'd much rather cast away constness
> for a debugger, than to keep everything else mutable when it oughtn't to be.
> 
> If absolutely nothing else, registration and handling '%' ought to be
> from x86 code rather than common code, which would remove the
> do_debugger_trap_fatal() layering violation.
> 
> But, the more I look into the gdbstub the more I'm convinced that it
> doesn't work.  For example, this gem:
> 
> /* Resuming after we've stopped used to work, but more through luck than
> any actual intention.  It doesn't at the moment. */
> 
> From c/s b69f92f3012 in July 2004, and more specifically the commit
> which added the gdbstub functionality to begin with.  I.e. it doesn't
> appear to have ever supported more than "poke around in the crashed
> state".  In the 2 decades that noone has fixed this, we've gained far
> better technologies for doing this, such as running it in a VM.
> 
> I am going to submit some patches deleting gdbstub.  It clearly had not
> much value to begin with, and is not definitely not worth the problems
> it is creating in adjacent code these days.

All fine. Still I wonder whether in the meantime this patch isn't an
improvement on its own, and hence whether the const couldn't sensibly
be added subsequently.

Jan

