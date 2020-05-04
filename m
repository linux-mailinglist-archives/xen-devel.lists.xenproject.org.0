Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B8A1C37BE
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 13:11:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVYzf-0001DO-P5; Mon, 04 May 2020 11:10:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdZW=6S=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jVYze-0001DJ-FI
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 11:10:38 +0000
X-Inumbo-ID: e1fc48da-8df7-11ea-9d13-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1fc48da-8df7-11ea-9d13-12813bfff9fa;
 Mon, 04 May 2020 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588590638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=spH7D/ZHX+3UZmvNVc3EbOGcC3CdDDwOplfa1KaR1Ao=;
 b=Gi5+B7saawxmVOwzfWKhiiKDfAWG3zyKWhvfpfL4qoffUkGY2jqAsywX
 zKAscjOk+Hvo58efetulfniTd/IOGmIFvQqQfCj3dcp97VYIJ/zTmegRG
 g9KsHI8zcBYIth/37XUpl/l7JMIIR1wrHPv1MybystQ71lp+x6l4rmgUM Q=;
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
IronPort-SDR: SIGzhxO0ytvQL/RpZKVU8hdlqHQHthWtoKj4PRv/FfY+lL+HqK/HLC6M7Nf7d1QmLSWUnCknAV
 w54baYL2JK1VNEeGZpn/PP57J7+WlhuWhhl+Z5fmKAsCA3xjsJDXBUV7Eoi8zy/L53n94hzCKC
 MWq+G8LrjQO9CajMJ+G7+bmV0AxFujbTgvhO87HNDJ05dJvx+9UInZH3jAriEiqxZUVcmnUiBu
 BFgbo1Oo2MWXxCfle9HnB+AsmW1pCzNJKktSk9KlgGqXb/hAoaGbvXDSKwD8I4gMR9FTe5y5cl
 lKA=
X-SBRS: 2.7
X-MesageID: 17054501
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,351,1583211600"; d="scan'208";a="17054501"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
Thread-Topic: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from
 the menuconfig directly
Thread-Index: AQHWHvtEfLlMb5EF90y7GzIGxHVxJ6iRncgAgAYL5QA=
Date: Mon, 4 May 2020 11:10:14 +0000
Message-ID: <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
In-Reply-To: <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AAE4E5113AE7D4C9AC5619F07D42E5F@citrix.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDMwLCAyMDIwLCBhdCAzOjUwIFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IEluIG9yZGVyIHRvIG1ha2UgZWFzaWVyIHRvIGV4cGVy
aW1lbnQsIHRoZSBvcHRpb24gRVhQRVJUIGNhbiBub3cgYmUNCj4+IHNlbGVjdGVkIGZyb20gdGhl
IG1lbnVjb25maWcgcmF0aGVyIHRoYW4gbWFrZSBjb21tYW5kIGxpbmUuIFRoaXMgZG9lcw0KPj4g
bm90IGNoYW5nZSB0aGUgZmFjdCBhIGtlcm5lbCB3aXRoIEVYUEVSVCBtb2RlIHNlbGVjdGVkIHdp
bGwgbm90IGJlDQo+PiBzZWN1cml0eSBzdXBwb3J0ZWQuDQo+IA0KPiBXZWxsLCBpZiBJJ20gbm90
IG1pcy1yZW1lbWJlcmluZyBpdCB3YXMgb24gcHVycG9zZSB0byBtYWtlIGl0IG1vcmUNCj4gZGlm
ZmljdWx0IGZvciBwZW9wbGUgdG8gZGVjbGFyZSB0aGVtc2VsdmVzICJleHBlcnRzIi4gRkFPRCBJ
J20gbm90DQo+IG1lYW5pbmcgdG8gaW1wbHkgSSBkb24ndCBzZWUgYW5kIGFjY2VwdCB0aGUgZnJ1
c3RyYXRpb24gYXNwZWN0IHlvdQ0KPiBtZW50aW9uIGZ1cnRoZXIgdXAuIFRoZSB0d28gbmVlZCB0
byBiZSBjYXJlZnVsbHkgd2VpZ2hlZCBhZ2FpbnN0DQo+IG9uZSBhbm90aGVyLg0KDQpJIGRvbuKA
mXQgdGhpbmsgd2UgbmVlZCB0byBtYWtlIGl0IGRpZmZpY3VsdCBmb3IgcGVvcGxlIHRvIGRlY2xh
cmUgdGhlbXNlbHZlcyBleHBlcnRzLCBwYXJ0aWN1bGFybHkgYXMg4oCcYWxs4oCdIGl0IG1lYW5z
IGF0IHRoZSBtb21lbnQgaXMsIOKAnENhbiBidWlsZCBzb21ldGhpbmcgd2hpY2ggaXMgbm90IHNl
Y3VyaXR5IHN1cHBvcnRlZOKAnS4gIFBlb3BsZSB3aG8gYXJlIGJ1aWxkaW5nIHRoZWlyIG93biBo
eXBlcnZpc29ycyBhcmUgYWxyZWFkeSBwcmV0dHkgd2VsbCBhZHZhbmNlZDsgSSB0aGluayB3ZSBj
YW4gbGV0IHRoZW0gc2hvb3QgdGhlbXNlbHZlcyBpbiB0aGUgZm9vdCBpZiB0aGV5IHdhbnQgdG8u
DQoNCiAtR2Vvcmdl

