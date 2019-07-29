Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6178E05
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 16:31:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs6eD-0001zZ-SG; Mon, 29 Jul 2019 14:29:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61H9=V2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hs6eC-0001zP-Ny
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 14:29:08 +0000
X-Inumbo-ID: 389567e7-b20d-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 389567e7-b20d-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 14:29:07 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u10so3448944lfm.12
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bjee+mm+9KIrpPNZn2Rga+SbooVNz2OAqsw14N+38MA=;
 b=i5IlGrXkiznqYlgQe3BlIiDuDAMSOZK5M2LyaUTtaec0y1wjUuBhissU4MOBAJWZUO
 6cj2iDUCfKhExF0g967p2gsMY5gSJQObeo6gSlWf3CZeI9sO8GDktIdl4oZg5J1ql5rv
 CLhp+mAqx7jNrJ+WwiKKZJuanlnY79KP8zwblrMeWj3dkJB94oe0prCpFJrV2Pf5KN5l
 5bJqDWA+nKhMCkajTaZC/DltfRQYvEMLdgwAGPVQKzQSJzMoLGMmjy4rlFvtqjNcY3Or
 4gVjd0XDr5RSPm+9232uR9lHpJ7iAiw7vBP9jn9bBaPZVWRtA0+mynhP8sm1mrSxthHO
 qQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bjee+mm+9KIrpPNZn2Rga+SbooVNz2OAqsw14N+38MA=;
 b=UwPs7IYZy3EGvKsOu0d12CtakcDK4IcdOBAq3nR4xkrhfE2izHJCEbX/aqAsHfIdqL
 KMF5xZDdeHv2mMbG0p5M0HbTZEZj/mesmdoaUTDxusK6dvCCc7zE/XgGgsmLX7hXcMba
 8ldl1fBiWWoZb1Zqr58akioapZWIQsQTyjbgV8yr6j3AK6HO3Htrw6legLt3ASK0vxOR
 YOdeaoJR9YTGr+N60bpKSmzBktUp4ajNm05cv6q7gmWMBS/v65TovmjBunU/cHWDp81R
 AIsh9dy3pm4dlt+Uo4cm1vGOO+vmkSh60aAlvCj3BX/ax7qBSjJUfBiSoJ4stBQwwHHW
 D1UQ==
X-Gm-Message-State: APjAAAUsCkk72vpmaK1pQWHr/iopSyVrZkteFlld1nzFwJU0lTlltQnn
 UtGRKjQlLSMmpb3lsEPZALI=
X-Google-Smtp-Source: APXvYqzWkuPGwuGkXdgmkAxdTAx2HuvPGNqVlyIc0+C6ULIJRsnpotCe7zUhKtmCxEQekVEYwG/x0w==
X-Received: by 2002:ac2:46ef:: with SMTP id q15mr53230697lfo.63.1564410545916; 
 Mon, 29 Jul 2019 07:29:05 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t21sm10659465lfd.85.2019.07.29.07.29.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 07:29:05 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <79b01757ee19b57ac43649a4d94e378891152887.camel@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <59643a8e-d87b-b915-42b7-8084fc050747@gmail.com>
