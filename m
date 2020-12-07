Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C472D1772
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 18:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46860.83027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKDB-0008Fk-8W; Mon, 07 Dec 2020 17:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46860.83027; Mon, 07 Dec 2020 17:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmKDB-0008FL-5K; Mon, 07 Dec 2020 17:22:09 +0000
Received: by outflank-mailman (input) for mailman id 46860;
 Mon, 07 Dec 2020 17:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmKD9-0008FG-HO
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 17:22:07 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efb4e1f3-7f71-4a54-9e36-3d369c7a154b;
 Mon, 07 Dec 2020 17:22:05 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id j10so15809066lja.5
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 09:22:05 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n17sm1838070lfi.255.2020.12.07.09.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 09:22:03 -0800 (PST)
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
X-Inumbo-ID: efb4e1f3-7f71-4a54-9e36-3d369c7a154b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ufMp5KkW3QzSDBR4HYpaQZm7V0OvDFIsmY2WCbO0DsU=;
        b=eP7XBwfnhC2VlRLXYe1Hc9b/JLqq68Y2XK/f7eHZiYu7PvMpRdqtSDC/llzqcJANTK
         MNJX3iUoWRSXmaBgFgfIIaF6QsseU4WX/QLdqeqVNfHlRQqMBz8G/Ho+qHs4ZroL/Qdh
         9nufLdwYtubVB731HS8eBw4rKAsVrwHQVAaBcFepkoT7bweX5EuSuiKTc95KEHRTDEGn
         SwNwmNUvz9nt9C0mAykHKvOdosDn9qywn5mVxHSVL/z0RH7xZwdQkthEGDAuu/kB2Ky2
         zvqV+JDfyKJsN7PMZFnCu9Set/MDTslNllN35Iw6GCrfhd4+a9J5j3uvu4lYuEWEhHrf
         WEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ufMp5KkW3QzSDBR4HYpaQZm7V0OvDFIsmY2WCbO0DsU=;
        b=huR7wcFlXFb/OFcydBf+OjZ71k9r2lb1aI1GMk30usz/eP2H/uSeb43TiNjtkrQOyl
         gK8X+iukDCAE47OMDmsu3w+2xzb+0TjmsChVt8PtmQUBEAYwDQpYLeTXFw78J/28ulTT
         uLGUVtt+7Abt4cg4jWnRtGCzhwnCR0Q4z0Bw6c64Ck5TaWtilVDj9qwLVWZ9aKDjyx/j
         1dgLaEIX/o2Eu91rZBZb7P/yXBQoB+Qb6GVkJ5B2aHqL3413UEcoSFemATfummHP/k1F
         gndgYS0HDIi/f+E9kukY0oTg3cyYp5JgTbM1NUtPjtyTK+AOc6y69g07Vk2tKVyhCLHq
         X7UA==
X-Gm-Message-State: AOAM530PsmXyU0crum1yo8xBGPTRPeKgTSQzl0+9o81HWk+zrUi6vbK6
	E+i5fqOh2KjdNyhw2ObwwCcN8CxQ+V+crQ==
X-Google-Smtp-Source: ABdhPJzm3kjh0urtOkQonub16LKuOQOG1BncRFNURMLBDxQDaRC6xggvxqisAPbLYY1aiTQuFhKMWg==
X-Received: by 2002:a2e:9ac9:: with SMTP id p9mr9339067ljj.393.1607361724321;
        Mon, 07 Dec 2020 09:22:04 -0800 (PST)
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
 <51a5c06f-e6ce-c651-2fd2-352aaa591fb1@suse.com>
 <029c3dcc-fac2-5b65-703e-5d821335f2a0@gmail.com>
 <2d83a093-29d3-5870-0814-229cc7f1c04b@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <631684a0-2579-475e-54b3-50e4522b6788@gmail.com>
Date: Mon, 7 Dec 2020 19:21:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2d83a093-29d3-5870-0814-229cc7f1c04b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hi Jan


>>>> @@ -1080,6 +1105,24 @@ int hvm_unmap_io_range_from_ioreq_server(struct domain *d, ioservid_t id,
>>>>        return rc;
>>>>    }
>>>>    
>>>> +/* Called with ioreq_server lock held */
>>>> +int arch_ioreq_server_map_mem_type(struct domain *d,
>>>> +                                   struct hvm_ioreq_server *s,
>>>> +                                   uint32_t flags)
>>>> +{
>>>> +    int rc = p2m_set_ioreq_server(d, flags, s);
>>>> +
>>>> +    if ( rc == 0 && flags == 0 )
>>>> +    {
>>>> +        const struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> +
>>>> +        if ( read_atomic(&p2m->ioreq.entry_count) )
>>>> +            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>>>> +    }
>>>> +
>>>> +    return rc;
>>>> +}
>>>> +
>>>>    /*
>>>>     * Map or unmap an ioreq server to specific memory type. For now, only
>>>>     * HVMMEM_ioreq_server is supported, and in the future new types can be
>>>> @@ -1112,19 +1155,11 @@ int hvm_map_mem_type_to_ioreq_server(struct domain *d, ioservid_t id,
>>>>        if ( s->emulator != current->domain )
>>>>            goto out;
>>>>    
>>>> -    rc = p2m_set_ioreq_server(d, flags, s);
>>>> +    rc = arch_ioreq_server_map_mem_type(d, s, flags);
>>>>    
>>>>     out:
>>>>        spin_unlock_recursive(&d->arch.hvm.ioreq_server.lock);
>>>>    
>>>> -    if ( rc == 0 && flags == 0 )
>>>> -    {
>>>> -        struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>> -
>>>> -        if ( read_atomic(&p2m->ioreq.entry_count) )
>>>> -            p2m_change_entry_type_global(d, p2m_ioreq_server, p2m_ram_rw);
>>>> -    }
>>>> -
>>>>        return rc;
>>>>    }
>>> While you mention this change in the description, I'm still
>>> missing justification as to why the change is safe to make. I
>>> continue to think p2m_change_entry_type_global() would better
>>> not be called inside the locked region, if at all possible.
>> Well. I am afraid, I don't have a 100% justification why the change is
>> safe to make as well
>> as I don't see an obvious reason why it is not safe to make (at least I
>> didn't find a possible deadlock scenario while investigating the code).
>> I raised a question earlier whether I can fold this check in, which
>> implied calling p2m_change_entry_type_global() with ioreq_server lock held.
> I'm aware of the earlier discussion. But "didn't find" isn't good
> enough in a case like this, and since it's likely hard to indeed
> prove there's no deadlock possible, I think it's best to avoid
> having to provide such a proof by avoiding the nesting.

Agree here.


>
>> If there is a concern with calling this inside the locked region
>> (unfortunately still unclear for me at the moment), I will try to find
>> another way how to split hvm_map_mem_type_to_ioreq_server() without
>> potentially unsafe change here *and* exposing
>> p2m_change_entry_type_global() to the common code. Right now, I don't
>> have any ideas how this could be split other than
>> introducing one more hook here to deal with p2m_change_entry_type_global
>> (probably arch_ioreq_server_map_mem_type_complete?), but I don't expect
>> it to be accepted.
>> I appreciate any ideas on that.
> Is there a reason why the simplest solution (two independent
> arch_*() calls) won't do? If so, what are the constraints?

There is no reason.


> Can the first one e.g. somehow indicate what needs to happen
> after the lock was dropped?

I think, yes.


> But the two calls look independent
> right now, so I don't see any complicating factors.

ok, will go "two independent arch hooks" route then.

Thank you for the idea.


-- 
Regards,

Oleksandr Tyshchenko


