Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D874D3756
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 03:47:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIjwS-0001RW-TK; Fri, 11 Oct 2019 01:42:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iIjwR-0001RR-ID
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 01:42:03 +0000
X-Inumbo-ID: 52315b55-ebc8-11e9-9327-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52315b55-ebc8-11e9-9327-12813bfff9fa;
 Fri, 11 Oct 2019 01:42:02 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC10020650;
 Fri, 11 Oct 2019 01:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570758121;
 bh=kuiJxqx7ftSjXbGl7w3Cj53FiBAzPrWqRAHm4ucmenI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JJn52lxUqYCMfBanJIi1nftwB1S1F6Gx+tmUVqgj3IQ3ltS5BXb5MEYPR0QSk23hy
 iIZLrlaemZJ7eqYcCpjh07CUnFOTvTfYzNcXvGgLI5/rzThQEKs3gt8ZSE1om21QBU
 Y4KtAPvqWYKHndyZOm7WqZuOTVKNTIKoqdw4hJU0=
Date: Thu, 10 Oct 2019 18:42:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rob Herring <robh@kernel.org>
In-Reply-To: <20191008194155.4810-1-robh@kernel.org>
Message-ID: <alpine.DEB.2.21.1910101841380.9081@sstabellini-ThinkPad-T480s>
References: <20191008194155.4810-1-robh@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen: Stop abusing DT of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-kernel@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA4IE9jdCAyMDE5LCBSb2IgSGVycmluZyB3cm90ZToKPiBBcyB0aGUgcmVtb3ZlZCBj
b21tZW50cyBzYXksIHRoZXNlIGFyZW4ndCBEVCBiYXNlZCBkZXZpY2VzLgo+IG9mX2RtYV9jb25m
aWd1cmUoKSBpcyBnb2luZyB0byBzdG9wIGFsbG93aW5nIGEgTlVMTCBEVCBub2RlIGFuZCBjYWxs
aW5nCj4gaXQgd2lsbCBubyBsb25nZXIgd29yay4KPiAKPiBUaGUgY29tbWVudCBpcyBhbHNvIG5v
dyBvdXQgb2YgZGF0ZSBhcyBvZiBjb21taXQgOWFiOTFlN2M1YzUxICgiYXJtNjQ6Cj4gZGVmYXVs
dCB0byB0aGUgZGlyZWN0IG1hcHBpbmcgaW4gZ2V0X2FyY2hfZG1hX29wcyIpLiBEaXJlY3QgbWFw
cGluZwo+IGlzIG5vdyB0aGUgZGVmYXVsdCByYXRoZXIgdGhhbiBkbWFfZHVtbXlfb3BzLgo+IAo+
IEFjY29yZGluZyB0byBTdGVmYW5vIGFuZCBPbGVrc2FuZHIsIHRoZSBvbmx5IG90aGVyIHBhcnQg
bmVlZGVkIGlzCj4gc2V0dGluZyB0aGUgRE1BIG1hc2tzIGFuZCB0aGVyZSdzIG5vIHJlYXNvbiB0
byByZXN0cmljdCB0aGUgbWFza3MgdG8KPiAzMi1iaXRzLiBTbyBzZXQgdGhlIG1hc2tzIHRvIDY0
IGJpdHMuCj4gCj4gQ2M6IFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gQ2M6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6IE5pY29sYXMgU2Flbnog
SnVsaWVubmUgPG5zYWVuemp1bGllbm5lQHN1c2UuZGU+Cj4gQ2M6IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiBDYzogQm9yaXMgT3N0
cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KPiBDYzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+IHYyOgo+ICAtIFNldHVwIGRtYSBtYXNrcwo+ICAt
IEFsc28gZml4IHhlbl9kcm1fZnJvbnQuYwo+ICAKPiBUaGlzIGNhbiBub3cgYmUgYXBwbGllZCB0
byB0aGUgWGVuIHRyZWUgaW5kZXBlbmRlbnQgb2YgdGhlIGNvbWluZwo+IG9mX2RtYV9jb25maWd1
cmUoKSBjaGFuZ2VzLgo+IAo+IFJvYgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1f
ZnJvbnQuYyB8IDEyICsrLS0tLS0tLS0tLQo+ICBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgICAgICAg
ICAgICAgICB8IDEzICsrLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGVuL3hlbl9kcm1fZnJvbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5j
Cj4gaW5kZXggYmExODI4YWNkOGM5Li40YmU0OWMxYWVmNTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGVu
L3hlbl9kcm1fZnJvbnQuYwo+IEBAIC03MTgsMTcgKzcxOCw5IEBAIHN0YXRpYyBpbnQgeGVuX2Ry
dl9wcm9iZShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqeGJfZGV2LAo+ICAJc3RydWN0IGRldmljZSAq
ZGV2ID0gJnhiX2Rldi0+ZGV2Owo+ICAJaW50IHJldDsKPiAgCj4gLQkvKgo+IC0JICogVGhlIGRl
dmljZSBpcyBub3Qgc3Bhd24gZnJvbSBhIGRldmljZSB0cmVlLCBzbyBhcmNoX3NldHVwX2RtYV9v
cHMKPiAtCSAqIGlzIG5vdCBjYWxsZWQsIHRodXMgbGVhdmluZyB0aGUgZGV2aWNlIHdpdGggZHVt
bXkgRE1BIG9wcy4KPiAtCSAqIFRoaXMgbWFrZXMgdGhlIGRldmljZSByZXR1cm4gZXJyb3Igb24g
UFJJTUUgYnVmZmVyIGltcG9ydCwgd2hpY2gKPiAtCSAqIGlzIG5vdCBjb3JyZWN0OiB0byBmaXgg
dGhpcyBjYWxsIG9mX2RtYV9jb25maWd1cmUoKSB3aXRoIGEgTlVMTAo+IC0JICogbm9kZSB0byBz
ZXQgZGVmYXVsdCBETUEgb3BzLgo+IC0JICovCj4gLQlkZXYtPmNvaGVyZW50X2RtYV9tYXNrID0g
RE1BX0JJVF9NQVNLKDMyKTsKPiAtCXJldCA9IG9mX2RtYV9jb25maWd1cmUoZGV2LCBOVUxMLCB0
cnVlKTsKPiArCXJldCA9IGRtYV9jb2VyY2VfbWFza19hbmRfY29oZXJlbnQoZGV2LCBETUFfQklU
X01BU0soNjQpKTsKPiAgCWlmIChyZXQgPCAwKSB7Cj4gLQkJRFJNX0VSUk9SKCJDYW5ub3Qgc2V0
dXAgRE1BIG9wcywgcmV0ICVkIiwgcmV0KTsKPiArCQlEUk1fRVJST1IoIkNhbm5vdCBzZXR1cCBE
TUEgbWFzaywgcmV0ICVkIiwgcmV0KTsKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYwo+IGlu
ZGV4IGE0NDZhNzIyMWUxMy4uODE0MDFmMzg2YzljIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVu
L2dudGRldi5jCj4gKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMKPiBAQCAtMjIsNiArMjIsNyBA
QAo+ICAKPiAgI2RlZmluZSBwcl9mbXQoZm10KSAieGVuOiIgS0JVSUxEX01PRE5BTUUgIjogIiBm
bXQKPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L2luaXQuaD4KPiBAQCAtMzQsOSArMzUsNiBAQAo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcmVmY291
bnQuaD4KPiAtI2lmZGVmIENPTkZJR19YRU5fR1JBTlRfRE1BX0FMTE9DCj4gLSNpbmNsdWRlIDxs
aW51eC9vZl9kZXZpY2UuaD4KPiAtI2VuZGlmCj4gIAo+ICAjaW5jbHVkZSA8eGVuL3hlbi5oPgo+
ICAjaW5jbHVkZSA8eGVuL2dyYW50X3RhYmxlLmg+Cj4gQEAgLTYyNSwxNCArNjIzLDcgQEAgc3Rh
dGljIGludCBnbnRkZXZfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmxp
cCkKPiAgCWZsaXAtPnByaXZhdGVfZGF0YSA9IHByaXY7Cj4gICNpZmRlZiBDT05GSUdfWEVOX0dS
QU5UX0RNQV9BTExPQwo+ICAJcHJpdi0+ZG1hX2RldiA9IGdudGRldl9taXNjZGV2LnRoaXNfZGV2
aWNlOwo+IC0KPiAtCS8qCj4gLQkgKiBUaGUgZGV2aWNlIGlzIG5vdCBzcGF3biBmcm9tIGEgZGV2
aWNlIHRyZWUsIHNvIGFyY2hfc2V0dXBfZG1hX29wcwo+IC0JICogaXMgbm90IGNhbGxlZCwgdGh1
cyBsZWF2aW5nIHRoZSBkZXZpY2Ugd2l0aCBkdW1teSBETUEgb3BzLgo+IC0JICogRml4IHRoaXMg
YnkgY2FsbGluZyBvZl9kbWFfY29uZmlndXJlKCkgd2l0aCBhIE5VTEwgbm9kZSB0byBzZXQKPiAt
CSAqIGRlZmF1bHQgRE1BIG9wcy4KPiAtCSAqLwo+IC0Jb2ZfZG1hX2NvbmZpZ3VyZShwcml2LT5k
bWFfZGV2LCBOVUxMLCB0cnVlKTsKPiArCWRtYV9jb2VyY2VfbWFza19hbmRfY29oZXJlbnQocHJp
di0+ZG1hX2RldiwgRE1BX0JJVF9NQVNLKDY0KSk7Cj4gICNlbmRpZgo+ICAJcHJfZGVidWcoInBy
aXYgJXBcbiIsIHByaXYpOwo+ICAKPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
