Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79846131B8
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:02:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaab-0007tx-Ac; Fri, 03 May 2019 15:59:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaaa-0007tZ-LZ
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:59:08 +0000
X-Inumbo-ID: 6124cf97-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6124cf97-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:59:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id o16so4758499lfl.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KJfzw4LsY6qojCm9VeDh8ghh8A97aYg38ViQiLGjhK8=;
 b=Wpy9BS+GaJEvXP/ZUXlO/WwUNyK+SzF7wPoOKR4ZH+f7okPIf8uXdiGrk508pDQnhR
 rqAjYGj7Z+xp+Mb7mf6FjMrR00HS+D+Jk3rZVjeSiBTZry1ShxISmM06Mka3f+46OsPu
 EQ1Ri3QSUCIXKa+AN71JDQubxWJWE5O90lxNlBxOPoSoqrDwtvktEhVZZdhLNT1LRv+L
 H/uasAQ7pHZbxEroCKMr7104F6PxdBQA4kt9O8Se+U0JoriATnBEJI08Al2tizAtxrHm
 997rtYxHE61eImUcu2GUdUjyyhlTUdV4snWvRVZ2bZW7cl6Jd5ODmqRk7TN9dnpGp7lJ
 f86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KJfzw4LsY6qojCm9VeDh8ghh8A97aYg38ViQiLGjhK8=;
 b=t4I8kTsWl9J1Dmjid4I3NfB+B6YQmViTdTL+sdAdl1yqYKwfiY7qzgqMmVlUwHrZxp
 klpnn61HlSeVeGSdtj0AFU+ZFEI1x0WYIgP/aXqyfH3T2/GCzNx7qHxH1qUF0zU1lz7K
 xqkQdPhHN41agWtTYTbF5UxACbPLg6/bArE7yEj+YHk47s16ktfRx9yywgnPOWyVxbkT
 39XR66kFGotZp2dH7gQdZJ5ExRx8aE2A57upRNopBAkOxvLkxbrk4Rw5hA8svYtNVmcl
 OIXVLqhiIFKmfYBspPGvax0lDU/e3PLgZDJweRbmhvN92HoQD/N66PkKkFjwmLgLPI3m
 zHyQ==
X-Gm-Message-State: APjAAAXmg1rH/EqjsxNykB68oHhnAZcImDSWu3o36aS2cERU+JGgTFLy
 ZPJO+TtgCmLVT1M/Xj6dHtg=
X-Google-Smtp-Source: APXvYqyG6IAmNHwLDc/7nANvbCDhS3xUZpRkvSnlD3Fk7vGB3/7IyOLQnUaqCJHgyF2Ttze5NyyH4g==
X-Received: by 2002:a19:c194:: with SMTP id r142mr3070706lff.41.1556899145757; 
 Fri, 03 May 2019 08:59:05 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 12sm455385ljj.79.2019.05.03.08.59.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:59:04 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-18-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <fb08d22e-e139-a472-8bca-c1c3a1f4382a@gmail.com>
Date: Fri, 3 May 2019 18:59:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-18-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 17/20] xen/arm: mm: Initialize page-tables
 earlier
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpbmNlIGNvbW1pdCBm
NjA2NThjNmFlICJ4ZW4vYXJtOiBTdG9wIHJlbG9jYXRpbmcgWGVuIiwgdGhlIGZ1bmN0aW9uCj4g
c2V0dXBfcGFnZV90YWJsZXMoKSBkb2VzIG5vdCByZXF1aXJlIGFueSBpbmZvcm1hdGlvbiBmcm9t
IHRoZSBGRFQuCj4gCj4gU28gdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSBwYWdlLXRhYmxlcyBj
YW4gYmUgZG9uZSBtdWNoIGVhcmxpZXIgaW4gdGhlCj4gYm9vdCBwcm9jZXNzLiBUaGUgZWFybGll
c3Qgc2V0dXBfcGFnZV90YWJsZXMoKSBjYW4gYmUgY2FsbGVkIGlzIGFmdGVyCj4gdHJhcHMgaGF2
ZSBiZWVuIGluaXRpYWxpemVkLCBzbyB3ZSBjYW4gZ2V0IGJhY2t0cmFjZSBpZiBhbiBlcnJvcgo+
IG9jY3VycmVkLgo+IAo+IE1vdmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHBhZ2UtdGFi
bGVzIGFsc28gYXZvaWQgdGhlIGRhbmNlIHRvIG1hcAo+IHRoZSBGRFQgYWdhaW4gaW4gdGhlIG5l
dyBzZXQgb2YgcGFnZS10YWJsZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlf
YW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
