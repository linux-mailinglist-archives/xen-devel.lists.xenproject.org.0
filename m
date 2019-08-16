Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE49045A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 17:06:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hydka-0000xD-24; Fri, 16 Aug 2019 15:02:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CMUz=WM=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hydkZ-0000x8-0o
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 15:02:43 +0000
X-Inumbo-ID: e4b1588e-c036-11e9-8bb8-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4b1588e-c036-11e9-8bb8-12813bfff9fa;
 Fri, 16 Aug 2019 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565967761;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jb5ENzx5JtZnf2WOEUjovBk60JQ9VMihzqIUypwGLb0=;
 b=ekx0oJ+0BmbY+tf62iDd7HmanfiJ8RuD6Kr138HnMSBlj1LT8FbKmu4r
 A350IZsjizvNMnm8RoDb1PCYMv77QJ5aKDLnu9P1rQ8ZjHGbu3owV6G20
 LPl3hnZx0RepJTfp/eAGHFZVzsF/+GaipESryVg4fy9lhv6C5XdJlMHm+ o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O/8cqtLTy3c0PfvPRoB6Vl71xKiWLmo/UMvN9tJ56kGh19gUA8Fk4XlNHW/6pIpS1xkFltrFDV
 ExVJW75S9TqgpqT/RxJ7+oJeX6goWKOmiiYO4S6K2c6w/v43TLzQPtOnW8+hqZMGML0TfB7jj/
 b/YaIuYsVbn0Or+S6ky96XTEHyluplyyRuADdBiSeFaDWmfEF2qg7Fs86/MdAtqEnt1qdz3J4C
 9LaT7N6zQJRPfqsdGjklcRyI5LvhPvAbSsx0e+vyUBPNpQXcEo7KhBfhOkbR8FfLuvqEw92cHI
 gPc=
X-SBRS: 2.7
X-MesageID: 4372081
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,393,1559534400"; 
   d="scan'208";a="4372081"
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, <xen-devel@lists.xen.org>
References: <20190416122241.28342-3-wipawel@amazon.de>
 <20190808125132.10484-1-wipawel@amazon.de>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <9aa0bea9-8f39-f459-ee15-0bc961698507@citrix.com>
Date: Fri, 16 Aug 2019 16:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190808125132.10484-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part3 v2 3/3]
 create-diff-object: Strip all undefined entires of known size
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

T24gOC84LzE5IDE6NTEgUE0sIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+IFRoZSBwYXRj
aGVkIEVMRiBvYmplY3QgZmlsZSBjb250YWlucyBhbGwgc2VjdGlvbnMgYW5kIHN5bWJvbHMgYXMK
PiByZXN1bHRlZCBmcm9tIHRoZSBjb21waWxhdGlvbi4gSG93ZXZlciwgY2VydGFpbiBzeW1ib2xz
IG1heSBub3QgYmUKPiBjb3BpZWQgb3ZlciB0byB0aGUgcmVzdWx0aW5nIG9iamVjdCBmaWxlLCBk
dWUgdG8gYmVpbmcgdW5jaGFuZ2VkIG9yCj4gbm90IGluY2x1ZGVkIGZvciBvdGhlciByZWFzb25z
Lgo+IEluIHN1Y2ggc2l0dWF0aW9uIHRoZSByZXN1bHRpbmcgb2JqZWN0IGZpbGUgaGFzIHRoZSBl
bnRpcmUgc2VjdGlvbnMKPiBjb3BpZWQgYWxvbmcgKHdpdGggYWxsIHRoZWlyIGVudHJpZXMgdW5j
aGFuZ2VkKSwgd2hpbGUgc29tZSBvZiB0aGUKPiBjb3JyZXNwb25kaW5nIHN5bWJvbHMgYXJlIG5v
dCBjb3BpZWQgYWxvbmcgYXQgYWxsLgo+IFRoaXMgbGVhZHMgdG8gaGF2aW5nIGluY29ycmVjdCB1
bmRlZmluZWQgKFNUTl9VTkRFRikgZW50cmllcyBpbiB0aGUKPiBmaW5hbCBob3RwYXRjaCBFTEYg
ZmlsZS4KPiAKPiBUaGUgbmV3bHkgYWRkZWQgZnVuY3Rpb24gbGl2ZXBhdGNoX3N0cmlwX3VuZGVm
aW5lZF9lbGVtZW50cygpIGRldGVjdHMKPiBhbmQgcmVtb3ZlcyBhbGwgdW5kZWZpbmVkIFJFTEEg
ZW50cmllcyBhcyB3ZWxsIGFzIHRoZWlyIGNvcnJlc3BvbmRpbmcKPiBQUk9HQklUUyBzZWN0aW9u
IGVudHJpZXMuCj4gU2luY2UgdGhlIHNlY3Rpb25zIG1heSBjb250YWluIGVsZW1lbnRzIG9mIHVu
a25vd24gc2l6ZSAoc2guc2hfZW50c2l6ZQo+ID09IDApLCBwZXJmb3JtIHRoZSBzdHJpcCBvbmx5
IG9uIHNlY3Rpb25zIHdpdGggd2VsbCBkZWZpbmVkIGVudHJ5Cj4gc2l6ZXMuCj4gCj4gQWZ0ZXIg
cmVwbGFjaW5nIHRoZSBzdHJpcHBlZCByZWxhIGxpc3QsIGl0IGlzIGFzc3VtZWQgdGhhdCB0aGUg
bmV4dAo+IGludm9jYXRpb24gb2YgdGhlIGtwYXRjaF9yZWJ1aWxkX3JlbGFfc2VjdGlvbl9kYXRh
KCkgd2lsbCBhZGp1c3QgYWxsCj4gc2VjdGlvbiBoZWFkZXIgcGFyYW1ldGVycyBhY2NvcmRpbmcg
dG8gdGhlIGN1cnJlbnQgc3RhdGUuCgpUaGUgY29kZSBpbiB0aGlzIHBhdGNoIHNlZW1zIHRvIGJl
IHZlcnkgc2ltaWxhciAoaS5lLiBzb21ld2hhdCAKY29weS1hbmQtcGFzdGVkKSB0byBrcGF0Y2hf
cmVnZW5lcmF0ZV9zcGVjaWFsX3NlY3Rpb24oKSB3aGljaCBwcnVuZXMgdGhlIApyZWxhIGxpc3Qg
YW5kIHJlYnVpbGRzIHRoZSBjb3JyZXNwb25kaW5nIHRleHQgc2VjdGlvbiBhY2NvcmRpbmcgdG8g
dGhlIApwcmVkaWNhdGUgc2hvdWxkX2tlZXBfcmVsYV9ncm91cCgpLiBUaGUgaW50ZW50IG9mIHRo
ZSBmdW5jdGlvbiBhbHNvIApzZWVtcyB0byBiZSB0aGUgc2FtZSAob25seSBrZWVwIGVsZW1lbnRz
IHRoYXQgYXJlIG5lZWRlZCkuCgpJbiB3aGF0IHNpdHVhdGlvbnMgZG9lcyB0aGUgZXhpc3Rpbmcg
ZnVuY3Rpb24gbm90IGRvIHRoZSByaWdodCB0aGluZz8KCkNhbiBzaG91bGRfa2VlcF9yZWxhX2dy
b3VwKCkgYmUgdXBkYXRlZCBpbnN0ZWFkPwoKVGhhbmtzLAotLSAKUm9zcyBMYWdlcndhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
