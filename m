Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D34182EBD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 12:14:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCLl7-0005NA-A0; Thu, 12 Mar 2020 11:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=URUF=45=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jCLl6-0005N5-7r
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 11:12:12 +0000
X-Inumbo-ID: 51af9f30-6452-11ea-b14b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51af9f30-6452-11ea-b14b-12813bfff9fa;
 Thu, 12 Mar 2020 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584011531;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=S/6cvH2jY1V+y7OE6wjffecby3po5JNnWvM/GafJj2k=;
 b=YTgh2Qg32uexr9VufgZA1HYUFl7SNnFJqsZFY8CyvKwROegQnKq6dvYl
 jRGGwA0WSQN6USPSePd2awzxmgAXXJ8uVI/npvQ/Zv3o7n6fKYqoOihPX
 gBj2uwxC/NQ3SbKSZDcYEB2C/KEOFSk5/4qg/n6rgsYMERmpiQgOI6w5L 4=;
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
IronPort-SDR: xI0RgKGgH/dpQIbcsTQ6MuSwvYOBdGVtQ7dY+GZx9oCDkrGUOHhHw195APQQJgIwgGAAMBbmIA
 2wj2CISrXd+e4MCOYidApaMywuDmlAyP+0RyXnOKlgIzpdz8Ido5WNWDeXe/rURJWxLD6V5sKp
 CWJdZhI6+rdo+33ZWU2oRav7eKw/H+Pdwgr5Nl16OdHGeoFb78rpVShyajI++Ylz3MKTEMj9oe
 RD4F44D+mZsSJlgQKLVm8p1xfUJE+UoMiI6UT2Gp0PBlJ51GzmF2L8zB70onQtuTh0timn7xEt
 yNQ=
X-SBRS: 2.7
X-MesageID: 13836233
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="13836233"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24170.6406.146491.554615@mariner.uk.xensource.com>
Date: Thu, 12 Mar 2020 11:12:06 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200311172010.7777-4-roger.pau@citrix.com>
References: <20200311172010.7777-1-roger.pau@citrix.com>
 <20200311172010.7777-4-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v5 4/5] examine: detect IOMMU
 availability and add it as a hostflag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHY1IDQvNV0gZXhhbWluZTog
ZGV0ZWN0IElPTU1VIGF2YWlsYWJpbGl0eSBhbmQgYWRkIGl0IGFzIGEgaG9zdGZsYWciKToKPiBJ
bnRyb2R1Y2UgYSBuZXcgdGVzdCB0byBjaGVjayBmb3IgaW9tbXUgYXZhaWxhYmlsaXR5IGFuZCBh
ZGQgaXQgYXMgYQo+IGhvc3RmbGFnIGlmIGZvdW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENoYW5nZXMgc2luY2Ug
djQ6Cj4gIC0gU3BsaXQgb3V0IGNvZGUgaW50byBzZXBhcmF0ZSBwYXRjaGVzLgo+IAo+IENoYW5n
ZXMgc2luY2UgdjM6Cj4gIC0gRmFpbCBpZiBgeGwgaW5mb2AgY29tbWFuZCBmYWlscy4KPiAKPiBD
aGFuZ2VzIHNpbmNlIHYyOgo+ICAtIEFsbG93IGZsYWdzIHRvIGJlIHJlbW92ZWQuCj4gIC0gRml4
IHNldF9mbGFnIGFkZGl0aW9uIHRvIEhvc3RCRC9TdGF0aWMucG0uCj4gLS0tCj4gIHNnLXJ1bi1q
b2IgICAgICAgfCAgMSArCj4gIHRzLWV4YW1pbmUtaW9tbXUgfCAzMiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKPiAg
Y3JlYXRlIG1vZGUgMTAwNzU1IHRzLWV4YW1pbmUtaW9tbXUKPiAKPiBkaWZmIC0tZ2l0IGEvc2ct
cnVuLWpvYiBiL3NnLXJ1bi1qb2IKPiBpbmRleCA3YzU4ZDRiYS4uZjZiZmRmZDUgMTAwNzU1Cj4g
LS0tIGEvc2ctcnVuLWpvYgo+ICsrKyBiL3NnLXJ1bi1qb2IKPiBAQCAtNjc5LDYgKzY3OSw3IEBA
IHByb2MgZXhhbWluZS1ob3N0LWV4YW1pbmUge2luc3RhbGx9IHsKPiAgICAgIGlmIHskb2t9IHsK
PiAgCXJ1bi10cyAtLiAgPSAgICAgICAgICAgdHMtZXhhbWluZS1zZXJpYWwtcG9zdCArIGhvc3QK
PiAgCXJ1bi10cyAuICAgPSAgICAgICAgICAgdHMtZXhhbWluZS1sb2dzLXNhdmUgICArIGhvc3QK
PiArCXJ1bi10cyAuICAgPSAgICAgICAgICAgdHMtZXhhbWluZS1pb21tdSAgICAgICArIGhvc3QK
PiAgCXJ1bi10cyAuICAgPSAgICAgICAgICAgdHMtZXhhbWluZS1ob3N0cHJvcHMtc2F2ZQoKVGhh
bmtzLiAgSSBsb29rZWQgYXQgeW91ciB0ZXN0IGZsaWdodCBhbmQgdGhhdCBjYXVzZWQgbWUgdG8g
bm90aWNlCnRoYXQgdGhpcyB0cy1leGFtaW5lLWlvbW11IGlzIGluIHRoZSB3cm9uZyBwbGFjZSwg
YXQgbGVhc3QgbG9naWNhbGx5CnNwZWFraW5nLiAgTG9nIGNhcHR1cmUgc2hvdWxkIGNvbWUgbGFz
dCwganVzdCBiZWZvcmUgLWhvc3Rwcm9wcy1zYXZlLgoKU28gY2FuIHlvdSBzd2FwIC1sb2dzLXNh
dmUgYW5kIC1pb21tdSBwbGVhc2UgPwoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
