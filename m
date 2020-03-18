Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6801F18A742
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 22:44:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEgRz-0002RB-Pn; Wed, 18 Mar 2020 21:42:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qhng=5D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jEgRx-0002R6-Rn
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 21:42:05 +0000
X-Inumbo-ID: 4edee216-6961-11ea-a6c1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4edee216-6961-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 21:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584567725;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dDc2v8ivb7tKxK+qVAU7QafulM0wL+873G8DJTfFPQY=;
 b=Sm+0HwmZMeX5CaguhEUKbzGvckfY/zgSAnLCSnxTLDPccHW6zb3YK4Wb
 FJBNGGsW4Wq5bKVV6O2cjKEAt+hNWHZeg8IZPbEC+girHqIGEtEebj3i9
 PHCfUb9VB3VQel6z4N0a4VAFejIX0igCO3Q8+cekpRVrX85HC17lwOs3b A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C9ZzBwMReJQ7EIoZSD5dg6AnsiLYeF4Jcdd174RS+mYBYYBm/3GdMertoWC+RHg/LDpwrZHB7g
 Lp4eGhnI9d2MNxl7fFflZuXbr8N3u46eQPoygwFwbxc+so/Xqu70Kzyz20gNl0volODgtNb34m
 OV9oq4Eq7B1J3hMNbf5JU0b96CvzqFyc8Qi915RbfRxaJQkE6epgrZuNIYztLM8Nu0rl0jQK7I
 6NzmDYUzg8xhAdwn/xYnwkUneoAW/wXstEyguqRGz7C0dhekNRnYm3+toj7szKriYkA3dmiOgr
 NzQ=