Date: Mon, 29 Jul 2019 17:28:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <79b01757ee19b57ac43649a4d94e378891152887.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 0/6] XEN scheduling hardening
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gRGFyaW8KCk9uIDI2LjA3LjE5IDE0OjU2LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiBb
QWRkaW5nIEdlb3JnZSBwbHVzIG90aGVycyB4ODYsIEFSTSBhbmQgY29yZS1YZW4gcGVvcGxlXQo+
IAo+IEhpIEFuZHJpaSwKPiAKPiBGaXJzdCBvZiBhbGwsIHRoYW5rcyBhIGxvdCBmb3IgdGhpcyBz
ZXJpZXMhCj4gCj4gVGhlIHByb2JsZW0geW91IG1lbnRpb24gaXMgYSBsb25nIHN0YW5kaW5nIG9u
ZSwgYW5kIEknbSBnbGFkIHdlJ3JlCj4gZXZlbnR1YWxseSBzdGFydGluZyB0byBwcm9wZXJseSBs
b29rIGludG8gaXQuCj4gCj4gSSBhbHJlYWR5IGhhdmUgb25lIGNvbW1lbnQ6IEkgdGhpbmsgSSBj
YW4gc2VlIGZyb20gd2hlcmUgdGhpcyBjb21lCj4gZnJvbSwgYnV0IEkgZG9uJ3QgdGhpbmsgJ1hF
TiBzY2hlZHVsaW5nIGhhcmRlbmluZycgaXMgd2hhdCB3ZSdyZSBkb2luZwo+IGluIHRoaXMgc2Vy
aWVzLi4uIEknZCBnbyBmb3Igc29tZXRoaW5nIGxpa2UgInhlbjogc2NoZWQ6IGltcHJvdmUgaWRs
ZQo+IGFuZCB2Y3B1IHRpbWUgYWNjb3VudGluZyBwcmVjaXNpb24iLCBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgoKSSBkbyBub3QgcmVhbGx5IHN0aWNrIGF0IHRoZSBuYW1pbmcuIFdpbGwgcmVuYW1l
IG9uIHRoZSBuZXh0IHZlcnNpb24uCgo+PiBXaGlsZSB0aGUgc2VyaWVzIGlzIHRoZSBlYXJseSBS
RkMsIHNldmVyYWwgcG9pbnRzIGFyZSBzdGlsbAo+PiB1bnRvdWNoZWQ6Cj4+ICAgLSBOb3cgdGhl
IHRpbWUgZWxhcHNlZCBmcm9tIHRoZSBsYXN0IHJlc2NoZWR1bGluZyBpcyBub3QgZnVsbHkKPj4g
Y2hhcmdlZCBmcm9tCj4+ICAgICB0aGUgY3VycmVudCB2Y3B1IGJ1ZGdldC4gQXJlIHRoZXJlIGFu
eSBjaGFuZ2VzIG5lZWRlZCBpbiB0aGUKPj4gZXhpc3RpbmcKPj4gICAgIHNjaGVkdWxpbmcgYWxn
b3JpdGhtcz8KPj4KPiBJJ2xsIHRoaW5rIGFib3V0IGl0LCBidXQgb3V0IG9mIHRoZSB0b3Agb2Yg
bXkgaGVhZCwgSSBkb24ndCBzZWUgaG93Cj4gdGhpcyBjYW4gYmUgYSBwcm9ibGVtLiBTY2hlZHVs
aW5nIGFsZ29yaXRobXMgKHNob3VsZCEpIGJhc2UgdGhlaXIgbG9naWMKPiBhbmQgdGhlaXIgY2Fs
Y3VsYXRpb25zIG9uIGFjdHVhbCB2Y3B1cycgcnVudGltZSwgbm90IG11Y2ggb24gaWRsZQo+IHZj
cHVzJyBvbmUuCgpJTU8gUlREUyBhbmQgQVJJTkM2NTMgc2NoZWR1bGluZyBhbGdvcml0aG1zIGFy
ZSBub3QgYWZmZWN0ZWQgYmVjYXVzZSB0aGV5IGFyZSBvcGVyYXRpbmcgd2l0aCB0aGUgYWJzb2x1
dGUgdmFsdWUgb2YgdGltZSBzcGVudCBieSB2Y3B1IGFuZCBhIGZ1dHVyZSBldmVudCAobmVhcmVz
dCBkZWFkbGluZSBvciBtYWpvciBmcmFtZSBlbmQpLgpCdXQgSSBoYXZlIG15IGRvdWJ0cyBhYm91
dCBjcmVkaXQgc2NoZWR1bGVycyAoY3JlZGl0LCBjcmVkaXQyKS4gTm93IHdlIGhhdmUgYW4gZW50
aXR5IHdoaWNoIHVuY29uZGl0aW9uYWxseSBzdGVhbHMgdGltZSBmcm9tIHNvbWUgcGVyaW9kcy4g
V291bGRuJ3QgaXQgYWZmZWN0IGNhbGN1bGF0aW9uIG9mIGRvbWFpbnMgYnVkZ2V0IHByb3BvcnRp
b25zIHdpdGggdGhlIHJlc3BlY3QgdG8gdGhlIGRvbWFpbnMgd2VpZ2h0L2NhcD8KCgo+PiAgIC0g
SG93IHRvIGF2b2lkIHRoZSBhYnNvbHV0ZSB0b3AgcHJpb3JpdHkgb2YgdGFza2xldHMgKHdoYXQg
aXMgb2JleWVkCj4+IGJ5IGFsbAo+PiAgICAgc2NoZWR1bGVycyBzbyBmYXIpLiBTaG91bGQgaWRs
ZSB2Y3B1IGJlIHNjaGVkdWxlZCBhcyB0aGUgbm9ybWFsCj4+IGd1ZXN0IHZjcHVzCj4+ICAgICAo
dGhyb3VnaCBxdWV1ZXMsIHByaW9yaXRpZXMsIGV0Yyk/Cj4+Cj4gTm93LCB0aGlzIGlzIHNvbWV0
aGluZyB0byB0aGluayBhYm91dCwgYW5kIHRyeSB0byB1bmRlcnN0YW5kIGlmCj4gYW55dGhpbmcg
d291bGQgYnJlYWsgaWYgd2UgZ28gZm9yIGl0LiBJIG1lYW4sIEkgc2VlIHdoeSB5b3UnZCB3YW50
IHRvCj4gZG8gdGhhdCwgYnV0IHRhc2tsZXRzIGFuZCBzb2Z0aXJxcyB3b3JrcyB0aGUgd2F5IHRo
ZXkgZG8sIGluIFhlbiwgc2luY2UKPiB3aGVuIHRoZXkgd2VyZSBpbnRyb2R1Y2VkLCBJIGJlbGll
dmUuCj4gCj4gVGhlcmVmb3JlLCBldmVuIGlmIHRoZXJlIHdvdWxkbid0IGJlIGFueSBzdWJzeXN0
ZW0gZXhwbGljaXRseSByZWx5aW5nCj4gb24gdGhlIGN1cnJlbnQgYmVoYXZpb3IgKHdoaWNoIHNo
b3VsZCBiZSB2ZXJpZmllZCksIEkgdGhpbmsgd2UgYXJlIGF0Cj4gaGlnaCByaXNrIG9mIGJyZWFr
aW5nIHRoaW5ncywgaWYgd2UgY2hhbmdlLgo+IAo+IFRoYXQncyBub3QgdG8gbWVhbiBpdCB3b3Vs
ZCBub3QgYmUgYSBnb29kIGNoYW5nZSwgb3IgdGhhdCBpdCBpcwo+IGltcG9zc2libGUuLi4gSXQn
cywgcmF0aGVyLCBqdXN0IHRvIHJhaXNlIHNvbWUgYXdhcmVuZXNzLiA6LSkKCkkgdW5kZXJzdGFu
ZCB0aGF0IHRoaXMgYXJlYSBpcyBjb25zZXJ2YXRpdmUgYW5kIGhhcmQgdG8gY2hhbmdlLgpCdXQg
dGhlIGN1cnJlbnQgc2NoZWR1bGluZyBpbiBYRU4gaXMgcXVpdGUgbm9uLWRldGVybWluaXN0aWMu
IEFuZCwgSU1PLCB3aXRoIHRoYXQgbWVzcyBYRU4gY2FuIG5vdCBnbyBpbnRvIGFueSBzYWZldHkg
Y2VydGlmaWVkIHN5c3RlbS4KCj4+ICAgLSBJZGxlIHZjcHUgbmFtaW5nIGlzIHF1aXRlIG1pc2xl
YWRpbmcuIEl0IGlzIGEga2luZCBvZiBzeXN0ZW0KPj4gKGh5cGVydmlzb3IpCj4+ICAgICB0YXNr
IHdoaWNoIGlzIHJlc3BvbnNpYmxlIGZvciBzb21lIGh5cGVydmlzb3Igd29yay4gU2hvdWxkIGl0
IGJlCj4+ICAgICByZW5hbWVkL3JlY29uc2lkZXJlZD8KPj4KPiBXZWxsLCB0aGF0J3MgYSBkZXNp
Z24gcXVlc3Rpb24sIGV2ZW4gZm9yIHRoaXMgdmVyeSBzZXJpZXMsIGlzbid0IGl0PyBJCj4gbWVh
biwgSSBzZWUgdHdvIHdheXMgb2YgYWNoaWV2aW5nIHByb3BlciBpZGxlIHRpbWUgYWNjb3VudGlu
ZzoKPiAxKSB5b3UgbGVhdmUgdGhpbmdzIGFzIHRoZXkgYXJlIC0taS5lLiwgaWRsZSBkb2VzIG5v
dCBvbmx5IGRvIGlkbGluZywKPiAgICAgaXQgYWxzbyBkb2VzIGFsbCB0aGVzZSBvdGhlciB0aGlu
Z3MsIGJ1dCB5b3UgbWFrZSBzdXJlIHlvdSBkb24ndAo+ICAgICBjb3VudCB0aGUgdGltZSB0aGV5
IHRha2UgYXMgaWRsZSB0aW1lOwo+IDIpIHlvdSBtb3ZlIGFsbCB0aGVzZSBhY3Rpdml0aWVzIG91
dCBvZiBpZGxlLCBhbmQgaW4gc29tZSBvdGhlcgo+ICAgICBjb250ZXh0LCBhbmQgeW91IGxldCBp
ZGxlIGp1c3QgZG8gdGhlIGlkbGluZy4gQXQgdGhhdCBwb2ludCwgdGltZQo+ICAgICBhY2NvdW50
ZWQgdG8gaWRsZSB3aWxsIGJlIG9ubHkgYWN0dWFsIGlkbGUgdGltZSwgYXMgdGhlIHRpbWUgaXQK
PiAgICAgdG9vayB0byBYZW4gdG8gZG8gYWxsIHRoZSBvdGhlciB0aGluZ3MgaXMgbm93IGFjY291
bnRlZCB0byB0aGUgbmV3Cj4gICAgIGV4ZWN1dGlvbiBjb250ZXh0IHdoaWNoIGlzIHJ1bm5pbmcg
dGhlbS4KPiAKPiBTbywgd2hpY2ggcGF0aCB0aGlzIHBhdGggc2VyaWVzIHRha2VzIChJIGJlbGll
dmUgMSksIGFuZCB3aGljaCBwYXRoIHlvdQo+IChhbmQgb3RoZXJzKSBiZWxpZXZlIGlzIGJldHRl
cj8KClRoaXMgaGF2ZSB0byBiZSBkaXNjdXNzZWQuCkkgd291bGQgc3RyZXNzIGFnYWluIHRoaXMg
aXMgdGhlIHNldCBvZiBtaW5pbWFsIGNoYW5nZXMgZm9sbG93aW5nIGV4aXN0aW5nIGFwcHJvYWNo
ZXMgKGUuZy4gSSBkb24ndCBsaWtlIHJ1bnN0YXRlIHVzYWdlIGhlcmUpCgo+IChBbmQsIHllcywg
ZGlzY3Vzc2luZyB0aGlzIGlzIHdoeSBJJ3ZlIGFkZGVkLCBhcGFydCBmcm9tIEdlb3JnZSwgc29t
ZQo+IG90aGVyIHg4NiwgQVJNLCBhbmQgY29yZS1YZW4gcGVvcGxlKQoKVGhhbmsgeW91LgoKLS0g
ClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
