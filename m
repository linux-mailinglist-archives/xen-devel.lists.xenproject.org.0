Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0862982184
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 18:18:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hufdl-0002Xh-Fv; Mon, 05 Aug 2019 16:15:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6VNZ=WB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hufdj-0002XS-6x
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 16:15:15 +0000
X-Inumbo-ID: 338d037a-b79c-11e9-b92e-b382e0709031
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 338d037a-b79c-11e9-b92e-b382e0709031;
 Mon, 05 Aug 2019 16:15:12 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Vj+xg/mY3fCMRqLh9BkYB9YGj9hVVfn1NaniXaqeP/vQ59JFnDcs/wCx3/goHQOTuikrW36fOG
 oSd1YDGj8cQN4QnZCvUkLHPmFTWTVmkNsmy4ej4hgWWU7Y86vBo8dQYVIoV8ninlgi7Tq59rnW
 ++RVljwOgRgXLzcUk0a8RZT25vDNBJJtc+Gfsfm4gFFRAQzkBQGsExqDz2qZrjVIsKmAGfE5bi
 wklml7IEPlQTRaVVP932m8z0a8oOnheqPWQ2TARZHkUONtM0AvcFBnChrdiMSEBflQ+GJdTBNA
 vhg=
X-SBRS: 2.7
X-MesageID: 3883186
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3883186"
To: Jan Beulich <JBeulich@suse.com>
References: <20190805135335.7812-1-andrew.cooper3@citrix.com>
 <e5851547-a785-4613-ab04-1e822bc23e79@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9c9b8fa6-c7b3-0c35-c37e-d42715fffb0e@citrix.com>
Date: Mon, 5 Aug 2019 17:15:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e5851547-a785-4613-ab04-1e822bc23e79@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/shim: Fix parallel build following c/s
 32b1d62887d0
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDgvMjAxOSAxNzowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUuMDguMjAxOSAx
NTo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRp
ci9NYWtlZmlsZQo+PiArKysgYi90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCj4+IEBA
IC0zOCw3ICszOCw3IEBAIGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERFUF9GSUxFUykg
Rk9SQ0UKPj4gICAJCX0KPj4gICAKPj4gICAjIENvcHkgZW5vdWdoIG9mIHRoZSB0cmVlIHRvIGJ1
aWxkIHRoZSBzaGltIGh5cGVydmlzb3IKPj4gLSQoRCk6IGxpbmtmYXJtLnN0YW1wCj4+ICskKEQp
ICQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZzogbGlua2Zhcm0uc3Rh
bXAKPj4gICAJJChNQUtFKSAtQyAkKEQpL3hlbiBkaXN0Y2xlYW4KPj4gICAKPj4gICAkKEQpL3hl
bi8uY29uZmlnOiAkKEQpICQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZp
Zwo+IEJ1dCB0aGlzIHRoZW4gYWxsb3dzIHR3byBpbnN0YW5jZXMgb2YgIiQoTUFLRSkgLUMgJChE
KS94ZW4gZGlzdGNsZWFuIgo+IHRvIHJ1biBpbiBwYXJhbGxlbCAtIG5vdCBzdXJlIGhvdyB3ZWxs
IHRoYXQgd291bGQgd29yay4gSSB0aGluayB3aGF0Cj4gd2Ugd2FudCBpbnN0ZWFkIGlzCj4KPiAk
KEQpOiBsaW5rZmFybS5zdGFtcAo+ICAgCSQoTUFLRSkgLUMgJChEKS94ZW4gZGlzdGNsZWFuCj4K
PiAkKEQpL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2c2hpbV9kZWZjb25maWc6ICQoRCkKPgo+ICQo
RCkveGVuLy5jb25maWc6ICQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZp
ZwoKVGhhdCBhbHNvIHNlZW1zIHRvIHdvcmsuwqAgT3ZlcmFsbCBjaGFuZ2UgaXMKCmRpZmYgLS1n
aXQgYS90b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCmIvdG9vbHMvZmlybXdhcmUveGVu
LWRpci9NYWtlZmlsZQppbmRleCA3NDM1NDIxMjUxLi42OTdiYmJkNTdiIDEwMDY0NAotLS0gYS90
b29scy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlCisrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1k
aXIvTWFrZWZpbGUKQEAgLTQxLDcgKzQxLDkgQEAgbGlua2Zhcm0uc3RhbXA6ICQoREVQX0RJUlMp
ICQoREVQX0ZJTEVTKSBGT1JDRQrCoCQoRCk6IGxpbmtmYXJtLnN0YW1wCsKgwqDCoMKgwqDCoMKg
ICQoTUFLRSkgLUMgJChEKS94ZW4gZGlzdGNsZWFuCsKgCi0kKEQpL3hlbi8uY29uZmlnOiAkKEQp
ICQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZworJChEKS94ZW4vYXJj
aC94ODYvY29uZmlncy9wdnNoaW1fZGVmY29uZmlnOiAkKEQpCisKKyQoRCkveGVuLy5jb25maWc6
ICQoRCkveGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZzaGltX2RlZmNvbmZpZwrCoMKgwqDCoMKgwqDC
oCAkKE1BS0UpIC1DICQoQEQpIEtCVUlMRF9ERUZDT05GSUc9cHZzaGltX2RlZmNvbmZpZwpYRU5f
Q09ORklHX0VYUEVSVD15IGRlZmNvbmZpZwrCoArCoHhlbi1zaGltOiAkKEQpL3hlbi8uY29uZmln
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
