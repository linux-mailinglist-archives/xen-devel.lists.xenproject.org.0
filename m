Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18045B047B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 21:15:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i882l-0007Nh-Ii; Wed, 11 Sep 2019 19:12:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kD4F=XG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i882k-0007Nc-Gj
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 19:12:42 +0000
X-Inumbo-ID: 207cb53e-d4c8-11e9-83dd-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 207cb53e-d4c8-11e9-83dd-12813bfff9fa;
 Wed, 11 Sep 2019 19:12:41 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A4242075C;
 Wed, 11 Sep 2019 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568229161;
 bh=VPT7mijC4q1kEydmhkrufKNG2yzGMdjsTOZaEMfyAb8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=06FeZG8ZNyNusLCCPXzRSYmNlOeHcB9qefO1tzjUjw08sIGocxmuBX/13QuREeVi3
 YneN37UBEK1ALsEP802ZNxG5xPe+yh1l9Ame8GNhvAjFqHCXFiolye32I9AJx3Cd3U
 Dzbya/sKdFP7WtGH5NKiXCZ3PD5UYH97yToyJUN0=
Date: Wed, 11 Sep 2019 12:12:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <AM0PR04MB448166E527EF4ABFCE3DD59688B10@AM0PR04MB4481.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.1909111211290.6288@sstabellini-ThinkPad-T480s>
References: <1567175255-1798-1-git-send-email-peng.fan@nxp.com>
 <d7477406-a8a0-5c3c-13dc-2c84e27b8afa@arm.com>
 <20190830085807.GA15771@infradead.org>
 <alpine.DEB.2.21.1908301926500.21347@sstabellini-ThinkPad-T480s>
 <AM0PR04MB448166E527EF4ABFCE3DD59688B10@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V2] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Catalin Marinas <Catalin.Marinas@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Christoph Hellwig <hch@infradead.org>, Julien Grall <Julien.Grall@arm.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, nd <nd@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMSBTZXAgMjAxOSwgUGVuZyBGYW4gd3JvdGU6Cj4gPiBTdWJqZWN0OiBSZTogW1BB
VENIIFYyXSBhcm06IHhlbjogbW06IHVzZSBfX0dQRl9ETUEzMiBmb3IgYXJtNjQKPiA+IAo+ID4g
KyBKdWVyZ2VuLCBCb3Jpcwo+ID4gCj4gPiBPbiBGcmksIDMwIEF1ZyAyMDE5LCBDaHJpc3RvcGgg
SGVsbHdpZyB3cm90ZToKPiA+ID4gQ2FuIHdlIHRha2UgYSBzdGVwIGJhY2sgYW5kIGZpZ3VyZSBv
dXQgd2hhdCB3ZSB3YW50IHRvIGRvIGhlcmU/Cj4gPiA+Cj4gPiA+IEFGQUlDUyB0aGlzIGZ1bmN0
aW9uIGFsbG9jYXRlcyBtZW1vcnkgZm9yIHRoZSBzd2lvdGxiLXhlbiBidWZmZXIsIGFuZAo+ID4g
PiB0aGF0IG1lYW5zIGl0IG11c3QgYmUgPD0gMzItYml0IGFkZHJlc3NhYmxlIHRvIHNhdGlzZnkg
dGhlIERNQSBBUEkKPiA+ID4gZ3VhcmFudGVlcy4gIFRoYXQgbWVhbnMgd2UgZ2VuZXJhbGx5IHdh
bnQgdG8gdXNlIEdGUF9ETUEzMgo+ID4gZXZlcnl3aGVyZQo+ID4gPiB0aGF0IGV4aXN0cywgYnV0
IG9uIHN5c3RlbXMgd2l0aCBvZGQgem9uZXMgd2UgbWlnaHQgd2FudCB0byBkaXAgaW50bwo+ID4g
PiBHRlBfRE1BLiAgVGhpcyBhbHNvIG1lYW5zIHN3aW90bGIteGVuIGRvZXNuJ3QgYWN0dWFsbHkg
ZG8gdGhlIHJpZ2h0Cj4gPiA+IHRoaW5nIG9uIHg4NiBhdCB0aGUgbW9tZW50LiAgU28gc2hvdWxk
bid0IHdlIGp1c3QgaGF2ZSBvbmUgY29tbW9uCj4gPiA+IHJvdXRpbmUgaW4gc3dpb3RsYi14ZW4u
YyB0aGF0IGNoZWNrcyBpZiB3ZSBoYXZlIENPTkZJR19aT05FX0RNQTMyIHNldCwKPiA+ID4gdGhl
biB0cnkgR0ZQX0RNQTMyLCBhbmQgaWYgbm90IGNoZWNrIGlmIENPTkZJR19aT05FX0RNQSBpcyBz
ZXQgYW5kCj4gPiA+IHRoZW4gdHJ5IHRoYXQsIGVsc2UgZGVmYXVsdCB0byBHRlBfS0VSTkVMPwo+
ID4gCj4gPiBZZXMsIGZvciBBUk0vQVJNNjQgaXQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UgZ2l2ZW4g
dGhhdCBkb20wIGlzIDE6MSBtYXBwZWQKPiA+IChwc2V1ZG8tcGh5c2ljYWwgPT0gcGh5c2ljYWwp
LiAgSSdsbCBsZXQgSnVlcmdlbiBhbmQgQm9yaXMgY29tbWVudCBvbiB0aGUgeDg2Cj4gPiBzaWRl
IG9mIHRoaW5ncywgYnV0IG9uIHg4NiBQViBEb20wIGlzIG5vdCAxOjEgbWFwcGVkIHNvCj4gPiBH
RlBfRE1BMzIgaXMgcHJvYmFibHkgbm90IG1lYW5pbmdmdWwuCj4gCj4gSWYgd2Ugb25seSB0YWtl
IEFSTS9BUk02NCwgc28gY291bGQgdGhlIGZvbGxvd2luZyBwYXRjaCBiZSBvaz8KPiAKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwo+IGluZGV4IGQz
M2I3N2U5YWRkMy4uZTVhNmE3M2IyZTA2IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5j
Cj4gKysrIGIvYXJjaC9hcm0veGVuL21tLmMKPiBAQCAtMjgsNyArMjgsMTEgQEAgdW5zaWduZWQg
bG9uZyB4ZW5fZ2V0X3N3aW90bGJfZnJlZV9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIpCj4gCj4g
ICAgICAgICBmb3JfZWFjaF9tZW1ibG9jayhtZW1vcnksIHJlZykgewo+ICAgICAgICAgICAgICAg
ICBpZiAocmVnLT5iYXNlIDwgKHBoeXNfYWRkcl90KTB4ZmZmZmZmZmYpIHsKPiArI2lmZGVmIENP
TkZJR19aT05FX0RNQTMyCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgfD0gX19HRlBf
RE1BMzI7Cj4gKyNlbHNlCj4gICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MgfD0gX19HRlBf
RE1BOwo+ICsjZW5kaWYKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAg
ICAgICAgICAgfQo+ICAgICAgICAgfQoKSSBhbSBPSyB3aXRoIHNvbWV0aGluZyBsaWtlIHRoaXMs
IGJ1dCBhdCB0aGF0IHBvaW50IHdlIGNhbiB1c2UKSVNfRU5BQkxFRChDT05GSUdfWk9ORV9ETUEz
MikgZm9yIHRoZSBjaGVjay4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
