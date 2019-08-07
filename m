Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EDB84F63
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNQr-0003tB-EI; Wed, 07 Aug 2019 15:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=besu=WD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvNQp-0003t5-Cs
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:00:51 +0000
X-Inumbo-ID: 23d99838-b924-11e9-8370-7fd502c26c9b
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23d99838-b924-11e9-8370-7fd502c26c9b;
 Wed, 07 Aug 2019 15:00:48 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jrPePL3klIsjLJP1k2tZ/qnWjn5usTxEIS+JBeF6FCdmTOrS6lo9sW7bLvevUHhFnXsSWZ2xik
 WjnRR8B0iuvZMhUj5OX/3KGGWoU63tjKl9jIb/QrFXiechdgTfpEBUukos1vo49zRot9vhBR05
 2TQg8MVsmmToKLTsYdXJfXN5CTDkYTYAwvIUOjoC3CmM+d703ILyrDqVZml6/GpyRzrdMASecw
 kabt5RIKR63Pbc9M2DRpHeKo7DieEWt7zVuBYaxkT8VwzdP5ws+sAN0RLYBINik4bsymFESDdK
 V24=
X-SBRS: 2.7
X-MesageID: 4023389
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4023389"
To: Jan Beulich <jbeulich@suse.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
 <d0c34b24-697e-fbc1-3d7d-741e0f37c768@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <83a583e2-f4f2-8519-ce58-b200987dcab5@citrix.com>
