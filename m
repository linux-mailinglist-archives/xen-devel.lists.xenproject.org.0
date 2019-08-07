Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E553285222
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 19:33:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvPmE-0002bK-Ie; Wed, 07 Aug 2019 17:31:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lq+z=WD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvPmD-0002bF-Lj
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 17:31:05 +0000
X-Inumbo-ID: 2199147f-b939-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2199147f-b939-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 17:31:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m23so86163930lje.12
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2019 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bKVrHqOx1MczUqyCpIuGIVgm3hmijW58nzy4SSqk3oE=;
 b=pAYBwQAaCrmH5zTLwvil6/D9zCh1mJLt/bfA0x2yC/JAorF6RchKes8VNGf7ttYgrx
 jidBRKoT0lA0s+hhkQOvm83BLLaM5/iH6n6LTrMZT+8iWR96wkormKJQfnO+9ZyLzge7
 faC15igNF0OZNPcd82YCTHGr9zYJ3xDS4SrCmDwC+9jhEcK3CbGYoe8CpkAV9EWO24iJ
 nhLjKEzVbesuv821Hx/DmZHcaSkguXquR0gmiPJnDQo+H+fznaV6TyAbyIMh7122pb+F
 jyNpou5ZVirzGmXK78kvZ8CLijjzvEzBISq1GujVrm5sKhwTUuMSoiSh43aAgsQlQ3Qp
 4VEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bKVrHqOx1MczUqyCpIuGIVgm3hmijW58nzy4SSqk3oE=;
 b=Gdmvs+SSLZwFfZAi697ddvNqrnmxGz+yzUlmAyN+gHpESh5xUswyRFrxqWBCjtndQ2
 RPrHrpAe7d7PSV9MEnG/Qt1TsYxtYZE2IwOp4uvU4BYz2MHSfIn8bKOoMgl2p1a4bf5z
 OIex9U1gXd/kOgrYYFGL1gx4xMMiopWVL1JzIbaJ6qy2gTDKUI28hRhdPo4jF5fOmJZp
 AeeqwGeii8A5uQ5B1qS0qiutr/asFuCL6BA305lsZOXVFd3ksjUrLZZeDFx90S29oVSF
 Mu3sYqkw7nafEx64cdgcs5C6GaPZQGIP/n1C8fcHiIAYeLUCRXMRAi9Qd7j55tHEb8B6
 quNQ==
X-Gm-Message-State: APjAAAUM4YtCuqbjLg5DjvAArEftcO+TNoGlJd1X/vcySFEL4CzU5r+l
 nYLQGGAy6eIVibIdheNGSkw=
X-Google-Smtp-Source: APXvYqxMaIEjl8HnP+sCeJmwWO8Ju61qygSYwx8KAdFaXnZafCLjeNJl/rfoY8kF7kcC9cdM7IJXLA==
X-Received: by 2002:a2e:5d1:: with SMTP id 200mr5490618ljf.10.1565199063438;
 Wed, 07 Aug 2019 10:31:03 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id p76sm18438687ljb.49.2019.08.07.10.31.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:31:02 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com>
 <760df686-ef36-e400-4ef3-c51334694b68@gmail.com>
 <c2bb1e2f-d600-bf30-8f55-38b86bd1100a@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <c4780d61-936f-535e-2a46-b631b4266727@gmail.com>
Date: Wed, 7 Aug 2019 20:31:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c2bb1e2f-d600-bf30-8f55-38b86bd1100a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLAoKCj4gTmV2ZXJ0aGVsZXNzCj4gSSdkIGFwcHJlY2lhdGUgaWYgdGhlIHR5cGUtdW5zYWZl
IF94cmVhbGxvYygpIGRpZG4ndCByZW1haW4gdGhlCj4gb25seSByZS1hbGxvY2F0aW9uIGNvbnN0
cnVjdCwgYXMgdG8gYXZvaWRpbmcgcGVvcGxlIHVzaW5nIGl0IGp1c3QKPiBiZWNhdXNlIHRoZXJl
J3Mgbm8gYmV0dGVyIGFsdGVybmF0aXZlLgoKSSBnb3QgeW91ciBwb2ludC4KCgotLSAKUmVnYXJk
cywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
