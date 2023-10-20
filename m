Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C68D7D107A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 15:25:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619779.965413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpVU-0007yN-0t; Fri, 20 Oct 2023 13:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619779.965413; Fri, 20 Oct 2023 13:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpVT-0007wJ-UW; Fri, 20 Oct 2023 13:25:39 +0000
Received: by outflank-mailman (input) for mailman id 619779;
 Fri, 20 Oct 2023 13:25:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkgR=GC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qtpVS-0007w7-Fl
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 13:25:38 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27eff2f9-6f4c-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 15:25:37 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9bf0ac97fdeso125985166b.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Oct 2023 06:25:37 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 jy20-20020a170907763400b009b97d9ae329sm1499790ejc.198.2023.10.20.06.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 06:25:36 -0700 (PDT)
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
X-Inumbo-ID: 27eff2f9-6f4c-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697808337; x=1698413137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nS7ogMf1SpQhWTUG/kk2cgM6HWZUoEjfOERHuROFe/k=;
        b=BASMPhS7SlDNOZp4fRmNnR9MVX2XtHlTZyfTykP/tHmDHgxg/DycnJ5l69yVVKz5X2
         IahLwX8aamBYcOgohqchoNaLCXDk5xypFdSxvmp03sELcu+rGGMl/JQCiUjCT7DWYRBV
         pllCo/1InIoLbSbjKVBnlh897XLpzkR26KSpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697808337; x=1698413137;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nS7ogMf1SpQhWTUG/kk2cgM6HWZUoEjfOERHuROFe/k=;
        b=Ip9scomrOwdNN1LVUuz3mHTgfgiC1YBFloVu5Y3Th6Y2FJspPRVZ4TbtV5k2C1lw4O
         d89JPQCcI/cFK43dCLPm1+2Wejj7E8Zq0W5WKsCgcAylPv6KNBQfG6XjXJ7DptaWkbaI
         y0+BboA7QrNsdaL3DdwBodzvehtlCSW12g/svO7KskhrQe6r8Yypo8QWM7nv3tzA/3Yz
         4wq99VfPNlFpck0w6ii4T9zMBUmWKyadTw+WGn6W0OGXtca3rSdRe0Tix/pjj7FaB/Wa
         SmAfyonPaoauIYhupnoOPrrcB8nPl9eOOt9+kVuaTRIpJOQ8RAqpJkDwNV/zyO9Mx6kq
         6N3A==
X-Gm-Message-State: AOJu0YzFLFpPEDXBWkg6FOM03vaOYU+eHb6JR26cb9Z7rBVk0wwXIKVn
	lS949ngDJy7EFkIDorpF4H40Dg==
X-Google-Smtp-Source: AGHT+IHf/Wx2RFJpJQ1ydxMcSxnGR0jImrfdp0F4EvxC2hg0qYQ3qrysrU40HCtZD6T/8hmCpYRidw==
X-Received: by 2002:a17:907:6e91:b0:9be:fc31:8cd3 with SMTP id sh17-20020a1709076e9100b009befc318cd3mr1582947ejc.17.1697808336895;
        Fri, 20 Oct 2023 06:25:36 -0700 (PDT)
Message-ID: <f5603457-8bee-40b9-9ea2-d604abe4ee53@citrix.com>
Date: Fri, 20 Oct 2023 14:25:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] ns16550c: avoid crash in ns16550_endboot in PV shim mode
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <de07d56188f13e222ddaa1b963c20f8d7d61350e.camel@infradead.org>
 <14914ea1-2d2b-46e2-9933-2b7414acb7ba@citrix.com>
 <f1ea054608f4ae38293f89bcd84c6937538f245b.camel@infradead.org>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f1ea054608f4ae38293f89bcd84c6937538f245b.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/10/2023 11:29 am, David Woodhouse wrote:
> On Fri, 2023-10-20 at 11:14 +0100, Andrew Cooper wrote:
>> On 19/10/2023 5:21 pm, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> In shim mode there is no hardware_domain. Dereferencing the pointer
>>> doesn't end well.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>> ---
>>> This is about as far as I got in my abortive attempt to use the PV shim
>>> without an actual PV console being provided by the HVM hosting
>>> environment. It still doesn't pass the guest's console through to
>>> serial; that only seems to shim to an actual PV console.
>> There's no such thing as a Xen VM without a PV console.
> Huh? There are literally millions of them.

I'm very prepared to believe there are millions which don't overtly
malfunction when you don't fill in the HVM Params. 

Which is very different from saying "there's a way in the Xen guest ABI
to express 'you don't have a PV console' ".

~Andrew

