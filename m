Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705181206BF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 14:13:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igqAL-0000Ms-VA; Mon, 16 Dec 2019 13:12:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DHV3=2G=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1igqAK-0000MR-Sv
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 13:12:00 +0000
X-Inumbo-ID: 9f087ef0-2005-11ea-88e7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9f087ef0-2005-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 13:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576501910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ib4GLxFZXzsZYq5vhvW4dRSucJEdW9kOkRYUP32unpw=;
 b=CS0WjJ7axahi3lqEysnM1Ct1PJFpEBs6mD9EMOrxQzPvJcBXYXT9Vw6G0kYDGj28CZGQll
 NEqNb3qgL3mcw3+7/sFWweEXJK3XRXTWFc2+svGKlZcBMsi6okTeasqG8IgoyWThbeN/Wm
 lYqFknIpyEge3RNSAy8l3xWTqH88MPI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-lo9DSbgEMb6GgUNRsFopTQ-1; Mon, 16 Dec 2019 08:11:48 -0500
Received: by mail-wm1-f71.google.com with SMTP id m133so1005421wmf.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 05:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=75YfmPUd8IxShkS7a0b2Ig4I+aTSu5nF6jxguOhk6cM=;
 b=m3hKtirH1YaBk/O8ianYUSWTP668ZqO6i903kCzPUl4piu7NpadcoiTkrTvx3/3bjZ
 PAMAfFviLVTmHvVFq40+JQKEVqmLpnKEMQoT9yPiCfs/SAVG/Hk8KectMucJfBDpimmV
 MjerMfYkNg5N3RMlF7Ero4sRpSXyGBxuFjuaFAtYYNT1xlBlGgF3cNzgMjUtxhAJvg6P
 Ef0TTK/naEiCbtrkWbCzXbNv/GwXtajRLf7hksvxwlCjMWnViOBp0x3BpKKD4SVyZ1Ss
 WQTQvgg1z+MQe/6HwlyEl3QDokDpYl1D0BXymNnqF+/e2uBaZ+4gi85YYa055QWCDbp/
 UeqQ==
X-Gm-Message-State: APjAAAUjgnydhOhH3jPqaWY/JlJMrkL1OzAbkJhxVEiT6UA8kDcoExsS
 x6cSFGoKfNRv0jysfoy9sifF1lW9K7WkrJ86xm7yj0UV+lSgUfK9iKdiVxSJ2Sr5Tw/c5NU7EZo
 ZBz/QsPUTELolwqc4iTFLzLmHYWQ=
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr29258087wrw.327.1576501907532; 
 Mon, 16 Dec 2019 05:11:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuIcoQzrLz1xC87UatN3jXBE3T8LoVif4M67IAzWtqOxR+SyLrgYTkIoP4IoF7SSSnGn/e5g==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr29258050wrw.327.1576501907281; 
 Mon, 16 Dec 2019 05:11:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:cde8:2463:95a9:1d81?
 ([2001:b07:6468:f312:cde8:2463:95a9:1d81])
 by smtp.gmail.com with ESMTPSA id t190sm12609330wmt.44.2019.12.16.05.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 05:11:46 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191213161753.8051-1-philmd@redhat.com>
 <20191213161753.8051-9-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3e4ef8f0-4ccf-65c8-35ec-95bc6cf4e3d0@redhat.com>
Date: Mon, 16 Dec 2019 14:11:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191213161753.8051-9-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: lo9DSbgEMb6GgUNRsFopTQ-1
X-Mimecast-Spam-Score: 0
Subject: Re: [Xen-devel] [PATCH 08/12] hw/ide/piix: Use ARRAY_SIZE() instead
 of magic numbers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTIvMTkgMTc6MTcsIFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIHdyb3RlOgo+IFVzaW5n
