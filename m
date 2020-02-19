Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A3C164D06
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 18:54:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4TWE-0003Kn-Hw; Wed, 19 Feb 2020 17:52:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4TWD-0003Ki-42
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 17:52:17 +0000
X-Inumbo-ID: 90c111ae-5340-11ea-b0fd-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90c111ae-5340-11ea-b0fd-bc764e2007e4;
 Wed, 19 Feb 2020 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582134736;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kgXJksTmiUy8/fuwS7qcWPMbIXM8eywDtbiK5AmnPy8=;
 b=b36qqNwm28C+O5XtuRj3QtpaR6zKHSzmfLzJSiwElnio7cPYZFrztO4L
 qH4K538Tr3z0W4PTIYA4XA6B6PyyI1wE1e/cT2fAOcTykCnlJjGOszpl8
 /6rU+IK0YRRqGz8WUA6V/1SOJlm2wMqNQS5/AU6H9IqiF39OKwZ+NU2I2 w=;
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
IronPort-SDR: w8dCop1LpEKXgqlAQbh0r/98B0a3Rpy8JvM/dCPdXwoMb7HGvs51QSvamtA+p32ausZZRanT+K
 seiTkup9j0RRGAys/Z3XsgVZqycDq/z8pblQuyVx/00oIuc6vl4yD/YfDWVAZecDJ7dM+yrwb0
 xLNHkoT6FymBl8auxqEfFE33h5bOJMnYqWNtVGnKn8KdZVkqeq1DZM96N0hCeNhI3fa/YwpLuv
 KcBqZIDFK93hlKiWpwzRYmnz79ncw+YKaDM3CupDGN5raldyOlL0vcvo2INU9q5KWxg+vOMTQk
 FUg=
X-SBRS: 2.7
X-MesageID: 13325079
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="13325079"
Date: Wed, 19 Feb 2020 18:52:08 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200219175208.GH4679@Air-de-Roger>
References: <20200219114411.26922-1-liuwe@microsoft.com>
 <20200219114411.26922-4-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219114411.26922-4-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 3/3] x86/hyperv: L0 assisted TLB flush
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMTE6NDQ6MTFBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBJbXBsZW1lbnQgTDAgYXNzaXN0ZWQgVExCIGZsdXNoIGZvciBYZW4gb24gSHlwZXItVi4gSXQg
dGFrZXMgYWR2YW50YWdlCj4gb2Ygc2V2ZXJhbCBoeXBlcmNhbGxzOgo+IAo+ICAqIEhWQ0FMTF9G
TFVTSF9WSVJUVUFMX0FERFJFU1NfTElTVAo+ICAqIEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJF
U1NfTElTVF9FWAo+ICAqIEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfU1BBQ0UKPiAgKiBI
VkNBTExfRkxVU0hfVklSVFVBTF9BRERSRVNTX1NQQUNFX0VYCj4gCj4gUGljayB0aGUgbW9zdCBl
ZmZpY2llbnQgaHlwZXJjYWxscyBhdmFpbGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KCkxHVE06CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgo+ICtpbnQgY3B1bWFza190b192cHNldChzdHJ1
Y3QgaHZfdnBzZXQgKnZwc2V0LAo+ICsgICAgICAgICAgICAgICAgICAgICBjb25zdCBjcHVtYXNr
X3QgKm1hc2spCj4gK3sKPiArICAgIGludCBuciA9IDE7Cj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1
LCB2Y3B1X2JhbmssIHZjcHVfb2Zmc2V0Owo+ICsgICAgdW5zaWduZWQgaW50IG1heF9iYW5rcyA9
IG1zX2h5cGVydi5tYXhfdnBfaW5kZXggLyA2NDsKPiArCj4gKyAgICAvKiBVcCB0byA2NCBiYW5r
cyBjYW4gYmUgcmVwcmVzZW50ZWQgYnkgdmFsaWRfYmFua19tYXNrICovCj4gKyAgICBpZiAoIG1h
eF9iYW5rcyA+IDY0ICkKPiArICAgICAgICByZXR1cm4gLUUyQklHOwo+ICsKPiArICAgIC8qIENs
ZWFyIGFsbCBiYW5rcyB0byBhdm9pZCBmbHVzaGluZyB1bndhbnRlZCBDUFVzICovCj4gKyAgICBm
b3IgKCB2Y3B1X2JhbmsgPSAwOyB2Y3B1X2JhbmsgPCBtYXhfYmFua3M7IHZjcHVfYmFuaysrICkK
PiArICAgICAgICB2cHNldC0+YmFua19jb250ZW50c1t2Y3B1X2JhbmtdID0gMDsKPiArCj4gKyAg
ICB2cHNldC0+Zm9ybWF0ID0gSFZfR0VORVJJQ19TRVRfU1BBUlNFXzRLOwo+ICsKPiArICAgIGZv
cl9lYWNoX2NwdSAoIGNwdSwgbWFzayApCj4gKyAgICB7Cj4gKyAgICAgICAgdW5zaWduZWQgaW50
IHZjcHUgPSBodl92cF9pbmRleChjcHUpOwo+ICsKPiArICAgICAgICB2Y3B1X2JhbmsgPSB2Y3B1
IC8gNjQ7Cj4gKyAgICAgICAgdmNwdV9vZmZzZXQgPSB2Y3B1ICUgNjQ7Cj4gKwo+ICsgICAgICAg
IF9fc2V0X2JpdCh2Y3B1X29mZnNldCwgJnZwc2V0LT5iYW5rX2NvbnRlbnRzW3ZjcHVfYmFua10p
Owo+ICsKPiArICAgICAgICBpZiAoIHZjcHVfYmFuayA+PSBuciApCj4gKyAgICAgICAgICAgIG5y
ID0gdmNwdV9iYW5rICsgMTsKPiArICAgIH0KPiArCj4gKyAgICAvKiBTb21lIGJhbmtzIG1heSBi
ZSBlbXB0eSBidXQgdGhhdCdzIG9rICovCj4gKyAgICB2cHNldC0+dmFsaWRfYmFua19tYXNrID0g
fjBVTEwgPj4gKDY0IC0gbnIpOwoKWW91IGNvdWxkIGFsc28gdXNlIHRoZSByZWNlbnRseSBpbnRy
b2R1Y2VkIGJpdG1hcF9zZXQgaGVyZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
