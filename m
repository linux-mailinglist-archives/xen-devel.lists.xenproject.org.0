Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34329B4A9
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 18:39:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1CWL-0008KU-QV; Fri, 23 Aug 2019 16:34:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+MVe=WT=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i1CWK-0008KP-2a
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 16:34:36 +0000
X-Inumbo-ID: e3c95273-c5c3-11e9-adec-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3c95273-c5c3-11e9-adec-12813bfff9fa;
 Fri, 23 Aug 2019 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566578075;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WMFy3P8de1BdBxQdm5NzEBA7eLD1LrDY/U2ihBxOom8=;
 b=OmzT2KMb/n6b7TTTvK2+PUEadZaT/Y5/mIELFWumIfZIHNDJ6hOYFFZu
 Lz5YnKMA+r3004HlbaWUCfapJCsayUj4FtiHXoLedKBlx0xGmH1fHQHM2
 nevkCWZDcQCdvnGsqgHCw7O08bSXyRBXVCI2N+XNdu7aco1Fgl1iOBKEE I=;
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
IronPort-SDR: Ar3reionE/4Ri90fsgYqmfjpOgTTcexH4kpl69HgyDakn0gBhtVLHo1xJ834HM4UVu+0Mpe84Z
 HhACbHEfv9oI2siDv//j69Rg5gLcwDfcjZWz9KiNlQzDoCPiVSVy4+OzwLecuWvP8tlJ+5zESJ
 FjMsW3EOqb+KnDZPCNX58erMfoVePVbt2xDTmUYnkgc6elgQyS6m3F2rZks4BdNV9qbiuGn2M9
 XDsQnynySzpm9iewPmA+MBTd+oYfj4uewUP1MKrlvGSBfloz3kux3Ix1s6Jj4Wl6IpL/oJbLnh
 6Tc=
X-SBRS: 2.7
X-MesageID: 4831033
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,422,1559534400"; 
   d="scan'208";a="4831033"
From: Lars Kurth <lars.kurth@citrix.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>, Julien Grall
 <julien.grall@arm.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
Thread-Index: AQHVU44dY7Y8dcp5cU29lyjYLE0r26b9almAgAA24wCAAAMWAIAABBQAgAq64wA=
Date: Fri, 23 Aug 2019 16:34:31 +0000
Message-ID: <214936D5-863B-425D-9810-B423C93543EE@citrix.com>
References: <20190815172256.34363-1-lars.kurth@citrix.com>
 <348ae310-a048-0e96-dc12-981f96450a5f@arm.com>
 <E16EC776-8DAC-439A-9FF9-E5DF1F18206B@citrix.com>
 <2b87bf90-2e11-298f-201d-a185bd92e74a@arm.com>
 <E8C5FE89-7C12-4073-9537-9D6773D7646B@xenproject.org>
In-Reply-To: <E8C5FE89-7C12-4073-9537-9D6773D7646B@xenproject.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <42A3F16EFB9E614482FC41886BA3C2AC@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] Allow get_maintainer.pl /
 add_maintainers.pl scripts to be called outside of xen.git
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
 "Tim \(Xen.org\)" <tim@xen.org>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE2LzA4LzIwMTksIDA2OjQzLCAiTGFycyBLdXJ0aCIgPGxhcnMua3VydGgueGVu
QGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICA+IE9uIDE2IEF1ZyAyMDE5LCBh
dCAxNDoyOCwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6DQogICAg
PiANCiAgICA+IA0KICAgID4gDQogICAgPiBPbiAxNi8wOC8yMDE5IDEzOjE3LCBMYXJzIEt1cnRo
IHdyb3RlOg0KICAgID4+IE9uIDE2LzA4LzIwMTksIDExOjAxLCAiSnVsaWVuIEdyYWxsIiA8anVs
aWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOg0KICAgID4+ICAgICAgRnJvbSBteSB1bmRlcnN0YW5k
aW5nLCBhbnkgdXNlIG9uIG1pbmktb3MuZ2l0ICYgY28gd2lsbCBiZSBsZWdpdGltYXRlLiBIb3dl
dmVyLA0KICAgID4+ICAgICB3ZSBzdGlsbCBwcmludCB0aGUgV0FSTklORyBpbiB0aG9zZSBjYXNl
cy4NCiAgICA+PiAgICAgICAgICBVc3VhbGx5IFdBUk5JTkcgbWVhbnMgc29tZXRoaW5nIG5lZWRz
IGF0dGVudGlvbi4gQXMgbW9zdCBvZiB0aGUgdXNlcnMgd2lsbA0KICAgID4+ICAgICBsaWtlbHkg
Y29weS9wYXN0ZSBmcm9tIHRoZSB3aWtpLCB3ZSBhcmUgZ29pbmcgdG8gaGF2ZSByZXBvcnQgYXNr
aW5nIHdoeSB0aGUNCiAgICA+PiAgICAgV0FSTklORyBpcyB0aGVyZS4NCiAgICA+PiAgICAgICAg
ICBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gdHJ5IHRvIGRvd25ncmFkZSB0aGUgbWVz
c2FnZSBhIGJpdCB3aGVuIHBvc3NpYmxlLg0KICAgID4+ICAgICBGb3IgaW5zdGFuY2UsIHdlIGNv
dWxkIGNoZWNrIGlmIHRoZSBzZWN0aW9uICJUSEUgUkVTVCIgaXMgcHJlc2VudCBpbiB0aGUgZmls
ZQ0KICAgID4+ICAgICBNQUlOVEFJTkVSUy4gSWYgbm90LCB0aGlzIGlzIGxpa2VseSBub3QgYSBm
aWxlIHdlIGFyZSBhYmxlIHRvIHN1cHBvcnQuDQogICAgPj4gICAgIEkgdGhvdWdodCBhYm91dCB0
aGlzIGFuZCBpdCBpcyBub3QgYXMgZWFzeSBhcyBpdCBzZWVtcywgYmVjYXVzZSB0aGUgc2NyaXB0
IG9ubHkgcGFyc2VzDQogICAgPj4gTTogLi4uICZjIGxpbmVzDQogICAgPiANCiAgICA+IFRoZSBz
Y3JpcHQgaXMgYWJsZSB0byBwYXJzZSB0aGUgc2VjdGlvbiBuYW1lLiBTZWUgZ2V0X21haW50YWlu
ZXJfcm9sZSgpLg0KICAgID4gDQogICAgPiBBbHRob3VnaCwgSSBhbSBub3Qgc3VyZSBob3cgZWFy
bHkgdGhlIGZ1bmN0aW9uIGNhbiBnZXQgY2FsbGVkLg0KICAgID4gDQogICAgPiBCdXQuLi4NCiAg
ICANCiAgICBUaGF0IG1heSBtYWtlIGl0IGZlYXNpYmxlIHRvIGdvIGRvd24gdGhhdCByb3V0ZS4N
CiAgICBJbmNpZGVudGlhbGx5IGJvdGggTGludXggYXMgd2VsbCBhcyBRRU1VIE1BSU5UQUlORVJz
IGZpbGVzIHVzZSB0aGUgc2FtZSBzeW50YXgNCiAgICBhcyB1cyAod2l0aCBhIGZldyBleHRyYSB0
YWdzIHdoaWNoIHdlIGRvbid0IGhhdmUpDQogICAgDQogICAgTm90IHN1cmUgd2hldGhlciB0aGlz
IHdvdWxkIGJlIGEgcHJvYmxlbQ0KICAgIA0KICAgID4+IE1heWJlIHRoZSBiZXN0IHdheSB0byBh
ZGRyZXNzIHRoaXMgd291bGQgYmUgdG8gaW5jbHVkZSBzb21lIGlkZW50aWZpZXIgaW50byB0aGUN
CiAgICA+PiBNQUlOVEFJTkVSUyBmaWxlIChhZnRlciB0aGUgaGVhZGVyIHdpdGggYWxsIHRoZSBk
ZWZpbml0aW9ucykuDQogICAgPj4gRk9STUFUOiB4ZW4tcHJvamVjdC1tYWludGFpbmVycyA8dmVy
c2lvbj4NCiAgICA+PiAobm90ZSB0aGF0IHRoaXMgaXMgbm90IGN1cnJlbnRseSBwaWNrZWQgdXAg
YnkgdGhlIHRvb2wpDQogICAgPj4gT3INCiAgICA+PiBWOiB4ZW4tcHJvamVjdC1tYWludGFpbmVy
cyA8dmVyc2lvbj4NCiAgICA+PiAobm90ZSB0aGF0IHRoaXMgd291bGQgYmUgcGlja2VkIHVwIGJ5
IHRoZSB0b29sKQ0KICAgID4gDQogICAgPiBBbnkgb2YgdGhlc2Ugc29sdXRpb25zIGFyZSBhbHNv
IGEgcG90ZW50aWFsIGFsdGVybmF0aXZlLg0KICAgIA0KICAgIEkgd2lsbCBzZWUgd2hhdCBvdGhl
cnMgdGhpbmsgYW5kIHRha2UgaXQgZnJvbSB0aGVyZQ0KICAgIA0KSGkgYWxsLiBJIHdvdWxkIGxp
a2UgdG8gZ2V0IHRoaXMgcmVzb2x2ZWQgYW5kIHdhcyBsb29raW5nIGZvciANCm9waW5pb25zLiBU
aGUgdGhyZWFkIGlzIGFib3V0IGVuYWJsaW5nIHVzYWdlIG9mIGdldF9tYWludGFpbmVyLnBsIC8g
DQphZGRfbWFpbnRhaW5lcnMucGwgb24gc2lzdGVyIHJlcG9zaXRvcmllcyBmb3IgeGVuLmdpdCwg
c3VjaCBhcyANCnh0Zi5naXQsIG9zc3Rlc3QuZ2l0LCBtaW5pLW9zLmdpdCwgLi4uIHRvIGhhdmUg
YSBjb25zaXN0ZW50IHRvb2xzIHN0b3J5IA0KYW5kIG1ha2UgcGF0Y2ggc3VibWlzc2lvbiBmb3Ig
bmV3Y29tZXJzIGVhc2llci4gV2UgaGF2ZSANCnNldmVyYWwgb3B0aW9uczoNCg0KMSkgV2FybiBp
ZiB0aGUgdG9vbHMgYXJlIGFwcGxpZWQgb3V0c2lkZSB0aGUgWGVuIHRyZWUNCkp1bGlhbiBmZWx0
IHRoaXMgaXMgbGlrZWx5IGNvbmZ1c2luZw0KDQoyKSBEbyBub3Qgd2FybiB1bmRlciBzb21lIGNv
bmRpdGlvbnMNCjIuMSkgVXNlIFRIRSBSRVNUIGFzIGlkZW50aWZpZXIgdG8gYXZvaWQgdGhlIHdh
cm5pbmcNCkNvbnM6IFdhcm5pbmcgd291bGQgZGlzYXBwZWFyIGJlY2F1c2UgTGludXggYW5kIFFF
TVUgYWxzbyBoYXZlIFRIRSBSRVNUIA0KVGhpcyBtYXkgbm90IGJlIGFuIGlzc3VlIGFzIGJvdGgg
TUFJTlRBSU5FUlMgZmlsZXMgZm9sbG93IHRoZSBzYW1lIGZvcm1hdA0KSG93ZXZlciwgdGhlcmUg
bWF5IGJlIHN1YnRsZSBkaWZmZXJlbmNlcyBpbiBiZWhhdmlvdXIgZm9yIHVudXN1YWwgb3B0aW9u
cyANCmZvciB0aGUgZ2V0X21haW50YWluZXIucGwgc2NyaXB0IGFzIHdlIGhhdmUgbm90IGJlZW4g
dHJhY2tpbmcgYWxsIGNoYW5nZXMNCg0KMi4yKSBJbnRyb2R1Y2UgYSB1bmlxdWUgaWRlbnRpZmll
ciBpbiBNQUlOVEFJTkVSUw0KVGhpcyB3b3VsZCBpbXBseSBpbnRyb2R1Y2luZyBhIHVuaXF1ZSBp
ZGVudGlmaWVyIGZvciB4ZW4gcmVsYXRlZA0KTUFJTlRBSU5FUiBmaWxlcw0KUHJvczogTW9yZSBh
Y2N1cmF0ZQ0KQ29uczogUG9sbHV0ZXMgZmlsZSBmb3JtYXQNCg0KSSBkb27igJl0IGhhdmUgYSBz
dHJvbmcgb3BpbmlvbiBhbmQgd2lsbCBmb2xsb3cgbWFqb3JpdHkgY29uc2Vuc3VzLg0KTWF5YmUg
cGVvcGxlIGNhbiB2b3RlIG9uIHRoZSBvcHRpb25zIGFuZCBJIHdpbGwganVzdCBpbXBsZW1lbnQN
CndoYXQgbW9zdCBwZW9wbGUgcHJlZmVyDQoNCkxhcnMNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
