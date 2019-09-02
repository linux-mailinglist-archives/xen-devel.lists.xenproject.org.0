Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA77BA51E4
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:36:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hnF-0005KT-Do; Mon, 02 Sep 2019 08:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R1Xd=W5=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i4hnD-0005KM-Ty
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:34:31 +0000
X-Inumbo-ID: 7b93e686-cd5c-11e9-ac23-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b93e686-cd5c-11e9-ac23-bc764e2007e4;
 Mon, 02 Sep 2019 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567413272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=og//nqbqFbykc/uMx1lrHCN7/+FYnj7wmKPsFqfej+I=;
 b=SLmujDv3/HT8Uw5k9oYz4mbGmbe5GtaW+4ple9d99rQz/13NauGaR3mM
 ijPxc9d1xls4yz14ZatGeJyu8zl96XnRNzsG5V5QGZKSZMwYXdrRWQnDn
 KuBhPCL8oHqQto2jqs1rPTNIsZCQk5pMjdoQMozsI70/aDW6llAd2trHr o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6U8UyneYk3jzvhMANPdUuDiphmmx3+LE1T8CSCLbAipD9O0QE9/PFiNoW1R4kC1ZZqL1Vagi4E
 Y1rH9wi315HBHLowh9S+jg7rAid1n2Uo/E3im1ZYHOzaNW2QADRLqg5HvEhvJ8yliTOfD3XRQx
 fzPMfM8yIiA3TPGTr7SuCJXROgI6ohUXJGahczKxReqULUaOQh4k7YYi7LhSKCwAaXt6DJ3IpZ
 5Bvkh5JcLctTsk3sgrjkenHLfYjFWWPxPZYCKL1JNTCSQEda1SreStAuaR9LSJ3TgXHaHj9Jqq
 0uA=
X-SBRS: 2.7
X-MesageID: 5017898
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,457,1559534400"; 
   d="scan'208";a="5017898"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Steven Haigh' <netwiz@crc.id.au>
Thread-Topic: Windows HVM no longer boots with AMD Ryzen 3700X (and 3900X)
Thread-Index: AQHVYS/C+HQxXSiQEUCMz+59RzWjzqcXfpcAgACHy+D//+D4gIAAIyfg///hnoCAAAGfgIAAIckw
Date: Mon, 2 Sep 2019 08:34:26 +0000
Message-ID: <dbac9421b8994c31b160c0e3a95db277@AMSPEX02CL03.citrite.net>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
 <71fad1413643be2df5f2291270b60448@crc.id.au>
 <cbbfaf3c5d4e12358c635054198bce17@crc.id.au>
 <869a473b1f7342c48f2198e46b6c8427@AMSPEX02CL03.citrite.net>
 <2d859d487c294b8d98749dccaf735c96@crc.id.au>
 <b3b0c2de1e364adea566eb961ba3d727@AMSPEX02CL03.citrite.net>
 <655d59e7e876a1f08637ffd52c26a6aa@crc.id.au>
 <e1d0c2c4a2f88777f82eed559cc68554@crc.id.au>
In-Reply-To: <e1d0c2c4a2f88777f82eed559cc68554@crc.id.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
 (and 3900X)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Andreas Kinzler <hfp@posteo.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV2ZW4gSGFpZ2ggPG5ldHdp
