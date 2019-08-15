Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC84A8F1F9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 19:20:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyJMz-0005LK-LN; Thu, 15 Aug 2019 17:17:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pnYX=WL=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hyJMx-0005LD-Av
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 17:16:59 +0000
X-Inumbo-ID: 7c2046ec-bf80-11e9-8ba4-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c2046ec-bf80-11e9-8ba4-12813bfff9fa;
 Thu, 15 Aug 2019 17:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565889417;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZDDxFhjlSTjXZuFqM2aR+SCsBSn55fOvA4KYDThBNA0=;
 b=afJUlruqgCDwGy0Ybf7NfAnRvBMC8QW03I3zwGDTS8WVClTl0XsQgLUG
 jLgWVmYccQh44UZNDc/8pxr3FOjbGBhqR8E6tHxEteWpiE6YpWL/KQRwy
 hIElQ0yp68eqrBXiVdsu47jABUSACGwkGpXfPwKDvMwrRee8Pdw41V6Vj w=;
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
IronPort-SDR: Iek+iBVueiQlecjyFGz5aB//1CRldq79e7ivAiNsTMBnc7glivA8/OzCkD2wD/MXl0/vkHPKtM
 Q+qgrcEZanDVPgy77kY71yNeyMRAoeIvxTxPNSe8W9KsxF9TAA+zeWbC6CrBTey/lC37z/+qS/
 6zI4zXw5e/GU+a73PxaNJnYOwODJT3KzGo+YieCeadlWmbHCB8kS37Y/Y/XYj0UgbdUJi/E9aX
 0SVyuyXPJ8ida6qop3Q7/VrWKurnrWmDjtOJgHuFBxvOC8oGHm2Y7GAygMv4l/Gjq+jifgmJQm
 eoY=
X-SBRS: 2.7
X-MesageID: 4481553
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,389,1559534400"; 
   d="scan'208";a="4481553"
From: Lars Kurth <lars.kurth@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Allow get_maintainer.pl / add_maintainers.pl scripts to
 be called outside of xen.git
Thread-Index: AQHVU4ya7Q8LJrxSBk6jnQ26lIQOzab8YpqA
Date: Thu, 15 Aug 2019 17:16:53 +0000
Message-ID: <CD4A576B-52F5-4542-99D4-1F83041A04FC@citrix.com>
References: <20190815171158.33884-1-lars.kurth@citrix.com>
In-Reply-To: <20190815171158.33884-1-lars.kurth@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <B5C37C3A6A86F442AB2042830C2FA4F4@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Allow get_maintainer.pl /
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
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE1LzA4LzIwMTksIDE4OjEyLCAiTGFycyBLdXJ0aCIgPGxhcnMua3VydGhAY2l0
cml4LmNvbT4gd3JvdGU6DQoNCiAgICBVc2UtY2FzZTogQWxsb3cgdXNpbmcgYm90aCBzY3JpcHRz
IG9uIHhlbiByZXBvc2l0b3JpZXMgc3VjaCBhcw0KICAgIG1pbmktb3MuZ2l0LCBvc3N0ZXN0Lmdp
dCwNCiAgICANCiAgICBUb29sIGNoYW5nZXM6DQogICAgKiBhZGRfbWFpbnRhaW5lcnMucGw6ICRn
ZXRfbWFpbnRhaW5lciBpbmhlcml0cyBwYXRoIGZyb20gJDANCiAgICAqIGdldF9tYWludGFpbmVy
LnBsOiB3YXJuIChpbnN0ZWFkIGZvIGRpZSkgd2hlbiBjYWxsZWQNCiAgICAgIGZyb20gYSBkaWZm
ZXJlbnQgdHJlZQ0KICAgIA0KICAgIEFzc3VtcHRpb25zOiB0aGUgcmVwb3NpdG9yeSBjb250YWlu
cyBhIE1BSU5UQUlORVJTIGZpbGUgdGhhdA0KICAgIGZvbGxvd3MgdGhlIHNhbWUgY29udmVudGlv
bnMgYXMgdGhlIGZpbGUgaW4geGVuLmdpdA0KICAgIA0KICAgIEEgc3VnZ2VzdGVkIHRlbXBsYXRl
DQogICAgDQogICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCiAgICBUaGlzIGZpbGUgZm9sbG93cyB0aGUgc2FtZSBjb252ZW50aW9ucyBh
cyBvdXRsaW5lZCBpbg0KICAgIHhlbi5naXQ6TUFJTlRBSU5FUlMuIFBsZWFzZSByZWZlciB0byB0
aGUgZmlsZSBpbiB4ZW4uZ2l0DQogICAgZm9yIG1vcmUgaW5mb3JtYXRpb24uDQogICAgDQogICAg
VEhFIFJFU1QNCiAgICBNOglNQUlOVEFJTkVSMSA8bWFpbnRhaW5lcjFAZW1haWwuY29tPg0KICAg
IE06ICAgICAgTUFJTlRBSU5FUjIgPG1haW50YWluZXIyQGVtYWlsLmNvbT4NCiAgICBMOgl4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCiAgICBTOglTdXBwb3J0ZWQNCiAgICBGOgkqLw0K
ICAgID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09DQogICAgDQogICAgU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRy
aXguY29tPg0KICAgIC0tLQ0KICAgICBzY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCB8ICA5ICsr
KysrKy0tLQ0KICAgICBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsICB8IDEzICsrKysrKysrKysr
LS0NCiAgICAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQ0KICAgIA0KICAgIGRpZmYgLS1naXQgYS9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbCBiL3Nj
cmlwdHMvYWRkX21haW50YWluZXJzLnBsDQogICAgaW5kZXggMDllOWY2NjA5Zi4uN2Y5OGRkZTg3
NCAxMDA3NTUNCiAgICAtLS0gYS9zY3JpcHRzL2FkZF9tYWludGFpbmVycy5wbA0KICAgICsrKyBi
L3NjcmlwdHMvYWRkX21haW50YWluZXJzLnBsDQogICAgQEAgLTI1LDEwICsyNSwxMyBAQCBzdWIg
bm9ybWFsaXplICgkJCk7DQogICAgIHN1YiBpbnNlcnQgKCQkJCQpOw0KICAgICBzdWIgaGFzdGFn
ICgkJCk7DQogICAgIA0KICAgIC0jIFRvb2wgVmFyaWFibGVzDQogICAgLW15ICRnZXRfbWFpbnRh
aW5lciAgICAgID0gIi4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCI7DQogICAgLQ0KICAgICsj
IFRvb2wgVmFyaWFibGVzIA0KICAgICBteSAkdG9vbCA9ICQwOw0KICAgICtteSAkZ2V0X21haW50
YWluZXIgPSAkdG9vbDsgDQogICAgKyRnZXRfbWFpbnRhaW5lciA9fiBzL2FkZF9tYWludGFpbmVy
cy9nZXRfbWFpbnRhaW5lci87IA0KICAgICsNCiAgICArcHJpbnQgJGdldF9tYWludGFpbmVyLiJc
biI7DQoNCldpbGwgcmUtc2VuZCBhIHYyLiBJIGxlZnQgYSBkZWJ1ZyBtZXNzYWdlIGluLiBBcG9s
b2dpZXMNCkxhcnMgICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
