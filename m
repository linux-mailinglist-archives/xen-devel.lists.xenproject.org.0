Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BB620DBB
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 19:11:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRJrR-0004Jy-E9; Thu, 16 May 2019 17:08:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LWQg=TQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hRJrQ-0004Jt-3n
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 17:08:04 +0000
X-Inumbo-ID: 29bb5790-77fd-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 29bb5790-77fd-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 17:08:03 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h21so3743179ljk.13
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=nfIiDu3N2MlPiUespfgiCYmTqOqveqR5A4JPnxUZLeg=;
 b=RK8+T1aY//Jc0WRyk3AqFn+EqnwzfEK7fGR2OZXPeRnLYrxKTff/PY1oNoCq1Acr87
 fKs7+KNlUBgXiQfrNkW2eNDqdrjzNXXLng1Dq4AH5x390e0lI8KIkhZjS1gh3dUh5xGI
 2AA57rXCDc8oZFr4iY/NKliTfqwH/KGzBvbBIhr8MvFVzD2uJMTvNZxo99HumGo8kvd7
 3D5Z5pnnPQD+Gn6Y63H3k2IF6i38V+p+s+boyBQm+pjC82H1z2rG9I1wu/6iS21pp5fz
 tGmbSaUyI1vIquLYvNj6u9aAqEf48JlXxNzm/4nirncKA3wn+GXP7/lBJ37rT05wUchg
 PqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nfIiDu3N2MlPiUespfgiCYmTqOqveqR5A4JPnxUZLeg=;
 b=BjfVl8Ts+RuxCcJN0Tl+OPOmm4kfROqjQ+OLUKN6LO80yVdvZrVEtDy119SCjcOqqI
 gn5JC3GlqfpJFJkBaWW1n+2MQiuMBY2ZkCq+LbP4v4ZzvfmZlltZHun3oNVqvCJe3D2P
 mFb2IP8ptcUv+2IyfxUz5DIMDrL3kZ1YQzbrDMaqxzcqvTeWj06JjvsSpTznrqZTWJNS
 xrqWXKe7F5CvBoWCy9Jd/DF880tobSIR4U0lrP6RUH8Lt2veCt8rXmmvHMhZv8Xgafqx
 cup/rXW0CYpYmJHiLmsuapoGMGk3lHumlExHDZNv39AP+fTjN687/T1tsHgOq7u54YnH
 op5g==
X-Gm-Message-State: APjAAAX4vimMtkoZLttWxSt4fbfDa94VS3ANLQf4AJ6jUghOV5pRQcb+
 zQAaOXs03pUs7nfKh7kvHW0=
X-Google-Smtp-Source: APXvYqzlWuo8a24mRvuu0IX/Maz+wGPowksBZgE+krV7N22b2rk2swLz3rM6c2snZ6mLj/I7ByrVoQ==
X-Received: by 2002:a2e:9c0a:: with SMTP id s10mr24957035lji.162.1558026481766; 
 Thu, 16 May 2019 10:08:01 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id h11sm1075605lfh.8.2019.05.16.10.08.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 10:08:01 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
 <ec3339b0-6588-2a54-d0db-1e9c157f9259@arm.com>
 <128c02c6-412a-bb65-c665-133c525e506e@gmail.com>
 <08ad173c-2c2c-967c-84fa-6b848ab52659@arm.com>
 <7bdd9edc-f14e-decf-60d5-f18efaea6526@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a72a7915-1b7b-15bc-96f6-6c2eff88dd95@gmail.com>
Date: Thu, 16 May 2019 20:07:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7bdd9edc-f14e-decf-60d5-f18efaea6526@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 0/4] Renesas Stout board support (R-Car
 Gen2)
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjA1LjE5IDE4OjQ0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSwgSnVsaWVu
CgoKPgo+PiBUaGF0J3MgY29ycmVjdC4gSWYgSSBkb24ndCBoZWFyIGFueXRoaW5nIGJ5IE1vbmRh
eSwgSSB3aWxsIG1lcmdlIHRoZSAKPj4gdHdvIHBhdGNoZXMuCj4KPiBJIGhhdmVuJ3QgaGVhcmQg
YW55dGhpbmcgZnJvbSBTdGVmYW5vLiBJIGhhdmUgbm93IG1lcmdlZCB0aGUgdHdvIAo+IHJlbWFp
bmluZyBwYXRjaGVzLgo+CkdyZWF0LCB0aGFuayB5b3UhIE5vdywgSSBob3BlIHdlIGNhbiBzYXkg
dGhhdCBSZW5lc2FzIFN0b3V0IGJvYXJkIGlzIApzdXBwb3J0ZWQgaW4gWGVuIChvZiBjb3Vyc2Us
IGlmIHVzaW5nIFBTQ0ktZW5hYmxlZCBVLUJvb3QpLgoKTmV4dCBzdGVwIGlzIHRvIHVwZGF0ZSBX
aWtpIHJlZ2FyZGluZyBTdG91dCBib2FyZC4KCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNo
Y2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
