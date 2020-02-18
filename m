Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5687162557
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 12:14:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40m8-0007zZ-HT; Tue, 18 Feb 2020 11:10:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NVht=4G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j40m7-0007zU-CD
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 11:10:47 +0000
X-Inumbo-ID: 4fa52086-523f-11ea-ade5-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4fa52086-523f-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582024246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vezPXo+I1XVyEUaJb1GpJmrstgmTGL7P3dAY2VfmFWs=;
 b=WOhBAXWg3suWpeR7uLXSWOkElZv1bYnGwuct0FQTJhcPrMel9MCFhw4X
 fYMmL6d+UYVu+XsyecPJGONEWJmRjudWgmQeYbzF8RwHl8if+Lu7wzRse
 31jZcSWI95jJPhXtGSxzHvraFfOhr3SH9/mNWnEbRPRUJLLZgnXZYSFXX o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CD6y/VqWvLtt6Mus2UzqaHBA/3dGqHCGkM061UOJtRYrYzwUyu26BbsH1PJWzgLG2QF160yrpe
 Vt3FUz2ZAzS1Fl9LA7eSCRYNOtK8LyqEIb7b6HJOcgTsD1ZgSpQDalo/e1M2hOPJI3PefCO75S
 SfwSaOLwa1PokIigF99YTzqWVDpx93Yq5aLRvmqiXKP6Z06oAxkCWVIHiyuKhUEepTFp7PODtL
 G2FgwbddZQgWJCEMqdWsUzStOTAmJ733v97Aiq4TuUDFkODf31YQV+3dTYlMlcpsasFgczR0cC
 Otc=
X-SBRS: 2.7
X-MesageID: 12971829
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12971829"
Date: Tue, 18 Feb 2020 12:10:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200218111039.GS4679@Air-de-Roger>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
 <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

T24gVHVlLCBGZWIgMTgsIDIwMjAgYXQgMTA6NTM6NDVBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wMi8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBA
QCAtNjcsNyArNjgsMjAgQEAgc3RhdGljIHZvaWQgc2VuZF9JUElfc2hvcnRjdXQodW5zaWduZWQg
aW50IHNob3J0Y3V0LCBpbnQgdmVjdG9yLAo+ID4gIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBj
cHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCj4gPiAgewo+ID4gICAgICBib29sIGNwdXNfbG9j
a2VkID0gZmFsc2U7Cj4gPiAtICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNjcmF0
Y2hfY3B1bWFzayk7Cj4gPiArICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNlbmRf
aXBpX2NwdW1hc2spOwo+ID4gKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gKwo+ID4gKyAg
ICBpZiAoIGluX21jKCkgfHwgaW5fbm1pKCkgKQo+ID4gKyAgICB7Cj4gPiArICAgICAgICAvKgo+
ID4gKyAgICAgICAgICogV2hlbiBpbiAjTUMgb3IgI01OSSBjb250ZXh0IFhlbiBjYW5ub3QgdXNl
IHRoZSBwZXItQ1BVIHNjcmF0Y2ggbWFzawo+ID4gKyAgICAgICAgICogYmVjYXVzZSB3ZSBoYXZl
IG5vIHdheSB0byBhdm9pZCByZWVudHJ5LCBzbyBkbyBub3QgdXNlIHRoZSBBUElDCj4gPiArICAg
ICAgICAgKiBzaG9ydGhhbmQuCj4gPiArICAgICAgICAgKi8KPiA+ICsgICAgICAgIGFsdGVybmF0
aXZlX3ZjYWxsKGdlbmFwaWMuc2VuZF9JUElfbWFzaywgbWFzaywgdmVjdG9yKTsKPiA+ICsgICAg
ICAgIHJldHVybjsKPiAKPiBUaGUgc2V0IG9mIHRoaW5ncyB5b3UgY2FuIHNhZmVseSBkbyBpbiBh
biBOTUkvTUNFIGhhbmRsZXIgaXMgc21hbGwsIGFuZAo+IGRvZXMgbm90IGluY2x1ZGUgc2VuZGlu
ZyBJUElzLsKgIChJbiByZWFsaXR5LCBpZiB5b3UncmUgdXNpbmcgeDJhcGljLCBpdAo+IGlzIHNh
ZmUgdG8gc2VuZCBhbiBJUEkgYmVjYXVzZSB0aGVyZSBpcyBubyByaXNrIG9mIGNsb2JiZXJpbmcg
SUNSMgo+IGJlaGluZCB5b3VyIG91dGVyIGNvbnRleHQncyBiYWNrKS4KPiAKPiBIb3dldmVyLCBp
ZiB3ZSBlc2NhbGF0ZSBmcm9tIE5NSS9NQ0UgY29udGV4dCBpbnRvIGNyYXNoIGNvbnRleHQsIHRo
ZW4KPiBhbnl0aGluZyBnb2VzLsKgIEluIHJlYWxpdHksIHdlIG9ubHkgZXZlciBzZW5kIE5NSXMg
ZnJvbSB0aGUgY3Jhc2ggcGF0aCwKPiBhbmQgdGhhdCBpcyBub3QgcGVybWl0dGVkIHRvIHVzZSBh
IHNob3J0aGFuZCwgbWFraW5nIHRoaXMgY29kZSBkZWFkLgoKVGhpcyB3YXMgcmVxdWVzdGVkIGJ5
IEphbiwgYXMgc2FmZXR5IG1lYXN1cmUgZXZlbiB0aG91Z2ggd2UgbWlnaHQgbm90CmN1cnJlbnRs
eSBzZW5kIElQSXMgZnJvbSBzdWNoIGNvbnRleHRzLgoKSSB0aGluayBpdCdzIGJldHRlciB0byBi
ZSBzYWZlIHRoYW4gc29ycnksIGFzIHVsdGltYXRlbHkgc29tZW9uZQphZGRpbmcgYW4gSVBJIHVz
YWdlIGluICNNQyBvciAjTk1JIGNvbnRleHQgY291bGQgZ28gdW5ub3RpY2VkIHdpdGhvdXQKdGhv
c2UgY2hlY2tzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
