Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F6155793
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 13:24:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j02cZ-0007md-Bc; Fri, 07 Feb 2020 12:20:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gniO=33=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j02cY-0007mY-7A
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 12:20:30 +0000
X-Inumbo-ID: 39c528d6-49a4-11ea-b2cb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39c528d6-49a4-11ea-b2cb-bc764e2007e4;
 Fri, 07 Feb 2020 12:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581078029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NqeaisSo60I8sqZ6w0B+b1tAGqcEktUeZzrfis3Xtvw=;
 b=bwsoVW74HmkcmePscD98SLjbcmPUiy9euCM84SFoL4hhaNhXY9eJsig4
 xm+V4tD/P4/w0n3arAc1uiGeOdpz/+xeIIu7MZPen99mozO+0PR2nfjIf
 mNrYg1ZcVOdd/rfOELajFw4U3GIinFE9Lb1RrL0qoHgOHLzv1NbKb0eIy E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k0Z7cyp+GWRWxw83mGueG7DTsN4RWzi/nPw3F5MsxML+Y07nLg1Ooz9VJ33JV5jpXJgOGxLFOh
 68NjBj6cOrVACSzCA1TEsPQ4RRRDN15/xGPJ7XmnFkVGIX8Yo/TXuy3lSES/IK2A64l7wQWz0v
 brH1FvH2LD1BwXpQp3cHyTsycNqtgaotHb0rts0CjspIJjOG5RcY7zxwcrbDtVDegI2ZQdQVuU
 LZHnGt2bWfWJnVYWhZjd0v7SoiAIGPHAHl7+iTwIMvSUDGaOl57AQwVkHvB1xrpgHy4Gps4Jy0
 z6o=
X-SBRS: 2.7
X-MesageID: 12280750
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,413,1574139600"; d="scan'208";a="12280750"
Date: Fri, 7 Feb 2020 13:20:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200207122021.GD4679@Air-de-Roger>
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
 <68fb9767-3104-3f0b-d052-20df7603e1e9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68fb9767-3104-3f0b-d052-20df7603e1e9@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] VT-d: check all of an RMRR for being
 E820-reserved
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMDYsIDIwMjAgYXQgMDI6MzE6MDNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ2hlY2tpbmcganVzdCB0aGUgZmlyc3QgYW5kIGxhc3QgcGFnZSBpcyBub3Qgc3VmZmlj
aWVudCAoYW5kIHJlZHVuZGFudAo+IGZvciBzaW5nbGUtcGFnZSByZWdpb25zKS4gQXMgd2UgZG9u
J3QgbmVlZCB0byBjYXJlIGFib3V0IElBNjQgYW55bW9yZSwKPiB1c2UgYW4geDg2LXNwZWNpZmlj
IGZ1bmN0aW9uIHRvIGdldCB0aGlzIGRvbmUgd2l0aG91dCBsb29waW5nIG92ZXIgZWFjaAo+IGlu
ZGl2aWR1YWwgcGFnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYwo+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKPiBAQCAtMjksNiArMjks
NyBAQAo+ICAjaW5jbHVkZSA8eGVuL3BjaS5oPgo+ICAjaW5jbHVkZSA8eGVuL3BjaV9yZWdzLmg+
Cj4gICNpbmNsdWRlIDxhc20vYXRvbWljLmg+Cj4gKyNpbmNsdWRlIDxhc20vZTgyMC5oPgo+ICAj
aW5jbHVkZSA8YXNtL3N0cmluZy5oPgo+ICAjaW5jbHVkZSAiZG1hci5oIgo+ICAjaW5jbHVkZSAi
aW9tbXUuaCIKPiBAQCAtNjMyLDE0ICs2MzMsMTEgQEAgYWNwaV9wYXJzZV9vbmVfcm1ycihzdHJ1
Y3QgYWNwaV9kbWFyX2hlYQo+ICAgICAgICogbm90IHByb3Blcmx5IHJlcHJlc2VudGVkIGluIHRo
ZSBzeXN0ZW0gbWVtb3J5IG1hcCBhbmQKPiAgICAgICAqIGluZm9ybSB0aGUgdXNlcgo+ICAgICAg
ICovCj4gLSAgICBpZiAoICghcGFnZV9pc19yYW1fdHlwZShwYWRkcl90b19wZm4oYmFzZV9hZGRy
KSwgUkFNX1RZUEVfUkVTRVJWRUQpKSB8fAo+IC0gICAgICAgICAoIXBhZ2VfaXNfcmFtX3R5cGUo
cGFkZHJfdG9fcGZuKGVuZF9hZGRyKSwgUkFNX1RZUEVfUkVTRVJWRUQpKSApCj4gLSAgICB7Cj4g
KyAgICBpZiAoICFlODIwX2FsbF9tYXBwZWQoYmFzZV9hZGRyLCBlbmRfYWRkciArIDEsIFJBTV9U
WVBFX1JFU0VSVkVEKSApCgpEbyB5b3UgbmVlZCB0byBhZGQgb25lIHRvIHRoZSBlbmQ/CgpUaGUg
b3RoZXIgdXNlciBvZiBlODIwX2FsbF9tYXBwZWQgc2VlbXMgdG8gdHJlYXQgZW5kIGFzIHN0YXJ0
ICsgc2l6ZQotIDEsIHdoaWNoIG1ha2VzIG1lIHRoaW5rIHRoZSBwYXJhbWV0ZXJzIHRvIHRoZSBm
dW5jdGlvbiBhcmUgYW4KaW5jbHVzaXZlIHJhbmdlIFtzdGFydCwgZW5kXSBhbmQgdGhhdCdzIHdo
YXQncyBwcmVzZW50IGluIHRoZSBSTVJSCkFDUEkgZW50cmllcz8KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
