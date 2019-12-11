Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5EA11AA2E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:49:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0SK-0002lV-VE; Wed, 11 Dec 2019 11:47:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irg7=2B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1if0SJ-0002lQ-TB
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:46:59 +0000
X-Inumbo-ID: f00a330a-1c0b-11ea-88e7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f00a330a-1c0b-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 11:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576064819;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P2MU3njNrfLJrdt+eLEGCcK2Oa2o5yX8/PbMswCYaNY=;
 b=Gj91FSbu2p3T7aec5OjUxskshJUpOD44qW5++mOO4/aCuQo4yvK0LVWi
 RNTAv2X+KvSJgOXKtO/njmW3eZlxjT0xQs1nXCfaryp4u4p48NfeOHQ0B
 AmRVa13lmu4uJhtB8yYdMH6Ym3U8iSyHvkyZ7iI88qXQtZEMFpKNnz4+u k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +HzPxT1PiH2ZjG1A/5a+YfO0CQqZIrbFt+4gfS5zEDuQYbwMbYZYsNOOKCizsr554KZiOjCygs
 lC2iM+TIgx2nXizoG7CSDvtJnMffNrKLFkPiCOxaZV7OnKRWcZraFooL9oay3qh/l9F12vzA22
 GlaJKSzUlO7b0z0fwM1eZc6/6QrTXWc+AsVZnSJvm3l741QORu7LTBzAyuGFDVuzkUPKRb+l50
 OxylbBCvU/JBgcN5Pu/VNJuqpoyKvQ0mgmGJVaIwgzQyYjS7NnTS1r3DryE40Ex1bVlu8ASGoG
 +eA=
X-SBRS: 2.7
X-MesageID: 9513342
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,301,1571716800"; 
   d="scan'208";a="9513342"
Date: Wed, 11 Dec 2019 12:46:51 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191211114651.GN980@Air-de-Roger>
References: <20191211042428.5961-1-sjpark@amazon.de>
 <20191211042657.6037-1-sjpark@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211042657.6037-1-sjpark@amazon.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v6 1/3] xenbus/backend: Add memory pressure
 handler callback
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
Cc: jgross@suse.com, axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae
 Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDQ6MjY6NTdBTSArMDAwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBHcmFudGluZyBwYWdlcyBjb25zdW1lcyBiYWNrZW5kIHN5c3RlbSBtZW1vcnkuICBJ
