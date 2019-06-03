Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D732FF9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:44:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXmGJ-0005gN-Gn; Mon, 03 Jun 2019 12:40:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Nnt=UC=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hXmGH-0005gI-NN
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:40:25 +0000
X-Inumbo-ID: bfd12e5a-85fc-11e9-89b9-cb2c6457c959
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfd12e5a-85fc-11e9-89b9-cb2c6457c959;
 Mon, 03 Jun 2019 12:40:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: qRuZ/mbnVPkfZcxNvQPBJ43Y7TYUf5SznveZkqNGi79FnvS6RKgnGa+TTWsLMQf3bkCXx+ePXi
 z4jJlrSpYewGg9n0aWFVTrvGXs7V9WOIoYkUCStO2gNr4ef692ZAklUsbktvgAMaOdJwnoPBbe
 NkKhr68bfa7YYh1lFB6dejdE9qWkSYjxRXadNB4r8sXfZdr1px0NtuzWoehwMTAtD5Z7ey/nXQ
 a8c55X2PAEpYUj6JLHMfvyyQzklr/66sS46E8Jplc4VLvcNm/7SI3dwhpoPtAQGXeKPidBt1fk
 q3k=
X-SBRS: 2.7
X-MesageID: 1240060
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1240060"
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Thread-Topic: [PATCH v2] x86/hvm: Make the altp2m locking in
 hvm_hap_nested_page_fault() easier to follow
Thread-Index: AQHVGgibqEhrspEGc0Wg9az1e0iW46aJvWUA
Date: Mon, 3 Jun 2019 12:40:16 +0000
Message-ID: <E6E7623B-3C1C-41E7-BC98-8F7CFC989171@citrix.com>
References: <1559565226-19789-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1559565226-19789-1-git-send-email-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <5E25915C63541945AEA845A5282E9682@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/hvm: Make the altp2m locking in
 hvm_hap_nested_page_fault() easier to follow
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDMsIDIwMTksIGF0IDE6MzMgUE0sIEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gRHJvcCB0aGUgYXAybV9hY3RpdmUgYm9v
bGVhbiwgYW5kIGNvbnNpc3RlbnRseSB1c2UgdGhlIHVubG9ja2luZyBmb3JtOg0KPiANCj4gIGlm
ICggcDJtICE9IGhvc3RwMm0gKQ0KPiAgICAgICBfX3B1dF9nZm4ocDJtLCBnZm4pOw0KPiAgX19w
dXRfZ2ZuKGhvc3RwMm0sIGdmbik7DQo+IA0KPiB3aGljaCBtYWtlcyBpdCBjbGVhciB0aGF0IHdl
IGFsd2F5cyB1bmxvY2sgdGhlIGFsdHAybSdzIGdmbiBpZiBpdCBpcyBpbiB1c2UsDQo+IGFuZCBh
bHdheXMgdW5sb2NrIHRoZSBob3N0cDJtJ3MgZ2ZuLiAgVGhpcyBhbHNvIGRyb3BzIHRoZSB0ZXJu
YXJ5IGV4cHJlc3Npb24NCj4gaW4gdGhlIGxvZ2RpcnR5IGNhc2UuDQo+IA0KPiBFeHRlbmQgdGhl
IGxvZ2RpcnR5IGNvbW1lbnQgdG8gaWRlbnRpZnkgd2hlcmUgdGhlIGxvY2tpbmcgdmlvbGF0aW9u
IGlzIGxpYWJsZQ0KPiB0byBvY2N1ci4NCj4gDQo+IE5vIChpbnRlbmRlZCkgb3ZlcmFsbCBjaGFu
Z2UgaW4gYmVoYXZpb3VyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8
cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4NCg0KTm90aWNlZCB0aGlzIHdoZW4gcmV2aWV3aW5nIFRhbWFz4oCZ
IHBhdGNoIOKAlCB0aGFua3M6DQoNCkFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
