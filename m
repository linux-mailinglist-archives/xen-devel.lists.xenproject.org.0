Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F333063F5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 20:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76349.137727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qMq-0001tk-Oq; Wed, 27 Jan 2021 19:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76349.137727; Wed, 27 Jan 2021 19:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qMq-0001tL-LJ; Wed, 27 Jan 2021 19:20:40 +0000
Received: by outflank-mailman (input) for mailman id 76349;
 Wed, 27 Jan 2021 19:20:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4qMo-0001tG-Lp
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 19:20:38 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c742d4dc-1caf-4cf8-a489-6d2aaec56c4a;
 Wed, 27 Jan 2021 19:20:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id e2so609309lfj.13
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 11:20:37 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v25sm854659lji.85.2021.01.27.11.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 11:20:35 -0800 (PST)
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
X-Inumbo-ID: c742d4dc-1caf-4cf8-a489-6d2aaec56c4a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YG/B4Rvj4zUIVd1Ju7Q8Xa/U5H/Frs2J98Wh4dnPMzE=;
        b=PFmVstzs4DP4S/xkdCT1vKbHbd7nmwiAyffjUp2N7zgmgnq0ExrxUAuId3VRYWQZt7
         lgALESL9rBNadvHOMxasaVAtwd4YND/YXF/Kd/JuVtgKYwlYK80Zn6yToqghX6XTx+Uq
         tj6qUL9U5ENS4hfXkj0OeeLyy9CnBQGahuz6LrtPsfWBcsIRECqMUN8D1AysWRu634z5
         6IZnnrWl0mK4L66dxF/Xy+S5565yz7d227CHAJcGgIkeeKo4Oxa80HgSY5tW6yWi4lwQ
         N1EooyDDrtaKEXLYJ10+gGBa/t1H7qsKem+ct1S/GllEsDSF6GitsHYTT00mIFqrsXHF
         Fucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YG/B4Rvj4zUIVd1Ju7Q8Xa/U5H/Frs2J98Wh4dnPMzE=;
        b=I0rPQefldTBBsVThgPVMU7Cq5MvAbhbWfQuAnY+QRouOAfHtJ1L+nt54bp6gWGy40d
         C2v4wjAB3IVllu/nIOyW/WAHiMn5YfgB6hgkfGOkxdbozzow8e2/T/YMZtr8XrxLUYT6
         Qy9mxEwU5f/jFuu5uBg7IC/bf+GKu9eXTSbVMFzmRbLSvEKIgIx/Wi0fyRXrUAC2aSsr
         KeYzNn4vRHSg4ZviabQAKbmgmgV7akb9YgOR33qW0ynFlm/xyd9i2Edu/xQTFY/fSW/j
         1EUAZFZBb5j5dYrVI4SspSaRaLBSdjXx9N7R3n1+vuBKYeFyfKRq+1k9wZ6aq5EFVva6
         2zWQ==
X-Gm-Message-State: AOAM530OHJKZsPjn0vlWKLOoHCLgPjvIPVF3x+ms4Vw9gApQVUGszssk
	YQ5ItWhS6++FyzdEB0pA2BI=
X-Google-Smtp-Source: ABdhPJzEqsz50zHapmQ1fvCLs9j7myKCiorTAs6xfB9OM5nE9o5fN9Aga2DZNlyu8WTlcw0Iyv24Vg==
X-Received: by 2002:ac2:5b4f:: with SMTP id i15mr5606701lfp.191.1611775236490;
        Wed, 27 Jan 2021 11:20:36 -0800 (PST)
Subject: Re: [PATCH V5 14/22] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-15-git-send-email-olekstysh@gmail.com>
 <67136393-8454-9d28-628a-bfb380fd8fc9@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <aa19b356-aa5b-2427-ab8d-2c1ade84ad1c@gmail.com>
Date: Wed, 27 Jan 2021 21:20:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <67136393-8454-9d28-628a-bfb380fd8fc9@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.21 20:33, Julien Grall wrote:

Hi Julien

> Hi,
>
> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
>> +                             struct vcpu *v, mmio_info_t *info)
>> +{
>> +    struct vcpu_io *vio = &v->io;
>> +    ioreq_t p = {
>> +        .type = IOREQ_TYPE_COPY,
>> +        .addr = info->gpa,
>> +        .size = 1 << info->dabt.size,
>> +        .count = 1,
>> +        .dir = !info->dabt.write,
>> +        /*
>> +         * On x86, df is used by 'rep' instruction to tell the 
>> direction
>> +         * to iterate (forward or backward).
>> +         * On Arm, all the accesses to MMIO region will do a single
>> +         * memory access. So for now, we can safely always set to 0.
>> +         */
>> +        .df = 0,
>> +        .data = get_user_reg(regs, info->dabt.reg),
>> +        .state = STATE_IOREQ_READY,
>> +    };
>> +    struct ioreq_server *s = NULL;
>> +    enum io_state rc;
>> +
>> +    switch ( vio->req.state )
>> +    {
>> +    case STATE_IOREQ_NONE:
>> +        break;
>> +
>> +    default:
>> +        gdprintk(XENLOG_ERR, "wrong state %u\n", vio->req.state);
>> +        return IO_ABORT;
>> +    }
>
> NIT: Given there is only one case, I think this can become a:
>
> if ( vio->req.state != STATE_IOREQ_NONE )
> {
>   gdprintk(...);
>   return IO_ABORT;
> }
>
> It is up to you whether you want to fix it now, later, or never :).

V6 is planned, so will fix)


>
> Aside the discussion about dm.h, the rest of the code looks good to 
> me. It is nice to see the arch part of IOREQ is small :).

I do agree, it is much smaller than it was for RFC series)

Yes, I will add required changes to dm.h in the patch which introduces 
that header, but ...


 >>> So I think we may be able to drop the include from asm/hvm/domain.h 
(this would avoid to include it everywhere...).

I have tried that, but other CUs use definitions from 
public/hvm/dm_op.h, for example:

p2m-pt.c: In function 'p2m_type_to_flags':
p2m-pt.c:87:33: error: 'XEN_DMOP_IOREQ_MEM_ACCESS_WRITE' undeclared 
(first use in this function)
          if ( p2m->ioreq.flags & XEN_DMOP_IOREQ_MEM_ACCESS_WRITE )
                                  ^
So, I would prefer to leave it as is, please let me know if you think 
otherwise.


>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


