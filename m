Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65408C73E2A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 13:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167141.1493504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3T6-00060j-18; Thu, 20 Nov 2025 12:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167141.1493504; Thu, 20 Nov 2025 12:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM3T5-0005xm-UI; Thu, 20 Nov 2025 12:08:55 +0000
Received: by outflank-mailman (input) for mailman id 1167141;
 Thu, 20 Nov 2025 12:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vM3T4-0005kL-O6
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 12:08:54 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae2f2f13-c609-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 13:08:52 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-64074f01a6eso1332143a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 04:08:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64536460ea9sm2134127a12.35.2025.11.20.04.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Nov 2025 04:08:49 -0800 (PST)
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
X-Inumbo-ID: ae2f2f13-c609-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763640532; x=1764245332; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6HFZ4cWrExzYCC8gjGfgz7UHmSxWpqHByThC9z7gNlA=;
        b=QXRCAsXP8gPM/iXOt+bP0HSi2OJt0k7VUsGexJ+7ZAEyXoWp7ATDAPs+Tqu2Jo/P7a
         Ms5Pr2nySoAy0glcfDyC4hPakreh47KvioOkcdRJNJphMld7PExCWIoDgrjwiT4L2zDO
         s0OuXY+N2XbuCAjGAkgnJMQ+2jeE6kNBf5KrBbYISzbrY8K13Fw5jtTk/c7l9b8SDhOZ
         pA5DYa/zmcRR1QglPH3wtaoA9BaL3VbmFKCdInvEfHcQEJXQtfslEwpgn3arcKKOos6a
         XNkdnN3b/7Wkn/ujbuXXpPoiU0BjKA9kxCkTSIGLFUWkPHXPaku+Z/JhabpqdUUgqYJ1
         v5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763640532; x=1764245332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HFZ4cWrExzYCC8gjGfgz7UHmSxWpqHByThC9z7gNlA=;
        b=VzXlKqtd3t2QwctBjA05ENTW99WBU5weFm3J4vsv5Wh1v9sMEiHnMeAsr9nPvhfhZq
         2BMNS52/LuqGPa2ZGyaG6z62GAaa6z4D5upEpoTqx3ZxEUcD4pDmUNeCmNqqbzdoD7Vf
         iFcIZMrv38qe15YWgek/xoX9WyMML8yY198/5W95L9B7bPc9qu7pQelPHAjwrTt5aaUv
         rWLdB5Lc3s0XHpB2tHFQPIFbrIOIJFepk1ablPFhoTWpzbfNb1vKbAlgpNA6uRzdT2n5
         rnfg6VJ57CUN9RzS2Lh7pBi2QSXfR+68EyKpMqkyD1+LCP8X2PbmpaOtuWySA1XaCGs1
         5LaA==
X-Forwarded-Encrypted: i=1; AJvYcCXjmjmCt/kt1TAjJIHzcGdsPMP4e6RcwC/g4NB+LCjrR3zzA1aCSLm8jDcBALmam8s3Po3ps2lyYNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYULTAEC/a9Ajl64DF2wkSSE8l1N8o+tS6mYSQJCNuVu8CG3kT
	XGAt4Jo2nWFKckNElqGoqvZ2Lhpore4KUmDfq/mnOz5X1Kp2xLirnxWNgtpNuPSGKQ==
X-Gm-Gg: ASbGncufmgRNNiZcwz5Yp7QgupXsI5JPZHfeM5JWYEsuV2fA+Us3iC3IjgmcjAxNjgZ
	/7lcvLpvbMvhF+0EZg7BgXJIwo4V4NajotsuJ24MN01K9FZFZPweTO8LSMIeBmkkllkXr2E8eup
	qzO9n6BnTJB3AVLJNwFc5VLcfJZ6o08EPVfPAR4q4WSRev5tE1tZe0TBvs5CJVDbMaeRWKXlon/
	baZvC3jJMGXq0n16lRc9fKeAYPueqwo1jdl1r0ux/TDH8sBgP85wMG4s3kR74rbvjLHjdqv7kR8
	3CEWBBVS7yDAJ2P0/bbZrwOw6uRgSPDWR4BmjLPmgsj+it0C5H05Lv1xqPt9Z48jx+/yk49/19A
	TAr+IUZFbuUjLEXiZ8xjPg1ZcvWeQ2ipjgu9er9ThrJfg0Avc7bTGbb1zvTZzWDGdhe3sCPEmxq
	RbPQs+nUO581Jj30t1y0Fn29M+RiJJhhTRaKLkzK8n90Go8Z7Mq2k1Z60/5vF+X6lG4WuN4sBYm
	ieFzNbg9OhnDw==
