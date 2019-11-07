Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAFCF3899
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 20:30:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSnQ5-0003sg-0m; Thu, 07 Nov 2019 19:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y2MP=Y7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iSnQ2-0003s9-JP
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 19:26:10 +0000
X-Inumbo-ID: 7378ca18-0194-11ea-b678-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7378ca18-0194-11ea-b678-bc764e2007e4;
 Thu, 07 Nov 2019 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573154770;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DZc/a7V0MapY0nEayBKbxpww39NDDoIg6YFJNVu03MU=;
 b=ZRaXTpxEfGCSxkGbreuturkiC/cJJAdV3tXFl3yp1CFy+wnnNkCcAlbD
 LoJiNMWaz4ejkW2YW0YBp0xeN654HbHSKI5dCo+Wc6ffzTpzaczqzzWqJ
 VXWC2uAkobaRUI7hAUtVSkDE4TNMEM5z+Ykik040x2s27968VnifSAzM9 k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: U8A4Jm5uvlkkFY/gexQXs9JUkuQYl6DeYXlrvtAWtmKl4RCEX5DIuEXkJoOgZQiVEDgVXSxbqL
 zq97MeCCTUPMoks+fZta7Bf9+DIl++hn/2uhZwJnqr26tO2U4HyU6KvD7nEOV1vo+uRw9J2+l7
 hRkIU3kC+n1rn+YKWR42fHbT3WZUtNW9E/mq2b+na3UyaE4RkLvgPl2SQw6ceDGi+CGDCjHPNb
 Atc4QoxycVsu3taaGcd8mpyBziDqhrC+dUrcwOAu37m5dY3IGcC6i3Eee/q+ismVYuOJx222WO
 Gg8=
X-SBRS: 2.7
X-MesageID: 8131772
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,279,1569297600"; 
   d="scan'208";a="8131772"
From: Lars Kurth <lars.kurth@citrix.com>
To: Artem Mygaiev <Artem_Mygaiev@epam.com>, "sstabellini@kernel.org"
 <sstabellini@kernel.org>, "persaur@gmail.com" <persaur@gmail.com>
Thread-Topic: [Xen-devel] [RFC] Documentation formats, licenses and file
 system structure
Thread-Index: AQHVf2cRdQE5+PIufEarnRjQ6zCVf6dT+XmAgAAogYCAAGMNAIAAtDWAgAWecoCAAK9DAIAB1/uAgAFt+gCAACPNAIAAAlYAgAADWgCAAAODAIAAF7EAgAXrcwCAGtEzAA==
Date: Thu, 7 Nov 2019 19:26:05 +0000
Message-ID: <55138017-FA03-49E3-835E-812DB07A5282@citrix.com>
References: <alpine.DEB.2.21.1910170943580.30080@sstabellini-ThinkPad-T480s>
 <AE96ACE4-E5D6-4B33-B009-AA8B9A7F9AD8@gmail.com>
 <96F5CF4C-B1F6-4523-9130-89E001DC5FD4@citrix.com>
 <43bea02c7b45f360049791ae4c63e062fc40e514.camel@epam.com>
