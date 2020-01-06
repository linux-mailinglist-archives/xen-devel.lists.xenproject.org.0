Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9D9131503
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 16:42:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioUUW-0002dj-8r; Mon, 06 Jan 2020 15:40:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VNL8=23=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ioUUV-0002de-9s
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 15:40:27 +0000
X-Inumbo-ID: dba8b816-309a-11ea-ab26-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dba8b816-309a-11ea-ab26-12813bfff9fa;
 Mon, 06 Jan 2020 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578325226;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=UJawyuP9qHLbg8lC0jz31eMIc1kFzq6Q5uxdrR3zg8M=;
 b=DvO2QWE0+RhiMv/6IjAxfvTuAqekJLv5hRDBnlQDpR1Dn1MUihEDMlDR
 IXrI7g2+5r221H60uwrpO1aq3vaFpqtuuDfHsJ5rGQrTB/nlEJfYiTqHa
 UKwVLQ4aZN/bwg8TOBN2aj3hQGxTY4cUBZVMZBuPU0NbcqU2M27HXQTzq E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ki5g5LtWYKzcvjwv07K8pdtfW6QQdBw8+mIF5yD9fiHGp5QIJlDu5MXBckbRHTsNZ1SGCXvuCc
 Qj0mln5N56o6hmj58nIrlHNi1lkUc4vuYDVTuW5ErB6lqHN+9krkzka44NwucN9KkeTGPoIyjC
 iM1y3H6WOzAXQnlFDu48ScE4gKMD4od++L4s4B0ofjj4WRDTmV7UpameGXPdmG3Z2JSuwpZhTq
 ZrvKEib8+ke9KOIyKLIzaU0BLr37VuY4nRvLfaO0xqToR82PxOtSbV5GIi0VUdBK0H3jM5WxQs
 vPc=
