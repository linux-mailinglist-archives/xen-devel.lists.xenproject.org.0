Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E9B14A3C
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd3G-0007fD-Qy; Mon, 06 May 2019 12:49:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3F-0007eM-7r
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:49:01 +0000
X-Inumbo-ID: 513a4bf5-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 513a4bf5-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:49:00 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h126so9041670lfh.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rReQvzRbE1ydOK/hoUd7zwSPVQ5fKnUJY8d6NSlMWms=;
 b=AMaGsI+gyQbyT1rqKFbARClUdpRtNhuC3hQcXdSc7nOIbv/WEAWgQXdI9j82WoEL3q
 CJuvqFqxJybzS0E7osn5TjYqnNRgE3ajrSjJrLjjpo+KjKyxbuAwsSfCi6yCBPEsGCAY
 1XN1RWfA48gYOP4xPFveTWd13KKtAAc/IG+zVMss//2q/gtUbCW4o1kjp4GTlRUqKCBq
 XOun1qy/Vj+K+69a2H1EAn6adaq+X+E0+KsLNDvd5u87MbyJH4pI7ty2DS1M8WwWm0qj
 kpKqAQ7VueMmgbbJJs5LFqMTAAoGj8Zg2RJuvKp42qWcRa5+YeDa+yiMVrvsXud/GJLM
 riNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rReQvzRbE1ydOK/hoUd7zwSPVQ5fKnUJY8d6NSlMWms=;
 b=t0sjvlCWEb1fZkC2vENufx7bdwYAyPqNMlPIs/KCbsc6d5dLZf0tqXmTFkF162n3IN
 CGXW4KXoS+fZtwqltwv6YiaMkKU7mLvu/XWgvaNeMFo3AN/qzvWdJ4dBK8ZAjItY7C6q
 hxJVNaAdXzf4j9lPRK1OqI/XpvJWayE3/iEkDLRFd9oTNY0AYgIyDvJWezA6sVQjrbaZ
 tpUgXWLmtR6Szc3K4djZxq2Llm8inGt7qt2CFSCU+CIfURP3NEan/VmDDeBzj4Jdpok9
 kRafaCVQEfgiFA6Vj3KPdWtd9NQFlC4glPslAySYDwHTFmUNnYhbRCxiRQXZa65JqXse
 o2jg==
X-Gm-Message-State: APjAAAXJEPgvz5+9vITrW+9dX+6+978VQuIbmqOx5zi57ZM4rtpyo9Jq
 g5OiLRFxLcOrlN5/WqjGtsU=
X-Google-Smtp-Source: APXvYqwVc7he0tI8OcdZmXpfAph6fvSJHYKjvhj2eH6VKlEngnAxFx5ROqK78AtZ0skWbCvBqgBSnw==
X-Received: by 2002:ac2:5923:: with SMTP id v3mr1941981lfi.131.1557146938678; 
 Mon, 06 May 2019 05:48:58 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 r26sm2330224lfa.62.2019.05.06.05.48.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:48:57 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-10-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <2f2c7307-dd35-70b2-a2d7-3a6f5034f8c7@gmail.com>
Date: Mon, 6 May 2019 15:48:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-10-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/12] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSwgdGhl
IHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgM3JkIGxldmVsIHBhZ2UtdGFibGVzIGlzIG9idGFpbmVk
Cj4gdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPiAKPiBPbiBBcm0zMiwgbWZuX3RvX3ZpcnQgY2FuIG9u
bHkgd29yayBvbiB4ZW5oZWFwIHBhZ2UuIFdoaWxlIGluIHByYWN0aWNlCj4gYWxsIHRoZSBwYWdl
LXRhYmxlcyB1cGRhdGVkIHdpbGwgcmVzaWRlIGluIHhlbmhlYXAsIGluIHByYWN0aXZlIHRoZQo+
IHBhZ2UtdGFibGVzIGNvdmVyaW5nIFhlbiBtZW1vcnkgKGUuZyB4ZW5fbWFwcGluZykgaXMgcGFy
dCBvZiBYZW4gYmluYXJ5Lgo+IAo+IEZ1cnRoZXJtb3JlLCBhIGZvbGxvdy11cCBjaGFuZ2Ugd2ls
bCB1cGRhdGUgeGVuX3B0X3VwZGF0ZV9lbnRyeSgpIHRvCj4gd2FsayBhbGwgdGhlIGxldmVscyBh
bmQgdGhlcmVmb3JlIGJlIG1vcmUgZ2VuZXJpYy4gU29tZSBvZiB0aGUKPiBwYWdlLXRhYmxlcyB3
aWxsIGFsc28gcGFydCBvZiBYZW4gbWVtb3J5IGFuZCB0aGVyZWZvcmUgd2lsbCBub3QgYmUKPiBy
ZWFjaGFibGUgdXNpbmcgbWZuX3RvX3ZpcnQoKS4KPiAKPiBUaGUgZWFzaWVzdCB3YXkgdG8gcmVh
Y2ggdGhvc2UgcGFnZXMgaXMgdG8gdXNlIHssIHVufW1hcF9kb21haW5fcGFnZSgpLgo+IFdoaWxl
IG9uIGFybTMyIHRoaXMgbWVhbnMgYW4gZXh0cmEgbWFwcGluZyBpbiB0aGUgbm9ybWFsIGNhc2Vz
LCB0aGlzIGlzIG5vdAo+IHZlcnkgaW1wb3J0YW50IGFzIHhlbiBwYWdlLXRhYmxlcyBhcmUgbm90
IHVwZGF0ZWQgb2Z0ZW4uCj4gCj4gSW4gb3JkZXIgdG8gYWxsb3cgZnV0dXJlIGNoYW5nZSBpbiB0
aGUgd2F5IFhlbiBwYWdlLXRhYmxlcyBhcmUgbWFwcGVkLAo+IHR3byBuZXcgaGVscGVycyBhcmUg
aW50cm9kdWNlZCB0byBtYXAvdW5tYXAgdGhlIHBhZ2UtdGFibGVzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCj4gCgoKUmV2aWV3
ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2Vy
ZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
