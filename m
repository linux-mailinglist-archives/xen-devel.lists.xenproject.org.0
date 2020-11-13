Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 982732B19A7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 12:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26361.54670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWxg-0006hT-KO; Fri, 13 Nov 2020 11:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26361.54670; Fri, 13 Nov 2020 11:09:48 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdWxg-0006h8-Gf; Fri, 13 Nov 2020 11:09:48 +0000
Received: by outflank-mailman (input) for mailman id 26361;
 Fri, 13 Nov 2020 11:09:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kdWxe-0006h2-O2
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:09:46 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 265e078a-e2fa-4753-94fd-5998865f8557;
 Fri, 13 Nov 2020 11:09:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w142so13203886lff.8
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 03:09:45 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t24sm1598227ljd.7.2020.11.13.03.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 03:09:43 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kdWxe-0006h2-O2
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 11:09:46 +0000
X-Inumbo-ID: 265e078a-e2fa-4753-94fd-5998865f8557
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 265e078a-e2fa-4753-94fd-5998865f8557;
	Fri, 13 Nov 2020 11:09:45 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w142so13203886lff.8
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 03:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Q88r220gbxrNILFjjVyBlTgxhLO0y5o2Y88E4LNhjoM=;
        b=hh/X7UqzxQTDs9whsayhyltb5fyWlRNvrjmyhe3NTggsmuzTyk7eTok6+/oqAKkZ2n
         3BfEcr6g8AiU4MnmHhnnvGYQThxb/4JiuALxh0z9oi0z7QjNsoH7n6q7syLZPLqCUFhi
         isWLfaHsD3njD369N7tA42jBaV4+G/mLyVCHhQ+0MlJCtm19ONoV7D+LlItPoZoJl680
         USnM9Q4FAqFe1KTqewuTb8pPJbjer94xJS0h1uvKMU8zBwmMXC+iu3WiJYxKQTdKE7FR
         MJKOWox8z2nwda6CIQY42qD7mOulUDrG6e0f6Z2R1jMf4JzpiczIJGJuHB7OQtc6tGdZ
         bQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Q88r220gbxrNILFjjVyBlTgxhLO0y5o2Y88E4LNhjoM=;
        b=IFQW/PWqncOvVflwFbYuE4LVJ88mksWZpHZ0CpygTcCr5cqMUeNh72lWfFRon7iydm
         yS86MDaSjF4dVJYeBz0L34zUVr+A5sSVg8lWfin+Bnwk17yJUU/xS6uuF1dkVYwKfLJn
         6Xqy5fCLc7bYYIsTectvA8tfi60tMrI/zRXtgsDvnh9IOznBNQ1uz8Pi/sG3fI79a1n+
         f03Sy/FDHDazrFyKD3Oc3XVLR1DL1Hpw9ru8r1Mic73TD0zTnGZbm8eH4EAeaJxMzaHN
         Owwq0tgKj9tBHe2NkykP/UJfzdWQNruQu++u4C0G279SnGQMOH5CO6iiCKb90/Crgkmv
         6x0w==
X-Gm-Message-State: AOAM532sxY6UGnTCgnc8/Fv7+VbsGTZm1zPCzFIqzZRYkS5c+70Oj6yH
	0zD/1+pJYblk9LOF4B5CytKRJLqGeX/kFA==
X-Google-Smtp-Source: ABdhPJyyj7tzXeixful1sqrrUUUy1UnSg+nApeWuCzO0HNs2B6Xlun0P07BISOmxwqbL8+hbeWvMIA==
X-Received: by 2002:a19:8188:: with SMTP id c130mr679070lfd.184.1605265784197;
        Fri, 13 Nov 2020 03:09:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id t24sm1598227ljd.7.2020.11.13.03.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:09:43 -0800 (PST)
