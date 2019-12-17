Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A218122A6A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 12:43:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihBCR-0003rq-RO; Tue, 17 Dec 2019 11:39:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcM=2H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ihBCQ-0003rl-Bc
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 11:39:34 +0000
X-Inumbo-ID: e42e3404-20c1-11ea-8ea5-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e42e3404-20c1-11ea-8ea5-12813bfff9fa;
 Tue, 17 Dec 2019 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576582773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DrETHrqzGMzEL4BEkIo0gX1VPtHC9KB35ii7Mt8tG0k=;
 b=M4N3nooqRSxUGkbzsWJjj3LiK1nu9k6v4brlb5mYeDIwiGEH0vyJN2Qp
 RVwUiKOnuWXGz1iktxUyASi3a0jIXB5mxPxM6S1u8+VN0ygQAFjfG4bf0
 wItPTFdAX/lv1eZ7tjI4bklDE5vpN6fKtuY4MvuBbvHttQ424bI4icMGH 4=;
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
IronPort-SDR: Z/ZGRfUadPPOQQqodAIwIuWjXR4ihVrif6lFloAqm0obWVZYFdqOomu6rManPicIAeLcGX192k
 AmHWxSx74okB6fy/ym0Ky82Y/EUFaOjoGqw1jD5d2rsRmK59xCdt0JO8BpUbnnTkzGpmEzTnlr
 w7Svsm9tvNzGHxthFEpCCOZaKj96vsjjhuhe1mZIefdpZK+tyg6+z4CC3OEZOYC4D7kR6Nwm9N
 Z8Ru/gXwtexwwVcUcpXgiVr6w9ORpAUTI+Xy/cEADmS8Cm6BJ4pzmjHmQZQMj1xxnFPHZLIMgp
 hkQ=
X-SBRS: 2.7
X-MesageID: 9807525
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; 
   d="scan'208";a="9807525"
Date: Tue, 17 Dec 2019 12:39:15 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191217113915.GS11756@Air-de-Roger>
References: <2ad62cc8-ae78-6087-f277-923dc076383a@suse.com>
 <20191216194803.6294-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191216194803.6294-1-sj38.park@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v10 2/4] xen/blkback: Squeeze page pools if
 a memory pressure is detected
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
Cc: jgross@suse.com, axboe@kernel.dk, konrad.wilk@oracle.com,
 pdurrant@amazon.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDg6NDg6MDNQTSArMDEwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBPbiBvbiwgMTYgRGVjIDIwMTkgMTc6MjM6NDQgKzAxMDAsIErDvHJnZW4gR3Jvw58g
