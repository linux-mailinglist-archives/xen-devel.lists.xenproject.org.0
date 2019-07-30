Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B27B408
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:09:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYOm-0003I7-2C; Tue, 30 Jul 2019 20:07:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsYOl-0003I2-Ao
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:07:03 +0000
X-Inumbo-ID: 9818a52e-b305-11e9-83c6-bf1290541970
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9818a52e-b305-11e9-83c6-bf1290541970;
 Tue, 30 Jul 2019 20:07:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7736420659;
 Tue, 30 Jul 2019 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564517221;
 bh=gGuf7Fa7PaXKDlDaVyAsk3r2kFn644NoTkA+MjzkOq4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=IUzZ6a/ryfPG92gl+yd7WTrDKHT3c4gOo3qBBVBVhJNmXs718J4S0qD320Vbvg3fn
 9uA8fDXPPSiv4vk7nyEutzzuembkxlUxS0CwUVCHqwiQsk1UPzFmPd4J0GxFIIVIto
 Q6sLD8mJ2U4YdA1GHzxCuMZe8T468AjeCLIGnNN4=
Date: Tue, 30 Jul 2019 13:07:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-25-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301248420.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-25-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 24/35] xen/arm32: head: Introduce
 distinct paths for the boot CPU and secondary CPUs
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

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBib290IGNvZGUg
aXMgY3VycmVudGx5IHF1aXRlIGRpZmZpY3VsdCB0byBnbyB0aHJvdWdoIGJlY2F1c2Ugb2YgdGhl
Cj4gbGFjayBvZiBkb2N1bWVudGF0aW9uIGFuZCBhIG51bWJlciBvZiBpbmRpcmVjdGlvbiB0byBh
dm9pZCBleGVjdXRpbmcKPiBzb21lIHBhdGggaW4gZWl0aGVyIHRoZSBib290IENQVSBvciBzZWNv
bmRhcnkgQ1BVcy4KPiAKPiBJbiBhbiBhdHRlbXB0IHRvIG1ha2UgdGhlIGJvb3QgY29kZSBlYXNp
ZXIgdG8gZm9sbG93LCBlYWNoIHBhcnRzIG9mIHRoZQo+IGJvb3QgYXJlIG5vdyBpbiBzZXBhcmF0
ZSBmdW5jdGlvbnMuIEZ1cnRoZXJtb3JlLCB0aGUgcGF0aHMgZm9yIHRoZSBib290Cj4gQ1BVIGFu
ZCBzZWNvbmRhcnkgQ1BVcyBhcmUgbm93IGRpc3RpbmN0IGFuZCBmb3Igbm93IHdpbGwgY2FsbCBl
YWNoCj4gZnVuY3Rpb25zLgo+IAo+IEZvbGxvdy11cHMgd2lsbCByZW1vdmUgdW5uZWNlc3Nhcnkg
Y2FsbHMgYW5kIGRvIGZ1cnRoZXIgaW1wcm92ZW1lbnQKPiAoc3VjaCBhcyBhZGRpbmcgZG9jdW1l
bnRhdGlvbiBhbmQgcmVzaHVmZmxpbmcpLgo+IAo+IE5vdGUgdGhhdCB0aGUgc3dpdGNoIGZyb20g
dXNpbmcgdGhlIElEIG1hcHBpbmcgdG8gdGhlIHJ1bnRpbWUgbWFwcGluZwo+IGlzIGR1cGxpY2F0
ZWQgZm9yIGVhY2ggcGF0aC4gVGhpcyBpcyBiZWNhdXNlIGluIHRoZSBmdXR1cmUgd2Ugd2lsbCBu
ZWVkCj4gdG8gc3RheSBsb25nZXIgaW4gdGhlIElEIG1hcHBpbmcgZm9yIHRoZSBib290IENQVS4K
PiAKPiBMYXN0bHksIGl0IGlzIG5vdyByZXF1aXJlZCB0byBzYXZlIGxyIGluIGNwdV9pbml0KCkg
YmVjYXVzd2UgdGhlCj4gZnVuY3Rpb24gd2lsbCBjYWxsIG90aGVyIGZ1bmN0aW9ucyBhbmQgdGhl
cmVmb3JlIGNsb2JiZXIgbHIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAg
IC0gUGF0Y2ggYWRkZWQKPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDY0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMK
PiBpbmRleCBiYmNmZGNkMzUxLi4xMzc5M2U4NWQ4IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gQEAgLTE0
OCw3ICsxNDgsMTkgQEAgcGFzdF96SW1hZ2U6Cj4gIAo+ICAgICAgICAgIG1vdiAgIHIxMiwgIzAg
ICAgICAgICAgICAgICAgLyogcjEyIDo9IGlzX3NlY29uZGFyeV9jcHUgKi8KPiAgCj4gLSAgICAg
ICAgYiAgICAgY29tbW9uX3N0YXJ0Cj4gKyAgICAgICAgYmwgICAgY2hlY2tfY3B1X21vZGUKPiAr
ICAgICAgICBibCAgICB6ZXJvX2Jzcwo+ICsgICAgICAgIGJsICAgIGNwdV9pbml0Cj4gKyAgICAg
ICAgYmwgICAgY3JlYXRlX3BhZ2VfdGFibGVzCj4gKyAgICAgICAgYmwgICAgZW5hYmxlX21tdQo+
ICsKPiArICAgICAgICAvKiBXZSBhcmUgc3RpbGwgaW4gdGhlIElEIG1hcC4gSnVtcCB0byB0aGUg
cnVudGltZSBWaXJ0dWFsIEFkZHJlc3MgKi8KClRoZSBhcm02NCBwYXRjaCBoYXMgYmVlbiBzd2l0
Y2hlZCB0byB1c2UgIjE6MSIsIGl0IHdvdWxkIGJlIGdvb2QgdG8gYmUKY29uc2lzdGVudC4gSW4g
dGhlIGNvbW1pdCBtZXNzYWdlIHRvby4KCgo+ICsgICAgICAgIGxkciAgIHIwLCA9cHJpbWFyeV9z
d2l0Y2hlZAo+ICsgICAgICAgIG1vdiAgIHBjLCByMAo+ICtwcmltYXJ5X3N3aXRjaGVkOgo+ICsg
ICAgICAgIGJsICAgIHNldHVwX2ZpeG1hcAo+ICsgICAgICAgIGIgICAgIGxhdW5jaAo+ICtFTkRQ
Uk9DKHN0YXJ0KQo+ICAKPiAgR0xPQkFMKGluaXRfc2Vjb25kYXJ5KQo+ICAgICAgICAgIGNwc2lk
IGFpZiAgICAgICAgICAgICAgICAgICAgLyogRGlzYWJsZSBhbGwgaW50ZXJydXB0cyAqLwo+IEBA
IC0xNzksOCArMTkxLDIxIEBAIEdMT0JBTChpbml0X3NlY29uZGFyeSkKPiAgICAgICAgICBwcmlu
dF9yZWcgcjcKPiAgICAgICAgICBQUklOVCgiIGJvb3RpbmcgLVxyXG4iKQo+ICAjZW5kaWYKPiAt
Cj4gLWNvbW1vbl9zdGFydDoKPiArICAgICAgICBibCAgICBjaGVja19jcHVfbW9kZQo+ICsgICAg
ICAgIGJsICAgIHplcm9fYnNzCj4gKyAgICAgICAgYmwgICAgY3B1X2luaXQKPiArICAgICAgICBi
bCAgICBjcmVhdGVfcGFnZV90YWJsZXMKPiArICAgICAgICBibCAgICBlbmFibGVfbW11Cj4gKwo+
ICsgICAgICAgIC8qIFdlIGFyZSBzdGlsbCBpbiB0aGUgSUQgbWFwLiBKdW1wIHRvIHRoZSBydW50
aW1lIFZpcnR1YWwgQWRkcmVzcy4gKi8KClNhbWUgaGVyZS4KCgo+ICsgICAgICAgIGxkciAgIHIw
LCA9c2Vjb25kYXJ5X3N3aXRjaGVkCj4gKyAgICAgICAgbW92ICAgcGMsIHIwCj4gK3NlY29uZGFy
eV9zd2l0Y2hlZDoKPiArICAgICAgICBibCAgICBzZXR1cF9maXhtYXAKPiArICAgICAgICBiICAg
ICBsYXVuY2gKPiArRU5EUFJPQyhpbml0X3NlY29uZGFyeSkKPiArCj4gK2NoZWNrX2NwdV9tb2Rl
Ogo+ICAgICAgICAgIC8qIENoZWNrIHRoYXQgdGhpcyBDUFUgaGFzIEh5cCBtb2RlICovCj4gICAg
ICAgICAgbXJjICAgQ1AzMihyMCwgSURfUEZSMSkKPiAgICAgICAgICBhbmQgICByMCwgcjAsICMw
eGYwMDAgICAgICAgIC8qIEJpdHMgMTItMTUgZGVmaW5lIHZpcnQgZXh0ZW5zaW9ucyAqLwo+IEBA
IC0yMDIsNyArMjI3LDEwIEBAIGNvbW1vbl9zdGFydDoKPiAgICAgICAgICBiICAgICBmYWlsCj4g
IAo+ICBoeXA6ICAgIFBSSU5UKCItIFhlbiBzdGFydGluZyBpbiBIeXAgbW9kZSAtXHJcbiIpCj4g
KyAgICAgICAgbW92ICAgcGMsIGxyCj4gK0VORFBST0MoY2hlY2tfY3B1X21vZGUpCj4gIAo+ICt6
ZXJvX2JzczoKPiAgICAgICAgICAvKiBaZXJvIEJTUyBPbiB0aGUgYm9vdCBDUFUgdG8gYXZvaWQg
bmFzdHkgc3VycHJpc2VzICovCj4gICAgICAgICAgdGVxICAgcjEyLCAjMAo+ICAgICAgICAgIGJu
ZSAgIHNraXBfYnNzCj4gQEAgLTIxOSw4ICsyNDcsMTQgQEAgaHlwOiAgICBQUklOVCgiLSBYZW4g
c3RhcnRpbmcgaW4gSHlwIG1vZGUgLVxyXG4iKQo+ICAgICAgICAgIGJsbyAgIDFiCj4gIAo+ICBz
a2lwX2JzczoKPiArICAgICAgICBtb3YgICBwYywgbHIKPiArRU5EUFJPQyh6ZXJvX2JzcykKPiAr
Cj4gK2NwdV9pbml0Ogo+ICAgICAgICAgIFBSSU5UKCItIFNldHRpbmcgdXAgY29udHJvbCByZWdp
c3RlcnMgLVxyXG4iKQo+ICAKPiArICAgICAgICBtb3YgICByNSwgbHIJCQkgICAgICAgICAgICAv
KiByNSA6PSByZXR1cm4gYWRkcmVzcyAqLwoKUGxlYXNlIGFsaWduIHRoZSBjb21tZW50IHdpdGgg
dGhlIG90aGVycyBpbiB0aGlzIHByb2MuCgpPdGhlciB0aGFuIHRoZXNlIG1pbm9yIGNvbW1lbnRz
IHRoZSBwYXRjaCBsb29rcyBmaW5lLiBIYXZlIHlvdSBoYWQgYQpjaGFuY2UgdG8gdGVzdCBpdCBv
biByZWFsIGhhcmR3YXJlPwoKCj4gKwo+ICAgICAgICAgIC8qIEdldCBwcm9jZXNzb3Igc3BlY2lm
aWMgcHJvYyBpbmZvIGludG8gcjEgKi8KPiAgICAgICAgICBibCAgICBfX2xvb2t1cF9wcm9jZXNz
b3JfdHlwZQo+ICAgICAgICAgIHRlcSAgIHIxLCAjMAo+IEBAIC0yMzEsNyArMjY1LDYgQEAgc2tp
cF9ic3M6Cj4gICAgICAgICAgUFJJTlQoIiAtXHJcbiIpCj4gICAgICAgICAgYiAgICAgZmFpbAo+
ICAxOgo+IC0KPiAgICAgICAgICAvKiBKdW1wIHRvIGNwdV9pbml0ICovCj4gICAgICAgICAgbGRy
ICAgcjEsIFtyMSwgI1BST0NJTkZPX2NwdV9pbml0XSAgLyogcjEgOj0gdmFkZHIoaW5pdCBmdW5j
KSAqLwo+ICAgICAgICAgIGFkciAgIGxyLCBjcHVfaW5pdF9kb25lICAgICAgICAgICAgIC8qIFNh
dmUgcmV0dXJuIGFkZHJlc3MgKi8KPiBAQCAtMjU2LDYgKzI4OSwxMCBAQCBjcHVfaW5pdF9kb25l
Ogo+ICAgICAgICAgIGxkciAgIHIwLCA9SFNDVExSX1NFVAo+ICAgICAgICAgIG1jciAgIENQMzIo
cjAsIEhTQ1RMUikKPiAgCj4gKyAgICAgICAgbW92ICAgcGMsIHI1ICAgICAgICAgICAgICAgICAg
ICAgICAgLyogUmV0dXJuIGFkZHJlc3MgaXMgaW4gcjUgKi8KPiArRU5EUFJPQyhjcHVfaW5pdCkK
PiArCj4gK2NyZWF0ZV9wYWdlX3RhYmxlczoKPiAgICAgICAgICAvKgo+ICAgICAgICAgICAqIFJl
YnVpbGQgdGhlIGJvb3QgcGFnZXRhYmxlJ3MgZmlyc3QtbGV2ZWwgZW50cmllcy4gVGhlIHN0cnVj
dHVyZQo+ICAgICAgICAgICAqIGlzIGRlc2NyaWJlZCBpbiBtbS5jLgo+IEBAIC0zNTksMTUgKzM5
NiwxNiBAQCBjcHVfaW5pdF9kb25lOgo+ICAgICAgICAgIC8qIGJvb3QgcGFnZXRhYmxlIHNldHVw
IGNvbXBsZXRlICovCj4gIAo+ICAgICAgICAgIGNtcCAgIHI2LCAjMSAgICAgICAgICAgICAgICAv
KiBEaWQgd2UgbWFuYWdlIHRvIGNyZWF0ZSBhbiBpZGVudGl0eSBtYXBwaW5nID8gKi8KPiAtICAg
ICAgICBiZXEgICAxZgo+ICsgICAgICAgIG1vdmVxIHBjLCBscgo+ICAgICAgICAgIFBSSU5UKCJV
bmFibGUgdG8gYnVpbGQgYm9vdCBwYWdlIHRhYmxlcyAtIEZhaWxlZCB0byBpZGVudGl0eSBtYXAg
WGVuLlxyXG4iKQo+ICAgICAgICAgIGIgICAgIGZhaWwKPiAgdmlydHBoeXNfY2xhc2g6Cj4gICAg
ICAgICAgLyogSWRlbnRpdHkgbWFwIGNsYXNoZXMgd2l0aCBib290X3RoaXJkLCB3aGljaCB3ZSBj
YW5ub3QgaGFuZGxlIHlldCAqLwo+ICAgICAgICAgIFBSSU5UKCItIFVuYWJsZSB0byBidWlsZCBi
b290IHBhZ2UgdGFibGVzIC0gdmlydCBhbmQgcGh5cyBhZGRyZXNzZXMgY2xhc2guIC1cclxuIikK
PiAgICAgICAgICBiICAgICBmYWlsCj4gK0VORFBST0MoY3JlYXRlX3BhZ2VfdGFibGVzKQo+ICAK
PiAtMToKPiArZW5hYmxlX21tdToKPiAgICAgICAgICBQUklOVCgiLSBUdXJuaW5nIG9uIHBhZ2lu
ZyAtXHJcbiIpCj4gIAo+ICAgICAgICAgIC8qCj4gQEAgLTM3NywxNiArNDE1LDE2IEBAIHZpcnRw
aHlzX2NsYXNoOgo+ICAgICAgICAgIG1jciAgIENQMzIocjAsIFRMQklBTExIKSAgICAgLyogRmx1
c2ggaHlwZXJ2aXNvciBUTEJzICovCj4gICAgICAgICAgZHNiICAgbnNoCj4gIAo+IC0gICAgICAg
IGxkciAgIHIxLCA9cGFnaW5nICAgICAgICAgICAgLyogRXhwbGljaXQgdmFkZHIsIG5vdCBSSVAt
cmVsYXRpdmUgKi8KPiAgICAgICAgICBtcmMgICBDUDMyKHIwLCBIU0NUTFIpCj4gICAgICAgICAg
LyogRW5hYmxlIE1NVSBhbmQgRC1jYWNoZSAqLwo+ICAgICAgICAgIG9yciAgIHIwLCByMCwgIyhT
Q1RMUl9BeHhfRUx4X018U0NUTFJfQXh4X0VMeF9DKQo+ICAgICAgICAgIGRzYiAgICAgICAgICAg
ICAgICAgICAgICAgICAgLyogRmx1c2ggUFRFIHdyaXRlcyBhbmQgZmluaXNoIHJlYWRzICovCj4g
ICAgICAgICAgbWNyICAgQ1AzMihyMCwgSFNDVExSKSAgICAgICAvKiBub3cgcGFnaW5nIGlzIGVu
YWJsZWQgKi8KPiAgICAgICAgICBpc2IgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIE5vdywg
Zmx1c2ggdGhlIGljYWNoZSAqLwo+IC0gICAgICAgIG1vdiAgIHBjLCByMSAgICAgICAgICAgICAg
ICAgLyogR2V0IGEgcHJvcGVyIHZhZGRyIGludG8gUEMgKi8KPiAtcGFnaW5nOgo+ICsgICAgICAg
IG1vdiAgIHBjLCBscgo+ICtFTkRQUk9DKGVuYWJsZV9tbXUpCj4gIAo+ICtzZXR1cF9maXhtYXA6
Cj4gICAgICAgICAgLyoKPiAgICAgICAgICAgKiBOb3cgd2UgY2FuIGluc3RhbGwgdGhlIGZpeG1h
cCBhbmQgZHRiIG1hcHBpbmdzLCBzaW5jZSB3ZQo+ICAgICAgICAgICAqIGRvbid0IG5lZWQgdGhl
IDE6MSBtYXAgYW55IG1vcmUKPiBAQCAtNDM2LDEyICs0NzQsMTUgQEAgcGFnaW5nOgo+ICAgICAg
ICAgIG1jciAgIENQMzIocjAsIFRMQklBTExIKSAgICAgLyogRmx1c2ggaHlwZXJ2aXNvciBUTEIg
Ki8KPiAgICAgICAgICBkc2IgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEVuc3VyZSBjb21w
bGV0aW9uIG9mIFRMQiBmbHVzaCAqLwo+ICAgICAgICAgIGlzYgo+ICsgICAgICAgIG1vdiAgIHBj
LCBscgo+ICtFTkRQUk9DKHNldHVwX2ZpeG1hcCkKPiAgCj4gK2xhdW5jaDoKPiAgICAgICAgICBQ
UklOVCgiLSBSZWFkeSAtXHJcbiIpCj4gIAo+ICAgICAgICAgIC8qIFRoZSBib290IENQVSBzaG91
bGQgZ28gc3RyYWlnaHQgaW50byBDIG5vdyAqLwo+ICAgICAgICAgIHRlcSAgIHIxMiwgIzAKPiAt
ICAgICAgICBiZXEgICBsYXVuY2gKPiArICAgICAgICBiZXEgICAxZgo+ICAKPiAgICAgICAgICAv
Kgo+ICAgICAgICAgICAqIE5vbi1ib290IENQVXMgbmVlZCB0byBtb3ZlIG9uIHRvIHRoZSBwcm9w
ZXIgcGFnZXRhYmxlcywgd2hpY2ggd2VyZQo+IEBAIC00NjAsNyArNTAxLDcgQEAgcGFnaW5nOgo+
ICAgICAgICAgIGRzYiAgICAgICAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBsZXRp
b24gb2YgVExCK0JQIGZsdXNoICovCj4gICAgICAgICAgaXNiCj4gIAo+IC1sYXVuY2g6Cj4gKzE6
Cj4gICAgICAgICAgbGRyICAgcjAsID1pbml0X2RhdGEKPiAgICAgICAgICBhZGQgICByMCwgI0lO
SVRJTkZPX3N0YWNrICAgIC8qIEZpbmQgdGhlIGJvb3QtdGltZSBzdGFjayAqLwo+ICAgICAgICAg
IGxkciAgIHNwLCBbcjBdCj4gQEAgLTQ3MSw2ICs1MTIsNyBAQCBsYXVuY2g6Cj4gICAgICAgICAg
bW92ZXEgcjEsIHI4ICAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gRFRCIGFkZHJl
c3MgKi8KPiAgICAgICAgICBiZXEgICBzdGFydF94ZW4gICAgICAgICAgICAgIC8qIGFuZCBkaXNh
cHBlYXIgaW50byB0aGUgbGFuZCBvZiBDICovCj4gICAgICAgICAgYiAgICAgc3RhcnRfc2Vjb25k
YXJ5ICAgICAgICAvKiAodG8gdGhlIGFwcHJvcHJpYXRlIGVudHJ5IHBvaW50KSAqLwo+ICtFTkRQ
Uk9DKGxhdW5jaCkKPiAgCj4gIC8qIEZhaWwtc3RvcCAqLwo+ICBmYWlsOiAgIFBSSU5UKCItIEJv
b3QgZmFpbGVkIC1cclxuIikKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
