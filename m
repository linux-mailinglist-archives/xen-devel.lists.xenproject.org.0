Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FFF9EB397
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 15:39:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852584.1266341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1OP-0005Qy-G0; Tue, 10 Dec 2024 14:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852584.1266341; Tue, 10 Dec 2024 14:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL1OP-0005PP-CJ; Tue, 10 Dec 2024 14:39:17 +0000
Received: by outflank-mailman (input) for mailman id 852584;
 Tue, 10 Dec 2024 14:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL1OO-0005PJ-EW
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 14:39:16 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86a26286-b704-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 15:39:14 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-434fa6bf744so13724535e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 06:39:13 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f2b08972sm98608735e9.27.2024.12.10.06.39.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 06:39:13 -0800 (PST)
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
X-Inumbo-ID: 86a26286-b704-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733841553; x=1734446353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0P87S9AqnrrzFSb7FApiqbW/7L/KL0GWFbBmHRsto34=;
        b=JcWM5K2k4POZnwG+B/aAwODhyB4wCswuYWS4ZEaPdrfY9RX4/zdFa2qh0VlBqIZjUC
         1QFRc737g3oqliyhDfbnkKz68ZjZQhGU2Io1+JpCYPmdxmdq+7lsdfqdoPjKG9clVool
         0CXbXiYTDE8kbFtAAxzpoB2/sPKUDb+0Jb16en/5e0GA0LoVZ4JQfbnER/WLQjA1n3Vg
         9w4GfPpH9tuMD7855lkakq23K64mxkCSA5iDmqZAkz4MyE9YrP4CpAkEGogHqdTRXv/b
         w93HBxSOZIreLq+4g9o7aQioqDLpq23RuMBAFhufw2x7WG9VFlvU76NUscWrTOIp9MBv
         LnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841553; x=1734446353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0P87S9AqnrrzFSb7FApiqbW/7L/KL0GWFbBmHRsto34=;
        b=Su2/w8OWLfow113EhXDAfPIMXY0huzxwy91MPLtRoUzy8L4EYdSUdt3ZIO5jsCRSS/
         +1Gtrc2Rd62ZO4E3GreQDNFQ7f5sGk0PAuI7l/0fcvw1Ok4sO8p8rHOnoWTYP3mE4oML
         UVtzWUKLLAoMGWaU+bB+SWZE7opw/3gI/0J7XvpF1u1FeP+1OLjG8m4QMxnIbqOikCTU
         6i4kNz/1nNanF9M1HcyFzA6KW1V9ganH37PfAThLPk9G36DkMH0X0cbC3XCI33kscRlX
         iaiC/VuCSure21Ll/o+SHImiw5ms+pSdvncM5q5T0ao6W7jE5tKcf286Zl0S62wpqQdr
         65Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWC1MjyYZKrYCRLAdFc5xkWE1EzUR8FVKLoqgwxVx12dTSL6+or6F8txxBjZgphQYy/CYssqKaXdoM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywo+iSApSLEEWXgvc/j/8SL5p4xSjxbt91mosJ7HXhEFuQ6bNvv
	x4VxQaYwZBxVGoTWwePhxqktBmcUlSy4hYxxhbevMRyb4VXmTprrBwMd9c7G1g==
X-Gm-Gg: ASbGncs9CdvSFhXm4vdERaNiolQFINiKqOgBHGL/IucMIosmJ51e59wxmFM04pbKPzy
	m/X/PyB84IhI6c2YMt7g/sotYcHu53jskJ5akXribomAAZ7JV08Cc3GjBNBLB6RQii11bJpmxyc
	t0vsENVe0v+4LG7Ptx0baxi4ZSXVp2PoiD6OuqJggTRvibhOWje8fBJQxamR4YPBGEGQ8sbFXxr
	iNzloeNp4YxWLsLQevOxLxQwk384qmdz7wJnPSJzHCRuCmIxS4nBPysy+WKXy319k+qhgX7DEbl
	aLTiyzqGKJwRGjkTE1/+bADDmvEEiuHazRTV+IOo/D7dfLeS1RanMGmlSzShzQMwcyFqWsfc3BD
	j//tISliokA==
X-Google-Smtp-Source: AGHT+IGeCh8DWj4ljOdgiQly71nMWQkQiPeQf1qMDrkM8OjKMwFO2AH+mgF1DzZT0TfeGeXEA4QloQ==
X-Received: by 2002:a05:600c:3547:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-434fffd0490mr36276975e9.21.1733841553361;
        Tue, 10 Dec 2024 06:39:13 -0800 (PST)
Message-ID: <d300182e-0997-4150-8d9e-3fa20c100e98@suse.com>
Date: Tue, 10 Dec 2024 15:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] Use an include/boot directory to override headers
 for boot code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-2-frediano.ziglio@cloud.com>
 <f1586637-9d09-405b-8da3-c98d4e38f839@suse.com>
 <CACHz=ZgyxwCVq1Zvwz9oVQO=-e85Sy8CnvyspK_-FFB4FTGyrA@mail.gmail.com>
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
In-Reply-To: <CACHz=ZgyxwCVq1Zvwz9oVQO=-e85Sy8CnvyspK_-FFB4FTGyrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 15:29, Frediano Ziglio wrote:
> On Tue, Dec 10, 2024 at 10:14 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 22.11.2024 10:33, Frediano Ziglio wrote:
>>> Not all headers can be used by 32 bit boot code.
>>> Allows to override some headers, we don't want to mess up with
>>> main headers as most of the code is only 64 bit so the easy stuff should
>>> be done for 64 bit declarations.
>>> Boot headers should be 64 bit compatibles to avoid having multiple
>>> declarations.
>>
>> I'm afraid that in isolation it's not clear what is intended. Boot code is
>> all located in a single directory. Can't we use local headers there, using
>> #include "...", instead of ...
>>
> 
> That approach was refused.

Can you provide a reference please?

> Some definitions are in the headers (like
> CPU features for instance) but duplicating the definitions was
> rejected as a solution.
> So the idea is to reuse such definitions. But, as stated in the
> comment, the "x86" includes are not for x86, but most of them are just
> for x64.This for historic reasons. But most of the code is x64 only so
> changing headers to be x86 compatible would complicate them for a
> minimal gain.

Yet the amount of what wants sharing ought to be low. It might even help
to clarify what it is that is meant to become shared.

>>> --- a/xen/arch/x86/boot/Makefile
>>> +++ b/xen/arch/x86/boot/Makefile
>>> @@ -18,7 +18,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>>>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>>  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
>>>  CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
>>> -CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
>>> +CFLAGS_x86_32 += -I$(srctree)/arch/x86/include/boot $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
>>
>> ... introducing a arch-wide subdir, which non-boot code could easily (ab)use?
> 
> You would have to explicitly add the "boot" into the path,

No different from "hvm" or "guest", just to give two examples.

> it does not
> seem "easy" to me, but if you really want to do it you can do with
> these or any other headers, like simply "#include "../arch/arm/..." in
> x64 code. Same easiness.

Well, no, the ".." in #include directives certainly stands out.

Jan

