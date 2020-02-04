Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026DA151C0B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 15:20:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyz12-0002Bp-8e; Tue, 04 Feb 2020 14:17:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=30aJ=3Y=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iyz10-0002Bk-E7
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 14:17:22 +0000
X-Inumbo-ID: 0ea6c10c-4759-11ea-8f58-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ea6c10c-4759-11ea-8f58-12813bfff9fa;
 Tue, 04 Feb 2020 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580825842;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1fCx5k6rmIchMb25AntDK06gqAr+P56WaOOiB1S5nW0=;
 b=V/6tqOXWTPMYUAzaCVjuHst5iiPmIPECDAPV+V953kE4PMVLVovoRWWg
 kb5Iv15gD9tnJj2NL7AELEF2nh2uv3s7w157T+PXbC0jXO8PlumlPgW/m
 z3K58Eqpo2wQfH8SY7LMTLm+6K1AXyJmWq6pz5g4vslc6sPfoCR/K6aH3 w=;
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
IronPort-SDR: 8cMZD7ogrQRfZi1HsLX8xqJdPKOck90WTc6XJJD5H61FaBxcsngmR29RTzo2OuSsl+glDtaBR+
 X4R0kthfBzyb4xPyXe3EtRs4lzwEfJrcLIa/rKFYZ6Zu/8GPseozNi3zlnh3/rCj0f0a2siSO9
 EejdiZJFSLv2xgnc42sLs4RkBcepkO2a8qms7wQr49WA0M+7TU4QFKlQXq76o10UUoyFdy+G3t
 W2rphUCOVpUquMzSiRCfdYFdAtcs/zTomgPjBuc2ohzejW8cPRvtSwVBPZxbCcPGugHftKAudt
 3sw=
