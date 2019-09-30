Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC86C240E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:15:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExLE-00086h-0w; Mon, 30 Sep 2019 15:12:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QDh0=XZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iExLB-00086c-WF
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:11:58 +0000
X-Inumbo-ID: a18415a2-e394-11e9-96d7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id a18415a2-e394-11e9-96d7-12813bfff9fa;
 Mon, 30 Sep 2019 15:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569856312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iVzIB8sHlu121+LXZeWNLiExWwrt/YnjY/fMEORTHNs=;
 b=hJ8qnkhYuVWhfPwzyKhP8MupZOWDIweg8f65EiKDrIiIbrnctcpi03zc
 mPHbQtPxuQwtIbozTzM/zamxImQgKF9oAUCImV+/nYispR6ti2dcq8J4o
 g5tLw1rkJVuI+6xlUi18Td2DLZ2yEB51WWhteUrc3kxRWuV3iBY7ejfSC I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 96rWlXPLOoDJZsNoph/LHtFBV7wLiTS3a/6CUSxovg/bdpAXW55DvruVobSZpSmm7WZjqzhMgc
 JIVBPI8Md7kWBip9h55DPSJnxOEo432KN+imYZifGHnyzikOzmoKExGV6JTuImlKixuEqsVuGd
 hVhIomezOJCR7mXpEGn7OAIHr16sebWDk6S+/i7qmabm/mcoeX6+YPEy50gjLFxc9IO8hTsoDI
 1mSx2Spq1npEzzOHVgEytTYIJQ3Kgs/oRFqm9Gcdlv0nA8guTVFq/6tm/6fY4+r7lT782lhgHd
 rHU=
