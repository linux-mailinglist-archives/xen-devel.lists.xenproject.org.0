Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13160571CF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 21:32:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgDcV-00036a-Hz; Wed, 26 Jun 2019 19:30:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgDcT-00036P-FE
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 19:30:13 +0000
X-Inumbo-ID: d078467c-9848-11e9-bd8e-f790997325b0
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d078467c-9848-11e9-bd8e-f790997325b0;
 Wed, 26 Jun 2019 19:30:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 458F6360;
 Wed, 26 Jun 2019 12:30:11 -0700 (PDT)
Received: from [10.37.12.58] (unknown [10.37.12.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3E0C3F718;
 Wed, 26 Jun 2019 12:30:09 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-16-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261153580.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <218cf497-cbb5-7213-7678-6294ac3e0882@arm.com>
Date: Wed, 26 Jun 2019 20:30:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906261153580.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 15/17] xen/arm64: head: Rework and document
 setup_fixmap()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjYvMTkgODowMSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQXQgdGhlIG1v
bWVudCwgdGhlIGZpeG1hcCB0YWJsZSBpcyBvbmx5IGhvb2tlZCB3aGVuIGVhcmx5cHJpbnRrIGlz
IHVzZWQuCj4+IFRoaXMgaXMgZmluZSB0b2RheSBiZWNhdXNlIGluIEMgbGFuZCwgdGhlIGZpeG1h
cCBpcyBub3QgdXNlZCBieSBhbnlvbmUKPj4gdW50aWwgdGhlIHRoZSBib290IENQVSBpcyBzd2l0
Y2hpbmcgdG8gdGhlIHJ1bnRpbWUgcGFnZS10YWJsZXMuCj4+Cj4+IEluIHRoZSBmdXR1cmUsIHRo
ZSBib290IENQVSB3aWxsIG5vdCBzd2l0Y2ggYmV0d2VlbiBwYWdlLXRhYmxlcyB0byBhdm9pZAo+
PiBUTEIgY29uZmxpY3QuIFRoaXMgbWVhbnMgdGhlIGZpeG1hcCB0YWJsZSB3aWxsIG5lZWQgdG8g
YmUgaG9va2VkIGJlZm9yZQo+PiBhbnkgdXNlLiBGb3Igc2ltcGxpY2l0eSwgc2V0dXBfZml4bWFw
KCkgd2lsbCBub3cgZG8gdGhhdCBqb2IuCj4gCj4gQ2FuIEkgYXNrIHlvdSB0byByZXdvcmQgdGhp
cyBzbGlnaHRseSwgZXNwZWNpYWxseSB0aGUgbGFzdCBzZW50ZW5jZT8gSXQKPiB0b29rIG1lIGEg
d2hpbGUgdG8gdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFudC4gSSBzdWdnZXN0Ogo+IAo+ICAgSW4g
dGhlIGZ1dHVyZSwgdGhlIGJvb3QgQ1BVIHdpbGwgbm90IHN3aXRjaCBiZXR3ZWVuIHBhZ2UtdGFi
bGVzIHRvCj4gICBhdm9pZCBhbnkgVExCIGNvbmZsaWN0cy4gVGh1cywgdGhlIGZpeG1hcCB0YWJs
ZSB3aWxsIG5lZWQgdG8gYmUgYWx3YXlzCj4gICBob29rZWQgYmVmb3JlIGFueSB1c2UuIExldCdz
IHN0YXJ0IGRvaW5nIGl0IG5vdyBpbiBzZXR1cF9maXhtYXAoKS4KPiAKCkkgd2lsbCB1cGRhdGUg
dGhlIGNvbW1pdCBtZXNzYWdlLgoKPiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPiA+Cj4+IExhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFu
ZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQo+PiBmdW5jdGlvbi4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gLS0t
Cj4+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDEzICsrKysrKysrKysrLS0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TCj4+IGluZGV4IDk2ZTg1Zjg4MzQuLjRmN2ZhNjc2OWYgMTAwNjQ0Cj4+IC0tLSBhL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
Uwo+PiBAQCAtNzAwLDggKzcwMCwxNyBAQCBpZF9tYXBfcmVtb3ZlZDoKPj4gICAgICAgICAgIHJl
dAo+PiAgIEVORFBST0MocmVtb3ZlX2lkX21hcCkKPj4gICAKPj4gKy8qCj4+ICsgKiBNYXAgdGhl
IFVBUlQgaW4gdGhlIGZpeG1hcCAod2hlbiBlYXJseXByaW50ayBpcyB1c2VkKSBhbmQgaG9vayB0
aGUKPj4gKyAqIGZpeG1hcCB0YWJsZSBpbiB0aGUgcGFnZSB0YWJsZXMuCj4+ICsgKgo+PiArICog
VGhlIGZpeG1hcCBjYW5ub3QgYmUgbWFwcGVkIGluIGNyZWF0ZV9wYWdlX3RhYmxlcyBiZWNhdXNl
IGl0IG1heQo+PiArICogY2xhc2ggd2l0aCB0aGUgSUQgbWFwLgo+PiArICoKPj4gKyAqIENsb2Ji
ZXJzIHgwIC0geDEKPj4gKyAqLwo+PiAgIHNldHVwX2ZpeG1hcDoKPj4gLSNpZiBkZWZpbmVkKENP
TkZJR19FQVJMWV9QUklOVEspIC8qIEZpeG1hcCBpcyBvbmx5IHVzZWQgYnkgZWFybHkgcHJpbnRr
ICovCj4+ICsjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwo+IAo+IEkgYW0gY3VyaW91cyB3aHkg
eW91IG1hZGUgdGhpcyBjb2RlIHN0eWxlIGNoYW5nZQoKVGhpcyBpcyB0aGUgb25seSAjaWYgZGVm
aW5lZCB3aXRoaW4gaGVhZC5TICh0aGUgcmVzdCB1c2UgI2lmZGVmKSBzbyBmb3IgCmNvbnNpc3Rl
bmN5LiBBbHNvLCBpdCBpcyBzaW1wbGVyIHRvIHJlYWQgOikuCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCkkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
