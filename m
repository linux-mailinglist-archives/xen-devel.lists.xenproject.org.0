Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB880A66A5B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 07:25:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918505.1323156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuQNV-00081h-3f; Tue, 18 Mar 2025 06:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918505.1323156; Tue, 18 Mar 2025 06:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuQNV-0007zj-0t; Tue, 18 Mar 2025 06:24:41 +0000
Received: by outflank-mailman (input) for mailman id 918505;
 Tue, 18 Mar 2025 06:24:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuQNT-0007zd-S9
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 06:24:39 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8b373a0-03c1-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 07:24:34 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso21676785e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 23:24:34 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70b:b4be:a081:f026:906f:3550?
 (p200300cab70bb4bea081f026906f3550.dip0.t-ipconnect.de.
 [2003:ca:b70b:b4be:a081:f026:906f:3550])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6e87sm17660134f8f.32.2025.03.17.23.24.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 23:24:33 -0700 (PDT)
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
X-Inumbo-ID: a8b373a0-03c1-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742279074; x=1742883874; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A9mrN/CFcW5yLLJc/Kpoc03mwyx2npQsmOMSuWXzQLo=;
        b=M/koEZeGm6JGgw03B7MHuB+qylkvSFgdULwhGCbPvbVeNpke/341v8ZO2zvAD8ZmDI
         axqAZ0gx1XiMn1Ceb9JxVEZ3CpcKCAqZSCKkIyKdOFdnig3KeilsX5DFw2+QnQW8Insl
         cOpMKgvR1a3LBZvjOZ3kh/whyTh5in6gVoeghxA5TIQU+gmWADfeuRQErHzwmdEeJPNx
         dZMyGPJJSLfybETbj7fHRlhuCAK/BfXDF+Xzb7QF25NwnXvYr5Le8mOSxFEBOQKtEXUG
         StFbr04zj7xCzsx0c1dzcVof1gzCkBNn7jqPGb8JaKMDoFDkT7s5/cvr9e5mEms9H25m
         N2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742279074; x=1742883874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9mrN/CFcW5yLLJc/Kpoc03mwyx2npQsmOMSuWXzQLo=;
        b=NF5tbXA1dpQbnEFRNDS/gN+EUPVV8Z29c2eTKfIdyJQxXeZh80/SHUx00qNm6iRcn6
         u6whGWtr4wKSdQuAL251EsvjRQqXq6OcIosdF5yABiai0l0MTK3HBoUXhPM1zWOMM2rY
         1/oaxItcS4pEHca0USMULKcq+mcDrHuvraoliHjaGzGON3BVV9+O+ZetSeqZgiETt31u
         /oiBhNJxY17eMzOhQz88Ma/Rtu+18uNbPY0vv+Aw3Y147zet9zZHLYJoT9/+umHoEIKF
         G/PazAd8JbyFiuQGgormI5P9w0zVWh7r6EcSlqSCsgj8IKrRIYPL5a6tNkn6FMhBx11n
         Hh6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlEm/2o+42D6QGqryFB5ZuZ+lRozVA7wuiP+zallpJiLt8csZbExcMk+sPC6QWuV+i76slS8lUmpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOZ9tOQN+HKnvBQE7kJ54y4q53ytyWr4TkgWSviPJK37MAPTX1
	SzO+4QepG8PieTb5thpE+ududHZw1Oahfj4N7/TFIPYg0QJt6e2gy658UHPaGA==
X-Gm-Gg: ASbGncuWEMO6+yXmpsFiwJeoyjIWkfsYNaunqmTeV6/jlQuZRtGLrYdRDvmv2izjwlC
	qVklC6DegmgsjulTcNdvAZl3vV14EI5zkVqA2Oww265WfSopr+mWYSdnV2S0XzA1m/n2tv4PuMt
	1rJJoTp5lXVauZKr6uBHhFex+FFHrOqSiURhH2U4GpCVjhOBPbJ8IS0vvolilbJ9vAii2KbNpPz
	zMuFBSiOjjAoqb3Yh8jNZ8J3KP2ZZz/1ufPx+IQBrCa0q6dKJHxfQOSRS/BteMzCRsqRUrVw3ek
	4gUz6wUYySI/ZEzgEP3wBBtEqAqpCTpPh0A//UN4+So+GKXQB/vKFh4Gc0S8ZmqIypxj2L7z6UL
	8jc/zmAGgIY2fizRyeBfw6XLs5fBxgzsiagkpNA1lciZbebluhiRU5cIoTkHNt20qDS3oU9zUY+
	jUQgw=
X-Google-Smtp-Source: AGHT+IE1iyQryDOJuUeR+WwAMqb+rrIf7XnwPb1C5daH3FSCZXoYM8WyiotShzKFT/yrHoU4q7tUJQ==
X-Received: by 2002:a05:600c:3d14:b0:43d:45a:8fca with SMTP id 5b1f17b1804b1-43d3ba3ce0emr8983765e9.30.1742279073737;
        Mon, 17 Mar 2025 23:24:33 -0700 (PDT)
