Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED399C522B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 10:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834263.1249879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAnJE-0005R7-V2; Tue, 12 Nov 2024 09:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834263.1249879; Tue, 12 Nov 2024 09:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAnJE-0005PE-Qx; Tue, 12 Nov 2024 09:35:40 +0000
Received: by outflank-mailman (input) for mailman id 834263;
 Tue, 12 Nov 2024 09:35:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAnJC-0005P8-I6
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 09:35:38 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 775d3776-a0d9-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 10:35:34 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so45177465e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 01:35:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b054ad23sm199944225e9.13.2024.11.12.01.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 01:35:33 -0800 (PST)
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
X-Inumbo-ID: 775d3776-a0d9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc3NWQzNzc2LWEwZDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDA0MTM0LjQ3MjQ2MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731404134; x=1732008934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WitM66RSknAhNK+Jov9TP6YQcF84j3HUyRaPkLrO9k8=;
        b=RNw/Wce6jcgrwlsdpfC+ifgupewjVcto4TMtsaoLpFRb7pnER5h67dl/CvXht0aVYm
         n4GnjYpPFEpX23rbKnj+DUrQOC0V9tpWJ/vstik+KIVTdpEEzBT82xQiB79PYHQDtpkJ
         aJOqUWYQtyn3PCsnvcMH4ej+qVAb+kyguAm5mLsQHcSnjyew9Z3AoQjoGmUObvzTl02K
         EuvYkz2pBxRmNJVy/mROw/bJPfHhUyUljKhSo9xu5YFNa+7x86x7YG805K3hAPY467du
         NYPpb62jg7qA1tmyUN2Qjs9LU4DeT+9n8QO5QDt1mbXEoFaxw6p3QQNPxz1RUbofwFwn
         i62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404134; x=1732008934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WitM66RSknAhNK+Jov9TP6YQcF84j3HUyRaPkLrO9k8=;
        b=PkYKzSryk7//5KLrrutN0Q89BsWswEh95CdqO86yw2w96UHrRDYO7xkUhG8m0ytZ7n
         mke1Thf541+xMRr9RsZqcWXyRlo52h6ifWXJ+Bd13ow03AdMKm7cmF4OzH8hK2krRTKs
         9H+WGgjf50QetonWtlsMEkH11TCEkgRchgDwiHR6NEhUxuDN5n4STlj9zYoTmd34/uD0
         UxGVkz125AUdaZtewDmpw/fBRhgiG7zfjtsXhpBiB3hNwhK748x5A7fF5pzU9WVYDYun
         yfIlWTC0vhlf1EFVd9KJk7zef/AFSMIXMJKozLIbshMFIDmYgOSvsMQ7/zQRMXg0d0oK
         EJmg==
X-Forwarded-Encrypted: i=1; AJvYcCVAA8DTKAljl9Fnjh/KACwY9pRmcUoorJE8oc9uuNYh6r5Drnu64z3sx4OQRjZ7rQs4jWITPENAs7E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYo6v+ZgTnQwPCdGDmmyZphR3ZCPjc4722YQwePqXvOm9oP6g4
	wcUFCfuzXdu2mVjiDFGnMJEAIGxxk0ERUABVMUhoqQZvj9p6EM7ZizrGgZ6AeA==
X-Google-Smtp-Source: AGHT+IHo2c5hYtMNOGwCR2KuwKhy18v11sZtBwUchR7EZ59p2XC+rme5x67nTm3epACgH/TTHnSSUg==
X-Received: by 2002:a05:600c:154d:b0:42c:bae0:f05b with SMTP id 5b1f17b1804b1-432b74fd6f5mr132622455e9.1.1731404133844;
        Tue, 12 Nov 2024 01:35:33 -0800 (PST)
