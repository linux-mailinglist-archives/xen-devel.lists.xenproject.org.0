Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB8805856
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:16:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648017.1011902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAX9y-000229-A7; Tue, 05 Dec 2023 15:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648017.1011902; Tue, 05 Dec 2023 15:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAX9y-0001zb-7G; Tue, 05 Dec 2023 15:16:30 +0000
Received: by outflank-mailman (input) for mailman id 648017;
 Tue, 05 Dec 2023 15:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAX9x-0001zV-7Z
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:16:29 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4275bfad-9381-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:16:27 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3334254cfa3so1613088f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:16:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q18-20020adf9dd2000000b00333357a77c4sm10463936wre.34.2023.12.05.07.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:16:26 -0800 (PST)
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
X-Inumbo-ID: 4275bfad-9381-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701789386; x=1702394186; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFzvHie7cXy2AJrdY6P3f47Glj8npa0Pjc3ZW7jR3zI=;
        b=Rk6Pr95btde13KvYYpZEbQHvCiY7Vl8YExjWkij1yEABu1Lcuj2KQF3tbc81cLviVl
         0SpJxZOJ/JVM30Cat+ekqdi+aDREIaWOSOUlaopGPQg8uo87hWVLj+JW1kbBkDSrSHt3
         TKXxGI63/2jI42qeR46t2GkPiykOg9G77sZZcQf36ZRsJtZ60pXLkIifrAtcN2KQ7Wf+
         zpaF2m8qUj2FByu13itp0CyQKDXMzWmTgozAJ5W490wHcwyOAis979D9P1q2+wjEKl1p
         Zgdj8F5DaF6EaYcgdpZPlefXBtCenZEUDZyle5tLupfjqja9EL/ThzxajqS6b5z8Mmh1
         fqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701789386; x=1702394186;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFzvHie7cXy2AJrdY6P3f47Glj8npa0Pjc3ZW7jR3zI=;
        b=wHJV4G8/OVyP49rq/cmAfquCYg1iLuiaur2nbPyLbRzTOyEtukxu3SxHAeRqVtm5vH
         09JlvITi+SwfwEZUiZ7cSY128mIfHiK/oMqPZ2wOWRDkuLWL4Qr9GjBhK5iJRS6kgTrV
         AouKqmLA51JVn1cUegXwjB9f7gS3c5+PoUeRdgdBBqos2c/2neJ2iuV4aIuHlCbZmsTm
         U+8IWeC4pea4nqWwqC9i8e1PxRbQKx988322z+Ggwd/UxbrJXCpUI6QKpmbIDt4C7P8n
         kHABA0Bc24rx/MdW+tqYJWj9V7ASIZ4W9Nh4+B/CF6blz+rlsNApnzCDf6sUG3yFaUf5
         C0IQ==
X-Gm-Message-State: AOJu0YwX1lUaaJb9/gWx3X/5oAtaDQnHz9FSCY3o31eH1RhsXdPD3IJw
	r7EYNVSncZn2s/CQq9RnwemA
X-Google-Smtp-Source: AGHT+IFOwRTlhwXCB52z8duWIliO3O21d1s3h5jlYbGxcxBHhRAmtSX36JCLWnW/7yNdXXL2cdpJuw==
X-Received: by 2002:a5d:4092:0:b0:332:e3ad:4273 with SMTP id o18-20020a5d4092000000b00332e3ad4273mr807898wrp.2.1701789386630;
        Tue, 05 Dec 2023 07:16:26 -0800 (PST)
