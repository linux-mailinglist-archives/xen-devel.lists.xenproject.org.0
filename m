Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81E112F7FF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 13:13:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inLnV-0007ng-On; Fri, 03 Jan 2020 12:11:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inLnU-0007na-E6
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 12:11:20 +0000
X-Inumbo-ID: 2187c640-2e22-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2187c640-2e22-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 12:11:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C56AB016;
 Fri,  3 Jan 2020 12:11:11 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
 <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
 <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
 <86f54aec-1120-62e4-dde3-4d49c54a8188@suse.com>
 <28da91bd-006f-79b1-38d0-e22eae4986ff@xen.org>
 <751bc20c-7c85-d7b1-c3e7-f2a1e77b60a5@suse.com>
 <5f56f48f-29d3-f5d4-479f-f1ebe5fcf47c@xen.org>
 <96678d3a-1b2f-9ff5-6b92-1ce1ae51e23b@suse.com>
 <022e3f4e-3b59-5648-1147-eed045b90f81@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70e52330-185b-4cf5-716d-c7ffb0290eb4@suse.com>
Date: Fri, 3 Jan 2020 13:11:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <022e3f4e-3b59-5648-1147-eed045b90f81@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: move vgc_flags to struct pv_vcpu
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDEuMjAyMCAxMjo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPiAKPiBU
aGFuayB5b3UgZm9yIHRoZSBpbmZvcm1hdGlvbi4KPiAKPiBPbiAwMy8wMS8yMDIwIDExOjMxLCBK
YW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDMuMDEuMjAyMCAxMjoxOSwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+Pj4gSG93IGRvIHlvdSBtYW5hZ2Ugc2Vjb25kYXJ5IENQVXMgb24gSFZNL1BWSCBndWVz
dD8KPj4KPj4gU2Vjb25kYXJ5IENQVXMgaGF2ZSBhcmNoaXRlY3R1cmFsIHN0YXRlIHRoZXkgc3Rh
cnQgd2l0aCwgYW5kCj4+IHRoZXJlJ3MgdmVyeSBsaXR0bGUgY29udHJvbCBhbiBPUyBoYXMgb3Zl
ciBpbml0aWFsIHJlZ2lzdGVyCj4+IHN0YXRlOiBUaGVyZSdzIGp1c3QgYW4gOC1iaXQgdmFsdWUg
c3BlY2lmeWluZyAocGFydCBvZikgdGhlCj4+IGFkZHJlc3MgdGhlIENQVSBzaG91bGQgc3RhcnQg
ZXhlY3V0aW5nIGZyb20uIEFsbCBvdGhlcgo+PiByZWdpc3RlcnMgZ2V0IHNldCB0byBoYXJkIGNv
ZGVkIHZhbHVlcy4gQW5kIHRoYXQgOC1iaXQgdmFsdWUKPj4gaXMgcGFydCBvZiB0aGUgSVBJIG1l
c3NhZ2UgdGhlIHByaW1hcnkgQ1BVIHNlbmRzIHRvIHRoZSBBUAo+PiB0byBiZSBicm91Z2h0IHVw
IChpLmUuIHRoZXJlJ3Mgbm8gaHlwZXJjYWxsIGludm9sdmVkIGhlcmUpLgo+IAo+IERvIHlvdSBo
YXZlIGFueSBwb2ludGVyIHRvIHRoaXMgY29kZT8KClBlcmhhcHMgYmVzdCBsb29rIGF0IGhvdyBY
ZW4gX3VzZXNfIHRoaXMgbWVjaGFuaXNtOgpzbXBib290LmM6d2FrZXVwX3NlY29uZGFyeV9jcHUo
KS4KCj4gQ2FuIGEgQ1BVIGJlIHR1cm5lZCBvZmYgYWZ0ZXJ3YXJkcyAKPiBhbmQgdGhlbiBib290
IGFnYWluPwoKWWVzLCBieSBzZW5kaW5nIGl0IGFuIElOSVQgc2lnbmFsIChhcyBkb25lIGJ5IGUu
Zy4Kd2FrZXVwX3NlY29uZGFyeV9jcHUoKSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