Subject: Re: [PATCH V2 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-2-git-send-email-olekstysh@gmail.com>
 <61ea02e0-bdd4-5a0a-dd6f-b22e806e6d1e@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <cd16e1f2-849d-ec12-3325-382b8f6689ff@gmail.com>
Date: Fri, 13 Nov 2020 13:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61ea02e0-bdd4-5a0a-dd6f-b22e806e6d1e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.11.20 12:58, Jan Beulich wrote:

Hi Jan.

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this
>> patch makes some preparation to x86/hvm/ioreq.c before moving
>> to the common code. This way we will get a verbatim copy for
>> a code movement in subsequent patch (arch/x86/hvm/ioreq.c
>> will be *just* renamed to common/ioreq).
>>
>> This patch does the following:
>> 1. Introduce *inline* arch_hvm_ioreq_init(), arch_hvm_ioreq_destroy(),
>>     arch_hvm_io_completion(), arch_hvm_destroy_ioreq_server() and
>>     hvm_ioreq_server_get_type_addr() to abstract arch specific materials.
>> 2  Make hvm_map_mem_type_to_ioreq_server() *inline*. It is not going
>>     to be called from the common code.
> As already indicated on another sub-thread, I think some of these
> are too large to be inline functions. Additionally, considering
> their single-use purpose, I don't think they should be placed in
> a header consumed by more than the producer and the sole consumer.
ok, the only reason I made these inline was to achieve a moving of the 
whole x86/hvm/ioreq.c to the common code.
I will move some of them back to ioreq.c.


>
>> 3. Make get_ioreq_server() global. It is going to be called from
>>     a few places.
> And with this its name ought to change, to fit the general naming
> model of global functions of this subsystem.
I think, with new requirements (making 
hvm_map_mem_type_to_ioreq_server() common) this helper
doesn't need to be global. I will make it static again.


>
>> 4. Add IOREQ_STATUS_* #define-s and update candidates for moving.
> This, it seems to me, could be a separate patch.

Well, will do.


>
>> @@ -855,7 +841,7 @@ int hvm_destroy_ioreq_server(struct domain *d, ioservid_t id)
>>   
>>       domain_pause(d);
>>   
>> -    p2m_set_ioreq_server(d, 0, s);
>> +    arch_hvm_destroy_ioreq_server(s);
> Iirc there are plans to rename hvm_destroy_ioreq_server() in the
> course of the generalization. If so, this arch hook would imo
> better be named following the new scheme right away.
Could you please clarify, are you speaking about the plans discussed there

"[PATCH V2 12/23] xen/ioreq: Remove "hvm" prefixes from involved 
function names"?

Copy text for the convenience:
AT least some of the functions touched here would be nice to be
moved to a more consistent new naming scheme right away, to
avoid having to touch all the same places again. I guess ioreq
server functions would be nice to all start with ioreq_server_
and ioreq functions to all start with ioreq_. E.g. ioreq_send()
and ioreq_server_select().

or some other plans I am not aware of?


What I really want to avoid with IOREQ enabling work is the round-trips 
related to naming things, this patch series
became quite big (and consumes som time to rebase and test it) and I 
expect it to become bigger.

So the arch_hvm_destroy_ioreq_server() should be 
arch_ioreq_server_destroy()?


>
>> @@ -1215,7 +1153,7 @@ void hvm_destroy_all_ioreq_servers(struct domain *d)
>>       struct hvm_ioreq_server *s;
>>       unsigned int id;
>>   
>> -    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>> +    if ( !arch_hvm_ioreq_destroy(d) )
> There's no ioreq being destroyed here, so I think this wants
> renaming (and again ideally right away following the planned
> new scheme).
Agree that no ioreq being destroyed here. Probably 
ioreq_server_check_for_destroy()?
I couldn't think of a better name.


>
>> +static inline int hvm_map_mem_type_to_ioreq_server(struct domain *d,
>> +                                                   ioservid_t id,
>> +                                                   uint32_t type,
>> +                                                   uint32_t flags)
>> +{
>> +    struct hvm_ioreq_server *s;
>> +    int rc;
>> +
>> +    if ( type != HVMMEM_ioreq_server )
>> +        return -EINVAL;
>> +
>> +    if ( flags & ~XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
>> +        return -EINVAL;
>> +
>> +    spin_lock_recursive(&d->arch.hvm.ioreq_server.lock);
>> +
>> +    s = get_ioreq_server(d, id);
>> +
>> +    rc = -ENOENT;
>> +    if ( !s )
>> +        goto out;
>> +
>> +    rc = -EPERM;
>> +    if ( s->emulator != current->domain )
>> +        goto out;
>> +
>> +    rc = p2m_set_ioreq_server(d, flags, s);
>> +
>> + out:
>> +    spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>> +
>> +    if ( rc == 0 && flags == 0 )
>> +    {
>> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
> I realize I may be asking too much, but would it be possible if,
> while moving code, you made simple and likely uncontroversial
> adjustments like adding const here? (Such adjustments would be
> less desirable to make if they increased the size of the patch,
> e.g. if you were touching only nearby code.)
This function as well as one located below won't be moved to this header
for the next version of patch.

ok, will add const.


>
>> +        if ( read_atomic(&p2m->ioreq.entry_count) )
>> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +static inline int hvm_ioreq_server_get_type_addr(const struct domain *d,
>> +                                                 const ioreq_t *p,
>> +                                                 uint8_t *type,
>> +                                                 uint64_t *addr)
>> +{
>> +    uint32_t cf8 = d->arch.hvm.pci_cf8;
> Similarly, for example, neither this nor ...
>
>> +    if ( p->type != IOREQ_TYPE_COPY && p->type != IOREQ_TYPE_PIO )
>> +        return -EINVAL;
>> +
>> +    if ( p->type == IOREQ_TYPE_PIO &&
>> +         (p->addr & ~3) == 0xcfc &&
>> +         CF8_ENABLED(cf8) )
>> +    {
>> +        uint32_t x86_fam;
> ... this really need to use a fixed width type - unsigned int is
> going to be quite fine. But since you're only moving this code,
> I guess I'm not going to insist.

Will use unsigned int.


>
>> +static inline bool arch_hvm_ioreq_destroy(struct domain *d)
>> +{
>> +    if ( !relocate_portio_handler(d, 0xcf8, 0xcf8, 4) )
>> +        return false;
>> +
>> +    return true;
> Any reason this cannot simply be
>
>      return relocate_portio_handler(d, 0xcf8, 0xcf8, 4);

Yes, good point.


-- 
Regards,

Oleksandr Tyshchenko


