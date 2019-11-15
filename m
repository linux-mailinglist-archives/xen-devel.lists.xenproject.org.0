Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 387DCFE5E6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 20:46:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhVc-0000tc-Bp; Fri, 15 Nov 2019 19:43:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ISM0=ZH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iVhVa-0000tX-Nv
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 19:43:55 +0000
X-Inumbo-ID: 40d866c0-07e0-11ea-b678-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40d866c0-07e0-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573847034;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=MFwn49wqkMSPjzcYFWuyKH58HsQnBy9NotwFb75r3Do=;
 b=d1SBKnrfqB9/RCcMa7cv15OB+I4gcsXs3RHWX7L+S11FWINxwDZAZRs5
 4JFTzabvZbMKEXo76zhsnVaibQFyLrB9JolS3SzeGonY5bLBvDAuPiP8V
 HhQERMZ4HuGgfSfTPFCzB/7Vl8bVBz70yoXClRYfhmFjmkt2tuen9Wusn Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: r052Qp0hCmAfH6UCEsubo/nV5E3WNhGC5Ljllxg+g1W9qVqeNDYuJkAZjT3slM6Hh+G3y3MbLj
 yXOpEj/coOM4h7jbCKzY/QWg0ALxw7V1sQCU3+Yx9gngOsxooHLddhv3kRo9dEgZuziTlu7xp1
 Y9NAodd2Bg+3ReW2qkk1isQhvQfzy8CoI8PRvfFORciosieqHdiXF4Z6o8Q1OHRfg+3tBqFcw2
 Q9cnkyxoZzGfTKjaTdzt0FNZqQvVhfnRj3HEiuLPjzVDel/JhBaSjbRf7gQFo1I7kJ9Q0CJdLJ
 OVA=
X-SBRS: 2.7
X-MesageID: 8404723
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,309,1569297600"; 
   d="scan'208";a="8404723"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24014.65525.944108.509444@mariner.uk.xensource.com>
