Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90263814814
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 13:29:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655099.1022772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE7Jh-0003Wo-TG; Fri, 15 Dec 2023 12:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655099.1022772; Fri, 15 Dec 2023 12:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE7Jh-0003UA-Qc; Fri, 15 Dec 2023 12:29:21 +0000
Received: by outflank-mailman (input) for mailman id 655099;
 Fri, 15 Dec 2023 12:29:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rE7Jg-0003Sl-Ct
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 12:29:20 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 919a7f28-9b45-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 13:29:19 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cc2238f597so6682581fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 04:29:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b59-20020a0295c1000000b004692731d512sm4149976jai.69.2023.12.15.04.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 04:29:18 -0800 (PST)
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
X-Inumbo-ID: 919a7f28-9b45-11ee-98ea-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702643359; x=1703248159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0SBXzRmCdovs9HRQBMq+0SXsXtq/1IqzbtDsjE3+dNE=;
        b=BWBemIsX8VsXZkQhwCQgPbQdoXVUPyfzG/HD0X41xOBlbPF+7z6doV4bTVXPGFRlbR
         HnkbDzdLAhCB99djDuYyDacAwiGovaM1jEHro/rzFqFkbOa85fGV05IZZALlHXvLdnS/
         TkhOc0kQALMcl4M09eEEUCpGTICXULzL2cfqIhq3f+iiycFbg9ReLv1hCKV7FSdpAj4Z
         2QU3kucdhntQGynj8ZZjFHt3PGo1ZDP56nj2GbyYCLssFOX3ZkLrG3YtIvDcbTG2TS8l
         SWOVdYq6NQEb8SM8Fh/r0aNNVRdWnW5J2/8pFBpCxRbzw2I0cRnxySeoa0SmERbrX2eH
         fIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702643359; x=1703248159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0SBXzRmCdovs9HRQBMq+0SXsXtq/1IqzbtDsjE3+dNE=;
        b=Dhe2nwp5firXszOmzebZ5Eu81ORkqJGsf2BRYg73R2uSTsPO9wjytHJFBWxWPkTeXk
         iXi42yQuqcRyj3v72SEOrpSXfMO6Is2GhhaXTruaMvKPaFCJwjCpQr1vMPNZYXoHlugh
         78W8YmvmW6Gc4ycn//m7jociTCV5POCfLqcAAm3ILnoFc16WFdh+xYw8JsAFs9zzxsR7
         W/4zYgVXltanteUif1GL5KFlPNVYEjRAT9QcAMKpJnJMoocQej0pfp3QUvO/G/ErGvm6
         b4BCoe8uVEIxgUpxRcqYvM0cAHwIlYKB4czPLU8r8Ok8EbOhUVFzpfpMTjyKhnsx7mnB
         WShw==
X-Gm-Message-State: AOJu0YzyQHnUvQaN5gZ86z/YI1e/rH7qr+qFck3fzwccxK9Us3mUvTl6
	ub50g7xXgHHqUWD4uxlMOfBC
X-Google-Smtp-Source: AGHT+IEH9v7VE7FatNZ0/o4SCi25YQXb/aVvXen7mp+fM8Rf8MXfa+zjg2IjGgkxK4RNJrKeMxWmNg==
X-Received: by 2002:a2e:b173:0:b0:2ca:129f:3f9c with SMTP id a19-20020a2eb173000000b002ca129f3f9cmr2303758ljm.25.1702643358909;
        Fri, 15 Dec 2023 04:29:18 -0800 (PST)
Message-ID: <6abd038c-fe93-4a7a-bc60-3d5c483e199e@suse.com>
Date: Fri, 15 Dec 2023 13:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix C compatibility issue in mini-os
Content-Language: en-US
To: Florian Weimer <fweimer@redhat.com>
Cc: xen-devel@lists.xenproject.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>
References: <87edfn8yn8.fsf@oldenburg.str.redhat.com>
 <cc41e7e9-13cf-48dd-a0a0-3e0d9d9b4051@suse.com>
 <875y0z8xif.fsf@oldenburg.str.redhat.com>
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
In-Reply-To: <875y0z8xif.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 13:23, Florian Weimer wrote:
> * Jan Beulich:
> 
>> On 15.12.2023 12:59, Florian Weimer wrote:
>>> The cc-option check always fails (that, it picks the second option
>>> unconditionally) if the compiler does not support implicit conversion
>>> from integers to pointers.  Just drop the initialization because it
>>> seems unnecessary in this context.
>>
>> Did you pay attention to ...
>>
>>> --- a/Config.mk
>>> +++ b/Config.mk
>>> @@ -21,7 +21,7 @@ endef
>>>  # of which would indicate an "unrecognized command-line option" warning/error.
>>
>> ... the comment the tail of which is visible here?
> 
> I didn't investigate how the mechanics of the selection are
> accomplished.  I was so happy that I finally found the source of the
> int-conversion error and got a bit carried away.
> 
> Looking at the shell script fragment:
> 
>>>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
>>> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
>>> +cc-option = $(shell if test -z "`echo 'void*p;' | \
>>>                $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2) -`"; \
>>>                then echo "$(2)"; else echo "$(3)"; fi ;)
> 
> I can see that the exit status of the compiler does not matter, so the
> patch will not make a difference.

An option may be to use Xen's (newer) variant

cc-option = $(shell if $(1) $(2:-Wno-%=-W%) -Werror -c -o /dev/null -x c /dev/null >/dev/null 2>&1; \
              then echo "$(2)"; else echo "$(3)"; fi ;)

here as well (omitted all commentary). Cc-ing maintainers for possible
input.

Jan

