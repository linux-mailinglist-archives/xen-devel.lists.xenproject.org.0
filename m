Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCFC33A84
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 23:59:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXuwL-0002Kv-Aw; Mon, 03 Jun 2019 21:56:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hXuwJ-0002Kn-2L
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 21:56:23 +0000
X-Inumbo-ID: 6c661bd8-864a-11e9-8436-93d323f5671c
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c661bd8-864a-11e9-8436-93d323f5671c;
 Mon, 03 Jun 2019 21:56:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF08526C6C;
 Mon,  3 Jun 2019 21:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559598981;
 bh=kopj7aUoFVgM0xHMR/LjuOJXqbJJYMwD4JHTn5bPI5A=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MbKCddv494X8Dpm5HuFsANiaaEv1ZqtpC2lFM/PgGxK7hlpUwJfPQ1OK5oh77n2O3
 he4X1gEPXCDJ14jDRuPSRDwoyMU1YZVcy6rG+UHaII0ZraR/0Ugl6939TisWdtQVqL
 QBuu1QbMUlcgQfUOrmzPses6QeBF6z/cHPha261U=
Date: Mon, 3 Jun 2019 14:56:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CD3EFD5020000780022D0D8@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.21.1906031447300.14041@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
 <20190508224727.11549-3-sstabellini@kernel.org>
 <5CD3EFD5020000780022D0D8@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA5IE1heSAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDkuMDUuMTkg
