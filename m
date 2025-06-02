Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33657ACB6FA
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003592.1383167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM709-0001cx-Dr; Mon, 02 Jun 2025 15:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003592.1383167; Mon, 02 Jun 2025 15:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM709-0001aN-AL; Mon, 02 Jun 2025 15:23:01 +0000
Received: by outflank-mailman (input) for mailman id 1003592;
 Mon, 02 Jun 2025 15:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM707-0001aH-7k
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:22:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 752085cd-3fc5-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 17:22:55 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso45465725e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 08:22:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e29f84csm6318452a91.5.2025.06.02.08.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 08:22:54 -0700 (PDT)
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
X-Inumbo-ID: 752085cd-3fc5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748877775; x=1749482575; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mIWxW7FaHgRT0LbhrqLQkU7C0b4uzof8dnhIxka71wA=;
        b=GPkIUW93wTTEg3eJ14C1t879oryRCj4iCpLFMsrlFKZvAkp6jrLPkoUo7etrXd4Lmb
         X0QIZoklPVQ92rPnzfoJdkUHRf+W06H5ibMSSzKxe5UdwQxHOunZDlmNzMUaSVXBe1z1
         r0a0utSFOi4OoKQu5BwLr+pwc4I6NxYWx+FZJUUBya6d8cDqZJAmbinV3ykOtKrznOoJ
         p/48562mrzPpuSk/lx+Fvqx4zu5GqPUEZZkLhBNBV3w164DVwVZc8ZYCvj05/s89HsOu
         Y6qD4XKxwGeID+EXRPDGOv8Mh+TWdZl/x6cjd3N/irkmjImwlGUDo1bI1sUTckoXBN6c
         IO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877775; x=1749482575;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIWxW7FaHgRT0LbhrqLQkU7C0b4uzof8dnhIxka71wA=;
        b=itaOkZhzfe6v8/PgsxvztkAMS3FXlgqCnASwxzbWaAR3l72Ch8FiojwIToiSarYw8M
         gEFSVZUbFH6lf3O1o2KM8hllNr74Gb0glmRxpcAoTohR2K3ku7BnwUpUSioZEytmOhIq
         gRT+K666FceSLJ0XupWLvFTqnrtO4fQEF6yFz2SwqLHYX4qnvEZApyy/0br8IXlZnDm4
         eUtNIOBU+Zsh/vI/uF5CkzOMKS3AyoOIoP/lo4I51yMVXDTj33CNzoXR3mR+ITdDFDt+
         tQvCfi5S5XDtsR4KWOF1FYpbZIWZiOqVsJ/lMJ2UiLLiaXSbDTd6RIn1Gk5Bo+OIk4Xv
         qs5g==
X-Forwarded-Encrypted: i=1; AJvYcCX+GKb/Wx+HDVqWDrX/Y/Rlze/7UlCqpMhgYbqfzn6YZXP4/zJiMesqD1vVrXuTPh/wOHuzqu5qmv4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+yzX37rcRvKdTl9pJmWRkQtEYQRyvcGGGDNk49Zm844aru6KT
	VhXtR28JKJlSy0e1mggwV0hKT03kOSSqw+v5KyxW2/E7pH++JGx26aY1+7w/HghHsA==
X-Gm-Gg: ASbGncuBZZpYEGGzwZpJTU1eNSsknSsNp8jYyndqu9KQd0GoK/leT3+KajJOIyRS93L
	gsNXQH7xMC6AU2BXUKknzMTDOlUEyWNwyMOMlYCoCRMcJCJu4LVEjv2ns/EamjhmNsxqmaTgBjj
	JtYWwTMSlMM5nOOGoTfMtgEi1PIR+oi+P3iGHfKRfGhCECWvDiFTjII5kV+xZzH9zMoEwjVEw13
	00tg8fyhIyUwusqAqig8iTxvENeFE/c6lzCEjnpZ+O+aM1b5XAHxJrDhehGFFF2MYlnbSfJ31oQ
	yzMqt7nbxQkoHtWSZBydh+Elagb0uqt1mL3I17J6Hwmm0UP4zme8Aiplgz6S6+vRwM10EeoIQBO
	Kli5QHs550bqKAwv6An2UWKPyk3aNbTpvlOS+
