Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E62D07FD3
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 09:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198427.1515387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve8El-0006yw-Lt; Fri, 09 Jan 2026 08:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198427.1515387; Fri, 09 Jan 2026 08:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve8El-0006wY-IY; Fri, 09 Jan 2026 08:52:51 +0000
Received: by outflank-mailman (input) for mailman id 1198427;
 Fri, 09 Jan 2026 08:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ve8Ej-0006wP-PI
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 08:52:49 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91d1d11e-ed38-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 09:52:47 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so2897247f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 00:52:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5fe67csm21025888f8f.40.2026.01.09.00.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 00:52:46 -0800 (PST)
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
X-Inumbo-ID: 91d1d11e-ed38-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767948766; x=1768553566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4wuBoEC8pXbkWBD/bTl21VJ5ojFsTXdX4usyEM4A20c=;
        b=GSEfpoNWKNIv5fpl20X/kFk+zeUWZxHN1nibzJcbVRuwPS8eyQnsAE27g4IEJqMcbY
         XHDAjGPwkZ9tzbvjRQiC7aluCtjGGVsbcGkXPxPfCXugI/CFyZrutn0E4VSzPYHOvzJy
         nxch/wFtgLDmd+30ukDfjaIbOUvyTDK1G5+/tMVoBRTtrhOunUXOzumx6dh6rjSn9uVP
         dnGhHAh5mFXvfF06GflHjCPS2FtB654WPVG2LV7uspkz0WPMECjL32GhJg1hAHCFQx3u
         c/RnJyb+W4oGOxQhWpCsYC0Br6iUdWjaTOpAzVzcaQstccy0vi9WjUssQyRgJY6+MxRO
         RC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767948766; x=1768553566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wuBoEC8pXbkWBD/bTl21VJ5ojFsTXdX4usyEM4A20c=;
        b=JVB1iuRelmc3PL+E/Xsu1M3ZC2z06XNHfeNm6NSVIbCE6Eec7OZHhXGBEw6fMBFEa6
         SvWqvYai/wzJ3YV16f3H9o9oLGq2UOWldXr9F8RcwgWYgHKrEF1DRxqfajtND4FHyWgK
         jPXX8SQmbKGAsZ/FC3VC6BEevGbmy7eoRZZlzVDNcFidnTRhz+FWkwZxKXfYEcouFjyX
         9ElM5CvEiN/bq1DmXOXrhYPcxM6bDXyc5HlxYFhaah0P8qwReb1BX0AUF0t5C1y7qgkQ
         JtCoRkacJnQMzuiZCXbfw67UVHAWBKDFfkqgqEj5DF1n17/Q35AK3L311TuiBparExP6
         UfIw==
X-Forwarded-Encrypted: i=1; AJvYcCXNjivb5rqZNra+P5el9JtXW16AnReg7YoZHkQmU/EgojVKHSwRaMPRT04/N9cC9hp4ujzxjaNQosg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3VB+muER1jtmFc13NjuRbTwGv+hfd8eF+E28e3G5wim2DPQO0
	1sHByk4k9huL032DFvkO0/7Q/kGmnOo/BqHF8E0QEtpsGLhXsdmTb7rf8xfRY6x3bA==
X-Gm-Gg: AY/fxX5UAbYYoh8jgJDfDQaQN2c2aMvarX2TpjoZ5j8tZBHfxKHR+hvvgM0FIPJPqRL
	OcyydF4Rqs1M13nxOKctHGIG4tF+VvV0YZIm2tpQ6pz3b8Zpz+uy+CTNg+1MosQfilV3M+cSydR
	/j8ObLJGubhZc1ZsjEt9xmUGDzNqt2wC4DMOTe/9NvqDkjaCc5JkfSgI1C5Tcp20FsVuqzZhvg0
	l8S1TEyEdd8OzbgJ7P0vwH4a/sY7sp6oRcpIomClluUvwKTfmVJjhZOZ6isrs8vGniTFp6py/0G
	xLXTJFzloZxHUf+9HKXWigUYZCiENMrVm5q00g13uU/aQE03sDe/RSlcYD30cK/qlSWZaRC8B/t
	arXfLfnQiIOm4EtafjPMjSFdMLTJ8So4iSqYwF97PeeF42T2Reh7v2Br9hfdKBUnezvz1QD00JY
	Lc3hInmFp8b+HeBlnFYdN6Qm1D9a7FAEkdVlt254p7yX0feHW5cHu0T82CMfAnWeC+Fa7o/JnF/
	cI=
