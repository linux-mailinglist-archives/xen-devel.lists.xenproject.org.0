Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 408BE17DF82
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 13:08:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBHBF-0002dC-MR; Mon, 09 Mar 2020 12:06:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EaUg=42=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jBHBE-0002d3-Hp
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 12:06:44 +0000
X-Inumbo-ID: 70f78e12-61fe-11ea-b52f-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70f78e12-61fe-11ea-b52f-bc764e2007e4;
 Mon, 09 Mar 2020 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583755604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6BhYCC+etoHU1/9wYgdDMLubed7zYIfv9SphzHp/1jc=;
 b=Qq4vxBwrtYX8uLCAVqPSYV2o7aJiQwo/vHB5Gi5t1GqU7rqTPVge80yk
 narro7y/YYeGyjyxeKGFZU3Pj57ZLn36qEXr2r3IpQMRGUi3PigXMc8kl
 K0cHblbUgzl9HXHIKwCqIVPrxwedTK8rs22mlvwcOwn0D8tJyCTjqeR3T o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SayNA/nywYEYrr6r8PFkrfgZn+Vy1vxGvQOEe7E91HaX/R0c/woT+jRz4FqkxGHbRRKn7Df4jw
 8QweiTQ1j7V3QdQXT1GhYGgRB+0VgC1+Y1SohXlx0zECLPJbTbhMhcJRKJmUfaolPQPPCAHqul
 QrOHFN/pFMG0K82RZwZedGCwXSe91f7PQj1jnAEPifADeNFhsH78tOitHLN0HXyx8saAovrF0n
 HVkIRsh+vXEMJoeWM5L2HtWGQZgoYMh35x3IXPfoM1P5VEID8tNr9pKUXGUi5YsnZolLHnl8wg
 Qt0=
