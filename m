Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425548FF3B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 11:44:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyYjJ-0002Wo-Lp; Fri, 16 Aug 2019 09:41:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hyYjI-0002Wj-9Z
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 09:41:04 +0000
X-Inumbo-ID: f5ec8b1e-c009-11e9-aee9-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5ec8b1e-c009-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 09:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565948463;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=putDrLvly76/wR4RyDGy575+y4LiAOPXAyp1HCvSvd4=;
 b=RcYQEFtyORIK+On4yvGEt3Sk+w9gaVsEqpbVnzTtansbz2bPP7SQSCiX
 rLszEzD5w+P/etewkuzBqUNt+KR6NRks67WrTIRW4X8k5s/6qE7VbiW+6
 ZHMXYlF+J99qpRb622FxpGrKngtbIcs9wB0814Hd4QVFrBHEzkb5mrXLL 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7ds2yYhL9igpEV8v6KM6Ak3u2HS49FkwrC7RQFoQx89FVOYM8FvOqUp6zu49QivC+a8s5mZz1q
 c14tKn/qjGwmFcAbqe5r15pYdWt3s4YYmnl6qhdANOqjEJ1Ke1CO1ae35MulxY0f1a7lgn6AMo
 DxXzp6wlHhhlHTyjboju34HHUREcmFuaH/AdCCFmfOoSZDEwPGcDfXQfXML7txMwtdfxr8yAyf
 +BYBrLkZQ6JW2S53O0FgPMlZePt/sRveB/cYSjuw39HFeZSfjWlXuACttGTmCofH5g6yThGptJ
 Oeg=
X-SBRS: 2.7
X-MesageID: 4388944
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,391,1559534400"; 
   d="scan'208";a="4388944"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416120716.26269-5-wipawel@amazon.de>
 <20190808123527.8340-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <937a221e-138a-8431-e586-9c722c595f9c@citrix.com>
Date: Fri, 16 Aug 2019 10:40:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190808123527.8340-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 v2 5/6]
 create-diff-object: Add new entries to special sections array array
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

