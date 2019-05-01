Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCA10BD9
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 19:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLslW-0001fe-24; Wed, 01 May 2019 17:11:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q16C=TB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLslU-0001fY-ND
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 17:11:28 +0000
X-Inumbo-ID: 277bbda0-6c34-11e9-864d-0fc525ac8dc4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 277bbda0-6c34-11e9-864d-0fc525ac8dc4;
 Wed, 01 May 2019 17:11:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556730687; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=xNNNAUSoS1RYQRXeAwzMWBm61PegbnaMsiYQSOvPHrI=;
 b=UW+lCyPDL6IK6l2ZvIqoRSycY/WMT5/hnWKHGrxR7Nn8YEoZUTuK/pfw7HZeWoZN9lujnLcN
 BJzoYjy4Cmzwt08xy+v6iuJDeVXg/F3ICyEPoe6xQ9YEcCE+jpbBiawlUjhSmKcFhhBJKV9n
 LPSYQrz8axlkKWKw+6yXDdlI+bI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mxa.mailgun.org with ESMTP id 5cc9d33d.7f2fd124edf0-smtp-out-n01;
 Wed, 01 May 2019 17:11:25 -0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id o4so13349557wra.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 10:11:25 -0700 (PDT)
X-Gm-Message-State: APjAAAXK+jOtWdYo2VkR/FOnkVZ2T95umB/xp/tI3qZX7vtioqCXu8WR
 jdLKwgcToQsS48X7s8e3G5Zy0ytRDLm3+9CLAEE=
X-Google-Smtp-Source: APXvYqz0YAh+VlPP2rtadRoDA2hPlHjDX1o5L9V9H6yZCeAXATn0m6GZoRiCvAdyCk4IUPrKTwbr0kZiq+BL0GdIsQ0=
X-Received: by 2002:adf:e989:: with SMTP id h9mr1459926wrm.157.1556730684898; 
 Wed, 01 May 2019 10:11:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
 <CABfawhk_cCzL0XVUp6h-5QvXBDwqwf87+CqBvPDdeAHqAcrmvw@mail.gmail.com>
 <cfddf089-496e-d935-2470-20afa280ba78@citrix.com>
