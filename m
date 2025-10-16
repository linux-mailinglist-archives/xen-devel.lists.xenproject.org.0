Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE2BE334A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 13:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144513.1477903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Mc6-0002Ac-GP; Thu, 16 Oct 2025 11:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144513.1477903; Thu, 16 Oct 2025 11:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Mc6-00028d-Da; Thu, 16 Oct 2025 11:57:46 +0000
Received: by outflank-mailman (input) for mailman id 1144513;
 Thu, 16 Oct 2025 11:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9Mc4-00028X-QN
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 11:57:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52a4eeb9-aa87-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 13:57:43 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so4676995e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 04:57:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144c900asm22262685e9.16.2025.10.16.04.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 04:57:42 -0700 (PDT)
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
X-Inumbo-ID: 52a4eeb9-aa87-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760615863; x=1761220663; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xfs+dXSZnStKUCqs2PMOqAywh/wEG7zYNoghKzAAufI=;
        b=LKMLfZbu2Cna458WhdxWUjK22Er+04xOyEOAbAviJ4A+ga7WJl51pFJ/HCiNh6MMe7
         DyOA+QH4D7fveko+GOPN60gQgLl+zaYQ5g1DrtN3bffRfqgZO1d0Rfp00rKiFs3oq5Oc
         s332/m4Y5E09iPVSg6SFxB8X+0qFZvXn6poZdkaQ7sBesNHCMl4drLZbFsucuxJ9AgNv
         j07Vj3Af2DehqNDyWU5zjeunEQhHAIrlvIHRIjZ0PDXUuAS2qn9hoQ5sNiguklsusGhk
         odhTHMw/YZZ8RF64byXdASYe6yoedjzx/mq88xHGc0S3wHoWndatSz5z+8APrLjPg6Gp
         brTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760615863; x=1761220663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfs+dXSZnStKUCqs2PMOqAywh/wEG7zYNoghKzAAufI=;
        b=C/8yx6L/n+Z4CQYMdmaLwQEU2R5nFPpjXoqykeWkBC81UQvOUYE/peZq38MBZO67Df
         16ssrDDDHu026rkSBWzsnNn2Xzb5NqylV5VkUscGFH0cqBoeQQx3wQBFa/f7HnGRreKd
         zqLDXBvA5O+HGmH47TRzxs82CIP+fpT01YY5uhIuQS0vB6/63McAx+LOl06LrujtXHmL
         HQz93Hq2UUV/Py2yjpM7Tk312CGglo5RRMhG7tJQIbhveziLU44xgMs+7EFevL6NLGGj
         wqmN++f/K8xTzzpmFqyGxLLvNBAvuaZVbCG2rbATf3SjEUJRVEmXUD5Q27sWFv6+ZoDb
         haTQ==
X-Gm-Message-State: AOJu0YzHMET5kdX4qW5vroYG7AT3lAdRu7/1V6ig8V/Ditnzv2QSGpyq
	8d/bN1BdDjcLVHfrvHRYL1iirkUY1j1vV7TbQ1JHuWLWkHmq0pZm5dgGw/JGtJydEQ==
X-Gm-Gg: ASbGncvSy5Ftpo1UAnSfikZ7cNTiXx3bRf+FTVoGC5rOG/Qxh5AZyqN4hWXccE+CMiE
	AoFVjJa50y+02jYM/tzzldVAXYmVrT8Dtx+xZXkystRUQwXi0ujeBv/c0yT4miqwhVFQQSwhlu9
	00xIRzKlcR5BlRqaGni270fojMyVkc999o7WlKmz0XgcOLSW/hIEID+HGVnAFz7KbIUU9ego1Vf
	j5hMcz2ih2hbJFT7rJYOhvALVPGc43NNsAflCZp+EhJhZ+Cbkow8c0WF5lysbZ5VsvphSpVgJc2
	WEVtpP7fsu9pcgBQ6QEvCs4bmlS7fo8IEh8SrcXLlRs8GgOum4j5safQih5gVGJrFLyzKCYwrMW
	L+qfHk/oKQ5SCS3vveKEOTe4niojtHgZZJGrbCzbNVJxK8ZJstDi6YR535yP3ka8s9ct9Fyg/vT
	/+ZeJuq37tZUV+B/my2zVD0MFlcHe8/Yd/iU7ZV4+JJrtctER+vpQErrLiCF8OhuCiW8BpLy4=
