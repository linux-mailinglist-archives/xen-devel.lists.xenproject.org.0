Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E53102CBC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 20:34:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX9EN-0003DF-He; Tue, 19 Nov 2019 19:32:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4IOF=ZL=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iX9EM-0003DA-QX
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 19:32:06 +0000
X-Inumbo-ID: 44adb9fa-0b03-11ea-9631-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44adb9fa-0b03-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 19:32:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1574191925; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=I5LynIa5tw8qSDXjEDhYsgpVhZSIJ8EwmwTcGeL9CKM=;
 b=ik6W+SVisbSKQ/2z51Vn89hZ3hMgltgqtHjib25gNls5pH6eOaG0Dgt0worlTzk3aWCwLLbS
 FCPHq6e0RtnTfnTkUB9nwN8KVzrkHThTGbU186xsAyZblE0Pn/4VhagkxpF8ANFlr1Kt0eBq
 ELqDk0X9kwS+a0IQul+yMVYE/R8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mxa.mailgun.org with ESMTP id 5dd44334.7f00254941f0-smtp-out-n01;
 Tue, 19 Nov 2019 19:32:04 -0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id b3so25306160wrs.13
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 11:32:04 -0800 (PST)
X-Gm-Message-State: APjAAAUzSiVSx41rpyvqqhAiYPn5HYdLN+/MXx02Y1phYZyceJPHThqo
 MAmibKPmLRfcNEJqUFnkU5pvYytAniAnB8QtVIc=
X-Google-Smtp-Source: APXvYqxhi5d3rx89+azVwN3qk/rOJqhx7N9SSLY+nI2tho2UHd2jdBzkswMETi1bwJD6PrGTZFzAfpIi5njcbwNCW4o=
X-Received: by 2002:a5d:558e:: with SMTP id i14mr38664120wrv.140.1574191922891; 
 Tue, 19 Nov 2019 11:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <20191106153442.12776-2-aisaila@bitdefender.com>
 <60fdf6d4-d43b-f1aa-99e7-9f1818513904@suse.com>
 <d2502775-1e48-50c7-3f43-13e1683d2272@bitdefender.com>
 <912e2d21-4fcc-a290-c4d5-d75d542fb192@suse.com>
