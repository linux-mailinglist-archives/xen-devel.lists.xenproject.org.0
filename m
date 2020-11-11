Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7BB2AEAD8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24334.51514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclC5-0000Zh-OJ; Wed, 11 Nov 2020 08:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24334.51514; Wed, 11 Nov 2020 08:09:29 +0000
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
	id 1kclC5-0000ZL-LG; Wed, 11 Nov 2020 08:09:29 +0000
Received: by outflank-mailman (input) for mailman id 24334;
 Wed, 11 Nov 2020 08:09:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kclC4-0000ZF-T5
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:09:28 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25d1b008-ddb5-4e02-8e40-8e42dc2daef5;
 Wed, 11 Nov 2020 08:09:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h23so1022611ljg.13
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 00:09:27 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 8sm145087lfk.246.2020.11.11.00.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 00:09:26 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=OH4G=ER=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kclC4-0000ZF-T5
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:09:28 +0000
X-Inumbo-ID: 25d1b008-ddb5-4e02-8e40-8e42dc2daef5
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 25d1b008-ddb5-4e02-8e40-8e42dc2daef5;
	Wed, 11 Nov 2020 08:09:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h23so1022611ljg.13
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 00:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Y86yd3DlAxaOfu2nLRPPa9Zkd4hYQHr84dhPBKcH5nM=;
        b=SqodPKMu2+icN1uGiwh/82nc8NErYW61swqce9Tb24u/S3m87QLPQ47F9ArUMmXwfH
         RO1erTklhQaIdw+sXXUvd4dDZY87YUGJzeGtJwxCOJ6+JE/GolF7brGc47XSbokYz5wf
         q11RN2dQ+dh6GJLiFotWiEsnEv55Wc+5iiE5MwuE3enTQYroeGlqGwZSYmOAFRC9r7LN
         dbTsDCjqlFerB4/lQ5v+T8rbhINaAjCTSQUGzNSHJMkxP/93Yf5wfmxIDyPjEOKijRgO
         /zrWF8y4jxWuDRE7+SPPzFwRwEbTYyNBaGsYjk0N/D+CShfzsX+BVwdZOgPMYTbYf+Ky
         WPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Y86yd3DlAxaOfu2nLRPPa9Zkd4hYQHr84dhPBKcH5nM=;
        b=BysGbQPO2O1BTWMGOtmbZBnA5XLjBYrAP7zWQC9XuKOr4T3C24ct+GaCJuCro59tO6
         u7OWW7GiRrkRHKhds+vjrxJJ+/wHDf+ANXiPpMPJCU4QaWeUJZXBQqt6S8rkqB1jyJyt
         XGUcesuKYwVLDdelgOeTijFQilOzgldV5f1iNYfJqeqiawLaQSnNPDUjZpzhyCqLn8P0
         GKTSNVxt8R1BLWRoHpJD0s+YvCZNI/LyAkGpQ8J0OAg0DmEw5KaAe5bu0FTcjqJrk+6d
         h+c3svt32lyHZULum7NV80gBYdzw2YCGhadXL8saA2+CbaIRMv2x8oOVlVq/rTxJ640m
         b2Dg==
X-Gm-Message-State: AOAM530Wrsl/WnJcTRd6grSYOkunbMXFQp3CROeO9wm713rmGDmQCPEp
	Sjdy2ks7U8Zw9UZDHRdZwac=
X-Google-Smtp-Source: ABdhPJwOVO901jbF+6fbxZ66qUCsA7j8iV1RoruRGKhyn/IzYteke5ORW0vyQ8sTlyQfiqjTx5dr0w==
X-Received: by 2002:a2e:6c14:: with SMTP id h20mr3541390ljc.458.1605082166621;
        Wed, 11 Nov 2020 00:09:26 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id 8sm145087lfk.246.2020.11.11.00.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 00:09:26 -0800 (PST)
Subject: Re: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien.grall@arm.com>, paul@xen.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-5-git-send-email-olekstysh@gmail.com>
 <004701d6a6c1$6c09f860$441de920$@xen.org>
 <38ba45dd-f1cd-a289-3ea3-75148782e126@suse.com>
 <004a01d6a6cd$1f4684b0$5dd38e10$@xen.org>
 <fab8e4b0-e3b2-fb74-76d4-42753ac88367@gmail.com>
 <f2d1cbef-09ec-86e4-bfc5-20320f78be6b@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <35d38051-129e-333d-ec94-aa36e68a3814@gmail.com>
Date: Wed, 11 Nov 2020 10:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f2d1cbef-09ec-86e4-bfc5-20320f78be6b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 11.11.20 09:27, Jan Beulich wrote:

Hi Jan

> On 10.11.2020 20:44, Oleksandr wrote:
>> On 20.10.20 13:38, Paul Durrant wrote:
>>
>> Hi Jan, Paul
>>
>> Sorry for the late response.
>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 20 October 2020 11:05
>>>> To: paul@xen.org
>>>> Cc: 'Oleksandr Tyshchenko' <olekstysh@gmail.com>; xen-devel@lists.xenproject.org; 'Oleksandr
>>>> Tyshchenko' <oleksandr_tyshchenko@epam.com>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Roger Pau
>>>> Monné' <roger.pau@citrix.com>; 'Wei Liu' <wl@xen.org>; 'Julien Grall' <julien@xen.org>; 'Stefano
>>>> Stabellini' <sstabellini@kernel.org>; 'Julien Grall' <julien.grall@arm.com>
>>>> Subject: Re: [PATCH V2 04/23] xen/ioreq: Provide alias for the handle_mmio()
>>>>
>>>> On 20.10.2020 11:14, Paul Durrant wrote:
>>>>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
>>>>>> Sent: 15 October 2020 17:44
>>>>>>
>>>>>> --- a/xen/include/asm-x86/hvm/ioreq.h
>>>>>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>>>>>> @@ -181,6 +181,8 @@ static inline bool arch_hvm_ioreq_destroy(struct domain *d)
>>>>>>    #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>>>>>>    #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
>>>>>>
>>>>>> +#define ioreq_complete_mmio   handle_mmio
>>>>>> +
>>>>> A #define? Really? Can we not have a static inline?
>>>> I guess this would require further shuffling: handle_mmio() is
>>>> an inline function in hvm/emulate.h, and hvm/ioreq.h has no
>>>> need to include the former (and imo it also shouldn't have).
>>>>
>>> I see. I think we need an x86 ioreq.c anyway, to deal with the legacy use of magic pages, so it could be dealt with there instead.
>> I am afraid I don't entirely understand the required changes. Could you
>> please clarify where the "inline(?)" ioreq_complete_mmio() should
>> live? I included hvm/emulate.h here not for the "handle_mmio()" reason
>> only, but for "struct hvm_emulate_ctxt" also (see arch_io_completion()).
> I'm sorry, but in the context of this patch there's no use of any
> struct hvm_emulate_ctxt instance. I'm not going to wade through 23
> patches to find what you mean.

Sorry for not being precise here. I meant arch_io_completion() added at [1]


[1] 
https://patchwork.kernel.org/project/xen-devel/patch/1602780274-29141-2-git-send-email-olekstysh@gmail.com/

-- 
Regards,

Oleksandr Tyshchenko


