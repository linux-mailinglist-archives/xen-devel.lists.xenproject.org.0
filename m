Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44B1A7343C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929419.1332052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txo6O-0004z3-HN; Thu, 27 Mar 2025 14:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929419.1332052; Thu, 27 Mar 2025 14:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txo6O-0004wB-Ek; Thu, 27 Mar 2025 14:21:00 +0000
Received: by outflank-mailman (input) for mailman id 929419;
 Thu, 27 Mar 2025 14:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txo6M-0004kM-Bw
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:20:58 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b30a59bc-0b16-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 15:20:57 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so759886f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 07:20:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ac67970a2sm9836995f8f.16.2025.03.27.07.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 07:20:56 -0700 (PDT)
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
X-Inumbo-ID: b30a59bc-0b16-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743085256; x=1743690056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uqG9ju3hY/T+4CCqMZkWLe2+X+VoXuDMIQAHI/1oG8E=;
        b=VPMXt/13aeO39x/bRBJKvo+GkgCUZaYhW36mVIMO6tY/6LHxIpdWEQlrhKRjE6RvBv
         mnpzA3fpRgUX/Zv/6W4jjTDerxG64B8agiMGrD/igZ0Drt5PhUFmuibmO8Hr1mNftFL3
         ciY2aDH2l/h0FuEBPRS1YojC97v3cOb+soBEqTaH3VEFXP/LGpiQqEj//aAjXeStrZzU
         MVGU3CMa/HOJ9SOEK78RJ7xbqCflFe50RSicK+eN5jFcyHGjU5PFjmQ78SkVF/aj9egg
         TDcmNGOwzZ/voY2+31vzaGvdkG7iKZMcuHAIKbwk9FVCIeQHg69lJLSLQbUzmeETptXE
         nLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085256; x=1743690056;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqG9ju3hY/T+4CCqMZkWLe2+X+VoXuDMIQAHI/1oG8E=;
        b=WAmMvkDWTOMA0udG4yMdbNrCf5Obse+9YZGqXiMtoQnscyyxqrjJCQ0k+xWb+K3NeB
         ajJ+IWarCUr3cw+YV/qfLLyRpNo8Q6Hs9tB3cqpv/1KbOY5XizXp6W/i/Nubh4qq+IcC
         +j9uyhNPA2Ki08xdw49eiu0wvjYrqegtVuj3/gBVXWb6Fc+Pvywz9TCv8dG1JwyOn4pm
         /sB8UqeJPPZz0cKZOTblSaRzqRemoOgfcTtXeVt3VrXZX4S5sEgJ4tijGV0YR/7CJbfT
         /gOGJGMi/CMNzCAV8Bz/UZBBhoSGkbfLkuvnpLm7UvMElEarsJvRQvvG4Nd0XZy5NfXv
         9Lww==
X-Gm-Message-State: AOJu0YwKElMWIXGRvtvFIs0774kPX/auBFwwQAMKoGjBo/whnzf/4EUF
	t6O5sj8tJ4YYGoaTdqN0BEJLnZ63xXxsavm8KpRA++kjcsQWDDTF3PKm22to6egwxMsVt3jM/kc
	=
X-Gm-Gg: ASbGncv2NZnR+I2WyJ2c8v1i7u/87i8h8DdedBIiDTh4++FtQ1BPjQsj/ueD8VCKhHw
	wNDsgmBCs+4Hb7Qg3vBGiaV+nzzEinziA2BOJcPotpEeHw3kDhk4+m68YU3ZDdGozI5qKBDd3r4
	XzIW9b8AuVkmDnRhGSTLm7qFCLAZ+ciwjO9r6QiYXYQoXrNAM+z0Q7ch+xKi/wnWvfXHctoB/pr
	MyZlsbI/1pvwBfwFdq0L2towIUS3aoAFp11X9BN3HBD6U+WgBsdQbBorXuwMSf8OAndNyTuPUwa
	Xcw5iDhvB4nyOSvC9NUWgh1W2DigNw/PFuQu6AuVxulE9DMnj3awaXegLM7luQwZ7d2LHvSXTgy
	ErkFgNRc+RRkCYVseCFYSI5XNRN6kzA==
