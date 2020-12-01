Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF52CAC76
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 20:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42296.76027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkBRm-0000Rl-DB; Tue, 01 Dec 2020 19:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42296.76027; Tue, 01 Dec 2020 19:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkBRm-0000RO-AA; Tue, 01 Dec 2020 19:36:22 +0000
Received: by outflank-mailman (input) for mailman id 42296;
 Tue, 01 Dec 2020 19:36:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=na+5=FF=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1kkBRl-0000RJ-EV
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 19:36:21 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40d032bb-61a2-402d-8504-ad19c3f13e92;
 Tue, 01 Dec 2020 19:36:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o1so4524987wrx.7
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 11:36:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r21sm987137wrc.16.2020.12.01.11.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:36:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DC781FF7E;
 Tue,  1 Dec 2020 19:36:16 +0000 (GMT)
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
X-Inumbo-ID: 40d032bb-61a2-402d-8504-ad19c3f13e92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version:content-transfer-encoding;
        bh=JFQI+aXRmBjkxgRhRTRPjWwAL6b77ZM7cNrym6Grfj4=;
        b=mqI4ra5goyWqZOxhTP5SlobUglWOLYR32l91ywLtqYvUmMnnw0NX1TVYXVFJ3akU3B
         c99hawi8nXJmFAUHLKxwCbP4rZmeg4AuOeSo08gJSAgfOA3TfK9Na291bE7CJ+hjaJao
         9qE99n8Xptj+v0KAbW1DD9pXMt3IFf/oAAeQdWk63KkAxBg/0NUKUInRT/wGbriKMAws
         7hVUIMpQNBOzdfibiBd0zToc0v1t4k/Ytp4CBAvDZlzbzoWw3HeirZrfX6qEKF0ty/bb
         dIC2DK9s2EVvuY7S2sx11g1FmwCysBW0p1O2/oVAEl1fvidUCrOOsA1M9wsOpYm45O0j
         S4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
        bh=JFQI+aXRmBjkxgRhRTRPjWwAL6b77ZM7cNrym6Grfj4=;
        b=jNGvXdU5LzGRs+a7l1F6IF369vpPCOElh/x6CS1AA/OUJbrHCyWcFzfkq3yJUn2e4z
         rlNcYOvrE2VJIjLPRnYu6P5WAy7TgjO7+v5LZsq5vAT9hcjLT/WUGiDTEnSSSq0iDc+Y
         vL7Hj7yqhGZ5/VO1Az4tlQWO9AHa5dPjjEnyYxSThdwo8YH+sAxQiI48moNHGdqGxvoj
         5iVmNvcmYLviSvs8CCB3g/BcISwcKqBq1JR3BcNVOlQwxT22GzQ7ur890Q+qh5PRw5o8
         sbKFBmYTU2vaCOGvAk5NQ47PdUhVgs2iqk6DVe6LB8CZ5E1XwwKVDyBVFgydOc36xru9
         dU3A==
X-Gm-Message-State: AOAM532m4uNqKQcnIWOMeQ/r4HuWG+wC63tj8MabvR3FV3vJqCE2yNMC
	YDF1GMbviVtAdRlxgpKRpUjmxA==
X-Google-Smtp-Source: ABdhPJxHttdiWmMSctixZ6owPkrOplh50n4DTtC0Ba1W5vEDss1FE+BP7GdcjI0EMwRHZSZZMfr0hg==
X-Received: by 2002:a5d:680c:: with SMTP id w12mr6090486wru.161.1606851379184;
        Tue, 01 Dec 2020 11:36:19 -0800 (PST)
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
 <87eek9u6tj.fsf@linaro.org>
 <cd2e064e-896b-3a28-5d37-93ddaba1c13e@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
 <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
In-reply-to: <cd2e064e-896b-3a28-5d37-93ddaba1c13e@gmail.com>
Date: Tue, 01 Dec 2020 19:36:16 +0000
Message-ID: <87360ptj2n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr <olekstysh@gmail.com> writes:

