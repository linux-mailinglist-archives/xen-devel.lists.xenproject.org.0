Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF94146FCC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 18:34:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iugKP-0005T5-As; Thu, 23 Jan 2020 17:31:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l7XC=3M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iugKO-0005T0-5l
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 17:31:36 +0000
X-Inumbo-ID: 2f49f1ba-3e06-11ea-b833-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f49f1ba-3e06-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 17:31:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579800687; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=DmwmR7kt/L+gf6lmPexT8Z6sfOW5Azqff743ad/6L1Q=;
 b=u1BGRY+/ZEuxzm9xweKQoa5xD0sEHuLSP6vEjO1yVnNcKPuxy3gFS8AofbtfW5iScG2GEkxl
 VLee+8gi7z/iugXPyS427vjAxsO4VJ2mzP29pzj85hRr7XUFQ5OWWR78yPWH/WKwFalC2nf5
 bQz7PyXallDCrVhPGwmZJZXVPoM=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5e29d86d.7fd4bb2dd7b0-smtp-out-n01;
 Thu, 23 Jan 2020 17:31:25 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id u2so3402832wmc.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2020 09:31:25 -0800 (PST)
X-Gm-Message-State: APjAAAWONBUcsXzWySLcmHytW8oqVqixAf77Zz0hnFWLJL7GLVR1Cho6
 YfAU7iZkWvU/nmKsmY8mm7cFpTKARXcBx0vPL7U=
X-Google-Smtp-Source: APXvYqzv5W9qSI4eig47D2OKN5s+e2aZ3itOMFtv8NhS4v4/dJvPKRvalPVKayUs9sSAQq/4MGqrXOQQPMADFuoM33A=
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr5462240wmg.154.1579800684467; 
 Thu, 23 Jan 2020 09:31:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <d2a7c532b8ff412cdda102d81c114e0c642dfcbc.1579628566.git.tamas.lengyel@intel.com>
 <c289c044-ed88-af2d-7a17-479d327fdde6@citrix.com>
