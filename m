Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DBB2CBB71
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 12:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42638.76727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkQAv-0007Lt-Ly; Wed, 02 Dec 2020 11:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42638.76727; Wed, 02 Dec 2020 11:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkQAv-0007LT-IJ; Wed, 02 Dec 2020 11:19:57 +0000
Received: by outflank-mailman (input) for mailman id 42638;
 Wed, 02 Dec 2020 11:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TBw1=FG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kkQAu-0007LL-JM
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 11:19:56 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d196e1af-7f25-4c74-996f-f9f4d72e348b;
 Wed, 02 Dec 2020 11:19:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so3385262wrb.9
 for <xen-devel@lists.xenproject.org>; Wed, 02 Dec 2020 03:19:55 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 20sm1673260wmk.16.2020.12.02.03.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 03:19:54 -0800 (PST)
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
X-Inumbo-ID: d196e1af-7f25-4c74-996f-f9f4d72e348b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=LFsveCACiVP0miso5kdur+j/TxB89o+KtzxvHkrVjwA=;
        b=LysWxXQsBAy1p0nLgpoK1v3sUqgaE/eIXA7h/4PgAT0M3xs8H0qA3j/g18taWiyNv4
         AaY2zzMfiHWGIkQ3h0AZE6yTanEL2G0wHQY9kXSkyQMFznFILta4Ovveaxr4EkJWc6Vv
         2oMmvYno29dJCNyLEVS/mr4epNPSaOgBQn2RRNp46+Nj/qr3cej5H6QWUgDQtjADwfWC
         xrl3Xf3xMUG7vSjFoXeWD630DF7Hnj5+PUv+iILUE2A3l0d/OEYmnZahIh43BpW5oKYn
         WKJPujGm7nVDHBC/cCZrvHg5uM6ctabQZF/g4CljK3Dn+eCzQqPX6yK8F3MmYJyMx8U1
         /oQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=LFsveCACiVP0miso5kdur+j/TxB89o+KtzxvHkrVjwA=;
        b=rRS4ZeMBknW4Z6Dh5XiFm3fkZ8wSwSK+ELUH0V2mzaw+mj+LxQ6thgHwWjUDhXEWdG
         RfqlJC/CRnvY7Lo4De5iTPmlWGMcDX4HXmUAywri4dQI+AOKMvCbAnut3gJ14BjIW3Im
         WQZ6pIBBgdI+2LkEsffDwfo788ivocg0F3xfQ0X6/L8zqMlEGzxICjDINc3t1WMojO1L
         dfRjQ5PzG2gmmQ0HxxK1GtM/ryfQoMb9DMP+9j+Qn+yS/vuzUSulmn+H4x7iTLvbblEu
         n44U3Tey0WmgJqF6FHPHyndi1YhxwG4S9CSyL0rfCip8IYZBS919RB3UoIGA389ONNXA
         QQww==
X-Gm-Message-State: AOAM531WTSyOpfvf6CMILa0LJYGpM5uYLcfA2UIACP/0+WT9p6hs2e2o
	EfcrhxAqVqMXv+6QVG9p3nnWXRoDTOsg2A==
X-Google-Smtp-Source: ABdhPJxLKIOP8OG9AKKPR5rcUd8O0n7IeppMfMzuI3aO3qANsD6+3WxRdKonHXusJm1PvuSx6NRWoQ==
X-Received: by 2002:adf:f349:: with SMTP id e9mr2884358wrp.110.1606907994666;
        Wed, 02 Dec 2020 03:19:54 -0800 (PST)
Subject: Re: [PATCH V3 01/23] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-2-git-send-email-olekstysh@gmail.com>
 <87eek9u6tj.fsf@linaro.org> <cd2e064e-896b-3a28-5d37-93ddaba1c13e@gmail.com>
 <802c49d5-00bb-9e10-70d7-2629913b08c9@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7906614f-70d4-5c39-2207-95126dea7ffd@gmail.com>
Date: Wed, 2 Dec 2020 13:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <802c49d5-00bb-9e10-70d7-2629913b08c9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 02.12.20 10:00, Jan Beulich wrote:

Hi Jan

> On 01.12.2020 19:53, Oleksandr wrote:
>> On 01.12.20 13:03, Alex Bennée wrote:
>>> Oleksandr Tyshchenko <olekstysh@gmail.com> writes:
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
>>> It should be noted that p2m holds it's own lock but I'm unfamiliar with
>>> Xen's locking architecture. Is there anything that prevents another vCPU
>>> accessing a page that is also being used my ioreq on the first vCPU?
>> I am not sure that I would be able to provide reasonable explanations here.
>> All what I understand is that p2m_change_entry_type_global() x86
>> specific (we don't have p2m_ioreq_server concept on Arm) and should
>> remain as such (not exposed to the common code).
>> IIRC, I raised a question during V2 review whether we could have ioreq
>> server lock around the call to p2m_change_entry_type_global() and didn't
>> get objections.
> Not getting objections doesn't mean much. Personally I don't recall
> such a question, but this doesn't mean much.

Sorry for not being clear here. Discussion happened at [1] when I was 
asked to move hvm_map_mem_type_to_ioreq_server() to the common code.


>   The important thing
> here is that you properly justify this change in the description (I
> didn't look at this version of the patch as a whole yet, so quite
> likely you actually do). This is because you need to guarantee that
> you don't introduce any lock order violations by this.
Yes, almost all changes in this patch are mostly mechanical and leave 
things as they are.
The change with p2m_change_entry_type_global() requires an additional 
attention, so decided to put emphasis on touching that
in the description and add a comment in the code that it is called with 
ioreq_server lock held.


[1] 
https://patchwork.kernel.org/project/xen-devel/patch/1602780274-29141-2-git-send-email-olekstysh@gmail.com/#23734839

-- 
Regards,

Oleksandr Tyshchenko


