Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B34119EBD
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6C1-0000BM-Cl; Fri, 10 May 2019 14:08:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP6C0-0000B2-Ad
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:08:08 +0000
X-Inumbo-ID: 08bd2184-732d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 08bd2184-732d-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 14:08:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACB95A78;
 Fri, 10 May 2019 07:08:06 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6C183F73C;
 Fri, 10 May 2019 07:08:04 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
 <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
 <9b8e78a4-db71-1b0d-a9c6-89a35e5feb2f@arm.com>
 <5CD58484020000780022D98E@prv1-mh.provo.novell.com>
 <fae0871e-1ca9-890b-f782-562501782bcb@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5e873087-73cd-5bdf-f414-e9eede0207a4@arm.com>
Date: Fri, 10 May 2019 15:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fae0871e-1ca9-890b-f782-562501782bcb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8wNS8yMDE5IDE1OjA1LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDEwLzA1LzIw
MTkgMTU6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4wNS4xOSBhdCAxNTo0Niwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDEwLzA1LzIwMTkgMTQ6NDEsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjM0LCA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiBPbiAxMC8wNS8yMDE5IDE0OjIxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+IHdyb3RlOgo+Pj4+Pj4+IEBAIC0xMDMwLDE5ICsxMDMxLDE5IEBAIGxvbmcgcDJtX3B0
X2F1ZGl0X3AybShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKQo+Pj4+Pj4+IEBAIC0yNzk1LDU0ICsy
Nzk1LDU0IEBAIHZvaWQgYXVkaXRfcDJtKHN0cnVjdCBkb21haW4gKmQsCj4+Pj4+Pj4gICAgICAg
ICBzcGluX2xvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7Cj4+Pj4+Pj4gICAgICAgICBwYWdlX2xp
c3RfZm9yX2VhY2ggKCBwYWdlLCAmZC0+cGFnZV9saXN0ICkKPj4+Pj4+PiAgICAgICAgIHsKPj4+
Pj4+PiAtICAgICAgICBtZm4gPSBtZm5feChwYWdlX3RvX21mbihwYWdlKSk7Cj4+Pj4+Pj4gKyAg
ICAgICAgbWZuID0gcGFnZV90b19tZm4ocGFnZSk7Cj4+Pj4+Pj4gICAgIAo+Pj4+Pj4+IC0gICAg
ICAgIFAyTV9QUklOVEsoImF1ZGl0aW5nIGd1ZXN0IHBhZ2UsIG1mbj0lI2x4XG4iLCBtZm4pOwo+
Pj4+Pj4+ICsgICAgICAgIFAyTV9QUklOVEsoImF1ZGl0aW5nIGd1ZXN0IHBhZ2UsIG1mbj0lIlBS
SV9tZm4iXG4iLCBtZm5feChtZm4pKTsKPj4+Pj4+PiAgICAgCj4+Pj4+Pj4gICAgICAgICAgICAg
b2QgPSBwYWdlX2dldF9vd25lcihwYWdlKTsKPj4+Pj4+PiAgICAgCj4+Pj4+Pj4gICAgICAgICAg
ICAgaWYgKCBvZCAhPSBkICkKPj4+Pj4+PiAgICAgICAgICAgICB7Cj4+Pj4+Pj4gLSAgICAgICAg
ICAgIFAyTV9QUklOVEsoIndyb25nIG93bmVyICUjbHggLT4gJXAoJXUpICE9ICVwKCV1KVxuIiwK
Pj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBtZm4sIG9kLCAob2Q/b2QtPmRvbWFpbl9p
ZDotMSksIGQsIGQtPmRvbWFpbl9pZCk7Cj4+Pj4+Pj4gKyAgICAgICAgICAgIFAyTV9QUklOVEso
Indyb25nIG93bmVyICUiUFJJX21mbiIgLT4gJXAoJXUpICE9ICVwKCV1KVxuIiwKPj4+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBtZm5feChtZm4pLCBvZCwgKG9kP29kLT5kb21haW5faWQ6
LTEpLCBkLCBkLT5kb21haW5faWQpOwo+Pj4+Pj4gUGxlYXNlIGJlIGNhcmVmdWwgbm90IHRvIGRy
b3AgMHggcHJlZml4ZXMgZnJvbSB0aGUgcmVzdWx0aW5nIG91dHB1dAo+Pj4+Pj4gKHdoaWNoIGFy
ZSBhbiBlZmZlY3Qgb2YgdGhlICMgZmxhZyB0aGF0IHlvdSBkZWxldGUpLCBhdCBsZWFzdCB3aGVu
Cj4+Pj4+PiBsb2cgbWVzc2FnZXMgY29udGFpbiBhIG1peCBvZiBoZXggYW5kIGRlYyBudW1iZXJz
LiAoSSBhbSwgYnR3LAo+Pj4+Pj4gbm90IGNvbnZpbmNlZCB0aGF0IHN3aXRjaGluZyB0byBQUklf
bWZuIGhlcmUgaXMgaGVscGZ1bC4pCj4+Pj4+IExhc3QgdGltZSBJIGtlZXBlZCAlIyBmb3IgTUZO
LCBJIGhhdmUgYmVlbiBhc2tlZCB0byByZW1vdmUgdGhlICMuIEkgcHJlZmVyCj4+Pj4+IGhhdmlu
ZyAweCBmb3IgYWxsIHRoZSBoZXgsIGFuZCBJIGFtIGhhcHB5IHRvIGJlIGtlZXAgYXMgaXMuIEJ1
dCBJIHdvdWxkIGxpa2UgYQo+Pj4+PiBiaXQgb2YgY29uc2lzdGVuY3kgb24gdGhlIHdheSB3ZSBw
cmludCBNRk4uLi4KPj4+PiBXZWxsLCAiJSMiUFJJX21mbiBpcyBib2d1cyAoYmVjYXVzZSBvZiB0
aGUgY29tYmluYXRpb24gd2l0aCB0aGUKPj4+PiBtaW5pbXVtIHdpZHRoIHNwZWNpZmljYXRpb24p
LCBzbyBpdCBvdWdodCB0byBiZSAiJSNseCIgb3IgIjB4JSJQUklfbWZuLgo+Pj4+IEhhdmUgeW91
IHJlYWxseSBiZWVuIGFza2VkIGZvciBzb21ldGhpbmcgZWxzZT8gSWYgc28sIGFuZCBpZiBpdCB3
YXMgbWUsCj4+Pj4gdGhlbiBJIGFwb2xvZ2l6ZS4KPj4+IEkgYW0gbm90IHN1cmUgd2h5IHRoaXMg
aXMgYm9ndXMuIFRoZSB0aGluZyBpcyB1c2luZyBkaWZmZXJlbnQgZm9ybWF0IGZvciB0aGUgTUZO
Cj4+PiBtYWtlcyBpdCBkaWZmaWN1bHQgdG8gcmVhZCBhIG1lc3NhZ2Ugd2l0aG91dCBsb29raW5n
IGZvcm1hdCBzdHJpbmcuCj4+IFdlIGxvb2sgdG8gYmUgaW4gYWdyZWVtZW50IHRoYXQgdGhlcmUg
c2hvdWxkIGJlIGEgMHggcHJlZml4IGhlcmUuCj4+IFdoYXQgSSdtIGFza2luZyBmb3IgaXMgdG8g
YXZvaWQgdGhlIHZhbHVlIGxvZ2dlZCB0byBkZS1nZW5lcmF0ZSBpbnRvCj4+IGEgMy1kaWdpdCBv
bmUgKDB4Pz8/KSB3aGVuIGEgZml2ZSBkaWdpdCBvbmUgaXMgbWVhbnQgKHNlZSBQUklfbWZuKS4K
Pj4gTm90IHRvIHNwZWFrIG9mIHRoZSBmdXJ0aGVyIGluY29uc2lzdGVudCBzdHJpbmcgdGhhdCB3
b3VsZCBiZSBsb2dnZWQKPj4gZm9yIE1GTiAwLgo+IAo+IFRoZSBvdmVyd2hlbG1pbmcgbWFqb3Jp
dHkgd2F5IG9mIHByaW50aW5nIG1mbnMgaXMgdmlhOgo+IAo+IG1mbiAlIlBSSV9tZm4iCj4gCj4g
d2hpY2ggaXMgYWxtb3N0IGZ1bGx5IGNvbnNpc3RlbnQgYWNyb3NzIHRoZSB4ODYgY29kZS4KCklm
IEkgZ290IGl0IHJpZ2h0LCB0aGUgZm9ybWF0IGhlcmUgd291bGQgYmUgIndyb25nIG93bmVyIG1m
biAlIlBSSV9tZm4iLiBBbSBJIApjb3JyZWN0PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
