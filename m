Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CD61740DA
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 21:20:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7m4D-0002xU-Ma; Fri, 28 Feb 2020 20:17:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sa46=4Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j7m4B-0002xP-Fg
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 20:16:59 +0000
X-Inumbo-ID: 452392af-5a67-11ea-9a2f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 452392af-5a67-11ea-9a2f-12813bfff9fa;
 Fri, 28 Feb 2020 20:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582921018;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xqXiu/P1F0dB5LYLTxHn3YzsFcGvIo6etEBFLpH8ApY=;
 b=WdvuDZhZ0xT71QXNRn6+/l5CxsZy/8mhIO1uD6Oacc4jU9f8iw7rhsDh
 C6QRTlFoOtZ8TGZ1NlsR0nCiUGZ0GqJsnPxBmNHEnfhSKthqsvOeJyexp
 TK3O8Ce44CMezFMqtzWntAeqKywlj+0jyFXgBg4yntOQJ/UImcGEzqcos 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WQKEdOw8VIdX+2WpEPlJo06IywGrq2XZO/aBuJaYGyMF72ajjlD3j8J3XcgTSg0PHF4ixda8o5
 07dXVQCEhubG70Dmc2c+7P+g2DoE0s+EdSkXxR0QVyS1QYcprHvA0Rry/xKzWdEoFCxrcPxAlM
 7zFaBCuTJIodwS3CCe4PYrskPAT6p5ROiRNTrVkEX/2/POKnyY9vfY38mANGpvc6NZ5zmWzJLa
 Us0C4Fm5UbrF/ctRt5i6zDt/zE7LbA69oJo/KwpKqaXo2ASB6OmCYxrRfiE/peyY7oH9NGbi3N
 DR8=
X-SBRS: 2.7
X-MesageID: 13624729
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,497,1574139600"; d="scan'208";a="13624729"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <e53b3573-9c9a-734c-df67-6f6da7fd8ef4@suse.com>
 <00a4c7ca-36a4-c108-719c-01a6e16df9b2@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d851c095-84a1-9edb-5905-64860fb1b7a7@citrix.com>