Date: Wed, 7 Aug 2019 16:00:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d0c34b24-697e-fbc1-3d7d-741e0f37c768@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDgvMjAxOSAxNTozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDcuMDguMjAxOSAx
NTo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDcvMDgvMjAxOSAxMjoyMCwgRXNsYW0g
RWxuaWtldHkgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4+PiBpbmRleCAxOTQ4NmQ1ZTMyLi42
NTRiNGZkZDIyIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4+
PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKPj4+IEBAIC02NCw2ICs2NCw5IEBA
IHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiB7Cj4+PiDCoMKgIC8qIElzIHRoaXMgYSB4
ZW5zdG9yZSBkb21haW4/ICovCj4+PiDCoCAjZGVmaW5lIF9YRU5fRE9NQ1RMX0NERl94c19kb21h
aW7CoMKgwqDCoCA0Cj4+PiDCoCAjZGVmaW5lIFhFTl9ET01DVExfQ0RGX3hzX2RvbWFpbsKgwqDC
oMKgwqAgKDFVPDxfWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluKQo+Pj4gKyAvKiBEaXNhYmxlIEZJ
Rk8gZXZlbnQgY2hhbm5lbHM/ICovCj4+PiArI2RlZmluZSBfWEVOX0RPTUNUTF9DREZfZGlzYWJs
ZV9maWZvwqAgNQo+Pj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvwqDCoAo+
Pj4gKDFVPDxfWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvKQo+Pj4gwqDCoMKgwqDCoCB1aW50
MzJfdCBmbGFnczsKPj4KPj4gT24gdGhlIHN1YmplY3Qgb2YgdGhlIHRoZSBwYXRjaCBpdHNlbGYs
IEkgdGhpbmsgdGhpcyBpcyBicm9hZGx5IHRoZQo+PiByaWdodCBwcmluY2lwbGUsIGJ1dCB3YW50
cyB0byBiZSBleHByZXNzZWQgZGlmZmVyZW50bHkuCj4+Cj4+IEZpcnN0LCB5b3UnbGwgd2FudCB0
byByZWJhc2Ugb250byBhIHZlcnkgcmVjZW50IG1hc3RlciwgYW5kIHNwZWNpZmljYWxseQo+PiBv
dmVyIGMvcyBkOGYyNDkwNTYxZWIgd2hpY2ggaGFzIGNoYW5nZWQgaG93IHRoaXMgZmllbGQgaXMg
aGFuZGxlZCBpbgo+PiBYZW4uCj4+Cj4+IEZ1cnRoZXJtb3JlLCBpZiB0aGVyZSBpcyB0aGlzIHBy
b2JsZW0gZm9yIGV2ZW50IGNoYW5uZWxzLCB0aGVuIHRoZXJlIGlzCj4+IGFsbW9zdCBjZXJ0YWlu
bHkgYSByZWxhdGVkIHByb2JsZW0gZm9yIGdyYW50IHRhYmxlcy4KPj4KPj4gVGhlIGNvbnRyb2wg
aW4gWGVuIHNob3VsZCBiZSBleHByZXNzZWQgaW4gYSBwb3NpdGl2ZSBmb3JtLCBvciB0aGUgbG9n
aWMKPj4gd2lsbCBiZWNvbWUgYSB0YW5nbGUuwqAgSXQgc2hvdWxkIGJlIGEgYml0IHBlcm1pdHRp
bmcgdGhlIHVzZSBvZiB0aGUgRklGTwo+PiBBQkksIHJhdGhlciB0aGFuIGEgYml0IHNheWluZyAi
b2ggYWN0dWFsbHksIHlvdSBjYW4ndCB1c2UgdGhhdCIuCj4+Cj4+IFRoYXQgc2FpZCwgaXQgbWln
aHQgYmUgZWFzaWVyIHRvIGRlY2xhcmUgRklGTyB0byBiZSAiZXZlbnQgY2hhbm5lbCB2MiIsCj4+
IGFuZCBzcGVjaWZ5IG1heF97Z3JhbnQsZXZudGNobn1fdmVyIGluc3RlYWQuCj4KPiBJJ20gbm90
IHN1cmUgYXNzdW1pbmcgbGluZWFyIChvciBhY3R1YWxseSBhbnkpIG9yZGVyaW5nIGJldHdlZW4K
PiB2YXJpYW50cyBpcyBhIGdvb2QgdGhpbmcuIFllcywgcmlnaHQgbm93IHdlIG9ubHkgaGF2ZSBn
bnR0YWIKPiB2MSBhbmQgdjIgYW5kIGV2dGNobiAybCBhbmQgZmlmbywgd2hpY2ggY291bGQgYmUg
Y29uc2lkZXJlZCB2MQo+IGFuZCB2MiBhcyB5b3Ugc3VnZ2VzdC4gSG93ZXZlciwgYXNzdW1pbmcg
YSAzcmQgdmFyaWFudCBzdXJmYWNlcywKPiB3aHkgd291bGQgaXQgYmUgdGhhdCBvbmUgaGFzIHRv
IGV4cG9zZSB2MiBqdXN0IHRvIG1ha2UgdjMKPiB1c2FibGU/IEluIHBhcnRpY3VsYXIgZ250dGFi
IHYyIGhhcyB2YXJpb3VzIGlzc3VlcyAod2hpY2ggaXMgd2h5Cj4geW91IGludHJvZHVjZWQgYSB3
YXkgdG8gZGlzYWJsZSBpdHMgdXNlIGluIHRoZSBmaXJzdCBwbGFjZSksIHlldAo+IEknZCBob3Bl
IHdlJ2QgZW5kIHVwIHdpdGggYSBsZXNzIHF1aXJreSB2MyBpZiBvbmUgZXZlciBiZWNvbWVzCj4g
bmVjZXNzYXJ5LiBBbmQgaW4gdHVybiBJJ2QgaG9wZSB3ZSBjb3VsZCBoaWRlIHYyIGZyb20gYW55
IHYzCj4gdXNlcnMuCj4KPiBJT1cgSSB0aGluayBhIGJpdG1hcCB0byBwZXJtaXQgdXNlIG9mICJh
ZHZhbmNlZCIgdmVyc2lvbnMgaXMKPiBtb3JlIGZ1dHVyZSBwcm9vZi4gKEFzIGEgc2lkZSBub3Rl
LCBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8KPiBpbnRyb2R1Y2UgYSBkaXNhYmxlIGZvciB0aGUg
cmVzcGVjdGl2ZSB2MSBpbnRlcmZhY2VzLikKCldlIGFic29sdXRlbHkgZG8gd2FudCBhIHdheSB0
byB0dXJuIGV2ZXJ5dGhpbmcgb2ZmLgoKVGhlIGluYWJpbGl0eSB0byB0dXJuIHRoZSBYZW4gZXh0
ZW5zaW9ucyBvZmYgZm9yIEhWTSBndWVzdHMgKGV2ZW4gaWYKb25seSBmb3IgZGVidWdnaW5nIHB1
cnBvc2VzKSBpcyBhIHNldmVyZWx5IHNob3J0IHNpZ2h0ZWQgZGVjaXNpb24uCgpJdCBpcyBhbHNv
IGEgZmVhdHVyZSB3aGljaCBoYXMgYmVlbiByZXF1ZXN0ZWQgcmVwZWF0ZWRseSBieSB1c2VycyBp
biB0aGUKcGFzdCwgYW5kIEkgYW0gdmVyeSBkZWxpYmVyYXRlbHkgYnVpbGRpbmcgYSB3YXkgdG8g
ZG8gdGhpcyBpbnRvIHRoZQpDUFVJRCB3b3JrLgoKSG93ZXZlciwgaXQgaXMgYW4gdW5yZWFzb25h
YmxlIHJlcXVlc3QgdG8gYnVuZGxlIGludG8gdGhpcyBidWdmaXgsIGhlbmNlCndoeSBJIGRpZG4n
dCBzdWdnZXN0IGl0LgoKTm93IEkgdGhpbmsgYWJvdXQgaXQsIHRoaW5ncyBsaWtlIGF2YWlsYWJs
ZSBBQklzIHJlYWxseSBzaG91bGQgYmUgaW4gdGhlClhlbiBoeXBlcnZpc29yIENQVUlEIGxlYXZl
cywgYnV0IGFnYWluLCB0aGF0IHNoaXAgc2FpbGVkIGEgZGVjYWRlIGFnby4KCn5BbmRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
