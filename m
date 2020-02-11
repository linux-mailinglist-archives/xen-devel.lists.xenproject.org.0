Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0A0159260
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 15:58:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1WwW-0003uV-4D; Tue, 11 Feb 2020 14:55:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GUI1=37=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1j1WwU-0003uP-HE
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 14:55:14 +0000
X-Inumbo-ID: 81249b34-4cde-11ea-b5b7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81249b34-4cde-11ea-b5b7-12813bfff9fa;
 Tue, 11 Feb 2020 14:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581432912;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=F+t/k9L50ITpQKYogu4IJ03LFxmEaeL3gytJFuuDrjg=;
 b=LP2abZK8t7MeK1XVTag0C+9DcGWMzpj65undKI9JaBnb4A3dEW8tWO4H
 kWwlTQt7DHMK9i+7gLRhqXerx/WzLAxTmm5OLL71Yh3fK5hR/qMCXa0Kt
 feSHOCAhSCh1KikryvaR6KaYrWOmVMEIRCQmgoZVDrIVNM4N2s6IsRqNp U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QYePjbOjdYPjyPIwQlXMOw6+ze4nF1Ke680pIdkBI/3QAn+JXSfl44OzKa/ibIp3iU07/s6Ouz
 y0ZZz1Wq9gFZx3DXhHcKWqCq7CzZHl0ha/1JHrME0jabLNXYoREnGfYi7P3xOxvChkPvUgvwe7
 zDdx+KLq3yiYgpL4ebVBOe5keC7LoK9ZMH6DcGy889a/aTOLE+Wbi7xMVrAcxurY1i3KZeJFPG
 w8HCxnQixyu7YXRXHrqpdaU19ngveZL0eJn47jCPDShiaofFFL+tOkcWMHnfAKnfG+Ic0bvLNU
 MPI=
X-SBRS: 2.7
X-MesageID: 12643471
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12643471"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, Wei Liu <Wei.Liu2@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>
Thread-Topic: [Vote] Approve hypervisor project check-in policy
Thread-Index: AQHV1RvMRnHwcx23bEiescOXQN2BcqgWG4UA
Date: Tue, 11 Feb 2020 14:55:08 +0000
Message-ID: <8A4C8C04-0839-42E7-8C56-53776851A63E@citrix.com>
References: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
In-Reply-To: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <52C58357564C1D4B986EB05E5D450A55@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Vote] Approve hypervisor project check-in policy
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIEphbiAyNywgMjAyMCwgYXQgMjoxMiBQTSwgR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEkgaGF2ZSBkcmFmdGVkIGFuIGV4cGxpY2l0
IHBvbGljeSBvbiB3aGF0IGlzIChnZW5lcmFsbHkpIHJlcXVpcmVkIHRvDQo+IGNoZWNrIGEgcGF0
Y2ggaW4uICBJdCdzIGJlZW4gdGhyb3VnaCBzZXZlcmFsIHJvdW5kcywgYW5kIHY0IGhhcyBiZWVu
DQo+IGFja2VkIFsxXS4NCj4gDQo+IEkndmUgaGFkIGluZm9ybWFsIGFzc2VudCBmcm9tIGFsbCBj
b21taXR0ZXJzLCBidXQganVzdCB0byBkb3QgYWxsIG91cg0KPiBpJ3MgYW5kIGNyb3NzIGFsbCBv
dXIgdCdzLCBpdCdzIHByb2JhYmx5IHdvcnRoIGhhdmluZyBhIHZvdGUgb2YgdGhlDQo+IGNvbW1p
dHRlcnMsIGluIGxpbmUgd2l0aCB0aGUgWGVuUHJvamVjdCBnb3Zlcm5hbmNlIHBvbGljeSBbMV0u
DQo+IA0KPiBQbGVhc2UgcmVzcG9uZCBieSAxMCBGZWJydWFyeSB3aXRoIHlvdXIgdm90ZToNCj4g
KzE6IGZvciBwcm9wb3NhbA0KPiAtMTogYWdhaW5zdCBwcm9wb3NhbA0KPiBpbiBwdWJsaWMgb3Ig
cHJpdmF0ZS4NCg0KQnkgbXkgY291bnQgd2UgaGF2ZSA0ICsx4oCZcyBhbmQgbm8gb2JqZWN0aW9u
cywgc28gdGhlIHBvbGljeSBpcyBhcHByb3ZlZC4gIEnigJlsbCBjaGVjayBpbiB0aGUgcGF0Y2gg
bW9kaWZ5aW5nIE1BSU5UQUlORVJTLg0KDQogLUdlb3JnZQ0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