Message-ID: <e4229113-28d3-4949-a618-32bb48e53ff6@suse.com>
Date: Tue, 18 Mar 2025 07:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: S3 regression on AMD in 4.20
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Mykola Kvach <xakep.amatop@gmail.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl> <Z9TBaEeUcVrjaACL@mail-itl>
 <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>
 <Z9hGH0GLq-I1cKzt@macbook.local>
 <8d96f12b-c780-4aea-92a4-5034d1c5c7f6@suse.com>
 <Z9heCs3k1HORqfBY@macbook.local>
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
In-Reply-To: <Z9heCs3k1HORqfBY@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.03.2025 18:38, Roger Pau Monné wrote:
> On Mon, Mar 17, 2025 at 05:11:56PM +0100, Jan Beulich wrote:
>> On 17.03.2025 16:56, Roger Pau Monné wrote:
>>> On Sat, Mar 15, 2025 at 12:02:50AM +0000, Andrew Cooper wrote:
>>>> On 14/03/2025 11:53 pm, Marek Marczykowski-Górecki wrote:
>>>>> On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-Górecki wrote:
>>>>>> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
>>>>>>> On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
>>>>>>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
>>>>>>>>
>>>>>>>> This one has working S3, so add a test for it here.
>>>>>>>>
>>>>>>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>>>>> ---
>>>>>>>> Cc: Jan Beulich <jbeulich@suse.com>
>>>>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>>
>>>>>>>> The suspend test added here currently fails on staging[1], but passes on
>>>>>>>> staging-4.19[2]. So the regression wants fixing before committing this
>>>>>>>> patch.
>>>>>>>>
>>>>>>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
>>>>>>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
>>>>>>> We could commit the patch now without the s3 test.
>>>>>>>
>>>>>>> I don't know what the x86 maintainers think about fixing the suspend
>>>>>>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
>>>>>> I'm on it already, but it's annoying. Lets convert this thread to
>>>>>> discussion about the issue:
>>>>>>
>>>>>> So, I bisected it between staging-4.19 and master. The breakage is
>>>>>> somewhere between (inclusive):
>>>>>> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
>>>>>> and
>>>>>> 47990ecef286 x86/boot: Improve MBI2 structure check
>>>>>>
>>>>>> But, the first one breaks booting on this system and it remains broken
>>>>>> until the second commit (or its parent) - at which point S3 is already
>>>>>> broken. So, there is a range of 71 commits that may be responsible...
>>>>>>
>>>>>> But then, based on a matrix chat and Jan's observation I've tried
>>>>>> reverting f75780d26b2f "xen: move per-cpu area management into common
>>>>>> code" just on top of 47990ecef286, and that fixed suspend.
>>>>>> Applying "xen/percpu: don't initialize percpu on resume" on top of
>>>>>> 47990ecef286 fixes suspend too.
>>>>>> But applying it on top of master
>>>>>> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
>>>>>> but the failure mode is different than without the patch - system resets
>>>>>> on S3 resume, with no crash message on the serial console (even with
>>>>>> sync_console), instead of hanging.
>>>>>> And one more data point: reverting f75780d26b2f on top of master is the
>>>>>> same as applying "xen/percpu: don't initialize percpu on resume" on
>>>>>> master - system reset on S3 resume.
>>>>>> So, it looks like there are more issues...
>>>>> Another bisection round and I have the second culprit:
>>>>>
>>>>>     8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
>>>>>
>>>>> With master+"xen/percpu: don't initialize percpu on resume"+revert of
>>>>> 8e60d47cf011 suspend works again on this AMD system.
>>>>
>>>> That's not surprising in the slightest.
>>>>
>>>> Caching hardware values in Xen isn't safe across S3, which QubesOS has
>>>> found time and time again, and for which we still have outstanding bugs.
>>>>
>>>> S3 turns most of the system off.  RAM gets preserved, but devices and
>>>> plenty of internal registers don't.
>>>
>>> I think I've spotted the issue.  enable_iommu() called on resume
>>> (ab)uses set_msi_affinity() to force an MSI register write, as it's
>>> previous behavior was to unconditionally propagate the values.  With
>>> my change it would no longer perform such writes on resume.
>>>
>>> I think the patch below should help.
>>>
>>> I wonder if we should unconditionally propagate the write from
>>> __setup_msi_irq(), as it's also unlikely to make any difference to
>>> skip that write, and would further keep the previous behavior.
>>
>> That might be better. In fact I wonder whether it wouldn't better be
>> callers of write_msi_msg() to use ...
>>
>>> ---
>>> commit 1d9bfd0d45f6b547b19f0d2f752fc3bd10103971
>>> Author: Roger Pau Monne <roger.pau@citrix.com>
>>> Date:   Mon Mar 17 15:40:11 2025 +0100
>>>
>>>     x86/msi: always propagate MSI writes when not in active system mode
>>>     
>>>     Relax the limitation on MSI register writes, and only apply it when the
>>>     system is in active state.  For example AMD IOMMU drivers rely on using
>>>     set_msi_affinity() to force an MSI register write on resume from
>>>     suspension.
>>>     
>>>     The original patch intention was to reduce the number of MSI register
>>>     writes when the system is in active state.  Leave the other states to
>>>     always perform the writes, as it's safer given the existing code, and it's
>>>     expected to not make a difference performance wise.
>>>     
>>>     Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>     Fixes: ('8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed')
>>>     Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> --- a/xen/arch/x86/msi.c
>>> +++ b/xen/arch/x86/msi.c
>>> @@ -189,6 +189,15 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg,
>>>  {
>>>      entry->msg = *msg;
>>>  
>>> +    if ( unlikely(system_state != SYS_STATE_active) )
>>
>> ... this condition as needed. Conceivably there might be cases where even
>> during resume writes aren't always necessary to propagate to hardware.
> 
> Isn't this going to be quite more cumbersome, and I don't think the
> cases outside of active mode are very interesting or relevant
> performance wise?

Certainly. As to cumbersome - having the conditions at the call sites
would also serve as kind of documentation. That said, this was just a
suggestion; I'm not going to insist. I see from other traffic on this
thread the updated patch is now fully addressing the regression. The
secondary change, if not broken out to a separate patch, would want
mentioning in the description, though (which may have been the plan
anyway).

Jan

> The main purpose of the original change was the reduce the number of
> PCI accesses during 'active' state, as every time an interrupt is
> migrated to a different CPU such a (possibly redundant) PCI config
> write would happen.
> 
> Thanks, Roger.


