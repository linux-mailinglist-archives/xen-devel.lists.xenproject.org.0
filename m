Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E42246419
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 12:07:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7c3E-0008LR-PN; Mon, 17 Aug 2020 10:07:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mm75=B3=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1k7c3D-0008LM-91
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 10:07:35 +0000
X-Inumbo-ID: c1094377-8851-493d-b85d-979f752baf2c
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1094377-8851-493d-b85d-979f752baf2c;
 Mon, 17 Aug 2020 10:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597658854;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FkDg+CtNZkMCHx9dUu9RrEZO/j0QTOsRS6SJj640/yA=;
 b=d2rv1T9haFy9WNl9qgS07CdP8F37PY1FJ33po5ODu2pG2X812AQ57pzY
 SE9iJLto8b3AuADh6/LTM5XvHuIiKKUhp+ONmrqaoHzMITTUQw8uumL6S
 tIhoRFWwtcLT2fi2E8+0qIVvp4uzCGD++SPN4VkDMMqT1CAgZiTXvhPAv 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bb+L/4qSr716g39NkwzpufBCBQ73CTAV65esnYY33rmP/t+QgyoLsqVJgW3/4So/z7WluzemJ+
 tPvN6fDmazmpCwj8KXQY3iy8427pNGkPGnjktTJTlifqbzXo1TpPyE9Eht84fhPy0CooAQbtNf
 N/KJgy27CIt3wPRsybBtYeHLnVYYg2gvLU3Q87Mfd7eTyGcRsexWO86dWjqMhto+imnDQB+jjC
 yuEeoRSG+SNauegom61gfoJA7urUjJ2M/ZVqDq+gXCKSVtfqs3WFcsUkJG6oy4NAsc93A61HC5
 YvY=
X-SBRS: 2.7
X-MesageID: 24974303
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,322,1592884800"; d="scan'208";a="24974303"
From: Edwin Torok <edvin.torok@citrix.com>
To: "wl@xen.org" <wl@xen.org>
CC: Ian Jackson <Ian.Jackson@citrix.com>, "dave@recoil.org" <dave@recoil.org>, 
 Christian Lindig <christian.lindig@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 4/6] tools/ocaml/xenstored: drop select based
Thread-Topic: [PATCH v1 4/6] tools/ocaml/xenstored: drop select based
Thread-Index: AQHWcogEggRLiAUKJEKZWkkZc6Q2i6k786GAgAACLIA=
Date: Mon, 17 Aug 2020 10:07:29 +0000
Message-ID: <4b1dbb009fd7c859d6e45a6105736fe13db81b5e.camel@citrix.com>
References: <cover.1597442238.git.edvin.torok@citrix.com>
 <1e3b3f1ecb3b0c44a23f8ec5fe0af4b2249c1c7e.1597442238.git.edvin.torok@citrix.com>
 <20200817095935.gmroomzcgo5qb6ny@liuwe-devbox-debian-v2>
In-Reply-To: <20200817095935.gmroomzcgo5qb6ny@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2A1E3AE602DC541A6C15352077616B1@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDIwLTA4LTE3IGF0IDA5OjU5ICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBbQ0FV
VElPTiAtIEVYVEVSTkFMIEVNQUlMXSBETyBOT1QgcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVu
DQo+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIGFuZCBr
bm93IHRoZSBjb250ZW50DQo+IGlzIHNhZmUuDQo+IA0KPiBUaGUgc3ViamVjdCBsaW5lIHNlZW1z
IHRvIGJlIGN1dCBvZmYgaGFsZiB3YXkuDQo+IA0KPiAiRHJvcCBzZWxlY3QgYmFzZWQgJFNPTUVU
SElORyI/DQoNCiRTT01FVEhJTkcgPSBzb2NrZXQgd2F0Y2hpbmcsIEknbGwgZml4IHRoZSBtZXNz
YWdlIGluIFYyLg0KDQo+IA0KPiBXZWkuDQo+IA0K

