Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1505110596
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 20:57:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icEGY-0002vN-2K; Tue, 03 Dec 2019 19:55:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zB0y=ZZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1icEGX-0002vI-2b
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 19:55:21 +0000
X-Inumbo-ID: d4c50710-1606-11ea-a55d-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4c50710-1606-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 19:55:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1575402920; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=oxVEQJEvgIu7EbsG9EFm02Pv7obxQcXHLRGzntKuDOg=;
 b=qZy7T96t5GZ3g2PnCpU6ukB6jtDiCv2F8LjZdVPHxmWu0v9qQiN8RwfaU9kulyceUIgw8L91
 iGc7sWchWuIlAohBJTE37Lf4PNlCyDv5VhA4S/Gvd4G6JqOiEGZfjMbJGeJ/yrhX02q+EgCA
 3298MdNuBVU47BdlDj/fKgeihKg=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mxa.mailgun.org with ESMTP id 5de6aabd.7f890ab0faf0-smtp-out-n03;
 Tue, 03 Dec 2019 18:34:37 -0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id t14so4710518wmi.5
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 10:34:37 -0800 (PST)
X-Gm-Message-State: APjAAAUHFJMBLruidX1qH+QntkReiiN8Dcs5kmtbM6wRuy6XuLuo2F/g
 arf2WDlVRZdfLqDcTIdcmzyUN5h1MbG0Ya6YS6E=
X-Google-Smtp-Source: APXvYqxytTS1WTQpXgrTqmmepXysIZqs6l8tmog8GcgB+S7IDdgu51nI87EdSiMYy9hZQRxSnJo6EeL9DhQTnyx0tj0=
X-Received: by 2002:a1c:7419:: with SMTP id p25mr24441163wmc.129.1575398076192; 
 Tue, 03 Dec 2019 10:34:36 -0800 (PST)
MIME-Version: 1.0
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
 <CABfawh=TP7oB5VLadnD1iC=k9sX1s1zJJQKxHR=HopzvNZns+g@mail.gmail.com>
 <10135f1d-2247-f6de-a46b-24eba40e44a7@citrix.com>
 <CABfawh=dkaCTw7Z8=P4M0DDL-KdsjBme3Sj536_-Q5bECY=DQw@mail.gmail.com>
 <CABfawhmpujFcQ9agXPG4KYxh8m5=dSju4ntwO9fVg8qAMQ6apg@mail.gmail.com>
 <74caecf7-807f-74a8-678d-ee0f3e0765b3@citrix.com>
In-Reply-To: <74caecf7-807f-74a8-678d-ee0f3e0765b3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Dec 2019 13:33:59 -0500
X-Gmail-Original-Message-ID: <CABfawhkYF1CxBkT-Jz6uAwO8DHjPq2ygP20QnyFJDOAy2jziig@mail.gmail.com>
Message-ID: <CABfawhkYF1CxBkT-Jz6uAwO8DHjPq2ygP20QnyFJDOAy2jziig@mail.gmail.com>
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

