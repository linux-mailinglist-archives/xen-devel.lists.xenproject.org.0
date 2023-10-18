Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6D7CDA31
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 13:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618515.962244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt4dw-00051R-81; Wed, 18 Oct 2023 11:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618515.962244; Wed, 18 Oct 2023 11:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt4dw-0004z0-5V; Wed, 18 Oct 2023 11:23:16 +0000
Received: by outflank-mailman (input) for mailman id 618515;
 Wed, 18 Oct 2023 11:23:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w+tR=GA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qt4du-0004ys-Jx
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 11:23:14 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9eaf0b4-6da8-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 13:23:13 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53d9f001b35so11438799a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Oct 2023 04:23:13 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e17-20020a50a691000000b00534e791296bsm2730704edc.37.2023.10.18.04.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 04:23:12 -0700 (PDT)
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
X-Inumbo-ID: b9eaf0b4-6da8-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697628193; x=1698232993; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NvPXeYzLdLdpo0FY6CNAlUqYyqu90vnFmq+Lv3O5uhU=;
        b=KxObjdwCgR9LJ1s5YfAki7gGvDsds3CpnCWf7aahIl1vAPb1VwMT/3f3zEd+Ot1qrF
         NNCnDDkCJnGo+TV7VSZ9RfCQGFDPzBcrCf+puQ7YJHhiccMdWda6VrxR7Qex/Y4CR99o
         sOKychNvilE1JRekXkeBmX4+ar+YctRSd847U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697628193; x=1698232993;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvPXeYzLdLdpo0FY6CNAlUqYyqu90vnFmq+Lv3O5uhU=;
        b=FQJq+0UqeabGPCHzMULGLw7fa3HMQe0f9sgt03UtWCJZ37zZ8Mwm8pCqr944Z9KX1R
         Rn3JKJ3RxLX1MUpXKdTET1fPqahaVNcOWOrQCM2TlMQ7tmoCFzx9W5mpP2gCcfDp1fng
         wNHK6D8Z2PogDD54ksaAQo5D18kkq561Mxt/iVCtEOqW2BlmpYr7hWcxZeKUwGjYfB2k
         hRSa2dQ7ZYPfEkRfZprrJAr75+ge+3Q0lXZvwdOdYq5DDOm8xc3egfdvAfwnktR8i/y5
         rw8X4EN4NQBYthSUUpdvG74Bgpin/Ybi9MBTKovz/MREuUFK5/jskgM96gwzvLP/BZgR
         WJLg==
X-Gm-Message-State: AOJu0YzslDrrloamsCcep6PTruuUtMzdZxnwbngmnBvc2Fcelg6jZbyM
	2CC5635dmewX2qxaIxDyeJ8WSWULefX1wOzDudcJPQ==
X-Google-Smtp-Source: AGHT+IEDHUlt6TjhBzaO84DHm9081eU7K7ZY1qvUdvjua+rPo+jZjvLnsUdtKK16k6cofYwCqShWlA==
X-Received: by 2002:a50:cc06:0:b0:53e:1825:be81 with SMTP id m6-20020a50cc06000000b0053e1825be81mr3633419edi.21.1697628193240;
        Wed, 18 Oct 2023 04:23:13 -0700 (PDT)
Message-ID: <d44f1543-22e7-4abe-a245-7cd0d0d585e0@citrix.com>
Date: Wed, 18 Oct 2023 12:23:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen 4.18 pvshim console issue (with patch)
Content-Language: en-GB
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
References: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
 <c86df0f1-c89c-4702-9b12-c0faf61b2de9@citrix.com>
 <ZS-_lcYqqDgEZdFi@mail.soc.lip6.fr>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZS-_lcYqqDgEZdFi@mail.soc.lip6.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2023 12:20 pm, Manuel Bouyer wrote:
> On Wed, Oct 18, 2023 at 11:44:22AM +0100, Andrew Cooper wrote:
>> On 18/10/2023 11:38 am, Manuel Bouyer wrote:
>>> Hello,
>>> With Xen 4.18, a PV domain running under pvshim doesn't get console input.
>>> This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
>>> hardwired to 0), so console_input_domain() will never select that domain
>>> as input.
>>>
>>> The attached patch fixes it by translating 0 to the real domain id for
>>> pvshim, but there may be a better way to do this.
>>>
>> Thankyou for the report.
>>
>> First, CC'ing Henry as 4.18 release manager.
>>
>> There have been changes in how this works recently in 4.18, notably c/s
>> c2581c58bec96.
> Yes, it looks like this one introduced the problem.
> Before this, we would switch console_rx to 1 without checking if
> domain (console_rx - 1) exists, and console_rx == 1 is a special case
> in __serial_rx()
>
>> However, it's not obvious whether this worked in 4.17 or not.  i.e.
>> whether it's a regression in 4.18, or whether it's been broken since PV
>> Shim was introduced.
> I don't know for 4.16 or 4.17 but I can tell that it's working in 4.15
>

That commit is new in 4.18, so Henry - this is a release
critical/blocker owing to it being a regression vs 4.17.

I'll try and put some brainpower towards it when I get some other 4.18
work sorted.

~Andrew