In-Reply-To: <43bea02c7b45f360049791ae4c63e062fc40e514.camel@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <188B348FF616784ABFE98E251B7256E4@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] Documentation formats,
 licenses and file system structure
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
Cc: "lars.kurth.xen@gmail.com" <lars.kurth.xen@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpJIGhhdmUgcmVjZWl2ZWQgaW5mb3JtYWwgYWR2aWNlDQoNCu+7v09uIDIxLzEw
LzIwMTksIDA2OjU0LCAiQXJ0ZW0gTXlnYWlldiIgPEFydGVtX015Z2FpZXZAZXBhbS5jb20+IHdy
b3RlOg0KDQogICAgPiAgQmVmb3JlIHdlIGFzayBYZW4gRnVTQSBjb250cmlidXRvcnMgdG8gaW52
ZXN0IGluIGRvY3VtZW50YXRpb24gdG8NCiAgICA+IGJlIHByZXNlbnRlZCBhcyBsZWdhbGx5LXZh
bGlkIGV2aWRlbmNlIGZvciBjZXJ0aWZpY2F0aW9uLCB3ZSBzaG91bGQNCiAgICA+IGFzayBhIGNl
cnRpZmllZCBsYXd5ZXIgZm9yIHRoZWlyIGZvcm1hbCBvcGluaW9uIG9uIHRoZSB2YWxpZGl0eSBv
ZjoNCiAgICA+ICAgICANCiAgICA+ICAgICAgIChhKSBhcHBseWluZyBhIHNvdXJjZSBjb2RlIGxp
Y2Vuc2UgKEJTRCkgdG8gZG9jdW1lbnRhdGlvbg0KICAgID4gDQogICAgPiBUaGVyZSBhcmUgYWxz
byBCU0QgZG9jdW1lbnRhdGlvbiBsaWNlbnNlIHZhcmlhbnRzIHdoaWNoIG1heSBiZSB3b3J0aA0K
ICAgID4gbG9va2luZyBhdA0KDQpUaGVyZSBpcyBubyBMRUdBTCBpc3N1ZSB3aXRoIHVzaW5nIGEg
c291cmNlIGNvZGUgbGljZW5zZSBmb3IgZG9jdW1lbnRhdGlvbg0KVHlwaWNhbGx5LCBjb21tdW5p
dHkgaXNzdWVzIGFyaXNlIHdoZW4gdGhlIGxpY2Vuc2UgaXMgaGFzIGEgcGF0ZW50IGNsYXVzZQ0K
d2hpY2ggd291bGQgYWN0IGFzIGEgcG9zc2libGUgYmFycmllciB0byBjb250cmlidXRpbmcgdG8g
dGhlIGRvY3MgKHdoaWNoIHNob3VsZCBiZSBsb3cpDQoNCiAgICA+ICAgICAgIChiKSBtb3Zpbmcg
dGV4dCBiaWRpcmVjdGlvbmFsbHkgYmV0d2VlbiBzb3VyY2UgY29kZSAoQlNEKSBhbmQNCiAgICA+
IGRvY3VtZW50YXRpb24gKGFueSBsaWNlbnNlKQ0KICAgID4gICAgICAgKGMpIG1vdmluZyB0ZXh0
IGJpZGlyZWN0aW9uYWxseSBiZXR3ZWVuIHNvdXJjZSBjb2RlIChCU0QpIGFuZA0KICAgID4gZG9j
dW1lbnRhdGlvbiAoQ0MwKQ0KICAgID4gICAgIA0KICAgID4gSSB3aWxsIHJhaXNlIHRoaXMgYXQg
dGhlIG5leHQgU0lHIG1lZXRpbmcNCg0KRnVuZGFtZW50YWxseSwgeW91IGNhbuKAmXQgbW92ZSBj
b3B5cmlnaHRhYmxlIGNvbnRlbnQgZnJvbSBhbnkgQ0MtQlktNC9DQzAgdG8gQlNEIGFuZCB2aWNl
IHZlcnNhIHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUgcHJvY2VzcyBvZiBjaGFuZ2luZyBhIGxp
Y2Vuc2UNCg0KT24gdGhlIGNvbW11bml0eSBjYWxsIHdlIGRpc2N1c3NlZCBBbmR5J3Mgc3BoaW54
LWRvY3MuIEFuZHkgbWFkZSBhIHN0cm9uZyBjYXNlIHRvIGtlZXAgdGhlIGRvY3NldCBhcyBDQy1C
WS00DQpJdCByZXN0cyBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHVzZXIgZG9jcyB3aWxsIGFsd2F5
cyBiZSBkaWZmZXJlbnQgZnJvbSB3aGF0J3MgaW4gY29kZSBhbmQgdGh1cyB0aGVyZSBpcyBubyBu
ZWVkIHRvIG1vdmUgYW55dGhpbmcgd2hpY2ggaXMgY29weXJpZ2h0YWJsZSBiZXR3ZWVuIGNvZGUg
YW5kIHRoZSBkb2NzDQpTaG91bGQgdGhhdCB0dXJuIG91dCB0byBiZSB3cm9uZywgdGhlcmUgaXMg
c3RpbGwgYWx3YXlzIHRoZSBwb3NzaWJpbGl0eSBvZiBhIG1peGVkIENDLUJZLTQgLyBCU0QtMi1D
bGF1c2UgZG9jc2V0IGluIGZ1dHVyZQ0KU28gd2UgYXJlIG5vdCBwYWludGluZyBvdXJzZWx2ZXMg
aW50byBhIGNvcm5lcg0KDQpSZWdhcmRpbmcgc2FmZXR5IHJlbGF0ZWQgZG9jcywgd2UgZGlzY3Vz
c2VkDQoqIENDLUJZLTQgPT4gdGhpcyBpcyBsaWtlbHkgdG8gYmUgcHJvYmxlbWF0aWMgYXMgbWFu
eSBkb2NzIGFyZSBjb3VwbGVkIGNsb3NlbHkgd2l0aCBzb3VyY2UNCiogRHVhbCBDQy1CWS00IC8g
QlNELTItQ2xhdXNlIGxpY2Vuc2luZyBkb2VzIG5vdCBzb2x2ZSB0aGlzIHByb2JsZW0NCiogQlNE
LTItQ2xhdXNlIGRvY3Mgd291bGQgZW5hYmxlIGRvY3MgdGhhdCANCg0KVGh1cywgdGhlIG1vc3Qg
c2Vuc2libGUgYXBwcm9hY2ggZm9yIHNhZmV0eSByZWxhdGVkIGRvY3Mgd291bGQgYmUgdG8gdXNl
IGEgQlNELTItQ2xhdXNlIGxpY2Vuc2UgdW5pZm9ybWx5IGluIHRoYXQgY2FzZQ0KDQpSZWdhcmRz
DQpMYXJzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