T24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjMxIFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDMvMTIvMjAxOSAxODoyNCwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjIyIFBNIFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4gPj4gT24gVHVlLCBEZWMgMywg
MjAxOSBhdCAxOjE4IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
IHdyb3RlOgo+ID4+PiBPbiAwMy8xMi8yMDE5IDE4OjA5LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6
Cj4gPj4+PiBPbiBUdWUsIERlYyAzLCAyMDE5IGF0IDE6MDUgUE0gVGFtYXMgSyBMZW5neWVsIDx0
YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3B1YmxpYy92bV9ldmVudC5oIGIveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiA+
Pj4+Pj4gaW5kZXggOTU5MDgzZDhjNC4uNzY2NzZmZjRjMCAxMDA2NDQKPiA+Pj4+Pj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiA+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL3ZtX2V2ZW50LmgKPiA+Pj4+Pj4gQEAgLTI4MSw2ICsyODEsNyBAQCBzdHJ1Y3Qgdm1f
ZXZlbnRfZGVidWcgewo+ID4+Pj4+PiAgICAgIHVpbnQzMl90IGluc25fbGVuZ3RoOwo+ID4+Pj4+
PiAgICAgIHVpbnQ4X3QgdHlwZTsgICAgICAgIC8qIEhWTU9QX1RSQVBfKiAqLwo+ID4+Pj4+PiAg
ICAgIHVpbnQ4X3QgX3BhZFszXTsKPiA+Pj4+Pj4gKyAgICB1aW50NjRfdCBwZW5kaW5nX2RiZzsK
PiA+Pj4+PiBUaGlzIGlzIGp1c3QgYSBuaXRwaWNrIGJ1dCBJIHdvdWxkIHByZWZlciBpZiB3ZSBo
YWQgdGhlIF9wYWQgZmllbGQgYXMKPiA+Pj4+PiB0aGUgbGFzdCBlbGVtZW50IGluIHRoZSBzdHJ1
Y3QgYW5kIGtlZXAgYWxsIDY0LWJpdCBtZW1iZXJzIHVwIGluIHRoZQo+ID4+Pj4+IGZyb250Lgo+
ID4+Pj4gQWxzbywgc2luY2UgcGVuZGluZ19kYmcgdXNlcyB1bnNpZ25lZCBpbnQgaW4gWGVuLCBk
byB3ZSBuZWVkIHVpbnQ2NF90Cj4gPj4+PiBmb3IgaXQgaGVyZT8gU2VlbXMgdG8gbWUgYSB1aW50
MzJfdCB3b3VsZCBzdWZmaWNlLgo+ID4+PiBJdHMgJWRyNiAoYnV0IG5vdCBxdWl0ZSwgZHVlIHRv
IGNvbXBsZXhpdHkgd2l0aCBleGNlcHRpb24gcHJpb3JpdGllcywKPiA+Pj4gaW50ZXJydXB0IHNo
YWRvd3MsIGFuZCBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eSBvZiB0aGUgUlRNIGJpdCB3aXRoCj4g
Pj4+IGludmVydGVkIHBvbGFyaXR5KS4gIEFsbCBvdGhlciByZWdpc3RlcnMgaGF2ZSA2NCBiaXQg
ZmllbGRzIGluIHRoZQo+ID4+PiBpbnRlcmZhY2UuCj4gPj4+Cj4gPj4+IFRoZSBvbmx5IGludGVy
ZXN0aW5nIGJpdHMgaW4gaXQgZmFsbCB3aXRoaW4gdGhlIGZpcnN0IDMyIHdoaWNoIGlzIHdoeSBp
dAo+ID4+PiBpcyBoYW5kbGVkIGluIGEgc2hvcnRlciB3YXkgd2l0aGluIFhlbi4gIExpa2UgJWNy
MCwgSSBkb24ndCBleHBlY3QKPiA+Pj4gYW55dGhpbmcgaW50ZXJlc3RpbmcgdG8gYXBwZWFyIGlu
IHRoZSB1cHBlciAzMiBiaXRzLgo+ID4+Pgo+ID4+IFBlcmhhcHMgaXQgd291bGQgYmUgYmV0dGVy
IHRvIGNhbGwgaXQgZHI2IGluIHRoZSBpbnRlcmZhY2UgdGhlbiB0bwo+ID4+IG1ha2UgaXQgbW9y
ZSBjbGVhciB0aGF0IHRoaXMgaXMgYSByZWdpc3RlciB2YWx1ZT8KPiA+Pgo+ID4gV2hpY2ggdGhl
biBiZWdzIHRoZSBxdWVzdGlvbiwgd2h5IG5vdCBqdXN0IHVzZSBkcjYgdGhhdCdzIGFscmVhZHkK
PiA+IHByZXNlbnQgaW4gdGhlIHZtX2V2ZW50X3JlZ3NfeDg2IHN0cnVjdD8KPgo+IEJlY2F1c2Ug
aXQgKHNwZWNpZmljYWxseSkgaXNuJ3QgZXhhY3RseSAlZHI2LiAgVGhlIEFCSSBpdCBmb2xsb3dz
IGlzCj4gc3RyaWN0bHkgbGlrZSB0aGUgVlQteCdzIHBlbmRpbmdfZGJnIFZNQ1MgZmllbGQuCj4K
PiBBbGwgYml0cyBoYXZlIHBvc2l0aXZlIHBvbGFyaXR5LCBhbmQgYXJlIHNwZWNpZmljIHRvIHRo
ZSBkZWJ1ZyBleGNlcHRpb24KPiBpbiBxdWVzdGlvbi4KPgo+ICVkcjYgYWNjdW11bGF0ZXMgc29t
ZSBkZWJ1ZyBiaXRzIG9yLXdpc2UgKGFuZCB1bnRpbCB0aGUgZ3Vlc3QgI0RCCj4gaGFuZGxlciBk
ZWNpZGVzIHRvIGNsZWFyIHRoZW0pLCBzb21lIGRlYnVnIGJpdHMgb3ZlcndyaXRlLXdpc2UsIGFu
ZCBzb21lCj4gYml0cyB3aXRoIGludmVydGVkIHBvbGFyaXR5Lgo+Cj4gUHJvdmlkaW5nICVkcjYg
YWxvbmUsIGVpdGhlciBiZWZvcmUgb3IgYWZ0ZXIgbWVyZ2luZyBwZW5kaW5nX2RiZywgaXMKPiBp
bnN1ZmZpY2llbnQgdG8gZGlzYW1iaWd1YXRlIHRoZSBkZWJ1ZyBleGNlcHRpb24uCj4KPiBwZW5k
aW5nX2RiZyBpcyBzdHJpY3RseSAidGhlIG5ldyBleGNlcHRpb24ocykgdG8gYWRkIGludG8gdGhl
ICVkcjYgbWl4Ii4KPgoKT0ssIHRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBTR1RNLgoKVGFt
YXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
