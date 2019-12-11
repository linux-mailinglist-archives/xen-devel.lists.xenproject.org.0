Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E6111BD24
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 20:39:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if7mQ-0007GB-M5; Wed, 11 Dec 2019 19:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=48P7=2B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1if7mP-0007G6-0a
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 19:36:13 +0000
X-Inumbo-ID: 7c1dd892-1c4d-11ea-8bfa-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c1dd892-1c4d-11ea-8bfa-12813bfff9fa;
 Wed, 11 Dec 2019 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576092971;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Vvq2Pixum8K6zcOqrx9unbqJFJY1xITDNj/TWPm6LxI=;
 b=XbO27vqd3qMyO01tErn3u32S0u1Cg3DUgdiDxcLr3xFvbvnUU6ERcF6w
 iQFU/st5zPhaL5uD6nUUXmibrd/GMIVymOn9rkIyNh3wmhYaFnW8/JAxj
 PWB5yo/HOM/4+iO/9Hwj9UR17msgccs95+RkwrY59s8ZTFdy7hNKtyR3/ 8=;
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
IronPort-SDR: 00DAONNN2VYMB+H5biAAzd4WxuIf32U/HoRcnBX6WWd33AEPIDpXeL1jKtJgycPLchmRXF1JYo
 RENZqpfiySkkupEU9YrYIGb8c8ULSuCBRm3BYO1UIdppcRcA70joGug91MvVTek7gDqR8K+hEH
 yfutZoudgY4cmg3mK+XpcCRlHw/uROuerNLvIDGAs3MuVJYB67R1wRF/MGFfbhUfMrACC52I71
 waxIZ5JG3Q0VejbpOIWmnjjELK61jvv2GNV45e+EE5rDasC5lBCylKarBKsv6AKm6o9gk0aHo1
 +As=
X-SBRS: 2.7
X-MesageID: 9957446
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,303,1571716800"; 
   d="scan'208";a="9957446"
To: Jan Beulich <jbeulich@suse.com>
References: <20191209180638.47305-1-roger.pau@citrix.com>
 <db19e41f-9ecf-b999-23ce-075daf6dff22@citrix.com>
 <2214d2ca-271b-da04-14a1-7014c8faf6ed@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <25310dca-1f21-942d-1f88-0d712658de6f@citrix.com>
