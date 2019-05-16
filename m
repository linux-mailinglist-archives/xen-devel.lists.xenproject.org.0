Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B91FF8E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 08:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hR9qZ-0007Ve-6V; Thu, 16 May 2019 06:26:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/XQJ=TQ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hR9qY-0007VY-BF
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 06:26:30 +0000
X-Inumbo-ID: 89bc62ea-77a3-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 89bc62ea-77a3-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 06:26:29 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id 188so1942092ljf.9
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 23:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wopevyOfrVcNgrs2OlRoJkSg1GME6xrc5gzsawzKoi4=;
 b=u4Bs2ZR9I5NiC3tUkHwro0NaNYQTer2meRxQ1f7i3QntTO6Uxe3PIsdl0hPJq7/tvI
 M4B9EalKq9eNCu7yK11e4OMIUCijrug2sTK9bWnm8qOF/eCn5OhtdHlsAMFOwW1ALlSO
 vy3GmdKhcLgEUeOCutt1snzGpRtLBTlvCCh+ERJkgFyanEBzuWG0auDZiJH+YlcvDlwq
 GOE7+0VY4aJI1hBAApc60LM33uCYXFd5Qj3zvkaT86rgZqXLyoUxqdioV6hO+vZGn4mq
 WrlCcXJa1Z7O/yDs4zOvrqJlQfMpfNhTHv6Wk1Qnm2xJmTNOtUrlBa9PX6u4x74aA0KF
 dlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wopevyOfrVcNgrs2OlRoJkSg1GME6xrc5gzsawzKoi4=;
 b=MU0KGUBmYy30ZyHuw1Aunr6lhh2cK17q3Ws821szvwsk7ohbQF5V7jaqdGmjz6Zwah
 +72ARrHwRmhaRF+kVa5YfkyULKabahmpSi90Q4Nk926AbLwiSinKNWKosjBB5jpUnVSX
 dFsTrfMMy0SE6CkyynSZbeY5Q+3UvhR2Tu2/EorSrgy5z80c/Fn8hrC/RYTGxvv/+QoE
 CiOh52Q+aeV6yczYksSoXuTNLqvcLuAh/o1YlH1aFktLCRJ1YLPEamZ496dTlyFdP/rp
 GsRrNP9FO0AjakuLt30DXHFCKr1448VvysJ+tjDki8Eurj6qSwdVKgWIKWe5/MMdD2zX
 9FeQ==
X-Gm-Message-State: APjAAAUbW24nar1aELkCPiJEsQ2p+McYdYqyCyIHvUvslX3VQ3PARVZO
 CndjYVKTQnHssiJDXY1WVZU=
X-Google-Smtp-Source: APXvYqxmhwMESExMgBx/ncLaEXSu/aignZEYzcIQ7Rj5rRdJ0TG1Bikq8bj5GIrD/1hxKwfDs98pQQ==
X-Received: by 2002:a05:651c:150:: with SMTP id
 c16mr22906662ljd.65.1557987987979; 
 Wed, 15 May 2019 23:26:27 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 j10sm882748lfc.45.2019.05.15.23.26.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 23:26:27 -0700 (PDT)
To: Anchal Agarwal <anchalag@amzn.com>,
 "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
References: <6205819a-af39-8cd8-db87-f3fe047ff064@gmail.com>
 <ecc825e6-89d3-bbd5-5243-5cc66fa93045@oracle.com>
 <b55d4f90-100c-7a2a-9651-c99c06953465@gmail.com>
 <09afcdca-258f-e5ca-5c31-b7fd079eb213@oracle.com>
 <3e868e7a-4872-e8ab-fd2c-90917ad6d593@arm.com>
 <d709d185-5345-c463-3fd1-e711f954e58a@gmail.com>
 <435369ba-ad3b-1d3a-c2f4-babe8bb6189c@amazon.com>
 <fde362d0-dd48-9c9a-e71a-8fb158909551@epam.com>
 <20190325173011.GA20277@kaos-source-ops-60001.pdx1.amazon.com>
 <f5e824de-da57-9574-3813-2668f2932a6e@gmail.com>
 <20190328231928.GA5172@kaos-source-ops-60001.pdx1.amazon.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <48fedb13-5af2-e7cf-d182-0f2bb385dda2@gmail.com>
Date: Thu, 16 May 2019 09:26:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190328231928.GA5172@kaos-source-ops-60001.pdx1.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/netfront: Remove unneeded .resume
 callback
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
Cc: "jgross@suse.com" <jgross@suse.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Munehisa Kamata <kamatam@amazon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Anchal Agarwal <anchalag@amazon.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sIEFuY2hhbCEKCk9uIDMvMjkvMTkgMToxOSBBTSwgQW5jaGFsIEFnYXJ3YWwgd3JvdGU6
CltzbmlwXQo+Pj4+IEdyZWF0LCBjb3VsZCB5b3UgcGxlYXNlIGxldCB1cyBrbm93IHdoYXQgaXMg
dGhlIHByb2dyZXNzIGFuZCBmdXJ0aGVyIHBsYW5zCj4+Pj4gb24gdGhhdCwgc28gd2UgZG8gbm90
IHdvcmsgb24gdGhlIHNhbWUgY29kZSBhbmQgY2FuIGNvb3JkaW5hdGUgb3VyCj4+Pj4gZWZmb3J0
cyBzb21laG93PyBBbmNoYWwsIGNvdWxkIHlvdSBwbGVhc2Ugc2hlZCBzb21lIGxpZ2h0IG9uIHRo
aXM/Cj4+PiBMb29rcyBsaWtlIG15IHByZXZpb3VzIGVtYWlsIGRpZCBub3QgbWFrZSBpdCB0byBt
YWlsaW5nIGxpc3QuIE1heSBiZSBzb21lIGlzc3VlcyB3aXRoIG15Cj4+PiBlbWFpbCBzZXJ2ZXIg
c2V0dGluZ3MuIEdpdmluZyBpdCBhbm90aGVyIHNob3QuCj4+PiBZZXMsIEkgYW0gd29ya2luZyBv
biB0aG9zZSBwYXRjaGVzIGFuZCBwbGFuIHRvIHJlLXBvc3QgdGhlbSBpbiBhbiBlZmZvcnQgdG8g
dXBzdHJlYW0uCj4+IFRoaXMgaXMgcmVhbGx5IGdyZWF0LCBsb29raW5nIGZvcndhcmQgdG8gaXQ6
IGFueSBkYXRlIGluIHlvdXIgbWluZAo+PiB3aGVuIHRoaXMgY2FuIGhhcHBlbj8KPiBOb3QgYSBz
cGVjaWZpYyBkYXRlIGJ1dCBtYXkgYmUgaW4gZmV3IHdlZWtzLiBJIGFtIGN1cnJlbnRseSBzd2Ft
cGVkIGF0IHdvcmsuCj4KQW55IHByb2dyZXNzIG9uIHRoaXM/CgpUaGFuayB5b3UsCk9sZWtzYW5k
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
