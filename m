Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF687131AF
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:00:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaZ7-00079g-P5; Fri, 03 May 2019 15:57:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaZ5-00078b-Nl
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:35 +0000
X-Inumbo-ID: 29f82e70-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 29f82e70-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:34 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h126so4763366lfh.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lVPgkG48K05PS6sqZg+Kr9bhvA9P3wRa2+sonf/+61k=;
 b=RspN8PoMd8IhRTBppdle/kDR3v83V3Ekyp1OP9ZhWJDM/rWnbCxhUHUGxPtvYKMhwp
 elyFjfbopVQ20aZlLHkE65GxE6inqiRPTQooGesSdzaWE+B1FXfmGq9XS2kUd0zzC6GR
 iD+09KZFRh0Ngc4CZNGdg4YOSQRNuFDciZcsM2c/X/ZT2RfeugdasE/eJ82sGCzPBsbr
 zy9l/zdsLxPgMxfaa1SS7VbjxbOxG7YZovvoxzlk3hwnQZTiNJ/q5IwFoWYopv8Qr4nW
 3IyfNOTTS2PmNu06BMaecDrQGSKYC2rDy/OK0CoRedhuzFH5rVCex5YikCxGhdPRfHPa
 vd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lVPgkG48K05PS6sqZg+Kr9bhvA9P3wRa2+sonf/+61k=;
 b=TInc+zhOajlAZ9kgjPqRPLvYJdkO694i7Ko/+d3DVsKGTktb1Mx3CbDpVaK0ytYDRT
 7bIfYFsPAeJ3lamRYUpjCSNWmZLAioaH3/3+7tgA1YK17uPiFXpleif0FHZvSPLeaaYH
 hXuTBdRlGq8mKka4svouObS8Zf6h9MT/5uUfXp8BYfXLzcecdZOSZ5MqXPDZw/TLN3l2
 PV8ifDzhGYifHfBZGpjVl+BogDC5YkSC6Ph9GGT2LRB442jNLdIvb7PWzE8vTqt1RbMo
 A4OiEjHRj5/dnV8okOap6xgic2lWbA2ztc5Mfsy9CMZeG0sKYa/2ftzt3mQidQ5IEBI1
 ltUg==
X-Gm-Message-State: APjAAAX7U5L0tDxOOurb4dXu8R82pB62Bojvx9D2GwFjmsqVuGwkVO7W
 Eetzbwu3mlIyTPtt3Zgclvw=
X-Google-Smtp-Source: APXvYqxwoKsUqHGGQ+7VtyIaAUQjkiPtTLzE/HJvpx+NHi/B1ftPXW8jWAYGsURg3Zz0385rIRBLyw==
X-Received: by 2002:a19:6b0d:: with SMTP id d13mr5425265lfa.79.1556899053196; 
 Fri, 03 May 2019 08:57:33 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 f18sm493696lfh.39.2019.05.03.08.57.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:57:32 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-14-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <3d3d4a09-4935-4a83-0e3d-7b987dfc9fcf@gmail.com>
Date: Fri, 3 May 2019 18:57:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-14-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/20] xen/arm32: mm: Avoid to zero and
 clean cache for CPU0 domheap
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
aGUgcGFnZS10YWJsZSB3YWxrZXIgaXMgY29uZmlndXJlZCB0byB1c2UgdGhlIHNhbWUgc2hhcmVh
YmlsaXR5IGFuZAo+IGNhY2hlYWJpbGl0eSBhcyB0aGUgYWNjZXNzIHBlcmZvcm1lZCB3aGVuIHVw
ZGF0aW5nIHRoZSBwYWdlLXRhYmxlcy4gVGhpcwo+IG1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBm
b3IgQ1BVMCBkb21oZWFwIGlzIHVubmVjZXNzYXJ5Lgo+IAo+IEZ1cnRoZXJtb3JlLCBDUFUwIHBh
Z2UtdGFibGVzIGFyZSBwYXJ0IG9mIFhlbiBiaW5hcnkgYW5kIHdpbGwgYWxyZWFkeSBiZQo+IHpl
cm9lZCBiZWZvcmVoYW5kLgoKSU1PIGl0IGlzIGEgYml0IGNvbmZ1c2luZy4KQXMgSSB1bmRlcnN0
YW5kLCBgY3B1MF9kb21tYXBgIHJlc2lkZXMgaW4gQlNTIHdoaWNoIGlzIG5vdCBhIHBhcnQgb2Yg
dGhlIGJpbmFyeSB1bmxpa2UgaW5pdGlhbGl6ZWQgZGF0YS4gWWV0IGl0IGlzIHVuY29uZGl0aW9u
YWxseSBjbGVhcmVkIGR1cmluZyB0aGUgYm9vdCBvbiBBUk0zMi4KCj4gIFNvIGl0IGlzIHBvaW50
bGVzcyB0byB6ZXJvIHRoZSBkb21oZWFwIGFnYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCgpUaG91Z2g6CgpSZXZpZXdlZC1i
eTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHks
CkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