X-Google-Smtp-Source: AGHT+IG5IpfwEJrL/fj6jnrhVfqCF+5PoTm+3QAWTlBDLt99Rkdrk3H5b5+8pHuRh3tYY8Zod/ZzgA==
X-Received: by 2002:a05:6402:1d4c:b0:643:18db:1d82 with SMTP id 4fb4d7f45d1cf-645363e48e5mr2824333a12.11.1763640529791;
        Thu, 20 Nov 2025 04:08:49 -0800 (PST)
Message-ID: <a61f67ce-8568-416b-9e89-aa22d794e886@suse.com>
Date: Thu, 20 Nov 2025 13:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/guest: move allocation of Xen upcall vector to
 init code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
 <5ccf9000-9847-40de-838e-cb181633b098@suse.com>
 <943e462f-d948-4f72-8d4c-626febca5b32@citrix.com>
 <4a266547-b058-49c0-8c45-7a80f8ada3b7@citrix.com>
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
In-Reply-To: <4a266547-b058-49c0-8c45-7a80f8ada3b7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.11.2025 12:07, Andrew Cooper wrote:
> On 20/11/2025 11:01 am, Andrew Cooper wrote:
>> On 19/11/2025 10:50 am, Jan Beulich wrote:
>>> There's no need to do this every time init_evtchn() is called. Just do it
>>> once when setting up CPU0. Drop the assertion as well, as
>>> alloc_hipriority_vector() (called by alloc_direct_apic_vector()) uses more
>>> restrictive BUG_ON() anyway. Then evtchn_upcall_vector can also validly
>>> become ro-after-init, just that it needs to move out of init_evtchn().
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/guest/xen/xen.c
>>> +++ b/xen/arch/x86/guest/xen/xen.c
>>> @@ -233,16 +233,12 @@ static void cf_check xen_evtchn_upcall(v
>>>      ack_APIC_irq();
>>>  }
>>>  
>>> +static uint8_t __ro_after_init evtchn_upcall_vector;
>>> +
>>>  static int init_evtchn(void)
>>>  {
>>> -    static uint8_t evtchn_upcall_vector;
>>>      int rc;
>>>  
>>> -    if ( !evtchn_upcall_vector )
>>> -        alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
>>> -
>>> -    ASSERT(evtchn_upcall_vector);
>>> -
>>>      rc = xen_hypercall_set_evtchn_upcall_vector(this_cpu(vcpu_id),
>>>                                                  evtchn_upcall_vector);
>>>      if ( rc )
>>> @@ -293,6 +289,8 @@ static void __init cf_check setup(void)
>>>                 XEN_LEGACY_MAX_VCPUS);
>>>      }
>>>  
>>> +    alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
>>> +
>>>      BUG_ON(init_evtchn());
>>>  }
>>>  
>>>
>> This patch is fine, but it would be nicer to split init_evtchn() into
>> bsp_init_evtchn() and percpu_init_evtchn().
>>
>> Just out of context in init_evtchn(), there's a check for CPU0 that also
>> ought to move into bsp_init_evtchn() (and therefore into __init), at
>> which point the percpu simplifies to a single hypercall, and we keep
>> subsystem specifics out of setup().
> 
> No, scratch that.  HVM_PARAM_CALLBACK_IRQ is not in the list of HVM
> Params that migration moves on migrate (see write_hvm_params() in
> xg_sr_save_x86_hvm.c).
> 
> Everything is awful.
> 
> Could you include a comment such as /* HVM_PARAM_CALLBACK_IRQ is not
> moved on migrate, so has to be set up again on resume. */ to make it
> clear why that piece of logic needs to stay in a non-init function?

It's pretty much unrelated to the change here, but yes, sure, I can add
such a comment while touching the function.

Jan

