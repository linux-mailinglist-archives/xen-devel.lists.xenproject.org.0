Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6AA120629
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:47:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpk8-0005Gf-9A; Mon, 16 Dec 2019 12:44:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igpk6-0005GV-Ox
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:44:54 +0000
X-Inumbo-ID: d67b9934-2001-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d67b9934-2001-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 12:44:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E35AAAFBE;
 Mon, 16 Dec 2019 12:44:44 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
 <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
 <20191216100058.GM11756@Air-de-Roger>
 <ccecb779-66e6-57a3-3eb8-e15e4d0e0839@suse.com>
 <20191216123020.GN11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a69ee32c-02ed-330f-a457-51b1f221ce06@suse.com>
Date: Mon, 16 Dec 2019 13:45:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216123020.GN11756@Air-de-Roger>
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

T24gMTYuMTIuMjAxOSAxMzozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIERl
YyAxNiwgMjAxOSBhdCAxMjoyMTowOVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTYuMTIuMjAxOSAxMTowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIEZyaSwgRGVj
IDEzLCAyMDE5IGF0IDEwOjQ4OjAyUE0gKzAwMDAsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+
IE5vdyB0aGF0IHZ0c2NfbGFzdCBpcyB0aGUgb25seSBlbnRpdHkgcHJvdGVjdGVkIGJ5IHZ0c2Nf
bG9jayB3ZSBjYW4KPj4+PiBzaW1wbHkgdXBkYXRlIGl0IHVzaW5nIGEgc2luZ2xlIGF0b21pYyBv
cGVyYXRpb24gYW5kIGRyb3AgdGhlIHNwaW5sb2NrCj4+Pj4gZW50aXJlbHkuIFRoaXMgaXMgZXh0
cmVtZWx5IGltcG9ydGFudCBmb3IgdGhlIGNhc2Ugb2YgcnVubmluZyBuZXN0ZWQKPj4+PiAoZS5n
LiBzaGltIGluc3RhbmNlIHdpdGggbG90cyBvZiB2Q1BVcyBhc3NpZ25lZCkgc2luY2UgaWYgcHJl
ZW1wdGlvbgo+Pj4+IGhhcHBlbnMgc29tZXdoZXJlIGluc2lkZSB0aGUgY3JpdGljYWwgc2VjdGlv
biB0aGF0IHdvdWxkIGltbWVkaWF0ZWx5Cj4+Pj4gbWVhbiB0aGF0IG90aGVyIHZDUFUgc3RvcCBw
cm9ncmVzc2luZyAoYW5kIHByb2JhYmx5IGJlaW5nIHByZWVtcHRlZAo+Pj4+IGFzIHdlbGwpIHdh
aXRpbmcgZm9yIHRoZSBzcGlubG9jayB0byBiZSBmcmVlZC4KPj4+Pgo+Pj4+IFRoaXMgZml4ZXMg
Y29uc3RhbnQgc2hpbSBndWVzdCBib290IGxvY2t1cHMgd2l0aCB+MzIgdkNQVXMgaWYgdGhlcmUg
aXMKPj4+PiB2Q1BVIG92ZXJjb21taXQgcHJlc2VudCAod2hpY2ggaW5jcmVhc2VzIHRoZSBsaWtl
bGlob29kIG9mIHByZWVtcHRpb24pLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6
aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIHhlbi9hcmNo
L3g4Ni9kb21haW4uYyAgICAgICAgfCAgMSAtCj4+Pj4gIHhlbi9hcmNoL3g4Ni90aW1lLmMgICAg
ICAgICAgfCAxNiArKysrKystLS0tLS0tLS0tCj4+Pj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9t
YWluLmggfCAgMSAtCj4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tYWluLmMg
Yi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPj4+PiBpbmRleCBiZWQxOWZjLi45NDUzMWJlIDEwMDY0
NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9kb21haW4uYwo+Pj4+IEBAIC01MzksNyArNTM5LDYgQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0
ZShzdHJ1Y3QgZG9tYWluICpkLAo+Pj4+ICAgICAgSU5JVF9QQUdFX0xJU1RfSEVBRCgmZC0+YXJj
aC5yZWxtZW1fbGlzdCk7Cj4+Pj4gIAo+Pj4+ICAgICAgc3Bpbl9sb2NrX2luaXQoJmQtPmFyY2gu
ZTgyMF9sb2NrKTsKPj4+PiAtICAgIHNwaW5fbG9ja19pbml0KCZkLT5hcmNoLnZ0c2NfbG9jayk7
Cj4+Pj4gIAo+Pj4+ICAgICAgLyogTWluaW1hbCBpbml0aWFsaXNhdGlvbiBmb3IgdGhlIGlkbGUg
ZG9tYWluLiAqLwo+Pj4+ICAgICAgaWYgKCB1bmxpa2VseShpc19pZGxlX2RvbWFpbihkKSkgKQo+
Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdGltZS5jIGIveGVuL2FyY2gveDg2L3RpbWUu
Ywo+Pj4+IGluZGV4IDIxNjE2OWEuLjIwMjQ0NmYgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L3RpbWUuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPj4+PiBAQCAtMjEzMCwx
OSArMjEzMCwxNSBAQCB1NjQgZ3RzY190b19ndGltZShzdHJ1Y3QgZG9tYWluICpkLCB1NjQgdHNj
KQo+Pj4+ICAKPj4+PiAgdWludDY0X3QgcHZfc29mdF9yZHRzYyhjb25zdCBzdHJ1Y3QgdmNwdSAq
diwgY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4+Pj4gIHsKPj4+PiAtICAgIHNf
dGltZV90IG5vdyA9IGdldF9zX3RpbWUoKTsKPj4+PiArICAgIHNfdGltZV90IG9sZCwgbmV3LCBu
b3cgPSBnZXRfc190aW1lKCk7Cj4+Pj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWlu
Owo+Pj4+ICAKPj4+PiAtICAgIHNwaW5fbG9jaygmZC0+YXJjaC52dHNjX2xvY2spOwo+Pj4+IC0K
Pj4+PiAtICAgIGlmICggKGludDY0X3QpKG5vdyAtIGQtPmFyY2gudnRzY19sYXN0KSA+IDAgKQo+
Pj4+IC0gICAgICAgIGQtPmFyY2gudnRzY19sYXN0ID0gbm93Owo+Pj4+IC0gICAgZWxzZQo+Pj4+
IC0gICAgICAgIG5vdyA9ICsrZC0+YXJjaC52dHNjX2xhc3Q7Cj4+Pj4gLQo+Pj4+IC0gICAgc3Bp
bl91bmxvY2soJmQtPmFyY2gudnRzY19sb2NrKTsKPj4+PiArICAgIGRvIHsKPj4+PiArICAgICAg
ICBvbGQgPSBkLT5hcmNoLnZ0c2NfbGFzdDsKPj4+PiArICAgICAgICBuZXcgPSAoaW50NjRfdCko
bm93IC0gZC0+YXJjaC52dHNjX2xhc3QpID4gMCA/IG5vdyA6IG9sZCArIDE7Cj4+Pgo+Pj4gV2h5
IGRvIHlvdSBuZWVkIHRvIGRvIHRoaXMgc3VidHJhY3Rpb24/IElzbid0IGl0IGVhc2llciB0byBq
dXN0IGRvOgo+Pj4KPj4+IG5ldyA9IG5vdyA+IGQtPmFyY2gudnRzY19sYXN0ID8gbm93IDogb2xk
ICsgMTsKPj4KPj4gVGhpcyB3b3VsZG4ndCBiZSByZWxpYWJsZSB3aGVuIHRoZSBUU0Mgd3JhcHMu
IFJlbWVtYmVyIHRoYXQgZmlybXdhcmUKPj4gbWF5IHNldCB0aGUgVFNDLCBhbmQgaXQgaGFzIGJl
ZW4gc2VlbiB0byBiZSBzZXQgdG8gdmVyeSBsYXJnZQo+PiAoZWZmZWN0aXZlbHkgbmVnYXRpdmUs
IGlmIHRoZXkgd2VyZSBzaWduZWQgcXVhbnRpdGllcykgdmFsdWVzLAo+IAo+IHNfdGltZV90IGlz
IGEgc2lnbmVkIHZhbHVlIEFGQUlDVCAoczY0KS4KCk9oLCBJIHNob3VsZCBoYXZlIGxvb2tlZCBh
dCB0eXBlcywgcmF0aGVyIHRoYW4gaW5mZXJyaW5nIHVpbnQ2NF90CmluIHBhcnRpY3VsYXIgZm9y
IHNvbWV0aGluZyBsaWtlIHZ0c2NfbGFzdC4KCj4+IHdoaWNoCj4+IHdpbGwgdGhlbiBldmVudHVh
bGx5IHdyYXAgKHdoZXJlYXMgd2UncmUgbm90IHR5cGljYWxseSBjb25jZXJuZWQgb2YKPj4gNjQt
Yml0IGNvdW50ZXJzIHdyYXBwaW5nIHdoZW4gdGhleSBzdGFydCBmcm9tIHplcm8pLgo+IAo+IEJ1
dCBnZXRfc190aW1lIHJldHVybnMgdGhlIHN5c3RlbSB0aW1lIGluIG5zIHNpbmNlIGJvb3QsIG5v
dCB0aGUgVFNDCj4gdmFsdWUsIGhlbmNlIGl0IHdpbGwgc3RhcnQgZnJvbSAwIGFuZCB3ZSBzaG91
bGRuJ3QgYmUgY29uY2VybmVkIGFib3V0Cj4gd3JhcHM/CgpHb29kIHBvaW50LCBzZWVpbmcgdGhh
dCBhbGwgcGFydHMgaGVyZSBhcmUgc190aW1lX3QuIE9mIGNvdXJzZQp3aXRoIGFsbCBwYXJ0cyBi
ZWluZyBzbywgdGhlcmUncyBpbmRlZWQgbm8gbmVlZCBmb3IgdGhlIGNhc3QsCmJ1dCBjb21wYXJp
bmcgYm90aCB2YWx1ZXMgaXMgdGhlbiBlcXVpdmFsZW50IHRvIGNvbXBhcmluZyB0aGUKZGlmZmVy
ZW5jZSBhZ2FpbnN0IHplcm8uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
