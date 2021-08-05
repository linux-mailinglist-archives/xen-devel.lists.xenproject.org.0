Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C253E17AD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Aug 2021 17:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164405.300697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBf1F-0000ds-Id; Thu, 05 Aug 2021 15:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164405.300697; Thu, 05 Aug 2021 15:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBf1F-0000cP-ET; Thu, 05 Aug 2021 15:10:49 +0000
Received: by outflank-mailman (input) for mailman id 164405;
 Thu, 05 Aug 2021 15:10:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NEHI=M4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mBf1E-0000cJ-C1
 for xen-devel@lists.xenproject.org; Thu, 05 Aug 2021 15:10:48 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76db17f2-87fc-4a10-9134-e034058a2346;
 Thu, 05 Aug 2021 15:10:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id t9so11770348lfc.6
 for <xen-devel@lists.xenproject.org>; Thu, 05 Aug 2021 08:10:47 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j2sm440566ljc.49.2021.08.05.08.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 08:10:45 -0700 (PDT)
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
X-Inumbo-ID: 76db17f2-87fc-4a10-9134-e034058a2346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Soq6wZIRgZAtHoybEVLaxVLJKI4RyNPXQ5jIw/mfffg=;
        b=HUeYYO8sr55ckJdoAu995kkTG0pmO6sJT8pW48bzF4eylofSEKUqr3UwqnQhMQSt//
         ckkcXmb3PueteCYSg9wl7nP+qCOj8vJk1VxGNtG7t0QSw2WCZLAnleMDEwkKUIH7r5jl
         goyPXxMjCgN1Nq5PL7YIW9SwUYLx6d48YF1cr1mp3IIarH73yv9BI5bVd6qiRVC5Rx1M
         SJw5nzCVtDY3tYb7pu/eQ+AnaJS8cALCisTgTJOPwlJfkMgAe865d/jrnA7jO7mDZzmE
         3NKnnuRQL5uyGb1u3ifauo38Hi/vM9899+Oro6gSoRvzvMEwog3NG+PSQv5gPYVmLFqk
         hfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Soq6wZIRgZAtHoybEVLaxVLJKI4RyNPXQ5jIw/mfffg=;
        b=cHTaJoD4BYonRcyBcySicjk/945pCjHOOVUZS854jHPB99Brc3qtIf/akqqsRk4gBr
         q//PC1M8DCT+l4Ck3Eao200qA+OG7zZlUstKKx7/NcBIkYWHXuk0ylCopo5ztCJTbAwF
         ZtB0kVEghnHHwkPyJU4fwNjt6BKetUWnICLxf+O9FBDWf9oksOR1OkeFjHYlMLi38F6L
         XIQUB7GPlsXIeEOQ7BWmuzTblB2LCGY57i7Bde0/iZJvSCZNWzoUBCO2wJeK0qAucbu+
         oJNOnXIgs49msQhPbdhwy+0/EiIAQWNkWtC8+ev9NUbE+wTxWTw23ZsIRR5l84CYY2iI
         2fSA==
X-Gm-Message-State: AOAM532564W8LhUP6QW2h+Vn+oOE0S9YxkH7RF9+Mq1xoe9nqTBitiCE
	iENFhUWOq3u6Df8agn7nzxI=
X-Google-Smtp-Source: ABdhPJxzyroFsg6uORKiLatUj1F0WIp0kGsOkINgH4NroMLBNiyy2mhaKQh4pfjjc6o0D9NAWEYFpA==
X-Received: by 2002:a05:6512:3d8d:: with SMTP id k13mr4269127lfv.394.1628176246029;
        Thu, 05 Aug 2021 08:10:46 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <7d79a197-a126-2eed-3198-c20e63c1eece@suse.com>
 <090ffc19-92fd-5ef9-99d5-affcfdc28ad2@gmail.com>
 <11ba67a9-23a1-87e1-3db5-e9040af42a60@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <abbd7901-e9df-baa3-cbbd-f915b5953688@gmail.com>
Date: Thu, 5 Aug 2021 18:10:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11ba67a9-23a1-87e1-3db5-e9040af42a60@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 05.08.21 08:58, Jan Beulich wrote:

Hi Jan.

> On 04.08.2021 21:18, Oleksandr wrote:
>> On 03.08.21 15:53, Jan Beulich wrote:
>>> On 30.07.2021 18:13, Oleksandr wrote:
>>>> - Where that range should be located in guest address space, should that
>>>> range be the same for all domains (how GUEST_GNTTAB_BASE(SIZE) for example)
>>>> or it should be calculated based on actual guest_ram_base(size) for a
>>>> particular domain?
>>> The default size may well be fixed or amount-of-memory-dependent, but
>>> I think there will need to be a way to enlarge the region for guests
>>> with particular needs.
>> Well, but why we couldn't just make a large chunk by default which would
>> satisfy all guests, as it was mentioned earlier in this thread "as it
>> doesn't consume resource when not being used"
>> to avoid an extra configuration option, etc?
> Because experience tells me that no static upper limit will ever please
> everyone.

ok, thank you for the explanation.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