X-Google-Smtp-Source: AGHT+IF2XZc3R8xEaoVVSgFuJfUKCCS6NBQIOnaIC/ncHBX5NEfKS0OERgLwo7YdbPQ7v9QminqtSA==
X-Received: by 2002:a05:600c:a4a:b0:471:672:3486 with SMTP id 5b1f17b1804b1-471067234b4mr42019985e9.15.1760615862827;
        Thu, 16 Oct 2025 04:57:42 -0700 (PDT)
Message-ID: <bc7467ca-ba06-417c-8583-8de3782a1d83@suse.com>
Date: Thu, 16 Oct 2025 13:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 02/10] x86/HPET: disable unused channels
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <8913e64b-d172-43f9-9c4d-447ba4984c9a@suse.com> <aPDaIssJOFh00-W7@Mac.lan>
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
In-Reply-To: <aPDaIssJOFh00-W7@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 13:42, Roger Pau Monné wrote:
> On Thu, Oct 16, 2025 at 09:31:42AM +0200, Jan Beulich wrote:
>> Keeping channels enabled when they're unused is only causing problems:
>> Extra interrupts harm performance, and extra nested interrupts could even
>> have caused worse problems.
>>
>> Note that no explicit "enable" is necessary - that's implicitly done by
>> set_channel_irq_affinity() once the channel goes into use again.
>>
>> Along with disabling the counter, also "clear" the channel's "next event",
>> for it to be properly written by whatever the next user is going to want
>> (possibly avoiding too early an IRQ).
>>
>> Further, along the same lines, don't enable channels early when starting
>> up an IRQ. This similarly should happen no earlier than from
>> set_channel_irq_affinity() (here: once a channel goes into use the very
>> first time). This eliminates a single instance of
>>
>> (XEN) [VT-D]INTR-REMAP: Request device [0000:00:1f.0] fault index 0
>> (XEN) [VT-D]INTR-REMAP: reason 25 - Blocked a compatibility format interrupt request
>>
>> during boot. (Why exactly there's only one instance, when we use multiple
>> counters and hence multiple IRQs, I can't tell. My understanding would be
>> that this was due to __hpet_setup_msi_irq() being called only after
>> request_irq() [and hence the .startup handler], yet that should have
>> affected all channels.)
>>
>> Fixes: 3ba523ff957c ("CPUIDLE: enable MSI capable HPET for timer broadcast")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> A window still remains for IRQs to be caused by stale comparator values:
>> hpet_attach_channel() is called ahead of reprogram_hpet_evt_channel().
>> Should we also write the comparator to "far into the future"?
> 
> It might be helpful to reprogram the comparator as far ahead as
> possible in hpet_attach_channel() ahead of enabling it, or
> alternatively in hpet_detach_channel().

The downside is yet another (slow) MMIO access. Hence why I didn't make
such a change right away. Plus I wasn't quite sure about the locking there:
Imo if we did so, it would be better if the lock wasn't dropped
intermediately.

>> @@ -542,6 +540,8 @@ static void hpet_detach_channel(unsigned
>>          spin_unlock_irq(&ch->lock);
>>      else if ( (next = cpumask_first(ch->cpumask)) >= nr_cpu_ids )
>>      {
>> +        hpet_disable_channel(ch);
>> +        ch->next_event = STIME_MAX;
>>          ch->cpu = -1;
>>          clear_bit(HPET_EVT_USED_BIT, &ch->flags);
>>          spin_unlock_irq(&ch->lock);
> 
> I'm a bit confused with what the HPET code does here (don't know
> enough about it, and there are no comments).  Why is the timer rotated
> to a CPU in ch->cpumask once disabled, instead of just being plain
> disabled?

Because it will still be needed by the other CPUs that the channel is
shared with.

Jan

