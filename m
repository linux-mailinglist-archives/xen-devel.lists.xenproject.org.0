Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A2A6345F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 12:33:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hknNh-0005wQ-DC; Tue, 09 Jul 2019 10:29:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=50wr=VG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hknNf-0005wL-Ii
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 10:29:51 +0000
X-Inumbo-ID: 7a1b2b4c-a234-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7a1b2b4c-a234-11e9-8980-bc764e045a96;
 Tue, 09 Jul 2019 10:29:49 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k18so19019011ljc.11
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2019 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pQIq43nQCdpTgBjWiqk7kG2/egQd83z1apMbbrPPYrk=;
 b=r74X9MOQyfAKh4/5FUdCeN5BWdKrZITL/+EtQ3R3ir/yEkjxLeCKhsikOgyETS1OW5
 BYwCYtIxwuzVV3gJMeJYb0S9DNqreWSySUqQbZMdKsR8RtA1kkUs+7J803es5HZqhkob
 2FqCiZ4iwSiz4whz0hTul7QuKsokOyULm0PNDpczmCMXrApCi/+VNPa9MU8/uPc4jwU5
 FF+d7wU5XvMTSW8ZvdskJeZL5GNbKMhnLrXvKFon3ov7DRRGAuSA96HXqBN1sZPzFOvN
 Q2jx++FLYsQ0rqjnC9G0XM8ufijz2HRMEZkgh0m1JSw9o50NeJ/Q4oC4CEzkKWqolUpP
 8FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pQIq43nQCdpTgBjWiqk7kG2/egQd83z1apMbbrPPYrk=;
 b=toQVS0hLoHzsBje6PeJZ+5d/WcMKcYxIFkc0MwwMYTQHw9vUnkqxM/y0p3mA3ru6Co
 syrGo/dgN+q+cMPuDkIBKFbGImc0C1SJVuVvxz3Kn2K40Bciom7R0u56Z2fi0MIW0uPT
 PiEJ442kFCKhHMxePlVqZbYiuqedp1ks9znkhyEn/Re9Ll9qO5cFpJT7lk6GAcVjK2Y9
 n7lHDO3hVPt4BrUaAjp8kB/qSKKgK3UPQCTAaUTJ2Gf1pUyg2GoFzpf66WmKntpxcwZ4
 qIANGzI2QiO9y2K4VjpMwZ1kSt0KXF6wlQlfqtR/R4E98oKokYoxpM062nFwDn4FDL68
 Bv3w==
X-Gm-Message-State: APjAAAX8CwIJGVcnczXO1m9c0z6H07Z5EERVaEvCrAWIQtpdjlGqlPzl
 No9MlgCX0XhDzFzwXfnqbmQ=
X-Google-Smtp-Source: APXvYqybO9NiQN7dp8VoX3d4EwUl8FqxEkA3FbyxYaTk4tAEhlvtIt8UGiZoGE8fe7aS4Z/ULtOFNQ==
X-Received: by 2002:a2e:3807:: with SMTP id f7mr2146237lja.87.1562668187740;
 Tue, 09 Jul 2019 03:29:47 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m25sm2524910lfc.83.2019.07.09.03.29.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 03:29:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-5-sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <89310c95-f697-a1b7-b63c-492307fa80d1@gmail.com>
