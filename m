Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68F11A9F5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:31:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0An-0000cy-VS; Wed, 11 Dec 2019 11:28:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irg7=2B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1if0Am-0000co-Ok
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:28:52 +0000
X-Inumbo-ID: 67f0ac26-1c09-11ea-8b0c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67f0ac26-1c09-11ea-8b0c-12813bfff9fa;
 Wed, 11 Dec 2019 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576063731;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XucGklAb5jgmbxF6Pb2nFFWPeBSLiJZB8kC8WOl1g1M=;
 b=cn0qPlUvxM5A0tG1H6N6yNvgw9z/k5UYg5n+lJzC/NnhDB+NxthrmuUq
 tI8sRuDdj3me5F6uuQ2XPLGJ2DqMHZifMewlvec/tD0f8XO39VoYUWIa5
 qo3F0/2QxcuVu8d+MFCl1VcWi7kzTk4VofOmNbooReCzTNBcnCl254ul4 I=;
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
IronPort-SDR: 7w5bhG9ESC4u0P4EtihWi5RlqDTDjkW2s2g6HAHsX8PFXfgpTaqORTFL1uohkzwfN+cdSPVYT/
 mNOSDco1Q8HOXkY7WUTGiGl/ZJutST2wamJXl9CokOajDu1W8tyh3L6lQwjvcfTLwvqa0rFwF5
 5hb7kI3heHhUzBnuN/t0XSRxqN3RbCE64boZ7HRFJnfNrB3b/2g1ULzvbYBazcJY/VkmENqrHv
 hrtIkNL2l/ok5nQMXYi/3BTc0FZ4KwjLZkcjknHCKQiIQ3WRoRtFRvhbR1mKzPmCCHFlt0Cryd
 eqk=
X-SBRS: 2.7
X-MesageID: 9870771
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,301,1571716800"; 
   d="scan'208";a="9870771"
Date: Wed, 11 Dec 2019 12:28:44 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191211112754.GM980@Air-de-Roger>
References: <20191210145305.6605-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210145305.6605-1-pdurrant@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] xen-blkback: prevent premature module unload
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
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMDI6NTM6MDVQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE9iamVjdHMgYWxsb2NhdGVkIGJ5IHhlbl9ibGtpZl9hbGxvYyBjb21lIGZyb20gdGhl
ICdibGtpZl9jYWNoZScga21lbQo+IGNhY2hlLiBUaGlzIGNhY2hlIGlzIGRlc3RveWVkIHdoZW4g
eGVuLWJsa2lmIGlzIHVubG9hZGVkIHNvIGl0IGlzCj4gbmVjZXNzYXJ5IHRvIHdhaXQgZm9yIHRo
ZSBkZWZlcnJlZCBmcmVlIHJvdXRpbmUgdXNlZCBmb3Igc3VjaCBvYmplY3RzIHRvCj4gY29tcGxl
dGUuIFRoaXMgbmVjZXNzaXR5IHdhcyBtaXNzZWQgaW4gY29tbWl0IDE0ODU1OTU0ZjYzNiAieGVu
LWJsa2JhY2s6Cj4gYWxsb3cgbW9kdWxlIHRvIGJlIGNsZWFubHkgdW5sb2FkZWQiLiBUaGlzIHBh
dGNoIGZpeGVzIHRoZSBwcm9ibGVtIGJ5Cj4gdGFraW5nL3JlbGVhc2luZyBleHRyYSBtb2R1bGUg
cmVmZXJlbmNlcyBpbiB4ZW5fYmxraWZfYWxsb2MvZnJlZSgpCj4gcmVzcGVjdGl2ZWx5Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCk9uZSBuaXQg
YmVsb3cuCgo+IC0tLQo+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+Cj4gQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+
Cj4gQ2M6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KPiAtLS0KPiAgZHJpdmVycy9ibG9j
ay94ZW4tYmxrYmFjay94ZW5idXMuYyB8IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxr
YmFjay94ZW5idXMuYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKPiBpbmRl
eCBlOGM1YzU0ZTFkMjYuLjU5ZDU3NmQyN2NhNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL3hlbmJ1cy5jCj4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94
ZW5idXMuYwo+IEBAIC0xNzEsNiArMTcxLDE1IEBAIHN0YXRpYyBzdHJ1Y3QgeGVuX2Jsa2lmICp4
ZW5fYmxraWZfYWxsb2MoZG9taWRfdCBkb21pZCkKPiAgCWJsa2lmLT5kb21pZCA9IGRvbWlkOwo+
ICAJYXRvbWljX3NldCgmYmxraWYtPnJlZmNudCwgMSk7Cj4gIAlpbml0X2NvbXBsZXRpb24oJmJs
a2lmLT5kcmFpbl9jb21wbGV0ZSk7Cj4gKwo+ICsJLyoKPiArCSAqIEJlY2F1c2UgZnJlZWluZyBi
YWNrIHRvIHRoZSBjYWNoZSBtYXkgYmUgZGVmZXJyZWQsIGl0IGlzIG5vdAo+ICsJICogc2FmZSB0
byB1bmxvYWQgdGhlIG1vZHVsZSAoYW5kIGhlbmNlIGRlc3Ryb3kgdGhlIGNhY2hlKSB1bnRpbAo+
ICsJICogdGhpcyBoYXMgY29tcGxldGVkLiBUbyBwcmV2ZW50IHByZW1hdHVyZSB1bmxvYWRpbmcs
IHRha2UgYW4KPiArCSAqIGV4dHJhIG1vZHVsZSByZWZlcmVuY2UgaGVyZSBhbmQgcmVsZWFzZSBv
bmx5IHdoZW4gdGhlIG9iamVjdAo+ICsJICogaGFzIGJlZW4gZnJlZSBiYWNrIHRvIHRoZSBjYWNo
ZS4KICAgICAgICAgICAgICAgICAgICBeIGZyZWVkCj4gKwkgKi8KPiArCV9fbW9kdWxlX2dldChU
SElTX01PRFVMRSk7Cj4gIAlJTklUX1dPUksoJmJsa2lmLT5mcmVlX3dvcmssIHhlbl9ibGtpZl9k
ZWZlcnJlZF9mcmVlKTsKPiAgCj4gIAlyZXR1cm4gYmxraWY7Cj4gQEAgLTMyMCw2ICszMjksNyBA
QCBzdGF0aWMgdm9pZCB4ZW5fYmxraWZfZnJlZShzdHJ1Y3QgeGVuX2Jsa2lmICpibGtpZikKPiAg
Cj4gIAkvKiBNYWtlIHN1cmUgZXZlcnl0aGluZyBpcyBkcmFpbmVkIGJlZm9yZSBzaHV0dGluZyBk
b3duICovCj4gIAlrbWVtX2NhY2hlX2ZyZWUoeGVuX2Jsa2lmX2NhY2hlcCwgYmxraWYpOwo+ICsJ
bW9kdWxlX3B1dChUSElTX01PRFVMRSk7Cj4gIH0KPiAgCj4gIGludCBfX2luaXQgeGVuX2Jsa2lm
X2ludGVyZmFjZV9pbml0KHZvaWQpCj4gLS0gCj4gMi4yMC4xCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
