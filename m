Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9309C1BA57A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 15:55:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT4EP-00054b-2v; Mon, 27 Apr 2020 13:55:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTJa=6L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jT4EO-00054T-4C
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 13:55:32 +0000
X-Inumbo-ID: c204b1e8-888e-11ea-b07b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c204b1e8-888e-11ea-b07b-bc764e2007e4;
 Mon, 27 Apr 2020 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587995732;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J36PZq0kqFOF4s314pkPTDMzn2pH4/e+72WdA2Thru8=;
 b=R8yVadpYnOR6pZM5KcWu28fh4A9i7YKkEBdMNfb8bvR7J210hYdWvhhh
 HPyIGbcT9dLc1Qp8CGI+nue1uPUUa5MsIA0xbT6thh+sNcdMV8Z0xUugo
 o8VUMwGnWGcmS2WOU49R8M7k2ieoMBWWvi43NmfM080hDXd30dYbj6119 M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Pt04EeFHVcraiLoSHWM1T2bWTxs/ijhxN6q7ehpiNRd7NqjV9WyPXeStPeRfHA+kaH9NFfqyrx
 rk2HT2qGOJ4Xrw/6MU69bpapPX2szImRwHxtUpjGuWBpPPHR+FN7LRtr4/zYyA/+kZM3XSMcUy
 LWWniYxlBq/rUKisZTj5dEIG5Kosa2O5QfjDt+nIUG8j3MV9QGW1K/tam7nYuB0Rl7zFK64oJO
 SrgDwZUJCjMyuz36ndxh2KWrKkxD3WuGPOrejr0h3oGoMufdMR0d698GJFyo3RaieWnEKt/ZCu
 jXs=
X-SBRS: 2.7
X-MesageID: 16318850
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16318850"
From: George Dunlap <George.Dunlap@citrix.com>
To: Juergen Gross <JGross@suse.com>
Subject: Re: [PATCH v7 03/12] docs: add feature document for Xen hypervisor
 sysfs-like support
Thread-Topic: [PATCH v7 03/12] docs: add feature document for Xen hypervisor
 sysfs-like support
Thread-Index: AQHWCQXuk74OuSkPsUygWIUgRyzUHaiNA2+A
Date: Mon, 27 Apr 2020 13:55:27 +0000
Message-ID: <AB2368EA-FE62-4735-8064-98DE220B6F9E@citrix.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-4-jgross@suse.com>
In-Reply-To: <20200402154616.16927-4-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <0805748851396540939A1D33DBE3A576@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIEFwciAyLCAyMDIwLCBhdCA0OjQ2IFBNLCBKdWVyZ2VuIEdyb3NzIDxKR3Jvc3NAc3Vz
ZS5jb20+IHdyb3RlOg0KW3NuaXBdDQo+ICsqIHtWQUxVRSwgVkFMVUUsIC4uLiB9IC0tIGEgbGlz
dCBvZiBwb3NzaWJsZSB2YWx1ZXMgc2VwYXJhdGVkIGJ5ICIsIiBhbmQNCj4gKyAgZW5jbG9zZWQg
aW4gInsiIGFuZCAifSIuDQpbc25pcF0NCj4gK1NvIGFuIGVudHJ5IGNvdWxkIGxvb2sgbGlrZSB0
aGlzOg0KPiArDQo+ICsgICAgL2NwdS1idWdzL2FjdGl2ZS1wdi94cHRpID0gKCJObyJ8eyJkb20w
IiwgImRvbVUiLCAiUENJRCBvbiJ9KSBbdyxYODYsUFZdDQo+ICsNCj4gK1Bvc3NpYmxlIHZhbHVl
cyB3b3VsZCBiZSAiTm8iIG9yIGEgbGlzdCBvZiAiZG9tMCIsICJkb21VIiwgYW5kICJQQ0lEIG9u
Ii4NCg0KT25lIHRoaW5nIHRoYXQgd2FzbuKAmXQgY2xlYXIgdG8gbWUgaGVyZTogIERvZXMgdGhl
IOKAnGxpc3TigJ0gbG9vayBsaWtlDQoNCiAgICDigJxkb20wIiwg4oCcZG9tVSIsIOKAnFBDSUQg
b27igJ0NCg0Kb3IgDQoNCiAgICB7ZG9tMCwgZG9tVSwgUENJRCBvbn0NCg0Kb3INCg0KICAgIHvi
gJxkb20w4oCdLCDigJxkb21V4oCdLCDigJxQQ0lEIG9u4oCdfQ0KDQo/DQoNCkFub3RoZXIgcXVl
c3Rpb24gdGhhdCBvY2N1cnMgdG8gbWUgZnJvbSBhc2tpbmcgdGhpcyBxdWVzdGlvbjogaW4gYSBj
YXNlIGxpa2UgdGhpcywgYXJlIHdlIGdlbmVyYWxseSBleHBlY3RpbmcgdG8gaGF2ZSBvcHRpb25z
IHdpdGggc3BhY2VzIGluIHRoZW0gKGxpa2Ug4oCcUENJRCBvbuKAnSk/IEFuZC9vciwgYXJlIHdl
IGV4cGVjdGluZyB0aGUgc3RyaW5ncyB0aGVtc2VsdmVzIHRvIGhhdmUgcXVvdGVzIGluIHRoZW0/
IElmIHNvLCBjb21tYW5kcyB0byBtYW5pcHVsYXRlIHRoZXNlIHdpbGwgc3RhcnQgdG8gbG9vayBh
IGxpdHRsZSBnbmFybHk6DQoNCiAgICB4ZW5oeXBmcyB3cml0ZSA8cGF0aD4g4oCce1zigJ1kb20w
XOKAnSwgXOKAnVBDSUQgb25c4oCdfeKAnQ0KDQpJdCBzZWVtcyBsaWtlIGl0IHdvdWxkIGJlIG5p
Y2VyIHRvIGJlIGFibGUgdG8gd3JpdGU6DQoNCiAgICB4ZW5oeXBmcyB3cml0ZSA8cGF0aD4gIntk
b20wLCBQQ0lELW9ufeKAnQ0KDQooTWF5YmUgdGhpcyB3aWxsIGJlIG1hZGUgbW9yZSBjbGVhciBs
YXRlciBpbiB0aGUgc2VyaWVzLCBqdXN0IHRob3VnaHQgSeKAmWQgc2hhcmUgbXkgdGhvdWdodHMg
LyBjb25mdXNpb24gaGVyZS4pDQoNCiAtR2Vvcmdl

