Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953E6277172
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 14:48:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLQf4-0001yc-66; Thu, 24 Sep 2020 12:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOGg=DB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLQf3-0001yX-92
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 12:47:45 +0000
X-Inumbo-ID: d1a37af9-07fa-4e69-b3be-6a59c8d97aa8
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1a37af9-07fa-4e69-b3be-6a59c8d97aa8;
 Thu, 24 Sep 2020 12:47:44 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y2so3724348lfy.10
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 05:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1HNX6ndZlURAiYKK75ufktkcVDVtWlpIXY3fSJaDkV8=;
 b=Nxdsc2Zjdqoe4ZxRdMPlVWI0eYncAnnGM94q916BWHt8YDIWX7uqcdS0hTYyeAXV6+
 t4joPv9ZejtncXovq5DWwRyILPE1dZ+a5Q8BVQMFrBC59WFdNsR+wDFNW8PC2M3eDOTh
 eSLWiU+tJCK5M/CZnGzpz1M+4DyFvxR+eZ1Z6VN+26XrVPzkSGPVuzyLNZA1giXiXRSW
 O8mWzjmXHKqkmoB2LarhQrpgRLFS3cEP7AjYvavLgpmt6t0IH/etvwP1svZSgqU4VUyn
 rxW5+Q3kzN2nEMqrlfJZ8HaTYxnT9oQtB1p9CAa7ko19LFjdxjcubXUOUEf2DBgyqnpf
 sHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1HNX6ndZlURAiYKK75ufktkcVDVtWlpIXY3fSJaDkV8=;
 b=eR+afD2ukIlEY8YpZakNE/tErGmeUe/BrsiZM5HqOEaXM0Vr+lDjd1TYUqZG0gxuTN
 yOt3ViaB4UwS1VPGZ8C78V1P69qU/ZQr+droIY4Z/urIUtK+wA9TgpTlEa4Fit7YcF9Z
 PDWVPqmd0DR1QqPX9w4EzpiaHK+P/mzTSK5yHFJNJKVCEma6jqYBoUR87UQL7i09rlzf
 qOqfG7nVtw/xVCnIZkHru3jr+D0zSjeNoimsmewPG+1O+MkOwoKcKx4R5e3LuVMIfJzk
 5FRwk2x5dsIN/H94s1ISR0bDZ/F4wlfWMIGh67XI9lwV6MY5RuYt5JDCzEPSA4tc1wHE
 SHVA==
X-Gm-Message-State: AOAM532qHLZcdct1KGV4HlIiBtmZkpgkuV5iLTpdk1zDq4YUKOgovyV9
 ZbY/yEWbmGQh6i/lIp6etYA=
X-Google-Smtp-Source: ABdhPJwE2M8NLhW7y+3+ulMGU+Pffau54dOP7ntw+RcTNkUAuBPPsabDECF4Gr7pykNvv4ayEinxBg==
X-Received: by 2002:a05:6512:3e8:: with SMTP id
 n8mr248733lfq.492.1600951663167; 
 Thu, 24 Sep 2020 05:47:43 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m4sm1571101ljb.58.2020.09.24.05.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 05:47:42 -0700 (PDT)
Subject: Re: [PATCH V1 07/16] xen/dm: Make x86's DM feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-8-git-send-email-olekstysh@gmail.com>
 <70919183-5215-2efb-d399-2b2d5dd8b5ed@suse.com>
 <bab6a331-359c-51d1-3f82-7ef6a28e9d00@gmail.com>
 <8b1f3c77-682c-a0d4-0c71-2b82a416cc9a@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <afce0678-4005-0b11-87c1-39e73e0dc02f@gmail.com>
Date: Thu, 24 Sep 2020 15:47:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8b1f3c77-682c-a0d4-0c71-2b82a416cc9a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 24.09.20 14:03, Jan Beulich wrote:

Hi Jan

> On 22.09.2020 18:46, Oleksandr wrote:
>> On 14.09.20 18:56, Jan Beulich wrote:
>> Hi Jan
>>
>>> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/include/xen/hypercall.h
>>>> +++ b/xen/include/xen/hypercall.h
>>>> @@ -150,6 +150,18 @@ do_dm_op(
>>>>        unsigned int nr_bufs,
>>>>        XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
>>>>    
>>>> +struct dmop_args {
>>>> +    domid_t domid;
>>>> +    unsigned int nr_bufs;
>>>> +    /* Reserve enough buf elements for all current hypercalls. */
>>>> +    struct xen_dm_op_buf buf[2];
>>>> +};
>>>> +
>>>> +int arch_dm_op(struct xen_dm_op *op,
>>>> +               struct domain *d,
>>>> +               const struct dmop_args *op_args,
>>>> +               bool *const_op);
>>>> +
>>>>    #ifdef CONFIG_HYPFS
>>>>    extern long
>>>>    do_hypfs_op(
>>> There are exactly two CUs which need to see these two declarations.
>>> Personally I think they should go into a new header, or at least
>>> into one that half-way fits (from the pov of its other contents)
>>> and doesn't get included by half the code base. But maybe it's
>>> just me ...
>> I am afraid, I didn't get why this header is not suitable for keeping
>> this stuff...
> While I have no major objection against exposing arch_dm_op() to more
> than just the relevant CUs, I don't think I'd like to see struct
> dmop_args becoming visible to "everyone", and in particular changes
> to it causing a re-build of (almost) everything.

Thank you for clarification, I got your point

-- 
Regards,

Oleksandr Tyshchenko


