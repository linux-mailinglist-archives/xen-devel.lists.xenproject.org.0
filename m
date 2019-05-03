Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2993C131A4
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaY1-0006fT-TH; Fri, 03 May 2019 15:56:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaY0-0006fO-SE
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:56:28 +0000
X-Inumbo-ID: 01f6c808-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 01f6c808-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:56:27 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r72so5619250ljb.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4bRue3UBnctMIqmWEMx/SzxzvnRgUO/H4hV1bkj9oxc=;
 b=ZYFP6FbK4dD4HVWnecYJLHZlFUb8/sIGF6ETe6I1MD6ncoIqJkqDjIE3mF22kmfZdD
 JSCXABAdhJriHIC1ltZ5Yc8pSgzLzrUroiKIKxUYPrDzMApyXHjWUyr8xMgXqibNgjC2
 bKG+5qG39n0p3bu9nTGl7kFm14bXgW55QvS1Y8DRF+JK9dCXimnsjcDILRD2DCIVICrq
 jmxeE959CyP/oUN+GfhAJtVBYRtzGHOOA1OWgPnSAA1ENFAm5R6zlLRv4JcfAjCKEq+5
 UCWp0PYq99t6UWs950q5VNd1dlVTW3VGLg+QSW4q7JVSs5uOcTzb7x1aJ2Ab3cSalObi
 CMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4bRue3UBnctMIqmWEMx/SzxzvnRgUO/H4hV1bkj9oxc=;
 b=eofPM7rOHJfXT8ioXtlvvk+CfMX4S+o5pE8RniPwgnnyXQA2PVM3XL+YGbvfv6XbvK
 Mq4iWxtY2eUBmiGG2ncxW4mQ63FXxrIc4e6C3tweasSKbLQunwhWYY/orAOV4Aqb0e7V
 rY/fpShdH/ooCLKOvE6M9h9CSHTg1++gldI3w+x/6shlxwPezRhZlidngsb6PlXPbeZ5
 E5H9PImqz6Jiuk7QzUdRimyNLD6It1nylvW8+5vxuV1vmkpD3J4jK465sAmnr9pOAzqw
 a3jd/3LR893ZmPhRNgyTlMiPugVJzE5W7XBbqvzMLopMCc70T4ce9wPjMJQcOesJgZS2
 OpMQ==
X-Gm-Message-State: APjAAAXyosIr5kfSEMi7Cvso6W30XzXYUiJ6nQXuJwwSQH9Z1o3kV72L
 4oxqjSMoQr98GqOEORAProc=
X-Google-Smtp-Source: APXvYqx0eUS+jB+X8ZZJDb8pLsXsmA6A5UK3hLOaKz8wuEe5pbCQ3TkJf4E3/Xn8NGgS3L7Vx27sog==
X-Received: by 2002:a2e:2e17:: with SMTP id u23mr5455043lju.187.1556898985913; 
 Fri, 03 May 2019 08:56:25 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 f21sm454934ljk.94.2019.05.03.08.56.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:56:24 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-3-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <03aa74a3-5a27-f6e3-d01f-eb93d91c73b7@gmail.com>
Date: Fri, 3 May 2019 18:56:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-3-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/20] xen/arm: Rename SCTLR_* defines and
 remove unused one
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

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
aGUgU0NUTFJfKiBhcmUgY3VycmVudGx5IHVzZWQgZm9yIFNDVExSL0hTQ1RMUiAoYXJtMzIpIGFu
ZAo+IFNDVExSX0VMMS9TQ1RMUl9FTDIgKGFybTY0KS4KPiAKPiBUaGUgbmFtaW5nIHNjaGVtZSBp
cyBhY3R1YWxseSBxdWl0ZSBjb25mdXNpbmcgYmVjYXVzZSB0aGV5IG1heSBvbmx5IGJlCj4gZGVm
aW5lZCBmb3IgYW4gYXJjaGljdHVyZSAob3IgZXZlbiBhbiBleGNlcHRpb24gbGV2ZWwpLiBTbyBp
dCBpcyBub3QgZWFzeQo+IGZvciB0aGUgZGV2ZWxvcGVyIHRvIGtub3cgd2hpY2ggb25lIHRvIHVz
ZS4KPiAKPiBUaGUgbmFtaW5nIHNjaGVtZSBpcyByZXdvcmtlZCBieSBhZGRpbmcgQXh4X0VMeCBp
biBlYWNoIGRlZmluZToKPiAgICAgICogeHggaXMgcmVwbGFjZWQgYnkgMzIgb3IgNjQgaWYgc3Bl
Y2lmaWMgdG8gYW4gYXJjaGl0ZWN0dXJlCj4gICAgICAqIHggaXMgcmVwbGFjZWQgYnkgMiAoaHlw
ZXJ2aXNvcikgb3IgMSAoa2VybmVsKSBpZiBzcGVjaWZpYyB0byBhbgo+ICAgICAgZXhjZXB0aW9u
IGxldmVsCj4gCj4gV2hpbGUgZG9pbmcgdGhlIHJlbmFtaW5nLCByZW1vdmUgdGhlIHVudXNlZCBk
ZWZpbmVzIChvciBhdCBsZWFzdCB0aGUgb25lcwo+IHRoYXQgYXJlIHVubGlrZWx5IGdvaW5nIHRv
IGJlIHVzZWQpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFt
LmNvbT4KCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