Date: Fri, 15 Nov 2019 19:43:49 +0000
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <CACvf2oUpk=bP4QB8c9QTPcomuOpYm88+G6Bm_DyFf2h_4_MFGA@mail.gmail.com>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <23968.39034.34800.276030@mariner.uk.xensource.com>
 <CACvf2oV6iFM6x1bs8JPT28Eqny0gARh8MtSTedbgAP-m9CTP=w@mail.gmail.com>
 <23968.46591.386956.861918@mariner.uk.xensource.com>
 <CACvf2oXrw9KdbYq__+Q7bSEPi7Gx8ZnjMTatQRj38Kw80-ywYA@mail.gmail.com>
 <CACvf2oXGzmZquomG5xH=DsCuybFR7b=k8HoOA-tU2ZytoJJfPg@mail.gmail.com>
 <CACvf2oUpk=bP4QB8c9QTPcomuOpYm88+G6Bm_DyFf2h_4_MFGA@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/2] libxl: introduce new backend type
 VINPUT
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
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiUmU6IFtQQVRDSCB2MSAxLzJdIGxpYnhsOiBpbnRy
b2R1Y2UgbmV3IGJhY2tlbmQgdHlwZSBWSU5QVVQiKToKPiAxLiBNb3ZlIFFFTVVfQkFDS0VORCBt
YWNybyB0byBsaWJ4bF9fZGV2aWNlX3R5cGUgc3RydWN0dXJlIGFzIGZ1bmN0aW9uCj4gICAgIGFu
ZCBsZXQgdGhlIGRldmljZSB0byBkZWNpZGUgaXQgaGFzIFFFTVUgYmFja2VuZDoKPiAKPiBzdHJ1
Y3QgbGlieGxfX2RldmljZV90eXBlIHsKPiAgICAgLi4uCj4gICAgIGRldmljZV9xZW11X2JhY2tl
bmRfZm5fdCBxZW11X2JhY2tlbmQKPiB9Cj4gCj4gSW4gdGhpcyBjYXNlLCBpbnRyb2R1Y2luZyBu
ZXcgZGV2aWNlIHR5cGUgZm9yIFZLQkQgaXMgbm90IG5lZWRlZC4gVGhlIFZLQkQKPiBkZXZpY2Ug
d2lsbCBjaGVjayBiYWNrZW5kIHR5cGUgWFMgZW50cnkgdG8gZGVmaW5lIHdoaWNoIGJhY2tlbmQg
aXMgcnVubmluZy4KClNvcnJ5IGZvciB0aGUgZGVsYXkgcmVwbHlpbmcuICBJbiB5b3VyIGVhcmxp
ZXIgbWFpbHMgSSBoYWQgdHJvdWJsZQpmaWd1cmluZyBvdXQgd2hhdCB5b3UgbWVhbnQgYnV0IHRo
aXMgbGl0dGxlIHZpZ25ldHRlIG1ha2VzIGl0IGNsZWFyIHRvCm1lLgoKSSB0aGluayB0aGUgcHJv
YmxlbSB5b3UgYXJlIHRyeWluZyB0byBzb2x2ZSBpcyB0aGlzOiBpbiB5b3VyIGNhc2UKUUVNVV9C
QUNLRU5EIG5lZWRzIHRvIGRlcGVuZCBvbiB0aGUgdmlzaWJsZSB2a2JfYmFja2VuZCBmaWVsZCwg
YnV0IHRoZQpkZXZpY2UtPmJhY2tlbmRfa2luZCBpcyBzZXQgdW5jb25kaXRpb25hbGx5IHRvIGp1
c3QgVktCID8KCkNvdWxkIHlvdSBzb2x2ZSB0aGlzIHByb2JsZW0gYnkgaW52ZW50aW5nIGEgbmV3
IGJhY2tlbmRfa2luZCwgYW5kCndyaXRpbmcgeW91ciBvd24gZnVuY3Rpb24gbGlieGxfX2Rldmlj
ZV9mcm9tX3ZrYiwgYW5kIHB1dHRpbmcKKmRpZmZlcmVudCogdmFsdWVzIGludG8gYmFja2VuZF9r
aW5kID8gIEkgdGhpbmsgdGhhdCBpcyB3aGF0CmJhY2tlbmRfa2luZCBpcyBmb3IuICBTZWUgZm9y
IGV4YW1wbGUgdmFyaW91cyBjb25zb2xlIGZ1bmN0aW9ucyBhbmQKYWxzbyBsaWJ4bF9fZGV2aWNl
X2Zyb21fZGlzay4KCj4gMi4gVXNlIHN0cmluZyB0eXBlIGZvciBWS0JEIGJhY2tlbmRfdHlwZSBm
aWVsZCBpbnN0ZWFkIG9mIGVudW0uIEl0IHdpbGwgYmUKPiBlbXB0eSBmb3IgUUVNVSBhbmQgZ2Vu
ZXJpYyBmb3IgInVzZXIgc3BhY2UiIGJhY2tlbmRzLgoKVGhpcyBzZWVtcyB3b3JzZS4KCj4gT24g
TW9uLCBPY3QgMjgsIDIwMTkgYXQgNDowNiBQTSBPbGVrc2FuZHIgR3J5dHNvdiA8YWwxaW1nQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBXZWQsIE9jdCAxNiwgMjAxOSBhdCA0OjI2IFBNIE9sZWtz
YW5kciBHcnl0c292IDxhbDFpbWdAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gW0lhbjpdCj4gPiA+
ID4gW09sZWtzYW5kcjpdCj4gPiA+ID4gPiBbSWFuOl0KPiA+ID4gPiA+ID4gSSBhbHNvIGRvbid0
IHVuZGVyc3RhbmQgd2h5IHRoZSAidXNlciBzcGFjZSIga2JkIGJhY2tlbmQgc2VlbXMgdG8gYmUK
PiA+ID4gPiA+ID4gImxpbnV4IiBpbiB0aGUgZW51bS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGFn
cmVlIHRoaXMgaXMgbm90IHNvIGdvb2QgbmFtZS4gQnV0IEkgZG9uJ3Qga25vdyBob3cgdG8gY2Fs
bAo+ID4gPiA+ID4gYmFja2VuZHMgd2hpY2ggYXJlIG5vdCBydW5uaW5nCj4gPiA+ID4gPiBpbnNp
ZGUgUUVNVSBpbiBnZW5lcmFsLgo+ID4gPiA+Cj4gPiA+ID4gSSB0aGluayB0aGlzIHdvdWxkIGJl
IHVzZWFibGUgb24gZnJlZWJzZCA/ICAibGludXgiIGRlZmluaXRlbHkgc2VlbXMKPiA+ID4gPiB3
cm9uZy4gIEkgc2VlIGl0IGhhc24ndCBiZWVuIGluIGEgcmVsZWFzZSBzbyBpdCBpcyBub3QgdG9v
IGxhdGUgdG8KPiA+ID4gPiByZW5hbWUgaXQsIHN1YmplY3QgdG8gZGlzY3Vzc2lvbiB3aXRoIEp1
ZXJnZW4gYXMgUk0uCi4uLgo+ID4gPiA+IE1heWJlICJsaW51eCIgc2hvdWxkIGJlICJ0cm9vcHMi
Li4uCj4gPiA+Cj4gPiA+IEl0IGRvZXNuJ3QgbG9vayBhcyBnZW5lcmljIHNvbHV0aW9uLiBJZiBz
b21lIHVzZXIgaW1wbGVtZW50cyBvd24gYmFja2VuZAo+ID4gPiBpdCBzaG91bGQgYWRkIG5ldyBl
bnRyeSBpbnRvIGJhY2tlbmQgdHlwZSBlbnVtLgoKV291bGQgeW91IGJlIHByZXBhcmVkIHRvIGNo
YW5nZSBpdCB0byAqc29tZXRoaW5nKiBlbHNlID8KCkFGQUlDVCBmcm9tIHRoZSBjb2RlIGl0IGp1
c3QgdXNlcyB3aGF0IHdvdWxkIHRoZSBgdXN1YWwnIHhlbnN0b3JlIHB2CmNvbnRyb2wgcGxhbmUg
cGF0aCBmb3IgYSBkZXZpY2UgY2FsbGVkICJ2a2IiID8KClNvIG1heWJlIHdlIGNvdWxkIGNhbGwg
aXQgInB2IiA/ICBJcyB0aGVyZSBhIHByb3RvY29sIGRvYyBJIHNob3VsZCBiZQpsb29raW5nIGF0
IHRoYXQgZGVmaW5lcyB0aGlzIHZrYiBpbnRlcmZhY2UgPwoKU29ycnkgc3RpbGwgdG8gYmUgc28g
Y29uZnVzZWQuCgpSZWdhcmRzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
