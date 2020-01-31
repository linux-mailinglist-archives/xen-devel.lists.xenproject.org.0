Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 014D114EB78
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 12:08:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixU7o-0007fT-B2; Fri, 31 Jan 2020 11:06:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pgE6=3U=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ixU7n-0007fO-0L
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 11:06:11 +0000
X-Inumbo-ID: af8f4960-4419-11ea-8bb7-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af8f4960-4419-11ea-8bb7-12813bfff9fa;
 Fri, 31 Jan 2020 11:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580468770;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WGlOcTD9SVtpYzH9AF9BnULhMI8k8+ciXjgzPlan7dk=;
 b=BoMfYL192yEH8JtW7N774P+WxHXxaow9MPioqc/2awQo6zO5NYYJMt5P
 b4DfRWfEMequYL85wMderIB6v407h60DSumRJGtqAafN/5HCNTsx/hD4z
 ijYtn9wlksV/PYg5noNEuvCuiqikc5rBVnySffP1yoGvdiPrmO5Dl3Tpl 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M6HXCA1OWMIzLHLwGjsmOJFvcBSkNXmqI4tQwoR6fX2vHD2FTQt6+NPYVarTNpRHiiHheCUubu
 LQnyvUm5V9iJWsz7m6ay6BjHnUkDJSo3vudwsufAmlHSVBVJPSkuiO4B1VpIZpHDu/rpDiwdzC
 o42ZDfJiZmVIAYMI1YTiUEos5i8W8U2VRh9m9mfEHCqnBoWxqZOvEI/jo8Y4UeDux9e2ud4uyT
 VleyLhbe+KAxroCYsU7wYBnkVIhEJWbGYqjLneYSTBGaHhWKoW4LKUuG8i9TY8zTm/WdqSAI8K
 3/g=
X-SBRS: 2.7
X-MesageID: 12352554
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,385,1574139600"; d="scan'208";a="12352554"
Date: Fri, 31 Jan 2020 12:06:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200131110603.GS4679@Air-de-Roger>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
 <20200122145248.GB57924@desktop-tdan49n.eng.citrite.net>
 <61e9f341fc1b48beaa6266bb90ff2701@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61e9f341fc1b48beaa6266bb90ff2701@EX13D32EUC003.ant.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMTA6MzE6NDlBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBYZW4tZGV2ZWwg
PHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YKPiA+
IFJvZ2VyIFBhdSBNb25uw6kKPiA+IFNlbnQ6IDIyIEphbnVhcnkgMjAyMCAxNDo1Mwo+ID4gVG86
IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiA+IENjOiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhlbi0KPiA+IGRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdl
aQo+ID4gTGl1IDx3bEB4ZW4ub3JnPgo+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRD
SCB2NCAxLzddIGxpYnhsOiBhZGQgZGVmaW5pdGlvbiBvZgo+ID4gSU5WQUxJRF9ET01JRCB0byB0
aGUgQVBJCj4gPiAKPiA+IE9uIFdlZCwgSmFuIDIyLCAyMDIwIGF0IDAyOjQ0OjQwUE0gKzAwMDAs
IFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gQ3VycmVudGx5IGJvdGggeGwgYW5kIGxpYnhsIGhh
dmUgaW50ZXJuYWwgZGVmaW5pdGlvbnMgb2YgSU5WQUxJRF9ET01JRAo+ID4gPiB3aGljaCBoYXBw
ZW4gdG8gYmUgaWRlbnRpY2FsLiBIb3dldmVyLCBmb3IgdGhlIHB1cnBvc2VzIG9mIGRlc2NyaWJp
bmcKPiA+IHRoZQo+ID4gPiBiZWhhdmlvdXIgb2YgbGlieGxfZG9tYWluX2NyZWF0ZV9uZXcvcmVz
dG9yZSgpIGl0IGlzIHVzZWZ1bCB0byBoYXZlIGEKPiA+ID4gc3BlY2lmaWVkIGludmFsaWQgdmFs
dWUgZm9yIGEgZG9tYWluIGlkLgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIHRoZXJlZm9yZSBtb3Zl
cyB0aGUgbGlieGwgZGVmaW5pdGlvbiBmcm9tIGxpYnhsX2ludGVybmFsLmggdG8KPiA+ID4gbGli
eGwuaCBhbmQgcmVtb3ZlcyB0aGUgaW50ZXJuYWwgZGVmaW5pdGlvbiBmcm9tIHhsX3V0aWxzLmgu
IFRoZQo+ID4gaGFyZGNvZGVkCj4gPiA+ICctMScgcGFzc2VkIGJhY2sgdmlhIGRvbWNyZWF0ZV9j
b21wbGV0ZSgpIGlzIHRoZW4gdXBkYXRlZCB0bwo+ID4gSU5WQUxJRF9ET01JRAo+ID4gPiBhbmQg
Y29tbWVudCBhYm92ZSBsaWJ4bF9kb21haW5fY3JlYXRlX25ldy9yZXN0b3JlKCkgaXMgYWNjb3Jk
aW5nbHkKPiA+ID4gbW9kaWZpZWQuCj4gPiAKPiA+IFVyZywgaXQncyBraW5kIG9mIHVnbHkgdG8g
YWRkIGFub3RoZXIgZGVmaW5pdGlvbiBvZiBpbnZhbGlkIGRvbWlkIHdoZW4KPiA+IHRoZXJlJ3Mg
YWxyZWFkeSBET01JRF9JTlZBTElEIGluIHRoZSBwdWJsaWMgaGVhZGVycy4gSSBndWVzcyB0aGVy
ZSdzIGEKPiA+IHJlYXNvbiBJJ20gbWlzc2luZyBmb3Igbm90IHVzaW5nIERPTUlEX0lOVkFMSUQg
aW5zdGVhZCBvZiBpbnRyb2R1Y2luZwo+ID4gYSBuZXcgdmFsdWU/Cj4gPiAKPiAKPiBUQkggSSBk
b24ndCBrbm93LiBBcyBmYXIgYXMgeGwvbGlieGwgZ29lcywgZG9taWRzIGFyZSB1aW50MzJfdHMg
c28gbWF5YmUgRE9NSURfSU5WQUxJRCB3YXMgZm9yIHNvbWUgcmVhc29uIG5vdCBjb25zaWRlcmVk
IGFwcHJvcHJpYXRlPyBCZWFyIGluIG1pbmQsIHRoaXMgcGF0Y2ggaXMgbm90IHRydWx5IGludHJv
ZHVjaW5nIGEgbmV3IHZhbHVlOyBpdCdzIGp1c3QgbWFraW5nIHNvbWV0aGluZyB0aGF0IHdhcyBp
bnRlcm5hbCBidXQgaWRlbnRpY2FsIGluIGJvdGggeGwgYW5kIGxpYnhsIHBhcnQgb2YgdGhlIGlu
dGVyZmFjZS4KCkhtLCBPSy4gSXQgc2VlbXMgcXVpdGUgYSBtZXNzIHRoYXQgbGlieGwgdXNlcyBh
IDMyYml0IHZhbHVlIHdoZW4gdGhlCmh5cGVydmlzb3IgaXMgdXNpbmcgYSAxNmJpdCBmaWVsZCwg
YnV0IEkgZ3Vlc3MgdGhlcmUncyBub3RoaW5nIHRoYXQKY2FuIGJlIGRvbmUgYXQgdGhpcyBwb2lu
dCB0byBmaXggdGhpcy4KClNpbmNlIHRoaXMgd2lsbCBiZSBwYXJ0IG9mIHRoZSBwdWJsaWMgaW50
ZXJmYWNlIG5vdywgaXQgbWlnaHQgbWFrZQpzZW5zZSB0byBkZWZpbmUgaXQgdG8gdGhlIHNhbWUg
dmFsdWUgYXMgRE9NSURfSU5WQUxJRCAoMHg3RkY0KS4gQW5kCm1ha2Ugc3VyZSBkb21pZCB2YWx1
ZXMgcGFzc2VkIHRvIGxpYnhsIGFyZSB0cnVuY2F0ZWQgdG8gMTZiaXRzLgoKTWF5YmUgaXQncyBu
b3QgdGhhdCByZWxldmFudCwgYnV0IGRvbWlkcyBwYXNzZWQgdG8gbGlieGwgd291bGQgbmVlZCB0
bwpiZSBzYW5pdGl6ZWQgaW4gb3JkZXIgdG8gbWFrZSBzdXJlIFhlbidzIERPTUlEX0lOVkFMSUQg
aXMgbm90IHRyZWF0ZWQKYXMgYSB2YWxpZCBkb21pZCB2YWx1ZSBmcm9tIGxpYnhsJ3MgUG9WLiBU
aGVyZSBhcmUgYWxzbyBvdGhlciBzcGVjaWFsCmRvbWlkcyB0aGF0IG5lZWQgdG8gYmUgZmlsdGVy
ZWQuCgo+ID4gSWYgc28gY291bGQgdGhpcyBiZSBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlPwo+ID4gCj4gCj4gSSdsbCBhZGQgYSBub3RlIHRvIHRoZSBjb21taXQgY29tbWVudCB0byBw
b2ludCBvdXQgdGhhdCB0aGlzIGlzIG5vdCBjaGFuZ2luZyBhbnkgdmFsdWUgdXNlZCBieSB0aGUg
dG9vbHN0YWNrLgoKVGhhbmtzIQoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
