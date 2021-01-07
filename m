Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589922ED4BC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 17:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62995.111795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxYTc-0003T4-AJ; Thu, 07 Jan 2021 16:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62995.111795; Thu, 07 Jan 2021 16:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxYTc-0003Sh-6v; Thu, 07 Jan 2021 16:49:32 +0000
Received: by outflank-mailman (input) for mailman id 62995;
 Thu, 07 Jan 2021 16:49:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2+O=GK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kxYTa-0003SP-Gd
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 16:49:30 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3412cfd2-2cd8-41ff-bfc1-14602a5e6cd1;
 Thu, 07 Jan 2021 16:49:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x20so16013115lfe.12
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 08:49:29 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id o187sm1253183lfa.39.2021.01.07.08.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 08:49:27 -0800 (PST)
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
X-Inumbo-ID: 3412cfd2-2cd8-41ff-bfc1-14602a5e6cd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jUaEHurBUpmWS/4EI7dApJOftoOZv6hw/GOO13ulac0=;
        b=Gdm1WvtkwnMNNdOwB5+jQEru/3qW8DHDebRg16dXS4cNVfD6ww6roQduBEA613LFle
         g/PWfVP1LJ+Q8JML8v+NZqFdjZZWueJLm7E23Nx8P9dWkrD1VBdFQVKjhvaMb9idfpQY
         2CqFzUBap9m0hIY3e4QDxVoPRaQrSOJ2+wPyl5ak1XgknjwCCnrU+YfFBBobVA/6tSB+
         Of6riwYAybGSGBBcoXUCYA0aUgZU0OHjghvsILbLd6V0EYemJRaEWuW7YWUQGYla79D9
         HGr2DZu6xqyOC+1upBDMIlvtOPAgSKlKs77+rnCzTAF6nc7FJkM1RSCrSSjGN+neM2eF
         XNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jUaEHurBUpmWS/4EI7dApJOftoOZv6hw/GOO13ulac0=;
        b=LyRq/14jd5PkujY3tgTvTGEiCqZg4/EwOXvVLInl19bBJnKlZIbbbs3ty5oXepX3IR
         LOr5C+RWF5Bv6Nw/ELb6Mpq1sWfkez9mSziZ/Sr98iwPlJMyhMjlnhcRnk4YvoIz5ZSX
         fOPorhhBgJXZGgWLmx2VaIb8q9OeawiXlKADzZWgTKaI67dDuVscEfQ2vmMTeLm0kZiu
         9QMVpyAtciNB3ZhdT6ChOOYgk/8dC5cKkPiumYEXQ7cbPXVkk7qvmPwElZlo+b/tojHi
         l9BB9t1VoXsuDA15zTDKkTBftPjY8OeUv+mRYLbfN1tLcSwnXyKrkT0/EmLDBCFmNrZa
         140A==
X-Gm-Message-State: AOAM530QsIKbOHsVgLeqKtPeEAwhdEq9UU7p5jxQlrX1JPx5xchQVRdh
	SHubl0De4QCBVpypDvFqewsVUbrEtzQ=
X-Google-Smtp-Source: ABdhPJwvArCBEMMIaNvcy66JK7byEShYjS2JN3M02vhsgg8ZENrXEp6SUovlUyXld1oGza4aSuxeaw==
X-Received: by 2002:a2e:5cc6:: with SMTP id q189mr4359540ljb.316.1610038167745;
        Thu, 07 Jan 2021 08:49:27 -0800 (PST)
Subject: Re: [PATCH V3 09/23] xen/dm: Make x86's DM feature common
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-10-git-send-email-olekstysh@gmail.com>
 <00c3df9f-760d-bb3d-d1d6-7c7df7f0c17c@suse.com>
 <24191fca-78e7-3e6b-ff02-c06e8ae79f56@gmail.com>
 <7c985117-2bb4-dd5b-53cf-e217e25b2e8e@suse.com>
 <f7d06c56-7f76-9ba7-6797-ebd9cf133479@gmail.com>
 <94c20a50-9363-c8d1-11aa-7a35f97a03a6@gmail.com>
 <318580a5-d02f-9663-cc58-dfad8a4f7836@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7ca63ab6-85c8-2b5a-2be9-dcb4aaed7ac3@gmail.com>
Date: Thu, 7 Jan 2021 18:49:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <318580a5-d02f-9663-cc58-dfad8a4f7836@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.01.21 17:01, Jan Beulich wrote:

Hi Jan, all

> On 07.01.2021 15:38, Oleksandr wrote:
>>>> Well, on v2 you replied you didn't consider the alternative. I would
>>>> have expected that you would at least go through this consideration
>>>> process, and see whether there are better reasons to stick with the
>>>> apparently backwards arrangement than to change to the more
>>>> conventional one. If there are such reasons, I would expect them to
>>>> be called out in reply and perhaps also in the commit message; the
>>>> latter because down the road more people may wonder why the more
>>>> narrow / special set of cases gets handled at a higher layer than
>>>> the wider set of remaining ones, and they would then be able to find
>>>> an explanation without having to resort to searching through list
>>>> archives.
>>> Ah, will investigate. Sorry for not paying enough attention to it.
>>> Yes, IOREQ (I mean "common") ops are 7 out of 18 right now. The
>>> subsequent patch is adding one more DM op - XEN_DMOP_set_irq_level.
>>> There are several PCI related ops which might want to be common in the
>>> future (but I am not sure).
>> I think, I can say that I have considered the alternative (doing it the
>> other way around), of course if I got your suggestion for V2 correctly.
>> Agree, the alternative is more natural, also compat_dm_op() was left in
>> x86 code. For me the downside is in code duplication. With the
>> alternative both arches have to duplicate do_dm_op() and "common" part
>> of dm_op()
>> (only "switch ( op.op )" is unique).
> Yes, this duplication is the main downside.
>
>> Now the question is which approach to take ("current" or "alternative")
>> for me to prepare for V4. Personally, I would be OK with the both (with
>> a little preference for "alternative").
> Same here. I don't think I've seen anyone else voice an opinion.

Well, let's wait a bit for other opinions... @Julien, @Paul what do you 
think on that?


>
>> Also, If we decide to go with the alternative, should the common files
>> still be named dm.*?
> I think this should live in ioreq.c, just like e.g.
> iommu_do_pci_domctl() lives in passthrough/pci.c. This would then
> allow quite a few things to become static in that file, I believe.

I got it. It seems yes, at least the following could became static:

ioreq_server_create
ioreq_server_get_info
ioreq_server_map_io_range
ioreq_server_unmap_io_range
ioreq_server_set_state
ioreq_server_destroy


-- 
Regards,

Oleksandr Tyshchenko


