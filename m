Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF8711E0BF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 10:30:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifhEu-0000Ge-M7; Fri, 13 Dec 2019 09:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TBrU=2D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ifhEt-0000GZ-4l
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 09:27:59 +0000
X-Inumbo-ID: d49101f0-1d8a-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d49101f0-1d8a-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576229270;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=f+X38mKQSNA9F1owN4qTfTPlaJCpeqkXKbc60h1txgQ=;
 b=T0u2UpOsUku1+QCS++Ob9qG0Jh+4fOKSunJyjUVIKR4pneK1xOTsgUD/
 ZDlMwwSQv2Nbfh6kQSyQgeS766qNKfa3AcLgaGGwNY3OgDg7CKV5QI2F2
 g5yQWQgYWNpGF+wBU2g1Kx8GkBpdJ4wAtPeiW+2ZXDsOHXCmcVGSpTxEc o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mRR8mxiHNJiuEO4mhyjRrklq/JYbq60/KLbQGZxNas5+v41gcVCNPwnUWSx37kMe6XxeDxBJLB
 +b7DZQS14dbbgTZga8rDngFmMC3FmOFUSjo8Ceeq4m19Ciu0oKXgOpcmhdbWv5QIPvE4PL7up2
 xfuJRI0M3Wc8+Zg8T++qnNXev8hurdbeOQZhIn/Ex9zNkhnu8Ii05q0sCf6YgJXCVuhi7iUqGv
 Rd+j9O/c1P0YhRlJtMJGzgEuDaGNwhmdOzK+F4eT//M2Zu8t0Q2PsbB32PtRZ8N2n5WnULvX7/
 1Iw=
