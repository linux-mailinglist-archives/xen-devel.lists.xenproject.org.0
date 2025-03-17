Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE63AA6579A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917385.1322319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuD4M-0002Mp-93; Mon, 17 Mar 2025 16:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917385.1322319; Mon, 17 Mar 2025 16:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuD4M-0002LA-6Q; Mon, 17 Mar 2025 16:12:02 +0000
Received: by outflank-mailman (input) for mailman id 917385;
 Mon, 17 Mar 2025 16:12:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuD4K-0002L4-V8
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:12:00 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d939120-034a-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:11:58 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso25187605e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:11:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b2bsm15054097f8f.26.2025.03.17.09.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:11:57 -0700 (PDT)
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
X-Inumbo-ID: 8d939120-034a-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742227918; x=1742832718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4F+LVzacmqpZxShYt9wm1XuMoIepTIMa6D7FRzUdidI=;
        b=BzPV/qLXWWlgVuEnEO3Y3ejnHcmcSdpn+QfWVtcqvQTHVEjn8ANGxg4CNIPREJ9XBU
         BUKX2G/bQX71xTIaYPOVZxZBJcbzX113AsTbSFIde4W2JabLkJcol/UsPP2YKXyw9aMS
         m6XR/irSfYWizqXnavqWs+WRt4oeTJmcTJ64bP/KO2BamPHyGszo1oUMjMJq/Dg9DeLK
         fw5wYjUP7q3eNVAP8nNI0dEPqp1RBPczx8Va+TDQBP4H19ojlhbayp9vhUcgvDEOWU1d
         KGn3Yfwbg05/S2ZaKf4OKRgY1MGYx4Bdmn8g98ydwPayrbs9vjR41e6CCtqjhuzOG50U
         AXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227918; x=1742832718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4F+LVzacmqpZxShYt9wm1XuMoIepTIMa6D7FRzUdidI=;
        b=JJwNq/vO5fnVYueKMJHaAyVRiEt9BcQGrHWuiL553eH5FkPlTaRH1h+ehW4964b7S9
         vbrXsTu3PedBZfDS2THlCqRkMv6Uwg2RSv4brpfgWx9PcxYY4oZpUgQsVNn5cIp/7DsS
         fpD/YIDFELHK+5CNSjNdo1/juY/YAoKDszaYv8O7vq/ZCHCFJuUN8YTzgXJQ+3ni9e0e
         THGO5fcDZlLtZbQwjXj8vRJbHWm3AXQ8WlHKxPF8QYnINaM8a3cgSTnSN0q3RJ0ac6oV
         fLX7drrapcG246Xw0VJXGXHNuiF6lRsz1KbZNwABV5HiqdfJc9jyWBQFbVrc7kHevzfz
         u4jg==
X-Forwarded-Encrypted: i=1; AJvYcCWn533Almdm5rx4cKDj7DABORr+i5r+6ZsCPZQ4MO3o7ar4PH2+4U670Qo+tdaMymQGChsv9xaZEO8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNcxyBiLkp/MnyjE0HhtXHSr8JU5/w4T1PfgWu7JMwGt5icdNq
	vUnwaA6mWoHJv3NcFGaubU6VjA1Z1FjzkVK62doocGZBVz0GypX2XjdJutzklA==
X-Gm-Gg: ASbGncvNo2a+atZRk+3DRHFG8kObrawf8kMlAi2iTwNKd6510TzbV9iH8Dwc4W88meM
	BX/0uWiYgbsS8YXQG0ieNvi4QaeqyH0v9BO4DRiIZAG72Wz86u2Lb2e8lTq+5a/TVo/6fJY3D60
	V5DAmwLDRxxyHy905W6caapo1mC3Ocx+t7+UwDr/boF04nLy3H3tvpIXOmhqE+7o5ji9+eI4sNp
	nYbLaK/2VbyTSiXK9r5eMbI5WZiBMkX1GA+ricZDeG5D7RUmLFaw2KcW3Pf8SlVDEXJ1p54+EQG
	Sm9i4aVMfbeTXH75XNG7YjxPyfzDmQyuVD5s5AuPqLVquvm+lS0mmeb9EemjyhkCKoiANVDpLGM
	ZCkBUmP7Y3JYZh/MsxySVnYiR4jEfTQ==
X-Google-Smtp-Source: AGHT+IEscnWH5lMRDQ+U93VedoGbFGVD8pRyJHeNR8zrIhxx/sO3DVlRjc42XbxA6NJUsQyABbt/KQ==
X-Received: by 2002:a05:6000:156a:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-3971fadd7d5mr14610547f8f.54.1742227918061;
        Mon, 17 Mar 2025 09:11:58 -0700 (PDT)
