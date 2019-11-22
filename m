Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C4B105DAB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 01:27:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXwjx-0000uY-2l; Fri, 22 Nov 2019 00:24:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sEnY=ZO=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iXwjv-0000uT-6c
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 00:23:59 +0000
X-Inumbo-ID: 5d432f7e-0cbe-11ea-b678-bc764e2007e4
Received: from pandora.armlinux.org.uk (unknown
 [2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d432f7e-0cbe-11ea-b678-bc764e2007e4;
 Fri, 22 Nov 2019 00:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7hbwuPirwuuz0Y/+39p2Uj5Rp0ENQjemwmV/bfiS70=; b=lDIFDmcB6YuQuSGSZlFob0XEu
 OhD474Hwuwm4BhvW39/sq97d2A4scUWTlIgruSePYHHLwXTuvZd9/Q20du1X8udEiazjEEIqAUIWF
 Ir3W3OqWGvDVGQuJGVzMMS9QvGdJeCJBEURWMFWoIRXJr89V0FnZOv5Fa4HiHRPT1MZPxq470Pz9W
 z5ULDYDLKDSWnIOfRhi5FYvorVItrtOwGT8cxcze5eJnY61upZfjtjtUWo4mHYCgXKtaL3NLOx1Sn
 Ytk+lSYp6UglSzuJ8T0FIybi3aks+UMtn/vFO/bX4FlWtUHHxWicL/seNL8s7AagS6b9LXVAjpFlG
 iRmWpUnlQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42882)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iXwj5-0001as-MI; Fri, 22 Nov 2019 00:23:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iXwiw-0003Br-8q; Fri, 22 Nov 2019 00:22:58 +0000
Date: Fri, 22 Nov 2019 00:22:58 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Message-ID: <20191122002258.GD25745@shell.armlinux.org.uk>
References: <20191121184805.414758-1-pasha.tatashin@soleen.com>
 <20191121184805.414758-2-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191121184805.414758-2-pasha.tatashin@soleen.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
 privcmd_call
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, stefan@agner.ch,
 yamada.masahiro@socionext.com, will@kernel.org, boris.ostrovsky@oracle.com,
 sashal@kernel.org, sstabellini@kernel.org, jmorris@namei.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 vladimir.murzin@arm.com, marc.zyngier@arm.com, alexios.zavras@intel.com,
 tglx@linutronix.de, allison@lohutok.net, jgross@suse.com, steve.capper@arm.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, james.morse@arm.com,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDE6NDg6MDNQTSAtMDUwMCwgUGF2ZWwgVGF0YXNoaW4g
d3JvdGU6Cj4gcHJpdmNtZF9jYWxsIHJlcXVpcmVzIHRvIGVuYWJsZSBhY2Nlc3MgdG8gdXNlcnNw
YWNlIGZvciB0aGUKPiBkdXJhdGlvbiBvZiB0aGUgaHlwZXJjYWxsLgo+IAo+IEN1cnJlbnRseSwg
dGhpcyBpcyBkb25lIHZpYSBhc3NlbWJseSBtYWNyb3MuIENoYW5nZSBpdCB0byBDCj4gaW5saW5l
cyBpbnN0ZWFkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdmVsIFRhdGFzaGluIDxwYXNoYS50YXRh
c2hpbkBzb2xlZW4uY29tPgo+IC0tLQo+ICBhcmNoL2FybS9pbmNsdWRlL2FzbS9hc3NlbWJsZXIu
aCB8ICAyICstCj4gIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCAgIHwgMzIgKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgYXJjaC9hcm0veGVuL2VubGlnaHRlbi5jICAg
ICAgICAgfCAgMiArLQo+ICBhcmNoL2FybS94ZW4vaHlwZXJjYWxsLlMgICAgICAgICB8IDE1ICsr
LS0tLS0tLS0tLS0tLQo+ICBhcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUyAgICAgICB8IDE5ICsr
LS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oICAgICAgfCAy
MyArKysrKysrKysrKysrKysrKysrKy0tLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlv
bnMoKyksIDQxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9pbmNsdWRl
L2FzbS9hc3NlbWJsZXIuaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fzc2VtYmxlci5oCj4gaW5k
ZXggOTk5MjkxMjJkYWQ3Li44ZTkyNjJhMGYwMTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vaW5j
bHVkZS9hc20vYXNzZW1ibGVyLmgKPiArKysgYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hc3NlbWJs
ZXIuaAo+IEBAIC00ODAsNyArNDgwLDcgQEAgVEhVTUIoCW9ycglccmVnICwgXHJlZyAsICNQU1Jf
VF9CSVQJKQo+ICAJLm1hY3JvCXVhY2Nlc3NfZGlzYWJsZSwgdG1wLCBpc2I9MQo+ICAjaWZkZWYg
Q09ORklHX0NQVV9TV19ET01BSU5fUEFOCj4gIAkvKgo+IC0JICogV2hlbmV2ZXIgd2UgcmUtZW50
ZXIgdXNlcnNwYWNlLCB0aGUgZG9tYWlucyBzaG91bGQgYWx3YXlzIGJlCj4gKwkgKiBXaGVuZXZl
ciB3ZSByZS1lbnRlciBrZXJuZWwsIHRoZSBkb21haW5zIHNob3VsZCBhbHdheXMgYmUKPiAgCSAq
IHNldCBhcHByb3ByaWF0ZWx5Lgo+ICAJICovCj4gIAltb3YJXHRtcCwgI0RBQ1JfVUFDQ0VTU19E
SVNBQkxFCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBiL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IGluZGV4IDk4YzZiOTFiZTRhOC4uNzlkNGVm
YTNlYjYyIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+ICsr
KyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaAo+IEBAIC0xNiw2ICsxNiwyMyBAQAo+
ICAKPiAgI2luY2x1ZGUgPGFzbS9leHRhYmxlLmg+Cj4gIAo+ICsjaWZkZWYgQ09ORklHX0NQVV9T
V19ET01BSU5fUEFOCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCB1YWNjZXNzX2VuYWJs
ZSh2b2lkKQo+ICt7Cj4gKwl1bnNpZ25lZCBsb25nIHZhbCA9IERBQ1JfVUFDQ0VTU19FTkFCTEU7
Cj4gKwo+ICsJYXNtIHZvbGF0aWxlKCJtY3IgcDE1LCAwLCAlMCwgYzMsIGMwLCAwIiA6IDogInIi
ICh2YWwpKTsKPiArCWlzYigpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZv
aWQgdWFjY2Vzc19kaXNhYmxlKHZvaWQpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgdmFsID0gREFD
Ul9VQUNDRVNTX0VOQUJMRTsKPiArCj4gKwlhc20gdm9sYXRpbGUoIm1jciBwMTUsIDAsICUwLCBj
MywgYzAsIDAiIDogOiAiciIgKHZhbCkpOwo+ICsJaXNiKCk7Cj4gK30KClJhdGhlciB0aGFuIGlu
dmVudGluZyB0aGVzZSwgd2h5IG5vdCB1c2UgdWFjY2Vzc19zYXZlX2FuZF9lbmFibGUoKS4uCnVh
Y2Nlc3NfcmVzdG9yZSgpIGFyb3VuZCB0aGUgWGVuIGNhbGw/CgotLSAKUk1LJ3MgUGF0Y2ggc3lz
dGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVEMg
YnJvYWRiYW5kIGZvciAwLjhtaWxlIGxpbmUgaW4gc3VidXJiaWE6IHN5bmMgYXQgMTIuMU1icHMg
ZG93biA2MjJrYnBzIHVwCkFjY29yZGluZyB0byBzcGVlZHRlc3QubmV0OiAxMS45TWJwcyBkb3du
IDUwMGticHMgdXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