YXQgMDA6NDcsIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+IC0tLSBhL3hlbi9j
b21tb24vcGR4LmMKPiA+ICsrKyBiL3hlbi9jb21tb24vcGR4LmMKPiA+IEBAIC01MCw5ICs1MCwx
MyBAQCBzdGF0aWMgdTY0IF9faW5pdCBmaWxsX21hc2sodTY0IG1hc2spCj4gPiAgICAgIHJldHVy
biBtYXNrOwo+ID4gIH0KPiA+ICAKPiA+ICsvKgo+ID4gKyAqIFdlIGFsd2F5cyBtYXAgdGhlIGZp
cnN0IDE8PE1BWF9PUkRFUiBwYWdlcyBvZiBSQU0sIGhlbmNlLCB0aGV5Cj4gPiArICogYXJlIGxl
ZnQgdW5jb21wcmVzc2VkLgo+ID4gKyAqLwo+ID4gIHU2NCBfX2luaXQgcGR4X2luaXRfbWFzayh1
NjQgYmFzZV9hZGRyKQo+ID4gIHsKPiA+IC0gICAgcmV0dXJuIGZpbGxfbWFzayhiYXNlX2FkZHIg
LSAxKTsKPiA+ICsgICAgcmV0dXJuIGZpbGxfbWFzayhtYXgoYmFzZV9hZGRyLCAodTY0KTEgPDwg
KE1BWF9PUkRFUiArIFBBR0VfU0hJRlQpKSAtIDEpOwo+IAo+IFBlcnNvbmFsbHkgSSB0aGluayB0
aGF0IGRlc3BpdGUgdGhlIHN1cnJvdW5kaW5nIHU2NCB0aGlzIHNob3VsZCBiZQo+IHVpbnQ2NF90
LiBZb3UgY291bGQgYXZvaWQgdGhpcyBhbHRvZ2V0aGVyIGJ5IHVzaW5nIDFVTEwuCgpJIGNhbm5v
dCB1c2UgMVVMTCBiZWNhdXNlIGl0IHdvdWxkIGJyZWFrIHRoZSBidWlsZDogdGhlIHJlYXNvbiBp
cyB0aGF0CnU2NCBpcyBkZWZpbmVkIGFzIHVuc2lnbmVkIGxvbmcgb24gc29tZSBhcmNoaXRlY3R1
cmVzIGFuZCB1bnNpZ25lZCBsb25nCmxvbmcgb24gb3RoZXJzLiBUaGUgcG9pbnRlcnMgY29tcGFy
aXNvbiBpbiB0aGUgbWF4IG1hY3JvIHdpbGwgZmFpbCB0bwpjb21waWxlLgoKSSBjb3VsZCB1c2Ug
dWludDY0X3QsIHRoYXQgd29ya3MsIGJ1dCBJIHRoaW5rIGlzIG5vdCBhIGdvb2QgaWRlYSB0byB1
c2UKcG90ZW50aWFsbHkgZGlmZmVyZW50IHR5cGVzIGJldHdlZW4gdGhlIGFyZ3VtZW50cyBwYXNz
ZWQgdG8gbWF4LiBJZiB5b3UKc3RpbGwgd291bGQgbGlrZSBtZSB0byBjaGFuZ2UgKHU2NCkxIHRv
ICh1aW50NjRfdCkxIHBsZWFzZSBleHBsYWluIHdoeQppbiBtb3JlIGRldGFpbHMuCgoKPiA+IEBA
IC04MCw2ICs4NCw4IEBAIHZvaWQgX19pbml0IHBmbl9wZHhfaG9sZV9zZXR1cCh1bnNpZ25lZCBs
b25nIG1hc2spCj4gPiAgICAgICAqIFRoaXMgZ3VhcmFudGVlcyB0aGF0IHBhZ2UtcG9pbnRlciBh
cml0aG1ldGljIHJlbWFpbnMgdmFsaWQgd2l0aGluCj4gPiAgICAgICAqIGNvbnRpZ3VvdXMgYWxp
Z25lZCByYW5nZXMgb2YgMl5NQVhfT1JERVIgcGFnZXMuIEFtb25nIG90aGVycywgb3VyCj4gPiAg
ICAgICAqIGJ1ZGR5IGFsbG9jYXRvciByZWxpZXMgb24gdGhpcyBhc3N1bXB0aW9uLgo+ID4gKyAg
ICAgKgo+ID4gKyAgICAgKiBJZiB0aGUgbG9naWMgY2hhbmdlcyBoZXJlLCB3ZSBtaWdodCBoYXZl
IHRvIHVwZGF0ZSBpbml0X3BkeCB0b28uCj4gPiAgICAgICAqLwo+ID4gICAgICBmb3IgKCBqID0g
TUFYX09SREVSLTE7IDsgKQo+ID4gICAgICB7Cj4gCj4gQXQgZmlyc3QgSSB3YXMgcHV6emxlZCBi
eSBhIHJlZmVyZW5jZSB0byBzb21ldGhpbmcgdGhhdCBJIGRpZG4ndAo+IHRoaW5rIHdvdWxkIGV4
aXN0LCBhbmQgSSB3YXMgdGhlbiBhc3N1bWluZyB5b3UgbWVhbgo+IHBkeF9pbml0X21hc2soKS4g
QnV0IHRoZW4gSSB0aG91Z2h0IEknZCB1c2UgZ3JlcCBuZXZlcnRoZWxlc3MsCj4gYW5kIGZvdW5k
IHRoZSBBcm0gaW5zdGFuY2Ugb2YgaXQgKHdoaWNoIHRoaXMgcGF0Y2ggYWN0dWFsbHkKPiBjaGFu
Z2VzLCBidXQgSSdtIHJhcmVseSBsb29raW5nIGF0IHRoZSAiZGlmZiAtcCIgc3ltYm9scyB3aGVu
Cj4gY29udGV4dCBpcyBvdGhlcndpc2Ugb2J2aW91cykuIElmIHlvdSBtYWtlIHN1Y2ggYSByZWZl
cmVuY2UgaW4KPiBjb21tb24gY29kZSAoSSB0aGluayBJJ2QgcHJlZmVyIGlmIGl0IHdhcyBzaW1w
bHkgb21pdHRlZCksIHRoZW4KPiBwbGVhc2UgbmFtZSB0aGUgc3BlY2lmaWMgYXJjaGl0ZWN0dXJl
IGFzIHdlbGwsIG9yIG1ha2Ugb3RoZXJ3aXNlCj4gY2xlYXIgdGhhdCB0aGlzIGlzbid0IGEgc3lt
Ym9sIHRoYXQncyBjb21tb24gb3IgcmVxdWlyZWQgdG8gYmUKPiBzdXBwbGllZCBieSBlYWNoIGFy
Y2guCgpJJ2xsIG1ha2UgaXQgY2xlYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
