Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0DFB30A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 16:00:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUu6H-0002I5-Er; Wed, 13 Nov 2019 14:58:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XROl=ZF=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iUu6G-0002I0-1M
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:58:28 +0000
X-Inumbo-ID: 0c2c16a8-0626-11ea-9631-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c2c16a8-0626-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 14:58:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1573657107; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=wOuNkSBvPKWTQVMJVo8Z+QdK75XddBNUvcPIfDft1P4=;
 b=PiAmYfgHnZJWXMn9Gt87SX2idjjSJx+iOB2cQalPb3r+zNgywyB1rkE61WBI8oi1SygKgll8
 5r+BZEOAL//xWmdR4B1bcerXstlPKGNYVlgUQnohCSXbtXprhkgq417tE5jwHWxQvPo8EsOp
 jAgf6Be6oxckrLMCF+9Avg7K3vI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mxa.mailgun.org with ESMTP id 5dcc1a12.7f57b0a70170-smtp-out-n02;
 Wed, 13 Nov 2019 14:58:26 -0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s5so2741461wrw.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 06:58:25 -0800 (PST)
X-Gm-Message-State: APjAAAU2YWXNYkp6543JQ+KSf+IYtly/vsbERX5jWOOmkxCcjWCGo9Vl
 fYtV8NQFEW/xE4rDihki4RAKNt8juXV529nGaz0=
X-Google-Smtp-Source: APXvYqxscSbTno7NhRXAkhgheufSMecPED/n2i1MO2InSD4b7vShJmJCP1we5jh4MPB+7kzieruFXnMQ4/r33xFHc4Q=
X-Received: by 2002:a5d:4201:: with SMTP id n1mr2989363wrq.372.1573657104581; 
 Wed, 13 Nov 2019 06:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <CABfawhkjgmyYa11CMH1fBZG+Ee2ngvsoFzBvCixrj08FMcMT5A@mail.gmail.com>
 <2ba0e8d7-0e58-62c0-6c2b-8d9934b1137e@suse.com>
 <CABfawhnUtzWm25XOpr+BLkUuqA-OtpOUAh+91xBsk93dprWAyg@mail.gmail.com>
