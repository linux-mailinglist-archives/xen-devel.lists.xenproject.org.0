Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855CA15A2E7
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 09:08:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1n2f-0003cW-5Z; Wed, 12 Feb 2020 08:06:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JFaq=4A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1n2d-0003cQ-BM
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 08:06:39 +0000
X-Inumbo-ID: 97a8363c-4d6e-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97a8363c-4d6e-11ea-b0fd-bc764e2007e4;
 Wed, 12 Feb 2020 08:06:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE75EADDA;
 Wed, 12 Feb 2020 08:06:36 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200211155155.17396-1-andrew.cooper3@citrix.com>
 <20200211163104.GM4679@Air-de-Roger>
 <a3deb893-69e5-a9f9-656b-7867364d2ccc@suse.com>
 <8f5c93be-4b32-5839-2170-160d85bcbf30@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1332e312-952e-b5a9-1453-4cdce14c8060@suse.com>
Date: Wed, 12 Feb 2020 09:06:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8f5c93be-4b32-5839-2170-160d85bcbf30@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/amd: Avoid cpu_has_hypervisor
 evaluating true on native hardware
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Claudia <claudia1@disroot.org>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxODoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMS8wMi8yMDIw
IDE2OjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTEuMDIuMjAyMCAxNzozMSwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDAzOjUxOjU0UE0g
KzAwMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gQ3VycmVudGx5IHdoZW4gYm9vdGluZyBu
YXRpdmUgb24gQU1EIGhhcmR3YXJlLCBjcHVpZG1hc2tfZGVmYXVsdHMuXzFjZCBnZXRzCj4+Pj4g
Y29uZmlndXJlZCB3aXRoIHRoZSBIWVBFUlZJU09SIGJpdCBiZWZvcmUgbmF0aXZlIENQVUlEIGlz
IHNjYW5uZWQgZm9yIGZlYXR1cmUKPj4+PiBiaXRzLgo+Pj4+Cj4+Pj4gVGhpcyByZXN1bHRzIGlu
IGNwdV9oYXNfaHlwZXJ2aXNvciBiZWNvbWluZyBzZXQgYXMgcGFydCBvZiBpZGVudGlmeV9jcHUo
KSwgYW5kCj4+Pj4gZW5kcyB1cCBhcHBlYXJpbmcgaW4gdGhlIHJhdyBhbmQgaG9zdCBDUFUgcG9s
aWNpZXMuCj4+Pj4KPj4+PiBBIGNvbWJpbmF0aW9uIG9mIHRoaXMgYnVnLCBhbmQgYy9zIGJiNTAy
YThjYTU5ICJ4ODY6IGNoZWNrIGZlYXR1cmUgZmxhZ3MgYWZ0ZXIKPj4+PiByZXN1bWUiIHdoaWNo
IGNoZWNrcyB0aGF0IGZlYXR1cmUgYml0cyBkb24ndCBnbyBtaXNzaW5nLCByZXN1bHRzIGluIGJy
b2tlbiBTMwo+Pj4+IG9uIEFNRCBoYXJkd2FyZS4KPj4+Pgo+Pj4+IEFsdGVyIGFtZF9pbml0X2xl
dmVsbGluZygpIHRvIGV4Y2x1ZGUgdGhlIEhZUEVSVklTT1IgYml0IGZyb20KPj4+PiBjcHVtYXNr
X2RlZmF1bHRzLCBhbmQgdXBkYXRlIGRvbWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoKSB0byBhbGxv
dyBpdCB0byBiZQo+Pj4+IGV4cGxpY2l0bHkgZm9yd2FyZGVkLgo+Pj4+Cj4+Pj4gVGhpcyBhbHNv
IGZpeGVzIGEgYnVnIG9uIGtleGVjLCB3aGVyZSB0aGUgaHlwZXJ2aXNvciBiaXQgaXMgbGVmdCBl
bmFibGVkIGZvcgo+Pj4+IHRoZSBuZXcga2VybmVsIHRvIGZpbmQuCj4+Pj4KPj4+PiBUaGVzZSBj
aGFuZ2VzIGhpZ2hsaWdodCBhIGZ1cnRoZXIgYnV0IC0gZG9tMCBjb25zdHJ1Y3Rpb24gaXMgYXN5
bWV0cmljIHdpdGgKPj4+PiBkb21VIGNvbnN0cnVjdGlvbiwgYnkgbm90IGhhdmluZyBhbnkgY2Fs
bHMgdG8gZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpLgo+Pj4+IEV4dGVuZCBhcmNoX2RvbWFp
bl9jcmVhdGUoKSB0byBhbHdheXMgY2FsbCBkb21haW5fY3B1X3BvbGljeV9jaGFuZ2VkKCkuCj4+
Pj4KPj4+PiBSZXBvcnRlZC1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJp
eC5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPj4+PiAtLS0KPj4+PiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgo+Pj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+Pj4+IENDOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+PiBDQzogSWdvciBEcnV6aGluaW4gPGlnb3Iu
ZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+Pj4gQ0M6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPj4+PiBDQzogQ2xhdWRpYSA8Y2xh
dWRpYTFAZGlzcm9vdC5vcmc+Cj4+Pj4KPj4+PiB2MjoKPj4+PiAgKiBSZXdyaXRlIHRoZSBjb21t
aXQgbWVzc2FnZS4gIE5vIGNoYW5nZSB0byB0aGUgcGF0Y2ggY29udGVudC4KPj4+Pgo+Pj4+IE1h
cmVrL0NsYXVkaWE6IERvIGVpdGhlciBvZiB5b3Ugd2FudCBhIFJlcG9ydGVkLWJ5IHRhZyBzZWVp
bmcgYXMgeW91IGZvdW5kIGEKPj4+PiBicmFuZCBuZXcgd2F5IHRoYXQgdGhpcyB3YXMgYnJva2Vu
Pwo+PiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBhZGRyZXNzaW5nIG9ubHkgb25lIGhhbGYgb2YgdGhl
aXIgaXNzdWUuIFNpbmNlCj4+IHlvdSBzYWlkIHlvdSBkb24ndCBmaW5kIGl0IHN1cnByaXNpbmcs
IGRvIHlvdSBoYXZlIGFueSBpZGVhIHdoeSB0aGUKPj4gT1NYU0FWRSBiaXQgaXMgYmVoYXZpbmcg
ZGlmZmVyZW50bHkgb24gQU1EIGFuZCBvbiBJbnRlbD8KPiAKPiBJdCBpc24ndCBiZWhhdmluZyBk
aWZmZXJlbnRseSBiZXR3ZWVuIEludGVsIGFuZCBBTUQsIEkgZG9uJ3QgdGhpbmsuCj4gCj4gVGhl
IGRpYWdub3N0aWNzIGFyZSBhc3ltbWV0cmljIC0gdGhleSBldmVyIHByaW50ZWQgd2hlbiBhIGZl
YXR1cmUKPiBkaXNhcHBlYXJzLCBub3QgZm9yIGEgZmVhdHVyZSBhcHBlYXJpbmcuCgpPaCwgSSBz
ZWUgLSB0aGlzIGlzIHRoZSBwYXJ0IEkgd2FzIG1pc3NpbmcuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
