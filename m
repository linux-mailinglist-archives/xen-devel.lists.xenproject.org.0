Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5EE5725B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 22:12:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgEEe-0005ov-GE; Wed, 26 Jun 2019 20:09:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hgEEc-0005op-F3
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 20:09:38 +0000
X-Inumbo-ID: 52afa923-984e-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 52afa923-984e-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 20:09:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A87D360;
 Wed, 26 Jun 2019 13:09:37 -0700 (PDT)
Received: from [10.37.12.58] (unknown [10.37.12.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9A573F718;
 Wed, 26 Jun 2019 13:09:35 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-17-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261204030.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3e39db53-dd73-44fe-df5e-2eb78fbf6c97@arm.com>
Date: Wed, 26 Jun 2019 21:09:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906261204030.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 16/17] xen/arm64: head: Rework and document
 launch()
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

SGkgU3RlZmFubywKCk9uIDYvMjYvMTkgODoxMiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMTAgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQm9vdCBDUFUg
YW5kIHNlY29uZGFyeSBDUFVzIHdpbGwgdXNlIGRpZmZlcmVudCBlbnRyeSBwb2ludCB0byBDIGNv
ZGUuIEF0Cj4+IHRoZSBtb21lbnQsIHRoZSBkZWNpc2lvbiBvbiB3aGljaCBlbnRyeSB0byB1c2Ug
aXMgdGFrZW4gd2l0aGluIGxhdW5jaCgpLgo+Pgo+PiBJbiBvcmRlciB0byBhdm9pZCBhIGJyYW5j
aCBmb3IgdGhlIGRlY2lzaW9uIGFuZCBtYWtlIHRoZSBjb2RlIGNsZWFyZXIsCj4+IGxhdW5jaCgp
IGlzIHJld29ya2VkIHRvIHRha2UgaW4gcGFyYW1ldGVycyB0aGUgZW50cnkgcG9pbnQgYW5kIGl0
cwo+PiBhcmd1bWVudHMuCj4+Cj4+IExhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0
aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQo+PiBmdW5jdGlvbi4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gLS0tCj4+
ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyks
IDE2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4gaW5kZXggNGY3ZmE2NzY5Zi4uMTMw
YWI2NmQ4ZSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+PiArKysg
Yi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4+IEBAIC0zMTIsNiArMzEyLDExIEBAIHByaW1h
cnlfc3dpdGNoZWQ6Cj4+ICAgICAgICAgICAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNj
ZXNzIHRoZSBVQVJULiAqLwo+PiAgICAgICAgICAgbGRyICAgeDIzLCA9RUFSTFlfVUFSVF9WSVJU
VUFMX0FERFJFU1MKPj4gICAjZW5kaWYKPj4gKyAgICAgICAgUFJJTlQoIi0gUmVhZHkgLVxyXG4i
KQo+PiArICAgICAgICAvKiBTZXR1cCB0aGUgYXJndW1lbnRzIGZvciBzdGFydF94ZW4gYW5kIGp1
bXAgdG8gQyB3b3JsZCAqLwo+PiArICAgICAgICBtb3YgICB4MCwgeDIwICAgICAgICAgICAgICAg
IC8qIHgwIDo9IHBoeXNfb2Zmc2V0ICovCj4+ICsgICAgICAgIG1vdiAgIHgxLCB4MjEgICAgICAg
ICAgICAgICAgLyogeDEgOj0gcGFkZHIoRkRUKSAqLwo+PiArICAgICAgICBsZHIgICB4MiwgPXN0
YXJ0X3hlbgo+PiAgICAgICAgICAgYiAgICAgbGF1bmNoCj4+ICAgRU5EUFJPQyhyZWFsX3N0YXJ0
KQo+PiAgIAo+PiBAQCAtMzc0LDYgKzM3OSw5IEBAIHNlY29uZGFyeV9zd2l0Y2hlZDoKPj4gICAg
ICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVBUlQuICovCj4+
ICAgICAgICAgICBsZHIgICB4MjMsID1FQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwo+PiAgICNl
bmRpZgo+PiArICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCj4+ICsgICAgICAgIC8qIEp1
bXAgdG8gQyB3b3JsZCAqLwo+PiArICAgICAgICBsZHIgICB4MiwgPXN0YXJ0X3NlY29uZGFyeQo+
PiAgICAgICAgICAgYiAgICAgbGF1bmNoCj4+ICAgRU5EUFJPQyhpbml0X3NlY29uZGFyeSkKPj4g
ICAKPj4gQEAgLTczNCwyMyArNzQyLDI0IEBAIHNldHVwX2ZpeG1hcDoKPj4gICAgICAgICAgIHJl
dAo+PiAgIEVORFBST0Moc2V0dXBfZml4bWFwKQo+PiAgIAo+PiArLyoKPj4gKyAqIFNldHVwIHRo
ZSBpbml0aWFsIHN0YWNrIGFuZCBqdW1wIHRvIHRoZSBDIHdvcmxkCj4+ICsgKgo+PiArICogSW5w
dXRzOgo+PiArICogICB4MCA6IEFyZ3VtZW50IDAgb2YgdGhlIEMgZnVuY3Rpb24gdG8gY2FsbAo+
PiArICogICB4MSA6IEFyZ3VtZW50IDEgb2YgdGhlIEMgZnVuY3Rpb24gdG8gY2FsbAo+PiArICog
ICB4MiA6IEMgZW50cnkgcG9pbnQKPiAKPiBJIGtub3cgaXQgaXMgdGhlIGxhc3Qgb25lIGJlZm9y
ZSBDLWxhbmQsIGJ1dCB3ZSBtaWdodCBhcyB3ZWxsIGFkZCBhCj4gIkNsb2JiZXJzIiBzZWN0aW9u
IHRvbywganVzdCBpbiBjYXNlLiBIZXJlIGl0IGNsb2JiZXJzIHg0IChvciB4Mywgc2VlCj4gYmVs
b3cpLgoKU3VyZS4KCj4gCj4gCj4+ICsgKi8KPj4gICBsYXVuY2g6Cj4+IC0gICAgICAgIFBSSU5U
KCItIFJlYWR5IC1cclxuIikKPj4gLQo+PiAtICAgICAgICBsZHIgICB4MCwgPWluaXRfZGF0YQo+
PiAtICAgICAgICBhZGQgICB4MCwgeDAsICNJTklUSU5GT19zdGFjayAvKiBGaW5kIHRoZSBib290
LXRpbWUgc3RhY2sgKi8KPj4gLSAgICAgICAgbGRyICAgeDAsIFt4MF0KPj4gLSAgICAgICAgYWRk
ICAgeDAsIHgwLCAjU1RBQ0tfU0laRSAgICAvKiAod2hpY2ggZ3Jvd3MgZG93biBmcm9tIHRoZSB0
b3ApLiAqLwo+PiAtICAgICAgICBzdWIgICB4MCwgeDAsICNDUFVJTkZPX3NpemVvZiAvKiBNYWtl
IHJvb20gZm9yIENQVSBzYXZlIHJlY29yZCAqLwo+PiAtICAgICAgICBtb3YgICBzcCwgeDAKPj4g
LQo+PiAtICAgICAgICBjYm56ICB4MjIsIDFmCj4+IC0KPj4gLSAgICAgICAgbW92ICAgeDAsIHgy
MCAgICAgICAgICAgICAgICAvKiBNYXJzaGFsIGFyZ3M6IC0gcGh5c19vZmZzZXQgKi8KPj4gLSAg
ICAgICAgbW92ICAgeDEsIHgyMSAgICAgICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gRkRU
ICovCj4+IC0gICAgICAgIGIgICAgIHN0YXJ0X3hlbiAgICAgICAgICAgICAgLyogYW5kIGRpc2Fw
cGVhciBpbnRvIHRoZSBsYW5kIG9mIEMgKi8KPj4gLTE6Cj4+IC0gICAgICAgIGIgICAgIHN0YXJ0
X3NlY29uZGFyeSAgICAgICAgLyogKHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRyeSBwb2ludCkgKi8K
Pj4gKyAgICAgICAgbGRyICAgeDQsID1pbml0X2RhdGEKPiAKPiB3aHkgbm90IHVzZSB4MyBpbnN0
ZWFkIG9mIHg0PwoKSSB0aGluayBhIHJlbW5hbnQgb2YgZWFybHkgcmV3b3JrIHdoZW4gc3RhcnRf
c2Vjb25kYXJ5IHdhcyB0YWtpbmcgMyAKcGFyYW1ldGVycy4gSSB3aWxsIHVwZGF0ZSBpdC4KCj4g
Cj4gCj4+ICsgICAgICAgIGFkZCAgIHg0LCB4NCwgI0lOSVRJTkZPX3N0YWNrIC8qIEZpbmQgdGhl
IGJvb3QtdGltZSBzdGFjayAqLwo+PiArICAgICAgICBsZHIgICB4NCwgW3g0XQo+PiArICAgICAg
ICBhZGQgICB4NCwgeDQsICNTVEFDS19TSVpFICAgIC8qICh3aGljaCBncm93cyBkb3duIGZyb20g
dGhlIHRvcCkuICovCj4gCj4gSWYgeW91IGFyZSBnb2luZyB0byByZXNwaW4gaXQsIGNvdWxkIHlv
dSBwbGVhc2UgYWxpZ24gdGhlIGNvbW1lbnRzIGEgYml0Cj4gYmV0dGVyIChvbmUgc3BhY2UgdG8g
dGhlIHJpZ2h0KT8KClN1cmUuCgo+IAo+IAo+PiArICAgICAgICBzdWIgICB4NCwgeDQsICNDUFVJ
TkZPX3NpemVvZiAvKiBNYWtlIHJvb20gZm9yIENQVSBzYXZlIHJlY29yZCAqLwo+PiArICAgICAg
ICBtb3YgICBzcCwgeDQKPj4gKwo+PiArICAgICAgICAvKiBKdW1wIHRvIEMgd29ybGQgKi8KPj4g
KyAgICAgICAgYnIgICAgeDIKPj4gICBFTkRQUk9DKGxhdW5jaCkKPj4gICAKPj4gICAvKiBGYWls
LXN0b3AgKi8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
