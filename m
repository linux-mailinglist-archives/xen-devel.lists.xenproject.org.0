Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE921203BE
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:23:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igoQp-0005AJ-Sj; Mon, 16 Dec 2019 11:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igoQo-0005AB-6S
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:20:54 +0000
X-Inumbo-ID: 19f07d30-1ff6-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19f07d30-1ff6-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 11:20:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0BC0AD66;
 Mon, 16 Dec 2019 11:20:43 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
 <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
 <20191216100058.GM11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ccecb779-66e6-57a3-3eb8-e15e4d0e0839@suse.com>
Date: Mon, 16 Dec 2019 12:21:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216100058.GM11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/time: update vtsc_last with cmpxchg
 and drop vtsc_lock
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMjAxOSAxMTowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIERl
YyAxMywgMjAxOSBhdCAxMDo0ODowMlBNICswMDAwLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4g
Tm93IHRoYXQgdnRzY19sYXN0IGlzIHRoZSBvbmx5IGVudGl0eSBwcm90ZWN0ZWQgYnkgdnRzY19s
b2NrIHdlIGNhbgo+PiBzaW1wbHkgdXBkYXRlIGl0IHVzaW5nIGEgc2luZ2xlIGF0b21pYyBvcGVy
YXRpb24gYW5kIGRyb3AgdGhlIHNwaW5sb2NrCj4+IGVudGlyZWx5LiBUaGlzIGlzIGV4dHJlbWVs
eSBpbXBvcnRhbnQgZm9yIHRoZSBjYXNlIG9mIHJ1bm5pbmcgbmVzdGVkCj4+IChlLmcuIHNoaW0g
aW5zdGFuY2Ugd2l0aCBsb3RzIG9mIHZDUFVzIGFzc2lnbmVkKSBzaW5jZSBpZiBwcmVlbXB0aW9u
Cj4+IGhhcHBlbnMgc29tZXdoZXJlIGluc2lkZSB0aGUgY3JpdGljYWwgc2VjdGlvbiB0aGF0IHdv
dWxkIGltbWVkaWF0ZWx5Cj4+IG1lYW4gdGhhdCBvdGhlciB2Q1BVIHN0b3AgcHJvZ3Jlc3Npbmcg
KGFuZCBwcm9iYWJseSBiZWluZyBwcmVlbXB0ZWQKPj4gYXMgd2VsbCkgd2FpdGluZyBmb3IgdGhl
IHNwaW5sb2NrIHRvIGJlIGZyZWVkLgo+Pgo+PiBUaGlzIGZpeGVzIGNvbnN0YW50IHNoaW0gZ3Vl
c3QgYm9vdCBsb2NrdXBzIHdpdGggfjMyIHZDUFVzIGlmIHRoZXJlIGlzCj4+IHZDUFUgb3ZlcmNv
bW1pdCBwcmVzZW50ICh3aGljaCBpbmNyZWFzZXMgdGhlIGxpa2VsaWhvb2Qgb2YgcHJlZW1wdGlv
bikuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBj
aXRyaXguY29tPgo+PiAtLS0KPj4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgfCAgMSAt
Cj4+ICB4ZW4vYXJjaC94ODYvdGltZS5jICAgICAgICAgIHwgMTYgKysrKysrLS0tLS0tLS0tLQo+
PiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCB8ICAxIC0KPj4gIDMgZmlsZXMgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+PiBpbmRleCBiZWQx
OWZjLi45NDUzMWJlIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4gKysr
IGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+IEBAIC01MzksNyArNTM5LDYgQEAgaW50IGFyY2hf
ZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAo+PiAgICAgIElOSVRfUEFHRV9MSVNUX0hF
QUQoJmQtPmFyY2gucmVsbWVtX2xpc3QpOwo+PiAgCj4+ICAgICAgc3Bpbl9sb2NrX2luaXQoJmQt
PmFyY2guZTgyMF9sb2NrKTsKPj4gLSAgICBzcGluX2xvY2tfaW5pdCgmZC0+YXJjaC52dHNjX2xv
Y2spOwo+PiAgCj4+ICAgICAgLyogTWluaW1hbCBpbml0aWFsaXNhdGlvbiBmb3IgdGhlIGlkbGUg
ZG9tYWluLiAqLwo+PiAgICAgIGlmICggdW5saWtlbHkoaXNfaWRsZV9kb21haW4oZCkpICkKPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94ZW4vYXJjaC94ODYvdGltZS5jCj4+
IGluZGV4IDIxNjE2OWEuLjIwMjQ0NmYgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni90aW1l
LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwo+PiBAQCAtMjEzMCwxOSArMjEzMCwxNSBA
QCB1NjQgZ3RzY190b19ndGltZShzdHJ1Y3QgZG9tYWluICpkLCB1NjQgdHNjKQo+PiAgCj4+ICB1
aW50NjRfdCBwdl9zb2Z0X3JkdHNjKGNvbnN0IHN0cnVjdCB2Y3B1ICp2LCBjb25zdCBzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyAqcmVncykKPj4gIHsKPj4gLSAgICBzX3RpbWVfdCBub3cgPSBnZXRfc190
aW1lKCk7Cj4+ICsgICAgc190aW1lX3Qgb2xkLCBuZXcsIG5vdyA9IGdldF9zX3RpbWUoKTsKPj4g
ICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+PiAgCj4+IC0gICAgc3Bpbl9sb2Nr
KCZkLT5hcmNoLnZ0c2NfbG9jayk7Cj4+IC0KPj4gLSAgICBpZiAoIChpbnQ2NF90KShub3cgLSBk
LT5hcmNoLnZ0c2NfbGFzdCkgPiAwICkKPj4gLSAgICAgICAgZC0+YXJjaC52dHNjX2xhc3QgPSBu
b3c7Cj4+IC0gICAgZWxzZQo+PiAtICAgICAgICBub3cgPSArK2QtPmFyY2gudnRzY19sYXN0Owo+
PiAtCj4+IC0gICAgc3Bpbl91bmxvY2soJmQtPmFyY2gudnRzY19sb2NrKTsKPj4gKyAgICBkbyB7
Cj4+ICsgICAgICAgIG9sZCA9IGQtPmFyY2gudnRzY19sYXN0Owo+PiArICAgICAgICBuZXcgPSAo
aW50NjRfdCkobm93IC0gZC0+YXJjaC52dHNjX2xhc3QpID4gMCA/IG5vdyA6IG9sZCArIDE7Cj4g
Cj4gV2h5IGRvIHlvdSBuZWVkIHRvIGRvIHRoaXMgc3VidHJhY3Rpb24/IElzbid0IGl0IGVhc2ll
ciB0byBqdXN0IGRvOgo+IAo+IG5ldyA9IG5vdyA+IGQtPmFyY2gudnRzY19sYXN0ID8gbm93IDog
b2xkICsgMTsKClRoaXMgd291bGRuJ3QgYmUgcmVsaWFibGUgd2hlbiB0aGUgVFNDIHdyYXBzLiBS
ZW1lbWJlciB0aGF0IGZpcm13YXJlCm1heSBzZXQgdGhlIFRTQywgYW5kIGl0IGhhcyBiZWVuIHNl
ZW4gdG8gYmUgc2V0IHRvIHZlcnkgbGFyZ2UKKGVmZmVjdGl2ZWx5IG5lZ2F0aXZlLCBpZiB0aGV5
IHdlcmUgc2lnbmVkIHF1YW50aXRpZXMpIHZhbHVlcywgd2hpY2gKd2lsbCB0aGVuIGV2ZW50dWFs
bHkgd3JhcCAod2hlcmVhcyB3ZSdyZSBub3QgdHlwaWNhbGx5IGNvbmNlcm5lZCBvZgo2NC1iaXQg
Y291bnRlcnMgd3JhcHBpbmcgd2hlbiB0aGV5IHN0YXJ0IGZyb20gemVybykuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
