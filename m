Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AA57DB7E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 14:30:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htAAk-0003zJ-6H; Thu, 01 Aug 2019 12:27:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htAAi-0003zE-Uc
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 12:27:05 +0000
X-Inumbo-ID: aadc9b23-b457-11e9-8980-bc764e045a96
Received: from mail-io1-xd44.google.com (unknown [2607:f8b0:4864:20::d44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aadc9b23-b457-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 12:27:03 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id q22so24060792iog.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FjEXGgJ05cZtvIbXMj6Jwf/ABrFcdgLgvDDQESGAeTs=;
 b=IvBwJOILzjyAWKa3V5JMt1qvSz87itY2Ezq2ujzL+/VtKkCmi5LGTo/CFP9NKiPkjy
 VxCWTuVVmVIsPPJtrkdPO4dUwl6067VMBAneQj/gg9IgnfsItDCet57J9jSObN67qZhW
 xSMs28X8fBzKPyq9Zw16QbRWpM6JeZgT0E+q8p2MHo9hiDUss9YQzMQFviStCgwXEKaL
 YH50Oapolqt3/ani6XA4q2PpRItvBGhwjhJwuWGGadH+6Qtyvy1yyG7FyKUXQImeLupB
 o6miejWbCjjJQm+MUumuQ3zqD7339NHstwhT8HVyuQwwQ5PjXgJfRy0FeL04OtrXXPWZ
 st+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FjEXGgJ05cZtvIbXMj6Jwf/ABrFcdgLgvDDQESGAeTs=;
 b=U+cnZWjLYt/efRLL3tCyLe+oWOtIvaE+m0Zj5k56a3og5afhepE4mWipnn+2Ptt155
 woDy820KdDUdfTlJSdvM/TkJKrSf9txwiR+6+yMHJuZ5XI9aukju14Q7J7QQC1/8ey8x
 +xeWiB2yDSUnrVqnYyTEN4QhcaeAdRy/5lT7iQuOxDB8hUDpsrxrEzvBr6i8WZJVCA26
 73Wvif0jPpTtI8GX4AX28MBtLUcKidjUpngbaEIBs9qh8Ed1GsfU+SNqMO7d7QfqyeQe
 ENlUdSYVN1wAVrZ6pzIjSa8anG8q+imSbUw3OCASso12MqYB5Il2Iz11qUJuYJTfx0yW
 tbEw==
X-Gm-Message-State: APjAAAX1sslSeUVxjNG9lZQnTMnAK1Eg97FStq2oKYko/Oqjcvw8yht4
 eS3Y1lJ7+j27o15XxF/qoj1rwIfo5TOoYHVgEIg=
X-Google-Smtp-Source: APXvYqzPEPNX8Oi0IcTRug9ps+sdALQA2G0qm2zeCSbxVaI97mqNWKycqWvlNwJuOTB0dJHOyO0JewxQs37viXE1Yjw=
X-Received: by 2002:a6b:ba88:: with SMTP id k130mr3452557iof.212.1564662423020; 
 Thu, 01 Aug 2019 05:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
 <878sseieu1.fsf@epam.com>
 <CAOcoXZatOXLnvYjum+EGCwnxDRUG1eGJbeENQcSyNYX6JXFizw@mail.gmail.com>
 <15e988be-80bd-f729-ea39-8e7cbc16007f@arm.com>
In-Reply-To: <15e988be-80bd-f729-ea39-8e7cbc16007f@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 1 Aug 2019 15:26:52 +0300
Message-ID: <CAOcoXZZbu5-RSJxM8jzDh4EQbq8O11prOkJfrrzqWT45ppCzFQ@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen/arm: extend
 fdt_property_interrupts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuIGFuZCBWb2xvZHlteXIsCgpPbiBXZWQsIEp1bCAzMSwgMjAxOSBhdCAzOjUyIFBN
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiA+
PiBJdCBpcyByZWNvbW1lbmRlZCAoYW5kIHByb2JhYmx5IHJlcXVpcmVkLCBidXQgSSBjYW4ndCBm
aW5kIGV4YWN0IHBsYWNlCj4gPj4gaW4gdGhlIHJ1bGVzKSB0byBpbmNsdWRlIGNvdmVyIGxldHRl
ciBpZiB5b3UgYXJlIHNlbmRpbmcgbW9yZSB0aGF0IG9uZQo+ID4+IHBhdGNoIGluIHNlcmllcy4g
VGhpcyB3aWxsIGVhc2UgdXAgcmV2aWV3IHByb2Nlc3MsIGJlY2F1c2UgcmV2aWV3ZXIgd2lsbAo+
ID4+IGtub3cgd2hhdCB0byBleHBlY3QgaW4gdGhlIHNlcmllcy4KPiA+ICA+IFRoZXJlIGlzIG5v
IHN1Y2ggcmVxdWlyZW1lbnQsIG9ubHkgcmVjb21tZW5kYXRpb24uCj4KPiBJdCBpcyBhIHN0cm9u
ZyByZWNvbW1lbmRhdGlvbjogIklmIHlvdSBuZWVkIHRvIHNlbmQgbW9yZSB0aGFuIG9uZSBwYXRj
aGVzICh3aGljaAo+IG5vcm1hbGx5IG1lYW5zIHlvdSdyZSBzZW5kaW5nIGEgcGF0Y2ggc2VyaWVz
IHdpdGggY292ZXIgbGV0dGVyKSwiLgo+Cj4gPiBJIGRpZCBub3QgcHV0IGl0IHNpbmNlIHRoaXMg
aXMgc2ltcGxlIHNob3J0IHBhdGNoIHNlcmllcyBhbmQgYm90aAo+ID4gcGF0Y2hlcyBpbiB0aGlz
IHNlcmllcyBoYXZlIGJlZW4gZGlzY3Vzc2VkIHByZXZpb3VzbHksIHNvIGl0IGlzIGtub3duCj4g
PiB3aGF0IGl0IGlzIGFib3V0Lgo+Cj4gRm9yIGEgZmlyc3QsIGlmIHlvdSBkb24ndCBoYXZlIGEg
Y292ZXIgbGV0dGVyIHRoZW4gdGhlIHRocmVhZGluZyBpbiBlLW1haWwKPiBjbGllbnQgd291bGQg
bG9vayB3ZWlyZDoKPiAgICAgW1BBVENIIHY0IDEvMl0geGVuL2FybTogZXh0ZW5kIGZkdF9wcm9w
ZXJ0eV9pbnRlcnJ1cHRzCj4gICAgICAgIHwtPiBbUEFUQ0ggdjQgMi8yXSB4ZW4vYXJtOiBtZXJn
ZSBtYWtlX3RpbWVyX25vZGUgYW5kIG1ha2VfdGltZXJfZG9tVV9ub2RlCj4KPiBJIHRlbmQgdG8g
aGlkIGFueXRoaW5nIHdpdGhpbiB0aGUgdGhyZWFkIHNvIEkgaGF2ZSBvbmx5IG9uZSB0aXRsZS4g
Rm9yIHRoZSB0aXRsZQo+IGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aGF0J3MgdGhlIHB1cnBvc2Ug
b2YgdGhlIGUtbWFpbC4KPgo+IFRoZSBjb3ZlciBsZXR0ZXIgaXMgYWxzbyB1c2VkIHRvIGtlZXAg
YSBzdW1tYXJ5IG9mIHdoYXQgd2FzIGRpc2N1c3NlZCBhbmQgdGhlCj4gb3ZlcmFsbCBnb2FsLiBJ
dCBkb2VzIG5vdCBtYXR0ZXIgaWYgaXQgaXMganVzdCBhIGZldyBsaW5lcy4gVGhpcyBpcyBhbHNv
IGEgZ29vZAo+IHBsYWNlIHRvIGhhdmUgYSBkaXNjdXNzaW9uIG9mIHRoZSBvdmVyYWxsIHNlcmll
cyAoaS5lIG5vdCBzcGVjaWZpYyB0byBhIHBhdGNoKS4KPgo+IExhc3RseSwgeW91IG1heSBoYXZl
IG5ldyByZXZpZXdlcnMgdGhhdCBoYXZlbid0IGZvbGxvd2VkIHRoZSBwcmV2aW91cwo+IGRpc2N1
c3Npb24uIFlvdSBoYXZlIGFsc28gcmV2aWV3ZXJzIGxpa2UgbWUgd2hpY2ggcmVjZWl2ZSBhIGZl
dyBodW5kcmVkcyBlLW1haWxzCj4gcGVyIHdlZWsgKGp1c3QgY291bnRpbmcgbXkgaW5ib3ggc28g
ZS1tYWlsIEkgYW0gQ0NlZCB0bykuIFdoaWxlIEkgaGF2ZSBhIGdvb2QKPiBtZW1vcnksIEkgY2Fu
J3QgcG9zc2libHkgcmVtZW1iZXIgZXZlcnl0aGluZyBzaW5nbGUgZS1tYWlscy4KPgo+IFNvIHRo
ZSBjb3ZlciBsZXR0ZXIgaXMgYSBnb29kIHBsYWNlIHRvIGV4cGxhaW4gd2hhdCBjaGFuZ2VzIGhh
dmUgYmVlbiBkb25lCj4gYmV0d2VlbiBzZXJpZXMuIFlvdSBjYW4gYWxzbyBkbyB0aGF0IHBlci1w
YXRjaC4KPgo+IFNwZWFraW5nIGFib3V0IGNoYW5nZWxvZywgSSB3b3VsZCBoaWdobHkgcmVjb21t
ZW5kIHRvIGtlZXAgYWxsIHRoZSBjaGFuZ2Vsb2cKPiBmcm9tIHYxLiBUaGlzIGdpdmVzIHVzIGFu
IGlkZWEgd2hhdCBoYXBwZW4gb3ZlciB0aGUgcmV2aWV3LgoKVGhhbmsgeW91IGZvciB0aGlzIGdy
ZWF0IGFuZCBkZXRhaWxlZCBhcmd1bWVudGF0aW9uIHByb3ZpZGVkLiBJdCBtYWtlcwpzZW5zZSwg
c28gcHJvYmFibHkgWGVuIHBhdGNoZXMgd2lraSBzaG91bGQgYmUgdXBkYXRlZCB3aXRoIHRoaXMK
aW5mb3JtYXRpb24gYW5kIGNvdmVyIGxldHRlciBzaG91bGQgYmVjb21lIG5vdCBhIHJlY29tbWVu
ZGF0aW9uLCBidXQgYQpydWxlLgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
