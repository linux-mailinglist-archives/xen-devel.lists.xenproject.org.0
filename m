Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAiiCVcu+GnsrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:27:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAB24B8845
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299441.1573975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJlqB-0005f7-LG; Mon, 04 May 2026 05:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299441.1573975; Mon, 04 May 2026 05:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJlqB-0005dF-IR; Mon, 04 May 2026 05:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1299441;
 Mon, 04 May 2026 05:27:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJlq9-0005d9-VZ
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:27:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJlq8-00BJ2Z-Qr
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:27:32 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f82e2b-e002-0a2a0a5209dd-0a2a4504a5ae-44
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:27:32 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f82e44-1dec-0a2a45040019-d1558033c1f1-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:27:32 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso27760785e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:27:32 -0700 (PDT)
Received: from ?IPV6:2003:ca:b72b:870a:8d83:125f:d0c4:4383?
 (p200300cab72b870a8d83125fd0c44383.dip0.t-ipconnect.de.
 [2003:ca:b72b:870a:8d83:125f:d0c4:4383])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ebb2fa5sm208836175e9.12.2026.05.03.22.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2026 22:27:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777872452; x=1778477252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rjxSBoBLt1lh8wmf/z6M3GTIG7nXPk8x67V+aMiRv/0=;
        b=ZZPjNc6LJjQXiBZ7lY1r0onK3jTYTsit44y+a11jGdDqIeD7soOb06ITmi9tPJ+AXX
         bzT2cgMsDQiDXKq5XDr9M4WJM3oyadCRkavktCyg/jYcsFWFsRBbpfibsfyBmyGobYUW
         oHIWAfBB6Ayzifde9i+FRBX3DjiMVKHhzJ+Mkx5ayumlxKYhe7hHetP5rHwQC5lSj66/
         ZU74NbCCCB/lDUYwbJcSlKKMJDluqpWU95ax1imUALw0N2Yl/dfSmaFE4oCx672Hn5A8
         MyDDeki9+2ZvSZwktWk2AphLikxBlZIHzsTvyq1dKEbmFvZ987XXFt+y08EthGoCQD6d
         sypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777872452; x=1778477252;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjxSBoBLt1lh8wmf/z6M3GTIG7nXPk8x67V+aMiRv/0=;
        b=Hg/my6k3w3ap0sAzIATtCEShLUZn64u3OhFS0+rY33LfnJmo16WQOIs0sRTjjrf+rK
         UGL5nqG0xBAMGhmMwLts8xqOU/7FNaO3kBxMGbNUE/RgO9jcyiSJnJ6gHSjcn6NB0b06
         Ve8aqViVyc1e/0R+G4b+si0dbylkMYw1KTlAzBzRaAfZmNas5xFLINoEwMlJFfvHbx7P
         Al4EEqRaGSiqJQLC3fgie2T7rc5fWbZU8JLj2NQb9l77A2Yx6HrXJ0cW6MSHWmbGsT4J
         7qdKjjFlga21hXKZ8DttAAtLV/q6x38qzWznCxwhpgMotlXnxpmkBrcYr0T6ejowywxp
         AbVA==
X-Forwarded-Encrypted: i=1; AFNElJ9yv88wn92ZtLGIH6v97wDfnR2y2jowFeBPeVGpJaEnTgMzIkzgYgMWJsga1qWgAkp5cxwoE7HtYqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYD6D46YJUKxeGGUH/Ho/5DGa2fxn18ZvYXdaTR2wd4t98Coou
	T31x7XvXxsTCzACHWyy300VON8r9KdXvMHs5GV6WQYj3rMXCrM+rf46eFC0WLz1wZw==
X-Gm-Gg: AeBDiesCu6JLR3Sa5KQXRLISHQ1GgpuK0V0RZQR+EHvhJRcqzvFGZk5X3gN1KiDUw+x
	xRMx16ofnQVHmQ/jXJrSAoVT0m7A9yUzC/Ls0dI6GV+r35yXQc8vn7O6Hh2iIe6TEjZgl051APG
	tMfdXRexZ0DsFgeRIsOw5JlmgTDGAt8SjbTWVgfp/uYvrjKRTlW7LbcJanpPnHcz11U+oQGhsaB
	rHhs9PkuOEAY5LToMAl/V/rzgRVCqyLq4Iu+yMfbYsOkag0cv/6L9rJEPzxwussf/r6s4OYJSOE
	pVIfFsfiSyLCJlHyUCSmtQKIuAAiVKYaEcHEFXpfY7tlLDepX7IznJN8iWikIWUDqeJh6j1BzcV
	JLtizCcfrBxAdaRm/0YvQAT2HPKrLaoC0ufjPlcyosRhvixmSnfu0o+UzxWQi1g2zgENGx2mfG2
	nhbBGeFeYXzdMTII9L+BaeGhJJ5YtrLyrZttKAh5+FBVslC51pIx9fq0huhzrq6JB4A0So0oQL9
	/Q2sBvtfRn3lckrkktgCUA3onSWUfmrSeoQ9plOyUeJ5RWf89PUU/hYLe4e1t6fQjtB3Dc=
