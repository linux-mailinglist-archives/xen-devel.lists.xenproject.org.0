Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166E17364B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 12:44:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7e17-0004Kf-B7; Fri, 28 Feb 2020 11:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7e15-0004Ka-CR
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 11:41:15 +0000
X-Inumbo-ID: 39601910-5a1f-11ea-83b0-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39601910-5a1f-11ea-83b0-bc764e2007e4;
 Fri, 28 Feb 2020 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582890074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+hntsz3gbiTkN2s5wd+Ga51zI8HLfhHkl7KwZ9Q68Ww=;
 b=a8pXoZzzn/tMpB2rwInN8Xk6D+WT2O7lgVyE/IhYEvMtwPVd9mn9RoQK
 ItJG+p4+3DxeCiFcDi/TnYjhttN46Y2i2AtYtSj6BUUxINMNntUfWk0dI
 T/HhlUpdtDSXQEYo0D7mcdM3FNLYTVbYgcqYordmweXs5Tw76xu4l4Hwg w=;
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
IronPort-SDR: AlcSqPPcRn1subXi/c8V74NRqrlXexR9Z4zk2kCcuVYzbVb624AzsKjAm1sp+qFgv6CirD5vaX
 lTmYc5UHYn6EHy4rpoGRfb39HwA+K4u+anjj0JZGt7v6ShPjvfz/UIFUrH5hyRnHVWbDSdzX3a
 cOfXgXxAgP7IHnqDdI2R7o15D/zespHOT1m9Z6yLWUFaagSNVUWx96B5zxsq8JmolF/WWmbIMi
 EWX0NK8NvtkVyqVVPj+kPXlc9kA7wxrp41F7HkL+YLdGCFnHVAKWbg8POTezxm6FGjupRlINvu
 zjs=
X-SBRS: 2.7
X-MesageID: 13593054
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,495,1574139600"; d="scan'208";a="13593054"
Date: Fri, 28 Feb 2020 12:41:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228114106.GV24458@Air-de-Roger.citrite.net>
References: <20200228093334.36586-1-roger.pau@citrix.com>
 <20200228093334.36586-3-roger.pau@citrix.com>
 <12c75d73-cc89-9b8c-011a-b6e11f6cf58d@suse.com>
 <20200228103131.GU24458@Air-de-Roger.citrite.net>
 <694efd6e-91cc-6a31-dded-0af339af4bef@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <694efd6e-91cc-6a31-dded-0af339af4bef@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 2/2] x86: add accessors for scratch cpu
 mask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMTI6MTU6MjFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxMTozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDI4LCAyMDIwIGF0IDExOjE2OjU1QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDI4LjAyLjIwMjAgMTA6MzMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
KyAgICAvKgo+ID4+PiArICAgICAqIER1ZSB0byByZWVudHJhbmN5IHNjcmF0Y2ggY3B1bWFzayBj
YW5ub3QgYmUgdXNlZCBpbiBJUlEsICNNQyBvciAjTk1JCj4gPj4+ICsgICAgICogY29udGV4dC4K
PiA+Pj4gKyAgICAgKi8KPiA+Pj4gKyAgICBCVUdfT04oaW5faXJxKCkgfHwgaW5fbWNlX2hhbmRs
ZXIoKSB8fCBpbl9ubWlfaGFuZGxlcigpKTsKPiA+Pj4gKwo+ID4+PiArICAgIGlmICggdXNlICYm
IHVubGlrZWx5KHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFza191c2UpKSApCj4gPj4+ICsgICAgewo+
ID4+PiArICAgICAgICBwcmludGsoInNjcmF0Y2ggQ1BVIG1hc2sgYWxyZWFkeSBpbiB1c2UgYnkg
JXBzICglcClcbiIsCj4gPj4+ICsgICAgICAgICAgICAgICB0aGlzX2NwdShzY3JhdGNoX2NwdW1h
c2tfdXNlKSwgdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrX3VzZSkpOwo+ID4+Cj4gPj4gV2h5IHRo
ZSByYXcgJXAgYXMgd2VsbD8gV2UgZG9uJ3QgZG8gc28gZWxzZXdoZXJlLCBJIHRoaW5rLiBZZXMs
Cj4gPj4gaXQncyBkZWJ1Z2dpbmcgY29kZSBvbmx5LCBidXQgSSB3b25kZXIgYW55d2F5Lgo+ID4g
Cj4gPiBJIHVzZSBhZGRyMmxpbmUgdG8gZmluZCB0aGUgb2ZmZW5kaW5nIGxpbmUsIGFuZCBpdCdz
IG11Y2ggZWFzaWVyIHRvIGRvCj4gPiBzbyBpZiB5b3UgaGF2ZSB0aGUgYWRkcmVzcyBkaXJlY3Rs
eSwgcmF0aGVyIHRoYW4gaGF2aW5nIHRvIHVzZSBubSBpbgo+ID4gb3JkZXIgdG8gZmlndXJlIG91
dCB0aGUgYWRkcmVzcyBvZiB0aGUgc3ltYm9sIGFuZCB0aGVuIGFkZCB0aGUgb2Zmc2V0Lgo+ID4g
Cj4gPiBNYXliZSBJJ20gbWlzc2luZyBzb21lIG90aGVyIHdheSB0byBkbyB0aGlzIG1vcmUgZWFz
aWx5Pwo+IAo+IEluIHN1Y2ggYSBjYXNlIHdlIG1heSB3YW50IHRvIGNvbnNpZGVyIG1ha2luZyAl
cHMgKGFuZCAlcFMpCj4gcHJpbnQgYSBoZXggcHJlc2VudGF0aW9uIG5leHQgdG8gdGhlIGRlY29k
ZWQgb25lLCBpbiBkZWJ1Zwo+IGJ1aWxkcyBhdCBsZWFzdC4gQW5kcmV3LCB0aG91Z2h0cz8gKFRo
ZXJlIG1heSBiZSBjYXNlcyB3aGVyZQo+IHRoaXMgaXMgbm90IHdhbnRlZCwgYml0IGlmIHdlIG1h
ZGUgdGhpcyBhIGRlYnVnIG1vZGUgb25seQo+IGZlYXR1cmUsIEkgdGhpbmsgaXQgd291bGRuJ3Qg
ZG8gdG9vIG11Y2ggaGFybS4pCgpJZiB5b3UgYWdyZWUgdG8gbWFrZSAlcFtzU10gcHJpbnQgdGhl
IGFkZHJlc3MgdGhlbiBJIGNhbiBkcm9wIHRoaXMKYW5kIHNlbmQgYSBwYXRjaCB0byB0aGF0IGVm
ZmVjdCAobGlrZWx5IG5leHQgd2VlaykuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
