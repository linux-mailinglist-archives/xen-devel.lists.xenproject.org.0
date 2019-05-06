Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0B14A36
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd2V-0007Jd-JO; Mon, 06 May 2019 12:48:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2U-0007JT-Sp
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:14 +0000
X-Inumbo-ID: 35d85e2a-6ffd-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35d85e2a-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:48:14 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q10so10957358ljc.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0FrF8z7gnABXop6PKgNXuHBe0SzCYIyGDQUI/d5sNZE=;
 b=ZhsxLHqaJjyn+U9J3LZS+en9pYLWp8Dqs7ILVCMPoHyGiL3vc1mDqgvS1sVa1odLCQ
 u45pRYh8qLr+iW8uN1SBU6zkQoSJ6IC4XLJNvAarrOZFhUzIeGBqwFw6GJ6gAUAi0zKV
 KDpl1b9yWY2wGoXXZvMaYdEcFYDZb8YG9WqIHDBGB4ejnwHjlSZID3q5kRAS6y6hgyf5
 67yKx6+7b4VyLXEOi8sGr3BHr2Vq1TMc+3P8txU6q4bi/HBhH0NKXlm/exMT0ZNT8XSr
 gfXHOF+tlmY4/QuHYLFPf2Fe96roGtQGLNzHP/5+ditxwCkNRRtO5+nSP4umBAEWSCXw
 EluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0FrF8z7gnABXop6PKgNXuHBe0SzCYIyGDQUI/d5sNZE=;
 b=ShQjxlReoOxmrDu4jbU9sHOFtFW6IJHo0+TbQAsj3qCL3hkKvp76zqt6qk+s93JMc+
 ef1kn0neN/hBQlz4QWVlUg505NXdZPQRHpB6Wjpy4JclecXCnPwQppfj1cnYBmJ9FF6Q
 oQzyHPJsDzVVXXZAtiMt8fzo5zBI+/QAKRr4SYApwBlkUV/9BBOTOCfkDZgfSg6ltYGy
 dJq3KMUOaJexCad98ft6sa89QwBioe8v5PdeLVc0irBUtegg0s//8+7N+dHf4/FocnXB
 8mlyzr65NaZkcx85XeHW8H3vMtNmnxkjthIj+SPZAr79vcwaDuNn3oheP1SsMHBz6k9+
 yj/g==
X-Gm-Message-State: APjAAAUIz2BuAO9up+zrLmsFk3VXrPvfGePGPgMO6aEQLE+vSqP5uFPC
 6UI2toyiFczo29IU9UPa0EA=
X-Google-Smtp-Source: APXvYqyEiW111Mw7+aCnHCum7UpRegTXoz3qCHyKew2fKvoxfw9cKKg4lXFkZ9Um8ZT1Zb8vv/j1ug==
X-Received: by 2002:a2e:89da:: with SMTP id c26mr13183820ljk.186.1557146892623; 
 Mon, 06 May 2019 05:48:12 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 k1sm2017969lfc.18.2019.05.06.05.48.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:48:11 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-4-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <8877efec-2303-6486-d32c-7d358ce65ddd@gmail.com>
Date: Mon, 6 May 2019 15:48:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-4-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/12] xen/arm: mm: Move out of
 xen_pt_update() the logic to update an entry
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEluIHByZXBhcmF0aW9u
IG9mIHJld29yayBvZiB0aGUgWGVuIFBULCB0aGUgbG9naWMgdG8gdXBkYXRlIGFuIGVudHJ5Cj4g
aW4gbW92ZWQgb3V0IGluIGEgc2VwYXJhdGUgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCgoKUmV2aWV3ZWQtYnk6IEFuZHJp
aSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkg
QW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