In-Reply-To: <912e2d21-4fcc-a290-c4d5-d75d542fb192@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 19 Nov 2019 12:31:25 -0700
X-Gmail-Original-Message-ID: <CABfawhmwTHsAhTyVSB5Tt83bNk7xjXDvrEWuo2MQarqm910LWA@mail.gmail.com>
Message-ID: <CABfawhmwTHsAhTyVSB5Tt83bNk7xjXDvrEWuo2MQarqm910LWA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH V2 2/2] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMjo1MyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTguMTEuMjAxOSAwOTozOCwgQWxleGFuZHJ1IFN0ZWZhbiBJ
U0FJTEEgd3JvdGU6Cj4gPiBPbiAxMi4xMS4yMDE5IDE0OjAyLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+PiBPbiAwNi4xMS4yMDE5IDE2OjM1LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToK
PiA+Pj4gQEAgLTI1NzIsMTcgKzI1NzQsMzYgQEAgaW50IHAybV9pbml0X2FsdHAybV9ieV9pZChz
dHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4KQo+ID4+PiAgICAgICBhbHRwMm1fbGlz
dF9sb2NrKGQpOwo+ID4+Pgo+ID4+PiAgICAgICBpZiAoIGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4
XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+ID4+PiAtICAgICAgICByYyA9IHAybV9hY3RpdmF0
ZV9hbHRwMm0oZCwgaWR4KTsKPiA+Pj4gKyAgICAgICAgcmMgPSBwMm1fYWN0aXZhdGVfYWx0cDJt
KGQsIGlkeCwgaG9zdHAybS0+ZGVmYXVsdF9hY2Nlc3MpOwo+ID4+Pgo+ID4+PiAgICAgICBhbHRw
Mm1fbGlzdF91bmxvY2soZCk7Cj4gPj4+ICAgICAgIHJldHVybiByYzsKPiA+Pj4gICB9Cj4gPj4+
Cj4gPj4+IC1pbnQgcDJtX2luaXRfbmV4dF9hbHRwMm0oc3RydWN0IGRvbWFpbiAqZCwgdWludDE2
X3QgKmlkeCkKPiA+Pj4gK2ludCBwMm1faW5pdF9uZXh0X2FsdHAybShzdHJ1Y3QgZG9tYWluICpk
LCB1aW50MTZfdCAqaWR4LAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90
IGh2bW1lbV9kZWZhdWx0X2FjY2VzcykKPiA+Pj4gICB7Cj4gPj4+ICAgICAgIGludCByYyA9IC1F
SU5WQUw7Cj4gPj4+ICAgICAgIHVuc2lnbmVkIGludCBpOwo+ID4+Pgo+ID4+PiArICAgIHN0YXRp
YyBjb25zdCBwMm1fYWNjZXNzX3QgbWVtYWNjZXNzW10gPSB7Cj4gPj4+ICsjZGVmaW5lIEFDQ0VT
UyhhYykgW1hFTk1FTV9hY2Nlc3NfIyNhY10gPSBwMm1fYWNjZXNzXyMjYWMKPiA+Pj4gKyAgICAg
ICAgQUNDRVNTKG4pLAo+ID4+PiArICAgICAgICBBQ0NFU1MociksCj4gPj4+ICsgICAgICAgIEFD
Q0VTUyh3KSwKPiA+Pj4gKyAgICAgICAgQUNDRVNTKHJ3KSwKPiA+Pj4gKyAgICAgICAgQUNDRVNT
KHgpLAo+ID4+PiArICAgICAgICBBQ0NFU1MocngpLAo+ID4+PiArICAgICAgICBBQ0NFU1Mod3gp
LAo+ID4+PiArICAgICAgICBBQ0NFU1Mocnd4KSwKPiA+Pj4gKyAgICAgICAgQUNDRVNTKHJ4MnJ3
KSwKPiA+Pj4gKyAgICAgICAgQUNDRVNTKG4ycnd4KSwKPiA+Pj4gKyN1bmRlZiBBQ0NFU1MKPiA+
Pj4gKyAgICB9Owo+ID4+PiArCj4gPj4+ICsgICAgaWYgKCBodm1tZW1fZGVmYXVsdF9hY2Nlc3Mg
PiBYRU5NRU1fYWNjZXNzX2RlZmF1bHQgKQo+ID4+PiArICAgICAgICByZXR1cm4gcmM7Cj4gPj4+
ICsKPiA+Pj4gICAgICAgYWx0cDJtX2xpc3RfbG9jayhkKTsKPiA+Pj4KPiA+Pj4gICAgICAgZm9y
ICggaSA9IDA7IGkgPCBNQVhfQUxUUDJNOyBpKysgKQo+ID4+PiBAQCAtMjU5MCw3ICsyNjExLDcg
QEAgaW50IHAybV9pbml0X25leHRfYWx0cDJtKHN0cnVjdCBkb21haW4gKmQsIHVpbnQxNl90ICpp
ZHgpCj4gPj4+ICAgICAgICAgICBpZiAoIGQtPmFyY2guYWx0cDJtX2VwdHBbaV0gIT0gbWZuX3go
SU5WQUxJRF9NRk4pICkKPiA+Pj4gICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Pj4KPiA+Pj4g
LSAgICAgICAgcmMgPSBwMm1fYWN0aXZhdGVfYWx0cDJtKGQsIGkpOwo+ID4+PiArICAgICAgICBy
YyA9IHAybV9hY3RpdmF0ZV9hbHRwMm0oZCwgaSwgbWVtYWNjZXNzW2h2bW1lbV9kZWZhdWx0X2Fj
Y2Vzc10pOwo+ID4+Cj4gPj4gQXJlbid0IHlvdSBvcGVuLWNvZGluZyB4ZW5tZW1fYWNjZXNzX3Rv
X3AybV9hY2Nlc3MoKSBoZXJlPyBJbgo+ID4+IG5vIGV2ZW50IHNob3VsZCB0aGVyZSBiZSB0d28g
aW5zdGFuY2VzIG9mIHRoZSBzYW1lIHN0YXRpYyBhcnJheS4KPiA+Cj4gPiBJIGRpZCB0aGlzIGJl
Y2F1c2UgeGVubWVtX2FjY2Vzc190b19wMm1fYWNjZXNzKCkgaXMgZGVmaW5lZCBzdGF0aWMgaW4K
PiA+IHg4Ni9tbS9tZW1fYWNjZXNzLmMuIElmIGl0J3Mgb2sgdG8gaGF2ZSBpdCBkZWZpbmVkIGlu
IG1lbV9hY2Nlc3MuaCB0aGVuCj4gPiBJIGNhbiBnbyB3aXRoIHRoYXQgYW5kIGRyb3AgdGhpcyBw
YXJ0IG9mIHRoZSBjb2RlLgo+Cj4gSSBzZWUgbm8gcmVhc29uIHdoeSB0aGlzIHdvdWxkbid0IGJl
IGEgcmVhc29uYWJsZSBzdGVwLCBhbGxvd2luZyB0bwo+IGF2b2lkIGNvZGUgZHVwbGljYXRpb24u
IExvb2tzIGxpa2UgdGhlIGZ1bmN0aW9uIGlzIGV2ZW4gc3VpdGFibHkKPiBuYW1lZCBhbHJlYWR5
IGZvciBtYWtpbmcgbm9uLXN0YXRpYy4KClNvdW5kcyBmaW5lIHRvIG1lIHRvby4KClRoYW5rcywK
VGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