IG1hZ2ljIG51bWJlcnMgaXMgZGFuZ2Vyb3VzIGJlY2F1c2UgdGhlIHN0cnVjdHVyZXMgUENJSURF
U3RhdGUKPiBtaWdodCBiZSBtb2RpZmllZCBhbmQgdGhpcyBzb3VyY2UgZmlsZSBjb25zdW1pbmcg
dGhlICJpZGUvcGNpLmgiCj4gaGVhZGVyIHdvdWxkIGJlIG91dCBvZiBzeW5jLCBldmVudHVhbGx5
IGFjY2Vzc2luZyBvdXQgb2YgYm91bmQKPiBhcnJheSBtZW1iZXJzLgo+IFVzZSB0aGUgQVJSQVlf
U0laRSgpIHRvIGtlZXAgdGhlIHNvdXJjZSBmaWxlIHN5bmMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgo+IC0tLQo+ICBody9p
ZGUvcGlpeC5jIHwgMjYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9o
dy9pZGUvcGlpeC5jIGIvaHcvaWRlL3BpaXguYwo+IGluZGV4IGZmZWZmNGUwOTUuLmFiMjM2MTNh
NDQgMTAwNjQ0Cj4gLS0tIGEvaHcvaWRlL3BpaXguYwo+ICsrKyBiL2h3L2lkZS9waWl4LmMKPiBA
QCAtODcsMTAgKzg3LDkgQEAgc3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBwaWl4X2JtZG1h
X29wcyA9IHsKPiAgCj4gIHN0YXRpYyB2b2lkIGJtZG1hX3NldHVwX2JhcihQQ0lJREVTdGF0ZSAq
ZCkKPiAgewo+IC0gICAgaW50IGk7Cj4gLQo+ICAgICAgbWVtb3J5X3JlZ2lvbl9pbml0KCZkLT5i
bWRtYV9iYXIsIE9CSkVDVChkKSwgInBpaXgtYm1kbWEtY29udGFpbmVyIiwgMTYpOwo+IC0gICAg
Zm9yKGkgPSAwO2kgPCAyOyBpKyspIHsKPiArCj4gKyAgICBmb3IgKHNpemVfdCBpID0gMDsgaSA8
IEFSUkFZX1NJWkUoZC0+Ym1kbWEpOyBpKyspIHsKPiAgICAgICAgICBCTURNQVN0YXRlICpibSA9
ICZkLT5ibWRtYVtpXTsKPiAgCj4gICAgICAgICAgbWVtb3J5X3JlZ2lvbl9pbml0X2lvKCZibS0+
ZXh0cmFfaW8sIE9CSkVDVChkKSwgJnBpaXhfYm1kbWFfb3BzLCBibSwKPiBAQCAtMTA3LDkgKzEw
Niw4IEBAIHN0YXRpYyB2b2lkIHBpaXhfaWRlX3Jlc2V0KERldmljZVN0YXRlICpkZXYpCj4gICAg
ICBQQ0lJREVTdGF0ZSAqZCA9IFBDSV9JREUoZGV2KTsKPiAgICAgIFBDSURldmljZSAqcGQgPSBQ
Q0lfREVWSUNFKGQpOwo+ICAgICAgdWludDhfdCAqcGNpX2NvbmYgPSBwZC0+Y29uZmlnOwo+IC0g
ICAgaW50IGk7Cj4gIAo+IC0gICAgZm9yIChpID0gMDsgaSA8IDI7IGkrKykgewo+ICsgICAgZm9y
IChzaXplX3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGQtPmJ1cyk7IGkrKykgewo+ICAgICAgICAg
IGlkZV9idXNfcmVzZXQoJmQtPmJ1c1tpXSk7Cj4gICAgICB9Cj4gIAo+IEBAIC0xMzIsMTAgKzEz
MCwxMCBAQCBzdGF0aWMgdm9pZCBwY2lfcGlpeF9pbml0X3BvcnRzKFBDSUlERVN0YXRlICpkKSB7
Cj4gICAgICAgICAgezB4MWYwLCAweDNmNiwgMTR9LAo+ICAgICAgICAgIHsweDE3MCwgMHgzNzYs
IDE1fSwKPiAgICAgIH07Cj4gLSAgICBpbnQgaTsKPiAgCj4gLSAgICBmb3IgKGkgPSAwOyBpIDwg
MjsgaSsrKSB7Cj4gLSAgICAgICAgaWRlX2J1c19uZXcoJmQtPmJ1c1tpXSwgc2l6ZW9mKGQtPmJ1
c1tpXSksIERFVklDRShkKSwgaSwgMik7Cj4gKyAgICBmb3IgKHNpemVfdCBpID0gMDsgaSA8IEFS
UkFZX1NJWkUoZC0+YnVzKTsgaSsrKSB7Cj4gKyAgICAgICAgaWRlX2J1c19uZXcoJmQtPmJ1c1tp
XSwgc2l6ZW9mKGQtPmJ1c1tpXSksIERFVklDRShkKSwgaSwKPiArICAgICAgICAgICAgICAgICAg
ICBBUlJBWV9TSVpFKGQtPmJ1c1swXS5pZnMpKTsKPiAgICAgICAgICBpZGVfaW5pdF9pb3BvcnQo
JmQtPmJ1c1tpXSwgTlVMTCwgcG9ydF9pbmZvW2ldLmlvYmFzZSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgcG9ydF9pbmZvW2ldLmlvYmFzZTIpOwo+ICAgICAgICAgIGlkZV9pbml0MigmZC0+
YnVzW2ldLCBpc2FfZ2V0X2lycShOVUxMLCBwb3J0X2luZm9baV0uaXNhaXJxKSk7Cj4gQEAgLTE2
MywxNCArMTYxLDEzIEBAIHN0YXRpYyB2b2lkIHBjaV9waWl4X2lkZV9yZWFsaXplKFBDSURldmlj
ZSAqZGV2LCBFcnJvciAqKmVycnApCj4gIAo+ICBpbnQgcGNpX3BpaXgzX3hlbl9pZGVfdW5wbHVn
KERldmljZVN0YXRlICpkZXYsIGJvb2wgYXV4KQo+ICB7Cj4gLSAgICBQQ0lJREVTdGF0ZSAqcGNp
X2lkZTsKPiArICAgIFBDSUlERVN0YXRlICpwY2lfaWRlID0gUENJX0lERShkZXYpOwo+ICAgICAg
RHJpdmVJbmZvICpkaTsKPiAtICAgIGludCBpOwo+ICAgICAgSURFRGV2aWNlICppZGVkZXY7Cj4g
KyAgICBjb25zdCBzaXplX3QgaWRlZGV2X21heCA9IEFSUkFZX1NJWkUocGNpX2lkZS0+YnVzKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBBUlJBWV9TSVpFKHBjaV9pZGUtPmJ1c1sw
XS5pZnMpOwo+ICAKPiAtICAgIHBjaV9pZGUgPSBQQ0lfSURFKGRldik7Cj4gLQo+IC0gICAgZm9y
IChpID0gYXV4ID8gMSA6IDA7IGkgPCA0OyBpKyspIHsKPiArICAgIGZvciAoc2l6ZV90IGkgPSBh
dXggPyAxIDogMDsgaSA8IGlkZWRldl9tYXg7IGkrKykgewo+ICAgICAgICAgIGRpID0gZHJpdmVf
Z2V0X2J5X2luZGV4KElGX0lERSwgaSk7Cj4gICAgICAgICAgaWYgKGRpICE9IE5VTEwgJiYgIWRp
LT5tZWRpYV9jZCkgewo+ICAgICAgICAgICAgICBCbG9ja0JhY2tlbmQgKmJsayA9IGJsa19ieV9s
ZWdhY3lfZGluZm8oZGkpOwo+IEBAIC0yMTAsOSArMjA3LDggQEAgUENJRGV2aWNlICpwY2lfcGlp
eDNfeGVuX2lkZV9pbml0KFBDSUJ1cyAqYnVzLCBEcml2ZUluZm8gKipoZF90YWJsZSwgaW50IGRl
dmZuKQo+ICBzdGF0aWMgdm9pZCBwY2lfcGlpeF9pZGVfZXhpdGZuKFBDSURldmljZSAqZGV2KQo+
ICB7Cj4gICAgICBQQ0lJREVTdGF0ZSAqZCA9IFBDSV9JREUoZGV2KTsKPiAtICAgIHVuc2lnbmVk
IGk7Cj4gIAo+IC0gICAgZm9yIChpID0gMDsgaSA8IDI7ICsraSkgewo+ICsgICAgZm9yIChzaXpl
X3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGQtPmJtZG1hKTsgKytpKSB7Cj4gICAgICAgICAgbWVt
b3J5X3JlZ2lvbl9kZWxfc3VicmVnaW9uKCZkLT5ibWRtYV9iYXIsICZkLT5ibWRtYVtpXS5leHRy
YV9pbyk7Cj4gICAgICAgICAgbWVtb3J5X3JlZ2lvbl9kZWxfc3VicmVnaW9uKCZkLT5ibWRtYV9i
YXIsICZkLT5ibWRtYVtpXS5hZGRyX2lvcG9ydCk7Cj4gICAgICB9Cj4gCgpRdWV1ZWQsIHRoYW5r
cy4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
