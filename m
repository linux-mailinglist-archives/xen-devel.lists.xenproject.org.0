Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375FFBE63A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 22:17:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDDgO-0003pz-Re; Wed, 25 Sep 2019 20:14:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cfsh=XU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDDgN-0003pF-RF
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 20:14:39 +0000
X-Inumbo-ID: 19e2fd8c-dfd1-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 19e2fd8c-dfd1-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 20:14:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CBD22146E;
 Wed, 25 Sep 2019 20:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569442478;
 bh=Hxu2r5xrhGFQBptqxH1EvMDoNcrxD7Go1O184FuiTEQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=zuEbOKe0OXcKqsnX1syuCzu2kleHhWGvGnwCrVHiUcRv0MFaTYRUSE26LdyhoAtdK
 eGpi3/KGZEbkzM6o6/ZK9zJ2SQ6YW+5K/NkVdyzZNZYxFmnZQqFr9rA9lMa2zrBvew
 dhZ+JUdT9lyYkgwdz/YTpepVg8M2EDyFJY4sp1Tw=
Date: Wed, 25 Sep 2019 13:14:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190917181244.30027-6-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1909251314170.22813@sstabellini-ThinkPad-T480s>
References: <20190917181244.30027-1-julien.grall@arm.com>
 <20190917181244.30027-6-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 5/8] xen/arm64: head: Introduce macros to
 create table and mapping entry
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

