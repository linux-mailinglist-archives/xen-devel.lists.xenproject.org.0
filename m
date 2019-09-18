Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92236B687F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 18:52:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAd8h-0001L6-PO; Wed, 18 Sep 2019 16:49:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtMR=XN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iAd8f-0001Kh-BB
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 16:49:09 +0000
X-Inumbo-ID: 3ad5b586-da34-11e9-963d-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ad5b586-da34-11e9-963d-12813bfff9fa;
 Wed, 18 Sep 2019 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568825348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QWUH8zsr/c4lTRGJmKe/3MtM+LCOISiAfakcpJPgQwA=;
 b=Rp2rt8MgJ23I9P5qfqA2yciPCrULOHQL2WNLqLZIJbFAXDO27nnsBek8
 i+JPXokY2KQekkJGODy/QSpa2pe+lnSozaY0Nr7SujVEN465QEkG3Zsbg
 +sxlHydfE4qNnPEf8xlPCLlyc0I80fTudzsLdgUtml3cQ61KgB0Lvk7gq M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SblKtd200IFPJvdOVfyewHPyK1oTG9bcy8+CyopHe3c5LIuHtnp0vAfAjzefieQF7p2zSsrDwb
 u7xZRhl0thW9lOD7K+Vahuzf4lujuiXtImFHAquQEdB/nrzAJA4hLt4OLodFmxXAYgWzUjn1lA
 82fzr+twr/ZmHR42QuPOLqsMGpDSj5pMKWimO11Fhq7/DeFxBOuXmgCDIpToX/+zKk2ogTltLc
 v6YDuvaLuwpUj+gO5TiqP2JPEwVfzqf0balDlUNGHzpmj479tztoLnQj5noYKhN2fN3PlZxqec
 e0o=
X-SBRS: 2.7
X-MesageID: 5741262
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,521,1559534400"; 
   d="scan'208";a="5741262"
Date: Wed, 18 Sep 2019 17:49:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190918164904.GP1308@perard.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-9-anthony.perard@citrix.com>
 <23937.4506.366843.383849@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23937.4506.366843.383849@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH 08/35] libxl: Replace
 libxl__qmp_initializations by ev_qmp calls
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMDY6MDI6MThQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA4LzM1XSBsaWJ4bDogUmVwbGFj
ZSBsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9ucyBieSBldl9xbXAgY2FsbHMiKToKPiA+IFNldHVw
IGEgdGltZW91dCBvZiAxMHMgZm9yIGFsbCB0aGUgY29tbWFuZHMuIEl0IHVzZWQgdG8gYmUgYWJv
dXQgNXMKPiA+IHBlciBjb21tYW5kcy4KPiAKPiBUaGlzIHBhdGNoIGlzIHF1aXRlIGhhcmQgdG8g
cmV2aWV3IGJlY2F1c2UgaXQgaXMgYQo+IHJld3JpdGUvcmVhcnJhbmdlbWVudCBhbmQgSSBjYW4n
dCBzZWUgd2hlcmUgYWxsIHRoZSBwaWVjZXMgY29tZSBmcm9tLgo+IAo+IEhvdyBoYXJkIHdvdWxk
IGl0IGJlIHRvIG1ha2UgYSBwcmUtcGF0Y2ggdG8gc2h1ZmZsZSB0aGUgY29kZSB0byB0aGUKPiBz
YW1lIHBsYWNlIGFzIGl0J3MgZ29pbmcsIGFuZCBjaGFuZ2UgdGhlIHZhcmlhYmxlIG5hbWVzIGV0
Yy4gPwoKSXQgaXMgYWN0dWFsbHkgbm90IHRoYXQgZWFzeSB0byBwcmUtbW92ZSB0aGUgZnVuY3Rp
b25zIHRvIHRoZSBuZXcgcGxhY2UsCnRob3NlIGZ1bmN0aW9ucyBhY2Nlc3MgdGhlIHN0cnVjdCBg
cW1wJywgYnV0IHRoZSBkZXRhaWwgb2YgdGhlIHN0cnVjdCBpcwpvbmx5IGF2YWlsYWJsZSBpbiBs
aWJ4bF9xbXAuYy4gVGhvc2UgZnVuY3Rpb25zIGFsc28gY2FsbHMKcW1wX3N5bmNocm9ub3VzX3Nl
bmQoKSwgYnV0IHRoYXQgY2FuIGVhc3kgYmVlbiB3b3JrZWQgYXJvdW5kLgoKV291bGQgYSBzZXJp
ZXMgb2YgcGF0Y2ggd2hpY2ggd291bGQgbmVlZHMgdG8gYmUgc3F1YXNoZWQgdG9nZXRoZXIgYWZ0
ZXIKcmV2aWV3IHdvdWxkIGJlIGVub3VnaD8gT3RoZXJ3aXNlLCBJIGRvbid0IHNlZSBob3cgSSBj
YW4gZG8gaXQgd2l0aG91dApicmVha2luZyBiaXNlY3RhYmlsaXR5LgoKLS0gCkFudGhvbnkgUEVS
QVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