X-Google-Smtp-Source: AGHT+IGadbY9Ep4T54jZnlR529B/HLBhE2b+KdPwRQVDza4O5DeJJOE4aZMQBiUZ0hV75XIu9yVQrA==
X-Received: by 2002:a5d:588c:0:b0:390:f6aa:4e7c with SMTP id ffacd0b85a97d-39ad1749184mr3606741f8f.28.1743085256531;
        Thu, 27 Mar 2025 07:20:56 -0700 (PDT)
Message-ID: <ca0fb29a-96e8-489e-b109-76a684621d18@suse.com>
Date: Thu, 27 Mar 2025 15:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
 <Z-U4ozL6p-Unh5Y8@macbook.local>
 <fde64904-343b-48c9-b396-961811cc2adb@suse.com>
 <Z-VJBIbQal-jZAGM@macbook.local>
 <f5669417-43f3-4c63-bb7d-a108f13757cb@suse.com>
 <Z-VcXGhlObVZYhoc@macbook.local>
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
In-Reply-To: <Z-VcXGhlObVZYhoc@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2025 15:10, Roger Pau Monné wrote:
> On Thu, Mar 27, 2025 at 02:28:42PM +0100, Jan Beulich wrote:
>> On 27.03.2025 13:48, Roger Pau Monné wrote:
>>> On Thu, Mar 27, 2025 at 01:30:44PM +0100, Jan Beulich wrote:
>>>> On 27.03.2025 12:38, Roger Pau Monné wrote:
>>>>> On Thu, Mar 27, 2025 at 12:20:47PM +0100, Jan Beulich wrote:
>>>>>> Unlike stated in the offending commit's description,
>>>>>> load_system_tables() wasn't the only thing left to retain from the
>>>>>> earlier restore_rest_processor_state().
>>>>>>
>>>>>> While there also do Misra-related tidying for the function itself: The
>>>>>> function being used from assembly only means it doesn't need to have a
>>>>>> declaration, but wants to be asmlinkage.
>>>>>
>>>>> I wonder, maybe the intention was for the MTRR restoring on the BSP to
>>>>> also be done by the mtrr_aps_sync_end() call in enter_state()?
>>>>>
>>>>> AFAICT that will set the MTRRs uniformly on all CPUs, by calling
>>>>> mtrr_set_all() just like mtrr_bp_restore(), but later in the restore
>>>>> process.
>>>>
>>>> Hmm, yes, that's possible. The comment in set_mtrr() is somewhat misleading
>>>> then, though, as for the BP the writing then isn't just "okay" but necessary.
>>>> Question is whether doing this so much later is actually good enough.
>>>
>>> Hm, no idea really.  We do the device restore ahead of the MTRR
>>> restore, so I wonder whether we could have issues by using unexpected
>>> effective cache attributes for device memory accesses as a result of
>>> MTRRs not being initialized?
>>
>> That's just one of the possible problems. The father the MTRRs we run with
>> diverged from what firmware puts in place, the bigger the possible trouble.
>> I think the restoring better is done as being switched to here again. The
>> absence of any discussion of MTRRs in that earlier change leaves me pretty
>> certain that the behavioral change there wasn't intended. Andrew is usually
>> pretty good at spelling out all intended effects.
> 
> No objection, however for the BSP we now end up restoring the MTRRs
> twice, as we will also do it in mtrr_aps_sync_end().
> 
> Might be worth to mention in the commit message that the MTRR state
> was restored in mtrr_aps_sync_end() for the BSP also, but that it
> might be too late.

I've added "Note that MTRR state was still reloaded via mtrr_aps_sync_end(),
but that happens quite a bit later in the resume process."

> Possibly with that somehow noted in the commit message:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks. Any chance of getting another one for the 3rd patch in this (split
up) group? Maybe the duplicate one for the "don't hard-code" one was actually
meant to go there?

Jan

