Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6214811A945
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 11:49:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iezVJ-0004PT-ER; Wed, 11 Dec 2019 10:46:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irg7=2B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iezVI-0004PO-23
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 10:46:00 +0000
X-Inumbo-ID: 6a4a29c6-1c03-11ea-8af7-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a4a29c6-1c03-11ea-8af7-12813bfff9fa;
 Wed, 11 Dec 2019 10:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576061158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Bakm+VQafiA0lPWjjq2Jn5aW7yKdm4BIfPd/HpC9RKg=;
 b=fj/TbFI96Peq4TOkaQFgt4SM6MXq0AkLVZvYKgQSbWwnu1IdIvpWySiO
 w7jQ/J3oEwyqbyC7T+pzSEUxXXrVgOFZYgJUFE8tkzJRh9Tbdx9hblgtD
 PqerlDBNcVLB8xcuu3ngox0vvay/9+I5Tm6plo0SSZXgB2sNZ/ct5Q037 g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I3Ws08a/zEqfI/lgYjM72AHmokfeQppgfWPU3XDYSw2zOVl+VcqZLiua6UdG10JD0HD+CRAwST
 NFDShGwJuQD6it7SIlmiN4CFZ696Ac8hP8twg2eOkSJVeMEdH2l/38FdahtXQ09pzYgq84RHr5
 l+DCF8NNv4uJgRyIeSKWnwogcxpb+RQfM0Mjncvo2Ohmq0VWJyB3jW0FWUYw/lbnmSytU9hw84
 bC58LNAm7aYK5l1pMCtVKXapqHENVca0nipPmZ3N+pP+kA0pu8G36aiva0YL5+HhtiBzwgTFCK
 YAo=
X-SBRS: 2.7
X-MesageID: 9925492
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,301,1571716800"; 
   d="scan'208";a="9925492"