X-SBRS: 2.7
X-MesageID: 10488330
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="10488330"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24083.21734.512820.514082@mariner.uk.xensource.com>
Date: Mon, 6 Jan 2020 15:40:22 +0000
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
In-Reply-To: <20200106143836.GK1314@mail-itl>
References: <20200105084148.18887-1-marmarek@invisiblethingslab.com>
 <24083.16958.769634.476071@mariner.uk.xensource.com>
 <20200106143836.GK1314@mail-itl>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: create backend/ xenstore dir for
 driver domains
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkaW5nIFJvZ2VyIHRvIHRoZSBDQy4KCk1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cml0
ZXMgKCJSZTogW1BBVENIXSBsaWJ4bDogY3JlYXRlIGJhY2tlbmQvIHhlbnN0b3JlIGRpciBmb3Ig
ZHJpdmVyIGRvbWFpbnMiKToKPiBPbiBNb24sIEphbiAwNiwgMjAyMCBhdCAwMjoyMDo0NlBNICsw
MDAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3
cml0ZXMgKCJbUEFUQ0hdIGxpYnhsOiBjcmVhdGUgYmFja2VuZC8geGVuc3RvcmUgZGlyIGZvciBk
cml2ZXIgZG9tYWlucyIpOgo+ID4gPiBDbGVhbmluZyB1cCBiYWNrZW5kIHhlbnN0b3JlIGVudHJp
ZXMgaXMgYSByZXNwb25zaWJpbGl0eSBvZiB0aGUgYmFja2VuZC4KPiA+ID4gV2hlbiBiYWNrZW5k
IGxpdmVzIG91dHNpZGUgb2YgZG9tMCwgdGhlIGRvbWFpbiBuZWVkcyBwcm9wZXIgcGVybWlzc2lv
bnMKPiA+ID4gdG8gZG8gaXQuIE5vcm1hbGx5IGl0IGlzIGdpdmVuIHBlcm1pc3Npb24gdG8gcmVt
b3ZlIHRoZSBkZXZpY2UgZGlyCj4gPiA+IGl0c2VsZiwgYnV0IG5vdCB0aGUgZGlyIGNvbnRhaW5p
bmcgaXQgKG5hbWVkIGFmdGVyIGZyb250ZW5kIElEKS4gQWZ0ZXIgYQo+ID4gPiB3aG9sZSB0aG9z
ZSBlbXB0eSBsZWZ0b3ZlciBkaXJlY3RvcmllcyBhY2N1bXVsYXRlIHRvIHRoZSBwb2ludCB4ZW5z
dG9yZQo+ID4gPiByZXR1cm5pbmcgRTJCSUcgb24gbGlzdGluZyB0aGVtLgo+ID4gPiAKPiA+ID4g
Rml4IHRoaXMgYnkgZ2l2aW5nIGJhY2tlbmQgZG9tYWluIHdyaXRlIGFjY2VzcyBhbHNvIHRvIGJh
Y2tlbmQvCj4gPiA+IGRpcmVjdG9yeSBpdHNlbGYgd2hlbiBjX2luZm8tPmRyaXZlcl9kb21haW4g
b3B0aW9uIGlzIHNldC4gVGhlIGNvZGUKPiA+ID4gcmVtb3ZpbmcgcmVsZXZhbnQgZGlyIGlzIGFs
cmVhZHkgdGhlcmUgKGp1c3QgbGFja2VkIHBlcm1pc3Npb25zIHRvIGRvIHNvKS4KPiA+ID4gCj4g
PiA+IE5vdGUgdGhpcyBhbHNvIGFsbG93cyB0aGUgYmFja2VuZCBkb21haW4gdG8gY3JlYXRlIG5l
dyBlbnRyaWVzLAo+ID4gPiBwcmV0ZW5kaW5nIHRvIGhvc3QgYmFja2VuZCBkZXZpY2VzIGl0IGRv
bid0IGhhdmUuIEJ1dCBzaW5jZSBsaWJ4bCB1c2VzCj4gPiA+IC9saWJ4bC8geGVuc3RvcmUgZGly
IGZvciB0aGlzIGluZm9ybWF0aW9uIChzdGlsbCBvdXRzaWRlIG9mIGJhY2tlbmQKPiA+ID4gZG9t
YWluIGNvbnRyb2wpLCB0aGlzIHNob3VsZG4ndCBiZSBhbiBpc3N1ZS4KPiA+IAo+ID4gVGhpcyBz
ZWVtcyBxdWl0ZSBoYXphcmRvdXMgdG8gbWUuICBUaGUgcmVhc29uaW5nIHlvdSB1c2UgdG8gc2hv
dyB0aGF0Cj4gPiB0aGlzIGl3cyBPSyBzZWVtcyBmcmFnaWxlLCBhbmQgaW4gZ2VuZXJhbCBpdCBk
b2Vzbid0IGZlZWwgcmlnaHQgdG8KPiA+IGdpdmUgdGhlIHBhcnRpY3VsYXIgYmFja2VuZCBzdWNo
IHdpZGUgc2NvcGUuCj4gPiAKPiA+IENhbiB3ZSBmaW5kIGFub3RoZXIgd2F5IHRvIGFkZHJlc3Mg
dGhpcyBwcm9ibGVtID8gIEkgdGhpbmsgdGhlCj4gPiBjb250YWluaW5nIGRpcmVjdG9yeSBzaG91
bGQgYmUgcmVtb3ZlZCBieSB0aGUgdG9vbHN0YWNrLiAgV2h5IGlzIHRoaXMKPiA+IGRpZmZpY3Vs
dCA/ICAoSSBwcmVzdW1lIHRoZXJlIGlzIGEgcmVhc29uIG9yIHlvdSB3b3VsZCBoYXZlIGRvbmUg
aXQKPiA+IHRoYXQgd2F5Li4uKQo+IAo+IEl0IHdhcyBkb25lIHRoaXMgd2F5IHByZXZpb3VzbHkg
YW5kIGNhdXNlZCBpc3N1ZXMsIHNlZSB0aGlzIGNvbW1pdDoKPiAKPiBjb21taXQgNTQ2Njc4YzZh
NjBmNjRmYjE4NjY0MDQ2MGRmYTY5YTgzN2M4ZmJhNQo+IEF1dGhvcjogUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBEYXRlOiAgIFdlZCBTZXAgMjMgMTI6MDY6NTYgMjAx
NSArMDIwMAo+IAo+ICAgICBsaWJ4bDogZml4IHRoZSBjbGVhbnVwIG9mIHRoZSBiYWNrZW5kIHBh
dGggd2hlbiB1c2luZyBkcml2ZXIgZG9tYWlucwoKVGhhbmtzLgoKPiAgICAgV2l0aCB0aGUgY3Vy
cmVudCBsaWJ4bCBpbXBsZW1lbnRhdGlvbiB0aGUgY29udHJvbCBkb21haW4gd2lsbAo+ICAgICBy
ZW1vdmUgYm90aCB0aGUgZnJvbnRlbmQgYW5kIHRoZSBiYWNrZW5kIHhlbnN0b3JlIHBhdGhzIG9m
IGEKPiAgICAgZGV2aWNlIHRoYXQncyBoYW5kbGVkIGJ5IGEgZHJpdmVyIGRvbWFpbi4gVGhpcyBp
cyBpbmNvcnJlY3QsCj4gICAgIHNpbmNlIHRoZSBkcml2ZXIgZG9tYWluIHBvc3NpYmx5IG5lZWRz
IHRvIGFjY2VzcyB0aGUgYmFja2VuZAo+ICAgICBwYXRoIGluIG9yZGVyIHRvIHBlcmZvcm0gdGhl
IGRpc2Nvbm5lY3Rpb24gYW5kIGNsZWFudXAgb2YgdGhlCj4gICAgIGRldmljZS4KPiAgICAgCj4g
ICAgIEZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIHRoZSBjb250cm9sIGRvbWFpbiBvbmx5IGNsZWFu
cyB0aGUKPiAgICAgZnJvbnRlbmQgcGF0aCwgbGVhdmluZyB0aGUgYmFja2VuZCBwYXRoIHRvIGJl
IGNsZWFuZWQgYnkgdGhlCj4gICAgIGRyaXZlciBkb21haW4uIE5vdGUgdGhhdCBpZiB0aGUgZGV2
aWNlIGlzIG5vdCBoYW5kbGVkIGJ5IGEKPiAgICAgZHJpdmVyIGRvbWFpbiB0aGUgY29udHJvbCBk
b21haW4gd2lsbCBwZXJmb3JtIHRoZSByZW1vdmFsIG9mCj4gICAgIGJvdGggdGhlIGZyb250ZW5k
IGFuZCB0aGUgYmFja2VuZCBwYXRocy4KCkhtbS4gIEkgc2VlIG15IEFjayBvbiB0aGF0LiAgTmV2
ZXJ0aGVsZXNzIG1heWJlIGl0IGlzIHdyb25nLgoKTG9va2luZyBhdCBpdCBhZnJlc2gsIEkgdGhp
bmsgbWF5YmUgdGhlIHJpZ2h0IGFuc3dlciBpczoKCiAqIElmIHRoZSBkcml2ZXIgZG9tYWluIGlz
IGV4cGVjdGVkIHRvIGJlIHdvcmtpbmcgcHJvcGVybHksIHRoZQogICB0b29sc3RhY2sgc2hvdWxk
IHdhaXQgZm9yIHRoZSBkcml2ZXIgZG9tYWluIHRvIGNvbXBsZXRlIHRoZSBkZXZpY2UKICAgc2h1
dGRvd24sIGJlZm9yZSByZW1vdmluZyB0aGUgYmFja2VuZCBub2RlLiAgSW5kZWVkLCB0aGUgdG9v
bHN0YWNrCiAgIG91Z2h0IHRvIHdhaXQgZm9yIHRoaXMgYmVmb3JlIGFjdHVhbGx5IGRlc3Ryb3lp
bmcgdGhlIGd1ZXN0IGluIFhlbiwKICAgYnkgdGhlIHVzdWFsIGxvZ2ljIGZvciBjbGVhbiBkb21h
aW4gc2h1dGRvd24uCgogKiBUaGVyZSBuZWVkcyB0byBiZSBhIHdheSB0byBkZWFsIHdpdGggYSBi
cm9rZW4vdW5yZXNwb25zaXZlIGRyaXZlcgogICBkb21haW4uICBUaGF0IHdpbGwgaW52b2x2ZSBu
b3Qgd2FpdGluZyBmb3IgdGhlIGJhY2tlbmQgc28gbXVzdAogICBpbnZvbHZlIHNpbXBseSBkZWxl
dGluZyB0aGUgYmFja2VuZCBmcm9tIHhlbnN0b3JlLgoKSXMgdGhlIGRpc3RpbmN0aW9uIGhlcmUg
YmV0d2VlbiAieGwgc2h1dGRvd24iIGFuZCAieGwgZGVzdHJveSIsIG9uIHRoZQphY3R1YWwgZ3Vl
c3QgZG9tYWluLCBnb29kIGVub3VnaCA/ICBIb3BlZnVsbHkgaWYgdGhlIGRyaXZlciBkb21haW4K
c2VlcyB0aGUgYmFja2VuZCBkaXJlY3Rvcnkgc2ltcGx5IHZhbmlzaCBpdCBjYW4gZGVzdHJ1Y3Rp
dmVseSB0ZWFyCmV2ZXJ5dGhpbmcgZG93biA/CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