X-SBRS: 2.7
X-MesageID: 9639731
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9639731"
Date: Fri, 13 Dec 2019 10:27:42 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191213092742.GG11756@Air-de-Roger>
References: <20191212152757.GF11756@Air-de-Roger>
 <20191212160658.10466-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212160658.10466-1-sj38.park@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v7 2/3] xen/blkback: Squeeze page pools if a
 memory pressure is detected
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
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDU6MDY6NThQTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBPbiBUaHUsIDEyIERlYyAyMDE5IDE2OjI3OjU3ICswMTAwICJSb2dlciBQYXUgTW9u
bsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1i
bGtiYWNrL2Jsa2JhY2suYwo+ID4gPiBpbmRleCBmZDFlMTlmMWE0OWYuLjk4ODIzZDE1MDkwNSAx
MDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMKPiA+
ID4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMKPiA+ID4gQEAgLTE0
Miw2ICsxNDIsMjEgQEAgc3RhdGljIGlubGluZSBib29sIHBlcnNpc3RlbnRfZ250X3RpbWVvdXQo
c3RydWN0IHBlcnNpc3RlbnRfZ250ICpwZXJzaXN0ZW50X2dudCkKPiA+ID4gIAkJSFogKiB4ZW5f
YmxraWZfcGdyYW50X3RpbWVvdXQpOwo+ID4gPiAgfQo+ID4gPiAgCj4gPiA+ICsvKiBPbmNlIGEg
bWVtb3J5IHByZXNzdXJlIGlzIGRldGVjdGVkLCBzcXVlZXplIGZyZWUgcGFnZSBwb29scyBmb3Ig
YSB3aGlsZS4gKi8KPiA+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgYnVmZmVyX3NxdWVlemVfZHVy
YXRpb25fbXMgPSAxMDsKPiA+ID4gK21vZHVsZV9wYXJhbV9uYW1lZChidWZmZXJfc3F1ZWV6ZV9k
dXJhdGlvbl9tcywKPiA+ID4gKwkJYnVmZmVyX3NxdWVlemVfZHVyYXRpb25fbXMsIGludCwgMDY0
NCk7Cj4gPiA+ICtNT0RVTEVfUEFSTV9ERVNDKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zLAo+
ID4gPiArIkR1cmF0aW9uIGluIG1zIHRvIHNxdWVlemUgcGFnZXMgYnVmZmVyIHdoZW4gYSBtZW1v
cnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQiKTsKPiA+ID4gKwo+ID4gPiArc3RhdGljIHVuc2lnbmVk
IGxvbmcgYnVmZmVyX3NxdWVlemVfZW5kOwo+ID4gPiArCj4gPiA+ICt2b2lkIHhlbl9ibGtia19y
ZWNsYWltX21lbW9yeShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2KQo+ID4gPiArewo+ID4gPiAr
CWJ1ZmZlcl9zcXVlZXplX2VuZCA9IGppZmZpZXMgKwo+ID4gPiArCQltc2Vjc190b19qaWZmaWVz
KGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zKTsKPiA+IAo+ID4gSSdtIG5vdCBzdXJlIHRoaXMg
aXMgZnVsbHkgY29ycmVjdC4gVGhpcyBmdW5jdGlvbiB3aWxsIGJlIGNhbGxlZCBmb3IKPiA+IGVh
Y2ggYmxrYmFjayBpbnN0YW5jZSwgYnV0IHRoZSB0aW1lb3V0IGlzIHN0b3JlZCBpbiBhIGdsb2Jh
bCB2YXJpYWJsZQo+ID4gdGhhdCdzIHNoYXJlZCBiZXR3ZWVuIGFsbCBibGtiYWNrIGluc3RhbmNl
cy4gU2hvdWxkbid0IHRoaXMgdGltZW91dCBiZQo+ID4gc3RvcmVkIGluIHhlbl9ibGtpZiBzbyBl
YWNoIGluc3RhbmNlIGhhcyBpdCdzIG93biBsb2NhbCB2YXJpYWJsZT8KPiA+IAo+ID4gT3IgZWxz
ZSBpbiB0aGUgY2FzZSB5b3UgaGF2ZSAxayBibGtiYWNrIGluc3RhbmNlcyB0aGUgdGltZW91dCBp
cwo+ID4gY2VydGFpbmx5IGdvaW5nIHRvIGJlIGxvbmdlciB0aGFuIGV4cGVjdGVkLCBiZWNhdXNl
IGVhY2ggY2FsbCB0bwo+ID4geGVuX2Jsa2JrX3JlY2xhaW1fbWVtb3J5IHdpbGwgbW92ZSBpdCBm
b3J3YXJkLgo+IAo+IEFncmVlZCB0aGF0LiAgSSB0aGluayB0aGUgZXh0ZW5kZWQgdGltZW91dCB3
b3VsZCBub3QgbWFrZSBhIHZpc2libGUKPiBwZXJmb3JtYW5jZSwgdGhvdWdoLCBiZWNhdXNlIHRo
ZSB0aW1lIHRoYXQgMWstbG9vcCB0YWtlIHdvdWxkIGJlIHNob3J0IGVub3VnaAo+IHRvIGJlIGln
bm9yZWQgY29tcGFyZWQgdG8gdGhlIG1pbGxpc2Vjb25kLXNjb3BlIGR1cmF0aW9uLgo+IAo+IEkg
dG9vayB0aGlzIHdheSBiZWNhdXNlIEkgd2FudGVkIHRvIG1pbmltaXplIHN1Y2ggc3RydWN0dXJh
bCBjaGFuZ2VzIGFzIGZhciBhcwo+IEkgY2FuLCBhcyB0aGlzIGlzIGp1c3QgYSBwb2ludC1maXgg
cmF0aGVyIHRoYW4gdWx0aW1hdGUgc29sdXRpb24uICBUaGF0IHNhaWQsCj4gaXQgaXMgbm90IGZ1
bGx5IGNvcnJlY3QgYW5kIHZlcnkgY29uZnVzaW5nLiAgTXkgYW5vdGhlciBjb2xsZWFndWUgYWxz
byBwb2ludGVkCj4gb3V0IGl0IGluIGludGVybmFsIHJldmlldy4gIENvcnJlY3Qgc29sdXRpb24g
d291bGQgYmUgdG8gYWRkaW5nIGEgdmFyaWFibGUgaW4KPiB0aGUgc3RydWN0IGFzIHlvdSBzdWdn
ZXN0ZWQgb3IgYXZvaWRpbmcgZHVwbGljYXRlZCB1cGRhdGUgb2YgdGhlIHZhcmlhYmxlIGJ5Cj4g
aW5pdGlhbGl6aW5nIHRoZSB2YXJpYWJsZSBvbmNlIHRoZSBzcXVlZXppbmcgZHVyYXRpb24gcGFz
c2VzLiAgSSB3b3VsZCBwcmVmZXIKPiB0aGUgbGF0ZXIgd2F5LCBhcyBpdCBpcyBtb3JlIHN0cmFp
Z2h0Zm9yd2FyZCBhbmQgc3RpbGwgbm90IGludHJvZHVjaW5nCj4gc3RydWN0dXJhbCBjaGFuZ2Uu
ICBGb3IgZXhhbXBsZSwgaXQgbWlnaHQgYmUgbGlrZSBiZWxvdzoKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1i
bGtiYWNrL2Jsa2JhY2suYwo+IGluZGV4IGY0MWM2OThkZDg1NC4uNjg1NmM4ZWY4OGRlIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5jCj4gKysrIGIvZHJp
dmVycy9ibG9jay94ZW4tYmxrYmFjay9ibGtiYWNrLmMKPiBAQCAtMTUyLDggKzE1Miw5IEBAIHN0
YXRpYyB1bnNpZ25lZCBsb25nIGJ1ZmZlcl9zcXVlZXplX2VuZDsKPiAgCj4gIHZvaWQgeGVuX2Js
a2JrX3JlY2xhaW1fbWVtb3J5KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCj4gIHsKPiAtICAg
ICAgIGJ1ZmZlcl9zcXVlZXplX2VuZCA9IGppZmZpZXMgKwo+IC0gICAgICAgICAgICAgICBtc2Vj
c190b19qaWZmaWVzKGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zKTsKPiArICAgICAgIGlmICgh
YnVmZmVyX3NxdWVlemVfZW5kKQo+ICsgICAgICAgICAgICAgICBidWZmZXJfc3F1ZWV6ZV9lbmQg
PSBqaWZmaWVzICsKPiArICAgICAgICAgICAgICAgICAgICAgICBtc2Vjc190b19qaWZmaWVzKGJ1
ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zKTsKPiAgfQo+ICAKPiAgc3RhdGljIGlubGluZSBpbnQg
Z2V0X2ZyZWVfcGFnZShzdHJ1Y3QgeGVuX2Jsa2lmX3JpbmcgKnJpbmcsIHN0cnVjdCBwYWdlICoq
cGFnZSkKPiBAQCAtNjY5LDEwICs2NzAsMTMgQEAgaW50IHhlbl9ibGtpZl9zY2hlZHVsZSh2b2lk
ICphcmcpCj4gICAgICAgICAgICAgICAgIH0KPiAgCj4gICAgICAgICAgICAgICAgIC8qIFNocmlu
ayB0aGUgZnJlZSBwYWdlcyBwb29sIGlmIGl0IGlzIHRvbyBsYXJnZS4gKi8KPiAtICAgICAgICAg
ICAgICAgaWYgKHRpbWVfYmVmb3JlKGppZmZpZXMsIGJ1ZmZlcl9zcXVlZXplX2VuZCkpCj4gKyAg
ICAgICAgICAgICAgIGlmICh0aW1lX2JlZm9yZShqaWZmaWVzLCBidWZmZXJfc3F1ZWV6ZV9lbmQp
KSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc2hyaW5rX2ZyZWVfcGFnZXBvb2wocmluZywg
MCk7Cj4gLSAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkoYnVmZmVyX3NxdWVlemVfZW5kKSkK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJ1ZmZlcl9zcXVlZXplX2VuZCA9IDA7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc2hyaW5rX2ZyZWVfcGFnZXBvb2wocmluZywgbWF4
X2J1ZmZlcl9wYWdlcyk7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgCj4gICAgICAgICAgICAgICAg
IGlmIChsb2dfc3RhdHMgJiYgdGltZV9hZnRlcihqaWZmaWVzLCByaW5nLT5zdF9wcmludCkpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRfc3RhdHMocmluZyk7Cj4gCj4gTWF5IEkgYXNr
IHlvdSB3aGF0IHdheSB3b3VsZCB5b3UgcHJlZmVyPwoKSSdtIG5vdCBwYXJ0aWN1bGFybHkgZm91
bmQgb2YgdGhpcyBhcHByb2FjaCwgYXMgSSB0aGluayBpdCdzIHJhY3kuIEllOgp5b3Ugd291bGQg
aGF2ZSB0byBhZGQgc29tZSBraW5kIG9mIGxvY2sgdG8gbWFrZSBzdXJlIHRoZSBjb250ZW50cyBv
ZgpidWZmZXJfc3F1ZWV6ZV9lbmQgc3RheSB1bm1vZGlmaWVkIGR1cmluZyB0aGUgcmVhZCBhbmQg
c2V0IGN5Y2xlLCBvcgplbHNlIHhlbl9ibGtpZl9zY2hlZHVsZSB3aWxsIHJhY2Ugd2l0aCB4ZW5f
YmxrYmtfcmVjbGFpbV9tZW1vcnkuCgpUaGlzIGlzIGxpa2VseSBub3QgYSBiaWcgZGVhbCBBVE0g
c2luY2UgdGhlIGNvZGUgd2lsbCB3b3JrIGFzCmV4cGVjdGVkIGluIG1vc3QgY2FzZXMgQUZBSUNU
LCBidXQgSSB3b3VsZCBzdGlsbCBwcmVmZXIgdG8gaGF2ZSBhCnBlci1pbnN0YW5jZSBidWZmZXJf
c3F1ZWV6ZV9lbmQgYWRkZWQgdG8geGVuX2Jsa2lmLCBnaXZlbiB0aGF0IHRoZQpjYWxsYmFjayBp
cyBwZXItaW5zdGFuY2UuIEkgd291bGRuJ3QgY2FsbCBpdCBhIHN0cnVjdHVyYWwgY2hhbmdlLCBp
dCdzCmp1c3QgYWRkaW5nIGEgdmFyaWFibGUgdG8gYSBzdHJ1Y3QgaW5zdGVhZCBvZiBoYXZpbmcg
YSBzaGFyZWQgb25lLCBidXQKdGhlIGNvZGUgaXMgYWxtb3N0IHRoZSBzYW1lIGFzIHRoZSBjdXJy
ZW50IHZlcnNpb24uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
