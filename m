Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E36B82AE7E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 13:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666230.1036706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtuW-0007d2-1f; Thu, 11 Jan 2024 12:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666230.1036706; Thu, 11 Jan 2024 12:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNtuV-0007bP-Tv; Thu, 11 Jan 2024 12:11:47 +0000
Received: by outflank-mailman (input) for mailman id 666230;
 Thu, 11 Jan 2024 12:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNtuT-0007Zx-V2
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 12:11:45 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957ba902-b07a-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 13:11:43 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33748c4f33dso5072798f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 04:11:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x6-20020adfcc06000000b00336f43fa654sm1084576wrh.22.2024.01.11.04.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 04:11:42 -0800 (PST)
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
X-Inumbo-ID: 957ba902-b07a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704975103; x=1705579903; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLWAawrZ+jzX305L/X2X+3D8gbzYJ/QUyx/ygEN0OcU=;
        b=CFtwu2dvaacTe+8gZktAKwloXBekkU7Tt3uRYFZMWyGIiLWmj3W3BMy9xtITL+0Jry
         JEpN8q2hcrCX7o2TQQDkDJS6V+JlLhbMDx8z7nhJSe6ixuhTUhjdPdMdIh6EKGa8QiCw
         9hb211oI7IWLR1cAz+tFe3E1BdEPf+/u5aQ6Mx5o0ecsoPlx3C8s7xd/yjj4IemVy5W6
         4w4cQ/SV1fWp++FnKowF0B8TI5OUEBzGlbQ90y7/wjgjNbFRSIB2ikPP5+i39lYqPFtv
         GKA5Fm+GNictdYBPlfy2el48OnBaS1CtLTI2U3V5J1mFuwUN2Lu8P5vrxhuvVOKmqC8k
         iLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704975103; x=1705579903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLWAawrZ+jzX305L/X2X+3D8gbzYJ/QUyx/ygEN0OcU=;
        b=sp9sruD46Vf1SjuTXCX5sd8sl0BU/oAUwNc7R0FvXRI2IpxjsJjCFi1XgJjcMVvZrp
         1/2t4xQ3m3iiB0HFFZQEo+YCA7Sy7J1gSVA+gNBgrfR2FLkQ5OYiSt39m1ObiU+gheHm
         PSy+5fItu1+VciSVz0swwbjm12iWylOWu1Kb0GUEmHsC2dl/RbnbSpdnnoIrQL+6PJef
         oQqjIWlo0DNNCHQYsBOB+FfgGB5z2pQBmMuqgVEptFl2DaS09gol3/pO8OscSwLl/3Cx
         ZWVzrH7yZ2hHkwHFdtz1w21uKeDeTjNkwwVMkesxIKpZt7ydiLMAcaFINJsolcgW9chx
         43xw==
X-Gm-Message-State: AOJu0YykwZrT/E8Dx7urR2Np1GOPPOZGEcMQpfm/Qn7SasmqrZRJdhBJ
	7hGSb5hTL/IXYXHZkpWsjzyriIR2MYey
X-Google-Smtp-Source: AGHT+IH/3wXPg/+/Y03UMvb3V0QpAo+gFrFTZayH8qx2vJgxt3A4JbhgdWrteXNfDHfK/yr+1G0GAQ==
X-Received: by 2002:a05:6000:4f2:b0:337:4206:85eb with SMTP id cr18-20020a05600004f200b00337420685ebmr521397wrb.91.1704975103132;
        Thu, 11 Jan 2024 04:11:43 -0800 (PST)
Message-ID: <aa0a0b1c-ffe0-456f-933f-2e62c9a47f82@suse.com>
Date: Thu, 11 Jan 2024 13:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] keyhandler: don't pass cpu_user_regs around
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <dd1c24ec-4054-43e1-b0c9-6c2044b84046@suse.com>
 <7d21e38d-d1f8-46df-89ef-809dd9c5a38b@citrix.com>
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
In-Reply-To: <7d21e38d-d1f8-46df-89ef-809dd9c5a38b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.01.2024 12:49, Andrew Cooper wrote:
> On 11/01/2024 7:31 am, Jan Beulich wrote:
>> There are exactly two handlers which care about the registers.
> 
> Which two?  dump regs and trap to debugger?
> 
> [Edit, oh yes, this is clear in the patch, but IMO it would be helpful
> to state them here.]

Sure, added mention of 'd' and '%'.

>> Have
>> handle_keypress() make the pointer available via a per-CPU variable,
>> thus eliminating the need to pass it to all IRQ key handlers, making
>> sure that a console-invoked key's handling can still nest inside a
>> sysctl-invoked one's.
> 
> I know this is the current behaviour, and I'm not suggesting altering it
> in this patch, but the sysctl was added so you had a way of using debug
> keys without necessarily having a working serial connection.
> 
> It was never expected or intended for both mechanisms to work
> concurrently, and I don't think we need to take any care to make/keep it
> working.

Well, all it takes is the saving and restoring of keypress_regs in
handle_keypress(). You you really think it would be better to risk
a cash, but not doing that tiny bit of extra work?

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> with a few trivial
> tweaks, but see below.

Thanks, and yes, I've inserted the two blank lines.

>> ---
>> Subsequently we may want to eliminate the fn/irq_fn union as well,
>> along with dropping the now redundant irq_keyhandler_fn_t.
> 
> Yes - this simplification was one I was hoping to be able to make in due
> course.  I suspect the split is only because some functionality wanted
> regs and others not.

That's my recollection, yes.

> Trap to debugger is an x86-ism for gdbstub only.  I'm tempted to drop
> all the gdbstub code.  I've never encountered it working in 13y, and the
> number of build fixes I've done personally, I don't believe the code can
> plausibly be in a non-bitrotten state.
> 
> Nevertheless, an explicit trap-to-debugger which isn't a manually
> inserted debugger_trap_{immediate,fatal}() is a weird construct in the
> first place, not least because an attached debugger can do this on its
> own anyway.

Not sure here, and I'd hope purging of that (if so wanted) can be dealt
with separately. I have a vague recollection of such "on its own" wasn't
very reliable, when trying to use such elsewhere (in the distant past,
before I started working on Xen). That's not to say that I have proof
that our debug-key is any more reliable.

> The more I think about this, the more I think we should just remove 'D',
> even if we don't go for dropping gdbstub.  It's the only place where
> gdbstub really escapes out of x86 into common code.  (I see there's a
> new one in bug.h but that is abstracted with a macro.)
> 
> Also, `xl debug-keys D` was clearly something that just got swept up
> with "make all debug keys usable via sysctl", not because it was a
> plausibly useful construct.

Did you really mean D (EPT table dump), not %? If the latter, then yes,
that may better be filtered out of what can be done via sysctl.

> This just leaves dump regs, which I think can safely use get_irq_regs()
> || guest_cpu_user_regs().  All it wants is something to dump_execstate()
> to, which just wants to be the start of the path which led here.

I don't think so - consider the case of 'd' hitting while handling an
interrupt (and, say, stuck there in an infinite loop with IRQs enabled).
We'd then wrongly dump the context of what the earlier IRQ interrupted.

Jan

