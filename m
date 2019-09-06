Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1277EAB828
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 14:30:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6DKw-0004qH-8T; Fri, 06 Sep 2019 12:27:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tn+y=XB=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i6DKu-0004q9-Ba
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 12:27:32 +0000
X-Inumbo-ID: b23a7946-d0a1-11e9-978d-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b23a7946-d0a1-11e9-978d-bc764e2007e4;
 Fri, 06 Sep 2019 12:27:31 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a22so5862261ljd.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2019 05:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=voMncQMQ4YdYJSbQPybIZCy/AcK0j9pgJUBzJv0XJ0A=;
 b=sqTvZMOg0FK+tbQ5Twd8lIUIdl5cRw7f3mUvyMcKovHkLwtCNr+KhR8ryq4wVIDwmE
 MrBFX2gvgSY3HU2O7p/fa3kIFtwabChkkv1UJeIL2HzkjG5QPDhFYHq8EkK3B24Bgydv
 Fi2qkSQYUx9TdJxWg4stgkl9/pi/wDuDnFFyyRBx/kMYn9jJS/zdvJSGTuo1h2Temozf
 Nvf/Hnfjf2PuJ6a6jToQHWZwxuQcOEfdbQhKzPmea0lJsU/ZNqvBUb+imGx19W9r0HCK
 Hyvu0+zXQQzELhka7MTfPB6km6DSDMOt5IvIpqPyjyiI/acvmccpl7me4YJqAOCRVfA5
 PFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=voMncQMQ4YdYJSbQPybIZCy/AcK0j9pgJUBzJv0XJ0A=;
 b=fJs6zFtHV0Yw5vVU9xDCnKkjb9FXUhpdnsjqBpS/xnHJfRcjQk2zmv3BRlzQppVBMT
 Cs6DhQkRYRLRHRo//GZ268Att8xEt24l+RARHJ2uOg6jFJ/adzbsoOYoOeijDSXTHAkP
 y4cI0yHh7ZO5Qh1/MK4i+ziWtMh4iuvl+pY7K3VngcF+NNSoNW1bh+uxxIYdHf8iwQfR
 xEWRS5Cw6v04Hgfq6aZwXhZkqre9yFpdNxkpFJdD8gyj5ovsaNxoZnf0Y8XNfHYRQ9ZC
 eSShB2filDCZVdJI5ubQBZdDfp04tP4FR1C03xau+rGkwqtdKteE2U0MEPclbdwcAGFJ
 vnww==
X-Gm-Message-State: APjAAAX6R5us8ATllGOB/gq0NYejaaRr4FcDP/VhpZvdAaN5g6oV8tDG
 Nqb2REQG2UXrtPGNZ4UtmhjB4w1YwIdbTSsMLmU=
X-Google-Smtp-Source: APXvYqyqVi6A3SK9ZHo9Lzs4psldtYUrV3ugRoL85TI5Orqgiv42bAur5gdeHYcDQujEI1t/u7SSENxNihK+5Pwaths=
X-Received: by 2002:a2e:9602:: with SMTP id v2mr5657222ljh.215.1567772850472; 
 Fri, 06 Sep 2019 05:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <1567413598-4477-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1567413598-4477-1-git-send-email-jrdr.linux@gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 6 Sep 2019 17:57:19 +0530
Message-ID: <CAFqt6zYkFk55gzmfwMFzpWiOp0xP3DXdmWyO2Ce8+mqYW12SNw@mail.gmail.com>
To: konrad.wilk@oracle.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>, sstabellini@kernel.org
Subject: Re: [Xen-devel] [PATCH v2] swiotlb-xen: Convert to use macro
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMiwgMjAxOSBhdCAyOjA0IFBNIFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGlu
dXhAZ21haWwuY29tPiB3cm90ZToKPgo+IFJhdGhlciB0aGFuIHVzaW5nIHN0YXRpYyBpbnQgbWF4
X2RtYV9iaXRzLCB0aGlzCj4gY2FuIGJlIGNvdmVydGVkIHRvIHVzZSBhcyBtYWNyby4KPgo+IFNp
Z25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPgo+IFJl
dmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpJZiBpdCBpcyBzdGls
bCBub3QgbGF0ZSwgY2FuIHdlIGdldCB0aGlzIHBhdGNoIGluIHF1ZXVlIGZvciA1LjQgPwoKPiAt
LS0KPiAgZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwo+IGluZGV4
IGFlMWRmNDkuLmQxZWNlZDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4u
Ywo+ICsrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKPiBAQCAtMzgsNiArMzgsNyBAQAo+
ICAjaW5jbHVkZSA8YXNtL3hlbi9wYWdlLWNvaGVyZW50Lmg+Cj4KPiAgI2luY2x1ZGUgPHRyYWNl
L2V2ZW50cy9zd2lvdGxiLmg+Cj4gKyNkZWZpbmUgTUFYX0RNQV9CSVRTIDMyCj4gIC8qCj4gICAq
IFVzZWQgdG8gZG8gYSBxdWljayByYW5nZSBjaGVjayBpbiBzd2lvdGxiX3RibF91bm1hcF9zaW5n
bGUgYW5kCj4gICAqIHN3aW90bGJfdGJsX3N5bmNfc2luZ2xlXyosIHRvIHNlZSBpZiB0aGUgbWVt
b3J5IHdhcyBpbiBmYWN0IGFsbG9jYXRlZCBieSB0aGlzCj4gQEAgLTExNCw4ICsxMTUsNiBAQCBz
dGF0aWMgaW50IGlzX3hlbl9zd2lvdGxiX2J1ZmZlcihkbWFfYWRkcl90IGRtYV9hZGRyKQo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IG1heF9kbWFfYml0cyA9IDMyOwo+
IC0KPiAgc3RhdGljIGludAo+ICB4ZW5fc3dpb3RsYl9maXh1cCh2b2lkICpidWYsIHNpemVfdCBz
aXplLCB1bnNpZ25lZCBsb25nIG5zbGFicykKPiAgewo+IEBAIC0xMzUsNyArMTM0LDcgQEAgc3Rh
dGljIGludCBpc194ZW5fc3dpb3RsYl9idWZmZXIoZG1hX2FkZHJfdCBkbWFfYWRkcikKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAgKyAoaSA8PCBJT19UTEJfU0hJRlQpLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X29yZGVyKHNsYWJzIDw8IElPX1RMQl9T
SElGVCksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkbWFfYml0cywgJmRtYV9o
YW5kbGUpOwo+IC0gICAgICAgICAgICAgICB9IHdoaWxlIChyYyAmJiBkbWFfYml0cysrIDwgbWF4
X2RtYV9iaXRzKTsKPiArICAgICAgICAgICAgICAgfSB3aGlsZSAocmMgJiYgZG1hX2JpdHMrKyA8
IE1BWF9ETUFfQklUUyk7Cj4gICAgICAgICAgICAgICAgIGlmIChyYykKPiAgICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmM7Cj4KPiAtLQo+IDEuOS4xCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