X-Received: by 2002:a05:600c:4e04:b0:48a:906a:9050 with SMTP id 5b1f17b1804b1-48a98638cebmr141791825e9.10.1777872452018;
        Sun, 03 May 2026 22:27:32 -0700 (PDT)
Message-ID: <693724d7-2427-474e-aff5-c23ad9e2791d@suse.com>
Date: Mon, 4 May 2026 07:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Improved reStructuredText formatting of Misra C Rules
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <c6dffce6d424e98911a8a12ad0a868ff00c89345.1777447317.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <c6dffce6d424e98911a8a12ad0a868ff00c89345.1777447317.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1777872452-2BB6B3FF-AC9BD6F0/0/0
X-purgate-type: clean
X-purgate-size: 4594
X-Rspamd-Queue-Id: 8AAB24B8845
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,sourceforge.io:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 29.04.2026 09:22, Bernhard Kaindl wrote:
> Code blocks in the RFC rules can be converted as C syntax-highlighted
> pretty pieces of code using `.. code:: C` inline elements:
> https://docutils.sourceforge.io/docs/ref/rst/directives.html#code
> 
> For reference, the current formatting used are 'Indented Literal Blocks':
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#toc-entry-23
> 
> In this example, docs/misra/rules.rst, line 128 starts an Indented
> Literal Block by ending the paragraph with "violations::"
> (note the :: at then end of the paragraph which is enables it):
> 
>          - Functions that are no-return due to calls to the `ASSERT_UNREACHABLE()`
>            macro in debug build configurations are not considered violations::
> 
>               static inline bool
>               arch_vcpu_ioreq_completion(enum vio_completion completion)
>               {
>                   ASSERT_UNREACHABLE();
>                   return false;
>               }
> 
> Format such code blocks as C code blocks and apply ``function()`` around
> functions to make them inline linterals for monospace formatting.

Nit: literal

> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -115,20 +115,29 @@ maintainers if you want to suggest a change.
>       - Required
>       - A project shall not contain unreachable code
>       - The following are allowed:
> -         - Invariantly constant conditions, e.g. if(IS_ENABLED(CONFIG_HVM)) { S; }
> +         - Invariantly constant conditions, e.g.
> +
> +           .. code:: C
> +
> +              if ( IS_ENABLED(CONFIG_HVM) ) {
> +                S;
> +              }

If already you reformat like this, then please fully to proper Xen style.

>           - Switch with a controlling value statically determined not to
>             match one or more case statements
>           - Functions that are intended to be referenced only from
> -           assembly code (e.g. 'do_trap_fiq')
> -         - asm-offsets.c, as they are not linked deliberately, because
> +           assembly code (e.g. ``do_trap_fiq``)
> +         - ``asm-offsets.c``, as they are not linked deliberately, because

This is a file name, not code?

>             they are used to generate definitions for asm modules
>           - Declarations without initializer are safe, as they are not
>             executed
> -         - Functions that are no-return due to calls to the `ASSERT_UNREACHABLE()`
> -           macro in debug build configurations are not considered violations::
> +         - Functions that are no-return due to calls to the ``ASSERT_UNREACHABLE()``
> +           macro in debug build configurations are not considered violations:
> +
> +           .. code:: C
>  
>                static inline bool
> -              arch_vcpu_ioreq_completion(enum vio_completion completion)
> +              arch_vcpu_ioreq_completion(int c)

I don't agree with making a change making an example not match actual code.
If you truly want to abstract this (to shorten the line) then please also
change the function name.

> @@ -207,16 +216,20 @@ maintainers if you want to suggest a change.
>  
>         Clashes between bitops functions and macro names are allowed
>         because they are used for input validation and error handling.
> -       Example::
> +       Example:
>  
> -           static inline void set_bit(int nr, volatile void *addr)
> +       .. code:: C
> +
> +           static inline void set_bit(int nr, volatile void *a)
>             {
> -               asm volatile ( "lock btsl %1,%0"
> -                              : "+m" (ADDR) : "Ir" (nr) : "memory");
> +               asm volatile ( "lock btsl %1,%0 "

Why the new trailing blank in the string literal?

> +                              : "+m" (a)
> +                              : "Ir" (nr) : "memory");

Where you want to add a blank while re-flowing is before the parenthesis
here.

>             }
> -           #define set_bit(nr, addr) ({                            \
> -               if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
> -               set_bit(nr, addr);                                  \
> +
> +           #define set_bit(nr, addr) ({                       \
> +               if ( bitop_bad_size(addr) ) __bitop_bad_size();\

There wants to be a blank before the semicolon. To better shorten line
length:

               if ( bitop_bad_size(addr) ) \
                   __bitop_bad_size();     \

Jan