X-Google-Smtp-Source: AGHT+IHnckDLl2ILoLgj0ZXykIDzrlo0YJP0Cx1XFakkgE9fl0GgWFFe+sqw+AQSLcftmxv+Glbg1Q==
X-Received: by 2002:a05:6000:22c5:b0:431:8bf:f081 with SMTP id ffacd0b85a97d-432c3790cf7mr11062673f8f.23.1767948766300;
        Fri, 09 Jan 2026 00:52:46 -0800 (PST)
Message-ID: <1a70284e-de5a-4e5b-9641-12be48a311f4@suse.com>
Date: Fri, 9 Jan 2026 09:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86: guard synthetic feature and bug enumerators
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <239a5d80-c0af-410b-a053-5fa84273aecd@suse.com>
 <feb1e200-e852-4c51-b993-ee078f4e6beb@citrix.com>
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
In-Reply-To: <feb1e200-e852-4c51-b993-ee078f4e6beb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.01.2026 19:12, Andrew Cooper wrote:
> On 07/01/2026 2:11 pm, Jan Beulich wrote:
>> While adding new enumerators one may overlook the (rare) need to bump
>> X86_NR_{SYNTH,BUG}. Guard against that happening by adding respective
>> checking. The use of BUILD_BUG_ON_ZERO(), however, entails a number of
>> other changes, as the expansion may not appear in the assembly produced.
>> Furthermore inputs to file-scope asm() are only supported in gcc15 (or
>> newer).
>>
>> No difference in generated code (debug info, however, grows quite a bit).
>>
>> An implication from the changes is that users of the alternatives patching
>> macros may not use unnamed asm() input operands anymore, as the "injected"
>> new operands would break numbering expectations.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Fix shim build. Use named label operand in pdx.h.
> 
> I'm pretty sure that will be rejected by Eclair as a Rule R20.12
> violation (using a parameter as a regular value, and stringised), and is
> a blocking rule.

I don't think so - see the difference between the non-compliant and the
compliant examples in the spec. The label passed here isn't subject to
further macro expansion.

> But more generally...  I see why you want a guard rail here, I can't
> help feeling that the cure is worse than the poison.

That's a fair position to take, albeit I don't really agree.

> Updating every alternative is very invasive, and this in particular

Well, luckily it's far from all, but mainly those which use the upper-
case macros directly. Plus the two "(ab)uses" in asm/spec_ctrl.h. The
change in asm/tsc.h is actually in our favor, I would say.

>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>> @@ -73,7 +73,7 @@ static always_inline void spec_ctrl_new_
>>  
>>      /* (ab)use alternative_input() to specify clobbers. */
>>      alternative_input("", "DO_OVERWRITE_RSB xu=%=", X86_BUG_IBPB_NO_RET,
>> -                      : "rax", "rcx");
>> +                      "i" (0) : "rax", "rcx");
>>  }
> 
> without even an explanation of why, is an immediate red flag.

Honestly, to me the "(ab)use" in the comment is enough of an explanation.
Plus, really, the end result now looks more "normal" than before (in no
longer having comma and colon next to each other).

Would adding /* dummy */ after the seemingly stray input satisfy your
request for "an explanation"? Else what exactly would you expect?

> Could we not split X86_SYNTH()/BUG() to take a leaf/bit pair, similar to
> how we express regular features as a*32+b?
> 
> That would at least make it more obvious than currently when a new leaf
> is needed, and contained it to a single header.

I'm pretty sure we could, but such a split would be largely artificial.
Hence why I discarded that option very early, the more that - as you say -
it still would only serve as a hint, without enforcing anything. In
particular I could easily see me using the next "major" index, but still
forgetting that X86_NR_{SYNTH,BUG} would also need bumping. (What might
help a little is if the two really moved to the end of their blocks, so
they would be more likely to be spotted when adding something to the end.

Bottom line: I'd prefer if we would stick to actually doing the checking
(or yet better derive X86_NR_{SYNTH,BUG} from the uses of
X86_{SYNTH,BUG}() [1]). I'm not particularly happy with the way the checking
is done right now, so I'm all ears towards improvement suggestions.

Jan

[1] Some initial idea: Have

XEN_CPUFEATURE(SYNTH_1ST_UNUSED, X86_SYNTH(...)) /* Must stay last. */

#define X86_NR_SYNTH ((X86_FEATURE_SYNTH_1ST_UNUSED - 1) / 32 - FSCAPINTS)