Message-ID: <7f28102d-c13f-4175-ad47-64e7495d22eb@suse.com>
Date: Tue, 12 Nov 2024 10:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] x86/emul: define pseudo keyword fallthrough
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1730880832.git.federico.serafini@bugseng.com>
 <a0341b50ece1ba1b5b346b54db7d2abdc150cb95.1730880832.git.federico.serafini@bugseng.com>
 <be21f3cf-e7a8-469a-99a6-4098032a4df4@suse.com>
 <alpine.DEB.2.22.394.2411101820430.14721@ubuntu-linux-20-04-desktop>
 <57d407cf-3f3a-43f6-9aa4-05cac5b50c46@suse.com>
 <alpine.DEB.2.22.394.2411111816210.14721@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2411111816210.14721@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2024 03:16, Stefano Stabellini wrote:
> On Mon, 11 Nov 2024, Jan Beulich wrote:
>> On 11.11.2024 03:24, Stefano Stabellini wrote:
>>> On Wed, 6 Nov 2024, Jan Beulich wrote:
>>>> On 06.11.2024 10:04, Federico Serafini wrote:
>>>>> The pseudo keyword fallthrough shall be used to make explicit the
>>>>> fallthrough intention at the end of a case statement (doing this
>>>>> through comments is deprecated).
>>>>>
>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>> ---
>>>>>  xen/arch/x86/x86_emulate/x86_emulate.h | 10 ++++++++++
>>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> When you had asked my privately on Matrix, I specifically said: "Adding
>>>> the pseudo-keyword to x86-emulate.h (not x86_emulate.h) is probably best,
>>>> unless problems with that approach turn up." Even if identical re-
>>>> definitions are deemed fine, I for one consider such bad practice. Yet
>>>> by playing with this file (and outside of any relevant #ifdef) means
>>>> there will be such a re-definition when building Xen itself.
>>>>
>>>> In fact the patch subject should also already clarify that the auxiliary
>>>> definition is only needed for the test and fuzzing harnesses.
>>>
>>> Hi Jan, I don't understand this comment.
>>>
>>> You say "playing with this file (and outside of any relevant #ifdef)"
>>> but actually the changes are within the #ifndef
>>> __X86_EMULATE_H__/#endif. What do you mean?
>>
>> "relevant" was specifically to exclude the guard #ifdef. And the remark
>> was to avoid the #define to merely be moved into or framed by an
>> "#ifndef __XEN__".
>>
>>> You say "Adding the pseudo-keyword to x86-emulate.h (not x86_emulate.h)
>>> is probably best". I am not very familiar with x86-isms but the only
>>> x86-emulate.h I can find is ./tools/tests/x86_emulator/x86-emulate.h
>>> which is not a header that would help define anything for the Xen build?
>>
>> But that's the whole point: We _have_ "fallthrough" as a pseudo-keyword
>> already for the Xen build. For it to be usable in the emulator files, it
>> particularly needs to be made available for the test and fuzzing
>> harnesses. And that without interfering with what the Xen build has.
>> Hence why it wants to go into precisely that file, where all other build
>> compatibility definitions also live.
> 
> OK. So if I get this right, we need the below instead of patch #1 in
> this series?

Yes, just with the addition not at the bottom of the file, but where the
other compatibility definitions are. Also (nit) perhaps "statement block",
matching terminology in xen/compiler.h.

Jan

> --- a/tools/tests/x86_emulator/x86-emulate.h
> +++ b/tools/tests/x86_emulator/x86-emulate.h
> @@ -233,4 +233,14 @@ void emul_test_put_fpu(
>      enum x86_emulate_fpu_type backout,
>      const struct x86_emul_fpu_aux *aux);
>  
> +/*
> + * Pseudo keyword 'fallthrough' to make explicit the fallthrough intention at
> + * the end of a case statement.
> + */
> +#if (!defined(__clang__) && (__GNUC__ >= 7))
> +# define fallthrough        __attribute__((__fallthrough__))
> +#else
> +# define fallthrough        do {} while (0)  /* fallthrough */
> +#endif
> +
>  #endif /* X86_EMULATE_H */