In-Reply-To: <c289c044-ed88-af2d-7a17-479d327fdde6@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 23 Jan 2020 10:30:47 -0700
X-Gmail-Original-Message-ID: <CABfawhk+auoeuPmYc5XBNQ3qi2CE7GaK6Grf6vrkhbDN+ShdvA@mail.gmail.com>
Message-ID: <CABfawhk+auoeuPmYc5XBNQ3qi2CE7GaK6Grf6vrkhbDN+ShdvA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v5 15/18] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTA6MjEgQU0gR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDEvMjEvMjAgNTo0OSBQTSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gVk0gZm9ya2luZyBpcyB0aGUgcHJvY2VzcyBvZiBjcmVhdGluZyBh
IGRvbWFpbiB3aXRoIGFuIGVtcHR5IG1lbW9yeSBzcGFjZSBhbmQgYQo+ID4gcGFyZW50IGRvbWFp
biBzcGVjaWZpZWQgZnJvbSB3aGljaCB0byBwb3B1bGF0ZSB0aGUgbWVtb3J5IHdoZW4gbmVjZXNz
YXJ5LiBGb3IKPiA+IHRoZSBuZXcgZG9tYWluIHRvIGJlIGZ1bmN0aW9uYWwgdGhlIFZNIHN0YXRl
IGlzIGNvcGllZCBvdmVyIGFzIHBhcnQgb2YgdGhlIGZvcmsKPiA+IG9wZXJhdGlvbiAoSFZNIHBh
cmFtcywgaGFwIGFsbG9jYXRpb24sIGV0YykuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVGFtYXMg
SyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KPgo+IE92ZXJhbGwgdGhpcyBsb29r
cyByZWFsbHkgZ29vZC4gIEp1c3QgYSBmZXcgcXVlc3Rpb25zLgo+Cj4gPiAtLS0KPiA+ICB4ZW4v
YXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICAgfCAgIDkgKysKPiA+ICB4ZW4vYXJjaC94ODYv
aHZtL2h2bS5jICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICB4ZW4vYXJjaC94ODYvbW0vbWVtX3No
YXJpbmcuYyAgICAgfCAyMjAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgeGVu
L2FyY2gveDg2L21tL3AybS5jICAgICAgICAgICAgIHwgIDExICstCj4gPiAgeGVuL2luY2x1ZGUv
YXNtLXg4Ni9tZW1fc2hhcmluZy5oIHwgIDIwICsrLQo+ID4gIHhlbi9pbmNsdWRlL3B1YmxpYy9t
ZW1vcnkuaCAgICAgICB8ICAgNSArCj4gPiAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAg
ICAgIHwgICAyICsKPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDI2NSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMgYi94
ZW4vYXJjaC94ODYvZG9tYWluLmMKPiA+IGluZGV4IDI4ZmVmYTFmODEuLjk1M2FiY2MxZmMgMTAw
NjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9kb21haW4uYwo+ID4gQEAgLTIxOTgsNiArMjE5OCwxNSBAQCBpbnQgZG9tYWluX3JlbGlucXVp
c2hfcmVzb3VyY2VzKHN0cnVjdCBkb21haW4gKmQpCj4gPiAgICAgICAgICAgICAgcmV0ID0gcmVs
aW5xdWlzaF9zaGFyZWRfcGFnZXMoZCk7Cj4gPiAgICAgICAgICAgICAgaWYgKCByZXQgKQo+ID4g
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICAgICAgICAgIC8qCj4g
PiArICAgICAgICAgICAgICogSWYgdGhlIGRvbWFpbiBpcyBmb3JrZWQsIGRlY3JlbWVudCB0aGUg
cGFyZW50J3MgcGF1c2UgY291bnQuCj4gPiArICAgICAgICAgICAgICovCj4gPiArICAgICAgICAg
ICAgaWYgKCBkLT5wYXJlbnQgKQo+ID4gKyAgICAgICAgICAgIHsKPiA+ICsgICAgICAgICAgICAg
ICAgZG9tYWluX3VucGF1c2UoZC0+cGFyZW50KTsKPiA+ICsgICAgICAgICAgICAgICAgZC0+cGFy
ZW50ID0gTlVMTDsKPgo+IERpZCB0aGlzIHdhbnQgdG8gYmUgYGlmICggZC0+cGFyZW50X3BhdXNl
ZCApYD8KCklmIHRoZSBkb21haW4gaGFzIHRoZSBwYXJlbnQgcG9pbnRlciBzZXQsIGl0J3MgZ3Vh
cmFudGVlZCB0aGF0IHRoZQpwYXJlbnQgaXMgcGF1c2VkLiBJdCdzIHBhdXNlZCBiZWZvcmUgdGhl
IHBhcmVudCBwb2ludGVyIGlzIHNldCBkdXJpbmcKdGhlIGZvcmsgaHlwZXJjYWxsLgoKPgo+ID4g
K3N0YXRpYyBpbnQgYnJpbmdfdXBfdmNwdXMoc3RydWN0IGRvbWFpbiAqY2QsIHN0cnVjdCBjcHVw
b29sICpjcHVwb29sKQo+ID4gK3sKPiA+ICsgICAgaW50IHJldDsKPiA+ICsgICAgdW5zaWduZWQg
aW50IGk7Cj4gPiArCj4gPiArICAgIGlmICggKHJldCA9IGNwdXBvb2xfbW92ZV9kb21haW4oY2Qs
IGNwdXBvb2wpKSApCj4gPiArICAgICAgICByZXR1cm4gcmV0Owo+ID4gKwo+ID4gKyAgICBmb3Ig
KCBpID0gMDsgaSA8IGNkLT5tYXhfdmNwdXM7IGkrKyApCj4gPiArICAgIHsKPiA+ICsgICAgICAg
IGlmICggY2QtPnZjcHVbaV0gKQo+ID4gKyAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gKwo+ID4g
KyAgICAgICAgaWYgKCAhdmNwdV9jcmVhdGUoY2QsIGkpICkKPiA+ICsgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPgo+IFlvdSdyZSBub3QgY29weWluZyB0aGUgY29udGVudHMgb2YgdGhlIHZj
cHUgcmVnaXN0ZXJzIG9yIGFueXRoaW5nIGhlcmUKPiAtLSBpcyB0aGF0IHNvbWV0aGluZyB5b3Un
cmUgbGVhdmluZyB0byB5b3VyIGRvbTAgYWdlbnQ/CgpUaGUgcmVnaXN0ZXJzIGFyZSBiZWluZyBj
b3BpZWQgYXMgcGFydCBvZiB0aGUgSFZNIGNvbnRleHRzLgoKPgo+ID4gK3N0YXRpYyBpbnQgbWVt
X3NoYXJpbmdfZm9yayhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZG9tYWluICpjZCkKPiA+ICt7
Cj4gPiArICAgIGludCByYyA9IC1FSU5WQUw7Cj4gPiArCj4gPiArICAgIGlmICggIWNkLT5jb250
cm9sbGVyX3BhdXNlX2NvdW50ICkKPiA+ICsgICAgICAgIHJldHVybiByYzsKPiA+ICsKPiA+ICsg
ICAgLyoKPiA+ICsgICAgICogV2Ugb25seSB3YW50IHRvIHBhdXNlIHRoZSBwYXJlbnQgb25jZSwg
bm90IGVhY2ggdGltZSB0aGlzCj4gPiArICAgICAqIG9wZXJhdGlvbiBpcyByZXN0YXJ0ZWQgZHVl
IHRvIHByZWVtcHRpb24uCj4gPiArICAgICAqLwo+ID4gKyAgICBpZiAoICFjZC0+cGFyZW50X3Bh
dXNlZCApCj4gPiArICAgIHsKPiA+ICsgICAgICAgIGRvbWFpbl9wYXVzZShkKTsKPiA+ICsgICAg
ICAgIGNkLT5wYXJlbnRfcGF1c2VkID0gdHJ1ZTsKPiA+ICsgICAgfQo+ID4gKwo+ID4gKyAgICBj
ZC0+bWF4X3BhZ2VzID0gZC0+bWF4X3BhZ2VzOwo+ID4gKyAgICBjZC0+bWF4X3ZjcHVzID0gZC0+
bWF4X3ZjcHVzOwo+ID4gKwo+ID4gKyAgICAvKiB0aGlzIGlzIHByZWVtcHRpYmxlIHNvIGl0J3Mg
dGhlIGZpcnN0IHRvIGdldCBkb25lICovCj4gPiArICAgIGlmICggKHJjID0gZm9ya19oYXBfYWxs
b2NhdGlvbihkLCBjZCkpICkKPiA+ICsgICAgICAgIGdvdG8gZG9uZTsKPiA+ICsKPiA+ICsgICAg
aWYgKCAocmMgPSBicmluZ191cF92Y3B1cyhjZCwgZC0+Y3B1cG9vbCkpICkKPiA+ICsgICAgICAg
IGdvdG8gZG9uZTsKPiA+ICsKPiA+ICsgICAgaWYgKCAocmMgPSBodm1fY29weV9jb250ZXh0X2Fu
ZF9wYXJhbXMoZCwgY2QpKSApCj4gPiArICAgICAgICBnb3RvIGRvbmU7Cj4gPiArCj4gPiArICAg
IGZvcmtfdHNjKGQsIGNkKTsKPiA+ICsKPiA+ICsgICAgY2QtPnBhcmVudCA9IGQ7Cj4KPiBXaGF0
IGhhcHBlbnMgaWYgdGhlIHBhcmVudCBkaWVzPwo+Cj4gSXQgc2VlbXMgbGlrZSB3ZSBtaWdodCB3
YW50IHRvIGRvIGdldF9kb21haW4ocGFyZW50KSBoZXJlLCBhbmQKPiBwdXRfZG9tYWluKHBhcmVu
dCkgaW4gZG9tYWluX2Rlc3Ryb3kuCgpJZiBmb3JrcyBhcmUgc3RpbGwgYWN0aXZlIHdoZW4gc29t
ZW9uZSBkZXN0cm95cyB0aGUgcGFyZW50IHRoYW4gWGVuCndpbGwgY3Jhc2ggSSBhc3N1bWUuIFJp
Z2h0IG5vdyBpdCdzIGEgcmVxdWlyZW1lbnQgdGhhdCB0aGUgcGFyZW50CnJlbWFpbnMgaW4gZXhp
c3RlbmNlIC0gYW5kIGl0J3MgcGF1c2VkIC0gd2hpbGUgdGhlcmUgYXJlIGZvcmtzIGFjdGl2ZS4K
V2UgZW5mb3JjZSB0aGUgcGF1c2Ugc3RhdGUgYnV0IG1ha2luZyB0aGUgcGFyZW50IHVuZGVzdHJv
eWFibGUgaXMgbm90CmltcGxlbWVudGVkIHJpZ2h0IG5vdy4gV2UganVzdCB0cnVzdCB0aGF0IHRo
ZSB1c2VyIG9mIHRoaXMKZXhwZXJpbWVudGFsIHN5c3RlbSB3b24ndCBkbyB0aGF0LgoKQnV0IHll
cywgZG9pbmcgdGhlIGdldF9kb21haW4oKS9wdXRfZG9tYWluKCkgZGFuY2Ugd291bGQgYmUgYW4g
ZWFzeQp3YXkgdG8gZG8gdGhhdC4gV2lsbCBhZGQgdGhhdCBhbmQgdGhlbiB3ZSBkb24ndCBoYXZl
IHRvIHdvcnJ5IGFib3V0CnRoZSBwYXJlbnQgZ2V0dGluZyBwdWxsZWQgZnJvbSB1bmRlciBvdXIg
ZmVhdC4KCj4KPiBJJ2xsIHByb2JhYmx5IG5lZWQgdG8gY29tZSBiYWNrIHRvIHRoaXMsIGF0IHdo
aWNoIHBvaW50IEkgbWF5IGhhdmUgbW9yZQo+IHF1ZXN0aW9ucy4KClRoYW5rcyEKVGFtYXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
