Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20F98008
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 18:27:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0TPN-0001aT-2t; Wed, 21 Aug 2019 16:24:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qki=WR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0TPK-0001aO-UT
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 16:24:23 +0000
X-Inumbo-ID: 20eb8174-c430-11e9-951b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20eb8174-c430-11e9-951b-bc764e2007e4;
 Wed, 21 Aug 2019 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566404661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cnmk9BJDc8qHwSuXHVB5IDhgw2XOs8ZZedFOjawqkTE=;
 b=BRz+EGwEkCbHdqkcdh4433e4lsDkCDYCKDpCDnGdScnTnJYUEQVxKmzA
 eded+GxqCgnIgH1qZe4PLQr2lyNueh24JuIecFEa8ZXnps691YriMqAdf
 m0fjlvJ6r7tqLmsO28n33Qdm4OfZHhqtdnIKvYX/fOEhkCUOKC/KLIXnn c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Rjq9sKM4pK42Psvu++SGpDPKO6PaUUsEVqLtVHIc1fPEJ51DzBVEt7bdk4PslmYG7ze+6e/NUw
 +AsoxirDyHBTXXcwrkBcfWRF+ccSpHeO+n7i1Eig66JRyPVkKC8u8hg7mCPXX6sadHfMQbCWSW
 Y42xdHjnyIWvQJAKPgQLWWTklFFnDlWG9xh2ckCHBWk6TEE1sfEf9jb4aCCAP/cggnTMWfm0Tf
 RolpAjW7T4M7YsjoSiurmGDepEsZ2X14L7oLdB7JcPnOIospcwiMpxBqdQMwuhW11N6vTL2JPv
 Jao=
X-SBRS: 2.7
X-MesageID: 4587723
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4587723"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 2/7] ioreq: add internal ioreq initialization support
Thread-Index: AQHVWDENTht/wC90WkCeBfIpEZL2QKcFyL7g
Date: Wed, 21 Aug 2019 16:24:17 +0000
Message-ID: <fa34f99f038e437495bb4494ecfbec24@AMSPEX02CL03.citrite.net>
References: <20190821145903.45934-1-roger.pau@citrix.com>
 <20190821145903.45934-3-roger.pau@citrix.com>
In-Reply-To: <20190821145903.45934-3-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/7] ioreq: add internal ioreq
 initialization support
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAyMSBBdWd1c3QgMjAxOSAxNTo1OQ0KPiBUbzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5k
cmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhl
bi5vcmc+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBTdWJqZWN0
OiBbUEFUQ0ggMi83XSBpb3JlcTogYWRkIGludGVybmFsIGlvcmVxIGluaXRpYWxpemF0aW9uIHN1
cHBvcnQNCj4gDQo+IEFkZCBzdXBwb3J0IGZvciBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXJzIHRvIGlu
aXRpYWxpemF0aW9uIGFuZA0KPiBkZWluaXRpYWxpemF0aW9uIHJvdXRpbmVzLCBwcmV2ZW50IHNv
bWUgZnVuY3Rpb25zIGZyb20gYmVpbmcgZXhlY3V0ZWQNCj4gYWdhaW5zdCBpbnRlcm5hbCBpb3Jl
cSBzZXJ2ZXJzIGFuZCBhZGQgZ3VhcmRzIHRvIG9ubHkgYWxsb3cgaW50ZXJuYWwNCj4gY2FsbGVy
cyB0byBtb2RpZnkgaW50ZXJuYWwgaW9yZXEgc2VydmVycy4gRXh0ZXJuYWwgY2FsbGVycyAoaWU6
IGZyb20NCj4gaHlwZXJjYWxscykgYXJlIG9ubHkgYWxsb3dlZCB0byBkZWFsIHdpdGggZXh0ZXJu
YWwgaW9yZXEgc2VydmVycy4NCg0KSXQncyBraW5kIG9mIHVnbHkgdG8gaGF2ZSB0aGUgZXh0cmEg
J2ludGVybmFsJyBhcmd1bWVudCBwYXNzZWQgdG8gYW55dGhpbmcgb3RoZXIgdGhhbiB0aGUgY3Jl
YXRlIGZ1bmN0aW9uIHNvIEkgd29uZGVyIHdoZXRoZXIgaXQgd291bGQgYmUgbmVhdGVyIHRvIGVu
Y29kZSBpdCBpbiB0aGUgaW9yZXEgc2VydmVyIGlkLiBJLmUuIHdlIGhhdmUgZGlzdGluY3QgaWQg
cmFuZ2VzIGZvciBpbnRlcm5hbCBhbmQgZXh0ZXJuYWwgc2VydmVycy4gV2hhdCBkbyB5b3UgdGhp
bms/DQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
