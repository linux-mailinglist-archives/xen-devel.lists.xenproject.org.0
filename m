Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FBA2746
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 21:27:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Q2q-0002HD-Pk; Thu, 29 Aug 2019 19:25:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ee8B=WZ=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i3Q2p-0002H7-GO
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 19:25:19 +0000
X-Inumbo-ID: bc1e7f12-ca92-11e9-8980-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc1e7f12-ca92-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 19:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567106718;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=j7lf9gbcip7ZOhyUSdJbD6Rb8uQUfulVlTaqDYI/7yo=;
 b=gvbESEDxiG8Cq4+l3lOMA8wLeBuSjietY/KGVfMg6KYnOX3ClnvQ50Gu
 sbhwwgU+PRrE7frkhy2pTUxALPpTQGFL1zRH3CySzUk10D6uR6TIZIuCD
 JPbqvWOETxIBDUdz+c6wYpY29prIHqYNoVjVvRduK4oZKNckb4/cqZpW2 k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j8cHFG92tCr2ksKWZSo8eBRtWA540HgVff5XzmwJ7OZssA9vj/39gS5uwNOnE7ZjyJz3qt/3mn
 qAex/IWEwVzEAcplV8lx3K0mAOHPVgTx+cnyWI1TckvI5dv+LrEBJQlLvDDLnuOFWfjlfb+RV0
 GHcyowTcU0BNAbpu+FoZw6E4z/2pl2mMKLjoDom8q8bSgFAfz5bE3cXsGKAGT6C34fTxLJ9g7n
 uXw6uRjQHOXWWQ/VA5kWT13RrUGDefF1Dgayyb5JNsVja9k8LPD233lFQr12s+wa0JmdGaruBw
 plU=
X-SBRS: 2.7
X-MesageID: 5092612
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,444,1559534400"; 
   d="scan'208";a="5092612"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1567005862-18540-1-git-send-email-igor.druzhinin@citrix.com>
 <20190829080059.s24eyer5hfaqnbfv@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <89b9bad1-d9ef-6db2-8521-d55cafb16514@citrix.com>
Date: Thu, 29 Aug 2019 20:25:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829080059.s24eyer5hfaqnbfv@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mmcfg: add "force" option for MCFG
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
Cc: sstabellini@kernel.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com,
 jbeulich@suse.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDgvMjAxOSAwOTowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4KPj4gSSB0aGlu