X-SBRS: 2.7
X-MesageID: 13606394
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,533,1574139600"; d="scan'208";a="13606394"
Date: Mon, 9 Mar 2020 12:06:40 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200309120640.GC2152@perard.uk.xensource.com>
References: <20200306174250.291503-1-anthony.perard@citrix.com>
 <20200306174250.291503-2-anthony.perard@citrix.com>
 <cfc8dcc2-6b3a-e175-4189-097e526e39b4@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cfc8dcc2-6b3a-e175-4189-097e526e39b4@xen.org>
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] xen/arm: Rename all early printk
 macro
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBNYXIgMDgsIDIwMjAgYXQgMDU6NTc6MzJQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IE9uIDA2LzAzLzIwMjAgMTc6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gV2Ug
YWxzbyByZXVzZSBDT05GSUdfRUFSTFlfUFJJTlRLIHByb3ZpZGVkIGJ5IHVzZXJzIHRvIGVuYWJs
ZSBvciBub3QKPiA+IGVhcmx5IHByaW50aywgdGh1cyB3ZSBuZWVkIHRvIG92ZXJyaWRlIHRoZSB2
YWx1ZSBpbiBtYWtlZmlsZS4KWy4uLl0KPiA+ICAgaWZuZXEgKCQoRUFSTFlfUFJJTlRLX0lOQyks
KQo+ID4gLUVBUkxZX1BSSU5USyA6PSB5Cj4gPiArb3ZlcnJpZGUgQ09ORklHX0VBUkxZX1BSSU5U
SyA6PSB5Cj4gCj4gSSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHdoeSB5b3UgYXJlIHVzaW5n
IHRoZSBkaXJlY3RpdmUgb3ZlcnJpZGUgaGVyZS4KPiBXaHkgY2FuJ3QgeW91IGp1c3QgcHJlZml4
IHRoZSB2YXJpYWJsZSB3aXRoIENPTkZJR18/CgpvdmVycmlkZSBpcyBuZWVkZWQgaWYgc29tZW9u
ZSBydW4gbWFrZSBsaWtlIHRoaXM6CiAgICBtYWtlIENPTkZJR19FQVJMWV9QUklOVEs9c3VuN2kK
b3RoZXJ3aXNlIHRoZSB2YWx1ZSBjYW4ndCBiZSBjaGFuZ2VkLgpCdXQgdGhhdCBkb3NuJ3Qgd29y
ayB3aGVuIHJ1biBsaWtlIHRoaXM6CiAgICBleHBvcnQgQ09ORklHX0VBUkxZX1BSSU5USz1zdW43
aQogICAgbWFrZQoKU28gSSdtIGdvaW5nIHRvIGhhdmUgdG8gcmVuYW1lIHRoZSB2YXJpYWJsZSBp
biB0aGUgc2Vjb25kIHBhdGNoLgoKPiA+ICAgZW5kaWYKPiA+IC1DRkxBR1MtJChFQVJMWV9QUklO
VEspICs9IC1EQ09ORklHX0VBUkxZX1BSSU5USwo+ID4gLUNGTEFHUy0kKEVBUkxZX1BSSU5US19J
TklUX1VBUlQpICs9IC1ERUFSTFlfUFJJTlRLX0lOSVRfVUFSVAo+ID4gLUNGTEFHUy0kKEVBUkxZ
X1BSSU5USykgKz0gLURFQVJMWV9QUklOVEtfSU5DPVwiZGVidWctJChFQVJMWV9QUklOVEtfSU5D
KS5pbmNcIgo+ID4gLUNGTEFHUy0kKEVBUkxZX1BSSU5USykgKz0gLURFQVJMWV9QUklOVEtfQkFV
RD0kKEVBUkxZX1BSSU5US19CQVVEKQo+ID4gLUNGTEFHUy0kKEVBUkxZX1BSSU5USykgKz0gLURF
QVJMWV9VQVJUX0JBU0VfQUREUkVTUz0kKEVBUkxZX1VBUlRfQkFTRV9BRERSRVNTKQo+ID4gLUNG
TEFHUy0kKEVBUkxZX1BSSU5USykgKz0gLURFQVJMWV9VQVJUX1JFR19TSElGVD0kKEVBUkxZX1VB
UlRfUkVHX1NISUZUKQo+ID4gK0NGTEFHUy0kKENPTkZJR19FQVJMWV9QUklOVEspICs9IC1EQ09O
RklHX0VBUkxZX1BSSU5USwo+ID4gK0NGTEFHUy0kKEVBUkxZX1BSSU5US19JTklUX1VBUlQpICs9
IC1EQ09ORklHX0VBUkxZX1VBUlRfSU5JVAo+ID4gK0NGTEFHUy0kKENPTkZJR19FQVJMWV9QUklO
VEspICs9IC1EQ09ORklHX0VBUkxZX1BSSU5US19JTkM9XCJkZWJ1Zy0kKEVBUkxZX1BSSU5US19J
TkMpLmluY1wiCj4gPiArQ0ZMQUdTLSQoQ09ORklHX0VBUkxZX1BSSU5USykgKz0gLURDT05GSUdf
RUFSTFlfVUFSVF9CQVVEX1JBVEU9JChFQVJMWV9QUklOVEtfQkFVRCkKPiAKPiBUaGUgYmF1ZCBy
YXRlIGlzIG9ubHkgdXNlZCBieSB0aGUgUEwwMTEgaW4gcmFyZSBjYXNlcy4gU28gSSB3b3VsZCBh
ZGQgUEwwMTEKPiBpbiB0aGUgbmFtZS4KClNvdW5kIGZpbmUsIEknbGwgcmVuYW1lIGl0LgoKPiA+
ICtDRkxBR1MtJChDT05GSUdfRUFSTFlfUFJJTlRLKSArPSAtRENPTkZJR19FQVJMWV9VQVJUX0JB
U0VfQUREUkVTUz0kKEVBUkxZX1VBUlRfQkFTRV9BRERSRVNTKQo+ID4gK0NGTEFHUy0kKENPTkZJ
R19FQVJMWV9QUklOVEspICs9IC1EQ09ORklHX0VBUkxZX1VBUlRfODI1MF9SRUdfU0hJRlQ9JChF
QVJMWV9VQVJUX1JFR19TSElGVCkKPiAKPiBUaGUgbmFtZSBjbGVhcmx5IHN1Z2dlc3RzIHRoYXQg
dGhpcyBzaG91bGQgYmUgcHJvdGVjdGVkIHdpdGggYW4gImlmIDgyNTAiLgo+IE1heWJlIGluIHRo
ZSBzaW1pbGFyIHdheSBhcyBmb3IgdGhlIHNjaWYgc3BlY2lmaWMgdmFyaWFibGVzLiBCdXQuLi4g
SSBhbSBub3QKPiBnb2luZyB0byBwdXNoIGZvciBpdCBhcyB0aGUgbmV4dCBwYXRjaCBpcyBnb2lu
ZyB0byByZW1vdmUgaXQuCgpZZXAsIHNvbWUgbWFjcm8gZ2V0cyBkZWZpbmVkIHdpdGhvdXQgYSB2
YWx1ZS4gIDotKQpCdXQgdGhhdCBnZXRzIGZpeCBpbiB0aGUgbmV4dCBwYXRjaC4KClRoYW5rcywK
Ci0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
