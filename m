Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2247AFB7D0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 19:41:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUxXV-0008CD-A4; Wed, 13 Nov 2019 18:38:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XROl=ZF=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iUxXU-0008C6-7A
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 18:38:48 +0000
X-Inumbo-ID: d3d6aa9c-0644-11ea-9631-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3d6aa9c-0644-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 18:38:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1573670327; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=IFsWIl3HcWmu31C8/Uy5NXNBxXlcdtGNyOth3U1ZGaM=;
 b=QOhCp+YV2CA2DjgbIazkKVl3ROGF6GIsIib69kofOSRsbQ1RSRX/NP209vG0gIqXGoQINGhl
 kEYllB8BsDbUzdlnc9/rkMx7bBdQzPyX3M0fATUke/Uwn4iEREYmTm4Ucrp87EKVkPIpv7SI
 p/bL4pj6AUB/chlw0k2Lmkmi6bI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mxa.mailgun.org with ESMTP id 5dcc4db5.7ff349f872b0-smtp-out-n02;
 Wed, 13 Nov 2019 18:38:45 -0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id i12so3581211wro.5
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 10:38:45 -0800 (PST)
X-Gm-Message-State: APjAAAWuBfmPE7JBn4rCoChxOItxEEJHMPAQ0CseydzUVn0DCMUiihSZ
 VsHn8wkbRe2zCEPcbLQYylpwfnu96IB1VsOwnd0=
X-Google-Smtp-Source: APXvYqzJCt35/+A1A+FTsIvWVTUSf/DI1aYNrZNSQD9OkrWlJvl/YyvoHpKF9biKLsAlLIGArD7ZajVCtsVWWPBFpj4=
X-Received: by 2002:a5d:4201:: with SMTP id n1mr3897123wrq.372.1573670324689; 
 Wed, 13 Nov 2019 10:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <CABfawhkjgmyYa11CMH1fBZG+Ee2ngvsoFzBvCixrj08FMcMT5A@mail.gmail.com>
 <2ba0e8d7-0e58-62c0-6c2b-8d9934b1137e@suse.com>
 <CABfawhnUtzWm25XOpr+BLkUuqA-OtpOUAh+91xBsk93dprWAyg@mail.gmail.com>
 <CABfawhkBqpiJNrLSMFhW7GnXwKAx2-7Hi+uH+F=9DJEVuhecaw@mail.gmail.com>
 <20633eaf-0bc4-939c-3f55-599a54c8e154@suse.com>
