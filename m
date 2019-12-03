Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA57110435
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 19:27:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icCqv-0003wR-0M; Tue, 03 Dec 2019 18:24:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zB0y=ZZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1icCqt-0003wK-8j
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 18:24:47 +0000
X-Inumbo-ID: 2f198248-15fa-11ea-9db0-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f198248-15fa-11ea-9db0-bc764e2007e4;
 Tue, 03 Dec 2019 18:24:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1575397487; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=FJf+t7uWWBJON+XWvIj8uyI+2IJEkmB1jh2LHbO5ZNY=;
 b=vr7IMcmqIFr9fMXTfahDb+gJ6I9lm0IuK8fQp6l1GtCij2R7VaTahyB/XEoyo2YHIRWOPurv
 fZlC6ZZZ2RQmXDscAhYLMTV0SvmVcZqmVyvaJWJIy675o1U7NE1Py0V2PrWW80+4YBMazH4V
 EOhvmRv6Aa8D2AybUt8jhCiqtMY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mxa.mailgun.org with ESMTP id 5de6a86c.7ff5b8b9bab0-smtp-out-n03;
 Tue, 03 Dec 2019 18:24:44 -0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id u8so4723628wmu.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 10:24:43 -0800 (PST)
X-Gm-Message-State: APjAAAWLXWAC2G2x0Sdj/aT48X9N0G0kEugZ7PPIH+z78IUa8L27KzTh
 d4cON+l98r48MgVa4aALdTUGk75+9qKJ/8vCtRQ=
X-Google-Smtp-Source: APXvYqx0xckQjuNn3LTnIepZnWR8TPS7hUpqFQDdAzK/nYjnGNCmX6D750Zo35i3jeMnsEDfsnMFf6MeaQ3nWLB7ZZY=
X-Received: by 2002:a1c:7f4e:: with SMTP id a75mr19033626wmd.128.1575397482563; 
 Tue, 03 Dec 2019 10:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
 <CABfawh=TP7oB5VLadnD1iC=k9sX1s1zJJQKxHR=HopzvNZns+g@mail.gmail.com>
 <10135f1d-2247-f6de-a46b-24eba40e44a7@citrix.com>
 <CABfawh=dkaCTw7Z8=P4M0DDL-KdsjBme3Sj536_-Q5bECY=DQw@mail.gmail.com>
In-Reply-To: <CABfawh=dkaCTw7Z8=P4M0DDL-KdsjBme3Sj536_-Q5bECY=DQw@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Dec 2019 13:24:06 -0500
X-Gmail-Original-Message-ID: <CABfawhmpujFcQ9agXPG4KYxh8m5=dSju4ntwO9fVg8qAMQ6apg@mail.gmail.com>
Message-ID: <CABfawhmpujFcQ9agXPG4KYxh8m5=dSju4ntwO9fVg8qAMQ6apg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjIyIFBNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAzLCAyMDE5IGF0IDE6MTggUE0gQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
MDMvMTIvMjAxOSAxODowOSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiBPbiBUdWUsIERl
YyAzLCAyMDE5IGF0IDE6MDUgUE0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29t
PiB3cm90ZToKPiA+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAo+ID4gPj4+IGluZGV4IDk1OTA4M2Q4
YzQuLjc2Njc2ZmY0YzAgMTAwNjQ0Cj4gPiA+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3Zt
X2V2ZW50LmgKPiA+ID4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAo+ID4g
Pj4+IEBAIC0yODEsNiArMjgxLDcgQEAgc3RydWN0IHZtX2V2ZW50X2RlYnVnIHsKPiA+ID4+PiAg
ICAgIHVpbnQzMl90IGluc25fbGVuZ3RoOwo+ID4gPj4+ICAgICAgdWludDhfdCB0eXBlOyAgICAg
ICAgLyogSFZNT1BfVFJBUF8qICovCj4gPiA+Pj4gICAgICB1aW50OF90IF9wYWRbM107Cj4gPiA+
Pj4gKyAgICB1aW50NjRfdCBwZW5kaW5nX2RiZzsKPiA+ID4+IFRoaXMgaXMganVzdCBhIG5pdHBp
Y2sgYnV0IEkgd291bGQgcHJlZmVyIGlmIHdlIGhhZCB0aGUgX3BhZCBmaWVsZCBhcwo+ID4gPj4g
dGhlIGxhc3QgZWxlbWVudCBpbiB0aGUgc3RydWN0IGFuZCBrZWVwIGFsbCA2NC1iaXQgbWVtYmVy
cyB1cCBpbiB0aGUKPiA+ID4+IGZyb250Lgo+ID4gPiBBbHNvLCBzaW5jZSBwZW5kaW5nX2RiZyB1
c2VzIHVuc2lnbmVkIGludCBpbiBYZW4sIGRvIHdlIG5lZWQgdWludDY0X3QKPiA+ID4gZm9yIGl0
IGhlcmU/IFNlZW1zIHRvIG1lIGEgdWludDMyX3Qgd291bGQgc3VmZmljZS4KPiA+Cj4gPiBJdHMg
JWRyNiAoYnV0IG5vdCBxdWl0ZSwgZHVlIHRvIGNvbXBsZXhpdHkgd2l0aCBleGNlcHRpb24gcHJp
b3JpdGllcywKPiA+IGludGVycnVwdCBzaGFkb3dzLCBhbmQgYmFja3dhcmRzIGNvbXBhdGliaWxp
dHkgb2YgdGhlIFJUTSBiaXQgd2l0aAo+ID4gaW52ZXJ0ZWQgcG9sYXJpdHkpLiAgQWxsIG90aGVy
IHJlZ2lzdGVycyBoYXZlIDY0IGJpdCBmaWVsZHMgaW4gdGhlCj4gPiBpbnRlcmZhY2UuCj4gPgo+
ID4gVGhlIG9ubHkgaW50ZXJlc3RpbmcgYml0cyBpbiBpdCBmYWxsIHdpdGhpbiB0aGUgZmlyc3Qg
MzIgd2hpY2ggaXMgd2h5IGl0Cj4gPiBpcyBoYW5kbGVkIGluIGEgc2hvcnRlciB3YXkgd2l0aGlu
IFhlbi4gIExpa2UgJWNyMCwgSSBkb24ndCBleHBlY3QKPiA+IGFueXRoaW5nIGludGVyZXN0aW5n
IHRvIGFwcGVhciBpbiB0aGUgdXBwZXIgMzIgYml0cy4KPiA+Cj4KPiBQZXJoYXBzIGl0IHdvdWxk
IGJlIGJldHRlciB0byBjYWxsIGl0IGRyNiBpbiB0aGUgaW50ZXJmYWNlIHRoZW4gdG8KPiBtYWtl
IGl0IG1vcmUgY2xlYXIgdGhhdCB0aGlzIGlzIGEgcmVnaXN0ZXIgdmFsdWU/Cj4KCldoaWNoIHRo
ZW4gYmVncyB0aGUgcXVlc3Rpb24sIHdoeSBub3QganVzdCB1c2UgZHI2IHRoYXQncyBhbHJlYWR5
CnByZXNlbnQgaW4gdGhlIHZtX2V2ZW50X3JlZ3NfeDg2IHN0cnVjdD8KClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
