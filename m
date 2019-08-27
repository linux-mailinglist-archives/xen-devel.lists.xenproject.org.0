Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B39D9E4BC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:48:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Y2j-00022x-6O; Tue, 27 Aug 2019 09:45:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZYv3=WX=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1i2Y2h-00022p-3R
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:45:35 +0000
X-Inumbo-ID: 67463d7a-c8af-11e9-8980-bc764e2007e4
Received: from pandora.armlinux.org.uk (unknown
 [2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67463d7a-c8af-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=db4eeeBDxOPeQgCnxVgK0cY8TBZGLFlCe0NsKNFsxDw=; b=pE4dxLaD4wDroPGs8tQLb6wF0
 V+nS/JucfqBwoulqP0IfXx6iiAVhPBAlNdlPeLBPz65OMFeoMqdEOkAVzaLSf4kHnFIhnr70g6yE3
 khUUxAHxfcda9QVcxqglAMS8K8PVBqsVS6QAqd/5+KzM/Kb5j9Rkd1oD1Tm+PcypsIS+D2YBXswKN
 10c3adRsX0Si5HSR9OoZFhhjY/dJ3G3dyIdDYqE01O2glKpBQtH5vIPwho7cjB9q7nlgAs67xH0CL
 /U0G8hs5+Ie3mnYVJv9fabZP0c7XGDfMRW1F2KJLf+h1Vv6SeqI4hVts1ZkI/Y3A000xdMHIPGHKU
 GRJfQ/gwQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38568)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1i2Y2V-0003bW-8m; Tue, 27 Aug 2019 10:45:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1i2Y2S-0005ek-8q; Tue, 27 Aug 2019 10:45:20 +0100
Date: Tue, 27 Aug 2019 10:45:20 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Peng Fan <peng.fan@nxp.com>
Message-ID: <20190827094520.GJ13294@shell.armlinux.org.uk>
References: <20190709083729.11135-1-peng.fan@nxp.com>
 <AM0PR04MB448135E1B2C85F0B6029F7B788C70@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818BB69CAD35DC989A416988A00@AM0PR04MB4481.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM0PR04MB44818BB69CAD35DC989A416988A00@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "van.freenix@gmail.com" <van.freenix@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WW91IG5lZWQgdG8gZmluZCBzb21lb25lIHdobyBpcyBpbnRlcmVzdGVkIGluIFhlbiBvbiAzMi1i
aXQgQVJNLCBhbmQKd2hvIGtub3dzIHRoaXMgY29kZSAtIGFuZCB0aGVyZWZvcmUgd2hhdCBpbXBh
Y3QgeW91ciBjaGFuZ2UgY2F1c2VzLgpUaGF0IGlzbid0IG1lLCBzb3JyeS4KCk9uIFR1ZSwgQXVn
IDI3LCAyMDE5IGF0IDA5OjI3OjUzQU0gKzAwMDAsIFBlbmcgRmFuIHdyb3RlOgo+IFBpbmcgYWdh
aW4uLgo+IAo+ICtKdWxpZW4KPiAKPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGFybTogeGVuOiBt
bTogdXNlIF9fR1BGX0RNQTMyIGZvciBhcm02NAo+ID4gCj4gPiBIaSBSdXNzZWxsLCBTdGVmYW5v
Cj4gPiAKPiA+ID4gU3ViamVjdDogW1BBVENIXSBhcm06IHhlbjogbW06IHVzZSBfX0dQRl9ETUEz
MiBmb3IgYXJtNjQKPiA+IAo+ID4gQW55IGNvbW1lbnRzPwo+ID4gCj4gPiA+Cj4gPiA+IGFybTY0
IHNoYXJlcyBzb21lIGNvZGUgdW5kZXIgYXJjaC9hcm0veGVuLCBpbmNsdWRpbmcgbW0uYy4KPiA+
ID4gSG93ZXZlciBaT05FX0RNQSBpcyByZW1vdmVkIGJ5IGNvbW1pdAo+ID4gPiBhZDY3ZjVhNjU0
NSgiYXJtNjQ6IHJlcGxhY2UgWk9ORV9ETUEgd2l0aCBaT05FX0RNQTMyIikuCj4gPiA+IFNvIHRv
IEFSTTY0LCBuZWVkIHVzZSBfX0dGUF9ETUEzMi4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTog
UGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9hcm0veGVu
L21tLmMgfCAyICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJj
aC9hcm0veGVuL21tLmMgaW5kZXgKPiA+ID4gZTFkNDRiOTAzZGZjLi5hOTVlNzZkMThiZjkgMTAw
NjQ0Cj4gPiA+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCj4gPiA+ICsrKyBiL2FyY2gvYXJtL3hl
bi9tbS5jCj4gPiA+IEBAIC0yNyw3ICsyNyw3IEBAIHVuc2lnbmVkIGxvbmcgeGVuX2dldF9zd2lv
dGxiX2ZyZWVfcGFnZXModW5zaWduZWQKPiA+IGludAo+ID4gPiBvcmRlcikKPiA+ID4KPiA+ID4g
IAlmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgewo+ID4gPiAgCQlpZiAocmVnLT5iYXNl
IDwgKHBoeXNfYWRkcl90KTB4ZmZmZmZmZmYpIHsKPiA+ID4gLQkJCWZsYWdzIHw9IF9fR0ZQX0RN
QTsKPiA+ID4gKwkJCWZsYWdzIHw9IF9fR0ZQX0RNQSB8IF9fR0ZQX0RNQTMyOwo+ID4gPiAgCQkJ
YnJlYWs7Cj4gPiA+ICAJCX0KPiA+ID4gIAl9Cj4gPiAKPiA+IFRoYW5rcywKPiA+IFBlbmcuCj4g
Cj4gVGhhbmtzLAo+IFBlbmcuCj4gCj4gPiAKPiA+ID4gLS0KPiA+ID4gMi4xNi40Cj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YXJtLWtlcm5lbAo+IAoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGlu
dXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwpGVFRDIGJyb2FkYmFuZCBmb3IgMC44bWlsZSBs
aW5lIGluIHN1YnVyYmlhOiBzeW5jIGF0IDEyLjFNYnBzIGRvd24gNjIya2JwcyB1cApBY2NvcmRp
bmcgdG8gc3BlZWR0ZXN0Lm5ldDogMTEuOU1icHMgZG93biA1MDBrYnBzIHVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
