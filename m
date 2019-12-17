Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E212262B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 09:03:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ih7m9-0002jT-3P; Tue, 17 Dec 2019 08:00:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mCDn=2H=amazon.com=prvs=2471a56b0=sjpark@srs-us1.protection.inumbo.net>)
 id 1ih7m7-0002jO-RO
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 08:00:11 +0000
X-Inumbo-ID: 3f7d1fb0-20a3-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f7d1fb0-20a3-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 08:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576569611; x=1608105611;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=MK/ntvqgD4ldTAcOBUpr88W3nXXK3upz67rIo5vkCJA=;
 b=VVBdNuMEbpDXVLUenhnGJ/wFJvF/2U7J/y0KRLpYABV6IRMzflxRKyZ6
 eHDrYq7vTh/M38K0hAptOI9yRiuj20zqgehQruHPS78DXXBdHfcT43QhV
 yCp/Q+6w0PgovK9P636QRDhyI1pdASQ3+Als7fybE6PIzC8088DZZrUh/ o=;
IronPort-SDR: dQl3FfbwDFzEi5+WHu2uoScZ6eke6A7B/RL+g0Mrj1b2ivor+lL+j1uvfXSJe7e8020yBgpm9Y
 BP0Qpso9a5ng==
X-IronPort-AV: E=Sophos;i="5.69,324,1571702400"; 
   d="scan'208";a="5549576"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-c300ac87.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 17 Dec 2019 07:59:57 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c300ac87.us-west-2.amazon.com (Postfix) with ESMTPS
 id A7958A06B3; Tue, 17 Dec 2019 07:59:56 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 07:59:56 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.179) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 07:59:51 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Date: Tue, 17 Dec 2019 08:59:32 +0100
Message-ID: <20191217075932.4516-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <c4efaabf-a925-0af0-b772-49a2e15623e7@suse.com> (raw)
X-Originating-IP: [10.43.161.179]
X-ClientProxiedBy: EX13D35UWB001.ant.amazon.com (10.43.161.47) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v10 2/4] xen/blkback: Squeeze page pools if
 a memory pressure is detected
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, konrad.wilk@oracle.com,
 pdurrant@amazon.com, linux-kernel@vger.kernel.org,
 SeongJae Park <sj38.park@gmail.com>, xen-devel@lists.xenproject.org,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBEZWMgMjAxOSAwNzoyMzoxMiArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cgo+IE9uIDE2LjEyLjE5IDIwOjQ4LCBTZW9uZ0phZSBQYXJrIHdy