Date: Wed, 11 Dec 2019 11:45:50 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191211104550.GJ980@Air-de-Roger>
References: <20191210113347.3404-1-pdurrant@amazon.com>
 <20191210113347.3404-5-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210113347.3404-5-pdurrant@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v2 4/4] xen-blkback: support dynamic
 unbind/bind
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
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMTE6MzM6NDdBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEJ5IHNpbXBseSByZS1hdHRhY2hpbmcgdG8gc2hhcmVkIHJpbmdzIGR1cmluZyBjb25u
ZWN0X3JpbmcoKSByYXRoZXIgdGhhbgo+IGFzc3VtaW5nIHRoZXkgYXJlIGZyZXNobHkgYWxsb2Nh
dGVkIChpLmUgYXNzdW1pbmcgdGhlIGNvdW50ZXJzIGFyZSB6ZXJvKQo+IGl0IGlzIHBvc3NpYmxl
IGZvciB2YmQgaW5zdGFuY2VzIHRvIGJlIHVuYm91bmQgYW5kIHJlLWJvdW5kIGZyb20gYW5kIHRv
Cj4gKHJlc3BlY3RpdmVseSkgYSBydW5uaW5nIGd1ZXN0Lgo+IAo+IFRoaXMgaGFzIGJlZW4gdGVz
dGVkIGJ5IHJ1bm5pbmc6Cj4gCj4gd2hpbGUgdHJ1ZTsKPiAgIGRvIGZpbyAtLW5hbWU9cmFuZHdy
aXRlIC0taW9lbmdpbmU9bGliYWlvIC0taW9kZXB0aD0xNiBcCj4gICAtLXJ3PXJhbmR3cml0ZSAt
LWJzPTRrIC0tZGlyZWN0PTEgLS1zaXplPTFHIC0tdmVyaWZ5PWNyYzMyOwo+ICAgZG9uZQo+IAo+
IGluIGEgUFYgZ3Vlc3Qgd2hpbHN0IHJ1bm5pbmc6Cj4gCj4gd2hpbGUgdHJ1ZTsKPiAgIGRvIGVj
aG8gdmJkLSRET01JRC0kVkJEID51bmJpbmQ7Cj4gICBlY2hvIHVuYm91bmQ7Cj4gICBzbGVlcCA1
OwoKSXMgdGhlcmUgYW55d2F5IHRvIGtub3cgd2hlbiB0aGUgdW5iaW5kIGhhcyBmaW5pc2hlZD8g
QUZBSUNUCnhlbl9ibGtpZl9kaXNjb25uZWN0IHdpbGwgcmV0dXJuIEVCVVNZIGlmIHRoZXJlIGFy
ZSBpbiBmbGlnaHQKcmVxdWVzdHMsIGFuZCB0aGUgZGlzY29ubmVjdCB3b24ndCBiZSBjb21wbGV0
ZWQgdW50aWwgdGhvc2UgcmVxdWVzdHMKYXJlIGZpbmlzaGVkLgoKPiAgIGVjaG8gdmJkLSRET01J
RC0kVkJEID5iaW5kOwo+ICAgZWNobyBib3VuZDsKPiAgIHNsZWVwIDM7Cj4gICBkb25lCj4gCj4g
aW4gZG9tMCBmcm9tIC9zeXMvYnVzL3hlbi1iYWNrZW5kL2RyaXZlcnMvdmJkIHRvIGNvbnRpbnVv
dXNseSB1bmJpbmQgYW5kCj4gcmUtYmluZCBpdHMgc3lzdGVtIGRpc2sgaW1hZ2UuCj4gCj4gVGhp
cyBpcyBhIGhpZ2hseSB1c2VmdWwgZmVhdHVyZSBmb3IgYSBiYWNrZW5kIG1vZHVsZSBhcyBpdCBh
bGxvd3MgaXQgdG8gYmUKPiB1bmxvYWRlZCBhbmQgcmUtbG9hZGVkIChpLmUuIHVwZGF0ZWQpIHdp
dGhvdXQgcmVxdWlyaW5nIGRvbVVzIHRvIGJlIGhhbHRlZC4KPiBUaGlzIHdhcyBhbHNvIHRlc3Rl
ZCBieSBydW5uaW5nOgo+IAo+IHdoaWxlIHRydWU7Cj4gICBkbyBlY2hvIHZiZC0kRE9NSUQtJFZC
RCA+dW5iaW5kOwo+ICAgZWNobyB1bmJvdW5kOwo+ICAgc2xlZXAgNTsKPiAgIHJtbW9kIHhlbi1i
bGtiYWNrOwo+ICAgZWNobyB1bmxvYWRlZDsKPiAgIHNsZWVwIDE7Cj4gICBtb2Rwcm9iZSB4ZW4t
YmxrYmFjazsKPiAgIGVjaG8gYm91bmQ7Cj4gICBjZCAkKHB3ZCk7Cj4gICBzbGVlcCAzOwo+ICAg
ZG9uZQo+IAo+IGluIGRvbTAgd2hpbHN0IHJ1bm5pbmcgdGhlIHNhbWUgbG9vcCBhcyBhYm92ZSBp
biB0aGUgKHNpbmdsZSkgUFYgZ3Vlc3QuCj4gCj4gU29tZSAobGVzcyBzdHJlc3NmdWwpIHRlc3Rp
bmcgaGFzIGFsc28gYmVlbiBkb25lIHVzaW5nIGEgV2luZG93cyBIVk0gZ3Vlc3QKPiB3aXRoIHRo
ZSBsYXRlc3QgOS4wIFBWIGRyaXZlcnMgaW5zdGFsbGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAtLS0KPiBDYzogS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+IENjOiAiUm9nZXIgUGF1IE1vbm7D
qSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IENjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwu
ZGs+Cj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4g
Q2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IHYyOgo+ICAtIEFwcGx5IGEgc2FuaXR5
IGNoZWNrIHRvIHRoZSB2YWx1ZSBvZiByc3BfcHJvZCBhbmQgZmFpbCB0aGUgcmUtYXR0YWNoCj4g
ICAgaWYgaXQgaXMgaW1wbGF1c2libGUKPiAgLSBTZXQgYWxsb3dfcmViaW5kIHRvIHByZXZlbnQg
cmluZyBmcm9tIGJlaW5nIGNsb3NlZCBvbiB1bmJpbmQKPiAgLSBVcGRhdGUgdGVzdCB3b3JrbG9h
ZCBmcm9tIGRkIHRvIGZpbyAod2l0aCB2ZXJpZmljYXRpb24pCj4gLS0tCj4gIGRyaXZlcnMvYmxv
Y2sveGVuLWJsa2JhY2sveGVuYnVzLmMgfCA1OSArKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJp
dmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+IGluZGV4IGU4YzVjNTRlMWQyNi4uMTNk
MDk2MzBiMjM3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVz
LmMKPiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCj4gQEAgLTE4MSw2
ICsxODEsOCBAQCBzdGF0aWMgaW50IHhlbl9ibGtpZl9tYXAoc3RydWN0IHhlbl9ibGtpZl9yaW5n
ICpyaW5nLCBncmFudF9yZWZfdCAqZ3JlZiwKPiAgewo+ICAJaW50IGVycjsKPiAgCXN0cnVjdCB4
ZW5fYmxraWYgKmJsa2lmID0gcmluZy0+YmxraWY7Cj4gKwlzdHJ1Y3QgYmxraWZfY29tbW9uX3Ny
aW5nICpzcmluZ19jb21tb247Cj4gKwlSSU5HX0lEWCByc3BfcHJvZCwgcmVxX3Byb2Q7Cj4gIAo+
ICAJLyogQWxyZWFkeSBjb25uZWN0ZWQgdGhyb3VnaD8gKi8KPiAgCWlmIChyaW5nLT5pcnEpCj4g
QEAgLTE5MSw0NiArMTkzLDY2IEBAIHN0YXRpYyBpbnQgeGVuX2Jsa2lmX21hcChzdHJ1Y3QgeGVu
X2Jsa2lmX3JpbmcgKnJpbmcsIGdyYW50X3JlZl90ICpncmVmLAo+ICAJaWYgKGVyciA8IDApCj4g
IAkJcmV0dXJuIGVycjsKPiAgCj4gKwlzcmluZ19jb21tb24gPSAoc3RydWN0IGJsa2lmX2NvbW1v
bl9zcmluZyAqKXJpbmctPmJsa19yaW5nOwo+ICsJcnNwX3Byb2QgPSBSRUFEX09OQ0Uoc3Jpbmdf
Y29tbW9uLT5yc3BfcHJvZCk7Cj4gKwlyZXFfcHJvZCA9IFJFQURfT05DRShzcmluZ19jb21tb24t
PnJlcV9wcm9kKTsKPiArCj4gIAlzd2l0Y2ggKGJsa2lmLT5ibGtfcHJvdG9jb2wpIHsKPiAgCWNh
c2UgQkxLSUZfUFJPVE9DT0xfTkFUSVZFOgo+ICAJewo+IC0JCXN0cnVjdCBibGtpZl9zcmluZyAq
c3Jpbmc7Cj4gLQkJc3JpbmcgPSAoc3RydWN0IGJsa2lmX3NyaW5nICopcmluZy0+YmxrX3Jpbmc7
Cj4gLQkJQkFDS19SSU5HX0lOSVQoJnJpbmctPmJsa19yaW5ncy5uYXRpdmUsIHNyaW5nLAo+IC0J
CQkgICAgICAgWEVOX1BBR0VfU0laRSAqIG5yX2dyZWZzKTsKPiArCQlzdHJ1Y3QgYmxraWZfc3Jp
bmcgKnNyaW5nX25hdGl2ZSA9Cj4gKwkJCShzdHJ1Y3QgYmxraWZfc3JpbmcgKilyaW5nLT5ibGtf
cmluZzsKCkkgdGhpbmsgeW91IGNhbiBjb25zdGlmeSBib3RoIHNyaW5nX25hdGl2ZSBhbmQgc3Jp
bmdfY29tbW9uIChhbmQgdGhlCm90aGVyIGluc3RhbmNlcyBiZWxvdykuCgo+ICsJCXVuc2lnbmVk
IGludCBzaXplID0gX19SSU5HX1NJWkUoc3JpbmdfbmF0aXZlLAo+ICsJCQkJCQlYRU5fUEFHRV9T
SVpFICogbnJfZ3JlZnMpOwo+ICsKPiArCQlCQUNLX1JJTkdfQVRUQUNIKCZyaW5nLT5ibGtfcmlu
Z3MubmF0aXZlLCBzcmluZ19uYXRpdmUsCj4gKwkJCQkgcnNwX3Byb2QsIFhFTl9QQUdFX1NJWkUg
KiBucl9ncmVmcyk7Cj4gKwkJZXJyID0gKHJlcV9wcm9kIC0gcnNwX3Byb2QgPiBzaXplKSA/IC1F
SU8gOiAwOwo+ICAJCWJyZWFrOwo+ICAJfQo+ICAJY2FzZSBCTEtJRl9QUk9UT0NPTF9YODZfMzI6
Cj4gIAl7Cj4gLQkJc3RydWN0IGJsa2lmX3g4Nl8zMl9zcmluZyAqc3JpbmdfeDg2XzMyOwo+IC0J
CXNyaW5nX3g4Nl8zMiA9IChzdHJ1Y3QgYmxraWZfeDg2XzMyX3NyaW5nICopcmluZy0+YmxrX3Jp
bmc7Cj4gLQkJQkFDS19SSU5HX0lOSVQoJnJpbmctPmJsa19yaW5ncy54ODZfMzIsIHNyaW5nX3g4
Nl8zMiwKPiAtCQkJICAgICAgIFhFTl9QQUdFX1NJWkUgKiBucl9ncmVmcyk7Cj4gKwkJc3RydWN0
IGJsa2lmX3g4Nl8zMl9zcmluZyAqc3JpbmdfeDg2XzMyID0KPiArCQkJKHN0cnVjdCBibGtpZl94
ODZfMzJfc3JpbmcgKilyaW5nLT5ibGtfcmluZzsKPiArCQl1bnNpZ25lZCBpbnQgc2l6ZSA9IF9f
UklOR19TSVpFKHNyaW5nX3g4Nl8zMiwKPiArCQkJCQkJWEVOX1BBR0VfU0laRSAqIG5yX2dyZWZz
KTsKPiArCj4gKwkJQkFDS19SSU5HX0FUVEFDSCgmcmluZy0+YmxrX3JpbmdzLng4Nl8zMiwgc3Jp
bmdfeDg2XzMyLAo+ICsJCQkJIHJzcF9wcm9kLCBYRU5fUEFHRV9TSVpFICogbnJfZ3JlZnMpOwo+
ICsJCWVyciA9IChyZXFfcHJvZCAtIHJzcF9wcm9kID4gc2l6ZSkgPyAtRUlPIDogMDsKPiAgCQli
cmVhazsKPiAgCX0KPiAgCWNhc2UgQkxLSUZfUFJPVE9DT0xfWDg2XzY0Ogo+ICAJewo+IC0JCXN0
cnVjdCBibGtpZl94ODZfNjRfc3JpbmcgKnNyaW5nX3g4Nl82NDsKPiAtCQlzcmluZ194ODZfNjQg
PSAoc3RydWN0IGJsa2lmX3g4Nl82NF9zcmluZyAqKXJpbmctPmJsa19yaW5nOwo+IC0JCUJBQ0tf
UklOR19JTklUKCZyaW5nLT5ibGtfcmluZ3MueDg2XzY0LCBzcmluZ194ODZfNjQsCj4gLQkJCSAg
ICAgICBYRU5fUEFHRV9TSVpFICogbnJfZ3JlZnMpOwo+ICsJCXN0cnVjdCBibGtpZl94ODZfNjRf
c3JpbmcgKnNyaW5nX3g4Nl82NCA9Cj4gKwkJCShzdHJ1Y3QgYmxraWZfeDg2XzY0X3NyaW5nICop
cmluZy0+YmxrX3Jpbmc7Cj4gKwkJdW5zaWduZWQgaW50IHNpemUgPSBfX1JJTkdfU0laRShzcmlu
Z194ODZfNjQsCj4gKwkJCQkJCVhFTl9QQUdFX1NJWkUgKiBucl9ncmVmcyk7Cj4gKwo+ICsJCUJB
Q0tfUklOR19BVFRBQ0goJnJpbmctPmJsa19yaW5ncy54ODZfNjQsIHNyaW5nX3g4Nl82NCwKPiAr
CQkJCSByc3BfcHJvZCwgWEVOX1BBR0VfU0laRSAqIG5yX2dyZWZzKTsKPiArCQllcnIgPSAocmVx
X3Byb2QgLSByc3BfcHJvZCA+IHNpemUpID8gLUVJTyA6IDA7CgpUaGlzIGlzIHJlcGVhdGVkIGZv
ciBhbGwgcmluZyB0eXBlcywgbWlnaHQgYmUgd29ydGggdG8gcHVsbCBpdCBvdXQgb2YKdGhlIHN3
aXRjaC4uLgoKPiAgCQlicmVhazsKPiAgCX0KPiAgCWRlZmF1bHQ6Cj4gIAkJQlVHKCk7Cj4gIAl9
Cj4gKwlpZiAoZXJyIDwgMCkKPiArCQlnb3RvIGZhaWw7CgouLi5hbmQgcGxhY2VkIGhlcmUgaW5z
dGVhZD8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