ekBjcmMuaWQuYXU+DQo+IFNlbnQ6IDAyIFNlcHRlbWJlciAyMDE5IDA5OjMyDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFuZHJlYXMgS2luemxlciA8aGZwQHBvc3Rlby5k
ZT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFdp
bmRvd3MgSFZNIG5vIGxvbmdlciBib290cyB3aXRoIEFNRCBSeXplbiAzNzAwWCAoYW5kIDM5MDBY
KQ0KPiANCj4gT24gMjAxOS0wOS0wMiAxODoyNSwgU3RldmVuIEhhaWdoIHdyb3RlOg0KPiA+IE9u
IDIwMTktMDktMDIgMTg6MjAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBTdGV2ZW4gSGFpZ2ggPG5ldHdpekBjcmMuaWQu
YXU+DQo+ID4+PiBTZW50OiAwMiBTZXB0ZW1iZXIgMjAxOSAwOTowOQ0KPiA+Pj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+ID4+PiBDYzogQW5kcmVhcyBLaW56
bGVyIDxoZnBAcG9zdGVvLmRlPjsgQW5kcmV3IENvb3Blcg0KPiA+Pj4gPEFuZHJldy5Db29wZXIz
QGNpdHJpeC5jb20+OyB4ZW4tDQo+ID4+PiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+
Pj4gU3ViamVjdDogUmU6IFdpbmRvd3MgSFZNIG5vIGxvbmdlciBib290cyB3aXRoIEFNRCBSeXpl
biAzNzAwWCAoYW5kDQo+ID4+PiAzOTAwWCkNCj4gPj4+DQo+ID4+PiBPbiAyMDE5LTA5LTAyIDE4
OjA0LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+Pj4gPj4gRnVydGhlciB0byB0aGUgYWJvdmUsIEkgZGlkIHNvbWUgZXhwZXJpbWVu
dGF0aW9uLiBUaGUgZm9sbG93aW5nIGlzIGENCj4gPj4+ID4+IGxpc3Qgb2YgYXR0ZW1wdGVkIGJv
b3QgY29uZmlndXJhdGlvbnMgYW5kIHRoZWlyIG91dGNvbWVzOg0KPiA+Pj4gPj4NCj4gPj4+ID4+
IHZpcmlkaWFuPTENCj4gPj4+ID4+IHZjcHVzPTQNCj4gPj4+ID4+IFNUT1BDT0RFOiBIQUwgTUVN
T1JZIEFMTE9DQVRJT04NCj4gPj4+ID4+DQo+ID4+PiA+PiB2aXJpZGlhbj0wDQo+ID4+PiA+PiB2
Y3B1cz00DQo+ID4+PiA+PiBTVE9QQ09ERTogTVVMVElQUk9DRVNTT1JfQ09ORklHVVJBVElPTl9O
T1RfU1VQUE9SVEVEDQo+ID4+PiA+Pg0KPiA+Pj4gPj4gdmlyaWRpYW49MA0KPiA+Pj4gPj4gdmNw
dXM9MQ0KPiA+Pj4gPj4gQm9vdCBPSyAtIGdldCB0byBXaW5kb3dzIFNlcnZlciAyMDE2IGxvZ2lu
IGV0Yw0KPiA+Pj4gPj4NCj4gPj4+ID4NCj4gPj4+ID4gQW5kIHRvIGNvbXBsZXRlIHRoZSBzZXQs
IGhvdyBhYm91dCB2aXJpZGlhbj0xIHZjcHVzPTE/DQo+ID4+Pg0KPiA+Pj4gQW55IHZjcHVzIHZh
bHVlIHdoZXJlIHZpcmlkaWFuPTEgaXMgdXNlZCBjcmVhdGVzIGEgSEFMIE1FTU9SWQ0KPiA+Pj4g
QUxMT0NBVElPTg0KPiA+Pj4gc3RvcGNvZGUgd2hlbiB0cnlpbmcgdG8gYm9vdCBXaW5kb3dzLg0K
PiA+Pg0KPiA+PiBPaywgc28gSSBndWVzcyB0aGF0IGlzc3VlIGhpdHMgZmlyc3QgYW5kLCBvbmx5
IGlmIHlvdSBnZXQgYmV5b25kIHRoYXQNCj4gPj4gZG8geW91IGhpdCB0aGUgbXVsdGlwcm9jZXNz
b3IgcHJvYmxlbS4NCj4gPj4NCj4gPj4gVGhlIHZpcmlkaWFuIG9wdGlvbiBpcyBub3QgYWN0dWFs
bHkgYSBib29sZWFuIGFueSBtb3JlICh0aGF0DQo+ID4+IGludGVycHJldGF0aW9uIGlzIGp1c3Qg
Zm9yIGNvbXBhdCkgc28gaXQgd291bGQgYmUgYSBnb29kIGRhdGFwb2ludCB0bw0KPiA+PiBrbm93
IHdoaWNoIG9mIHRoZSBlbmxpZ2h0ZW5tZW50cyBjYXVzZXMgdGhlIGNoYW5nZSBpbiBiZWhhdmlv
dXIuIENvdWxkDQo+ID4+IHlvdSB0cnkgdmlyaWRpYW49WydiYXNlJ10gdG8gc2VlIGlmIHRoYXQn
cyBzdWZmaWNpZW50IHRvIGNhdXNlIHRoZQ0KPiA+PiBwcm9ibGVtPyAoSSdtIGd1ZXNzaW5nIGl0
IHByb2JhYmx5IGlzIGJ1dCBpdCB3b3VsZCBiZSBnb29kIHRvIGtub3cpLg0KPiA+DQo+ID4NCj4g
PiBIaSBQYXVsLA0KPiA+DQo+ID4gSSBjYW4gY29uZmlybSB0aGF0IHZpcmlkaWFuPVsnYmFzZSdd
IGNyYXNoZXMgd2l0aCB0aGUgc2FtZSBIQUwgTUVNT1JZDQo+ID4gQUxMT0NBVElPTiBzdG9wY29k
ZSAtIGV2ZW4gb24gMSB2Y3B1Lg0KPiANCj4gQWxzbywganVzdCB3b25kZXJpbmcsIHdlJ3JlIHVz
aW5nIDguMi4wIG9mIHRoZSBXaW5kb3dzIFBWIGRyaXZlcnMgb24NCj4gdGhpcyBWTS4NCj4gDQo+
IERvZXMgdGhpcyBtYXR0ZXI/IEhhcyB0aGVyZSBiZWVuIGFueSBjaGFuZ2VzIHRoYXQgd291bGQg
YWZmZWN0IHRoaXMgaW4NCj4gOC4yLjEgb3IgOC4yLjI/DQo+IA0KDQpGcm9tIHdoYXQgeW91IGRl
c2NyaWJlLCBJIHRoaW5rIHRoaXMgaXMgaGFwcGVuaW5nIHdheSBiZWZvcmUgYW55IFBWIGRyaXZl
ciBjb2RlIGlzIGVudGVyZWQuIEkgZ3Vlc3MgaXQgd291bGQgYmUgcHJ1ZGVudCB0byBtYWtlIHN1
cmUgYnkgdHJ5aW5nIGl0IG9uIGEgZnJlc2ggVk0gKGJ1dCBkaWRuJ3QgeW91IHNheSBiZWZvcmUg
dGhhdCB0aGlzIGhhcHBlbnMgd2hlbiBib290aW5nIGZyb20gdGhlIGluc3RhbGxhdGlvbiBtZWRp
YT8pDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
