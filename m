Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5A791DBB7
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 11:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751430.1159399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sODdS-0004KA-0J; Mon, 01 Jul 2024 09:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751430.1159399; Mon, 01 Jul 2024 09:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sODdR-0004Hj-TI; Mon, 01 Jul 2024 09:47:45 +0000
Received: by outflank-mailman (input) for mailman id 751430;
 Mon, 01 Jul 2024 09:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sODdQ-0004Hd-Ab
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 09:47:44 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f54a7596-378e-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 11:47:41 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so37047351fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 02:47:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-708044ad3besm6054508b3a.169.2024.07.01.02.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 02:47:40 -0700 (PDT)
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
X-Inumbo-ID: f54a7596-378e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719827261; x=1720432061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xf6NF9iMzfu10kt6HawSJXyeo3TJT7kEaO923RRnFWI=;
        b=CNUox3aTGYsUf5xmDBBZ9Q2k/NgkvrsCZVAYQHW9pmbwgDUjwx3Zj8LiafcWTnoM7h
         P+FXgnoJPDJYHa25A+/A8fofaNwOHqlo4RBl4Kw/QtJPW7fVBJZF+o1UUnstrgWxdZR9
         QuHHeWcjSHVt9QuX4GVn3jntWutHzRtUbXEaIKuKJVyUdGzw0X9NNvbtRIfBx0WoZ/Vd
         pOGsq5EFrXlcaB3BhwGb8dyM0UZwU/NMEIUb5We3dUee7LeaNC2dYD4urQJvH7ZIJhhL
         gFWeMfjE/JrH8Urv4/9UbKnh+vllFcgWqJnfxmuykF1yWjJopqvplmdIpjchGM77EV96
         +jgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719827261; x=1720432061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xf6NF9iMzfu10kt6HawSJXyeo3TJT7kEaO923RRnFWI=;
        b=qiBf1MP8GMflfFW0n3O85PQaFBFFaxF+AmvIi5LifR8vKf2Nzutdm5JIeN7ynr59Fz
         qqxnoIbkrZLlLEzrCprl+Wh2E64Pgd6r+ERIjDukp4nXnzuAAmY5wztVjuZn6uIdkDPO
         kBmG1t1lPHmv0h5EDHeI89plAWCQSaJA4jbLOPuoLNapJNcr8+wI0q9h77KOUrA+gViB
         qWoVQFna/cQ2Czli8hK+9rVOGx6T+Xz87inwXwC76goygJozarxNIk2AeGV0J2DLrT3c
         zcFgBXAsFhMuFOgACRwJXyQaR68e1TlOWaTKIrRRr7BmchQFF4ZUgDWOW6oUqA15XSA0
         WUwA==
X-Gm-Message-State: AOJu0YxKjt6e+rnBN9I+q5wNaQzeCwwMJloPtiK61G8rYHOKSpp9/36Y
	W3mlhCOzTvrZcWCQdzEQEtKopFICBr/sETvXV8+K/uFVzqGEuDbNvePJx00Xmw==
X-Google-Smtp-Source: AGHT+IFOG9G0ZwaUpVL7OdpUqK0cPuALRkf4PGUH9kGx+8sP1Cw91CzMKO0xhp6v0MWWsLMZ0YzjOg==
X-Received: by 2002:a2e:a7c6:0:b0:2ee:5969:e454 with SMTP id 38308e7fff4ca-2ee5e33a48bmr41713651fa.1.1719827260659;
        Mon, 01 Jul 2024 02:47:40 -0700 (PDT)
Message-ID: <7d51b6b7-affb-46fd-98dc-b54d3842f6c2@suse.com>
Date: Mon, 1 Jul 2024 11:47:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pirq_cleanup_check() leaks
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
 <5641f8eb-5736-8ccc-122b-b3b47c1bac28@suse.com> <ZoJu3jcsiCWwOhBl@macbook>
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
In-Reply-To: <ZoJu3jcsiCWwOhBl@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2024 10:55, Roger Pau Monné wrote:
> On Thu, Jul 27, 2023 at 09:38:29AM +0200, Jan Beulich wrote:
>> Its original introduction had two issues: For one the "common" part of
>> the checks (carried out in the macro) was inverted.
> 
> Is the current logic in evtchn_close() really malfunctioning?

