Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1AB3F653
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 09:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105727.1456582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLD0-0006j5-08; Tue, 02 Sep 2025 07:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105727.1456582; Tue, 02 Sep 2025 07:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utLCz-0006hd-Rv; Tue, 02 Sep 2025 07:13:37 +0000
Received: by outflank-mailman (input) for mailman id 1105727;
 Tue, 02 Sep 2025 07:13:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utLCy-0006KU-Cv
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 07:13:36 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 568b9299-87cc-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 09:13:34 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61d7b2ec241so2523792a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 00:13:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc5306e6sm8894821a12.47.2025.09.02.00.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 00:13:33 -0700 (PDT)
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
X-Inumbo-ID: 568b9299-87cc-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756797214; x=1757402014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yEuKdVC8jVOAIRi0jKxVRzwiN9984gTQsblzjeJPkQU=;
        b=aHhavqgYhcMv5J8MwH3n98d5+xvh/QeqdLR6KkCyngPOJ/bJ8yjlPa0fogR6KfNjpN
         eKreNXYlDtM/UFnQHJnoOj0JPuPldqeruKayJTJcMcGJeZxZT/qxGfkaFpPImNQriYB8
         Ubv9MFYsuyORyYdW7luqNdwuqgFnMZNeUjZdxNK+cl0yRsrC+bRO6cVhyb8Vi4DgWQ4f
         Zq82WhBaK+KWasPCoa/MhbQ1vGpKcqbXuc+ajhnpiiBRNuN/Z++DJMdSRKFzKJv1gcup
         kZIlAayhDZ9FRnQMRLCveQkECL+uiuabiNxqFxd6aLQcLcxp9IDPyL0KEE7U1XQHrHgN
         XY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797214; x=1757402014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEuKdVC8jVOAIRi0jKxVRzwiN9984gTQsblzjeJPkQU=;
        b=cJj29XzhQdlBVYNVAHkbPRRWmbOq/WXMSK1GCfT3YHnuf+/wtn7i+lDNRJdCY66Vu7
         TZw7XzAtO2qcI3BGCc+liuQ6Hh/EED6+bRyQIIGNbSwlwlmxONAX2WeQgO7mUxPB39H4
         M3b4CSXmoVZELGWfvjpNVODTh/04zNu27M9zlKKfohLZ05kZBK0G6Wiq2xbIdlbvXkBo
         8urX6snwoNk9Jnr8p7mQVxKhsAABHQusDE29cv/gws4gVxwiSZ1yKtAe+AfZGL9Z8Y5Z
         xETCQLN8vWEFol0Zs/gldGHtXQQzfAjyh0jsLrvMJp4mb8J8+vCk5U3sZrJefyAlWXw7
         Qc7A==
X-Forwarded-Encrypted: i=1; AJvYcCXdST2YcWeiHo272Mv8q8jHr97oY3jeFF8/86p3xld9plmsDO0STO3alh5nFZuExy3f3aKpK0IVvaQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxne9uk6tPSIqLyzUoOvbJXrfRbPrcrow5Fpyf88hJ0E7VZV28o
	yomH5O1fIGrF3sVppfVF5SsR3EqAz32Oeyz9ZP9TarcC9tBWl2SbhRRSf9kAnXToLg==
X-Gm-Gg: ASbGnctvulWG38C07s9xmNbpKA+LxKalU3tDOt/WMJnxp1qBKk4a+6mvXTvOr8Cymtx
	gxZWlwUCMRnEocPo2mBOryWuzrkngd6hrsWn6JMobxKZLHH86wDw7Q4giRb/v8Yhyc/SuK69DyC
	zy/lXIvzR34+zf2NDRvea8VKBrRgxhXY/epkojsKChCZ5i2bFAaMoVUh8AxRQJ6DlkZms5s+GJ3
	tFfaezfCYQelogmgeRlW2DRXOeA1JHcG8CUARnpaMmGJJLXmgh/z7v4YOAfcpb6S3t8nzS9LOpy
	KazzcWeJVQkx9XoYp2uiWgP1zV8oFVg62jsttQSLPQKoDUGHBVjlr07OaItavCG7Tz2ziHgZR8E
	aHGCEVTHqEG4JKBlYZfCtfhku/Ox2md/rcNB43iZaAgXhBOmBwU8NfHrWM4Y/neDlCRX2Whngpp
	Y+TcZ0fZVCysAfPjbL+g==
