Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A93BB676D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 17:47:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAc7k-0006Uo-93; Wed, 18 Sep 2019 15:44:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=51Qx=XN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iAc7i-0006UP-4r
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 15:44:06 +0000
X-Inumbo-ID: 243c04aa-da2b-11e9-963b-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 243c04aa-da2b-11e9-963b-12813bfff9fa;
 Wed, 18 Sep 2019 15:44:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1568821445; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=e+p/bxdsqw5UtLCK5njFJHXnfUpgcE2hClRlYjIH1pg=;
 b=i64HTfNo8n8K8trkdtPcD4mtX72IU6d2sGEfYC+6CQUg+EZ2gKpBUuVerdzH064vQhhxwJy2
 yHgmpar8WGmCs/WbKwKmnTCSiTDYv6bXGwaYRTUXUhbZYl465ltUAE0CluuUcnf87khPdgDB
 gD7+11CC299FndQdQtSl1MNvIys=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mxa.mailgun.org with ESMTP id 5d8250c1.7f973f70fef0-smtp-out-n01;
 Wed, 18 Sep 2019 15:44:01 -0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id i16so664971wmd.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2019 08:44:00 -0700 (PDT)
X-Gm-Message-State: APjAAAUyDLk/QIeL7mmBwfOWEueMLC1Aq+1XcPnJ1MMlt1Z9WxDu9ybp
 Pwv4ZOzmw7iDnNoLNb5FeN8We6KWkUZ0xa+TwQw=
X-Google-Smtp-Source: APXvYqwYYTBL8MtM4KilXREUMPnTFh2nzchS6mcyL8tVp7D38eHS3kdDGvKtrjAXDcBj9Wn2vsBJaebOv6lflufWpAA=
X-Received: by 2002:a05:600c:295b:: with SMTP id
 n27mr3458799wmd.128.1568821440189; 
 Wed, 18 Sep 2019 08:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <8e2aae32-917c-8035-1aef-8b47c321e42b@suse.com>
 <9259c3e4-22e4-0e28-d89d-7e9c259411c5@citrix.com>
 <c15fa172-0cfc-7e51-c061-c452a91270b8@suse.com>
