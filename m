Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B7E8BB96
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 16:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxXp4-00029o-K2; Tue, 13 Aug 2019 14:30:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yyd=WJ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hxXp3-00029O-3p
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 14:30:49 +0000
X-Inumbo-ID: ed707796-bdd6-11e9-b931-6b00dbd4e01f
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed707796-bdd6-11e9-b931-6b00dbd4e01f;
 Tue, 13 Aug 2019 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565706642;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NdccgeabDusrD7M7rrolK/uBgGq/d6T3kXWKuecF/Go=;
 b=AKVRLY2f2SyjJQtvatwmeoH4OW9zxJG0na/ZF/a1YVPH+NIUj//RP/jL
 gVWv2Lx+K2Ap4MHvXoo9WFXgu2SWH63oR/Az/ckQMT7KyCTUb3vZ8zVgB
 eG9YZM8KsjNwPaOhew3SWTJp9uUUh3iBzZRyG31scaOUQWyJv1qpBtGNg Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nLMUe5PiFiCSTxeN277y08zbUjD4PHUhzV5acjrnKnw8KBaVYjAL6cn6brBrXFv4sGycFiaoqM
 NEM3QCn1qQFDkrwVDlipZHQJRgga1Qgx5djrLwgySZ3Ch7vaCBDEb5xG64g8/WesYzuvfCJYTV
 /bVVb6oWZGE5TGs8S9PZEbWLrchi8ENXN5o7Hw8Oz1Xs2aj7yT/JRf6aI79p6tlM95N+VJTQbH
 h2zkhd1d9oOspFhE8zcD7Q2KiZwtfksTtzyEVH7ia+pH0MEynmowmR8yyplqNePHahH1IO+3n1
 de0=
X-SBRS: 2.7
X-MesageID: 4357564
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4357564"
From: Lars Kurth <lars.kurth@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>, "minios-devel@lists.xenproject.org"
 <minios-devel@lists.xenproject.org>, "mirageos-devel@lists.xenproject.org"
 <mirageos-devel@lists.xenproject.org>, "win-pv-devel@lists.xenproject.org"
 <win-pv-devel@lists.xenproject.org>
Thread-Topic: [RFC] Code of Conduct
Thread-Index: AQHVUQIEIhpvkCdhBEeAXTHDoPJt4Kb3gUKA///xh4CAAaHJAA==
Date: Tue, 13 Aug 2019 14:30:38 +0000
Message-ID: <3E4BE619-6D45-4A04-9C39-D0B833D62859@citrix.com>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com-0>
 <32e7f4cd-78e9-dd43-a677-958d838f4f65@citrix.com>
 <BAD85CEA-27E1-48B2-A433-0D6BE2182DCC@citrix.com>
 <6afd60db-55d7-9111-ffe0-e53917e5810f@citrix.com>
In-Reply-To: <6afd60db-55d7-9111-ffe0-e53917e5810f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <D8D16689B0947940A699FC1DD94388A5@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Cc: "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGVyZmVjdDogSSB1cGRhdGVkIHRoaXMgYWxzbyBpbiB0aGUgZ29vZ2xlIGRvYy4gSSB3aWxsIGxl
YXZlIHRoZSByZXZpZXcgb3BlbiBmb3IgYSB3ZWVrIG9yIHR3byAod2UgZG8gaGF2ZSBzdW1tZXIg
aG9saWRheXMgYWZ0ZXIgYWxsKSBhbmQgbGV0IHBlb3BsZSBjb21tZW50LiBJIGNhbiB0aGVuIHNl
bmQgYSBwcm9wZXIgcHJvcG9zYWwsIGZvbGxvd2VkIGJ5IGEgdm90ZQ0KTGFycw0KDQrvu79PbiAx
Mi8wOC8yMDE5LCAxNTozNSwgIkdlb3JnZSBEdW5sYXAiIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+IHdyb3RlOg0KDQogICAgT24gOC8xMi8xOSAzOjI3IFBNLCBMYXJzIEt1cnRoIHdyb3RlOg0K
ICAgID4gSSBhbSB3b25kZXJpbmcgaG93IHlvdSBmZWVsIGFib3V0IHRoZSB1c2FnZSBvZiAgInBh
cnRpY2lwYW50Ii4gVGhlcmUgYXJlIA0KICAgID4gYSBmZXcgaW5zdGFuY2VzIGxlZnQgaW4gdGhl
IHRleHQuIA0KICAgID4gDQogICAgPiAiQW55IHJlcG9ydCBvZiBoYXJhc3NtZW50IHdpdGhpbiB0
aGUgWGVuIFByb2plY3QgY29tbXVuaXR5IHdpbGwgYmUgYWRkcmVzc2VkDQogICAgPiBzd2lmdGx5
LiBQYXJ0aWNpcGFudHMgYXNrZWQgdG8gc3RvcCAuLi4iDQogICAgPiANCiAgICA+ICMgQ29uc2Vx
dWVuY2VzIG9mIFVuYWNjZXB0YWJsZSBCZWhhdmlvcg0KICAgID4gSWYgYSBwYXJ0aWNpcGFudCBl
bmdhZ2VzIGluIGhhcmFzc2luZyBiZWhhdmlvdXINCiAgICA+IA0KICAgID4gSSB3b3VsZCBwcm9i
YWJseSBhbHNvIHdhbnQgdG8gcmVwbGFjZSB0aGlzIHdpdGggIkNvbW11bml0eSBtZW1iZXIgYXNr
ZWQgLi4uIiBhbmQgIklmIGEgY29tbXVuaXR5IG1lbWJlciBlbmdhZ2VzIGluIC4uLiINCiAgICAN
CiAgICBTZWVtcyByZWFzb25hYmxlIHRvIG1lLg0KICAgIA0KICAgICAtR2VvcmdlDQogICAgDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