Message-ID: <8d96f12b-c780-4aea-92a4-5034d1c5c7f6@suse.com>
Date: Mon, 17 Mar 2025 17:11:56 +0100
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
In-Reply-To: <Z9hGH0GLq-I1cKzt@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.03.2025 16:56, Roger Pau Monné wrote:
> On Sat, Mar 15, 2025 at 12:02:50AM +0000, Andrew Cooper wrote:
>> On 14/03/2025 11:53 pm, Marek Marczykowski-Górecki wrote:
>>> On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-Górecki wrote:
>>>> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
>>>>> On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
>>>>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
>>>>>>
>>>>>> This one has working S3, so add a test for it here.
>>>>>>
>>>>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>>> ---
>>>>>> Cc: Jan Beulich <jbeulich@suse.com>
>>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>
>>>>>> The suspend test added here currently fails on staging[1], but passes on
>>>>>> staging-4.19[2]. So the regression wants fixing before committing this
>>>>>> patch.
>>>>>>
>>>>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
>>>>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
>>>>> We could commit the patch now without the s3 test.
>>>>>
>>>>> I don't know what the x86 maintainers think about fixing the suspend
>>>>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
>>>> I'm on it already, but it's annoying. Lets convert this thread to
>>>> discussion about the issue:
>>>>
>>>> So, I bisected it between staging-4.19 and master. The breakage is
>>>> somewhere between (inclusive):
>>>> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
>>>> and
>>>> 47990ecef286 x86/boot: Improve MBI2 structure check
>>>>
>>>> But, the first one breaks booting on this system and it remains broken
>>>> until the second commit (or its parent) - at which point S3 is already
>>>> broken. So, there is a range of 71 commits that may be responsible...
>>>>
>>>> But then, based on a matrix chat and Jan's observation I've tried
>>>> reverting f75780d26b2f "xen: move per-cpu area management into common
>>>> code" just on top of 47990ecef286, and that fixed suspend.
>>>> Applying "xen/percpu: don't initialize percpu on resume" on top of
>>>> 47990ecef286 fixes suspend too.
>>>> But applying it on top of master
>>>> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
>>>> but the failure mode is different than without the patch - system resets
>>>> on S3 resume, with no crash message on the serial console (even with
>>>> sync_console), instead of hanging.
>>>> And one more data point: reverting f75780d26b2f on top of master is the
>>>> same as applying "xen/percpu: don't initialize percpu on resume" on
>>>> master - system reset on S3 resume.
>>>> So, it looks like there are more issues...
>>> Another bisection round and I have the second culprit:
>>>
>>>     8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
>>>
>>> With master+"xen/percpu: don't initialize percpu on resume"+revert of
>>> 8e60d47cf011 suspend works again on this AMD system.
>>
>> That's not surprising in the slightest.
>>
>> Caching hardware values in Xen isn't safe across S3, which QubesOS has
>> found time and time again, and for which we still have outstanding bugs.
>>
>> S3 turns most of the system off.  RAM gets preserved, but devices and
>> plenty of internal registers don't.
> 
> I think I've spotted the issue.  enable_iommu() called on resume
> (ab)uses set_msi_affinity() to force an MSI register write, as it's
> previous behavior was to unconditionally propagate the values.  With
> my change it would no longer perform such writes on resume.
> 
> I think the patch below should help.
> 
> I wonder if we should unconditionally propagate the write from
> __setup_msi_irq(), as it's also unlikely to make any difference to
> skip that write, and would further keep the previous behavior.

That might be better. In fact I wonder whether it wouldn't better be
callers of write_msi_msg() to use ...

> ---
> commit 1d9bfd0d45f6b547b19f0d2f752fc3bd10103971
> Author: Roger Pau Monne <roger.pau@citrix.com>
> Date:   Mon Mar 17 15:40:11 2025 +0100
> 
>     x86/msi: always propagate MSI writes when not in active system mode
>     
>     Relax the limitation on MSI register writes, and only apply it when the
>     system is in active state.  For example AMD IOMMU drivers rely on using
>     set_msi_affinity() to force an MSI register write on resume from
>     suspension.
>     
>     The original patch intention was to reduce the number of MSI register
>     writes when the system is in active state.  Leave the other states to
>     always perform the writes, as it's safer given the existing code, and it's
>     expected to not make a difference performance wise.
>     
>     Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>     Fixes: ('8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed')
>     Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -189,6 +189,15 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg,
>  {
>      entry->msg = *msg;
>  
> +    if ( unlikely(system_state != SYS_STATE_active) )

... this condition as needed. Conceivably there might be cases where even
during resume writes aren't always necessary to propagate to hardware.

Jan

> +        /*
> +         * Always propagate writes when not in the 'active' state.  The
> +         * optimization to avoid the MSI address and data registers write is
> +         * only relevant for runtime state, and drivers on resume (at least)
> +         * rely on set_msi_affinity() to update the hardware state.
> +         */
> +        force = true;
> +
>      if ( iommu_intremap != iommu_intremap_off )
>      {
>          int rc;