In-Reply-To: <20633eaf-0bc4-939c-3f55-599a54c8e154@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 13 Nov 2019 11:38:09 -0700
X-Gmail-Original-Message-ID: <CABfawhmKBF6RYMiacz_XjYvJQ9G4X7SHAWygoK3u3N+Z5H8crA@mail.gmail.com>
Message-ID: <CABfawhmKBF6RYMiacz_XjYvJQ9G4X7SHAWygoK3u3N+Z5H8crA@mail.gmail.com>
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

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgOTo1MiBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTMuMTEuMjAxOSAxNTo1NywgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgNzo1MSBBTSBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gVHVlLCBOb3YgMTIsIDIw
MTkgYXQgNzozMSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+
Pgo+ID4+PiBPbiAxMi4xMS4yMDE5IDE1OjA1LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+
PiBPbiBUdWUsIE5vdiAxMiwgMjAxOSBhdCA0OjU0IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6Cj4gPj4+Pj4gT24gMDYuMTEuMjAxOSAxNjozNSwgQWxleGFuZHJ1IFN0
ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gPj4+Pj4+ICsgICAgICAgIGVsc2UKPiA+Pj4+Pj4gKyAgICAg
ICAgewo+ID4+Pj4+PiArICAgICAgICAgICAgcmMgPSBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRp
KGQsICZhLnUuc3VwcHJlc3NfdmUpOwo+ID4+Pj4+PiArCj4gPj4+Pj4+ICsgICAgICAgICAgICBp
ZiAoIHJjID09IC1FUkVTVEFSVCApCj4gPj4+Pj4+ICsgICAgICAgICAgICAgICAgaWYgKCBfX2Nv
cHlfZmllbGRfdG9fZ3Vlc3QoZ3Vlc3RfaGFuZGxlX2Nhc3QoYXJnLAo+ID4+Pj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHhlbl9odm1fYWx0cDJtX29wX3Qp
LAo+ID4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZh
LCB1LnN1cHByZXNzX3ZlLm9wYXF1ZSkgKQo+ID4+Pj4+PiArICAgICAgICAgICAgICAgICAgICBy
YyA9IC1FRkFVTFQ7Cj4gPj4+Pj4KPiA+Pj4+PiBJZiB0aGUgb3BlcmF0aW9uIGlzIGJlc3QgZWZm
b3J0LCBfc29tZV8gaW5kaWNhdGlvbiBvZiBmYWlsdXJlIHNob3VsZAo+ID4+Pj4+IHN0aWxsIGJl
IGhhbmRlZCBiYWNrIHRvIHRoZSBjYWxsZXIuIFdoZXRoZXIgdGhhdCdzIHRocm91Z2ggdGhlIG9w
YXF1ZQo+ID4+Pj4+IGZpZWxkIG9yIGJ5IHNvbWUgb3RoZXIgbWVhbnMgaXMgc2Vjb25kYXJ5LiBJ
ZiBub3QgdmlhIHRoYXQgZmllbGQKPiA+Pj4+PiAod2hpY2ggd291bGQgbWFrZSB0aGUgb3V0ZXIg
b2YgdGhlIHR3byBpZigpLXMgZGlzYXBwZWFyKSwgcGxlYXNlIGZvbGQKPiA+Pj4+PiB0aGUgaWYo
KS1zLgo+ID4+Pj4KPiA+Pj4+IEF0IGxlYXN0IGZvciBtZW1fc2hhcmluZ19yYW5nZV9vcCB3ZSBh
bHNvIGRvIGEgYmVzdC1lZmZvcnQgYW5kIGRvbid0Cj4gPj4+PiByZXR1cm4gYW4gZXJyb3IgZm9y
IHBhZ2VzIHdoZXJlIGl0IHdhc24ndCBwb3NzaWJsZSB0byBzaGFyZS4gU28gSQo+ID4+Pj4gZG9u
J3QgdGhpbmsgaXQncyBhYnNvbHV0ZWx5IG5lY2Vzc2FyeSB0byBkbyB0aGF0LCBlc3BlY2lhbGx5
IGlmIHRoZQo+ID4+Pj4gY2FsbGVyIGNhbid0IGRvIGFueXRoaW5nIGFib3V0IHRob3NlIGVycm9y
cyBhbnl3YXkuCj4gPj4+Cj4gPj4+IG1lbS1zaGFyaW5nIGlzIGEgbGl0dGxlIGRpZmZlcmVudCBp
biBuYXR1cmUsIGlzbid0IGl0PyBJZiB5b3UKPiA+Pj4gY2FuJ3Qgc2hhcmUgYSBwYWdlLCBib3Ro
IGludm9sdmVkIGd1ZXN0cyB3aWxsIGNvbnRpbnVlIHRvIHJ1bgo+ID4+PiB3aXRoIHRoZWlyIG93
biBpbnN0YW5jZXMuIElmIHlvdSB3YW50IHRvIHN1cHByZXNzICNWRSBkZWxpdmVyeQo+ID4+PiBh
bmQgaXQgZmFpbHMsIGJlaGF2aW9yIHdvbid0IGJlIHRyYW5zcGFyZW50bHkgY29ycmVjdCwgYXMK
PiA+Pj4gdGhlcmUnbGwgcG90ZW50aWFsbHkgYmUgI1ZFIHdoZW4gdGhlcmUgc2hvdWxkIGJlIG5v
bmUuIFdoZXRoZXIKPiA+Pj4gdGhhdCdzIGJlbmlnbiB0byB0aGUgZ3Vlc3QgdmVyeSBtdWNoIGRl
cGVuZHMgb24gaXRzIGhhbmRsZXIuCj4gPj4KPiA+PiBNYWtlcyBtZSB3b25kZXIgd2hldGhlciBp
dCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8gZmxpcCB0aGlzIHRoaW5nIG9uCj4gPj4gaXRzIGhl
YWQgYW5kIGhhdmUgc3VwcmVzc192ZSBiZSBzZXQgYnkgZGVmYXVsdCAoc2luY2UgaXRzIGlnbm9y
ZWQgYnkKPiA+PiBkZWZhdWx0KSBhbmQgdGhlbiBoYXZlIHBhZ2VzIGZvciB3aGljaCB0aGUgRVBU
IHZpb2xhdGlvbiBzaG91bGQgYmUKPiA+PiBjb252ZXJ0aWJsZSB0byAjVkUgYmUgc3BlY2lmaWNh
bGx5IGVuYWJsZWQgYnkgdHVybmluZyBzdXBwcmVzc192ZSBvZmYuCj4gPj4gVGhhdCB3b3VsZCBl
bGltaW5hdGUgdGhlIHBvc3NpYmlsaXR5IG9mIGhhdmluZyB0aGUgaW4tZ3Vlc3QgaGFuZGxlcgo+
ID4+IGdldHRpbmcgI1ZFIGZvciBwYWdlcyBpdCBpcyBub3QgcmVhZHkgdG8gaGFuZGxlLiBUaGUg
aHlwZXJ2aXNvciAoYW5kCj4gPj4gdGhlIGV4dGVybmFsIFZNSSB0b29sc3RhY2spIE9UT0ggc2hv
dWxkIGFsd2F5cyBiZSBpbiBhIHBvc2l0aW9uIHRvCj4gPj4gaGFuZGxlIEVQVCB2aW9sYXRpb25z
IGl0IGl0c2VsZiBjYXVzZXMgYnkgY2hhbmdpbmcgdGhlIHBhZ2UKPiA+PiBwZXJtaXNzaW9ucy4K
PiA+Cj4gPiBBY3R1YWxseSwgbm93IHRoYXQgSSBsb29rZWQgYXQgaXQsIHRoYXQncyBfZXhhY3Rs
eV8gd2hhdCB3ZSBkbwo+ID4gYWxyZWFkeS4gVGhlIHN1cHByZXNzX3ZlIGJpdCBpcyBhbHdheXMg
c2V0IGZvciBhbGwgRVBUIHBhZ2VzLiBTbyB0aGlzCj4gPiBvcGVyYXRpb24gaGVyZSBpcyBnb2lu
ZyB0byBiZSB1c2VkIHRvIGVuYWJsZSAjVkUgZm9yIHBhZ2VzLCBub3QgdGhlCj4gPiBvdGhlciB3
YXkgYXJvdW5kLiBTbyB0aGVyZSB3b3VsZG4ndCBiZSBhIGNhc2Ugb2YgInBvdGVudGlhbGx5IGJl
ICNWRQo+ID4gd2hlbiB0aGVyZSBzaG91bGQgYmUgbm9uZSIuCj4KPiBCdXQgdGhpcyBkb2Vzbid0
IGNoYW5nZSB0aGUgYm90dG9tIGxpbmUgb2YgbXkgZWFybGllciBjb21tZW50OiBJdCdzCj4gYXMg
YmFkIHRvIGFuIE9TIHRvIHNlZSB0b28gbWFueSAjVkUgYXMgaXQgaXMgdG8gbWlzcyBhbnkgdGhh
dCBhcmUKPiBleHBlY3RlZC4KCkZhaXIgZW5vdWdoLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