In-Reply-To: <c15fa172-0cfc-7e51-c061-c452a91270b8@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 18 Sep 2019 09:43:23 -0600
X-Gmail-Original-Message-ID: <CABfawhkFG8aPy=YCKOz63RXHqN_FiXDa31_zWW=AQRLkWq8rgQ@mail.gmail.com>
Message-ID: <CABfawhkFG8aPy=YCKOz63RXHqN_FiXDa31_zWW=AQRLkWq8rgQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2 4/9] x86/HVM: move NOFLUSH handling out
 of hvm_set_cr3()
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
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 SuraveeSuthikulpanit <suravee.suthikulpanit@amd.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMzoyOSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTcuMDkuMjAxOSAyMTozMSwgQW5kcmV3IENvb3BlciB3cm90
ZToKPiA+IE9uIDE3LzA5LzIwMTkgMDc6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
Cj4gPj4gQEAgLTIyODIsMTIgKzIyODcsMTEgQEAgaW50IGh2bV9zZXRfY3IwKHVuc2lnbmVkIGxv
bmcgdmFsdWUsIGJvbwo+ID4+ICAgICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPiA+PiAgfQo+ID4+
Cj4gPj4gLWludCBodm1fc2V0X2NyMyh1bnNpZ25lZCBsb25nIHZhbHVlLCBib29sIG1heV9kZWZl
cikKPiA+PiAraW50IGh2bV9zZXRfY3IzKHVuc2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wgbm9mbHVz
aCwgYm9vbCBtYXlfZGVmZXIpCj4gPj4gIHsKPiA+PiAgICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3Vy
cmVudDsKPiA+PiAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7Cj4gPj4gICAgICB1bnNpZ25l
ZCBsb25nIG9sZCA9IHYtPmFyY2guaHZtLmd1ZXN0X2NyWzNdOwo+ID4+IC0gICAgYm9vbCBub2Zs
dXNoID0gZmFsc2U7Cj4gPj4KPiA+PiAgICAgIGlmICggbWF5X2RlZmVyICYmIHVubGlrZWx5KHYt
PmRvbWFpbi0+YXJjaC5tb25pdG9yLndyaXRlX2N0cmxyZWdfZW5hYmxlZCAmCj4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBtb25pdG9yX2N0cmxyZWdfYml0bWFzayhWTV9FVkVO
VF9YODZfQ1IzKSkgKQo+ID4+IEBAIC0yMjk5LDE3ICsyMzAzLDEyIEBAIGludCBodm1fc2V0X2Ny
Myh1bnNpZ25lZCBsb25nIHZhbHVlLCBib28KPiA+PiAgICAgICAgICAgICAgLyogVGhlIGFjdHVh
bCB3cml0ZSB3aWxsIG9jY3VyIGluIGh2bV9kb19yZXN1bWUoKSwgaWYgcGVybWl0dGVkLiAqLwo+
ID4+ICAgICAgICAgICAgICB2LT5hcmNoLnZtX2V2ZW50LT53cml0ZV9kYXRhLmRvX3dyaXRlLmNy
MyA9IDE7Cj4gPj4gICAgICAgICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPndyaXRlX2RhdGEuY3Iz
ID0gdmFsdWU7Cj4gPj4gKyAgICAgICAgICAgIHYtPmFyY2gudm1fZXZlbnQtPndyaXRlX2RhdGEu
Y3IzX25vZmx1c2ggPSBub2ZsdXNoOwo+ID4KPiA+IC4uLiB0aGlzLCB3aGljaCBJJ20gcHJldHR5
IHN1cmUgYnJlYWtzIHRoZSByZXBvcnRpbmcgb2Ygbm9mbHVzaCBtb3YgdG8KPiA+IGNyMydzLiAg
VGhlIHNlbWFudGljcyBvZiB0aGUgVk1JIGhvb2sgaXMgInRoZSBndWVzdCB0cmllZCB0byB3cml0
ZSB0aGlzCj4gPiB2YWx1ZSB0byBjcjMiLCB3aGljaCBzaG91bGQgaW5jbHVkZSB0aGUgbm9mbHVz
aCBiaXQgaW4gaXRzIGFyY2hpdGVjdHVyYWwKPiA+IHBvc2l0aW9uLiAgSSBzdXNwZWN0IGl0IGFs
c28gYnJlYWtzIGEgcmVwbHkgd2l0aCB0aGUgbm9mbHVzaCBiaXQgc2V0LAo+ID4gYmVjYXVzZSBJ
IGRvbid0IHNlZSBhbnkgd2F5IHRoYXQgaXMgZmVkIGJhY2sgZnJvbSB0aGUgaW50cm9zcGVjdGlu
ZyBhZ2VudC4KPgo+IGh2bV9tb25pdG9yX2NyKCkgemFwcyB0aGUgYml0IG9mZiB0aGUgcmVwb3J0
ZWQgdmFsdWUuIEkgd29uZGVyCj4gd2hldGhlciB0aGUgcGF0Y2ggaGVyZSBzaG91bGQgaW5jbHVk
ZSByZW1vdmluZyB0aGlzIHphcHBpbmcsIGFzCj4gYmVpbmcgcmVkdW5kYW50IG5vdy4gSSBkb24n
dCB0aGluayB0aG91Z2ggdGhhdCB0aGUgcGF0Y2ggYWx0ZXJzCj4gYmVoYXZpb3IgaW4gdGhpcyBy
ZWdhcmQuCj4KPiA+IENDJ2luZyB0aGUgSW50cm9zcGVjdGlvbiBtYWludGFpbmVycyBmb3IgdGhl
aXIgdmlldy4KPgo+IEknbGwgd2FpdCBmb3IgdGhlaXIgZmVlZGJhY2sgYW55d2F5LCBiZWZvcmUg
bWFraW5nIGFueSBwb3NzaWJsZQo+IGNoYW5nZSB0byB0aGUgcGF0Y2guCj4KCkknbSBub3QgYXdh
cmUgb2YgYW55IHVzZS1jYXNlIG9mIHRoZSBDUjMgaW50cm9zcGVjdGlvbiB0aGF0IG5lZWRzIHRv
Cmtub3cgd2hldGhlciB0aGUgbm9mbHVzaCBiaXQgd2FzIHNldCBvciBub3QuIEhhdmluZyBpdCB6
YXBwZWQgYmVmb3JlCnRoZSBldmVudCBpcyBzZW50IG91dCBzaW1wbGlmaWVzIGhhbmRsaW5nIG9m
IENSMyBldmVudHMgYmVjYXVzZSB3ZQpkb24ndCBoYXZlIHRvIGNvbnN0YW50bHkgcmVwbHkgd2l0
aCBhIGRpZmZlcmVudCBjcjMgdmFsdWUgZnJvbSB0aGUKbW9uaXRvciBhZ2VudCB3aXRoIHRoYXQg
Yml0IG1hc2tlZC4gU28gdW5sZXNzIHRoYXQgY2hhbmdlcyBhbmQgd2UgY29tZQp1cCB3aXRoIGEg
dXNlY2FzZSB0aGF0IG5lZWRzIGl0IEkgd291bGRuJ3QgY2hhbmdlIGhvdyB0aGluZ3MgYXJlIHJp
Z2h0Cm5vdy4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
