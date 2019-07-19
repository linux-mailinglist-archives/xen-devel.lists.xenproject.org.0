Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B706EA6C
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 19:58:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoX6s-0002AF-2F; Fri, 19 Jul 2019 17:55:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tC9P=VQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hoX6q-0002A2-IB
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 17:55:56 +0000
X-Inumbo-ID: 73947558-aa4e-11e9-ae30-a7c51e3e8d82
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73947558-aa4e-11e9-ae30-a7c51e3e8d82;
 Fri, 19 Jul 2019 17:55:54 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: K9Ndfxsvwt44heWfGdtIMO9wzmyl1r6j2RAezpSC4dWm/7fQxFncn4dhlkciUmxbyegzMudiNo
 kJWBZT4WkI3zzenxZMuSUCjkTEmO4UEMEmT1Up+s9nMbCIlXZi1zAl5QHWJ6GFMxc3mpAyFRAO
 oHdmXJRRqkmqoPiM741XlpowqUvEfVsajMjzYlo4plxbOGdlrIH3RTjWJJgyKXfLAOMXbxldb5
 oSrahTfihqM+BrOZCkvAMXS6qkcOeGzDV/InsHN/g9w1hcdJW7/vhiiC/dotMvmYcUHXCrgH74
 6q4=
X-SBRS: 2.7
X-MesageID: 3287764
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,283,1559534400"; 
   d="scan'208";a="3287764"
To: Jan Beulich <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <10fb0354-9018-a714-44b7-efda1b579aa1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d66e0efb-a31f-63c7-1b40-e9e60098daa9@citrix.com>
Date: Fri, 19 Jul 2019 18:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <10fb0354-9018-a714-44b7-efda1b579aa1@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v3 14/14] AMD/IOMMU: process softirqs while
 dumping IRTs
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDcvMjAxOSAxNzo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hlbiB0aGVyZSBhcmUg
c3VmZmljaWVudGx5IG1hbnkgZGV2aWNlcyBsaXN0ZWQgaW4gdGhlIEFDUEkgdGFibGVzIChubwo+
IG1hdHRlciBpZiB0aGV5IGFjdHVhbGx5IGV4aXN0KSwgb3V0cHV0IG1heSB0YWtlIHdheSBsb25n
ZXIgdGhhbiB0aGUKPiB3YXRjaGRvZyB3b3VsZCBsaWtlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IHYzOiBOZXcuCj4gLS0tCj4gVEJE
OiBTZWVpbmcgdGhlIHZvbHVtZSBvZiBvdXRwdXQgSSB3b25kZXIgd2hldGhlciB3ZSBzaG91bGQg
ZnVydGhlcgo+ICAgICAgIHN1cHByZXNzIGxvZ2dpbmcgaGVhZGVycyBvZiBkZXZpY2VzIHdoaWNo
IGhhdmUgbm8gYWN0aXZlIGVudHJ5Cj4gICAgICAgKGkuZS4gZW1pdCB0aGUgaGVhZGVyIG9ubHkg
dXBvbiBmaW5kaW5nIHRoZSBmaXJzdCBJUlRFIHdvcnRoCj4gICAgICAgbG9nZ2luZykuIEFuZCB3
aGlsZSBtaW5vciBmb3IgdGhlIHRvdGFsIHZvbHVtZSBvZiBvdXRwdXQgSSdtCj4gICAgICAgYWxz
byB1bmNvbnZpbmNlZCBsb2dnaW5nIGJvdGggYSAicGVyIGRldmljZSIgaGVhZGVyIGxpbmUgYW5k
IGEKPiAgICAgICAic2hhcmVkIiBvbmUgbWFrZXMgc2Vuc2UsIHdoZW4gb25seSBvbmUgb2YgdGhl
IHR3byBjYW4gYWN0dWFsbHkKPiAgICAgICBiZSBmb2xsb3dlZCBieSBhY3R1YWwgY29udGVudHMu
CgpJIGRvbid0IGhhdmUgYSBzeXN0ZW0gSSBjYW4gYWNjZXNzIGF0IHRoZSBtb21lbnQsIHNvIGNh
bid0IGp1ZGdlIGhvdyBiYWQKaXQgaXMgcmlnaHQgbm93LsKgIEhvd2V2ZXIsIEkgd291bGQgYWR2
b2NhdGUgdGhlIHJlbW92YWwgb2YgaXJyZWxldmFudAppbmZvcm1hdGlvbi4KCkVpdGhlciB3YXks
IHRoaXMgaXMgZGVidWdnaW5nIHNvIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyCjxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKQXMgYW4gb2JzZXJ2YXRpb24sIEkgd29uZGVyIHdoZXRoZXIgY29u
dGludWFsbHkgc3ByaW5rbGluZwpwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKSBpcyB0aGUgYmVz
dCB0aGluZyB0byBkbyBmb3Iga2V5aGFuZGxlcnMuwqAKV2UndmUgZ290IGEgbnVtYmVyIG9mIG90
aGVyIHdoaWNoIGluY3VyIHRoZSB3cmF0aCBvZiB0aGUgd2F0Y2hkb2cgKGdyYW50CnRhYmxlIGlu
IHBhcnRpY3VsYXIpLCB3aGljaCBpbiBwcmFjdGljZSBtZWFucyB0aGV5IGFyZSB0eXBpY2FsbHkg
YnJva2VuCndoZW4gdGhleSBhcmUgYWN0dWFsbHkgdXNlZCBmb3IgZGVidWdnaW5nIHByb2R1Y3Rp
b24uCgpBcyB0aGVzZSBhcmUgZm9yIGRlYnVnZ2luZyBvbmx5LCBtaWdodCBpdCBiZSBhIGJldHRl
ciBpZGVhIHRvIHN0b3AgdGhlCndhdGNoZG9nIHdoaWxlIGtleWhhbmRsZXJzIGFyZSBydW5uaW5n
P8KgIFRoZSBvbmx5IHVzZWZ1bCB0aGluZyB3ZQphY3R1YWxseSBtYW5hZ2UgaGVyZSBpcyB0byBz
dG9wIHRoZSB3YXRjaGRvZyBraWxsaW5nIHVzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
