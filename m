Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55D71464
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 10:51:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpqT8-0000hY-81; Tue, 23 Jul 2019 08:48:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h8hN=VU=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hpqT7-0000hT-Bb
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 08:48:21 +0000
X-Inumbo-ID: 9e726e2f-ad26-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e726e2f-ad26-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 08:48:19 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id x25so40302519ljh.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2019 01:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RwpEUoxTAvmRHuiZJX1IFzksrB32ErUMNcypIkGCAII=;
 b=Eh9cd+J4WebSixL5GcEB3xEV4MbQ2JlFoxRtWcGnIGP3QkXCN6WaHykNfvH0v6xXOM
 Ac/QmRP056l5MbcegRpsFhRklk6lWtK+msHG1344/wTyenylYtku0epAuS8JWxYdJsGT
 M4P10aDVapKHc/NP5YcfCWxw7QRv4ALL4fdYFFnO3qYKnQa4WnKG+uXzPIuRetmpbCJu
 9pox3U0EaRsSBKl5YEj9w8dOJJiYfbAGUpPj1H+2Ocud2AOxyk/GXj75JbErdN+jhO0Z
 3rh74b9dgtNcybbF8fMYFc59NI0lWwHOdW7rLdHirC2TNer7Q73SaUX9j79nOxJ+yRoz
 JSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RwpEUoxTAvmRHuiZJX1IFzksrB32ErUMNcypIkGCAII=;
 b=HbIeBSrJr0TTBwnr6c5YvriMPBCy7Hr4e92eI3ykCiK7V+ouWx7KpIbZgfszA5w1KO
 P1UN5J5OTCEAazKSMWOe2jveuhSGVbqUEdxUqi6pu63b5zgY9f4AEtkXxfVSwjP0MQ31
 EJLygLalQklqdCzHPBuHxwnYz2di1ldActLI5LlsNxNmY8+xrHFCR5WUbQ/7ndgcR+/L
 NFh34sXH3afstrCj/6fEXwAuiQHGwTTdTKNekRoJ68YB/N+N/uN/EyEuAHCiB4eXIXdh
 7jVf7RxG/R6/N8a7EGwS/dmmvm3Rke5FHSDQidyxgin8jv6OtkN3pFSkzkH5UUloKLUC
 faFw==
X-Gm-Message-State: APjAAAWxDGjUZYXn88p62tkMSYr++KgQl7aV9Skrlh/3dSFav28+P/FQ
 nFAainBPUK6Zv7abg9ysu7o=
X-Google-Smtp-Source: APXvYqzr27jyfQYdZUvGFJQjndTwHpY4Ken0DmVUexkEK1PMg4vA7kEEWEv6hPVQRVE0gJEbM/9qHg==
X-Received: by 2002:a2e:3602:: with SMTP id d2mr3012952lja.112.1563871698287; 
 Tue, 23 Jul 2019 01:48:18 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 m9sm7241971lfo.45.2019.07.23.01.48.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 01:48:17 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
 <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
 <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
 <7ddef8b7-ec79-d7ce-4123-31ae63a5e7b3@arm.com>
 <35df7b4d-068d-15d3-2197-d5a6dee23917@suse.com>
 <6e608435-a414-320b-307a-a413c82cf9aa@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <a3b0d7ed-db9d-9c03-9fef-1b42b02b3f4b@gmail.com>
Date: Tue, 23 Jul 2019 11:48:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6e608435-a414-320b-307a-a413c82cf9aa@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuLCBKYW4sIEFuZHJldywKClRoZSBwcm9ibGVtIGFkZHJlc3NlZCBieSBbMV0gY2F1c2Vz
IHJhbmRvbSBBUk02NCBib290IGZhaWxzIGRlcGVuZGVudCBvbiBoeXBlcnZpc29yIGNvZGUgY2hh
bmdlcy4KWWV0IG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiB3YXMgcmVxdWVzdGVkIGJ5IEFuZHJldyBh
bmQgc3VwcG9ydGVkIGJ5IEp1bGllbiBbMl0uCgpIb3cgdG8gcHJvY2VlZCB3aXRoIHRoaXMgcGFy
dGljdWxhciBwYXRjaD8KQXMgSSB1bmRlcnN0YW5kLCBKYW4gZG91YnRzIHdlIHNob3VsZCBtb3Zl
IHBhZ2UgYWxpZ25tZW50IHRvIHZ1bm1hcCgpLCB3aGlsZSBKdWxpZW4gYW5kIEFuZHJldyB3YW50
ZWQgdGhlIGNvbW1pdCBtZXNzYWdlIGNsYXJpZmljYXRpb24uCkNhbiB3ZSBoYXZlIGFuIGFncmVl
bWVudCBvbiBhcHByb2FjaCBoZXJlPwoKWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMTE2Ny5odG1sClsyXSBodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcvbXNn
MDExMjkuaHRtbAoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
