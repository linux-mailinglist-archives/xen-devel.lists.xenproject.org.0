Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C5E8C4CAB
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:13:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721151.1124304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mLJ-0001oC-2x; Tue, 14 May 2024 07:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721151.1124304; Tue, 14 May 2024 07:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mLJ-0001lW-0E; Tue, 14 May 2024 07:12:57 +0000
Received: by outflank-mailman (input) for mailman id 721151;
 Tue, 14 May 2024 07:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6mLH-0001lQ-J5
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:12:55 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6209a143-11c1-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 09:12:54 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59a609dd3fso893067266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:12:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17727sm682928166b.208.2024.05.14.00.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 00:12:53 -0700 (PDT)
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
X-Inumbo-ID: 6209a143-11c1-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715670774; x=1716275574; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t0iOPTvXAtHc4JjAuNcXyELg+l99+IOlHziW8W1joNA=;
        b=RUnhd9CsHfKn2K0aqe+H85GB8kOM/S6ArU2loJujspB6WAqP7p4Y/rFYqWZLMPRgRV
         RishIXuuNMJNAsX1KhAqOGz9NkMqff6urt858dY+FX1tBEte3q978Zjl7O0oWjwle+vk
         TrTXXPT/tXN6hjRAt0DSs6thooq7+fS6e3mwV2UmtS0fb26dgGc19sPjKZZDSFjAPOts
         1M8IHIA0h/Fy2YzDlM1KB+VzhDEOEonFdumYpOrjktucfdct9PKm3ibLYx6xPPJaXOBt
         vOs2Xpqo/t2vCffU98bA8yfKGR+5yMVRI/XHQ0PbJxgVztEZhB/JrdDWQaCruMiG1uR6
         qHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715670774; x=1716275574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0iOPTvXAtHc4JjAuNcXyELg+l99+IOlHziW8W1joNA=;
        b=fsgJt8wb0WcCut0FOmsorpUAAQlhBPigCffRI10a0M+d7tEcq7F35nnsq22nitMkyV
         jEoQHbxumQAhPBz/pvKXOZGvogeWC+nmLGUlvLM9z+X8BVTXlYLZy83utlzP4MXu3jY4
         dR+84m3LZ8qa8r/ZBP6sHai0/7STVf0NHVosBl0ZlRFxv5BvsL8tbOljLZ6joDxiLwJP
         S6WOo+iLusGi61y+EMv2oECDKtuAmKgA1yihZwYxBU29Hvnsn5BkencFqeQiVT650s5+
         alXD7jbO/7fX6mR7Js6XZwmMUu+oz+Z8VSp7vDYsC2fetZzMP/RUxsN3bzjOQunOa08B
         IHMw==
X-Gm-Message-State: AOJu0YzZDR5KY1Q0Jd1gfS0kUtR1yjpUzeUEuGLqjQwa/PxaovfsaKnh
	xfN4D9yAd1yqyqdwb+iQUo4oImj3b3h7BMF1u3s5sGw9B3gClwx3roTslQqIfw==
X-Google-Smtp-Source: AGHT+IHHRQunVeudEypV59NPLMxwwJLUN/GSMWqxEeDbGmkKsU0kAUNYtZP86lHwUHPtmGnqZrv1kw==
X-Received: by 2002:a17:906:7f83:b0:a5a:8673:cccd with SMTP id a640c23a62f3a-a5a8673ce69mr80131366b.30.1715670773851;
        Tue, 14 May 2024 00:12:53 -0700 (PDT)
Message-ID: <2520da93-8b84-4a09-b944-fa065db03c18@suse.com>
Date: Tue, 14 May 2024 09:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Referencing domain struct from interrupt handler
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com>
 <b965ee57-c6fc-459f-a5fd-fae47dc6ea9d@suse.com>
 <CAHUa44FsFi0F4tz3jN+d3WkR4dTPJ1HdUru+ME1YQyzMSbMG7Q@mail.gmail.com>
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
In-Reply-To: <CAHUa44FsFi0F4tz3jN+d3WkR4dTPJ1HdUru+ME1YQyzMSbMG7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.05.2024 09:10, Jens Wiklander wrote:
> On Fri, May 3, 2024 at 12:32 PM Jan Beulich <jbeulich@suse.com> wrote:
>> Furthermore, is it guaranteed that the IRQ handler won't interrupt code
>> fiddling with the domain list? I don't think it is, since
>> domlist_update_lock isn't acquired in an IRQ-safe manner. Looks like
>> you need to defer the operation on the domain until softirq or tasklet
>> context.
> 
> Thanks for the suggestion, I'm testing it as:
> static DECLARE_TASKLET(notif_sri_tasklet, notif_sri_action, NULL);
> 
> static void notif_irq_handler(int irq, void *data)
> {
>     tasklet_schedule(&notif_sri_tasklet);
> }
> 
> Where notif_sri_action() does what notif_irq_handler() did before
> (using rcu_lock_domain_by_id()).
> 
> I have one more question regarding this.
> 
> Even with the RCU lock if I understand it correctly, it's possible for
> domain_kill() to tear down the domain. Or as Julien explained it in
> another thread [3]:
>> CPU0: ffa_get_domain_by_vm_id() (return the domain as it is alive)
>>
>> CPU1: call domain_kill()
>> CPU1: teardown is called, free d->arch.tee (the pointer is not set to NULL)
>>
>> d->arch.tee is now a dangling pointer
>>
>> CPU0: access d->arch.tee
>>
>> This implies you may need to gain a global lock (I don't have a better
>> idea so far) to protect the IRQ handler against domains teardown.
> 
> I'm trying to address that (now in a tasklet) with:
>     /*
>      * domain_kill() calls ffa_domain_teardown() which will free
>      * d->arch.tee, but not set it to NULL. This can happen while holding
>      * the RCU lock.
>      *
>      * domain_lock() will stop rspin_barrier() in domain_kill(), unless
>      * we're already past rspin_barrier(), but then will d->is_dying be
>      * non-zero.
>      */
>     domain_lock(d);
>     if ( !d->is_dying )
>     {
>         struct ffa_ctx *ctx = d->arch.tee;
> 
>         ACCESS_ONCE(ctx->notif.secure_pending) = true;
>     }
>     domain_unlock(d);
> 
> It seems to work, but I'm worried I'm missing something or abusing
> domain_lock().

Well. Yes, this is one way of dealing with the issue. Yet as you suspect it
feels like an abuse of domain_lock(); that function would better be avoided
whenever possible. (It had some very unhelpful uses long ago.)

Another approach would generally be to do respective cleanup not from
underneath domain_kill(), but complete_domain_destroy(). It's not really
clear to me which of the two approaches is better in this case.

Jan

