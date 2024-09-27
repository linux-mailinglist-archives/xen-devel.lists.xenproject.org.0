Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED50987E5C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 08:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806030.1217325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4QE-0005yy-JQ; Fri, 27 Sep 2024 06:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806030.1217325; Fri, 27 Sep 2024 06:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su4QE-0005wH-GR; Fri, 27 Sep 2024 06:25:46 +0000
Received: by outflank-mailman (input) for mailman id 806030;
 Fri, 27 Sep 2024 06:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su4QD-0005wB-6Z
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 06:25:45 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52d4534d-7c99-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 08:25:43 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so275475366b.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 23:25:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm84955166b.222.2024.09.26.23.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 23:25:42 -0700 (PDT)
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
X-Inumbo-ID: 52d4534d-7c99-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727418343; x=1728023143; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sQRNToAWYO3flBP3IIebOypElpWR3eBpaWt4WUKWJMk=;
        b=Yos7iCmm/b6Rw6rFgbF/WY3f/NxMeG4Ficxt5PY/F6HfxaXGC1jKK/z/xUmIyhKjwE
         4gH9QUunvwCz7ZO7SxyPyTbs1qHtb/ANWbTBYnw8wTpBam09Lwgz80jWIOmoOb1V1UFW
         U0pb0Tqz781UEmUajPr4iajP/UybzWqA6ofQk/lnhnW+B68I/2+gAtGI87OkYxliUU40
         6MbgoMxvsw/qBIttS0OEHW0UGltlL3ZQqtEgYVlu/tT3Xlj5SM/gT2kD905GcfuU2Okw
         juiB0nPkmPjeGsiPoj7eDgdBe56805Nj4Iplot+NZOO59i3heApyKypyrz9oqL6fOjTc
         Y4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727418343; x=1728023143;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQRNToAWYO3flBP3IIebOypElpWR3eBpaWt4WUKWJMk=;
        b=gHWYvAlJ0pFvz0ZpnrjSPBHPJ8cuNOMgRNkb/xYtTFdQgLZp8d4LLIuuvstdfXo0Ys
         ZjQoqx52TBanVjwC4Oy3jeZHGrZbRzsnhEiufos0lBLfqqAiyUMYMlp7uU+Lmk08CfAb
         PtwxSrG3N0J/no1W96TPR1ASqWlQQtp9hqmduBwuBOHKJ5MZJl/kfgZDT4bcjwH+eM8M
         2Jf2d8Ihjq0spRX8MRnr5jTW9nJumBtL46cNb3UOfi4A8M+MS1mqrLm50vb8W1YoW6OX
         OtLOc/izdXIG5ucaYFtpbjj5iOoy3P9GJdUvJDDCSEKTXPICGBcGhaPSBVTSdoOHrFkT
         YPZA==
X-Forwarded-Encrypted: i=1; AJvYcCVfSANn1Zm5DcWPeLFG4QDJDytP1O/xnoWKq5P946eAP/vHCmwZKONwf86HGdbR0WPsdsWvwe2sASk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGhoYXWm2CUyjB0LQo9fR9FzBdMttSCS+r8cMZR1e/2CCE7HhL
	FnzFznE1eu9rILbCMrDj29yk4/eBP24tuRhwv6Xhfkm75SevVCXNDGGAf9Ptxg==
X-Google-Smtp-Source: AGHT+IGEQeaBxN3Yy5H0oFHhkTtAWPHMsF392gZacoVLA1Q+cbwTDjtFbvCZEeZifX/yX6q3xsEjDA==
X-Received: by 2002:a17:907:60ce:b0:a8a:8cdb:838c with SMTP id a640c23a62f3a-a93c4a973cemr170647766b.53.1727418342690;
        Thu, 26 Sep 2024 23:25:42 -0700 (PDT)
Message-ID: <2f13ea6d-adeb-49b4-80f7-415d9503c7c7@suse.com>
Date: Fri, 27 Sep 2024 08:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers/video: Convert source files to UTF-8
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240926134823.688372-1-frediano.ziglio@cloud.com>
 <63129694-ace9-4b55-92c2-7cfb8a2c1386@suse.com>
 <CACHz=Zj0K+uYt7h80p3Crkom-VNoLbH_4Wt04jdNDYs28tApdg@mail.gmail.com>
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
In-Reply-To: <CACHz=Zj0K+uYt7h80p3Crkom-VNoLbH_4Wt04jdNDYs28tApdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.09.2024 18:03, Frediano Ziglio wrote:
> On Thu, Sep 26, 2024 at 3:46 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.09.2024 15:48, Frediano Ziglio wrote:
>>> --- a/xen/drivers/video/font_8x14.c
>>> +++ b/xen/drivers/video/font_8x14.c
>>> @@ -2059,7 +2059,7 @@ static const unsigned char fontdata_8x14[FONTDATAMAX] = {
>>>      0x00, /* 00000000 */
>>>      0x00, /* 00000000 */
>>>
>>> -    /* 128 0x80 'Ÿˆ */
>>> +    /* 128 0x80 'ÂŸÂˆ */
>>
>> I'm unconvinced this representation is any better. The data that follows
>> right here clearly means 'Ç', not 'Ÿ'. Which is U+00c7, not U+0080. I
>> don't have my Unicode manual to hand, but I seem to vaguely recall that
>> U+0080 doesn't really have a glyph associated with it.
>>
>> Of course I'm also uncertain whether my mail UI actually correctly decoded
>> the transfer encoding (base64) that you now used. In any event I'm unsure
>> of associating the upper 128 code points with any particular characters
>> (glyphs). We don't render UTF-8 to the console, and what those code points
>> mean is unknown until code page information is provided. I see the
>> following options:
>> 1) The glyphs represent what the bit patterns encode, encoded as UTF-8.
> 
> That was what I was trying to do.
> I wrongly thought it was latin1, in reality looking at the font (why
> not?) it's code page 437, so this commit is doing the right thing
> https://gitlab.com/xen-project/people/fziglio/xen/-/commit/7ca512e8ae21bb02339ed7a1a78409827a08aea4.

Yes, this looks good (after looking at just a few entries).

> Now... I'm trying to send the patch to the mailing list, which seems
> easy, but I have to find the right combination of options, tools get
> very easily confused about (that's why I send the link of the commit,
> at least people can take a look and see that is correct)

Maybe this is a case where, besides inlining, it would help to also
attach the patch, to remove any possible ambiguity due to back and
forth en-/decoding?

Jan

