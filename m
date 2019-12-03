Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B5C110431
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 19:25:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icCpd-0003pe-Kk; Tue, 03 Dec 2019 18:23:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nD+/=ZZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1icCpb-0003pZ-Ke
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 18:23:27 +0000
X-Inumbo-ID: ff89ea5e-15f9-11ea-a55d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff89ea5e-15f9-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 18:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575397408;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=/sHPJJpHWJDPhvLG53Elfr+BqxDLGqvexparK1sN0wU=;
 b=RQ11NeA4CcWBe/ev0kx09awTpu5i7LHs/F2Wq8BNQiWa2ZqduJujedYK
 8gW2wk5fEAXfpmCBr75VdbHUoGiU7QWzhTp5KLjbtThEG1NLCbsGx9TaE
 nSlwYijIGQqWc4bP8uSbEKHD/OLRW2zWID290eWRZeKAZDUXDC0Vcdm78 g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OV+tNv3gbyejmb/9TrzfyDTPOXbNEZV9q2OSCKFh0W97H5L5snJu6DNGTI4iROmDXCEWFimoe0
 45/5FENR+Wo/u5U9E2lUjEX0WoUPTw2YFX9gO+wJa+bF2J70+DsoOK6SLx/xPwQn69vltHS8Wd
 HvK/w7v/PmbqmiADrxTa0mchZunLsJHyGf5PJStd6gEnXjQBgpxiKRVArLBwepUmevyBhqBPfD
 Y2P3LXnbXDjG7uHdKfvgH0827I6HNlHclbkOVO6k213eyBQQthRwSvHZLDNzrqc9A5yHOK2P1y
 y0g=
X-SBRS: 2.7
X-MesageID: 9269177
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,274,1571716800"; 
   d="scan'208";a="9269177"
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
 <b9a246ee-6d0d-c38b-6669-53c91d61cce1@citrix.com>
 <CABfawhm_Ba5Bh25=VSvoOLOxOGyiCKUBNkHouPq8uEDoFCZePQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b9d02824-3d33-898b-7d74-d143ba06a914@citrix.com>
Date: Tue, 3 Dec 2019 18:23:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhm_Ba5Bh25=VSvoOLOxOGyiCKUBNkHouPq8uEDoFCZePQ@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMvMTIvMjAxOSAxODoxNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgRGVj
IDMsIDIwMTkgYXQgMTowOSBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPiB3cm90ZToKPj4gT24gMDMvMTIvMjAxOSAxODowNSwgVGFtYXMgSyBMZW5neWVsIHdyb3Rl
Ogo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaCBiL3hlbi9p
bmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4+Pj4gaW5kZXggOTU5MDgzZDhjNC4uNzY2NzZmZjRj
MCAxMDA2NDQKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAo+Pj4+ICsr
KyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4+Pj4gQEAgLTI4MSw2ICsyODEsNyBA
QCBzdHJ1Y3Qgdm1fZXZlbnRfZGVidWcgewo+Pj4+ICAgICAgdWludDMyX3QgaW5zbl9sZW5ndGg7
Cj4+Pj4gICAgICB1aW50OF90IHR5cGU7ICAgICAgICAvKiBIVk1PUF9UUkFQXyogKi8KPj4+PiAg
ICAgIHVpbnQ4X3QgX3BhZFszXTsKPj4+PiArICAgIHVpbnQ2NF90IHBlbmRpbmdfZGJnOwo+Pj4g
VGhpcyBpcyBqdXN0IGEgbml0cGljayBidXQgSSB3b3VsZCBwcmVmZXIgaWYgd2UgaGFkIHRoZSBf
cGFkIGZpZWxkIGFzCj4+PiB0aGUgbGFzdCBlbGVtZW50IGluIHRoZSBzdHJ1Y3QgYW5kIGtlZXAg
YWxsIDY0LWJpdCBtZW1iZXJzIHVwIGluIHRoZQo+Pj4gZnJvbnQuCj4+IFdlbGwgdGhlIHJlYXNv
biBJIGRpZCBpdCBsaWtlIHRoaXMgaXMgdGhhdCB0aGlzIHZlcnNpb24gd2lsbCBjb250aW51ZSB0
bwo+PiBmdW5jdGlvbiB3aXRoIG9sZGVyIGludHJvc3BlY3Rpb24gY29kZS4gIFRoZSBleHRyYSBm
aWVsZCBpcyB3aXRoaW4gYQo+PiB1bmlvbiBhbmQgbm8gb3RoZXIgZGF0YSBtb3Zlcy4KPj4KPj4g
QnkgcmVwb3NpdGlvbmluZyB0byB0aGUgc3RhcnQsIGl0IHdpbGwgYWxtb3N0IGNlcnRhaW5seSBi
cmVhayBvbGRlcgo+PiBpbnRyb3NwZWN0aW9uIGNvZGUgZXZlbiB0aG91Z2ggaXQgY29tcGlsZWQg
Y29ycmVjdGx5Lgo+Pgo+PiBZb3VyIGNob2ljZS4KPiBXZSBhcmUgYWxyZWFkeSBidW1waW5nIHRo
ZSBpbnRlcmZhY2UgdmVyc2lvbiBmb3IgdGhlIG5leHQgcmVsZWFzZSBzbwo+IG9sZCBpbnRyb3Nw
ZWN0aW9uIGNvZGUgYnkgZGVzaWduIHdpbGwgc3RvcCB3b3JraW5nLiBXZSBtYWtlIG5vIEFCSQo+
IHN0YWJpbGl0eSBndWFyYW50ZWVzIGJldHdlZW4gaW50ZXJmYWNlIHZlcnNpb25zIHNvIHRoaXMg
aXMgYQo+IG5vbi1pc3N1ZS4KCk9rIGZpbmUuwqAgVXBkYXRlZCBsb2NhbGx5LCBidXQgSSB3b24n
dCBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhdGNoCmp1c3QgZm9yIHRoaXMgZGVsdGEuCgpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVkZS9w
dWJsaWMvdm1fZXZlbnQuaAppbmRleCA3NjY3NmZmNGMwLi44YzI0YTU4OTY0IDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
dm1fZXZlbnQuaApAQCAtMjc4LDEwICsyNzgsMTAgQEAgc3RydWN0IHZtX2V2ZW50X3NpbmdsZXN0
ZXAgewrCoArCoHN0cnVjdCB2bV9ldmVudF9kZWJ1ZyB7CsKgwqDCoMKgIHVpbnQ2NF90IGdmbjsK
K8KgwqDCoCB1aW50NjRfdCBwZW5kaW5nX2RiZzsKwqDCoMKgwqAgdWludDMyX3QgaW5zbl9sZW5n
dGg7CsKgwqDCoMKgIHVpbnQ4X3QgdHlwZTvCoMKgwqDCoMKgwqDCoCAvKiBIVk1PUF9UUkFQXyog
Ki8KwqDCoMKgwqAgdWludDhfdCBfcGFkWzNdOwotwqDCoMKgIHVpbnQ2NF90IHBlbmRpbmdfZGJn
OwrCoH07CsKgCsKgc3RydWN0IHZtX2V2ZW50X21vdl90b19tc3IgewoKCkhvd2V2ZXIsIHRoaXMg
ZG9lcyByYWlzZSB0aGUgcXVlc3Rpb24gb2Ygd2h5IGluc25fbGVuZ3RoIGlzIHVpbnQzMl90LsKg
Ckl0IGhhcyBhIHZhbHVlIHdoaWNoIGlzIGF0IG1vc3QgMTUuCgp+QW5kcmV3CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
