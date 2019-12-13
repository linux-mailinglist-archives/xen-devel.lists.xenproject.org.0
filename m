Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D511E43C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 14:03:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifkZa-0003ND-Bj; Fri, 13 Dec 2019 13:01:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifkZZ-0003N8-8a
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 13:01:33 +0000
X-Inumbo-ID: aa70231a-1da8-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa70231a-1da8-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576242084;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=eTdt1jrZxxLpgPGodyUqpD0JbJ4+7CPVNMoEqQ0Bd0g=;
 b=MBvfF+W3zmn6bAtBcgRE9aVOR8UuM2m90ZkhRVu55NtHePbcpWzi7s2U
 qlYuB9VXwu7Mdm7H0YJQ+U9RijwD9cwsPNUfLy/rQ6Z8gO08U4F65wQdd
 Rp2HGybkU2dfNQtdn0V4caSqMEMFff43Fpz5E685Wl2M3kGRYHZPqdZfg 0=;
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
IronPort-SDR: vrcVclzIORu1Anibz4qY9g03D2xzthD9yyYevoB1Ajp1K/f2dTKsVWbzqYuFABy4ydqhc7wf1r
 joEH5vczRshNapoidM26Rr+zxVKUISxjtEA4ZE4cN8HdB9s+3H0RpNht6X9TAE4MIw9m88C+U9
 DWJu/K+eerR3137W/dGdhBF8kxvYcPybFeM08ATQ/R1TiKOYx/D0rrqJaJVRtl/cok+AQRNt8m
 SZrVx6qxtg/zguU9rNC8i8rPXKuy+6eeptO84hqVYWz8qDrUxW7saEMhD6iegxX2demGRhZRSc
 tek=
X-SBRS: 2.7
X-MesageID: 9646759
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9646759"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <a1b23ffd-6af4-a3c1-b4ac-ba7bd3ec1d70@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ce9102e8-3e12-2479-4f15-292aa99f34a1@citrix.com>
Date: Fri, 13 Dec 2019 13:01:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a1b23ffd-6af4-a3c1-b4ac-ba7bd3ec1d70@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86emul: correct far branch handling for
 64-bit mode
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTIvMjAxOSAxMjo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQU1EIGFuZCBmcmllbmRz
IGV4cGxpY2l0bHkgc3BlY2lmeSB0aGF0IDY0LWJpdCBvcGVyYW5kcyBhcmVuJ3QgcG9zc2libGUK
PiBmb3IgdGhlc2UgaW5zbnMuIE5ldmVydGhlbGVzcyBSRVguVyBpc24ndCBmdWxseSBpZ25vcmVk
OiBJdCBzdGlsbAo+IGNhbmNlbHMgYSBwb3NzaWJsZSBvcGVyYW5kIHNpemUgb3ZlcnJpZGUgKDB4
NjYpLiBJbnRlbCBvdG9oIGV4cGxpY2l0bHkKPiBwcm92aWRlcyBmb3IgNjQtYml0IG9wZXJhbmRz
IG9uIHRoZSByZXNwZWN0aXZlIGluc24gcGFnZSBvZiB0aGUgU0RNLgo+Cj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cgo+Cj4gLS0tIGEveGVuL2FyY2gveDg2
L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKPiArKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxh
dGUveDg2X2VtdWxhdGUuYwo+IEBAIC0yNTE5LDkgKzI1MTksMTYgQEAgeDg2X2RlY29kZV9vbmVi
eXRlKAo+ICAgICAgICAgIGNhc2UgNjogLyogcHVzaCAqLwo+ICAgICAgICAgICAgICBpZiAoIG1v
ZGVfNjRiaXQoKSAmJiBvcF9ieXRlcyA9PSA0ICkKPiAgICAgICAgICAgICAgICAgIG9wX2J5dGVz
ID0gODsKPiAtICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4gKyAgICAgICAgICAgIHN0
YXRlLT5kZXNjID0gRHN0Tm9uZSB8IFNyY01lbSB8IE1vdjsKPiArICAgICAgICAgICAgYnJlYWs7
Cj4gKwo+ICAgICAgICAgIGNhc2UgMzogLyogY2FsbCAoZmFyLCBhYnNvbHV0ZSBpbmRpcmVjdCkg
Ki8KPiAgICAgICAgICBjYXNlIDU6IC8qIGptcCAoZmFyLCBhYnNvbHV0ZSBpbmRpcmVjdCkgKi8K
PiArICAgICAgICAgICAgLyogUkVYLlcgaWdub3JlZCBvbiBhIHZlbmRvci1kZXBlbmRlbnQgYmFz
aXMuICovCj4gKyAgICAgICAgICAgIGlmICggb3BfYnl0ZXMgPT0gOCAmJgo+ICsgICAgICAgICAg
ICAgICAgIChjdHh0LT5jcHVpZC0+eDg2X3ZlbmRvciAmCj4gKyAgICAgICAgICAgICAgICAgIChY
ODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pKSApCgpJJ20gd29uZGVyaW5nIHdoZXRo
ZXIgaW4gZ2VuZXJhbCB3ZSB3YW50IHNvbWUgYW1kX2xpa2UoKSBhbmQKaW50ZWxfbGlrZSgpIHBy
ZWRpY2F0ZXMuwqAgSXQgaXMgaG93IGFsbW9zdCBhbGwgb2YgdGhlIGJvdW5kYXJpZXMgZW5kIHVw
CmZhbGxpbmcuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
