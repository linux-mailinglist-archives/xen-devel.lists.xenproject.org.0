Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B1CB6704
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 17:25:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAbo0-0002st-Nb; Wed, 18 Sep 2019 15:23:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ym9G=XN=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iAbny-0002sj-NV
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 15:23:42 +0000
X-Inumbo-ID: 4b05e84c-da28-11e9-963a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b05e84c-da28-11e9-963a-12813bfff9fa;
 Wed, 18 Sep 2019 15:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568820222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZEEGfKm5337h+1IckQvdyMnHf5uLzcSLZmBqS9lI/tw=;
 b=f9u4xV9c4lCkmJu+jDFDn9y9I1Sx0YZkR+VGXaaQrJAaDOsgPKacrfxT
 GDxy57qQ/XCYVFz4WEfpzKmreSE2wlmUb9WJvYwwb1HtGflrs84W7iZ4Z
 iDjfS708aJmiA2nbQJUaW8+2ZwyG5n11Wfj1FKd5148jXMRqYSHgFvpIm 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wV5cysDqVtHNkLL3K2xIbQ67CqN8opXf8HAFKPg+ItIrfmJPQG6aIUJrMZtIkcLigQ8zWPh5P4
 JtvsaZ5v0t7RZZdMbdcXpfPTx9gtppVyAse+zoT3Fk+GRee7i/RDqgghUvV/jEZSZcFBUKlAz3
 o848GkAk/2zfGX5GfVJnTeTZjJsp/1kxUALibHT4bqI/Zibw2o/VZKHzgthrVEmLSL3DeG5CD2
 xRmMrPSw7BGZDLhTNvp8RVYg/6i+6vmslTiefnbsvWxDtdaocC4EsEiH8ohyvrm1vIoMlStjJV
 3hk=
X-SBRS: 2.7
X-MesageID: 5794111
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="5794111"
From: Lars Kurth <lars.kurth@citrix.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>, Julien Grall
 <julien.grall@arm.com>
Thread-Topic: [PATCH] create-diff-object: more precisely identify .rodata
 sections
Thread-Index: AQHVbfOz/MMBt+ID2EWJUuzwV092UacxMOkAgAAAuYD//+ijAIAAA2sAgAAA4wCAAAnVAIAAAk0AgABSs4A=
Date: Wed, 18 Sep 2019 15:23:35 +0000
Message-ID: <17F0ADCC-4CA6-4E32-BD49-D71F6C6C2991@citrix.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
 <f164b812-4b52-bf5b-d48a-57fcc1e824cf@arm.com>
 <0DDE80F8-7E7A-4A2D-B2E3-E8E7C626A608@amazon.com>
In-Reply-To: <0DDE80F8-7E7A-4A2D-B2E3-E8E7C626A608@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <3E8048CA115882448C0A744C7E963ED9@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE4LzA5LzIwMTksIDEyOjI3LCAiV2llY3pvcmtpZXdpY3osIFBhd2VsIiA8d2lw
YXdlbEBhbWF6b24uZGU+IHdyb3RlOg0KDQogICAgDQogICAgDQogICAgPiBPbiAxOC4gU2VwIDIw
MTksIGF0IDEzOjE5LCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToN
CiAgICA+IA0KICAgID4gSGkgUGF3ZWwsDQogICAgPiANCiAgICA+IE9uIDE4LzA5LzIwMTkgMTE6
NDQsIFdpZWN6b3JraWV3aWN6LCBQYXdlbCB3cm90ZToNCiAgICA+Pj4gT24gMTguIFNlcCAyMDE5
LCBhdCAxMjo0MSwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyb3RlOg0K
ICAgID4+PiANCiAgICA+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIGNyZWF0
ZS1kaWZmLW9iamVjdDogbW9yZSBwcmVjaXNlbHkgaWRlbnRpZnkgLnJvZGF0YSBzZWN0aW9ucyIp
Og0KICAgID4+Pj4gT24gMTgvMDkvMjAxOSAxMDo1MiwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdy
b3RlOg0KICAgID4+Pj4+ICQgc2NyaXB0cy8uL2FkZF9tYWludGFpbmVycy5wbCAtZCB+L2dpdC9s
aXZlcGF0Y2gtYnVpbGQtdG9vbHMNCiAgICA+Pj4+IA0KICAgID4+Pj4gJy1kJyBvbmx5IHRlbGxz
IHlvdSB3aGVyZSB0aGUgcGF0Y2hlcyBmaWxlcyBhcmUuIFRoZSBzY3JpcHQgd2lsbCBsb29rIHVw
IGZvciB0aGUNCiAgICA+Pj4+IE1BSU5UQUlORVJTIGZpbGUgaW4gdGhlIGN1cnJlbnQgZGlyZWN0
b3J5Lg0KICAgID4+PiANCiAgICA+Pj4gSG1tbS4gIEkgd29uZGVyIGlmIHdlIGNvdWxkIGRldGVj
dCB0aGlzIHNpdHVhdGlvbiBzb21laG93LiAgVGhpcyB3aWxsDQogICAgPj4+IGJlIGEgY29tbW9u
IHVzZXIgZXJyb3IgSSB0aGluay4NCiAgICA+Pj4gDQogICAgPj4gSSBzaG91bGQgaGF2ZSBsb29r
ZWQgdHdpY2UgYmVmb3JlIHNlbmRpbmcgdGhlIHBhdGNoIG91dC4gQnV0LCB3aGF0IHdvdWxkIGJl
IHZlcnkgaGVscGZ1bCBmb3IgbWUNCiAgICA+PiBpcyBhZGRpdGlvbmFsIG9wdGlvbiB0byB0aGUg
YWRkX21haW50YWluZXJzLnBsIHNjcmlwdCBsaWtlOiAtbSAuL01BSU5UQUlORVJTDQogICAgPiAN
CiAgICA+IFdlbGwgdGhlIGZpbGVuYW1lIHdpbGwgYWx3YXlzIGJlIHRoZSBzYW1lLCBzbyBhdCBi
ZXN0IHlvdSB3aWxsIHByb3ZpZGUgcmVkdW5kYW50IGluZm9ybWF0aW9uLg0KICAgIA0KICAgIE5v
dCBpZiBJIGNyZWF0ZSBhIGdpdC1pZ25vcmVkIHN5bWxpbmsgdG8gdGhlIG90aGVyIHJlcG8uDQoN
CllvdSBjb3VsZCBhbHNvIHB1dCBhZGRfbWFpbnRhaW5lcnMucGwgb24gdGhlIHBhdGgNCg0KVW50
aWwgSSBpbXBsZW1lbnQgYSBmaXgsICBJIGZpeGVkIHRoZSBkb2NzLiBTZWUNCiogaHR0cHM6Ly93
aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvU3VibWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzI1Vz
aW5nX2FkZF9tYWludGFpbmVycy5wbF8uMjhvcl9nZXRfbWFpbnRhaW5lci5wbC4yOV9mcm9tX291
dHNpZGVfb2ZfeGVuLmdpdCANCiogaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvU3Vi
bWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzI1NldHRpbmdfdGhhdF9oZWxwX3NhdmVfeW91X3Rp
bWUgDQoNCkxhcnMNCiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