X-SBRS: 2.7
X-MesageID: 11923456
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="11923456"
To: Hongyan Xia <hongyxia@amazon.com>, <xen-devel@lists.xenproject.org>
References: <45c03833059b0ce3f52c02693a2eb649356adf3e.1580755007.git.hongyxia@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <874e3640-35ea-bd54-7961-8d94f09bad8a@citrix.com>
Date: Tue, 4 Feb 2020 14:17:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <45c03833059b0ce3f52c02693a2eb649356adf3e.1580755007.git.hongyxia@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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
Cc: jgrall@amazon.com, Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMDIvMjAyMCAxODozNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gUmV3cml0ZSB0aGUgbWFw
Y2FjaGUgdG8gYmUgcHVyZWx5IHBlci12Q1BVIGluc3RlYWQgb2YgcGFydGx5IHBlci12Q1BVCj4g
YW5kIHBhcnRseSBwZXItZG9tYWluLgo+Cj4gVGhpcyBwYXRjaCBpcyBuZWVkZWQgdG8gYWRkcmVz
cyBwZXJmb3JtYW5jZSBpc3N1ZXMgd2hlbiB3ZSBzdGFydCByZWx5aW5nCj4gb24gdGhlIG1hcGNh
Y2hlLCBlLmcuLCB3aGVuIHdlIGRvIG5vdCBoYXZlIGEgZGlyZWN0IG1hcC4gQ3VycmVudGx5LCB0
aGUKPiBwZXItZG9tYWluIGxvY2sgb24gdGhlIG1hcGNhY2hlIGlzIGEgYm90dGxlbmVjayBmb3Ig
bXVsdGljb3JlLCBjYXVzaW5nCj4gcGVyZm9ybWFuY2UgZGVncmFkYXRpb24gYW5kIGV2ZW4gZnVu
Y3Rpb25hbCByZWdyZXNzaW9ucy4KCkRvIHlvdSBtZWFuIHRoYXQgdGhpcyBwYXRjaCBjYXVzZXMg
YSByZWdyZXNzaW9uLCBvciB0aGF0IHJlbW92aW5nIHRoZQpkaXJlY3RtYXAgY2F1c2VzIGEgcmVn
cmVzc2lvbj8KClRoZSByZXN0IG9mIHRoZSBjb21taXQgbWVzc2FnZSBpcyB2ZXJ5IGNvbmZ1c2lu
ZyB0byBmb2xsb3cuCgo+ICBUaGlzIHBhdGNoCj4gbWFrZXMgdGhlIG1hcHBpbmcgc3RydWN0dXJl
IHBlci12Q1BVIGFuZCBjb21wbGV0ZWx5IGxvY2tsZXNzLgo+Cj4gRnVuY3Rpb25hbCByZWdyZXNz
aW9uOgo+Cj4gV2hlbiBhIGRvbWFpbiBpcyBydW4gb24gbW9yZSB0aGFuIDY0IGNvcmVzLCBGcmVl
QlNEIDEwIHBhbmlja3MgZnJlcXVlbnRseQo+IGR1ZSB0byBvY2Nhc2lvbmFsIHNpbXVsdGFuZW91
cyBzZXRfc2luZ2xlc2hvdF90aW1lciBoeXBlcmNhbGxzIGZyb20gdG9vCj4gbWFueSBjb3Jlcy4g
U29tZSBjb3JlcyB3aWxsIGJlIGJsb2NrZWQgd2FpdGluZyBvbiBtYXBfZG9tYWluX3BhZ2UsCj4g
ZXZlbnR1YWxseSBmYWlsaW5nIHRvIHNldCBhIHRpbWVyIGluIHRoZSBmdXR1cmUuIEZyZWVCU0Qg
Y2Fubm90IGhhbmRsZQo+IHRoaXMgYW5kIHBhbmlja3MuIFRoaXMgd2FzIGZpeGVkIGluIGxhdGVy
IEZyZWVCU0QgcmVsZWFzZXMgYnkgaGFuZGxpbmcKPiAtRVRJTUUsIGJ1dCBzdGlsbCB0aGUgZGVn
cmFkYXRpb24gaW4gdGltZXIgcGVyZm9ybWFuY2UgaXMgYSBiaWcgaXNzdWUuCj4KPiBQZXJmb3Jt
YW5jZSByZWdyZXNzaW9uOgo+Cj4gTWFueSBiZW5jaG1hcmtzIHNlZSBhIHBlcmZvcm1hbmNlIGRy
b3Agd2hlbiBoYXZpbmcgYSBsYXJnZSBjb3JlIGNvdW50Lgo+IEkgaGF2ZSBkb25lIGEgR2Vla2Jl
bmNoIG9uIGEgMzItdkNQVSBndWVzdC4KPgo+IHBlcmYgZHJvcCAgICAgb2xkICAgICAgICBuZXcK
PiBzaW5nbGUgICAgICAgMC4wNCUgICAgICAwLjE4JQo+IG11bHRpICAgICAgICAyLjQzJSAgICAg
IDAuMDglCj4KPiBSZW1vdmluZyB0aGUgcGVyLWRvbWFpbiBsb2NrIGluIHRoZSBtYXBjYWNoZSBi
cmluZ3MgdGhlIG11bHRpLWNvcmUKPiBwZXJmb3JtYW5jZSBhbG1vc3QgaWRlbnRpY2FsIHRvIHVz
aW5nIHRoZSBkaXJlY3QgbWFwIGZvciBtYXBwaW5ncy4KPgo+IFRoZXJlIHNob3VsZCBiZSByb29t
IGZvciBmdXRoZXIgb3B0aW1pc2F0aW9ucywgYnV0IHRoaXMgYWxyZWFkeQo+IGltcHJvdmVzIG92
ZXIgdGhlIG9sZCBtYXBjYWNoZSBieSBhIGxvdC4KPgo+IE5vdGUgdGhhdCBlbnRyaWVzIGluIHRo
ZSBtYXBoYXNoIHdpbGwgb2NjdXB5IGludXNlIHNsb3RzLiBXaXRoIDE2IHNsb3RzCj4gcGVyIHZD
UFUgYW5kIGEgbWFwaGFzaCBjYXBhY2l0eSBvZiA4LCB3ZSBvbmx5IGhhdmUgYW5vdGhlciA4IGF2
YWlsYWJsZSwKPiB3aGljaCBpcyBub3QgZW5vdWdoIGZvciBuZXN0ZWQgcGFnZSB0YWJsZSB3YWxr
cy4gV2UgbmVlZCB0byBpbmNyZWFzZSB0aGUKPiBudW1iZXIgb2Ygc2xvdHMgaW4gY29uZmlnLmgu
CgpJJ20gYWZyYWlkIHRoYXQgSSBkb24ndCBmb2xsb3cgd2hhdCB5b3UncmUgdHJ5aW5nIHRvIHNh
eSBoZXJlLsKgIFRoZQpudW1iZXIgb2Ygc2xvdHMgc2hvdWxkIGVpdGhlciBiZSBmaW5lLCBvciB3
ZSd2ZSBnb3QgYSBwcmUtZXhpdGluZyBidWcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