In-Reply-To: <cfddf089-496e-d935-2470-20afa280ba78@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 1 May 2019 11:10:47 -0600
X-Gmail-Original-Message-ID: <CABfawhkht5AO5Vz7yxhRXvb40u5Bx2S3m7J-pn1GKTpLqWda4w@mail.gmail.com>
Message-ID: <CABfawhkht5AO5Vz7yxhRXvb40u5Bx2S3m7J-pn1GKTpLqWda4w@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: correctly gather gs_shadow
 value
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMSwgMjAxOSBhdCAxMTowMyBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDAxLzA1LzIwMTkgMTU6NTgsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDEsIDIwMTkgYXQgNzo0NSBBTSBUYW1hcyBL
IExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4+IE9uIFdlZCwgTWF5IDEs
IDIwMTkgYXQgMTo1MCBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PiB3cm90ZToKPiA+Pj4gT24gMDEvMDUvMjAxOSAwNToyMiwgVGFtYXMgSyBMZW5neWVsIHdyb3Rl
Ogo+ID4+Pj4gQ3VycmVudGx5IHRoZSBnc19zaGFkb3cgdmFsdWUgaXMgb25seSBjYWNoZWQgd2hl
biB0aGUgdkNQVSBpcyBiZWluZyBzY2hlZHVsZWQKPiA+Pj4+IG91dCBieSBYZW4uIFJlcG9ydGlu
ZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1ZSB0aHJvdWdoIHZtX2V2ZW50IGlzIGluY29ycmVj
dCwKPiA+Pj4+IHNpbmNlIGl0IGRvZXNuJ3QgcmVwcmVzZW50IHRoZSBhY3R1YWwgc3RhdGUgb2Yg
dGhlIHZDUFUgYXQgdGhlIHRpbWUgdGhlIGV2ZW50Cj4gPj4+PiB3YXMgcmVjb3JkZWQuIFRoaXMg
cHJldmVudHMgdm1fZXZlbnQgc3Vic2NyaWJlcnMgZnJvbSBjb3JyZWN0bHkgZmluZGluZyBrZXJu
ZWwKPiA+Pj4+IHN0cnVjdHVyZXMgaW4gdGhlIGd1ZXN0IHdoZW4gaXQgaXMgdHJhcHBlZCB3aGls
ZSBpbiByaW5nMy4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gPj4+PiBDYzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPgo+ID4+Pj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KPiA+Pj4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
Pgo+ID4+Pj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPj4+PiBDYzogUm9n
ZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gIHhl
bi9hcmNoL3g4Ni92bV9ldmVudC5jIHwgMiArLQo+ID4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvdm1fZXZlbnQuYyBiL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jCj4gPj4+PiBpbmRl
eCA1MWMzNDkzYjFkLi40NDY0OTQwZGE3IDEwMDY0NAo+ID4+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L3ZtX2V2ZW50LmMKPiA+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jCj4gPj4+IEFj
dHVhbGx5LCBjb21lIHRvIHRoaW5rIG9mIGl0LCB0aGUgc2FtZSBpcyB0cnVlIGZvciB0aGUgU1lT
RU5URVIKPiA+Pj4gZGV0YWlscywgd2hpY2ggYnkgZGVmYXVsdCBhcmUgcmVhZC93cml0ZSB0byB0
aGUgZ3Vlc3Qgd2hpbGUgaXQgaXMKPiA+Pj4gc2NoZWR1bGVkLiAgQXMgYSByZXN1bHQsIHRoZSBk
ZXRhaWxzIHJlcG9ydGVkIGhlcmUgd2lsbCBmcm9tIHRoZSBsYXN0Cj4gPj4+IHZjcHUgY29udGV4
dCBzd2l0Y2gsIGFuZCBwb3NzaWJseSBzdGFsZS4KPiA+PiBJJ2xsIGxvb2sgaW50byBpdC4KPiA+
IFRoZSBzeXNlbnRlciB2YWx1ZXMgbG9vayBmaW5lIHRvIG1lIGJlY2F1c2Ugdm14X3NhdmVfdm1j
c19jdHh0IGNhbGxzCj4gPiB2bXhfdm1jc19zYXZlLCB3aGljaCByZWZyZXNoZXMgdGhlIHZhbHVl
cyBmcm9tIHRoZSBhY3R1YWwgVk1DUy4gSXQncwo+ID4gb25seSBzaGFkb3dfZ3MgdGhhdCBpcyBu
b3QgcmVmcmVzaGVkLgo+Cj4gU28sIHlvdSBhcmUgY29ycmVjdCB0aGF0IHdlIGNhbGwgaW50byB2
bXhfdm1jc19zYXZlKCkgd2hpY2ggY2F1c2VzIHRoZQo+IFNZU0VOVEVSIGRldGFpbHMgdG8gYmUg
Y29ycmVjdC4KPgo+IEhvd2V2ZXIsIHRoZSBzYW1lIHBhdGggYWxzbyBjYWxscyB2bXhfc2F2ZV9j
cHVfc3RhdGUoKSB3aGljaCBzYXZlcwo+IHNoYWRvd19ncywgYW5kIHRoZXJlZm9yZSBvdWdodCB0
byBEVFJUIGZvciB0aGUgcHJldmlvdXMgdXNlIGluIHZtX2V2ZW50Lgo+Cj4gVGhlIHByb2JsZW0g
aXMgdGhhdCB2bXhfe3NhdmUsbG9hZH1fY3B1X3N0YXRlKCkgb25seSBmdW5jdGlvbiBjb3JyZWN0
bHkKPiBpbiByZW1vdGUgY29udGV4dCwgd2hpY2ggaXMgd2h5IHRoZSBzdGFsZSBzaGFkb3dfZ3Mg
cGVyc2lzdHMuCj4KPiBDb250cmFyeSB0byB3aGF0IEkgc2FpZCBlYXJsaWVyLCBJIG5vdyB0aGlu
ayB0aGF0IGEgYmV0dGVyIGZpeCB3b3VsZCBiZQo+IHRvIG1ha2UgdGhlIGFib3ZlIGZ1bmN0aW9u
cyBzYWZlIHRvIHVzZSB1c2UgaW4gY3VycmVudCBjb250ZXh0IChhdCBsZWFzdAo+IGZvciB0aGUg
c2F2ZSBzaWRlIC0gdGhlIHJlc3RvcmUgc2lkZSBjYW4gcHJvYmFibHkganVzdCBBU1NFUlQoKSBh
dG0sIGFzCj4gaXQgZG9lc24ndCBzZWVtIHRvIGhhdmUgYW4gZXF1aXZhbGVudCB1c2UpLgo+Cj4g
VGhhdCB3YXksIHRoZSB2bV9ldmVudCBjb2RlIGRvZXNuJ3QgbmVlZCB0byBjb250YWluIGFueQo+
IGNvbnRleHQtc2Vuc2l0aXZlIGNvZGUsIHdoaWNoIGlzIGEgYmV0dGVyIG92ZXJhbGwsIElNTy4K
ClNvdW5kcyBnb29kIHRvIG1lLiBTbyBhICJ2ID09IGN1cnJlbnQiIGNhc2UgdG8gcmVmcmVzaCB0
aGUgZ3Nfc2hhZG93CnZhbHVlIGlzIGFsbCB0aGlzIHdpbGwgZW50YWlsLCBjb3JyZWN0PwoKVGhh
bmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
