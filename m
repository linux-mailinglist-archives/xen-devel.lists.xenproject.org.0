Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492A614A39
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd2j-0007Os-Ch; Mon, 06 May 2019 12:48:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2h-0007OD-NL
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:27 +0000
X-Inumbo-ID: 3d721626-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3d721626-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:48:26 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id k18so9023427lfj.13
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hR8fikspcvIbJsQaWaZJS2UELh7du6zytKm0xn4Tqys=;
 b=P0Un8U0Bz7ATOQQ0tRU/qAHLtOH5qabFzYnqnvLYqCxq4Y+r4LzBzSQ1BqvrsLRVSg
 TDpIXb7yC1Hte16EmpVZu0VLXdrZrLcExCpC8dgfsl6YmdMX1vs8ds+BFdXscZ9KkjAb
 yjOq3BuJiSJPF0HGegiXzv0WYildUbM8fs7RDC3lMVMdvwgDNn55qMMWtD0LY4c2JzzS
 Dz+NJCAgqtr24xDWMWSro2aqK5EDu8H/BgaTRdmIPNbtnCNuv6OykDOyc9BwLIlTy0hV
 iY644prHpHkgqU05ZgNm23tkNnVsiuXQrx9sny4PMXIBj7HkXmtrF3TP3jfR5dM5ac+/
 wghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hR8fikspcvIbJsQaWaZJS2UELh7du6zytKm0xn4Tqys=;
 b=D9jN76Yj4n0rfn1GwUGtqfQmmDgcut1QSFS5VkkDb+AS6MmodtppOSIOPNDSkD5zmc
 bBfmIv3kHZjfvlJnp0bdPyQHeqwXAmqVF8+ceE35FLtIzcJUCxwzxHcFpQz34rQpZjhU
 qJAr2beQXFCAZkC93e6SoKrpkmt/wLjLIq9LH8UyQXsenzzMdT59knVQoNcd4WFoyyfB
 mYCkfUvRYpLrFCpliWb2O2Pg6ZmnpuPGjmVd/dAxgItkXh9B43v8f4Hot4Ua20Qs3QgJ
 Sdmw+cna95XIyJftwpl+wxkGtA7Q+acWIgU7oHVvLxxDHAIu3Na8QiFheWfCTbn8+Q+J
 qLwQ==
X-Gm-Message-State: APjAAAVCD495xjyxMu4fOUpNMSDeM425kyKQE1+ZtZEk6kHrVhXL7rTo
 /PgLuAbgmHm2T6noz4WNR6g=
X-Google-Smtp-Source: APXvYqyY40Sq0DlOC88LG8tqxTGUf7F1epNHMjVCEGDISFkasd321IGpszLg0VaixMt6zh9aZXm0lA==
X-Received: by 2002:ac2:54b7:: with SMTP id w23mr10113599lfk.139.1557146905474; 
 Mon, 06 May 2019 05:48:25 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 l16sm2397621lfk.44.2019.05.06.05.48.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:48:24 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-6-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <fdea6024-d7e1-9233-43b8-4c09a54161e9@gmail.com>
Date: Mon, 6 May 2019 15:48:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-6-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 05/12] xen/arm: mm: Only increment mfn when
 valid in xen_pt_update
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
IE1GTiB3aWxsIGJlIGluY3JlbWVudGVkIGV2ZW4gaWYgaXQgaXMgaW52YWxpZC4gVGhpcyB3aWxs
Cj4gcmVzdWx0IHRvIGhhdmUgYSB2YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0IGl0ZXJhdGlvbi4K
PiAKPiBXaGlsZSB0aGlzIGlzIG5vdCBhIG1ham9yIHByb2JsZW0gdG9kYXksIHRoaXMgd2lsbCBi
ZSBpbiB0aGUgZnV0dXJlIGlmCj4gdGhlIGNvZGUgZXhwZWN0IGFuIGludmFsaWQgTUZOIGF0IGV2
ZXJ5IGl0ZXJhdGlvbi4KPiAKPiBTdWNoIGJlaGF2aW9yIGlzIHByZXZlbnRlZCBieSBhdm9pZGlu
ZyB0byBpbmNyZW1lbnQgYW4gaW52YWxpZCBNRk4uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
