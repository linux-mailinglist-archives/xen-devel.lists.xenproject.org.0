Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3910D84B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 17:12:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaiq5-00064w-RA; Fri, 29 Nov 2019 16:09:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lFH5=ZV=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iaiq4-00064e-1j
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 16:09:48 +0000
X-Inumbo-ID: a94960c9-12c2-11ea-a3e7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a94960c9-12c2-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 16:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575043787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nGjbZgxEg5SjNj0V5kUitw2PC4cU1vf2xEgdQNMH6PQ=;
 b=cwZ4wOab9UKWvM5DGrzvtcaVYvWhMB5H8/lXzkrJou66ajTb73bHRy8x
 Crd0NZLmyDE7Vk9uk9f0jUouNZ9ZjHnhe+id4BD1XcvX8IFaglKshrlp1
 EC37WY4vJpT47C6TZCA2HA8HHqQ4lKujG1bqikdPTQd1KM1tknoUDvBA9 U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9Vcrw4N9D8bWWoBriuPGOWMuMIoFuuA76ZnMM2ibV26zx8V0Xq3hYRQlu7WZAJjUvVc+SHoqhr
 y5i6eSxV4g1gwIDzAl+cKpMbl5ljmlWPq7QLZpfZBYQC/h/vHLqwdr4c/6wQQsfiAS03rwnoLf
 y8QbF5AexgArfjbGD9CF4WdBYaFzT4AIsCQI5K3plQI9ItRSZG/9xjfMZG6p2bhv/6QgkdH2Ax
 nVT7UFxPI63beaCJQg0lXEaahXyjSiikt9OHzgBzPJrrOj9hyGnd1lp5vMJsbDnqwm/dGJs7x7
 Qac=
X-SBRS: 2.7
X-MesageID: 9404216
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9404216"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Thread-Topic: [PATCH-for-4.13 v5] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVpgxEszL+bCDQR0+agohATVUvyKeiCJyAgAAzAoCAAAMDAIAAAtKAgAAAggA=
Date: Fri, 29 Nov 2019 16:09:43 +0000
Message-ID: <257002CA-3EFE-4B07-97E7-948543F2F5E2@citrix.com>
References: <20191128165224.2959-1-pdurrant@amazon.com>
 <20191129124427.l7wyupz5mcn7nx57@debian>
 <24033.15733.686597.694978@mariner.uk.xensource.com>
 <428ff7e73f654f5c89cd0837f69002dd@EX13D32EUC003.ant.amazon.com>
 <24033.16985.749977.747490@mariner.uk.xensource.com>
In-Reply-To: <24033.16985.749977.747490@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <0202103C32EAC3409E10D3A601FC4ACE@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH-for-4.13 v5] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Anthony
 Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTm92IDI5LCAyMDE5LCBhdCA0OjA3IFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBEdXJyYW50LCBQYXVsIHdyaXRlcyAoIlJFOiBb
UEFUQ0gtZm9yLTQuMTMgdjVdIFJhdGlvbmFsaXplIG1heF9ncmFudF9mcmFtZXMgYW5kIG1heF9t
YXB0cmFja19mcmFtZXMgaGFuZGxpbmciKToNCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPg0KPiAuLi4N
Cj4+PiBJcyB0aGVyZSBzb21lIHJlYXNvbiB3ZSB3b3VsZG4ndCB1c2UgfjAgdG8gbWVhbiBkZWZh
dWx0ID8NCj4+PiANCj4+PiBJbiB0aGUgdG9vbHMgYXJlYSB3ZSBub3JtYWxseSBzcGVsbCB0aGlz
IGFzDQo+Pj4gICAgIH4oc29tZSBhcHByb3ByaWF0ZSB0eXBlKTANCj4+PiB0byBtYWtlIHN1cmUg
aXQgaGFzIHRoZSByaWdodCB3aWR0aC4gIEJ1dCBpZiB3ZSBrbm93IHRoZSB0eXBlIGFuZCBpdA0K
Pj4+IGlzIG9mIGZpeGVkIGxlbmd0aCwgYXMgaGVyZSwgMHhmZmZmZmZmZnUgaXMgT0sgdG9vLg0K
Pj4+IA0KPj4+PiBUaGUgdHlwZSBjaGFuZ2UgaGVyZSBtYWtlcyBtZSBmZWVsIGEgYml0IHVuY29t
Zm9ydGFibGUsIHRob3VnaCBpbg0KPj4+PiBwcmFjdGljZSBpdCBtYXkgbm90IG1hdHRlci4gSSBk
b24ndCBzZWUgYW55b25lIHdvdWxkIHNwZWNpZnkgYSB2YWx1ZQ0KPj4+PiB0aGF0IHdvdWxkIGJl
Y29tZSBuZWdhdGl2ZSB3aGVuIGNhc3QgZnJvbSB1aW50MzIgdG8gaW50ZWdlci4NCj4+PiANCj4+
PiBUaGUgcHJvYmxlbSB3aXRoIHRoZSB0eXBlIGNoYW5nZSBpcyB0aGF0IGluIHByaW5jaXBsZSB3
ZSBoYXZlIHRvIGF1ZGl0DQo+Pj4gYWxsIHRoZSBwbGFjZXMgdGhlIHZhcmlhYmxlcyBhcmUgdXNl
ZC4NCj4+IA0KPj4gQ2FuIGEgdG9vbHN0YWNrIG1haW50YWluZXIgcGxlYXNlIGNvbWUgdXAgd2l0
aCBhIGNvbmNyZXRlIHN1Z2dlc3Rpb24gYXMgdG8gd2hhdCB0aGUgcGF0Y2ggc2hvdWxkIGRvIHRo
ZW4/IEl0J3Mgbm93IGF0IHY2IGFuZCB0aW1lIGlzIHNob3J0Lg0KPiANCj4gSSB0aGluayBvdXIg
cHJvcG9zYWwgaXMgdG8gZHJvcCB0aGUgdHlwZSBjaGFuZ2UsIGNvbnRpbnVlIHRvIHVzZQ0KPiB1
aW50MzJfdCBldmVyd2hlcmUgZm9yIHRoZXNlIHZhbHVlcywgYW5kIHNwZWNpZnkgdGhlICJ1c2Ug
ZGVmYXVsdCINCj4gdmFsdWUgdG8gYmUgYWxsLWJpdHMtc2V0Lg0KDQpJIHRyaWVkIHRvIHN1Z2dl
c3Qgc29tZXRoaW5nIGxpa2UgdGhpcywgYnV0IEphbiBkaWRu4oCZdCBsaWtlIGl0IGZvciBzb21l
IHJlYXNvbi4NCg0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