X-SBRS: 2.7
X-MesageID: 14238321
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,569,1574139600"; d="scan'208";a="14238321"
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20200318210540.5602-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <080ba22f-f79d-1e50-71ba-ef3d2653e920@citrix.com>
Date: Wed, 18 Mar 2020 21:42:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318210540.5602-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/x86: Move microcode into its own
 directory
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDMvMjAyMCAyMTowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTcGxpdCB0aGUgZXhp
c3RpbmcgYXNtL21pY3JvY29kZS5oIGluIGhhbGYsIGtlZXBpbmcgdGhlIHBlci1jcHUgY3B1X3Np
Zwo+IGF2YWlsYWJsZSB0byBleHRlcm5hbCB1c2VycywgYW5kIG1vdmluZyBldmVyeXRoaW5nIGVs
c2UgaW50byBwcml2YXRlLmgKPgo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHRyaW0gYW5kIGNs
ZWFuIHVwIHRoZSBpbmNsdWRlIGxpc3RzIGZvciBhbGwgMyBzb3VyY2UKPiBmaWxlcywgYWxsIG9m
IHdoaWNoIGluY2x1ZGUgcmF0aGVyIG1vcmUgdGhhbiBuZWNlc3NhcnkuCj4KPiBObyBmdW5jdGlv
bmFsIGNoYW5nZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4KPiBJbmNsdXNpb24gb2YgYXNtL2ZsdXNodGxiLmggaW4gaXNv
bGF0aW9uIHdhcyBicm9rZW4gYnkgYy9zIDgwOTQzYWE0MGUsIGFuZCB0aGUKPiBjb21taXQgbWVz
c2FnZSBldmVuIHN0YXRlcyB0aGlzIGJyZWFrYWdlLiAgSSdtIHN1cnByaXNlZCBpdCBnb3QgYWNj
ZXB0ZWQuCj4KPiBFaXRoZXIgdGhpcyBuZWVkcyBmaXhpbmcsIG9yIHRoZSAyMyghKSBvdGhlciBm
aWxlcyBpbmNsdWRpbmcgYXNtL2ZsdXNodGxiLmgKPiBzaG91bGQgYmUgYWRqdXN0ZWQuICBQZXJz
b25hbGx5IEkgZG9uJ3QgdGhpbmsgaXQgaXMgcmVhc29uYWJsZSB0byByZXF1aXJlCj4gaW5jbHVk
aW5nIHhlbi9tbS5oIGp1c3QgdG8gZ2V0IGF0IHRsYiBmbHVzaGluZyBmdW5jdGlvbmFsaXR5LCBi
dXQgSSBhbHNvIGNhbid0Cj4gc3BvdCBhbiBvYnZpb3VzIHdheSB0byB1bnRhbmdsZSB0aGUgZGVw
ZW5kZW5jaWVzIChoZW5jZSB0aGUgVE9ETykuCgpBY3R1YWxseSwgSSd2ZSBmb3VuZCB0aGF0IG1p
Y3JvY29kZV9mcmVlX3BhdGNoKCkgaGFzIG5vIGV4dGVybmFsIGNhbGxlcnMuCgpJJ3ZlIGZvbGRl
ZCB0aGUgZm9sbG93aW5nIGRlbHRhIGluLCB0byBhdm9pZCBtb3ZpbmcgYSB1c2VsZXNzIGZ1bmN0
aW9uCmRlY2xhcmF0aW9uCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21pY3JvY29kZS9jb3Jl
LmMgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlL2NvcmUuYwppbmRleCBlOTlmNGFiMDZjLi4xOWUx
ZDRiMjIxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbWljcm9jb2RlL2NvcmUuYworKysgYi94
ZW4vYXJjaC94ODYvbWljcm9jb2RlL2NvcmUuYwpAQCAtMjQzLDcgKzI0Myw3IEBAIHN0YXRpYyBz
dHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXJzZV9ibG9iKGNvbnN0IGNoYXIKKmJ1Ziwgc2l6ZV90
IGxlbikKwqDCoMKgwqAgcmV0dXJuIE5VTEw7CsKgfQrCoAotdm9pZCBtaWNyb2NvZGVfZnJlZV9w
YXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2NvZGVfcGF0Y2gpCitzdGF0aWMgdm9p
ZCBtaWNyb2NvZGVfZnJlZV9wYXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICptaWNyb2NvZGVf
cGF0Y2gpCsKgewrCoMKgwqDCoCBtaWNyb2NvZGVfb3BzLT5mcmVlX3BhdGNoKG1pY3JvY29kZV9w
YXRjaC0+bWMpOwrCoMKgwqDCoCB4ZnJlZShtaWNyb2NvZGVfcGF0Y2gpOwpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L21pY3JvY29kZS9wcml2YXRlLmgKYi94ZW4vYXJjaC94ODYvbWljcm9jb2Rl
L3ByaXZhdGUuaAppbmRleCA5N2M3NDA1ZGFkLi4yZTNiZTc5ZWFmIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvbWljcm9jb2RlL3ByaXZhdGUuaAorKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2Rl
L3ByaXZhdGUuaApAQCAtMzQsNiArMzQsNCBAQCBzdHJ1Y3QgbWljcm9jb2RlX29wcyB7CsKgCsKg
ZXh0ZXJuIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfb3BzICptaWNyb2NvZGVfb3BzOwrCoAotdm9p
ZCBtaWNyb2NvZGVfZnJlZV9wYXRjaChzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCk7Ci0K
wqAjZW5kaWYgLyogQVNNX1g4Nl9NSUNST0NPREVfUFJJVkFURV9IICovCgoKQWx0ZXJuYXRpdmVs
eSwgSSBtaWdodCBjb25zaWRlciBwdWxsaW5nIHRoaXMgYW5kIHRoZSBzaW1pbGFyIGNoYW5nZSB0
bwplYXJseV9taWNyb2NvZGVfdXBkYXRlX2NwdSgpIGludG8gYW4gZWFybGllciBwYXRjaCwgdG8g
c2VwYXJhdGUgdGhlCnN0YXRpYy1pbmcgb2YgZnVuY3Rpb25zIGZyb20gdGhlIGdlbmVyYWwgbW92
aW5nIG9mIGNvZGUvZGVjbGFyYXRpb25zLgoKVGhvdWdodHM/Cgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