Date: Fri, 28 Feb 2020 20:16:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <00a4c7ca-36a4-c108-719c-01a6e16df9b2@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/5] IOMMU: iommu_intremap is x86-only
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDIvMjAyMCAxMjoyNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gUHJvdmlkZSBhICNkZWZp
bmUgZm9yIG90aGVyIGNhc2VzOyBpdCBkaWRuJ3Qgc2VlbSB3b3J0aHdoaWxlIHRvIG1lIHRvCj4g
aW50cm9kdWNlIGFuIElPTU1VX0lOVFJFTUFQIEtjb25maWcgb3B0aW9uIGF0IHRoaXMgcG9pbnQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4KPiAt
LS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiArKysgYi9kb2NzL21pc2Mv
eGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiBAQCAtMTI5OSw2ICsxMjk5LDggQEAgYm9vbGVhbiAo
ZS5nLiBgaW9tbXU9bm9gKSBjYW4gb3ZlcnJpZGUgdAo+ICAgICAgZ2VuZXJhdGlvbiBvZiBJT01N
VXMgb25seSBzdXBwb3J0ZWQgRE1BIHJlbWFwcGluZywgYW5kIEludGVycnVwdCBSZW1hcHBpbmcK
PiAgICAgIGFwcGVhcmVkIGluIHRoZSBzZWNvbmQgZ2VuZXJhdGlvbi4KPiAgCj4gKyAgICBUaGlz
IG9wdGlvbiBpcyBub3QgdmFsaWQgb24gQXJtLgoKVGhlIGxvbmdldml0eSBvZiB0aGlzIGNvbW1l
bnQgd291bGQgYmUgZ3JlYXRlciBpZiBpdCB3ZXJlIHBocmFzZWQgYXMgImlzCm9ubHkgdmFsaWQg
b24geDg2IiwgZXNwZWNpYWxseSBnaXZlbiB0aGUgUkZDIFJJU0NWIHNlcmllcyBvbiBsaXN0LgoK
PiArCj4gICogICBUaGUgYGludHBvc3RgIGJvb2xlYW4gY29udHJvbHMgdGhlIFBvc3RlZCBJbnRl
cnJ1cHQgc3ViLWZlYXR1cmUuICBJbgo+ICAgICAgY29tYmluYXRpb24gd2l0aCBBUElDIGFjY2Vs
ZXJhdGlvbiAoVlQteCBBUElDViwgU1ZNIEFWSUMpLCB0aGUgSU9NTVUgY2FuCj4gICAgICBiZSBj
b25maWd1cmVkIHRvIGRlbGl2ZXIgaW50ZXJydXB0cyBmcm9tIGFzc2lnbmVkIFBDSSBkZXZpY2Vz
IGRpcmVjdGx5Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiBAQCAtMzUsNyArMzUsNiBAQCBib29s
IF9fcmVhZF9tb3N0bHkgaW9tbXVfcXVhcmFudGluZSA9IHRyCj4gIGJvb2xfdCBfX3JlYWRfbW9z
dGx5IGlvbW11X2lnZnggPSAxOwo+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21tdV9zbm9vcCA9
IDE7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3FpbnZhbCA9IDE7Cj4gLWVudW0gaW9t
bXVfaW50cmVtYXAgX19yZWFkX21vc3RseSBpb21tdV9pbnRyZW1hcCA9IGlvbW11X2ludHJlbWFw
X2Z1bGw7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2NyYXNoX2Rpc2FibGU7Cj4gIAo+
ICBzdGF0aWMgYm9vbCBfX2h3ZG9tX2luaXRkYXRhIGlvbW11X2h3ZG9tX25vbmU7Cj4gQEAgLTkw
LDggKzg5LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2lvbW11X3BhcmFtKGNvbnMKPiAg
ICAgICAgICAgICAgaW9tbXVfc25vb3AgPSB2YWw7Cj4gICAgICAgICAgZWxzZSBpZiAoICh2YWwg
PSBwYXJzZV9ib29sZWFuKCJxaW52YWwiLCBzLCBzcykpID49IDAgKQo+ICAgICAgICAgICAgICBp
b21tdV9xaW52YWwgPSB2YWw7Cj4gKyNpZm5kZWYgaW9tbXVfaW50cmVtYXAKPiAgICAgICAgICBl
bHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImludHJlbWFwIiwgcywgc3MpKSA+PSAwICkK
PiAgICAgICAgICAgICAgaW9tbXVfaW50cmVtYXAgPSB2YWwgPyBpb21tdV9pbnRyZW1hcF9mdWxs
IDogaW9tbXVfaW50cmVtYXBfb2ZmOwo+ICsjZW5kaWYKClRoZSB1c2Ugb2YgaWZuZGVmIGluIHBh
cnRpY3VsYXIgbWFrZXMgdGhlIHJlc3VsdCB2ZXJ5IHdlaXJkIHRvIHJlYWQuwqAKVGhlcmUgYXBw
ZWFyIHRvIGJlIG5vIHVzZXMgb2YgaW9tbXVfaW50cmVtYXAgb3V0c2lkZSBvZiB4ODYgY29kZSwg
b3RoZXIKdGhhbiBpbiB0aGlzIHNldHVwLCBzbyBoYXZpbmcgaXQgZmFsc2UgaW4gdGhlICFDT05G
SUdfWDg2IGNhc2UgaXNuJ3QKaGVscGZ1bC4KCkhvdyBhYm91dCBqdXN0IGd1YXJkaW5nIHVzZXMg
b2YgdGhlIHZhcmlhYmxlIHdpdGggSVNfRU5BQkxFRChDT05GSUdfWDg2KQphbmQgYSBjb21tb24g
ZXh0ZXJuP8KgIFdlIHVzZSB0aGlzIERDRSB0cmljayBhbHJlYWR5IHRvIHJlZHVjZSB0aGUKaWZk
ZWZhcnkgaW4gdGhlIGNvZGUuCgpUaGUgcmVzdWx0IHdvdWxkIGNlcnRhaW5seSBiZSBlYXNpZXIg
dG8gZm9sbG93Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
