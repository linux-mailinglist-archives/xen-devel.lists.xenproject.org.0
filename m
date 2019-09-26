Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B305CBF4D2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:13:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUTX-00069c-Jb; Thu, 26 Sep 2019 14:10:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9s5i=XV=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iDUTW-00069S-04
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:10:30 +0000
X-Inumbo-ID: 63cd5c5a-e067-11e9-9655-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by localhost (Halon) with ESMTPS
 id 63cd5c5a-e067-11e9-9655-12813bfff9fa;
 Thu, 26 Sep 2019 14:10:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1569507029; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=FKheA17Xp2vTAnt4GaC8Cuc2CL04CiS1Fg9Q1cdGraQ=;
 b=JQHAumV2jsmi8NSS0ysZW8r1D6Ags9qBSFbno/kIhjzDqLo6GjeTQ/Wcq1ArcZUk6JLwdugf
 sbRvhh9IKvZDko3YpFVfyxcW6dIx3uRieOt0gzp2rVn1BIwrqG+LYSLC/kPVyGs/D3GVolu3
 IsfI+BlNL1TsA4KeaMP6l5/hM0I=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mxa.mailgun.org with ESMTP id 5d8cc6d2.7f350cbda9f0-smtp-out-n03;
 Thu, 26 Sep 2019 14:10:26 -0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y21so2775100wmi.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:10:26 -0700 (PDT)
X-Gm-Message-State: APjAAAUx2S8ugBGPAEPyF1qy0+0WyNlwmVrHcECBGbYzmzaQB97YIlja
 MtufMPbxTIWziE+LwP+FPVeTQZRT2kRvpN4Px2I=
X-Google-Smtp-Source: APXvYqySh9qsSZx4yjxU+8hJZfITfyfK5hdWYe/KExyRrIccHwnw3dKebk8Y8nogwET7KJYzaZArI3Y+mrjVdvHHAzQ=
X-Received: by 2002:a05:600c:295b:: with SMTP id
 n27mr3211232wmd.128.1569507024771; 
 Thu, 26 Sep 2019 07:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569425745.git.tamas.lengyel@intel.com>
 <e1fec257377046cf442842e27dff9bafc1f2bb27.1569425745.git.tamas.lengyel@intel.com>
 <2e648f3c-e5d3-c3eb-93d7-cde0a0058cb6@suse.com>