d3JvdGU6Cj4gCj4gPiBPbiAxNi4xMi4xOSAxNzoxNSwgU2VvbmdKYWUgUGFyayB3cm90ZToKPiA+
ID4gT24gTW9uLCAxNiBEZWMgMjAxOSAxNTozNzoyMCArMDEwMCBTZW9uZ0phZSBQYXJrIDxzanBh
cmtAYW1hem9uLmNvbT4gd3JvdGU6Cj4gPiA+IAo+ID4gPj4gT24gTW9uLCAxNiBEZWMgMjAxOSAx
Mzo0NToyNSArMDEwMCBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmNvbT4gd3JvdGU6Cj4g
PiA+Pgo+ID4gPj4+IEZyb206IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+Cj4gPiA+
Pj4KPiA+ID4gWy4uLl0KPiA+ID4+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hl
bmJ1cy5jCj4gPiA+Pj4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwo+
ID4gPj4+IEBAIC04MjQsNiArODI0LDI0IEBAIHN0YXRpYyB2b2lkIGZyb250ZW5kX2NoYW5nZWQo
c3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKPiA+ID4+PiAgIH0KPiA+ID4+PiAgIAo+ID4gPj4+
ICAgCj4gPiA+Pj4gKy8qIE9uY2UgYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQsIHNxdWVl
emUgZnJlZSBwYWdlIHBvb2xzIGZvciBhIHdoaWxlLiAqLwo+ID4gPj4+ICtzdGF0aWMgdW5zaWdu
ZWQgaW50IGJ1ZmZlcl9zcXVlZXplX2R1cmF0aW9uX21zID0gMTA7Cj4gPiA+Pj4gK21vZHVsZV9w
YXJhbV9uYW1lZChidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywKPiA+ID4+PiArCQlidWZmZXJf
c3F1ZWV6ZV9kdXJhdGlvbl9tcywgaW50LCAwNjQ0KTsKPiA+ID4+PiArTU9EVUxFX1BBUk1fREVT
QyhidWZmZXJfc3F1ZWV6ZV9kdXJhdGlvbl9tcywKPiA+ID4+PiArIkR1cmF0aW9uIGluIG1zIHRv
IHNxdWVlemUgcGFnZXMgYnVmZmVyIHdoZW4gYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQi
KTsKPiA+ID4+PiArCj4gPiA+Pj4gKy8qCj4gPiA+Pj4gKyAqIENhbGxiYWNrIHJlY2VpdmVkIHdo
ZW4gdGhlIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZC4KPiA+ID4+PiArICovCj4gPiA+Pj4g
K3N0YXRpYyB2b2lkIHJlY2xhaW1fbWVtb3J5KHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYpCj4g
PiA+Pj4gK3sKPiA+ID4+PiArCXN0cnVjdCBiYWNrZW5kX2luZm8gKmJlID0gZGV2X2dldF9kcnZk
YXRhKCZkZXYtPmRldik7Cj4gPiA+Pj4gKwo+ID4gPj4+ICsJYmUtPmJsa2lmLT5idWZmZXJfc3F1
ZWV6ZV9lbmQgPSBqaWZmaWVzICsKPiA+ID4+PiArCQltc2Vjc190b19qaWZmaWVzKGJ1ZmZlcl9z
cXVlZXplX2R1cmF0aW9uX21zKTsKPiA+ID4+Cj4gPiA+PiBUaGlzIGNhbGxiYWNrIG1pZ2h0IHJh
Y2Ugd2l0aCAneGVuX2Jsa2JrX3Byb2JlKCknLiAgVGhlIHJhY2UgY291bGQgcmVzdWx0IGluCj4g
PiA+PiBfX05VTEwgZGVyZWZlcmVuY2luZ19fLCBhcyAneGVuX2Jsa2JrX3Byb2JlKCknIHNldHMg
Jy0+YmxraWYnIGFmdGVyIGl0IGxpbmtzCj4gPiA+PiAnYmUnIHRvIHRoZSAnZGV2Jy4gIFBsZWFz
ZSBfZG9uJ3QgbWVyZ2VfIHRoaXMgcGF0Y2ggbm93IQo+ID4gPj4KPiA+ID4+IEkgd2lsbCBkbyBt
b3JlIHRlc3QgYW5kIHNoYXJlIHJlc3VsdHMuICBNZWFud2hpbGUsIGlmIHlvdSBoYXZlIGFueSBv
cGluaW9uLAo+ID4gPj4gcGxlYXNlIGxldCBtZSBrbm93Lgo+IAo+IEkgcmVkdWNlZCBzeXN0ZW0g
bWVtb3J5IGFuZCBhdHRhY2hlZCBidW5jaCBvZiBkZXZpY2VzIGluIHNob3J0IHRpbWUgc28gdGhh
dAo+IG1lbW9yeSBwcmVzc3VyZSBvY2N1cnMgd2hpbGUgZGV2aWNlIGF0dGFjaG1lbnRzIGFyZSBv
bmdvaW5nLiAgVW5kZXIgdGhpcwo+IGNpcmN1bXN0YW5jZSwgSSB3YXMgYWJsZSB0byBzZWUgdGhl
IHJhY2UuCj4gCj4gPiA+IAo+ID4gPiBOb3Qgb25seSAnLT5ibGtpZicsIGJ1dCAnYmUnIGl0c2Vs
ZiBhbHNvIGNvdWxlIGJlIGEgTlVMTC4gIEFzIHNpbWlsYXIKPiA+ID4gY29uY3VycmVuY3kgaXNz
dWVzIGNvdWxkIGJlIGluIG90aGVyIGRyaXZlcnMgaW4gdGhlaXIgd2F5LCBJIHN1Z2dlc3QgdG8g
Y2hhbmdlCj4gPiA+IHRoZSByZWNsYWltIGNhbGxiYWNrICgnLT5yZWNsYWltX21lbW9yeScpIHRv
IGJlIGNhbGxlZCBmb3IgZWFjaCBkcml2ZXIgaW5zdGVhZAo+ID4gPiBvZiBlYWNoIGRldmljZS4g
IFRoZW4sIGVhY2ggZHJpdmVyIGNvdWxkIGJlIGFibGUgdG8gZGVhbCB3aXRoIGl0cyBjb25jdXJy
ZW5jeQo+ID4gPiBpc3N1ZXMgYnkgaXRzZWxmLgo+ID4gCj4gPiBIbW0sIEkgZG9uJ3QgbGlrZSB0
aGF0LiBUaGlzIHdvdWxkIG5lZWQgdG8gYmUgY2hhbmdlZCBiYWNrIGluIGNhc2Ugd2UKPiA+IGFk
ZCBwZXItZ3Vlc3QgcXVvdGEuCj4gCj4gRXh0ZW5kaW5nIHRoaXMgY2FsbGJhY2sgaW4gdGhhdCB3
YXkgd291bGQgYmUgc3RpbGwgbm90IHRvbyBoYXJkLiAgV2UgY291bGQgdXNlCj4gdGhlIGFyZ3Vt
ZW50IHRvIHRoZSBjYWxsYmFjay4gIEkgd291bGQga2VlcCB0aGUgYXJndW1lbnQgb2YgdGhlIGNh
bGxiYWNrIHRvCj4gJ3N0cnVjdCBkZXZpY2UgKicgYXMgaXMsIGFuZCB3aWxsIGFkZCBhIGNvbW1l
bnQgc2F5aW5nICdOVUxMJyB2YWx1ZSBvZiB0aGUKPiBhcmd1bWVudCBtZWFucyBldmVyeSBkZXZp
Y2VzLiAgQXMgYW4gZXhhbXBsZSwgeGVuYnVzIHdvdWxkIHBhc3MgTlVMTC1lbmRpbmcKPiBhcnJh
eSBvZiB0aGUgZGV2aWNlIHBvaW50ZXJzIHRoYXQgbmVlZCB0byBmcmVlIGl0cyByZXNvdXJjZXMu
Cj4gCj4gQWZ0ZXIgc2VlaW5nIHRoaXMgcmFjZSwgSSBhbSBub3cgYWxzbyB0aGlua2luZyBpdCBj
b3VsZCBiZSBiZXR0ZXIgdG8gZGVsZWdhdGUKPiBkZXRhaWxlZCBjb250cm9sIG9mIGVhY2ggZGV2
aWNlIHRvIGl0cyBkcml2ZXIsIGFzIHNvbWUgZHJpdmVycyBoYXZlIHNvbWUKPiBjb21wbGljYXRl
ZCBhbmQgdW5pcXVlIHJlbGF0aW9uIHdpdGggaXRzIGRldmljZXMuCj4gCj4gPiAKPiA+IFdvdWxk
bid0IGEgZ2V0X2RldmljZSgpIGJlZm9yZSBjYWxsaW5nIHRoZSBjYWxsYmFjayBhbmQgYSBwdXRf
ZGV2aWNlKCkKPiA+IGFmdGVyd2FyZHMgYXZvaWQgdGhhdCBwcm9ibGVtPwo+IAo+IEkgZGlkbid0
IHVzZWQgdGhlIHJlZmVyZW5jZSBjb3VudCBtYW5pcHVsYXRpb24gb3BlcmF0aW9ucyBiZWNhdXNl
IG90aGVyIHNpbWlsYXIKPiBwYXJ0cyBhbHNvIGRpZG4ndC4gIEJ1dCwgaWYgdGhlcmUgaXMgbm8g
aW1wbGljaXQgcmVmZXJlbmNlIGNvdW50IGd1YXJhbnRlZSwgaXQKPiBzZWVtcyB0aG9zZSBvcGVy
YXRpb25zIGFyZSBpbmRlZWQgbmVjZXNzYXJ5Lgo+IAo+IFRoYXQgc2FpZCwgYXMgZ2V0L3B1dCBv
cGVyYXRpb25zIG9ubHkgYWRqdXN0IHRoZSByZWZlcmVuY2UgY291bnQsIHRob3NlIHdpbGwKPiBu
b3QgbWFrZSB0aGUgY2FsbGJhY2sgdG8gd2FpdCB1bnRpbCB0aGUgbGlua2luZyBvZiB0aGUgJ2Jh
Y2tlbmQnIGFuZCAnYmxraWYnIHRvCj4gdGhlIGRldmljZSAoeGVuX2Jsa2JrX3Byb2JlKCkpIGlz
IGZpbmlzaGVkLiAgVGh1cywgdGhlIHJhY2UgY291bGQgc3RpbGwgaGFwcGVuLgo+IE9yLCBhbSBJ
IG1pc3Npbmcgc29tZXRoaW5nPwoKSSB3b3VsZCBleHBlY3QgdGhlIGRldmljZSBpcyBub3QgYWRk
ZWQgdG8gdGhlIGxpc3Qgb2YgYmFja2VuZCBkZXZpY2VzCnVudGlsIHRoZSBwcm9iZSBob29rIGhh
cyBmaW5pc2hlZCB3aXRoIGEgbm9uLWVycm9yIHJldHVybiBjb2RlLiBJZToKYnVzX2Zvcl9lYWNo
X2RldiBzaG91bGQgX25vdF8gaXRlcmF0ZSBvdmVyIGRldmljZXMgZm9yIHdoaWNoIHRoZSBwcm9i
ZQpmdW5jdGlvbiBoYXNuJ3QgYmVlbiBydW4gdG8gY29tcGV0aXRpb24gd2l0aG91dCBlcnJvcnMu
CgpUaGUgc2FtZSB3YXkgSSB3b3VsZCBleHBlY3QgdGhlIHJlbW92ZSBob29rIHRvIGZpcnN0IHJl
bW92ZSB0aGUgZGV2aWNlCmZyb20gdGhlIGxpc3Qgb2YgYmFja2VuZCBkZXZpY2VzIGFuZCB0aGVu
IHJ1biB0aGUgcmVtb3ZlIGhvb2suCgpibGtiYWNrIHVzZXMgYW4gYWQtaG9jIHJlZmVyZW5jZSBj
b3VudGluZyBtZWNoYW5pc20sIGJ1dCBpZiB0aGUgYWJvdmUKYXNzdW1wdGlvbnMgYXJlIHRydWUg
SSB0aGluayBpdCB3b3VsZCBiZSBlbm91Z2ggdG8gdGFrZSBhbiBleHRyYQpyZWZlcmVuY2UgaW4g
eGVuX2Jsa2JrX3Byb2JlIGFuZCBkcm9wIGl0IGluIHhlbl9ibGtia19yZW1vdmUuCgpBZGRpdGlv
bmFsbHkgaXQgbWlnaHQgYmUgaW50ZXJlc3RpbmcgdG8gc3dpdGNoIHRoZSBhZC1ob2MgcmVmZXJl
bmNlCmNvdW50aW5nIHRvIHVzZSBnZXRfZGV2aWNlL3B1dF9kZXZpY2UgKGluIGEgc2VwYXJhdGUg
cGF0Y2gpLCBidXQgSSdtCm5vdCBzdXJlIGhvdyBmZWFzaWJsZSB0aGF0IGlzLgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