First: I'm getting the impression that this entire comment doesn't relate
to the part of the description above, but to the 2nd paragraph further
down. Otherwise I'm afraid I may not properly understand your question,
and hence my response below may not make any sense at all.

> pirq->evtchn = 0;
> pirq_cleanup_check(pirq, d1); <- cleanup for PV domains
> if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
>     unmap_domain_pirq_emuirq(d1, pirq->pirq); <- cleanup for HVM domains
> 
> It would seem to me the pirq_cleanup_check() call just after setting
> evtchn = 0 was done to account for PV domains, while the second
> (hidden) pirq_cleanup_check() call in unmap_domain_pirq_emuirq() would
> do the cleanup for HVM domains.
> 
> Maybe there's something that I'm missing, I have to admit the PIRQ
> logic is awfully complicated, even more when we mix the HVM PIRQ
> stuff.

If you look at pirq_cleanup_check() you'll notice that it takes care
of one HVM case as well (the not emuirq one, i.e. particularly PVH,
but note also how physdev_hvm_map_pirq() calls map_domain_emuirq_pirq()
only conditionally). Plus the crucial aspect of the 2nd paragraph of
the description is that past calling pirq_cleanup_check() it is not
really valid anymore to (blindly) de-reference the struct pirq pointer
we hold in hands. The is_hvm_domain() qualification wasn't enough,
since - as said - it's only one of the possibilities that would allow
the pirq to remain legal to use past the call, when having taken the
function's

        if ( pirq->arch.hvm.emuirq != IRQ_UNBOUND )
            return;

path. A 2nd would be taking the

        if ( !pt_pirq_cleanup_check(&pirq->arch.hvm.dpci) )
            return;

path (i.e. a still in use pass-through IRQ), but the 3rd would still
end in the struct pirq being purged even for HVM.

>> And then after
>> removal from the radix tree the structure wasn't scheduled for freeing.
>> (All structures still left in the radix tree would be freed upon domain
>> destruction, though.)
> 
> So if my understanding is correct, we didn't have a leak due to the
> missing free_pirq_struct() because the inverted check in
> pirq_cleanup_check() macro prevented the removal from the radix tree,
> and so stale entries would be left there and freed at domain
> destruction?

That's the understanding I had come to, yes. What I wasn't entirely
sure about (see the 2nd post-commit-message remark) is why the entry
being left in the radix tree never caused any problems. Presumably
that's a result of pirq_get_info() first checking whether an entry is
already there, allocating a new one only for previously empty slots.

>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -711,9 +711,10 @@ int evtchn_close(struct domain *d1, int
>>              if ( !is_hvm_domain(d1) )
>>                  pirq_guest_unbind(d1, pirq);
>>              pirq->evtchn = 0;
>> -            pirq_cleanup_check(pirq, d1);
>> -            if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) > 0 )
>> -                unmap_domain_pirq_emuirq(d1, pirq->pirq);
>> +            if ( !is_hvm_domain(d1) ||
>> +                 domain_pirq_to_irq(d1, pirq->pirq) <= 0 ||
>> +                 unmap_domain_pirq_emuirq(d1, pirq->pirq) < 0 )
> 
> pirq_cleanup_check() already calls pirq_cleanup_check() itself.  Could
> you please add a comment to note that unmap_domain_pirq_emuirq()
> succeeding implies the call to pirq_cleanup_check() has already been
> done?
> 
> Otherwise the logic here looks unbalanced by skipping the
> pirq_cleanup_check() when unmap_domain_pirq_emuirq() succeeds.

Sure, added:

                /*
                 * The successful path of unmap_domain_pirq_emuirq() will have
                 * called pirq_cleanup_check() already.
                 */

>> --- a/xen/include/xen/irq.h
>> +++ b/xen/include/xen/irq.h
>> @@ -158,7 +158,7 @@ extern struct pirq *pirq_get_info(struct
>>  void pirq_cleanup_check(struct pirq *, struct domain *);
>>  
>>  #define pirq_cleanup_check(pirq, d) \
>> -    ((pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
>> +    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
> 
> Not that you need to fix it here, but why not place this check in
> pirq_cleanup_check() itself?

See the first of the post-commit-message remarks: The goal was to not
require every arch to replicate that check. At the time it wasn't
clear (to me at least) that the entire concept of pIRQ would likely
remain an x86 special thing anyway.

Jan