T24gOC84LzE5IDE6MzUgUE0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IEhhbmRsZSAu
bGl2ZXBhdGNoLmhvb2tzKiBhbmQgLmFsdGluc3RyX3JlcGxhY2VtZW50IHNlY3Rpb25zIGFzIHRo
ZQo+IHNwZWNpYWwgc2VjdGlvbnMgd2l0aCBhc3NpZ25lZCBncm91cF9zaXplIHJlc29sdXRpb24g
ZnVuY3Rpb24uCj4gQnkgZGVmYXVsdCBlYWNoIC5saXZlcGF0Y2guaG9va3MqIHNlY3Rpb25zJyBl
bnRyeSBpcyA4IGJ5dGVzIGxvbmcgKGEKPiBwb2ludGVyKS4gVGhlIC5hbHRpbnN0cl9yZXBsYWNl
bWVudCBzZWN0aW9uIGhhcyB1bmRlZmluZWQgZ3JvdXBfc2l6ZS4KPiAKPiBBbGxvdyB0byBzcGVj
aWZ5IGRpZmZlcmVudCAubGl2ZXBhdGNoLmhvb2tzKiBzZWN0aW9uIGVudHJ5IHNpemUgdXNpbmcK
PiBzaGVsbCBlbnZpcm9ubWVudCB2YXJpYWJsZSBIT09LX1NUUlVDVF9TSVpFLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpvbi5kZT4KPiBSZXZp
ZXdlZC1ieTogQW5kcmEtSXJpbmEgUGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPgo+IFJl
dmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9uLmRlPgo+IFJldmlld2VkLWJ5
OiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiAtLS0KPiB2MjoKPiAqIEFw
cGxpZWQgc3VnZ2VzdGlvbnMgZnJvbSBSb3NzIGFuZCBuZWNjZXNzYXJ5IGNoYW5nZXMgZW5mb3Jj
ZWQgYnkKPiAgICBwcmV2aW91cyBwYXRjaCBvZiB0aGUgc2VyaWVzOgo+ICAgIC0gZml4ZWQgaW5k
ZW50YXRpb24KPiAgICAtIHVzZWQgbG9nX2RlYnVnKCkgaW5zdGVhZCBvZiBwcmludGYoKQo+ICAg
IC0gYWRkZWQgYXV4LiBmdW5jdGlvbiB1bmRlZmluZWRfZ3JvdXBfc2l6ZSgpIHJldHVybmluZyAw
IGZvciBhCj4gICAgICB1bmRlZmluZWQgZ3JvdXBfc2l6ZQo+ICAgIC0gYWRkZWQgLmFsdGluc3Ry
X3JlcGxhY2VtZW50IHRvIHRoZSBzcGVjaWFsX3NlY3Rpb25zIGFycmF5IGFuZAo+ICAgICAgZml4
ZWQgaXRzIGdyb3VwX3NpemUgdG8gdW5kZWZpbmVkICgwKS4KPiAtLS0KPiAgIGNyZWF0ZS1kaWZm
LW9iamVjdC5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9jcmVhdGUtZGlmZi1v
YmplY3QuYyBiL2NyZWF0ZS1kaWZmLW9iamVjdC5jCj4gaW5kZXggYzYxODNjMy4uODM2NWFmMCAx
MDA2NDQKPiAtLS0gYS9jcmVhdGUtZGlmZi1vYmplY3QuYwo+ICsrKyBiL2NyZWF0ZS1kaWZmLW9i
amVjdC5jCj4gQEAgLTk5NSw2ICs5OTUsMjQgQEAgc3RhdGljIGludCBhbHRpbnN0cnVjdGlvbnNf
Z3JvdXBfc2l6ZShzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZiwgaW50IG9mZnNldCkKPiAgIAlyZXR1
cm4gc2l6ZTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50IGxpdmVwYXRjaF9ob29rc19ncm91cF9z
aXplKHN0cnVjdCBrcGF0Y2hfZWxmICprZWxmLCBpbnQgb2Zmc2V0KQo+ICt7Cj4gKwlzdGF0aWMg
aW50IHNpemUgPSAwOwo+ICsJY2hhciAqc3RyOwo+ICsJaWYgKCFzaXplKSB7Cj4gKwkJc3RyID0g
Z2V0ZW52KCJIT09LX1NUUlVDVF9TSVpFIik7Cj4gKwkJc2l6ZSA9IHN0ciA/IGF0b2koc3RyKSA6
IDg7Cj4gKwl9Cj4gKwo+ICsJbG9nX2RlYnVnKCJsaXZlcGF0Y2hfaG9va3Nfc2l6ZT0lZFxuIiwg
c2l6ZSk7Cj4gKwlyZXR1cm4gc2l6ZTsKPiArfQo+ICsKPiArc3RhdGljIGludCB1bmRlZmluZWRf
Z3JvdXBfc2l6ZShzdHJ1Y3Qga3BhdGNoX2VsZiAqa2VsZiwgaW50IG9mZnNldCkKPiArewo+ICsJ
cmV0dXJuIDA7Cj4gK30KPiArCj4gICAvKgo+ICAgICogVGhlIHJlbGEgZ3JvdXBzIGluIHRoZSAu
Zml4dXAgc2VjdGlvbiB2YXJ5IGluIHNpemUuICBUaGUgYmVnaW5uaW5nIG9mIGVhY2gKPiAgICAq
IC5maXh1cCByZWxhIGdyb3VwIGlzIHJlZmVyZW5jZWQgYnkgdGhlIC5leF90YWJsZSBzZWN0aW9u
LiBUbyBmaW5kIHRoZSBzaXplCj4gQEAgLTEwNzIsNiArMTA5MCwxOCBAQCBzdGF0aWMgc3RydWN0
IHNwZWNpYWxfc2VjdGlvbiBzcGVjaWFsX3NlY3Rpb25zW10gPSB7Cj4gICAJCS5uYW1lCQk9ICIu
YWx0aW5zdHJ1Y3Rpb25zIiwKPiAgIAkJLmdyb3VwX3NpemUJPSBhbHRpbnN0cnVjdGlvbnNfZ3Jv
dXBfc2l6ZSwKPiAgIAl9LAo+ICsJewo+ICsJCS5uYW1lCQk9ICIuYWx0aW5zdHJfcmVwbGFjZW1l
bnQiLAo+ICsJCS5ncm91cF9zaXplCT0gdW5kZWZpbmVkX2dyb3VwX3NpemUsCj4gKwl9LAo+ICsJ
ewo+ICsJCS5uYW1lCQk9ICIubGl2ZXBhdGNoLmhvb2tzLmxvYWQiLAo+ICsJCS5ncm91cF9zaXpl
CT0gbGl2ZXBhdGNoX2hvb2tzX2dyb3VwX3NpemUsCj4gKwl9LAo+ICsJewo+ICsJCS5uYW1lCQk9
ICIubGl2ZXBhdGNoLmhvb2tzLnVubG9hZCIsCj4gKwkJLmdyb3VwX3NpemUJPSBsaXZlcGF0Y2hf
aG9va3NfZ3JvdXBfc2l6ZSwKPiArCX0sCj4gICAJe30sCj4gICB9Owo+ICAgCj4gCgpVbmxlc3Mg
SSdtIG1pc3VuZGVyc3RhbmRpbmcgc29tZXRoaW5nLCBJIGNhbid0IHNlZSBob3cgCmtwYXRjaF9y
ZWdlbmVyYXRlX3NwZWNpYWxfc2VjdGlvbiB3b3VsZCB3b3JrIHdpdGggLmFsdGluc3RyX3JlcGxh
Y2VtZW50IApoYXZpbmcgYSBncm91cCBzaXplIG9mIDAuIEl0IGxvb2tzIHRvIG1lIGxpa2UgdGhl
IGZvciBsb29wIGluIHRoYXQgCmZ1bmN0aW9uIHdvdWxkIGJlY29tZSBhbiBpbmZpbml0ZSBsb29w
IChkdWUgdG8gaW5jcmVtZW50aW5nIGJ5IApncm91cF9zaXplKSBhbmQgc2hvdWxkX2tlZXBfcmVs
YV9ncm91cCB3b3VsZCBhbHdheXMgcmV0dXJuIGZhbHNlLgoKUmVnYXJkcywKLS0gClJvc3MgTGFn
ZXJ3YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
