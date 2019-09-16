Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55F3B401D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 20:15:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9vT7-0003v4-7t; Mon, 16 Sep 2019 18:11:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xTZH=XL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i9vT5-0003uu-JM
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 18:11:19 +0000
X-Inumbo-ID: 6125e36a-d8ad-11e9-b299-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6125e36a-d8ad-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 18:11:18 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u28so713555lfc.5
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2019 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=aclzkk6t7NAudoS97ez7yUJIhyllrT8NJ8PkuZNXdL4=;
 b=DUQBajy47b70rLKi6B+PeWvBveQLpsG58R4iJuqqGYQHkuSQ2n5/EUrzEaNLT3vPtB
 kvlSfSXRk7D1iXFMbrO0rZi6TZymgIyku9Pped0btQ8rbHlnea0pLRda9US2IEs2M79N
 9zNqp9G1Sg8lGqj/SdbAdsU7bUibKqOdxb/mkZMPBOQLmG+nq74/pdWQb1O6dAxceK/p
 IFAB8V7gbs23QvjBJwAJP3pshg4NMKrqi/ISpiW1rQyGh6R1bUBYwFP9DQRQlzJ4eUzy
 fw65FSaXYKwncOIUvNrUGq2NUnMe+aGbLJp0BpKcWhXN1xa6XKNkbk64vYp53uhc1qWt
 s97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=aclzkk6t7NAudoS97ez7yUJIhyllrT8NJ8PkuZNXdL4=;
 b=e9qXSdRy9jVBqtGhlbNeyHzw7klc1sQPBSCSPoAHGbPT7ka2opcyEYpvfNtEMzTci1
 g/l3m65ZIi80j4CMU9g7n3ZKeIY8749Udxs8QhrDv7rlT8YxxNpMkmucxW7BN255GgKe
 YMKKYxpQ1y4kazc5M4ALTSwjl5F+I7v3vuwH0IHHjOKU8vkvJmzP7b3Ypcer/dfUOP+t
 QmndBmwDpxvarBej4ckq0qcsXUogAwv7aVl4fCB5ALzQTCtOu37lvb+Pm/MNNhtsePEL
 moJa24yydlwuXcJzjXpxratdoJinclkW8i+RZLyupHOuRqvqohPMPSl/SMFv9fsXedF6
 wiLg==
X-Gm-Message-State: APjAAAUXbii28+I4XwG05cEyEAUmOfX5ZA9dpZ/D3aFZw0QuoDFTxtMj
 PNp+nJV9r23hMqx1LKqTdSU=
X-Google-Smtp-Source: APXvYqzP8XcHH3Kwr1p3W0YG+ExeboIj1flRSpB3g2T/ExoYiVbM3jpuG05FLUgkIcnkiIICY9wV/w==
X-Received: by 2002:ac2:5181:: with SMTP id u1mr433801lfi.114.1568657477790;
 Mon, 16 Sep 2019 11:11:17 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w13sm4418588ljh.104.2019.09.16.11.11.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 11:11:17 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-6-git-send-email-olekstysh@gmail.com>
 <e27f519a-465f-58b9-b517-67c23cb85444@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <79a765a6-c3be-bb52-611d-ceddc3837a22@gmail.com>
Date: Mon, 16 Sep 2019 21:11:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e27f519a-465f-58b9-b517-67c23cb85444@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 5/8] xen/common: Introduce
 xrealloc_flex_struct() helper macros
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE2LjA5LjE5IDEzOjM3LCBKYW4gQmV1bGljaCB3cm90ZToKCkhpLCBKYW4KCj4gT24gMTMu
MDkuMjAxOSAxNzozNSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+IC0tLSBhL3hlbi9p
bmNsdWRlL3hlbi94bWFsbG9jLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3htYWxsb2MuaAo+
PiBAQCAtMzUsNiArMzUsMTUgQEAKPj4gICAjZGVmaW5lIHh6YWxsb2NfYXJyYXkoX3R5cGUsIF9u
dW0pIFwKPj4gICAgICAgKChfdHlwZSAqKV94emFsbG9jX2FycmF5KHNpemVvZihfdHlwZSksIF9f
YWxpZ25vZl9fKF90eXBlKSwgX251bSkpCj4+ICAgCj4+ICsvKiBBbGxvY2F0ZSBzcGFjZSBmb3Ig
YSBzdHJ1Y3R1cmUgd2l0aCBhIGZsZXhpYmxlIGFycmF5IG9mIHR5cGVkIG9iamVjdHMuICovCj4+
ICsjZGVmaW5lIHhtYWxsb2NfZmxleF9zdHJ1Y3QodHlwZSwgZmllbGQsIG5yKSBcCj4+ICsgICAg
KHR5cGUgKilfeG1hbGxvYyhvZmZzZXRvZih0eXBlLCBmaWVsZFtucl0pLCBfX2FsaWdub2ZfXyh0
eXBlKSkKPj4gKwo+PiArLyogUmUtYWxsb2NhdGUgc3BhY2UgZm9yIGEgc3RydWN0dXJlIHdpdGgg
YSBmbGV4aWJsZSBhcnJheSBvZiB0eXBlZCBvYmplY3RzLiAqLwo+PiArI2RlZmluZSB4cmVhbGxv
Y19mbGV4X3N0cnVjdChwdHIsIGZpZWxkLCBucikgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
Pj4gKyAgICAodHlwZW9mKHB0cikpX3hyZWFsbG9jKHB0ciwgb2Zmc2V0b2YodHlwZW9mKCoocHRy
KSksIGZpZWxkW25yXSksICBcCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2FsaWdu
b2ZfXyh0eXBlb2YoKihwdHIpKSkpCj4gV2l0aCB0aGUgbWlzc2luZyBwYXJlbnRoZXNlcyBhcm91
bmQgdGhlIGVudGlyZSBjb25zdHJ1Y3RzIGFkZGVkCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rIHlvdS4KCgo+IEknZCBsaWtlIHRvIG5vdGUgdGhv
dWdoIHRoYXQgaXQgc29ydCBvZiBmZWVscyBhcyBpZiB0aGlzIG5vdGF0aW9uCj4gaXNuJ3QgZ29p
bmcgdG8gcHJvdmlkZSBtYXhpbXVtIGZsZXhpYmlsaXR5LiBJIHRoZXJlZm9yZSB3b25kZXIKPiB3
aGV0aGVyIHRoZSBsYXN0IHR3byBwYXJhbWV0ZXJzIHNob3VsZG4ndCBiZSBjb21iaW5lZCwgcmVz
dWx0aW5nCj4gaW4gYW4gaW52b2NhdGlvbiBsaWtlCj4KPiAgICAgIHB0ciA9IHhtYWxsb2NfZmxl
eF9zdHJ1Y3Qoc3RydWN0IHMsIGZpZWxkWzVdKTsKPgo+IEJ1dCBJIHJlYWxpemUgdGhpcyB3b3Vs
ZCBhbGxvdyBmb3IgKG1vcmU7IEknbGwgcmVwbHkgdG8gcGF0Y2ggNgo+IGluIGEgbWludXRlKSBh
YnVzZSwgc28gdGhpcyB3b3VsZG4ndCBiZSBhIGNsZWFyIHdpbi4KCkFncmVlLgoKCi0tIApSZWdh
cmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