In-Reply-To: <CABfawhnUtzWm25XOpr+BLkUuqA-OtpOUAh+91xBsk93dprWAyg@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 13 Nov 2019 07:57:48 -0700
X-Gmail-Original-Message-ID: <CABfawhkBqpiJNrLSMFhW7GnXwKAx2-7Hi+uH+F=9DJEVuhecaw@mail.gmail.com>
Message-ID: <CABfawhkBqpiJNrLSMFhW7GnXwKAx2-7Hi+uH+F=9DJEVuhecaw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgNzo1MSBBTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgNzozMSBBTSBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDEyLjExLjIw
MTkgMTU6MDUsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+ID4gT24gVHVlLCBOb3YgMTIsIDIw
MTkgYXQgNDo1NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4g
Pj4gT24gMDYuMTEuMjAxOSAxNjozNSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4g
PiA+Pj4gKyAgICAgICAgZWxzZQo+ID4gPj4+ICsgICAgICAgIHsKPiA+ID4+PiArICAgICAgICAg
ICAgcmMgPSBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKGQsICZhLnUuc3VwcHJlc3NfdmUpOwo+
ID4gPj4+ICsKPiA+ID4+PiArICAgICAgICAgICAgaWYgKCByYyA9PSAtRVJFU1RBUlQgKQo+ID4g
Pj4+ICsgICAgICAgICAgICAgICAgaWYgKCBfX2NvcHlfZmllbGRfdG9fZ3Vlc3QoZ3Vlc3RfaGFu
ZGxlX2Nhc3QoYXJnLAo+ID4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgeGVuX2h2bV9hbHRwMm1fb3BfdCksCj4gPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmYSwgdS5zdXBwcmVzc192ZS5vcGFxdWUpICkKPiA+
ID4+PiArICAgICAgICAgICAgICAgICAgICByYyA9IC1FRkFVTFQ7Cj4gPiA+Pgo+ID4gPj4gSWYg
dGhlIG9wZXJhdGlvbiBpcyBiZXN0IGVmZm9ydCwgX3NvbWVfIGluZGljYXRpb24gb2YgZmFpbHVy
ZSBzaG91bGQKPiA+ID4+IHN0aWxsIGJlIGhhbmRlZCBiYWNrIHRvIHRoZSBjYWxsZXIuIFdoZXRo
ZXIgdGhhdCdzIHRocm91Z2ggdGhlIG9wYXF1ZQo+ID4gPj4gZmllbGQgb3IgYnkgc29tZSBvdGhl
ciBtZWFucyBpcyBzZWNvbmRhcnkuIElmIG5vdCB2aWEgdGhhdCBmaWVsZAo+ID4gPj4gKHdoaWNo
IHdvdWxkIG1ha2UgdGhlIG91dGVyIG9mIHRoZSB0d28gaWYoKS1zIGRpc2FwcGVhciksIHBsZWFz
ZSBmb2xkCj4gPiA+PiB0aGUgaWYoKS1zLgo+ID4gPgo+ID4gPiBBdCBsZWFzdCBmb3IgbWVtX3No
YXJpbmdfcmFuZ2Vfb3Agd2UgYWxzbyBkbyBhIGJlc3QtZWZmb3J0IGFuZCBkb24ndAo+ID4gPiBy
ZXR1cm4gYW4gZXJyb3IgZm9yIHBhZ2VzIHdoZXJlIGl0IHdhc24ndCBwb3NzaWJsZSB0byBzaGFy
ZS4gU28gSQo+ID4gPiBkb24ndCB0aGluayBpdCdzIGFic29sdXRlbHkgbmVjZXNzYXJ5IHRvIGRv
IHRoYXQsIGVzcGVjaWFsbHkgaWYgdGhlCj4gPiA+IGNhbGxlciBjYW4ndCBkbyBhbnl0aGluZyBh
Ym91dCB0aG9zZSBlcnJvcnMgYW55d2F5Lgo+ID4KPiA+IG1lbS1zaGFyaW5nIGlzIGEgbGl0dGxl
IGRpZmZlcmVudCBpbiBuYXR1cmUsIGlzbid0IGl0PyBJZiB5b3UKPiA+IGNhbid0IHNoYXJlIGEg
cGFnZSwgYm90aCBpbnZvbHZlZCBndWVzdHMgd2lsbCBjb250aW51ZSB0byBydW4KPiA+IHdpdGgg
dGhlaXIgb3duIGluc3RhbmNlcy4gSWYgeW91IHdhbnQgdG8gc3VwcHJlc3MgI1ZFIGRlbGl2ZXJ5
Cj4gPiBhbmQgaXQgZmFpbHMsIGJlaGF2aW9yIHdvbid0IGJlIHRyYW5zcGFyZW50bHkgY29ycmVj
dCwgYXMKPiA+IHRoZXJlJ2xsIHBvdGVudGlhbGx5IGJlICNWRSB3aGVuIHRoZXJlIHNob3VsZCBi
ZSBub25lLiBXaGV0aGVyCj4gPiB0aGF0J3MgYmVuaWduIHRvIHRoZSBndWVzdCB2ZXJ5IG11Y2gg
ZGVwZW5kcyBvbiBpdHMgaGFuZGxlci4KPgo+IE1ha2VzIG1lIHdvbmRlciB3aGV0aGVyIGl0IHdv
dWxkIG1ha2UgbW9yZSBzZW5zZSB0byBmbGlwIHRoaXMgdGhpbmcgb24KPiBpdHMgaGVhZCBhbmQg
aGF2ZSBzdXByZXNzX3ZlIGJlIHNldCBieSBkZWZhdWx0IChzaW5jZSBpdHMgaWdub3JlZCBieQo+
IGRlZmF1bHQpIGFuZCB0aGVuIGhhdmUgcGFnZXMgZm9yIHdoaWNoIHRoZSBFUFQgdmlvbGF0aW9u
IHNob3VsZCBiZQo+IGNvbnZlcnRpYmxlIHRvICNWRSBiZSBzcGVjaWZpY2FsbHkgZW5hYmxlZCBi
eSB0dXJuaW5nIHN1cHByZXNzX3ZlIG9mZi4KPiBUaGF0IHdvdWxkIGVsaW1pbmF0ZSB0aGUgcG9z
c2liaWxpdHkgb2YgaGF2aW5nIHRoZSBpbi1ndWVzdCBoYW5kbGVyCj4gZ2V0dGluZyAjVkUgZm9y
IHBhZ2VzIGl0IGlzIG5vdCByZWFkeSB0byBoYW5kbGUuIFRoZSBoeXBlcnZpc29yIChhbmQKPiB0
aGUgZXh0ZXJuYWwgVk1JIHRvb2xzdGFjaykgT1RPSCBzaG91bGQgYWx3YXlzIGJlIGluIGEgcG9z
aXRpb24gdG8KPiBoYW5kbGUgRVBUIHZpb2xhdGlvbnMgaXQgaXRzZWxmIGNhdXNlcyBieSBjaGFu
Z2luZyB0aGUgcGFnZQo+IHBlcm1pc3Npb25zLgoKQWN0dWFsbHksIG5vdyB0aGF0IEkgbG9va2Vk
IGF0IGl0LCB0aGF0J3MgX2V4YWN0bHlfIHdoYXQgd2UgZG8KYWxyZWFkeS4gVGhlIHN1cHByZXNz
X3ZlIGJpdCBpcyBhbHdheXMgc2V0IGZvciBhbGwgRVBUIHBhZ2VzLiBTbyB0aGlzCm9wZXJhdGlv
biBoZXJlIGlzIGdvaW5nIHRvIGJlIHVzZWQgdG8gZW5hYmxlICNWRSBmb3IgcGFnZXMsIG5vdCB0
aGUKb3RoZXIgd2F5IGFyb3VuZC4gU28gdGhlcmUgd291bGRuJ3QgYmUgYSBjYXNlIG9mICJwb3Rl
bnRpYWxseSBiZSAjVkUKd2hlbiB0aGVyZSBzaG91bGQgYmUgbm9uZSIuCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
