Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9347B7B02F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:36:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsW0V-0008Oj-Po; Tue, 30 Jul 2019 17:33:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsW0U-0008Oa-6k
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:33:50 +0000
X-Inumbo-ID: 305e7d35-b2f0-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 305e7d35-b2f0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 17:33:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 028E3204FD;
 Tue, 30 Jul 2019 17:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564508028;
 bh=d2IdrdK8H66n+3G2X48aL0k+CiYpD+bOglfdB5aIHrE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WaCXDPhvY1FY+s1Q6b6MHyXstwpKkbehfq9S9pcxE8WC6ZGk3BwYdfELgbpY4GySq
 XtYQ8IGVCGst2Hj1+Va5p5NkswpHgPG57w6opmFLOrB3MYMbL9CzQFAwLJEkUbp2ya
 KYu8jLVASiQIciL0p+w619OWuY+aHq/KRx9Wfk4E=
Date: Tue, 30 Jul 2019 10:33:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <e802f230-52f7-a018-8902-ad466f2dab76@arm.com>
Message-ID: <alpine.DEB.2.21.1907301024460.28600@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906271135340.5851@sstabellini-ThinkPad-T480s>
 <e802f230-52f7-a018-8902-ad466f2dab76@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 14/17] xen/arm64: head: Remove ID map as
 soon as it is not used
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNyBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDYvMjcvMTkgNzo1
NSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gTW9uLCAxMCBKdW4gMjAxOSwg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiArMToKPiA+ID4gKyAgICAgICAgLyoKPiA+ID4gKyAg
ICAgICAgICogRmluZCB0aGUgc2Vjb25kIHNsb3QgdXNlZC4gUmVtb3ZlIHRoZSBlbnRyeSBmb3Ig
dGhlIGZpcnN0Cj4gPiA+ICsgICAgICAgICAqIHRhYmxlIGlmIHRoZSBzbG90IGlzIG5vdCAxIChy
dW50aW1lIFhlbiBtYXBwaW5nIGlzIDJNIC0gNE0pLgo+ID4gPiArICAgICAgICAgKiBGb3Igc2xv
dCAxLCBpdCBtZWFucyB0aGUgSUQgbWFwIHdhcyBub3QgY3JlYXRlZC4KPiA+ID4gKyAgICAgICAg
ICovCj4gPiA+ICsgICAgICAgIGxzciAgIHgxLCB4MTksICNTRUNPTkRfU0hJRlQKPiA+ID4gKyAg
ICAgICAgYW5kICAgeDEsIHgxLCAjTFBBRV9FTlRSWV9NQVNLICAvKiB4MSA6PSBmaXJzdCBzbG90
ICovCj4gPiA+ICsgICAgICAgIGNtcCAgIHgxLCAjMQo+ID4gPiArICAgICAgICBiZXEgICBpZF9t
YXBfcmVtb3ZlZAo+ID4gPiArICAgICAgICAvKiBJdCBpcyBub3QgaW4gc2xvdCAxLCByZW1vdmUg
dGhlIGVudHJ5ICovCj4gPiA+ICsgICAgICAgIGxkciAgIHgwLCA9Ym9vdF9zZWNvbmQgICAgICAg
ICAgLyogeDAgOj0gc2Vjb25kIHRhYmxlICovCj4gPiA+ICsgICAgICAgIHN0ciAgIHh6ciwgW3gw
LCB4MSwgbHNsICMzXQo+ID4gCj4gPiBXb3VsZG4ndCBpdCBiZSBhIGJpdCBtb3JlIHJlbGlhYmxl
IGlmIHdlIGNoZWNrZWQgd2hldGhlciB0aGUgc2xvdCBpbgo+ID4gcXVlc3Rpb24gZm9yIHgxOSAo
d2hldGhlciB6ZXJvLCBmaXJzdCwgc2Vjb25kKSBpcyBhIHBhZ2V0YWJsZSBwb2ludGVyIG9yCj4g
PiBzZWN0aW9uIG1hcCwgdGhlbiB6ZXJvIGl0IGlmIGl0IGlzIGEgc2VjdGlvbiBtYXAsIG90aGVy
d2lzZSBnbyBkb3duIG9uZQo+ID4gbGV2ZWw/IElmIHdlIGRpZCBpdCB0aGlzIHdheSBpdCB3b3Vs
ZCBiZSBpbmRlcGVuZGVudCBmcm9tIHRoZSB3YXkKPiA+IGNyZWF0ZV9wYWdlX3RhYmxlcyBpcyB3
cml0dGVuLgo+IAo+IFlvdXIgc3VnZ2VzdGlvbiB3aWxsIG5vdCBjb21wbHkgd2l0aCB0aGUgYXJj
aGl0ZWN0dXJlIGNvbXBsaWFuY2UgYW5kIGhvdyBYZW4KPiBpcy93aWxsIGJlIHdvcmtpbmcgYWZ0
ZXIgdGhlIGZ1bGwgcmV3b3JrLiBXZSB3YW50IHRvIHJlbW92ZSBldmVyeXRoaW5nCj4gKG1hcHBp
bmcgKyB0YWJsZSkgYWRkZWQgc3BlY2lmaWNhbGx5IGZvciB0aGUgMToxIG1hcHBpbmcuCj4gCj4g
T3RoZXJ3aXNlLCB5b3UgbWF5IGVuZCB1cCBpbiBhIHBvc2l0aW9uIHdoZXJlIGJvb3RfZmlyc3Rf
aWQgaXMgc3RpbGwgaW4gcGxhY2UuCj4gV2Ugd291bGQgbmVlZCB0byB1c2UgdGhlIGJyZWFrLWJl
Zm9yZS1tYWtlIHNlcXVlbmNlIGluIHN1YnNlcXVlbnQgY29kZSBpZiB3ZQo+IHdlcmUgYWJvdXQg
dG8gaW5zZXJ0IDFHQiBtYXBwaW5nIGF0IHRoZSBzYW1lIHBsYWNlLgo+IAo+IEFmdGVyIG15IHJl
d29yaywgd2Ugd291bGQgaGF2ZSB2aXJ0dWFsbHkgbm8gcGxhY2Ugd2hlcmUgYnJlYWstYmVmb3Jl
LW1ha2Ugd2lsbAo+IGJlIG5lY2Vzc2FyeSBhcyBpdCB3aWxsIGVuZm9yY2UgYWxsIHRoZSBtYXBw
aW5ncyB0byBiZSBkZXN0cm95ZWQgYmVmb3JlIGhhbmQuCj4gU28gSSB3b3VsZCByYXRoZXIgYXZv
aWQgdG8gbWFrZSBhIHNwZWNpZmljIGNhc2UgZm9yIHRoZSAxOjEgbWFwcGluZy4KCkkgZG9uJ3Qg
ZnVsbHkgdW5kZXJzdGFuZCB5b3VyIGV4cGxhbmF0aW9uLiBJIHVuZGVyc3RhbmQgdGhlIGZpbmFs
IGdvYWwKb2YgInJlbW92aW5nIGV2ZXJ5dGhpbmcgKG1hcHBpbmcgKyB0YWJsZSkgYWRkZWQgc3Bl
Y2lmaWNhbGx5IGZvciB0aGUgMToxCm1hcHBpbmciLiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IG15
IHN1Z2dlc3Rpb24gd291bGQgYmUgYSBoaW5kcmFuY2UKdG93YXJkIHRoYXQgZ29hbCwgY29tcGFy
ZWQgdG8gd2hhdCBpdCBpcyBkb25lIGluIHRoaXMgcGF0Y2guCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
