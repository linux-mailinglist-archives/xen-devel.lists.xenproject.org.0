Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8C190484
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 17:18:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hydxe-0001xS-Pp; Fri, 16 Aug 2019 15:16:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hydxd-0001xN-NN
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 15:16:13 +0000
X-Inumbo-ID: c77bc162-c038-11e9-8bb8-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c77bc162-c038-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565968572;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=c7lQ1dw2aW4uwdYiYKni9uMX5Ev7f5Q4XgvQPyNouoo=;
 b=d0syKL9MsSnbSZtvanpcFQbDO7x4+yAlQhv0V0gzbstPh1Ji/2hCIz83
 OqiwePWW7e0D3m6a4eDqAM2VONQRt56Z/6S5BNW5IPoj/q42Gz376W7Hd
 n012niBnmyw2WlseaXC93klbSYDqGnjOjWJXZ1KEq0DNujNhoPAkbVaWC s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HcB9oVP3XB0CkhXB5E3v9tTl5gtFHuysAN4VF0qj34U6S2pCaMBLa6lnh/AGMtitw/JcH+RRKx
 LKQKuxhMO4D2fFNkM68NFBkyA072MBwN+RazAlLM35FpCND6xiBzAgq6maaxoT/PaRPc8T8WN1
 u9P0+5fW2KHR/sokxBlMwrdHcXXhB+aCS/DtK2VNSsbxvlGNIRE6ZY4rg3/d9IYbrxTuz38PpN
 /BPv5LzFnVzQuvRWkbgR8ehLKdSc5GHYDAhIxTj9Ndao3LQJ2hjnqT+uwNOJb5VC+p3fqBitIb
 S28=
X-SBRS: 2.7
X-MesageID: 4356576
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4356576"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416122241.28342-2-wipawel@amazon.de>
 <20190808124831.10094-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <ae06b8f7-c92a-f663-3c13-47ab9a58a7f1@citrix.com>
Date: Fri, 16 Aug 2019 16:16:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190808124831.10094-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part3 v2 2/3]
 create-diff-object: Extend patchability verification: STN_UNDEF
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
Cc: mpohlack@amazon.de, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC84LzE5IDE6NDggUE0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IER1cmluZyB2
ZXJpZmljYXRpb24gY2hlY2sgaWYgYWxsIHNlY3Rpb25zIGRvIG5vdCBjb250YWluIGFueSBlbnRy
aWVzCj4gd2l0aCB1bmRlZmluZWQgc3ltYm9scyAoU1ROX1VOREVGKS4gVGhpcyBzaXR1YXRpb24g
Y2FuIGhhcHBlbiB3aGVuIGEKPiBzZWN0aW9uIGlzIGNvcGllZCBvdmVyIGZyb20gaXRzIG9yaWdp
bmFsIG9iamVjdCB0byBhIHBhdGNoZWQgb2JqZWN0LAo+IGJ1dCB2YXJpb3VzIHN5bWJvbHMgcmVs
YXRlZCB0byB0aGUgc2VjdGlvbiBhcmUgbm90IGNvcGllZCBhbG9uZy4KPiBUaGlzIHNjZW5hcmlv
IGhhcHBlbnMgdHlwaWNhbGx5IGR1cmluZyBzdGFja2VkIGhvdHBhdGNoZXMgY3JlYXRpb24KPiAo
YmV0d2VlbiAyIGRpZmZlcmVudCBob3RwYXRjaCBtb2R1bGVzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6
IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IEJqb2Vy
biBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhl
eSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2No
aXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Ci4uLiBzbmlwCj4gK3N0YXRpYyBpbnQga3BhdGNoX3Nl
Y3Rpb25faGFzX3VuZGVmX3N5bWJvbHMoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsCj4gKwkJCQkJ
ICAgIGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzZWMpCj4gK3sKPiArCWludCBvZmZzZXQsIGVudHJ5
X3NpemU7Cj4gKwlzdHJ1Y3QgcmVsYSAqcmVsYTsKPiArCXNpemVfdCBkX3NpemU7Cj4gKwo+ICsJ
ZW50cnlfc2l6ZSA9IGdldF9zZWN0aW9uX2VudHJ5X3NpemUoc2VjLCBrZWxmKTsKPiArCWlmIChl
bnRyeV9zaXplID09IDApCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCWRfc2l6ZSA9IHNlYy0+
YmFzZS0+ZGF0YS0+ZF9zaXplOwo+ICsJZm9yICggb2Zmc2V0ID0gMDsgb2Zmc2V0IDwgZF9zaXpl
OyBvZmZzZXQgKz0gZW50cnlfc2l6ZSApIHsKClRoZSBjb2Rpbmcgc3R5bGUgZG9lc24ndCB1c2Ug
c3BhY2VzIGluc2lkZSB0aGUgZm9yIGxvb3AgcGFyZW50aGVzZXMuCgo+ICsJCWxpc3RfZm9yX2Vh
Y2hfZW50cnkocmVsYSwgJnNlYy0+cmVsYXMsIGxpc3QpIHsKPiArCQkJaWYgKHJlbGEtPm9mZnNl
dCA8IG9mZnNldCB8fAo+ICsJCQkgICAgcmVsYS0+b2Zmc2V0ID49IG9mZnNldCArIGVudHJ5X3Np
emUpIHsKPiArCQkJCWNvbnRpbnVlOwo+ICsJCQl9Cj4gKwo+ICsJCQlpZiAoKEdFTEZfUl9TWU0o
cmVsYS0+cmVsYS5yX2luZm8pID09IFNUTl9VTkRFRikgfHwKPiArCQkJICAgICghcmVsYS0+c3lt
LT5pbmNsdWRlICYmIHJlbGEtPnN5bS0+c3RhdHVzID09IFNBTUUpKSB7Cj4gKwkJCQlsb2dfbm9y
bWFsKCJzZWN0aW9uICVzIGhhcyBhbiBlbnRyeSB3aXRoIGEgU1ROX1VOREVGIHN5bWJvbDogJXNc
biIsCj4gKwkJCQkJICAgc2VjLT5uYW1lLCByZWxhLT5zeW0tPm5hbWUgPzogIm5vbmUiKTsKClBl
cmhhcHMgdGhpcyBsb2cgbWVzc2FnZSBpcyBhIGJpdCBtaXNsZWFkaW5nIGlmIG9ubHkgdGhlIHNl
Y29uZCAKY29uZGl0aW9uIGlzIHRydWU/IE1heWJlIHNvbWV0aGluZyBzbGlnaHRseSBtb3JlIGdl
bmVyYWwgbGlrZSAiaGFzIGFuIAplbnRyeSB3aXRoIGFuIHVuZGVmaW5lZCBzeW1ib2wiLgoKT3Ro
ZXJ3aXNlIGxvb2tzIE9LIHRvIG1lLgoKVGhhbmtzLAotLSAKUm9zcyBMYWdlcndhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