ayB3ZSBuZWVkIHRvIGhhdmUgdGhpcyBvcHRpb24gdG8gYXQgbGVhc3QgaGF2ZSBhIHdheSB0byB3
b3JrYXJvdW5kCj4+IHByb2JsZW0gKDEpLiBQcm9ibGVtICgyKSBjb3VsZCBiZSBzb2x2ZWQgaW4g
RG9tMCBrZXJuZWwgYnkgaW52b2tpbmcKPj4geGVuX21jZmdfbGF0ZSgpIGVhcmxpZXIgYnV0IGJl
Zm9yZSB0aGUgZmlyc3QgUENJIGJ1cyBlbnVtZXJ0YWlvbiB3aGljaAo+PiBjdXJyZW50bHkgaGFw
cGVucyBzb213aGVyZSBkdXJpbmcgQUNQSSBzY2FuIEkgdGhpbmsuCj4+Cj4+IFRoZSBxdWVzdGlv
biBpcyB3aGF0IHRoZSBkZWZ1bHQgdmFsdWUgZm9yIHRoaXMgb3B0aW9uIHNob3VsZCBiZT8KPiAK
PiBIYXZlIHlvdSB0ZXN0ZWQgdGhpcyBhZ2FpbnN0IGEgdmFyaWV0eSBvZiBoYXJkd2FyZT8KTm90
IHlldCwgSSBwcmVzdW1lIGl0J3MgcG9zc2libGUgaW4gdGhlb3J5IHRoYXQgdGhlcmUgaXMgc3Vj
aCBhIGJveCBpbgp0aGUgd2lsZCB0aGF0IHdpbGwgbWlzYmVoYXZlIGlmIHdlIGF0dGVtcHQgdG8g
YWNjZXNzIE1DRkcgZWFybGllciBpdCdkCmJlIGRpc2NvdmVyZWQgdGhyb3VnaCBBQ1BJLiBPdGhl
ciB0aGFuIHRoYXQgSSBkb24ndCBzZWUgYSByZWFzb24gd2h5IGl0CndvdWxkIGNhdXNlIGFueSBw
cm9ibGVtLiBCdXQgeW91J3JlIHJpZ2h0IC0gd2UgbmVlZCB0byBydW4gc29tZSB0ZXN0cwp3aXRo
IHRoaXMgb3B0aW9uIHNldCB0byB0cnVlIG9uIG91ciBmbGVldCBiZWZvcmUgZGVjaWRpbmcuCgo+
IEhhdmUgeW91IGZvdW5kIGFueSBib3ggdGhhdCBoYXMgYSB3cm9uZyBNTUNGRyBhcmVhIGluIHRo
ZSBNQ0ZHIHN0YXRpYwo+IHRhYmxlPyAoaWU6IG9uZSB0aGF0IGRvZXNuJ3QgbWF0Y2ggdGhlIG1v
dGhlcmJvYXJkIHJlc291cmNlCj4gcmVzZXJ2YXRpb24gaW4gdGhlIGR5bmFtaWMgQUNQSSB0YWJs
ZXM/KQoKSSB0aGluayBpdCdzIHBvc3NpYmxlIHRoYXQgc2l6ZSBvZiB0aGUgdGFibGUgcmVwb3J0
ZWQgZnJvbSBBQ1BJIGlzCnNtYWxsZXIgd2hpY2ggd291bGQgYmUgYSBwcm9ibGVtIGlmIHdlIGFj
Y2VzcyBvdXQtb2YtYm91bmRzIHByZWxpbWluYXJ5Ci0gaGVuY2UgdGhlIGFiaWxpdHkgdG8gZmFs
bCBiYWNrLiBCdXQgSSdtIG5vdCBhd2FyZSBvZiBhbnkgaGFyZHdhcmUgbGlrZQp0aGF0LgoKPj4K
Pj4gLS0tCj4+ICBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgICAgIHwgIDggKysr
KystLS0KPj4gIHhlbi9hcmNoL3g4Ni9lODIwLmMgICAgICAgICAgICAgICAgICAgfCAyMCArKysr
KysrKysrKysrKysrKysrKwo+PiAgeGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZy1zaGFyZWQu
YyB8IDM0ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvZTgyMC5oICAgICAgICAgICAgfCAgMSArCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDQ2
IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9t
aXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUu
cGFuZG9jCj4+IGluZGV4IDdjNzJlMzEuLmYxM2IxMGMgMTAwNjQ0Cj4+IC0tLSBhL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MKPj4gQEAgLTE0MjQsMTEgKzE0MjQsMTMgQEAgb3JkaW5hcnkgRG9tVSwgY29u
dHJvbCBkb21haW4sIGhhcmR3YXJlIGRvbWFpbiwgYW5kIC0gd2hlbiBzdXBwb3J0ZWQKPj4gIGJ5
IHRoZSBwbGF0Zm9ybSAtIERvbVUgd2l0aCBwYXNzLXRocm91Z2ggZGV2aWNlIGFzc2lnbmVkKS4K
Pj4gIAo+PiAgIyMjIG1tY2ZnICh4ODYpCj4+IC0+IGA9IDxib29sZWFuPlssYW1kLWZhbTEwXWAK
Pj4gKz4gYD0gTGlzdCBvZiBbIDxib29sZWFuPiwgZm9yY2UsIGFtZC1mYW0xMCBdYAo+PiAgCj4+
IC0+IERlZmF1bHQ6IGAxYAo+PiArPiBEZWZhdWx0OiBgdHJ1ZSxmb3JjZWAKPj4gIAo+PiAtU3Bl
Y2lmeSBpZiB0aGUgTU1Db25maWcgc3BhY2Ugc2hvdWxkIGJlIGVuYWJsZWQuCj4+ICtTcGVjaWZ5
IGlmIHRoZSBNTUNvbmZpZyBzcGFjZSBzaG91bGQgYmUgZW5hYmxlZC4gSWYgZm9yY2Ugb3B0aW9u
IGlzIHNwZWNpZmllZAo+PiArKGRlZmF1bHQpIE1NQ29uZmlnIHNwYWNlIHdpbGwgYmUgdXNlZCBi
eSBYZW4gZWFybHkgaW4gYm9vdCBldmVuIGlmIGl0J3MKPj4gK25vdCByZXNlcnZlZCBieSBmaXJt
d2FyZSBpbiB0aGUgRTgyMCB0YWJsZS4KPj4gIAo+PiAgIyMjIG1taW8tcmVsYXggKHg4NikKPj4g
ID4gYD0gPGJvb2xlYW4+IHwgYWxsYAo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAu
YyBiL3hlbi9hcmNoL3g4Ni9lODIwLmMKPj4gaW5kZXggOGU4YTJjNC4uZWRlZjcyYSAxMDA2NDQK
Pj4gLS0tIGEveGVuL2FyY2gveDg2L2U4MjAuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvZTgyMC5j
Cj4+IEBAIC0zNyw2ICszNywyNiBAQCBzdHJ1Y3QgZTgyMG1hcCBlODIwOwo+PiAgc3RydWN0IGU4
MjBtYXAgX19pbml0ZGF0YSBlODIwX3JhdzsKPj4gIAo+PiAgLyoKPj4gKyAqIFRoaXMgZnVuY3Rp
b24gY2hlY2tzIGlmIGFueSBwYXJ0IG9mIHRoZSByYW5nZSA8c3RhcnQsZW5kPiBpcyBtYXBwZWQK
Pj4gKyAqIHdpdGggdHlwZS4KPj4gKyAqLwo+PiAraW50IF9faW5pdCBlODIwX2FueV9tYXBwZWQo
dTY0IHN0YXJ0LCB1NjQgZW5kLCB1bnNpZ25lZCB0eXBlKQo+IAo+IFBsZWFzZSB1c2UgdWludDY0
X3QgYW5kIHVuc2lnbmVkIGludC4gQWxzbyBpdCBsb29rcyBsaWtlIHRoaXMKPiBmdW5jdGlvbiB3
YW50cyB0byByZXR1cm4gYSBib29sIGluc3RlYWQgb2YgYW4gaW50Lgo+IAoKVGhlIHByb2JsZW0g
aGVyZSBpcyB0aGF0IEkgd2FudCB0aGlzIGZ1bmN0aW9uIGJlIHNpbWlsYXIgdG8gdGhlIG9uZQpi
ZWxvdyAoZTgyMF9hbGxfbWFwcGVkKSB3aGljaCBpcyBjb3BpZWQgZnJvbSBMaW51eCBhcyB3ZWxs
IGFzIHRoZSByZXN0Cm9mIHRoZSBmaWxlLiBBdCB0aGUgc2FtZSB0aW1lIEkgZG9uJ3Qgd2FudCB0
byBpbnRyb2R1Y2UgY29kZSBjaHVybgpmaXhpbmcgdW5yZWxhdGVkIHN0eWxlIGlzc3Vlcy4gUGVy
aGFwcyBpdCdzIGJldHRlciB0byBrZWVwIHN0eWxlIG9mIHRoaXMKZnVuY3Rpb24gYXMgaXM/IE9y
IGRvIHlvdSB0aGluayBpdCdzIHN0aWxsIGJldHRlciB0byB1bmlmeSB0aGUgc3R5bGUKYWNyb3Nz
IGJvdGggb2YgdGhlbSAocGVyaGFwcyBpbiBhIHNlcGFyYXRlIGNvbW1pdCk/Cgo+PiArewo+PiAr
ICAgICAgIGludCBpOwo+IAo+IHVuc2lnbmVkIGludC4KPiAKPj4gKwo+PiArICAgICAgIGZvciAo
aSA9IDA7IGkgPCBlODIwLm5yX21hcDsgaSsrKSB7Cj4gCj4gQ29kaW5nIHN0eWxlLiBTb21lIHBh
cnRzIG9mIHRoaXMgZmlsZSBhcmUgdXNpbmcgdGhlIExpbnV4IGNvZGluZwo+IHN0eWxlIEkgdGhp
bmssIGJ1dCBuZXcgYWRkaXRpb25zIHNob3VsZCBiZSB1c2luZyB0aGUgWGVuIGNvZGluZwo+IHN0
eWxlLCBzZWUgZTgyMF9jaGFuZ2VfcmFuZ2VfdHlwZSBmb3IgZXhhbXBsZS4KPiAKPj4gKyAgICAg
ICAgICAgICAgIHN0cnVjdCBlODIwZW50cnkgKmVpID0gJmU4MjAubWFwW2ldOwo+IAo+IGNvbnN0
Lgo+IAo+PiArCj4+ICsgICAgICAgICAgICAgICBpZiAodHlwZSAmJiBlaS0+dHlwZSAhPSB0eXBl
KQo+PiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4gKyAgICAgICAgICAgICAg
IGlmIChlaS0+YWRkciA+PSBlbmQgfHwgZWktPmFkZHIgKyBlaS0+c2l6ZSA8PSBzdGFydCkKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+ICsgICAgICAgICAgICAgICByZXR1
cm4gMTsKPj4gKyAgICAgICB9Cj4+ICsgICAgICAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gKy8q
Cj4+ICAgKiBUaGlzIGZ1bmN0aW9uIGNoZWNrcyBpZiB0aGUgZW50aXJlIHJhbmdlIDxzdGFydCxl
bmQ+IGlzIG1hcHBlZCB3aXRoIHR5cGUuCj4+ICAgKgo+PiAgICogTm90ZTogdGhpcyBmdW5jdGlv
biBvbmx5IHdvcmtzIGNvcnJlY3QgaWYgdGhlIGU4MjAgdGFibGUgaXMgc29ydGVkIGFuZAo+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZy1zaGFyZWQuYyBiL3hlbi9h
cmNoL3g4Ni94ODZfNjQvbW1jb25maWctc2hhcmVkLmMKPj4gaW5kZXggY2MwOGI1Mi4uOWZjMDg2
NSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZy1zaGFyZWQuYwo+
PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tY29uZmlnLXNoYXJlZC5jCj4+IEBAIC0yNiwz
MyArMjYsMzQgQEAKPj4gIAo+PiAgI2luY2x1ZGUgIm1tY29uZmlnLmgiCj4+ICAKPj4gK3N0YXRp
YyBib29sX3QgX19yZWFkX21vc3RseSBmb3JjZV9tbWNmZyA9IHRydWU7Cj4+ICB1bnNpZ25lZCBp
bnQgcGNpX3Byb2JlID0gUENJX1BST0JFX0NPTkYxIHwgUENJX1BST0JFX01NQ09ORjsKPj4gIAo+
PiAgc3RhdGljIGludCBfX2luaXQgcGFyc2VfbW1jZmcoY29uc3QgY2hhciAqcykKPj4gIHsKPj4g
ICAgICBjb25zdCBjaGFyICpzczsKPj4gLSAgICBpbnQgcmMgPSAwOwo+PiArICAgIGludCB2YWws
IHJjID0gMDsKPj4gIAo+PiAgICAgIGRvIHsKPj4gICAgICAgICAgc3MgPSBzdHJjaHIocywgJywn
KTsKPj4gICAgICAgICAgaWYgKCAhc3MgKQo+PiAgICAgICAgICAgICAgc3MgPSBzdHJjaHIocywg
J1wwJyk7Cj4+ICAKPj4gLSAgICAgICAgc3dpdGNoICggcGFyc2VfYm9vbChzLCBzcykgKQo+PiAt
ICAgICAgICB7Cj4+IC0gICAgICAgIGNhc2UgMDoKPj4gLSAgICAgICAgICAgIHBjaV9wcm9iZSAm
PSB+UENJX1BST0JFX01NQ09ORjsKPj4gLSAgICAgICAgICAgIGJyZWFrOwo+PiAtICAgICAgICBj
YXNlIDE6Cj4+IC0gICAgICAgICAgICBicmVhazsKPj4gLSAgICAgICAgZGVmYXVsdDoKPj4gLSAg
ICAgICAgICAgIGlmICggIWNtZGxpbmVfc3RyY21wKHMsICJhbWRfZmFtMTAiKSB8fAo+PiAtICAg
ICAgICAgICAgICAgICAhY21kbGluZV9zdHJjbXAocywgImFtZC1mYW0xMCIpICkKPj4gKyAgICAg
ICAgaWYgKCAodmFsID0gcGFyc2VfYm9vbChzLCBzcykpID49IDAgKSB7Cj4+ICsgICAgICAgICAg
ICBpZiAoIHZhbCApCj4+ICsgICAgICAgICAgICAgICBwY2lfcHJvYmUgfD0gUENJX1BST0JFX01N
Q09ORjsKPj4gKyAgICAgICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgICAgIHBjaV9wcm9iZSAm
PSB+UENJX1BST0JFX01NQ09ORjsKPj4gKyAgICAgICAgfSBlbHNlIGlmICggKHZhbCA9IHBhcnNl
X2Jvb2xlYW4oImFtZF9mYW0xMCIsIHMsIHNzKSkgPj0gMCB8fAo+PiArICAgICAgICAgICAgICAg
ICAgICAodmFsID0gcGFyc2VfYm9vbGVhbigiYW1kLWZhbTEwIiwgcywgc3MpKSA+PSAwICkgewo+
PiArICAgICAgICAgICAgaWYgKCB2YWwgKQo+PiAgICAgICAgICAgICAgICAgIHBjaV9wcm9iZSB8
PSBQQ0lfQ0hFQ0tfRU5BQkxFX0FNRF9NTUNPTkY7Cj4+ICAgICAgICAgICAgICBlbHNlCj4+IC0g
ICAgICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwo+PiAtICAgICAgICAgICAgYnJlYWs7Cj4+IC0g
ICAgICAgIH0KPj4gKyAgICAgICAgICAgICAgICBwY2lfcHJvYmUgJj0gflBDSV9DSEVDS19FTkFC
TEVfQU1EX01NQ09ORjsKPj4gKyAgICAgICAgfSBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xl
YW4oImZvcmNlIiwgcywgc3MpKSA+PSAwKQo+PiArICAgICAgICAgICAgZm9yY2VfbW1jZmcgPSB2
YWw7Cj4gCj4gWW91IGNvdWxkIGFsc28gY29uc2lkZXIgYWRkaW5nIGEgbmV3IGZsYWcgdG8gcGNp
X3Byb2JlLCBpZToKPiBQQ0lfUFJPQkVfRk9SQ0VfTU1DRkcuCgpJIHdhcyB0aGlua2luZyBhYm91
dCB0aGF0IHRvby4gV2lsbCBzd2l0Y2ggdG8gdGhhdCBtZXRob2QgaWYgeW91IHRoaW5rCnRoYXQg
aXMgYmV0dGVyLgoKPj4gKyAgICAgICAgZWxzZQo+PiArICAgICAgICAgICAgcmMgPSAtRUlOVkFM
Owo+PiAgCj4+ICAgICAgICAgIHMgPSBzcyArIDE7Cj4+ICAgICAgfSB3aGlsZSAoICpzcyApOwo+
PiBAQCAtMzU1LDYgKzM1NiwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBpc19tbWNvbmZfcmVzZXJ2
ZWQoCj4+ICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGludCljZmctPnN0YXJ0X2J1c19u
dW1iZXIsCj4+ICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGludCljZmctPmVuZF9idXNf
bnVtYmVyKTsKPj4gICAgICAgICAgfQo+PiArICAgIH0gZWxzZSBpZiAoIWU4MjBfYW55X21hcHBl
ZChhZGRyLCBhZGRyICsgb2xkX3NpemUgLSAxLCAwKSkgewo+IAo+IEkgdGhpbmsgaXQgc2hvdWxk
IGJlIGZpbmUgdG8gYWxzbyBhY2NlcHQgYSBNTUNGRyBhcmVhIHRoYXQncyBwYXJ0aWFsbHkKPiBy
ZXNlcnZlZCBhbmQgcGFydGlhbGx5IGEgaG9sZSBpbiB0aGUgbWVtb3J5IG1hcD8KPiAKPiBBRkFJ
Q1QgdGhlIHByb3Bvc2VkIGNvZGUgd2lsbCBvbmx5IGFjY2VwdCBNTUNGRyByZWdpb25zIHRoYXQg
YXJlCj4gZnVsbHkgaW4gYSBtZW1vcnkgbWFwIGhvbGUuCgpXaGF0IGNhc2UgcGFydGljdWxhcmx5
IGFyZSB5b3UgcmVmZXJyaW5nIHRvPyBQYXJ0aWFsbHkgY292ZXJlZCBjYXNlIGlzCmhhbmRsZWQg
YWJvdmUgd2hlcmUgdGhlIGJlZ2lubmluZyBvZiByZXNlcnZlZCByZWdpb24gY29ycmVzcG9uZHMg
dG8gdGhlCmJlZ2lubmluZyBvZiB0aGUgdGFibGUuIE90aGVyIHRoYW4gdGhhdCAoaWYgYSByZXNl
cnZlZCByZWdpb24gaXMKcmFuZG9tbHkgbG9jYXRlZCB3aXRoaW4gYSByZXBvcnRlZCBhcmVhKSBJ
IHRoaW5rIGlzIHRvdGFsbHkgYW1iaWd1b3VzCmFuZCBzaG91bGQgYmUgY29uc2lkZXJlZCBicm9r
ZW4uCgpJZ29yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