X-SBRS: 2.7
X-MesageID: 6609858
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6609858"
Date: Mon, 30 Sep 2019 16:11:49 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190930151149.GE1163@perard.uk.xensource.com>
References: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
 <66a544b7e292dfe227349ffcc75a0136ca27afb1.1569680095.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66a544b7e292dfe227349ffcc75a0136ca27afb1.1569680095.git-series.marmarek@invisiblethingslab.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH v8 3/4] libxl: attach PCI device to qemu
 only after setting pciback/pcifront
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBTZXAgMjgsIDIwMTkgYXQgMDQ6MjA6MzZQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFdoZW4gcWVtdSBpcyBydW5uaW5nIGluIHN0dWJkb21haW4s
IGhhbmRsaW5nICJwY2ktaW5zIiBjb21tYW5kIHdpbGwgZmFpbAo+IGlmIHBjaWZyb250IGlzIG5v
dCBpbml0aWFsaXplZCBhbHJlYWR5LiBGaXggdGhpcyBieSBzZW5kaW5nIHN1Y2ggY29tbWFuZAo+
IG9ubHkgYWZ0ZXIgY29uZmlybWluZyB0aGF0IHBjaWJhY2svZnJvbnQgaXMgcnVubmluZy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEZpeGVkIGNv
ZGUgc3R5bGUgc2luY2UgcHJldmlvdXMgdmVyc2lvbi4KPiBDaGFuZ2VzIGluIHY4Ogo+IC0gcmVi
YXNlIG9uIHN0YWdpbmcKPiAtIHJld29yayBmb3IgYXN5bmMgYXBpCgpUaGUgcGF0Y2ggbG9va3Mg
Z29vZCwgSSBvbmx5IGhhdmUgY29kaW5nIHN0eWxlIGNvbW1lbnRzLiBXaXRoIHRob3NlCmFkZHJl
c3NlZDoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPgoKCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3BjaS5jIGIvdG9vbHMvbGli
eGwvbGlieGxfcGNpLmMKPiBpbmRleCBhYzU5N2E1Li5iYTAyODdkIDEwMDY0NAo+IC0tLSBhL3Rv
b2xzL2xpYnhsL2xpYnhsX3BjaS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcGNpLmMKPiBA
QCAtMTQ4Nyw2ICsxNDkwLDEwIEBAIHN0YXRpYyBpbnQgbGlieGxfcGNpZGV2X2Fzc2lnbmFibGUo
bGlieGxfY3R4ICpjdHgsIGxpYnhsX2RldmljZV9wY2kgKnBjaWRldikKPiAgICAgIHJldHVybiBp
ICE9IG51bTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9hZGRfc3R1YmRvbV93
YWl0KGxpYnhsX19lZ2MgKmVnYywKPiArICAgIHBjaV9hZGRfc3RhdGUgKnBhcywgaW50IHJjKTsK
PiArc3RhdGljIHZvaWQgZGV2aWNlX3BjaV9hZGRfc3R1YmRvbV9yZWFkeShsaWJ4bF9fZWdjICpl
Z2MsCj4gKyAgICBsaWJ4bF9fZXZfZGV2c3RhdGUqIGRzLCBpbnQgcmMpOwoKcy8qIGRzLyAqZHMv
Cgo+ICBzdGF0aWMgdm9pZCBkZXZpY2VfcGNpX2FkZF9zdHViZG9tX2RvbmUobGlieGxfX2VnYyAq
ZWdjLAo+ICAgICAgcGNpX2FkZF9zdGF0ZSAqLCBpbnQgcmMpOwo+ICBzdGF0aWMgdm9pZCBkZXZp
Y2VfcGNpX2FkZF9kb25lKGxpYnhsX19lZ2MgKmVnYywKPiBAQCAtMTU3NSw2ICsxNTgzLDQxIEBA
IG91dDoKPiAgICAgIGRldmljZV9wY2lfYWRkX2RvbmUoZWdjLCBwYXMsIHJjKTsgLyogbXVzdCBi
ZSBsYXN0ICovCj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIGRldmljZV9wY2lfYWRkX3N0dWJkb21f
d2FpdChsaWJ4bF9fZWdjICplZ2MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwY2lfYWRkX3N0YXRlICpwYXMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpbnQgcmMpCj4gK3sKPiArICAgIGxpYnhsX19hb19kZXZpY2UgKmFvZGV2
ID0gcGFzLT5hb2RldjsKPiArICAgIFNUQVRFX0FPX0dDKGFvZGV2LT5hbyk7Cj4gKyAgICBsaWJ4
bF9jdHggKmN0eCA9IGxpYnhsX19nY19vd25lcihnYyk7Cj4gKyAgICBpbnQgc3R1YmRvbWlkID0g
bGlieGxfZ2V0X3N0dWJkb21faWQoY3R4LCBwYXMtPmRvbWlkKTsKCllvdSBjYW4gdXNlIGBDVFgn
IGluc3RlYWQgb2YgZGVjbGFyaW5nIGEgbG9jYWwgYGN0eCcKCj4gKyAgICBjaGFyICpzdGF0ZV9w
YXRoOwo+ICsKPiArICAgIGlmIChyYykgZ290byBvdXQ7Cj4gKwo+ICsgICAgLyogV2FpdCBmb3Ig
dGhlIGRldmljZSBhY3R1YWxseSBiZWluZyBjb25uZWN0ZWQsIG90aGVyd2lzZSBkZXZpY2UgbW9k
ZWwKPiArICAgICAqIHJ1bm5pbmcgdGhlcmUgd2lsbCBmYWlsIHRvIGZpbmQgdGhlIGRldmljZS4g
Ki8KPiArICAgIHN0YXRlX3BhdGggPSBsaWJ4bF9fc3ByaW50ZihnYywgIiVzL2JhY2tlbmQvcGNp
LyVkLzAvc3RhdGUiLAo+ICsgICAgICAgICAgICBsaWJ4bF9feHNfZ2V0X2RvbXBhdGgoZ2MsIDAp
LCBzdHViZG9taWQpOwoKSSB0aGluayB5b3UgY291bGQgdXNlIGxpYnhsX19kb21haW5fZGV2aWNl
X2JhY2tlbmRfcGF0aChnYywgMCwKc3R1YmRvbWlkLCAwLCBMSUJYTF9fREVWSUNFX0tJTkRfUENJ
KSBoZXJlIGluc3RlYWQuCk9yIGF0IGxlYXN0ICJHQ1NQUklOVEYoIiBpbnN0ZWFkIG9mICJsaWJ4
bF9fc3ByaW50ZihnYywgIgoKPiArICAgIHJjID0gbGlieGxfX2V2X2RldnN0YXRlX3dhaXQoYW9k
ZXYtPmFvLCAmcGFzLT5wY2liYWNrX2RzLAoKWW91IGNhbiB1c2UgYGFvJyBpbnN0ZWFkIG9mIGBh
b2Rldi0+YW8nLiBgYW8nIGlzIGRlY2xlYXJlZCBieQpTVEFURV9BT19HQygpLgoKPiArICAgICAg
ICAgICAgZGV2aWNlX3BjaV9hZGRfc3R1YmRvbV9yZWFkeSwKPiArICAgICAgICAgICAgc3RhdGVf
cGF0aCwgWGVuYnVzU3RhdGVDb25uZWN0ZWQsCj4gKyAgICAgICAgICAgIExJQlhMX0RFVklDRV9N
T0RFTF9TVEFSVF9USU1FT1VUICogMTAwMCk7CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