X-Google-Smtp-Source: AGHT+IHBGrUyZF9el+LCNh1T4c5/X5bP60TbK0gGpxs6Toe4Gl1k6NESVRsWMrLnraCvny0au9HEGg==
X-Received: by 2002:a05:6402:40ce:b0:61c:7b6e:b242 with SMTP id 4fb4d7f45d1cf-61d260cc398mr8608628a12.0.1756797214112;
        Tue, 02 Sep 2025 00:13:34 -0700 (PDT)
Message-ID: <b1f195a0-6471-43e1-8973-ceabcb6ce9bf@suse.com>
Date: Tue, 2 Sep 2025 09:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1756586648.git.mykola_kvach@epam.com>
 <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
 <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com>
 <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
 <CAGeoDV_5856nbOA6_H00yxGvBD=+YG3XOAObw6dCMesb00ZiTg@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_5856nbOA6_H00yxGvBD=+YG3XOAObw6dCMesb00ZiTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.09.2025 19:17, Mykola Kvach wrote:
> On Mon, Sep 1, 2025 at 8:02 PM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>> On Mon, Sep 1, 2025 at 5:29 PM Jan Beulich <jbeulich@suse.com> wrote:
>>> On 31.08.2025 00:10, Mykola Kvach wrote:
>>>> --- a/xen/arch/ppc/stubs.c
>>>> +++ b/xen/arch/ppc/stubs.c
>>>> @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain *d)
>>>>      BUG_ON("unimplemented");
>>>>  }
>>>>
>>>> +int arch_domain_resume(struct domain *d)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>>>>  {
>>>>      BUG_ON("unimplemented");
>>>> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
>>>> index 1a8c86cd8d..52532ae14d 100644
>>>> --- a/xen/arch/riscv/stubs.c
>>>> +++ b/xen/arch/riscv/stubs.c
>>>> @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain *d)
>>>>      BUG_ON("unimplemented");
>>>>  }
>>>>
>>>> +int arch_domain_resume(struct domain *d)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>>>>  {
>>>>      BUG_ON("unimplemented");
>>>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>>>> index 19fd86ce88..94a06bc697 100644
>>>> --- a/xen/arch/x86/domain.c
>>>> +++ b/xen/arch/x86/domain.c
>>>> @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct domain *d)
>>>>          hvm_domain_creation_finished(d);
>>>>  }
>>>>
>>>> +int arch_domain_resume(struct domain *d)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  #ifdef CONFIG_COMPAT
>>>>  #define xen_vcpu_guest_context vcpu_guest_context
>>>>  #define fpu_ctxt fpu_ctxt.x
>>>
>>> I definitely don't like this redundancy, and even less so that you introduce out-
>>> of-line calls.
>>
>> Thank you for your feedback.
>> I followed the existing pattern used in other architecture stubs.
> 
> ... while I understand your concern about redundancy and out-of-line
> calls, I would appreciate more specific technical reasoning for why
> this approach is undesirable.

Out of line functions, even if as simple as the example above, have a
code size and performance effect; effectively empty inline functions
can typically be eliminated altogether by the compiler, including the
checking of their "return" values. While the impact may be low, any
such instance can later be used as motivation / justification to
introduce further instances (much like you did in to your earlier
reply, still in context above). And the sum of them then may not be
"low impact" anymore.

Furthermore we're already moving towards wider use of has_include().

> Code review is most effective when it is based on objective criteria
> and project guidelines, rather than personal preferences.

And what did you derive from that my comment was purely based on a
personal preference? Plus even if it were (often I would indicate so),
that's imo still okay, as in many case maintainer preferences also
matter (e.g. if only for a more consistent overall code base).

> This helps contributors understand the rationale and make improvements
> that benefit the whole project.

While content-wise I agree, considering the amount of work I put into
doing reviews, I still view this sort of "education" as pretty close
to an offense. Plus did you consider how well it would scale if in
every review all sorts of extra justification would need giving? I
don't really like to put things this way, but I would really recommend
you first start doing perhaps dozens of reviews a week before judging
on whether any particular review gave you enough background info.

Jan

