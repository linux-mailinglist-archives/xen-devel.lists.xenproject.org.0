Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3222B65E5F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 19:18:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlceA-0002EL-Ei; Thu, 11 Jul 2019 17:14:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X25k=VI=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hlce8-0002EG-Q6
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 17:14:16 +0000
X-Inumbo-ID: 4ecdab9a-a3ff-11e9-861e-e75918ef6127
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ecdab9a-a3ff-11e9-861e-e75918ef6127;
 Thu, 11 Jul 2019 17:14:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1562865254; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=lUS7E5uL6mUSW+H8B48yl/ovae5A6EP7tV5t5gAj/3Y=;
 b=vLpl0xFS3D8SeMjZrhc5EzObKpi6f1z4ZpXIkc/gSdGl5kI0X3kPXR8JO59sl9clGsk3Nq0g
 sTH6CVGbQoWpcsuM7/oCCnzmmUL53Gdb7SCM8rlxA9m7a6ak8orHsuWBM8tG6AVJdt92Y4wm
 qsGn4r/H8s5hzTG6+ZuB5WnDqQM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5d276e66.7ffa79a3f770-smtp-out-n02;
 Thu, 11 Jul 2019 17:14:14 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id p17so7105744wrf.11
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2019 10:14:13 -0700 (PDT)
X-Gm-Message-State: APjAAAVhmrerzGQUdEZ+OVtRWdp7cdzY+Ny3+cHrWa/v+HMGsGpzv6RF
 m8HrvWynZWakLaP+iK/vLSN8ok0ifMf87QHTiRM=
X-Google-Smtp-Source: APXvYqwnRiiF/Xw0WI8PD/wEUQPiFHTy+EwHJkQRAWih687Y19m17FdBSPblXfGqqG+/qmU5MB08YfbRolSjSQ0yqn8=
X-Received: by 2002:a5d:4212:: with SMTP id n18mr6101704wrq.261.1562865253211; 
 Thu, 11 Jul 2019 10:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190703105639.23081-1-aisaila@bitdefender.com>
In-Reply-To: <20190703105639.23081-1-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 11 Jul 2019 11:13:37 -0600
X-Gmail-Original-Message-ID: <CABfawhk19LTiO5bDbVMW2u1mmmnexNJS3Df=y6XtUzvKc8APvw@mail.gmail.com>
Message-ID: <CABfawhk19LTiO5bDbVMW2u1mmmnexNJS3Df=y6XtUzvKc8APvw@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBAQCAtNjI5LDYgKzY5NywxNCBAQCBzdGF0aWMgdm9pZCAqaHZtZW11bF9tYXBfbGluZWFyX2Fk
ZHIoCj4KPiAgICAgICAgICAgICAgQVNTRVJUKHAybXQgPT0gcDJtX3JhbV9sb2dkaXJ0eSB8fCAh
cDJtX2lzX3JlYWRvbmx5KHAybXQpKTsKPiAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgIGlmICgg
Y3Vyci0+YXJjaC52bV9ldmVudCAmJgo+ICsgICAgICAgICAgICBjdXJyLT5hcmNoLnZtX2V2ZW50
LT5zZW5kX2V2ZW50ICYmCgpXaHkgbm90IGZvbGQgdGhlc2UgY2hlY2tzIGludG8gaHZtX2VtdWxh
dGVfc2VuZF92bV9ldmVudCBzaW5jZS4uCgo+ICsgICAgICAgICAgICBodm1fZW11bGF0ZV9zZW5k
X3ZtX2V2ZW50KGFkZHIsIGdmbiwgcGZlYykgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAg
ZXJyID0gRVJSX1BUUih+WDg2RU1VTF9SRVRSWSk7Cj4gKyAgICAgICAgICAgIGdvdG8gb3V0Owo+
ICsgICAgICAgIH0KPiAgICAgIH0KPgo+ICAgICAgLyogRW50aXJlIGFjY2VzcyB3aXRoaW4gYSBz
aW5nbGUgZnJhbWU/ICovCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gaW5kZXggMDI5ZWVhM2I4NS4uNzgzZWJjMzUyNSAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2
bS9odm0uYwo+IEBAIC0zMjI0LDYgKzMyMjQsMTQgQEAgc3RhdGljIGVudW0gaHZtX3RyYW5zbGF0
aW9uX3Jlc3VsdCBfX2h2bV9jb3B5KAo+ICAgICAgICAgICAgICByZXR1cm4gSFZNVFJBTlNfYmFk
X2dmbl90b19tZm47Cj4gICAgICAgICAgfQo+Cj4gKyAgICAgICAgaWYgKCB1bmxpa2VseSh2LT5h
cmNoLnZtX2V2ZW50KSAmJgo+ICsgICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50LT5zZW5kX2V2
ZW50ICYmCgouLiB5b3Ugc2VlbSB0byBqdXN0IHJlcGVhdCB0aGVtIGhlcmUgYWdhaW4/Cgo+ICsg
ICAgICAgICAgICBodm1fZW11bGF0ZV9zZW5kX3ZtX2V2ZW50KGFkZHIsIGdmbiwgcGZlYykgKQo+
ICsgICAgICAgIHsKPiArICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4gKyAgICAgICAgICAg
IHJldHVybiBIVk1UUkFOU19nZm5fcGFnZWRfb3V0Owo+ICsgICAgICAgIH0KPiArCj4gICAgICAg
ICAgcCA9IChjaGFyICopX19tYXBfZG9tYWluX3BhZ2UocGFnZSkgKyAoYWRkciAmIH5QQUdFX01B
U0spOwo+Cj4gICAgICAgICAgaWYgKCBmbGFncyAmIEhWTUNPUFlfdG9fZ3Vlc3QgKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