> On 01.12.20 13:03, Alex Benn=C3=A9e wrote:
>
> Hi Alex
>
>> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
>>
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> As a lot of x86 code can be re-used on Arm later on, this
>>> patch makes some preparation to x86/hvm/ioreq.c before moving
>>> to the common code. This way we will get a verbatim copy
>> <snip>
>>> It worth mentioning that a code which checks the return value of
>>> p2m_set_ioreq_server() in hvm_map_mem_type_to_ioreq_server() was
>>> folded into arch_ioreq_server_map_mem_type() for the clear split.
>>> So the p2m_change_entry_type_global() is called with ioreq_server
>>> lock held.
>> <snip>
>>>=20=20=20
>>> +/* Called with ioreq_server lock held */
>>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>>> +                                   struct hvm_ioreq_server *s,
>>> +                                   uint32_t flags)
>>> +{
>>> +    int rc =3D p2m_set_ioreq_server(d, flags, s);
>>> +
>>> +    if ( rc =3D=3D 0 && flags =3D=3D 0 )
>>> +    {
>>> +        const struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
>>> +
>>> +        if ( read_atomic(&p2m->ioreq.entry_count) )
>>> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_=
rw);
>>> +    }
>>> +
>>> +    return rc;
>>> +}
>>> +
>>>   /*
>>>    * Map or unmap an ioreq server to specific memory type. For now, only
>>>    * HVMMEM_ioreq_server is supported, and in the future new types can =
be
>>> @@ -1112,19 +1155,11 @@ int hvm_map_mem_type_to_ioreq_server(struct dom=
ain *d, ioservid_t id,
>>>       if ( s->emulator !=3D current->domain )
>>>           goto out;
>>>=20=20=20
>>> -    rc =3D p2m_set_ioreq_server(d, flags, s;)
>>> +    rc =3D arch_ioreq_server_map_mem_type(d, s, flags);
>>>=20=20=20
>>>    out:
>>>       spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>>=20=20=20
>>> -    if ( rc =3D=3D 0 && flags =3D=3D 0 )
>>> -    {
>>> -        struct p2m_domain *p2m =3D p2m_get_hostp2m(d);
>>> -
>>> -        if ( read_atomic(&p2m->ioreq.entry_count) )
>>> -            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_=
rw);
>>> -    }
>>> -
>> It should be noted that p2m holds it's own lock but I'm unfamiliar with
>> Xen's locking architecture. Is there anything that prevents another vCPU
>> accessing a page that is also being used my ioreq on the first vCPU?
> I am not sure that I would be able to provide reasonable explanations her=
e.
> All what I understand is that p2m_change_entry_type_global() x86=20
> specific (we don't have p2m_ioreq_server concept on Arm) and should=20
> remain as such (not exposed to the common code).
> IIRC, I raised a question during V2 review whether we could have ioreq=20
> server lock around the call to p2m_change_entry_type_global() and didn't=
=20
> get objections. I may mistake, but looks like the lock being used
> in p2m_change_entry_type_global() is yet another lock for protecting=20
> page table operations, so unlikely we could get into the trouble calling=
=20
> this function with the ioreq server lock held.

The p2m lock code looks designed to be recursive so I could only
envision a problem where a page somehow racing to lock under the ioreq
lock which I don't think is possible. However reasoning about locking is
hard if your not familiar - it's one reason we added Promela/Spin [1] model=
s to
QEMU for our various locking regimes.


[1] http://spinroot.com/spin/whatispin.html
[2] https://git.qemu.org/?p=3Dqemu.git;a=3Dtree;f=3Ddocs/spin;h=3Dcc1680251=
31676429a560ca70d7234a56f958092;hb=3DHEAD

>
>
>>
>> Assuming that deadlock isn't a possibility to my relatively untrained
>> eye this looks good to me:
>>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Thank you.


--=20
Alex Benn=C3=A9e