T24gVHVlLCAxNyBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IGFueSB1cGRhdGUgdG8gdGhlIGJvb3QtcGFnZXMgYXJlIG9wZW4tY29kZWQuIFRoaXMgaXMKPiBt
YWtpbmcgbW9yZSBkaWZmaWN1bHQgdG8gdW5kZXJzdGFuZCB0aGUgbG9naWMgb2YgYSBmdW5jdGlv
biBhcyBlYWNoCj4gdXBkYXRlIHJvdWdobHkgcmVxdWlyZXMgNiBpbnN0cnVjdGlvbnMuCj4gCj4g
VG8gZWFzZSB0aGUgcmVhZGFiaWxpdHksIHR3byBuZXcgbWFjcm9zIGFyZSBpbnRyb2R1Y2VkOgo+
ICAgICAtIGNyZWF0ZV90YWJsZV9lbnRyeTogQ3JlYXRlIGEgcGFnZS10YWJsZSBlbnRyeSBpbiBh
IGdpdmVuIHRhYmxlLgo+ICAgICBUaGlzIGNhbiB3b3JrIGF0IGFueSBsZXZlbC4KPiAgICAgLSBj
cmVhdGVfbWFwcGluZ19lbnRyeTogQ3JlYXRlIGEgbWFwcGluZyBlbnRyeSBpbiBhIGdpdmVuIHRh
YmxlLgo+ICAgICBOb25lIG9mIHRoZSB1c2VycyB3aWxsIHJlcXVpcmUgdG8gbWFwIGF0IGFueSBv
dGhlciBsZXZlbCB0aGFuIDNyZAo+ICAgICAoaS5lIHBhZ2UgZ3JhbnVsYXJpdHkpLiBTbyB0aGUg
bWFjcm8gaXMgb25seSBzdXBwb3J0aW5nIDNyZCBsZXZlbAo+ICAgICBtYXBwaW5nLgo+IAo+IEZ1
cnRoZXJtb3JlLCB0aGUgdHdvIG1hY3JvcyBhcmUgY2FwYWJsZSB0byB3b3JrIGluZGVwZW5kZW50
bHkgb2YgdGhlCj4gc3RhdGUgb2YgdGhlIE1NVS4KPiAKPiBMYXN0bHksIHRha2UgdGhlIG9wcG9y
dHVuaXR5IHRvIHJlcGxhY2Ugb3Blbi1jb2RlZCB2ZXJzaW9uIGluCj4gc2V0dXBfZml4bWFwKCkg
YnkgdGhlIHR3byBuZXcgbWFjcm9zLiBUaGUgb25lcyBpbiBjcmVhdGVfcGFnZV90YWJsZXMoKQo+
IHdpbGwgYmUgcmVwbGFjZWQgaW4gYSBmb2xsb3ctdXAgcGF0Y2guCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAgQ2hh
bmdlcyBpbiB2NDoKPiAgICAgICAgIC0gRml4IHR5cG8KPiAgICAgICAgIC0gL3RsYi9wdGxiLyBp
biBjcmVhdGVfbWFwcGluZ19lbnRyeSBtYWNybwo+IAo+ICAgICBDaGFuZ2VzIGluIHYzOgo+ICAg
ICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwg
ODMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUwo+IGluZGV4IDE3N2NlYzRlNDUuLjJjY2UzNDIyMTcgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBA
QCAtNDkyLDYgKzQ5Miw2OCBAQCBjcHVfaW5pdDoKPiAgRU5EUFJPQyhjcHVfaW5pdCkKPiAgCj4g
IC8qCj4gKyAqIE1hY3JvIHRvIGNyZWF0ZSBhIHBhZ2UgdGFibGUgZW50cnkgaW4gXHB0YmwgdG8g
XHRibAo+ICsgKgo+ICsgKiBwdGJsOiAgICB0YWJsZSBzeW1ib2wgd2hlcmUgdGhlIGVudHJ5IHdp
bGwgYmUgY3JlYXRlZAo+ICsgKiB0Ymw6ICAgICB0YWJsZSBzeW1ib2wgdG8gcG9pbnQgdG8KPiAr
ICogdmlydDogICAgdmlydHVhbCBhZGRyZXNzCj4gKyAqIHNoaWZ0OiAgICNpbW0gcGFnZSB0YWJs
ZSBzaGlmdAo+ICsgKiB0bXAxOiAgICBzY3JhdGNoIHJlZ2lzdGVyCj4gKyAqIHRtcDI6ICAgIHNj
cmF0Y2ggcmVnaXN0ZXIKPiArICogdG1wMzogICAgc2NyYXRjaCByZWdpc3Rlcgo+ICsgKgo+ICsg
KiBQcmVzZXJ2ZXMgXHZpcnQKPiArICogQ2xvYmJlcnMgXHRtcDEsIFx0bXAyLCBcdG1wMwo+ICsg
Kgo+ICsgKiBBbHNvIHVzZSB4MjAgZm9yIHRoZSBwaHlzIG9mZnNldC4KPiArICoKPiArICogTm90
ZSB0aGF0IGFsbCBwYXJhbWV0ZXJzIHVzaW5nIHJlZ2lzdGVycyBzaG91bGQgYmUgZGlzdGluY3Qu
Cj4gKyAqLwo+ICsubWFjcm8gY3JlYXRlX3RhYmxlX2VudHJ5LCBwdGJsLCB0YmwsIHZpcnQsIHNo
aWZ0LCB0bXAxLCB0bXAyLCB0bXAzCj4gKyAgICAgICAgbHNyICAgXHRtcDEsIFx2aXJ0LCAjXHNo
aWZ0Cj4gKyAgICAgICAgYW5kICAgXHRtcDEsIFx0bXAxLCAjTFBBRV9FTlRSWV9NQVNLLyogXHRt
cDEgOj0gc2xvdCBpbiBcdGxiICovCj4gKwo+ICsgICAgICAgIGxvYWRfcGFkZHIgXHRtcDIsIFx0
YmwKPiArICAgICAgICBtb3YgICBcdG1wMywgI1BUX1BUICAgICAgICAgICAgICAgICAvKiBcdG1w
MyA6PSByaWdodCBmb3IgbGluZWFyIFBUICovCj4gKyAgICAgICAgb3JyICAgXHRtcDMsIFx0bXAz
LCBcdG1wMiAgICAgICAgICAgLyogICAgICAgICAgKyBcdGxiIHBhZGRyICovCj4gKwo+ICsgICAg
ICAgIGFkcl9sIFx0bXAyLCBccHRibAo+ICsKPiArICAgICAgICBzdHIgICBcdG1wMywgW1x0bXAy
LCBcdG1wMSwgbHNsICMzXQo+ICsuZW5kbQo+ICsKPiArLyoKPiArICogTWFjcm8gdG8gY3JlYXRl
IGEgbWFwcGluZyBlbnRyeSBpbiBcdGJsIHRvIFxwaHlzLiBPbmx5IG1hcHBpbmcgaW4gM3JkCj4g
KyAqIGxldmVsIHRhYmxlIChpLmUgcGFnZSBncmFudWxhcml0eSkgaXMgc3VwcG9ydGVkLgo+ICsg
Kgo+ICsgKiBwdGJsOiAgICAgdGFibGUgc3ltYm9sIHdoZXJlIHRoZSBlbnRyeSB3aWxsIGJlIGNy
ZWF0ZWQKPiArICogdmlydDogICAgdmlydHVhbCBhZGRyZXNzCj4gKyAqIHBoeXM6ICAgIHBoeXNp
Y2FsIGFkZHJlc3MgKHNob3VsZCBiZSBwYWdlIGFsaWduZWQpCj4gKyAqIHRtcDE6ICAgIHNjcmF0
Y2ggcmVnaXN0ZXIKPiArICogdG1wMjogICAgc2NyYXRjaCByZWdpc3Rlcgo+ICsgKiB0bXAzOiAg
ICBzY3JhdGNoIHJlZ2lzdGVyCj4gKyAqIHR5cGU6ICAgIG1hcHBpbmcgdHlwZS4gSWYgbm90IHNw
ZWNpZmllZCBpdCB3aWxsIGJlIG5vcm1hbCBtZW1vcnkgKFBUX01FTV9MMykKPiArICoKPiArICog
UHJlc2VydmVzIFx2aXJ0LCBccGh5cwo+ICsgKiBDbG9iYmVycyBcdG1wMSwgXHRtcDIsIFx0bXAz
Cj4gKyAqCj4gKyAqIE5vdGUgdGhhdCBhbGwgcGFyYW1ldGVycyB1c2luZyByZWdpc3RlcnMgc2hv
dWxkIGJlIGRpc3RpbmN0Lgo+ICsgKi8KPiArLm1hY3JvIGNyZWF0ZV9tYXBwaW5nX2VudHJ5LCBw
dGJsLCB2aXJ0LCBwaHlzLCB0bXAxLCB0bXAyLCB0bXAzLCB0eXBlPVBUX01FTV9MMwo+ICsgICAg
ICAgIGFuZCAgIFx0bXAzLCBccGh5cywgI1RISVJEX01BU0sgICAgIC8qIFx0bXAzIDo9IFBBR0Vf
QUxJR05FRChwaHlzKSAqLwo+ICsKPiArICAgICAgICBsc3IgICBcdG1wMSwgXHZpcnQsICNUSElS
RF9TSElGVAo+ICsgICAgICAgIGFuZCAgIFx0bXAxLCBcdG1wMSwgI0xQQUVfRU5UUllfTUFTSy8q
IFx0bXAxIDo9IHNsb3QgaW4gXHRsYiAqLwo+ICsKPiArICAgICAgICBtb3YgICBcdG1wMiwgI1x0
eXBlICAgICAgICAgICAgICAgICAvKiBcdG1wMiA6PSByaWdodCBmb3Igc2VjdGlvbiBQVCAqLwo+
ICsgICAgICAgIG9yciAgIFx0bXAyLCBcdG1wMiwgXHRtcDMgICAgICAgICAgIC8qICAgICAgICAg
ICsgUEFHRV9BTElHTkVEKHBoeXMpICovCj4gKwo+ICsgICAgICAgIGFkcl9sIFx0bXAzLCBccHRi
bAo+ICsKPiArICAgICAgICBzdHIgICBcdG1wMiwgW1x0bXAzLCBcdG1wMSwgbHNsICMzXQo+ICsu
ZW5kbQo+ICsKPiArLyoKPiAgICogUmVidWlsZCB0aGUgYm9vdCBwYWdldGFibGUncyBmaXJzdC1s
ZXZlbCBlbnRyaWVzLiBUaGUgc3RydWN0dXJlCj4gICAqIGlzIGRlc2NyaWJlZCBpbiBtbS5jLgo+
ICAgKgo+IEBAIC03MzEsMjggKzc5MywxNyBAQCBFTkRQUk9DKHJlbW92ZV9pZGVudGl0eV9tYXBw
aW5nKQo+ICAgKiAgIHgyMDogUGh5c2ljYWwgb2Zmc2V0Cj4gICAqICAgeDIzOiBFYXJseSBVQVJU
IGJhc2UgcGh5c2ljYWwgYWRkcmVzcwo+ICAgKgo+IC0gKiBDbG9iYmVycyB4MSAtIHg0Cj4gKyAq
IENsb2JiZXJzIHgwIC0geDMKPiAgICovCj4gIHNldHVwX2ZpeG1hcDoKPiAgI2lmZGVmIENPTkZJ
R19FQVJMWV9QUklOVEsKPiAgICAgICAgICAvKiBBZGQgVUFSVCB0byB0aGUgZml4bWFwIHRhYmxl
ICovCj4gLSAgICAgICAgbGRyICAgeDEsID14ZW5fZml4bWFwICAgICAgICAvKiB4MSA6PSB2YWRk
ciAoeGVuX2ZpeG1hcCkgKi8KPiAtICAgICAgICBsc3IgICB4MiwgeDIzLCAjVEhJUkRfU0hJRlQK
PiAtICAgICAgICBsc2wgICB4MiwgeDIsICNUSElSRF9TSElGVCAgIC8qIDRLIGFsaWduZWQgcGFk
ZHIgb2YgVUFSVCAqLwo+IC0gICAgICAgIG1vdiAgIHgzLCAjUFRfREVWX0wzCj4gLSAgICAgICAg
b3JyICAgeDIsIHgyLCB4MyAgICAgICAgICAgICAvKiB4MiA6PSA0SyBkZXYgbWFwIGluY2x1ZGlu
ZyBVQVJUICovCj4gLSAgICAgICAgc3RyICAgeDIsIFt4MSwgIyhGSVhNQVBfQ09OU09MRSo4KV0g
LyogTWFwIGl0IGluIHRoZSBmaXJzdCBmaXhtYXAncyBzbG90ICovCj4gKyAgICAgICAgbGRyICAg
eDAsID1FQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUwo+ICsgICAgICAgIGNyZWF0ZV9tYXBwaW5n
X2VudHJ5IHhlbl9maXhtYXAsIHgwLCB4MjMsIHgxLCB4MiwgeDMsIHR5cGU9UFRfREVWX0wzCj4g
ICNlbmRpZgo+IC0KPiAgICAgICAgICAvKiBNYXAgZml4bWFwIGludG8gYm9vdF9zZWNvbmQgKi8K
PiAtICAgICAgICBsZHIgICB4NCwgPWJvb3Rfc2Vjb25kICAgICAgIC8qIHg0IDo9IHZhZGRyIChi
b290X3NlY29uZCkgKi8KPiAtICAgICAgICBsb2FkX3BhZGRyIHgyLCB4ZW5fZml4bWFwCj4gLSAg
ICAgICAgbW92ICAgeDMsICNQVF9QVAo+IC0gICAgICAgIG9yciAgIHgyLCB4MiwgeDMgICAgICAg
ICAgICAgLyogeDIgOj0gdGFibGUgbWFwIG9mIHhlbl9maXhtYXAgKi8KPiAtICAgICAgICBsZHIg
ICB4MSwgPUZJWE1BUF9BRERSKDApCj4gLSAgICAgICAgbHNyICAgeDEsIHgxLCAjKFNFQ09ORF9T
SElGVCAtIDMpICAgLyogeDEgOj0gU2xvdCBmb3IgRklYTUFQKDApICovCj4gLSAgICAgICAgc3Ry
ICAgeDIsIFt4NCwgeDFdICAgICAgICAgICAvKiBNYXAgaXQgaW4gdGhlIGZpeG1hcCdzIHNsb3Qg
Ki8KPiAtCj4gKyAgICAgICAgbGRyICAgeDAsID1GSVhNQVBfQUREUigwKQo+ICsgICAgICAgIGNy
ZWF0ZV90YWJsZV9lbnRyeSBib290X3NlY29uZCwgeGVuX2ZpeG1hcCwgeDAsIFNFQ09ORF9TSElG
VCwgeDEsIHgyLCB4Mwo+ICAgICAgICAgIC8qIEVuc3VyZSBhbnkgcGFnZSB0YWJsZSB1cGRhdGVz
IG1hZGUgYWJvdmUgaGF2ZSBvY2N1cnJlZC4gKi8KPiAgICAgICAgICBkc2IgICBuc2hzdAo+ICAK
PiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
