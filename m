Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ5/BtrtpmlKaQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:19:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAFB1F1500
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244829.1544195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQaI-0001Ys-EF; Tue, 03 Mar 2026 14:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244829.1544195; Tue, 03 Mar 2026 14:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQaI-0001XR-BP; Tue, 03 Mar 2026 14:18:50 +0000
Received: by outflank-mailman (input) for mailman id 1244829;
 Tue, 03 Mar 2026 14:18:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxQaH-0001XL-HR
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 14:18:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e47a8fc0-170b-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 15:18:47 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439b8a3f2bcso1707883f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 06:18:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439ba2a58dasm11432271f8f.27.2026.03.03.06.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 06:18:46 -0800 (PST)
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
X-Inumbo-ID: e47a8fc0-170b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772547526; x=1773152326; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HuTfQgsOPgXncwtzFb0ToG36NX3pcQJjsDUuwPvdBSs=;
        b=FDD8nsUFt75xmCdQxlEkGUS/HYkaDSwlzSsKETGNQZ+IJvXMm7IAnc9B43/VgMipMU
         1FGJ49WMKMcgY/t56mr8hwoBG/9cm69UJI+AME7IT5wEImcELdLLyhmwtU+De3OR66Ag
         GQKf7Z2Gnme5IoZkKuMy74+Ame+wn2UV3FrRQ4B7L/U6iUI3IeM7C82ozkhg9ZqJtXIf
         iO3JzrPC8/ec/5MZ9VFTGOdjHblfAEEhJivcWM86WHAohBmu1DXA3ooH54W0hV0dQmAY
         yhD9paGP1LiN6Bo2Oq9HFcysEnx1jlDMP0J2KmY883M6CiSb5ZU0JbnVC8aU9P4LlXI4
         FpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772547526; x=1773152326;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuTfQgsOPgXncwtzFb0ToG36NX3pcQJjsDUuwPvdBSs=;
        b=MjuN7tvz6zMP6fIhtolyDvLma2LXZxKnpOlD9qdOH3tebuJ+oJ5qYW2Ovrqo0m15+7
         RxV3M+gTeWo29MxytkVnUB13mg0op6t21qK3Pw6wdYAZ3RmbeCQzxrw2jCdMkGYJV0Ua
         FhG61J3VGm3hsh2Lm/ln7PiLTvGl5XuCftdc2Zf0zjYHDc+DD+Kui+wo+tHq1pSV/UKE
         RuiPBh59BABaFG19eW8NMEouvTE7jfP1kAOyB6gC4xI8Y+8KwCbvmbMoc+TLaErL9npR
         FnZ5x9d/tZNIUKN7LkEe/OFytHspfhq7XIm+kTEXS0OAhX/npugeqWPnQjSefMmmdK3V
         HcAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlfXH6eRT00ZdM44TzZcwkDLamSzM8WjeeiKjYSH+23jDJzpydBKwrDYZyywYwqAacrYcI9y0Z5cM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJi2/D5aseioPDLSyvWunNvgQ1HLoalLROpgJd5WQ+hM5ZFdXz
	wNPnAusJ1XdXhyG5+nJ8NTgwxzpKrDVUewYlmTpgQiUn67xUge54Uo5uUVoIAaClYg==
X-Gm-Gg: ATEYQzwAFfMjdzkZ+4tSpUDDOxguOJEIdNCZ9DXyodudJhPdsOAvTvgc5ZH9b5tX/du
	a8GPoas78pcbXDRbqsBgoc3jTGNQHtupzsd7BLWkn1Ra+wXuTvDplv/nuMX/dn+WsgPX67iU3b7
	2jOEBWXoDVxhHqAIWaPm/CqXn+KIL0XglmVEPqg2Uwm3ilgrx5d9atZVSXo2N2JmEjeL5SELaC3
	8ZnPZk1aZwVd32xCThK1SGPRk2zZKncxOcp0+4fmrak7UVc8SFUxS6F2A9xNlwCQOunsUg0wV3N
	Z8V/UkdRBUXAFOMNmbgnAJrrkRJK4pkOsSEwkgMQezoG2Kb7Nly2ryT4WQKVZScEIJYf7Cni/11
	yspFhaVefkaRn8TRJlFb7HLZUbVxR/NlWtDXNsks527KKuSM58CD8HlY3MwASD1W3XV9ZS/ZPT5
	ZbeJvv9yClvMWoaKdAQQgATlkQs0XK1stqF6DxCg2wE0/PZQF9DzjvyKwuljP3qhHLUdAqrqOsK
	0cAUGlVt2c3OM0=
X-Received: by 2002:a5d:5885:0:b0:435:9cd5:bb2a with SMTP id ffacd0b85a97d-4399de032c0mr28955619f8f.24.1772547526439;
        Tue, 03 Mar 2026 06:18:46 -0800 (PST)
Message-ID: <c1ae770f-a408-45cb-907c-dab200ef5326@suse.com>
Date: Tue, 3 Mar 2026 15:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tools/tests/x86_emulator: avoid passing NULL to
 memcpy
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <340f6a9fc4fdd4216f41e4bbdb1234069322d1c8.1772189234.git.edwin.torok@citrix.com>
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
In-Reply-To: <340f6a9fc4fdd4216f41e4bbdb1234069322d1c8.1772189234.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7EAFB1F1500
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 27.02.2026 11:58, Edwin Török wrote:
> Fixes this `-fsanitize=undefined` error:
> ```
> test_x86_emulator.c:614:12: runtime error: null pointer passed as argument 1, which is declared to never be null
> /usr/include/string.h:44:28: note: nonnull attribute specified here
> SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior test_x86_emulator.c:614:12
> ```
> 
> Although this is more of a grey area: I don't see anything in the
> standard that'd forbid calling `memset` with NULL and 0,

There actually is. In the C99 spec clause 2 refers to section 7.1.4, where null
pointer arguments are excluded. Imo for memcpy() etc exceptions should be made
for the case where the count is also zero, but sadly nothing like that is there.

Nit: Why do you talk of memset() though when memcpy() is what you alter?

> but `glibc`
> does specify it as non-null, which allows the compiler to make
> optimizations assuming it never is NULL, so this is undefined behaviour
> only on glibc.
> Best to avoid the potential undefined behaviour though.
> 
> Signed-off-by: Edwin Török <edwin.torok@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with both nits (above and below) addressed. I can again take care of that when
committing. (Same remark applies here as to the usefulness of compiling ...

> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c

... this file with sanitizer options active.)

> @@ -611,7 +611,8 @@ static int fetch(
>      if ( verbose )
>          printf("** %s(CS:%p,, %u,)\n", __func__, (void *)offset, bytes);
>  
> -    memcpy(p_data, (void *)offset, bytes);
> +    if (bytes)

Nit: Style. A well formed if() is even visible in context.

Jan

> +        memcpy(p_data, (void *)offset, bytes);
>      return X86EMUL_OKAY;
>  }
>  