In-Reply-To: <2e648f3c-e5d3-c3eb-93d7-cde0a0058cb6@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Sep 2019 08:09:49 -0600
X-Gmail-Original-Message-ID: <CABfawhmkT61ADXJkodO064-5aNFpUY4ZLSGPKmHVWhxxDay1Yw@mail.gmail.com>
Message-ID: <CABfawhmkT61ADXJkodO064-5aNFpUY4ZLSGPKmHVWhxxDay1Yw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [RFC PATCH for-next 04/18] x86/mem_sharing: cleanup
 code in various locations
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MTUgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIDI1LjA5LjIwMTkgMTc6NDgsIFRhbWFzIEsgTGVuZ3llbCB3
cm90ZToKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKPiA+IEBAIC0xODc5LDEyICsxODc5LDExIEBAIGludCBodm1faGFwX25l
c3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKPiA+ICAgICAg
aWYgKCBucGZlYy53cml0ZV9hY2Nlc3MgJiYgKHAybXQgPT0gcDJtX3JhbV9zaGFyZWQpICkKPiA+
ICAgICAgewo+ID4gICAgICAgICAgQVNTRVJUKHAybV9pc19ob3N0cDJtKHAybSkpOwo+ID4gLSAg
ICAgICAgc2hhcmluZ19lbm9tZW0gPQo+ID4gLSAgICAgICAgICAgIChtZW1fc2hhcmluZ191bnNo
YXJlX3BhZ2UoY3VycmQsIGdmbiwgMCkgPCAwKTsKPiA+ICsgICAgICAgIHNoYXJpbmdfZW5vbWVt
ID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGN1cnJkLCBnZm4sIDApOwo+Cj4gSSBndWVzcyB0
aGUgaW1wbGljYXRpb24gaGVyZSBpcyB0aGF0IHRoZSBmdW5jdGlvbiBjYW4gb25seSByZXR1cm4K
PiAtRU5PTUVNPyBOb3QgdmVyeSBmb3J3YXJkIGNvbXBhdGlibGUsIGJ1dCB3ZWxsLiBIb3dldmVy
LCBpZiB5b3UKPiB0b3VjaCB0aGlzIGFscmVhZHksIHNob3VsZG4ndCB5b3UgYXQgbGVhc3QgbWFr
ZSAic2hhcmluZ19lbm9tZW0iCj4gYm9vbD8KCkNvcnJlY3QsIHRoZXJlIGlzIGEgQlVHX09OIGZv
ciBldmVyeSBvdGhlciByYyB2YWx1ZSBidXQgRU5PTUVNLiBXZQpjb3VsZCB0dXJuIGl0IGludG8g
YSBib29sIGJ1dCBJIGRvbid0IHNlZSBhIHJlYXNvbiBmb3IgaXQsIHBlcmhhcHMKdGhlcmUgd2ls
bCBiZSBhbm90aGVyIHJjIHZhbHVlIGluIHRoZSBmdXR1cmUgdGhhdCB3ZSB3YW50IHRvIGhhbmRs
ZQpncmFjZWZ1bGx5LgoKPgo+ID4gQEAgLTEyNDAsMTEgKzEyNzcsMTEgQEAgaW50IF9fbWVtX3No
YXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCj4gPiAgICAgIG1lbV9zaGFyaW5n
X3BhZ2VfdW5sb2NrKG9sZF9wYWdlKTsKPiA+ICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUob2xkX3Bh
Z2UpOwo+ID4KPiA+IC1wcml2YXRlX3BhZ2VfZm91bmQ6Cj4gPiArcHJpdmF0ZV9wYWdlX2ZvdW5k
Ogo+Cj4gUGxlYXNlIGFsc28gaW5kZW50IHRoaXMgbGFiZWwgYnkgKGF0IGxlYXN0KSBvbmUgYmxh
bmsuCgpPSwoKPgo+ID4gQEAgLTU3LDM0ICs1OSwzNCBAQCBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2lu
Zm8KPiA+ICAgICAgfTsKPiA+ICB9Owo+ID4KPiA+IC0jZGVmaW5lIHNoYXJpbmdfc3VwcG9ydGVk
KF9kKSBcCj4gPiAtICAgIChpc19odm1fZG9tYWluKF9kKSAmJiBwYWdpbmdfbW9kZV9oYXAoX2Qp
KQo+ID4gLQo+ID4gIHVuc2lnbmVkIGludCBtZW1fc2hhcmluZ19nZXRfbnJfc2F2ZWRfbWZucyh2
b2lkKTsKPiA+ICB1bnNpZ25lZCBpbnQgbWVtX3NoYXJpbmdfZ2V0X25yX3NoYXJlZF9tZm5zKHZv
aWQpOwo+ID4KPiA+ICAjZGVmaW5lIE1FTV9TSEFSSU5HX0RFU1RST1lfR0ZOICAgICAgICgxPDwx
KQo+ID4gIC8qIE9ubHkgZmFpbHMgd2l0aCAtRU5PTUVNLiBFbmZvcmNlIGl0IHdpdGggYSBCVUdf
T04gd3JhcHBlci4gKi8KPiA+ICBpbnQgX19tZW1fc2hhcmluZ191bnNoYXJlX3BhZ2Uoc3RydWN0
IGRvbWFpbiAqZCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgZ2ZuLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgZmxhZ3Mp
Owo+ID4gLXN0YXRpYyBpbmxpbmUgaW50IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3Qg
ZG9tYWluICpkLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGdmbiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDE2X3QgZmxhZ3MpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50MTZfdCBmbGFncyk7Cj4gPiArCj4gPiArc3RhdGljIGlubGluZQo+ID4gK2ludCBt
ZW1fc2hhcmluZ191bnNoYXJlX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuLAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDE2X3QgZmxhZ3MpCj4gPiAgewo+ID4gICAgICBpbnQgcmMgPSBf
X21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShkLCBnZm4sIGZsYWdzKTsKPiA+ICAgICAgQlVHX09O
KCByYyAmJiAocmMgIT0gLUVOT01FTSkgKTsKPgo+IFdvdWxkIHlvdSBtaW5kIGFsc28gZHJvcHBp
bmcgdGhlIHN0cmF5IGJsYW5rcyBoZXJlPwo+CgpTdXJlLgoKVGhhbmtzLApUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
