Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B814DF80
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:56:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixD5j-00027h-Q3; Thu, 30 Jan 2020 16:54:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q1Hx=3T=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ixD5i-00027X-7i
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:54:54 +0000
X-Inumbo-ID: 3c49d382-4381-11ea-8396-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c49d382-4381-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580403293;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P8Qu8GyUZEz8seIfgbtj2GMpNrW9omb6U/IVJ9mRSrA=;
 b=EXlZFCgsSSGhCTVPXPXPL64As+jpeC4pKFBpwwengqGQE93i3ChwQ5s+
 yNRDmvILhgK6iRvxtf0Ijd1vLb9rWNJ+l1Cir/ofOVTaBynnBLipyZE4g
 d++uAXoeWq8edTRK3t1FRiszWLepKmr7l1YUyWUk0MhzZE67uddfZ6Z3D I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /QXHOiDSQoXbu6sfgB/6nd1gDGJcHBo+gDkthxQEu2sUlOLnpeERmpLRFOkN4fxzaEW0S96wQP
 ntIgHqJXb+d3Sad2OvP5E1kvqvxKtev8cPKKgq4V82n+v62QuJ7rV6gw61J94hS2UUDcw/0FTT
 EZmxLbhyGj60RzQJToMn744BL23sWj9DuNgtcMR5mIDXQNuunusNK2LWeE3If8TUd2g0NV6r+o
 QE3lAuyamTSQrbS02wYz9vpsNc6/7N8Rq320FJSmwxJVwW/xDCWo/i0wKwgvC6zPl/8lzcAB5U
 bV8=
X-SBRS: 2.7
X-MesageID: 12062181
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="12062181"
Date: Thu, 30 Jan 2020 16:54:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200130165444.GP1288@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-3-anthony.perard@citrix.com>
 <af46bb71-eb4b-d17c-f434-8d076083c12c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af46bb71-eb4b-d17c-f434-8d076083c12c@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 02/12] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDM6MTk6MDVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiArIyBI
YW5kbGUgb2JqZWN0cyBpbiBzdWJkaXJzCj4gPiArIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICsj
IG8gaWYgd2UgZW5jb3VudGVyIGZvby8gaW4gJChvYmoteSksIHJlcGxhY2UgaXQgYnkgZm9vL2J1
aWx0X2luLm8KPiA+ICsjICAgYW5kIGFkZCB0aGUgZGlyZWN0b3J5IHRvIHRoZSBsaXN0IG9mIGRp
cnMgdG8gZGVzY2VuZCBpbnRvOiAkKHN1YmRpci15KQo+ID4gK19fc3ViZGlyLXkJOj0gJChmaWx0
ZXIgJS8sICQob2JqLXkpKQo+ID4gK3N1YmRpci15CSs9ICQoX19zdWJkaXIteSkKPiAKPiBJIHJl
YWxpemUgSSdsbCBiZSBjYWxsZWQgZ3VpbHR5IG9mIGJpa2Utc2hlZGRpbmcgYWdhaW4sIGFuZCBJ
IGFsc28KPiByZWFsaXplIHRoaXMgaXMgdGhlIHdheSBMaW51eCBkb2VzIGl0LCBidXQgd2hhdCB1
c2UgaXMgdGhlCj4gaW50ZXJtZWRpYXRlIF9fc3ViZGlyLXk/IExpbnV4IGhhcyBubyAybmQgdXNl
LCBhbmQgaGVuY2UgSSBhbHNvCj4gZG9uJ3Qgc2VlIHdoeSB3ZSB3b3VsZCBnYWluIG9uZS4gSSBm
dXJ0aGVyIHRoaW5rIGFjY29yZGluZyB0byBvdXIKPiBzdHlsZSB0aGVyZSBzaG91bGQgYmUgbm8g
dXNlIG9mIHRhYnMgaGVyZS4KCkkgdGhvdWdoIHRoZSBleHRyYSBfX3N1YmRpci15IHRoYXQgTGlu
dXggZG9lcyB3YXMgdG8gZG8gdGhlIGZpbHRlcmluZyBvbgpvYmoteSByaWdodCB3YXkgYW5kIG5v
dCBhdCBhIGxhdGVyIHRpbWUgd2hlbiBzdWJkaXIteSBpcyB1c2VkLiBCdXQgaW4KTGludXggKG5v
dyB0aGF0IEkgbG9vayBtb3JlIGNsb3NlbHkgYXQgaXQpLCBzdWJkaXIteSBpcyBpbml0aWFsaXNl
ZCB3aXRoCjo9IHRvIGhhdmUgdGhlIHJpZ2h0IHR5cGUsIHNvIHRoZSBleHRyYSBfX3N1YmRpci15
IGRvZXNuJ3QgYXBwZWFyIHRvIGJlCnVzZWZ1bC4gKEFuZCBJIGRpZG4ndCBmaW5kIGFueSBzdWJk
aXIteT0pCgpTbywgSSdsbCBhZGQgYSAic3ViZGlyLXkgOj0iIHNvbWV3aGVyZSBhbmQgcmVtb3Zl
IHRoZSBuZWVkIGZvcgpfX3N1YmRpci15LiAoQW5kIGhvcGVmdWxseSwgbm8gb25lIHdpbGwgYWRk
IGEgc3ViZGlyLXk9ZGlyIHNvbWV3aGVyZSBhbmQKYnJlYWsgdGhlIGJ1aWxkLikKCkFzIGZvciB1
c2luZyBzcGFjZSBpbnN0ZWFkIG9mIHRhYnMsIEkgY2FuIGRvIHRoYXQuIEkganVzdCBuZWVkIHRv
IGZpZ3VyZQpvdXQgaG93IHRvIGNvbmZpZ3VyZSBteSBlZGl0b3IgcHJvcGVybHkgdG8gdXNlIHRh
YiBvbmx5IHdoZW4gbmVlZGVkLgoKPiA+ICtvYmoteQkJOj0gJChwYXRzdWJzdCAlLywgJS9idWls
dF9pbi5vLCAkKG9iai15KSkKPiA+ICsKPiA+ICtzdWJkaXItbiA6PSAkKHN1YmRpci1uKSAkKHN1
YmRpci0pIFwKPiA+ICsJCSQoZmlsdGVyICUvLCAkKG9iai1uKSAkKG9iai0pKQo+IAo+IFRoaXMg
d2lsbCBlYXNpbHkgZml0IG9uIG9uZSBsaW5lIChhbmQgaXNuJ3QgYW55dGhpbmcgY2xvbmVkIGZy
b20KPiBMaW51eCkuCgpXaWxsIGRvLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
