Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05655B7BDE
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 16:12:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAx7w-0001Lc-Js; Thu, 19 Sep 2019 14:09:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2B0G=XO=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iAx7u-0001KY-Ij
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 14:09:42 +0000
X-Inumbo-ID: 1ef23675-dae7-11e9-9660-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ef23675-dae7-11e9-9660-12813bfff9fa;
 Thu, 19 Sep 2019 14:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568902180;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2D9cVStLjlWrcSM5h8Lusz5GOfycXRpktHsS7555MqU=;
 b=ZWco9/HGe7RNXiLEw4scrMPPmTOA0EHBhoAoU18ey+Q26/2/6InjJET7
 5fJsCxyBi+uVSiNI1LzkPSb1cRv+xwkbQopacWG5UPFUTQQfCViHGK0Qk
 JuzOel1otwLbSYjaVZx5BiXuh3V0huIXXff0TGRLHf30DxjhIQeB0fPzC Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: psQqEsatNLv36xHUzu0G1kwYyBwrNajDuQcBCZrux/WIcfVJQ6Oat48AFqVYWPfaJbpDJtXNIc
 1Rx8MOHEdDPDfPVvRJ3pz08YyidWyzMe/UYosC8o0hwQMkvUu/rtitwit0tLU4IyUzTnh5zFKM
 vVpSr6NZjIuCdGouHEljm48npRPdLqEE4bLheFvBLG1bfTAdhPICIGCUPQJ9yduPYMG17fCZjw
 lWSPJMsK7Qaz2yycOOlm7aEEkgSnjtH9JYdH8gGNzr8H4H3aEhZezAIB0GMMe8i1WtsusO7nOo
 vBY=
X-SBRS: 2.7
X-MesageID: 6049056
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,523,1559534400"; 
   d="scan'208";a="6049056"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Alexandru Stefan ISAILA' <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v11] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVbuqvObi2c4eeME6qC/Xll4ji7KczB5JA
Date: Thu, 19 Sep 2019 14:09:36 +0000
Message-ID: <9cfad3f4fdb34a34ba40a7534c209af0@AMSPEX02CL03.citrite.net>
References: <20190919130338.3132-1-aisaila@bitdefender.com>
In-Reply-To: <20190919130338.3132-1-aisaila@bitdefender.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v11] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+IGluZGV4IGZkYjFlMTdmNTkuLjRj
YzA3N2JiM2YgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9odm0vaHZtLmMKPiBAQCAtMzIzNiw2ICszMjM2LDE5IEBAIHN0YXRpYyBlbnVt
IGh2bV90cmFuc2xhdGlvbl9yZXN1bHQgX19odm1fY29weSgKPiAgICAgICAgICAgICAgcmV0dXJu
IEhWTVRSQU5TX2JhZF9nZm5fdG9fbWZuOwo+ICAgICAgICAgIH0KPiAKPiArICAgICAgICAvKgo+
ICsgICAgICAgICAqIEluIGNhc2UgYSB2bSBldmVudCB3YXMgc2VudCByZXR1cm4gcGFnZWRfb3V0
IHNvIHRoZSBlbXVsYXRpb24gd2lsbAo+ICsgICAgICAgICAqIHN0b3Agd2l0aCBubyBzaWRlIGVm
ZmVjdAo+ICsgICAgICAgICAqLwo+ICsgICAgICAgIGlmICggKGZsYWdzICYgSFZNQ09QWV9saW5l
YXIpICYmCj4gKyAgICAgICAgICAgICB1bmxpa2VseSh2LT5hcmNoLnZtX2V2ZW50KSAmJgo+ICsg
ICAgICAgICAgICAgdi0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCAmJgo+ICsgICAgICAgICAg
ICAgaHZtX21vbml0b3JfY2hlY2tfcDJtKGFkZHIsIGdmbiwgcGZlYywgbnBmZWNfa2luZF93aXRo
X2dsYSkgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgcHV0X3BhZ2UocGFnZSk7Cj4gKyAg
ICAgICAgICAgIHJldHVybiBIVk1UUkFOU19iYWRfZ2ZuX2FjY2VzczsKClRoaXMgZG9lc24ndCBt
YXRjaCB0aGUgY29tbWVudCBhYm92ZS4gRGlkIHlvdSBtZWFuIHRvIHJldHVybiBIVk1UUkFOU19n
Zm5fcGFnZWRfb3V0PyBJJ20gZ3Vlc3Npbmcgbm90LCBpbiB3aGljaCBjYXNlIHRoZSBjb21tZW50
IG5lZWRzIHRvIGJlIGZpeGVkLgoKICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
