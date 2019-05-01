Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7171110877
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 15:49:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLpZL-0007gO-1Z; Wed, 01 May 2019 13:46:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q16C=TB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLpZJ-0007gD-3x
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 13:46:41 +0000
X-Inumbo-ID: 8b109e98-6c17-11e9-8510-b7072b7a2c68
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b109e98-6c17-11e9-8510-b7072b7a2c68;
 Wed, 01 May 2019 13:46:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556718398; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=CEvHGNEo+qAwWqAUSerEmokQgnEuwLihR/bjdBfUNxc=;
 b=Zewa2sv13+8l7BT520bnKaSqg/Fflqib1CefRtVqQvFxnzWhRnc3Q2uRdJx14OS/2ZJN4LHu
 ufCUgKFVWL9uxcVwgNYmbka57PQ4+gBvNvMvhJkFhdEPSnJEpgcgt9VljdvtYh6kJbjvnMQw
 MFDsibS+m8g9NI2ChCfSsCklWr0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mxa.mailgun.org with ESMTP id 5cc9a33d.7f6e36d39670-smtp-out-n01;
 Wed, 01 May 2019 13:46:37 -0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k16so24669029wrn.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 06:46:37 -0700 (PDT)
X-Gm-Message-State: APjAAAV8TDytOuInPaE+anZqKt2M64fLtK/3mfnFOlgbXKQJm70Z/gyD
 ZR6JVmxGQ6wbCM831/Ilu5+x22JUUePt3Z8VRr0=
X-Google-Smtp-Source: APXvYqxHRzWq0KFJYiUkzW8VBOu1d1f36gCcrMPM5M4TwjB/Dkqk8tCK9S/yWkZwkEdSlYTTB+mvsEzCoOFUftdmIME=
X-Received: by 2002:adf:b645:: with SMTP id i5mr17491665wre.272.1556718395954; 
 Wed, 01 May 2019 06:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
In-Reply-To: <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 1 May 2019 07:45:58 -0600
X-Gmail-Original-Message-ID: <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
Message-ID: <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
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

T24gV2VkLCBNYXkgMSwgMjAxOSBhdCAxOjUwIEFNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDEvMDUvMjAxOSAwNToyMiwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gQ3VycmVudGx5IHRoZSBnc19zaGFkb3cgdmFsdWUgaXMgb25seSBj
YWNoZWQgd2hlbiB0aGUgdkNQVSBpcyBiZWluZyBzY2hlZHVsZWQKPiA+IG91dCBieSBYZW4uIFJl
cG9ydGluZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1ZSB0aHJvdWdoIHZtX2V2ZW50IGlzIGlu
Y29ycmVjdCwKPiA+IHNpbmNlIGl0IGRvZXNuJ3QgcmVwcmVzZW50IHRoZSBhY3R1YWwgc3RhdGUg
b2YgdGhlIHZDUFUgYXQgdGhlIHRpbWUgdGhlIGV2ZW50Cj4gPiB3YXMgcmVjb3JkZWQuIFRoaXMg
cHJldmVudHMgdm1fZXZlbnQgc3Vic2NyaWJlcnMgZnJvbSBjb3JyZWN0bHkgZmluZGluZyBrZXJu
ZWwKPiA+IHN0cnVjdHVyZXMgaW4gdGhlIGd1ZXN0IHdoZW4gaXQgaXMgdHJhcHBlZCB3aGlsZSBp
biByaW5nMy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+Cj4gPiBDYzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5k
ZXIuY29tPgo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IENjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gQ2M6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gPiBDYzogUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni92bV9ldmVudC5jIHwgMiArLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYyBiL3hlbi9hcmNoL3g4Ni92bV9l
dmVudC5jCj4gPiBpbmRleCA1MWMzNDkzYjFkLi40NDY0OTQwZGE3IDEwMDY0NAo+ID4gLS0tIGEv
eGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5j
Cj4KPiBBY3R1YWxseSwgY29tZSB0byB0aGluayBvZiBpdCwgdGhlIHNhbWUgaXMgdHJ1ZSBmb3Ig
dGhlIFNZU0VOVEVSCj4gZGV0YWlscywgd2hpY2ggYnkgZGVmYXVsdCBhcmUgcmVhZC93cml0ZSB0
byB0aGUgZ3Vlc3Qgd2hpbGUgaXQgaXMKPiBzY2hlZHVsZWQuICBBcyBhIHJlc3VsdCwgdGhlIGRl
dGFpbHMgcmVwb3J0ZWQgaGVyZSB3aWxsIGZyb20gdGhlIGxhc3QKPiB2Y3B1IGNvbnRleHQgc3dp
dGNoLCBhbmQgcG9zc2libHkgc3RhbGUuCgpJJ2xsIGxvb2sgaW50byBpdC4KCj4gSXQgbWlnaHQg
YmUgd29ydGggaW50cm9kdWNpbmcgYSAic3luYyBzdGF0ZSBmcm9tIGh3IiBob29rIHdoaWNoIGNv
bGxlY3RzCj4gYWxsIHRoZSBkYXRhIHdlIGludGVuZCB0byBwYXNzIHRvIHRoZSBpbnRyb3NwZWN0
aW9uIGFnZW50LgoKWW91IG1lYW4gYWRkaW5nIGFub3RoZXIgaHZtIGhvb2s/CgpUaGFua3MsClRh
bWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
