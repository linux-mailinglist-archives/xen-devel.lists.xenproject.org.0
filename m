Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27088162573
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:24:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40wI-0000bs-8l; Tue, 18 Feb 2020 11:21:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Xbw=4G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j40wG-0000bl-Cl
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:21:16 +0000
X-Inumbo-ID: c6ba5078-5240-11ea-8156-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6ba5078-5240-11ea-8156-12813bfff9fa;
 Tue, 18 Feb 2020 11:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582024875;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qMMYYWtMLSaGX6OkdCb5/7M+4dOu328mCBgi4oOxwoE=;
 b=MznR5OhXyIA+2wkWpELW8dnPKhW1i0LHfQf7k+X417jCdGlBGS1ZUJUh
 Z6D++eT2kbpmngdajnhVlctBBCdtTUOwX6o71Nyz20o0ewo4KGl+S6xbk
 ojyPbidIE0Ca66rlmM3YlZi8R95UStEEPmyrwJHNl6GMzXfJLoHICl0Lf Y=;
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
IronPort-SDR: p/H0aPURGN2mt+xhXLi/HnD0REHzdCFmhY8xgcX8UFwnSNR1MdR/lTg0pABeEcVs0fAUUb7+er
 9Gzwh9iPt2oWLa52BwS1pMEJQMF5c07Ep0HlPKnRonfyFryxUEUj5nrnGBGwrmfmucyHMuRkSw
 KvKgD0az+81ct59DbBxShivsZ8Viafk9VDHmrsOtEN+9/ElidN6qVDriC0x76mtDG2yMD/TFwR
 aCm/LUkP7Uh8GPEjtLu4p2ndYkSucVvGVuFyFBHe8Ikzu/fPVuAg3cDZK43hRnEg53i52m1lEj
 yco=
X-SBRS: 2.7
X-MesageID: 13043265
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="13043265"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
 <20200218111039.GS4679@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1071be16-b929-a251-f2f9-a55d40ce2e53@citrix.com>
Date: Tue, 18 Feb 2020 11:21:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218111039.GS4679@Air-de-Roger>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
 Jan Beulich <jbeulich@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAyMCAxMToxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxOCwgMjAyMCBhdCAxMDo1Mzo0NUFNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAxNy8wMi8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBAQCAtNjcsNyAr
NjgsMjAgQEAgc3RhdGljIHZvaWQgc2VuZF9JUElfc2hvcnRjdXQodW5zaWduZWQgaW50IHNob3J0
Y3V0LCBpbnQgdmVjdG9yLAo+Pj4gIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3Qg
Km1hc2ssIGludCB2ZWN0b3IpCj4+PiAgewo+Pj4gICAgICBib29sIGNwdXNfbG9ja2VkID0gZmFs
c2U7Cj4+PiAtICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFz
ayk7Cj4+PiArICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNlbmRfaXBpX2NwdW1h
c2spOwo+Pj4gKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4gKwo+Pj4gKyAgICBpZiAoIGlu
X21jKCkgfHwgaW5fbm1pKCkgKQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICAvKgo+Pj4gKyAgICAg
ICAgICogV2hlbiBpbiAjTUMgb3IgI01OSSBjb250ZXh0IFhlbiBjYW5ub3QgdXNlIHRoZSBwZXIt
Q1BVIHNjcmF0Y2ggbWFzawo+Pj4gKyAgICAgICAgICogYmVjYXVzZSB3ZSBoYXZlIG5vIHdheSB0
byBhdm9pZCByZWVudHJ5LCBzbyBkbyBub3QgdXNlIHRoZSBBUElDCj4+PiArICAgICAgICAgKiBz
aG9ydGhhbmQuCj4+PiArICAgICAgICAgKi8KPj4+ICsgICAgICAgIGFsdGVybmF0aXZlX3ZjYWxs
KGdlbmFwaWMuc2VuZF9JUElfbWFzaywgbWFzaywgdmVjdG9yKTsKPj4+ICsgICAgICAgIHJldHVy
bjsKPj4gVGhlIHNldCBvZiB0aGluZ3MgeW91IGNhbiBzYWZlbHkgZG8gaW4gYW4gTk1JL01DRSBo
YW5kbGVyIGlzIHNtYWxsLCBhbmQKPj4gZG9lcyBub3QgaW5jbHVkZSBzZW5kaW5nIElQSXMuwqAg
KEluIHJlYWxpdHksIGlmIHlvdSdyZSB1c2luZyB4MmFwaWMsIGl0Cj4+IGlzIHNhZmUgdG8gc2Vu
ZCBhbiBJUEkgYmVjYXVzZSB0aGVyZSBpcyBubyByaXNrIG9mIGNsb2JiZXJpbmcgSUNSMgo+PiBi
ZWhpbmQgeW91ciBvdXRlciBjb250ZXh0J3MgYmFjaykuCj4+Cj4+IEhvd2V2ZXIsIGlmIHdlIGVz
Y2FsYXRlIGZyb20gTk1JL01DRSBjb250ZXh0IGludG8gY3Jhc2ggY29udGV4dCwgdGhlbgo+PiBh
bnl0aGluZyBnb2VzLsKgIEluIHJlYWxpdHksIHdlIG9ubHkgZXZlciBzZW5kIE5NSXMgZnJvbSB0
aGUgY3Jhc2ggcGF0aCwKPj4gYW5kIHRoYXQgaXMgbm90IHBlcm1pdHRlZCB0byB1c2UgYSBzaG9y
dGhhbmQsIG1ha2luZyB0aGlzIGNvZGUgZGVhZC4KPiBUaGlzIHdhcyByZXF1ZXN0ZWQgYnkgSmFu
LCBhcyBzYWZldHkgbWVhc3VyZQoKVGhhdCBtYXkgYmUsIGJ1dCBpdCBkb2Vzbid0IG1lYW4gaXQg
aXMgY29ycmVjdC7CoCBJZiBleGVjdXRpb24gZXZlcgplbnRlcnMgdGhpcyBmdW5jdGlvbiBpbiBO
TUkvTUNFIGNvbnRleHQsIHRoZXJlIGlzIGEgcmVhbCwKc3RhdGUtY29ycnVwdGluZyBidWcsIGhp
Z2hlciB1cCB0aGUgY2FsbCBzdGFjay4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