Date: Wed, 11 Dec 2019 19:36:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2214d2ca-271b-da04-14a1-7014c8faf6ed@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86: store cr4 during suspend/resume
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMTIvMjAxOSAxMDowNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTAuMTIuMjAxOSAx
MDo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDkvMTIvMjAxOSAxODowNiwgUm9nZXIg
UGF1IE1vbm5lIHdyb3RlOgo+Pj4gQ3VycmVudGx5IGNyNCBpcyBub3QgY2FjaGVkIGJlZm9yZSBz
dXNwZW5zaW9uLCBhbmQgbW11X2NyNF9mZWF0dXJlcyBpcwo+Pj4gdXNlZCBpbiBvcmRlciB0byBy
ZXN0b3JlIHRoZSBleHBlY3RlZCBjcjQgdmFsdWUuIFRoaXMgaXMgY29ycmVjdCBzbwo+Pj4gZmFy
IGJlY2F1c2UgdGhlIHRhc2tsZXQgdGhhdCBleGVjdXRlcyB0aGUgc3VzcGVuZC9yZXN1bWUgY29k
ZSBpcwo+Pj4gcnVubmluZyBpbiB0aGUgaWRsZSB2Q1BVIGNvbnRleHQuCj4+Pgo+Pj4gSW4gb3Jk
ZXIgdG8gbWFrZSB0aGUgY29kZSBsZXNzIGZyYWdpbGUsIGV4cGxpY2l0bHkgc2F2ZSB0aGUgY3Vy
cmVudAo+Pj4gY3I0IHZhbHVlIGJlZm9yZSBzdXNwZW5zaW9uLCBzbyB0aGF0IGl0IGNhbiBiZSBy
ZXN0b3JlZCBhZnRlcndhcmRzLgo+Pj4gVGhpcyBlbnN1cmVzIHRoYXQgdGhlIGNyNCB2YWx1ZSBj
YWNoZWQgaW4gdGhlIGNwdV9pbmZvIGRvZXNuJ3QgZ2V0IG91dAo+Pj4gb2Ygc3luYyBhZnRlciBy
ZXN1bWUgZnJvbSBzdXNwZW5zaW9uLgo+Pj4KPj4+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IFdoeT/CoCBUaGVyZSBpcyBub3RoaW5nIGZyYWdpbGUg
aGVyZS7CoCBTdXNwZW5kL3Jlc3VtZSBpcyBhbHdheXMgaW4gaWRsZQo+PiBjb250ZXh0IGFuZCBs
b2FkcyBvZiBvdGhlciBsb2dpYyBhbHJlYWR5IGRlcGVuZHMgb24gdGhpcy4KPj4KPj4gSSd2ZSBi
ZWVuIHNsb3dseSBzdHJpcHBpbmcgb3V0IHJlZHVuZGFudCBzYXZlZCBzdGF0ZSBsaWtlIHRoaXMu
Cj4gV2hlcmUgaXQncyBjbGVhcmx5IHJlZHVuZGFudCwgdGhpcyBpcyBmaW5lLiBCdXQgSSBkb24n
dCB0aGluayBpdCdzCj4gc3VmZmljaWVudGx5IGNsZWFyIGhlcmUKClRoZXJlIGlzIGEgcmVhc29u
IEkgbWFkZSBpdCBleHBsaWNpdGx5IGNyeXN0YWwgY2xlYXIgd2l0aCBjL3MgODdlN2I0ZDViCgo+
ICwgYW5kIGdvaW5nIGJhY2sgdG8gd2hhdCB3YXMgdGhlcmUgYmVmb3JlCj4gaXMgaW1vIGdlbmVy
YWxseSBsZXNzIGVycm9yIHByb25lIHRoYW4gZ29pbmcgdG8gc29tZSBmaXhlZCBzdGF0ZS4KCkl0
IGlzIGRlbW9uc3RyYWJseSBtb3JlIGVycm9yIHByb25lLCB3aGljaCBpcyB3aHkgSSdtIHNsb3ds
eSBraWxsaW5nIGl0LgoKU3Rhc2hpbmcgc3RhdGUgd2FzdGVzIHVubmVjZXNzYXJ5IHNwYWNlLCBh
bmQgYWRkcyBhbiBlcnJvciBjYXNlIHdoZXJlCnN0YXRlIGlzIGVpdGhlciBzdGFzaGVkIGluY29y
cmVjdGx5LCBvciBnZXRzIG1vZGlmaWVkIGJlZm9yZSByZXN0b3JlLAphbmQgd2UnbGwgYmxpbmRs
eSB1c2UuCgpUd28gZXhhbXBsZXMgb2YgcmVhbCBidWdzIGNhdXNlZCBieSB0aGlzIGFyZSBjL3Mg
MGMzMDE3MWNiIGFuZCA0ZWUwYWQ3MmQKCkFic29sdXRlbHkgbm90aGluZyByZW1haW5pbmcgaW4g
c3VzcGVuZC5jIHNob3VsZCBiZSBzcGlsbGVkLsKgIEl0IGNhbiBhbGwKYmUgKHJlKWNhbHVjbGF0
ZWQgZnJvbSB0aGUgc2FtZSBpbmZvcm1hdGlvbiBzb3VyY2UgYXMgdGhlIEFQIGJvb3QgcGF0aCwK
YW5kIHRoZSByZXN1bHQgd2lsbCBiZSBzdHJpY3RseSBzbWFsbGVyIGluIFJBTSwgYW5kIG1vcmUg
cm9idXN0LgoKPiBGdXJ0aGVybW9yZSBJIHdhcyBob3Bpbmcgd2UgY291bGQgZXZlbnR1YWxseSBk
byBhd2F5IHdpdGgKPiBtbXVfY3I0X2ZlYXR1cmVzLgoKSG93IGRvIHlvdSBwbGFuIG9uIGRvaW5n
IHRoaXM/Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