b3RlOgo+ID4gT24gb24sIDE2IERlYyAyMDE5IDE3OjIzOjQ0ICswMTAwLCBKw7xyZ2VuIEdyb8Of
IHdyb3RlOgo+ID4gCj4gPj4gT24gMTYuMTIuMTkgMTc6MTUsIFNlb25nSmFlIFBhcmsgd3JvdGU6
Cj4gPj4+IE9uIE1vbiwgMTYgRGVjIDIwMTkgMTU6Mzc6MjAgKzAxMDAgU2VvbmdKYWUgUGFyayA8
c2pwYXJrQGFtYXpvbi5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+Pj4gT24gTW9uLCAxNiBEZWMgMjAx
OSAxMzo0NToyNSArMDEwMCBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmNvbT4gd3JvdGU6
Cj4gPj4+Pgo+ID4+Pj4+IEZyb206IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+Cj4g
Pj4+Pj4KPiA+Pj4gWy4uLl0KPiA+Pj4+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNr
L3hlbmJ1cy5jCj4gPj4+Pj4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMu
Ywo+ID4+Pj4+IEBAIC04MjQsNiArODI0LDI0IEBAIHN0YXRpYyB2b2lkIGZyb250ZW5kX2NoYW5n
ZWQoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKPiA+Pj4+PiAgICB9Cj4gPj4+Pj4gICAgCj4g
Pj4+Pj4gICAgCj4gPj4+Pj4gKy8qIE9uY2UgYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQs
IHNxdWVlemUgZnJlZSBwYWdlIHBvb2xzIGZvciBhIHdoaWxlLiAqLwo+ID4+Pj4+ICtzdGF0aWMg
dW5zaWduZWQgaW50IGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zID0gMTA7Cj4gPj4+Pj4gK21v
ZHVsZV9wYXJhbV9uYW1lZChidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywKPiA+Pj4+PiArCQli
dWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywgaW50LCAwNjQ0KTsKPiA+Pj4+PiArTU9EVUxFX1BB
Uk1fREVTQyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywKPiA+Pj4+PiArIkR1cmF0aW9uIGlu
IG1zIHRvIHNxdWVlemUgcGFnZXMgYnVmZmVyIHdoZW4gYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0
ZWN0ZWQiKTsKPiA+Pj4+PiArCj4gPj4+Pj4gKy8qCj4gPj4+Pj4gKyAqIENhbGxiYWNrIHJlY2Vp
dmVkIHdoZW4gdGhlIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZC4KPiA+Pj4+PiArICovCj4g
Pj4+Pj4gK3N0YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpk
ZXYpCj4gPj4+Pj4gK3sKPiA+Pj4+PiArCXN0cnVjdCBiYWNrZW5kX2luZm8gKmJlID0gZGV2X2dl
dF9kcnZkYXRhKCZkZXYtPmRldik7Cj4gPj4+Pj4gKwo+ID4+Pj4+ICsJYmUtPmJsa2lmLT5idWZm
ZXJfc3F1ZWV6ZV9lbmQgPSBqaWZmaWVzICsKPiA+Pj4+PiArCQltc2Vjc190b19qaWZmaWVzKGJ1
ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zKTsKPiA+Pj4+Cj4gPj4+PiBUaGlzIGNhbGxiYWNrIG1p
Z2h0IHJhY2Ugd2l0aCAneGVuX2Jsa2JrX3Byb2JlKCknLiAgVGhlIHJhY2UgY291bGQgcmVzdWx0
IGluCj4gPj4+PiBfX05VTEwgZGVyZWZlcmVuY2luZ19fLCBhcyAneGVuX2Jsa2JrX3Byb2JlKCkn
IHNldHMgJy0+YmxraWYnIGFmdGVyIGl0IGxpbmtzCj4gPj4+PiAnYmUnIHRvIHRoZSAnZGV2Jy4g
IFBsZWFzZSBfZG9uJ3QgbWVyZ2VfIHRoaXMgcGF0Y2ggbm93IQo+ID4+Pj4KPiA+Pj4+IEkgd2ls
bCBkbyBtb3JlIHRlc3QgYW5kIHNoYXJlIHJlc3VsdHMuICBNZWFud2hpbGUsIGlmIHlvdSBoYXZl
IGFueSBvcGluaW9uLAo+ID4+Pj4gcGxlYXNlIGxldCBtZSBrbm93Lgo+ID4gCj4gPiBJIHJlZHVj
ZWQgc3lzdGVtIG1lbW9yeSBhbmQgYXR0YWNoZWQgYnVuY2ggb2YgZGV2aWNlcyBpbiBzaG9ydCB0
aW1lIHNvIHRoYXQKPiA+IG1lbW9yeSBwcmVzc3VyZSBvY2N1cnMgd2hpbGUgZGV2aWNlIGF0dGFj
aG1lbnRzIGFyZSBvbmdvaW5nLiAgVW5kZXIgdGhpcwo+ID4gY2lyY3Vtc3RhbmNlLCBJIHdhcyBh
YmxlIHRvIHNlZSB0aGUgcmFjZS4KPiA+IAo+ID4+Pgo+ID4+PiBOb3Qgb25seSAnLT5ibGtpZics
IGJ1dCAnYmUnIGl0c2VsZiBhbHNvIGNvdWxlIGJlIGEgTlVMTC4gIEFzIHNpbWlsYXIKPiA+Pj4g
Y29uY3VycmVuY3kgaXNzdWVzIGNvdWxkIGJlIGluIG90aGVyIGRyaXZlcnMgaW4gdGhlaXIgd2F5
LCBJIHN1Z2dlc3QgdG8gY2hhbmdlCj4gPj4+IHRoZSByZWNsYWltIGNhbGxiYWNrICgnLT5yZWNs
YWltX21lbW9yeScpIHRvIGJlIGNhbGxlZCBmb3IgZWFjaCBkcml2ZXIgaW5zdGVhZAo+ID4+PiBv
ZiBlYWNoIGRldmljZS4gIFRoZW4sIGVhY2ggZHJpdmVyIGNvdWxkIGJlIGFibGUgdG8gZGVhbCB3
aXRoIGl0cyBjb25jdXJyZW5jeQo+ID4+PiBpc3N1ZXMgYnkgaXRzZWxmLgo+ID4+Cj4gPj4gSG1t
LCBJIGRvbid0IGxpa2UgdGhhdC4gVGhpcyB3b3VsZCBuZWVkIHRvIGJlIGNoYW5nZWQgYmFjayBp
biBjYXNlIHdlCj4gPj4gYWRkIHBlci1ndWVzdCBxdW90YS4KPiA+IAo+ID4gRXh0ZW5kaW5nIHRo
aXMgY2FsbGJhY2sgaW4gdGhhdCB3YXkgd291bGQgYmUgc3RpbGwgbm90IHRvbyBoYXJkLiAgV2Ug
Y291bGQgdXNlCj4gPiB0aGUgYXJndW1lbnQgdG8gdGhlIGNhbGxiYWNrLiAgSSB3b3VsZCBrZWVw
IHRoZSBhcmd1bWVudCBvZiB0aGUgY2FsbGJhY2sgdG8KPiA+ICdzdHJ1Y3QgZGV2aWNlIConIGFz
IGlzLCBhbmQgd2lsbCBhZGQgYSBjb21tZW50IHNheWluZyAnTlVMTCcgdmFsdWUgb2YgdGhlCj4g
PiBhcmd1bWVudCBtZWFucyBldmVyeSBkZXZpY2VzLiAgQXMgYW4gZXhhbXBsZSwgeGVuYnVzIHdv
dWxkIHBhc3MgTlVMTC1lbmRpbmcKPiA+IGFycmF5IG9mIHRoZSBkZXZpY2UgcG9pbnRlcnMgdGhh
dCBuZWVkIHRvIGZyZWUgaXRzIHJlc291cmNlcy4KPiA+IAo+ID4gQWZ0ZXIgc2VlaW5nIHRoaXMg
cmFjZSwgSSBhbSBub3cgYWxzbyB0aGlua2luZyBpdCBjb3VsZCBiZSBiZXR0ZXIgdG8gZGVsZWdh
dGUKPiA+IGRldGFpbGVkIGNvbnRyb2wgb2YgZWFjaCBkZXZpY2UgdG8gaXRzIGRyaXZlciwgYXMg
c29tZSBkcml2ZXJzIGhhdmUgc29tZQo+ID4gY29tcGxpY2F0ZWQgYW5kIHVuaXF1ZSByZWxhdGlv
biB3aXRoIGl0cyBkZXZpY2VzLgo+ID4gCj4gPj4KPiA+PiBXb3VsZG4ndCBhIGdldF9kZXZpY2Uo
KSBiZWZvcmUgY2FsbGluZyB0aGUgY2FsbGJhY2sgYW5kIGEgcHV0X2RldmljZSgpCj4gPj4gYWZ0
ZXJ3YXJkcyBhdm9pZCB0aGF0IHByb2JsZW0/Cj4gPiAKPiA+IEkgZGlkbid0IHVzZWQgdGhlIHJl
ZmVyZW5jZSBjb3VudCBtYW5pcHVsYXRpb24gb3BlcmF0aW9ucyBiZWNhdXNlIG90aGVyIHNpbWls
YXIKPiA+IHBhcnRzIGFsc28gZGlkbid0LiAgQnV0LCBpZiB0aGVyZSBpcyBubyBpbXBsaWNpdCBy
ZWZlcmVuY2UgY291bnQgZ3VhcmFudGVlLCBpdAo+ID4gc2VlbXMgdGhvc2Ugb3BlcmF0aW9ucyBh
cmUgaW5kZWVkIG5lY2Vzc2FyeS4KPiA+IAo+ID4gVGhhdCBzYWlkLCBhcyBnZXQvcHV0IG9wZXJh
dGlvbnMgb25seSBhZGp1c3QgdGhlIHJlZmVyZW5jZSBjb3VudCwgdGhvc2Ugd2lsbAo+ID4gbm90
IG1ha2UgdGhlIGNhbGxiYWNrIHRvIHdhaXQgdW50aWwgdGhlIGxpbmtpbmcgb2YgdGhlICdiYWNr
ZW5kJyBhbmQgJ2Jsa2lmJyB0bwo+ID4gdGhlIGRldmljZSAoeGVuX2Jsa2JrX3Byb2JlKCkpIGlz
IGZpbmlzaGVkLiAgVGh1cywgdGhlIHJhY2UgY291bGQgc3RpbGwgaGFwcGVuLgo+ID4gT3IsIGFt
IEkgbWlzc2luZyBzb21ldGhpbmc/Cj4gCj4gTm8sIEkgdGhpbmsgd2UgbmVlZCBhIHhlbmJ1cyBs
b2NrIHBlciBkZXZpY2Ugd2hpY2ggd2lsbCBuZWVkIHRvIGJlCj4gdGFrZW4gaW4geGVuX2Jsa2Jr
X3Byb2JlKCksIHhlbmJ1c19kZXZfcmVtb3ZlKCkgYW5kIHdoaWxlIGNhbGxpbmcgdGhlCj4gY2Fs
bGJhY2suCgpJIGFsc28gYWdyZWUgdGhhdCBsb2NraW5nIHNob3VsZCBiZSB1c2VkIGF0IGxhc3Qu
ICBCdXQsIGFzIGVhY2ggZHJpdmVyIG1hbmFnZXMKaXRzIGRldmljZXMgYW5kIHJlc291cmNlcyBp
biB0aGVpciB3YXksIGl0IGNvdWxkIGhhdmUgaXRzIHVuaXF1ZSByYWNlCmNvbmRpdGlvbnMuICBB
bmQsIGVhY2ggdW5pcXVlIHJhY2UgY29uZGl0aW9uIG1pZ2h0IGhhdmUgaXRzIHVuaXF1ZSBlZmZp
Y2llbnQKd2F5IHRvIHN5bmNocm9uaXplIGl0LiAgVGhlcmVmb3JlLCBJIHRoaW5rIHRoZSBzeW5j
aHJvbml6YXRpb24gc2hvdWxkIGJlIGRvbmUKYnkgZWFjaCBkcml2ZXIsIG5vdCBieSB4ZW5idXMg
YW5kIHRodXMgd2Ugc2hvdWxkIG1ha2UgdGhlIGNhbGxiYWNrIHRvIGJlIGNhbGxlZApwZXItZHJp
dmVyLgoKClRoYW5rcywKU2VvbmdKYWUgUGFyawoKPiAKPiAKPiBKdWVyZ2VuCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