biBzeXN0ZW1zIGNvbmZpZ3VyZWQKPiB3aXRoIGluc3VmZmljaWVudCBzcGFyZSBtZW1vcnkgZm9y
IHRob3NlIHBhZ2VzLCBpdCBjYW4gY2F1c2UgYSBtZW1vcnkKPiBwcmVzc3VyZSBzaXR1YXRpb24u
ICBIb3dldmVyLCBmaW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
IHMvdGhlLy8KPiBtZW1vcnkgaXMgY2hhbGxlbmdpbmcgZm9yIGxhcmdlIHN5c3RlbXMgaGF2aW5n
IGR5bmFtaWMgcmVzb3VyY2UKPiB1dGlsaXphdGlvbiBwYXR0ZXJucy4gIEFsc28sIHN1Y2ggYSBz
dGF0aWMgY29uZmlndXJhdGlvbiBtaWdodCBsYWNrCj4gZmxleGliaWxpdHkuCj4gCj4gVG8gbWl0
aWdhdGUgc3VjaCBwcm9ibGVtcywgdGhpcyBjb21taXQgYWRkcyBhIG1lbW9yeSByZWNsYWltIGNh
bGxiYWNrIHRvCj4gJ3hlbmJ1c19kcml2ZXInLiAgSWYgYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0
ZWN0ZWQsICd4ZW5idXMnIHJlcXVlc3RzCiAgICAgICAgICAgICAgICAgICAgICAgXiBzL2EvLwo+
IGV2ZXJ5IGJhY2tlbmQgZHJpdmVyIHRvIHZvbHVuYXJpbHkgcmVsZWFzZSBpdHMgbWVtb3J5Lgo+
IAo+IE5vdGUgdGhhdCBpdCB3b3VsZCBiZSBhYmxlIHRvIGltcHJvdmUgdGhlIGNhbGxiYWNrIGZh
Y2lsaXR5IGZvciBtb3JlCiAgICAgICAgICAgICAgICAgICAgICAgIF4gcG9zc2libGUKPiBzb3Bo
aXN0aWNhdGVkIGhhbmRsaW5ncyBvZiBnZW5lcmFsIHByZXNzdXJlcy4gIEZvciBleGFtcGxlLCBp
dCB3b3VsZCBiZQogICAgICAgICAgICAgICAgXiBoYW5kbGluZyBvZiByZXNvdXJjZSBzdGFydmF0
aW9uLgo+IHBvc3NpYmxlIHRvIG1vbml0b3IgdGhlIG1lbW9yeSBjb25zdW1wdGlvbiBvZiBlYWNo
IGRldmljZSBhbmQgaXNzdWUgdGhlCj4gcmVsZWFzZSByZXF1ZXN0cyB0byBvbmx5IGRldmljZXMg
d2hpY2ggY2F1c2luZyB0aGUgcHJlc3N1cmUuICBBbHNvLCB0aGUKPiBjYWxsYmFjayBjb3VsZCBi
ZSBleHRlbmRlZCB0byBoYW5kbGUgbm90IG9ubHkgbWVtb3J5LCBidXQgZ2VuZXJhbAo+IHJlc291
cmNlcy4gIE5ldmVydGhlbGVzcywgdGhpcyB2ZXJzaW9uIG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBk
ZWZlcnMgc3VjaAo+IHNvcGhpc3RpY2F0ZWQgZ29hbHMgYXMgYSBmdXR1cmUgd29yay4KPiAKPiBS
ZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+Cj4gLS0tCj4gIGRyaXZlcnMveGVu
L3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysr
KysKPiAgaW5jbHVkZS94ZW4veGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1
cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCj4gaW5kZXggYjBiZWQ0ZmFmNDRjLi5hZWRiZTIxOThk
ZTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5k
LmMKPiArKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwo+IEBA
IC0yNDgsNiArMjQ4LDM1IEBAIHN0YXRpYyBpbnQgYmFja2VuZF9wcm9iZV9hbmRfd2F0Y2goc3Ry
dWN0IG5vdGlmaWVyX2Jsb2NrICpub3RpZmllciwKPiAgCXJldHVybiBOT1RJRllfRE9ORTsKPiAg
fQo+ICAKPiArc3RhdGljIGludCB4ZW5idXNfYmFja2VuZF9yZWNsYWltKHN0cnVjdCBkZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSkKCk5vIG5lZWQgZm9yIHRoZSB4ZW5idXNfIHByZWZpeCBzaW5jZSBp
dCdzIGEgc3RhdGljIGZ1bmN0aW9uLCBpZToKYmFja2VuZF9yZWNsYWltX21lbW9yeSBzaG91bGQg
YmUgZmluZSBJTU8uCgo+ICt7Cj4gKwlzdHJ1Y3QgeGVuYnVzX2RyaXZlciAqZHJ2OwoKSSd2ZSBh
c2tlZCBmb3IgdGhpcyB2YXJpYWJsZSB0byBiZSBjb25zdGlmaWVkIGluIHY1LCBpcyBpdCBub3QK
cG9zc2libGUgdG8gbWFrZSBpdCBjb25zdD8KCj4gKwo+ICsJaWYgKCFkZXYtPmRyaXZlcikKPiAr
CQlyZXR1cm4gMDsKPiArCWRydiA9IHRvX3hlbmJ1c19kcml2ZXIoZGV2LT5kcml2ZXIpOwo+ICsJ
aWYgKGRydiAmJiBkcnYtPnJlY2xhaW0pCj4gKwkJZHJ2LT5yZWNsYWltKHRvX3hlbmJ1c19kZXZp
Y2UoZGV2KSk7Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArLyoKPiArICogUmV0dXJucyAwIGFs
d2F5cyBiZWNhdXNlIHdlIGFyZSB1c2luZyBzaHJpbmtlciB0byBvbmx5IGRldGVjdCBtZW1vcnkK
PiArICogcHJlc3N1cmUuCj4gKyAqLwo+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyB4ZW5idXNfYmFj
a2VuZF9zaHJpbmtfY291bnQoc3RydWN0IHNocmlua2VyICpzaHJpbmtlciwKPiArCQkJCXN0cnVj
dCBzaHJpbmtfY29udHJvbCAqc2MpCj4gK3sKPiArCWJ1c19mb3JfZWFjaF9kZXYoJnhlbmJ1c19i
YWNrZW5kLmJ1cywgTlVMTCwgTlVMTCwKPiArCQkJeGVuYnVzX2JhY2tlbmRfcmVjbGFpbSk7Cj4g
KwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIHN0cnVjdCBzaHJpbmtlciB4ZW5idXNfYmFj
a2VuZF9zaHJpbmtlciA9IHsKCkkgd291bGQgZHJvcCB0aGUgeGVuYnVzIHByZWZpeCwgYW5kIEkg
dGhpbmsgaXQncyBub3QgcG9zc2libGUgdG8KY29uc3RpZnkgdGhpcyBkdWUgdG8gcmVnaXN0ZXJf
c2hyaW5rZXIgZXhwZWN0aW5nIGEgbm9uLWNvbnN0CnBhcmFtZXRlcj8KCj4gKwkuY291bnRfb2Jq
ZWN0cyA9IHhlbmJ1c19iYWNrZW5kX3Nocmlua19jb3VudCwKPiArCS5zZWVrcyA9IERFRkFVTFRf
U0VFS1MsCj4gK307Cj4gKwo+ICBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNfcHJvYmVfYmFja2Vu
ZF9pbml0KHZvaWQpCj4gIHsKPiAgCXN0YXRpYyBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgeGVuc3Rv
cmVfbm90aWZpZXIgPSB7Cj4gQEAgLTI2NCw2ICsyOTMsOSBAQCBzdGF0aWMgaW50IF9faW5pdCB4
ZW5idXNfcHJvYmVfYmFja2VuZF9pbml0KHZvaWQpCj4gIAo+ICAJcmVnaXN0ZXJfeGVuc3RvcmVf
bm90aWZpZXIoJnhlbnN0b3JlX25vdGlmaWVyKTsKPiAgCj4gKwlpZiAocmVnaXN0ZXJfc2hyaW5r
ZXIoJnhlbmJ1c19iYWNrZW5kX3Nocmlua2VyKSkKPiArCQlwcl93YXJuKCJzaHJpbmtlciByZWdp
c3RyYXRpb24gZmFpbGVkXG4iKTsKCkNhbiB5b3UgYWRkIGEgeGVuYnVzIHByZWZpeCB0byB0aGUg
ZXJyb3IgbWVzc2FnZT8gT3IgZWxzZSBpdCdzIGhhcmQgdG8Ka25vdyB3aGljaCBzdWJzeXN0ZW0g
aXMgY29tcGxhaW5pbmcgd2hlbiB5b3Ugc2VlIHN1Y2ggbWVzc2FnZSBvbiB0aGUKbG9nLiBpZTog
InhlbmJ1czogc2hyaW5rZXIgLi4uIgoKPiArCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICBzdWJzeXNf
aW5pdGNhbGwoeGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5pdCk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUveGVuL3hlbmJ1cy5oIGIvaW5jbHVkZS94ZW4veGVuYnVzLmgKPiBpbmRleCA4NjljODE2ZDVm
OGMuLjE5NjI2MDAxNzY2NiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3hlbi94ZW5idXMuaAo+ICsr
KyBiL2luY2x1ZGUveGVuL3hlbmJ1cy5oCj4gQEAgLTEwNCw2ICsxMDQsNyBAQCBzdHJ1Y3QgeGVu
YnVzX2RyaXZlciB7Cj4gIAlzdHJ1Y3QgZGV2aWNlX2RyaXZlciBkcml2ZXI7Cj4gIAlpbnQgKCpy
ZWFkX290aGVyZW5kX2RldGFpbHMpKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpOwo+ICAJaW50
ICgqaXNfcmVhZHkpKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpOwo+ICsJdm9pZCAoKnJlY2xh
aW0pKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpOwoKcmVjbGFpbV9tZW1vcnkgKGlmIEp1ZXJn
ZW4gYWdyZWVzKS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