Date: Tue, 9 Jul 2019 13:29:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190621235608.2153-5-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIyLjA2LjE5IDAyOjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSwgU3RlZmFu
bwoKPiBEb24ndCBhbGxvdyByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0byBiZSByZW1hcHBlZCBp
bnRvIGFueSBndWVzdHMsCj4gdW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgYXJlIHByb3Bl
cmx5IHN1cHBvcnRlZCBpbiBYZW4uIEZvciBub3csCj4gZG8gbm90IGNhbGwgaW9tZW1fcGVybWl0
X2FjY2VzcyBmb3IgdGhlbS4KPgo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3RlZmFub3NAeGlsaW54LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHY0Ogo+IC0gbmV3IHBhdGNo
Cj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyMyArKysrKysrKysrKysr
KystLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVu
L2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggZDk4MzY3NzlkMS4uNzZkZDRiZjZmOSAx
MDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysgYi94ZW4vYXJj
aC9hcm0vZG9tYWluX2J1aWxkLmMKPiBAQCAtMTE1OCwxNSArMTE1OCwyMiBAQCBzdGF0aWMgaW50
IF9faW5pdCBtYXBfcmFuZ2VfdG9fZG9tYWluKGNvbnN0IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAq
ZGV2LAo+ICAgICAgIGJvb2wgbmVlZF9tYXBwaW5nID0gIWR0X2RldmljZV9mb3JfcGFzc3Rocm91
Z2goZGV2KTsKPiAgICAgICBpbnQgcmVzOwo+ICAgCj4gLSAgICByZXMgPSBpb21lbV9wZXJtaXRf
YWNjZXNzKGQsIHBhZGRyX3RvX3BmbihhZGRyKSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRkciArIGxlbiAtIDEpKSk7Cj4gLSAgICBp
ZiAoIHJlcyApCj4gKyAgICAvKgo+ICsgICAgICogRG9uJ3QgZ2l2ZSBpb21lbSBwZXJtaXNzaW9u
cyBmb3IgcmVzZXJ2ZWQtbWVtb3J5IHJhbmdlcyB1bnRpbAo+ICsgICAgICogcmVzZXJ2ZWQtbWVt
b3J5IHN1cHBvcnQgaXMgY29tcGxldGUuCj4gKyAgICAgKi8KPiArICAgIGlmICggc3RyY21wKGR0
X25vZGVfbmFtZShkZXYpLCAicmVzZXJ2ZWQtbWVtb3J5IikgKQoKVGhpcyBmaWx0ZXIgZG9lc24n
dCBjYXRjaCBjaGlsZCBub2RlcyBpZiB0aGUgInJlc2VydmVkLW1lbW9yeSIgbm9kZSBoYXMgCm9u
ZXMuCgpIZXJlIGlzIG15ICJyZXNlcnZlZC1tZW1vcnkiIG5vZGU6CgpyZXNlcnZlZC1tZW1vcnkg
ewogwqDCoMKgIMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwyPjsKIMKgwqDCoCDCoMKgwqAgI3Np
emUtY2VsbHMgPSA8Mj47CiDCoMKgwqAgwqDCoMKgIHJhbmdlczsKCiDCoMKgwqAgwqDCoMKgIC8q
IGRldmljZSBzcGVjaWZpYyByZWdpb24gZm9yIExvc3N5IERlY29tcHJlc3Npb24gKi8KIMKgwqDC
oCDCoMKgwqAgbG9zc3lfZGVjb21wcmVzczogbGludXgsbG9zc3lfZGVjb21wcmVzc0A1NDAwMDAw
MCB7CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCBuby1tYXA7CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCBy
ZWcgPSA8MHgwMDAwMDAwMCAweDU0MDAwMDAwIDB4MCAweDAzMDAwMDAwPjsKIMKgwqDCoCDCoMKg
wqAgfTsKCiDCoMKgwqAgwqDCoMKgIC8qIEZvciBBdWRpbyBEU1AgKi8KIMKgwqDCoCDCoMKgwqAg
YWRzcF9yZXNlcnZlZDogbGludXgsYWRzcEA1NzAwMDAwMCB7CiDCoMKgwqAgwqDCoMKgIMKgwqDC
oCBjb21wYXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCBy
ZXVzYWJsZTsKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHJlZyA9IDwweDAwMDAwMDAwIDB4NTcwMDAw
MDAgMHgwIDB4MDEwMDAwMDA+OwogwqDCoMKgIMKgwqDCoCB9OwoKIMKgwqDCoCDCoMKgwqAgLyog
Z2xvYmFsIGF1dG9jb25maWd1cmVkIHJlZ2lvbiBmb3IgY29udGlndW91cyBhbGxvY2F0aW9ucyAq
LwogwqDCoMKgIMKgwqDCoCBsaW51eCxjbWFANTgwMDAwMDAgewogwqDCoMKgIMKgwqDCoCDCoMKg
wqAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwogwqDCoMKgIMKgwqDCoCDCoMKgwqAg
cmV1c2FibGU7CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCByZWcgPSA8MHgwMDAwMDAwMCAweDU4MDAw
MDAwIDB4MCAweDE4MDAwMDAwPjsKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIGxpbnV4LGNtYS1kZWZh
dWx0OwogwqDCoMKgIMKgwqDCoCB9OwoKIMKgwqDCoCDCoMKgwqAgLyogZGV2aWNlIHNwZWNpZmlj
IHJlZ2lvbiBmb3IgY29udGlndW91cyBhbGxvY2F0aW9ucyAqLwogwqDCoMKgIMKgwqDCoCBtbXBf
cmVzZXJ2ZWQ6IGxpbnV4LG11bHRpbWVkaWFANzAwMDAwMDAgewogwqDCoMKgIMKgwqDCoCDCoMKg
wqAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwogwqDCoMKgIMKgwqDCoCDCoMKgwqAg
cmV1c2FibGU7CiDCoMKgwqAgwqDCoMKgIMKgwqDCoCByZWcgPSA8MHgwMDAwMDAwMCAweDcwMDAw
MDAwIDB4MCAweDEwMDAwMDAwPjsKIMKgwqDCoCDCoMKgwqAgfTsKIMKgwqDCoCB9OwoKClNvLCB0
aGUgZHRfbm9kZV9uYW1lKGRldikgZm9yIGNoaWxkIG5vZGVzIGFyZToKCi0gbGludXgsbG9zc3lf
ZGVjb21wcmVzcwotIGxpbnV4LGFkc3AKLSBsaW51eCxjbWEKLSBsaW51eCxtdWx0aW1lZGlhCgoK
UHJvYmFibHksIHdlIHNob3VsZCBjaGVjayB3aGV0aGVyIHRoZSBwYXJlbnQgbm9kZSBpcyAicmVz
ZXJ2ZWQtbWVtb3J5IiAKYXMgd2VsbC4KCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hl
bmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