X-Google-Smtp-Source: AGHT+IE7IMR7mC43NKOjETRkUGKmmXP2RPSgM816IzEY5wbF8fmd7EzzOTi3A0aavKBYuerge6zZ7g==
X-Received: by 2002:a05:6000:4013:b0:3a4:edf6:566b with SMTP id ffacd0b85a97d-3a4fe160d10mr6287268f8f.6.1748877774921;
        Mon, 02 Jun 2025 08:22:54 -0700 (PDT)
Message-ID: <37819f9d-8438-4d41-8df3-62c25eb2a18e@suse.com>
Date: Mon, 2 Jun 2025 17:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvmloader: don't set xenpci MMIO BAR as UC in MTRR
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Anthoine Bourgeois <anthoine.bourgeois@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250530092314.27306-1-roger.pau@citrix.com>
 <58c0499c-cdde-4cc3-9441-606a0eea4652@suse.com>
 <aD20yhCFYVXvTPZv@macbook.local>
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
In-Reply-To: <aD20yhCFYVXvTPZv@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.06.2025 16:27, Roger Pau Monné wrote:
> On Mon, Jun 02, 2025 at 11:46:52AM +0200, Jan Beulich wrote:
>> On 30.05.2025 11:23, Roger Pau Monne wrote:
>>> The Xen PCI device (vendor ID 0x5853) exposed to x86 HVM guests doesn't
>>> have the functionality of a traditional PCI device.  The exposed MIO BAR is
>>> used by some guests (including Linux) as a safe place to map foreign
>>> memory, including the grant table itself.
>>>
>>> Traditionally BARs from devices have the uncacheable (UC) cache attribute
>>> from the MTRR, to ensure correct functionality of such devices.  hvmloader
>>> mimics this behaviour and sets the MTRR attributes of both the low and high
>>> PCI MMIO windows (where BARs of PCI devices reside) as UC in MTRR.
>>>
>>> This however causes performance issues for the users of the Xen PCI device
>>> BAR, as for the purposes of mapping remote memory there's no need to use
>>> the UC attribute.  On Intel systems this is worked around by using iPAT,
>>> that allows the hypervisor to force the effective cache attribute of a p2m
>>> entry regardless of the guest PAT value.  AMD however doesn't have an
>>> equivalent of iPAT, and guest PAT values are always considered.
>>>
>>> Linux commit:
>>>
>>> 41925b105e34 xen: replace xen_remap() with memremap()
>>>
>>> Attempted to mitigate this by forcing mappings of the grant-table to use
>>> the write-back (WB) cache attribute.  However Linux memremap() takes MTRRs
>>> into account to calculate which PAT type to use, and seeing the MTRR cache
>>> attribute for the region being UC the PAT also ends up as UC, regardless of
>>> the caller having requested WB.
>>>
>>> As a workaround to allow current Linux to map the grant-table as WB using
>>> memremap() special case the Xen PCI device BAR in hvmloader and don't set
>>> its cache attribute as UC.
>>
>> Can we (fully compatibly) make such a change? IOW do we know all possible
>> guests would be at least unaffected (ideally affected positively)? Imo ...
> 
> Is there any other possible usage for the xenpci MMIO BAR?

How do you / we know?

>  My
> understanding is it was introduced for this specific purpose; to
> signal a safe place to map the grant-table or foreign mappings, which
> in both cases want to have an effective WB cache attribute.

It's a hack. It's relatively easy to imagine that someone might have built
a 2nd hack on top of this 1st one.

>>>  Such workaround in hvmloader should also be
>>> paired with a fix for Linux so it attempts to change the MTRR of the Xen
>>> PCI device BAR to WB by itself.
>>>
>>> Overall, the long term solution would be to provide the guest with a safe
>>> range in the guest physical address space where mappings to foreign pages
>>> can be created.
>>
>> ... this is the only viable path.
> 
> I agree, however this will take more time to materialize IMO.  Needs a
> patch to Linux, plus possible backports, and then distros picking the
> updates.
> 
> While I agree this needs fixing in Linux, I don't see any downsides of
> doing the workaround in hvmloader also, as a faster way to get it
> deployed with just a Xen update.

The (maybe merely theoretical) downside is that we may regress something
somewhere. Hence why I think that for starters this new behavior should
be optional, default off. Later, once proven to work in practice for a
fair while, we could then consider changing the default. (Then again I
certainly realize that adding yet another control is quite a bit of extra
effort, too.)

Jan

