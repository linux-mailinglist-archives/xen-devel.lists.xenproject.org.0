Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 079DF181C62
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 16:35:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3LJ-0000LB-10; Wed, 11 Mar 2020 15:32:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lh2M=44=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jC3LH-0000L6-AL
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 15:32:19 +0000
X-Inumbo-ID: 7d76303e-63ad-11ea-afeb-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d76303e-63ad-11ea-afeb-12813bfff9fa;
 Wed, 11 Mar 2020 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583940737;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6v7e5BsB7vrVhjxPMjIB/IuLsqlQQyDHWryWXinp3XA=;
 b=PYSJxy3mCGHJ3wIKz791fodg+9hsWFC2z9P/I5TUp4dS2ZLq+5GGJE7v
 z604ZIxVVQ2jNgbg9I4lxP4sUjKQLeAYcx4wqh6gnSYwFiTTmPWnWOTE1
 7F5B8CluRMkdbAuV64/FL0bvlG72uyMH4MUTJQKgYLtaeGdwyonWU0nHr g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a3iSR56uEDmI02QFtkXALgMfFNtPDql0WAWXjvgrrbNHgWAYZMMTk5FNdFiWLAmgVU+bfleGmS
 RnLX+hpA9qB1WehqDIF0JF/DNbFs+AHeiLslXWb+DJ74L9xVDpokwfp99EuO22k6vQHHCrPbmv
 6vRLNT3h7JcJPgDFLmS8ifKolpVUrqTgMJMQQiMWKqmBO6XexZhRGPbfMOTGSG9UVpUjR6ATHq
 mYIneC1DU2xoUgW+wL31GPuHs7nRZ0mjdk9FjTdak6wQC6FTNfzt1pvQ/ibCz1kyCd8lIFm6MB
 6BE=
X-SBRS: 2.7
X-MesageID: 14407860
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14407860"
To: Jan Beulich <jbeulich@suse.com>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
 <97e02ced-a5e4-a0d7-0435-124fff9f5dca@suse.com>
 <b296a252-a79c-8e61-c919-9ee4edef06be@citrix.com>
 <d9a4c0fe-8a0b-d19d-edd5-227f69e669eb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <6922d7d3-80ed-30d7-ac16-241cb3a78254@citrix.com>
Date: Wed, 11 Mar 2020 15:32:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d9a4c0fe-8a0b-d19d-edd5-227f69e669eb@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 1/9] x86/HVM: reduce domain.h include
 dependencies
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Tamas K
 Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDMvMjAyMCAxNToyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMDMuMjAyMCAx
NDowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTAvMDMvMjAyMCAxNTo0OCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBEcm9wICNpbmNsdWRlLXMgbm90IG5lZWRlZCBieSB0aGUgaGVhZGVy
IGl0c2VsZi4gUHV0IHRoZSBvbmVzIG5lZWRlZAo+Pj4gaW50byB3aGljaGV2ZXIgb3RoZXIgZmls
ZXMgYWN0dWFsbHkgbmVlZCB0aGVtLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IC0tLQo+Pj4gdjI6IEFsc28gbWFrZSB0aGluZ3MgYnVp
bGQgd2l0aCBYU009eS4KPj4gTG9va2luZyBiZXR0ZXIsIGJ1dCBzdGlsbCBnb3QgcHJvYmxlbXMu
Cj4+Cj4+IHhlbl9wdl9jb25zb2xlLmM6IEluIGZ1bmN0aW9uIOKAmHB2X2NvbnNvbGVfaW5pdOKA
mToKPj4geGVuX3B2X2NvbnNvbGUuYzo1MTozNzogZXJyb3I6IOKAmEhWTV9QQVJBTV9DT05TT0xF
X1BGTuKAmSB1bmRlY2xhcmVkIChmaXJzdAo+PiB1c2UgaW4gdGhpcyBmdW5jdGlvbikKPj4gwqDC
oMKgwqAgciA9IHhlbl9oeXBlcmNhbGxfaHZtX2dldF9wYXJhbShIVk1fUEFSQU1fQ09OU09MRV9Q
Rk4sICZyYXdfcGZuKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+
Pgo+PiBhbmQKPj4KPj4gc2hpbS5jOiBJbiBmdW5jdGlvbiDigJhwdl9zaGltX2ZpeHVwX2U4MjDi
gJk6Cj4+IHNoaW0uYzoxNDg6MjA6IGVycm9yOiDigJhIVk1fUEFSQU1fU1RPUkVfUEZO4oCZIHVu
ZGVjbGFyZWQgKGZpcnN0IHVzZSBpbgo+PiB0aGlzIGZ1bmN0aW9uKQo+PiDCoMKgwqDCoCBNQVJL
X1BBUkFNX1JBTShIVk1fUEFSQU1fU1RPUkVfUEZOKTsKPiBPaCwgc28gdGhhdCdzIGFuIFhTTStz
aGltIGNvbmZpZyBhaXVpOyBBbW9uZyB0aGUgc2V0cyBvZiB3aGF0Cj4gSSByZWd1bGFybHkgdGVz
dCBJIGhhdmUgb25seSBhbiBYU00gb25lIGFuZCBhIHNoaW0gb25lLiBUaGUgZnVucwo+IG9mIGFs
bG93aW5nIHRvbyB3aWRlIGEgdmFyaWV0eSBvZiBkaWZmZXJlbnQgY29uZmlncyAuLi4gSW4gY2Fz
ZXMKPiBsaWtlIHRoaXMgc2VyaWVzIGhlcmUgSSByZWFsbHkgZG9uJ3Qgc2VlIGhvdyBvbmUgaXMg
c3VwcG9zZWQgdG8KPiBjb3ZlciBfYWxsXyBwb3NzaWJsZSBjb25maWdzOyByYW5kY29uZmlnIGJ1
aWxkcyB3b24ndCBoZWxwIHdpdGgKPiB0aGlzIHVubGVzcyBvbmUgd291bGQgbGV0IHRoZW0gcnVu
IHVudGlsIHRoZXkndmUgY292ZXJlZCBhbGwKPiBwb3NzaWJsZSBvbmVzLgoKVGhpcyBoYXBwZW5z
IHRvIGJlIG15IGRlZmF1bHQgY29uZmlnLgoKSSB3b3VsZG4ndCBleHBlY3QgdG8gYmUgcGVyZmVj
dCBldmVuIHVuZGVyIHdlaXJkIGNvbWJpbmF0aW9ucywgYnV0IHRoZXNlCmFyZW4ndCB3ZWlyZCwg
YW5kIHRoaXMgaXMgdGhlIGtpbmQgb2YgY2hhbmdlIHRoYXQgYG1ha2UgYWxseWVzY29uZmlnYCBp
cwppbnRlbmRlZCBmb3IuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