Message-ID: <b7dc9886-fb3f-4d69-83a8-52f77249ee80@suse.com>
Date: Tue, 5 Dec 2023 16:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] xen/livepatch: register livepatch regions when loaded
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231130142944.46322-1-roger.pau@citrix.com>
 <20231130142944.46322-2-roger.pau@citrix.com>
 <4bfb71ef-0443-40dd-a854-349db42a7a30@suse.com> <ZW87_kZhE3UJC3UZ@macbook>
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
In-Reply-To: <ZW87_kZhE3UJC3UZ@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.12.2023 16:04, Roger Pau Monné wrote:
> On Tue, Dec 05, 2023 at 02:47:56PM +0100, Jan Beulich wrote:
>> On 30.11.2023 15:29, Roger Pau Monne wrote:
>>> diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
>>> index 5f89703f513b..b444253848cf 100644
>>> --- a/xen/common/virtual_region.c
>>> +++ b/xen/common/virtual_region.c
>>> @@ -23,14 +23,8 @@ static struct virtual_region core_init __initdata = {
>>>  };
>>>  
>>>  /*
>>> - * RCU locking. Additions are done either at startup (when there is only
>>> - * one CPU) or when all CPUs are running without IRQs.
>>> - *
>>> - * Deletions are bit tricky. We do it when Live Patch (all CPUs running
>>> - * without IRQs) or during bootup (when clearing the init).
>>> - *
>>> - * Hence we use list_del_rcu (which sports an memory fence) and a spinlock
>>> - * on deletion.
>>> + * RCU locking. Modifications to the list must be done in exclusive mode, and
>>> + * hence need to hold the spinlock.
>>>   *
>>>   * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
>>>   */
>>> @@ -58,38 +52,28 @@ const struct virtual_region *find_text_region(unsigned long addr)
>>>  
>>>  void register_virtual_region(struct virtual_region *r)
>>>  {
>>> -    ASSERT(!local_irq_is_enabled());
>>> +    unsigned long flags;
>>>  
>>> +    spin_lock_irqsave(&virtual_region_lock, flags);
>>>      list_add_tail_rcu(&r->list, &virtual_region_list);
>>> +    spin_unlock_irqrestore(&virtual_region_lock, flags);
>>>  }
>>>  
>>>  static void remove_virtual_region(struct virtual_region *r)
>>>  {
>>> -    unsigned long flags;
>>> +     unsigned long flags;
>>
>> Nit: Stray blank added?
> 
> Oh, my bad.
> 
>>> -    spin_lock_irqsave(&virtual_region_lock, flags);
>>> -    list_del_rcu(&r->list);
>>> -    spin_unlock_irqrestore(&virtual_region_lock, flags);
>>> -    /*
>>> -     * We do not need to invoke call_rcu.
>>> -     *
>>> -     * This is due to the fact that on the deletion we have made sure
>>> -     * to use spinlocks (to guard against somebody else calling
>>> -     * unregister_virtual_region) and list_deletion spiced with
>>> -     * memory barrier.
>>> -     *
>>> -     * That protects us from corrupting the list as the readers all
>>> -     * use list_for_each_entry_rcu which is safe against concurrent
>>> -     * deletions.
>>> -     */
>>> +     spin_lock_irqsave(&virtual_region_lock, flags);
>>> +     list_del_rcu(&r->list);
>>> +     spin_unlock_irqrestore(&virtual_region_lock, flags);
>>>  }
>>>  
>>>  void unregister_virtual_region(struct virtual_region *r)
>>>  {
>>> -    /* Expected to be called from Live Patch - which has IRQs disabled. */
>>> -    ASSERT(!local_irq_is_enabled());
>>> -
>>>      remove_virtual_region(r);
>>> +
>>> +    /* Assert that no CPU might be using the removed region. */
>>> +    rcu_barrier();
>>>  }
>>
>> rcu_barrier() is a relatively heavy operation aiui. Seeing ...
>>
>>>  #if defined(CONFIG_LIVEPATCH) && defined(CONFIG_X86)
>>
>> ... this I'd like to ask to consider hiding {,un}register_virtual_region()
>> in "#ifdef CONFIG_LIVEPATCH" as well, to make clear these aren't supposed
>> to be used for other purpose. Would at the same time address two Misra
>> violations, I think (both functions having no callers when !LIVEPATCH).
> 
> That's fine, I can do it this same patch unless you prefer such
> adjustment to be in a separate change.

Since the change itself constitutes at least part of the reason for the
adjustment, this would be fine with me. (A separate change, if preferred
by others, would still be fine, too.)

Jan

