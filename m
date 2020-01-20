Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E3142DC6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 15:40:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itYBn-0004Xo-Na; Mon, 20 Jan 2020 14:38:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itYBm-0004Xf-C2
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 14:38:02 +0000
X-Inumbo-ID: 7296e7de-3b92-11ea-b987-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7296e7de-3b92-11ea-b987-12813bfff9fa;
 Mon, 20 Jan 2020 14:37:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF180AC2C;
 Mon, 20 Jan 2020 14:37:56 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1579190403-23720-1-git-send-email-igor.druzhinin@citrix.com>
 <20200120140750.GZ11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b000f97-2dbc-0b0c-cb27-1e8f85791576@suse.com>
Date: Mon, 20 Jan 2020 15:38:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200120140750.GZ11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/sm{e,
 a}p: do not enable SMEP/SMAP in PV shim by default on AMD
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, sstabellini@kernel.org,
 julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDEuMjAyMCAxNTowNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBK
YW4gMTYsIDIwMjAgYXQgMDQ6MDA6MDNQTSArMDAwMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+
IER1ZSB0byBBTUQgYW5kIEh5Z29uIGJlaW5nIHVuYWJsZSB0byBzZWxlY3RpdmVseSB0cmFwIENS
NCBiaXQgbW9kaWZpY2F0aW9ucwo+PiBydW5uaW5nIDMyLWJpdCBQViBndWVzdCBpbnNpZGUgUFYg
c2hpbSBjb21lcyB3aXRoIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlCj4+IGhpdC4gTW9yZW92ZXIs
IGZvciBTTUVQIGluIHBhcnRpY3VsYXIgZXZlcnkgdGltZSBDUjQuU01FUCBjaGFuZ2VzIG9uIGNv
bnRleHQKPj4gc3dpdGNoIHRvL2Zyb20gMzItYml0IFBWIGd1ZXN0LCBpdCBnZXRzIHRyYXBwZWQg
YnkgTDAgWGVuIHdoaWNoIHRoZW4KPj4gdHJpZXMgdG8gcGVyZm9ybSBnbG9iYWwgVExCIGludmFs
aWRhdGlvbiBmb3IgUFYgc2hpbSBkb21haW4uIFRoaXMgdXN1YWxseQo+PiByZXN1bHRzIGluIGV2
ZW50dWFsIGhhbmcgb2YgYSBQViBzaGltIHdpdGggYXQgbGVhc3Qgc2V2ZXJhbCB2Q1BVcy4KPj4K
Pj4gU2luY2UgdGhlIG92ZXJhbGwgc2VjdXJpdHkgcmlzayBpcyBnZW5lcmFsbHkgbG93ZXIgZm9y
IHNoaW0gWGVuIGFzIGl0IGJlaW5nCj4+IHRoZXJlIG1vcmUgb2YgYSBkZWZlbnNlLWluLWRlcHRo
IG1lY2hhbmlzbSwgY2hvb3NlIHRvIGRpc2FibGUgU01FUC9TTUFQIGluCj4+IGl0IGJ5IGRlZmF1
bHQgb24gQU1EIGFuZCBIeWdvbiB1bmxlc3MgYSB1c2VyIGNob3NlIG90aGVyd2lzZS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+
Cj4+IC0tLQo+PiBJJ20gYSBsaXR0bGUgYml0IG9uIHRoZSBmZW5jZSB3aXRoIHRoaXMgb25lLiBX
ZSdyZSBoYXZpbmcgdGhlIHNhbWUgaXNzdWUgd2l0aAo+PiBnZW5lcmFsIG5lc3RlZCB2aXJ0IGJ1
dCBJJ20gbm90IGluY2xpbmVkIHRvIHRyYWRlIHNlY3VyaXR5IGZvciBhIHVzZXIgaW4KPj4gZ2Vu
ZXJhbCBjYXNlLiBEaXNhYmxpbmcgaXQgYnkgZGVmYXVsdCBmb3IgUFYgc2hpbSBvbmx5IHNlZW1z
IHJhdGhlciBpbm9jdW91cwo+PiBkdWUgdG8gdGhlIHVzZSBjYXNlIHJlc3RyaWNpb24uIEknZCBs
aWtlIHRvIGhlYXIgbW9yZSBvcGluaW9ucy4KPj4gLS0tCj4+ICBkb2NzL21pc2MveGVuLWNvbW1h
bmQtbGluZS5wYW5kb2MgfCAxMCArKysrKysrKy0tCj4+ICB4ZW4vYXJjaC94ODYvc2V0dXAuYyAg
ICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKy0tLS0tLQo+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZG9j
cy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxp
bmUucGFuZG9jCj4+IGluZGV4IDk4MWE1ZTIuLjA1YjJkZGUgMTAwNjQ0Cj4+IC0tLSBhL2RvY3Mv
bWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1h
bmQtbGluZS5wYW5kb2MKPj4gQEAgLTE5MzYsMTkgKzE5MzYsMjUgQEAgaXMgMU1CLgo+PiAgIyMj
IHNtYXAgKHg4NikKPj4gID4gYD0gPGJvb2xlYW4+IHwgaHZtYAo+PiAgCj4+IC0+IERlZmF1bHQ6
IGB0cnVlYAo+PiArPiBEZWZhdWx0OiBgdHJ1ZWAgdW5sZXNzIHJ1bm5pbmcgaW4gcHYtc2hpbSBt
b2RlIG9uIEFNRCBvciBIeWdvbiBoYXJkd2FyZQo+PiAgCj4+ICBGbGFnIHRvIGVuYWJsZSBTdXBl
cnZpc29yIE1vZGUgQWNjZXNzIFByZXZlbnRpb24KPj4gIFVzZSBgc21hcD1odm1gIHRvIGFsbG93
IFNNQVAgdXNlIGJ5IEhWTSBndWVzdHMgb25seS4KPj4gIAo+PiArSW4gUFYgc2hpbSBtb2RlIG9u
IEFNRCBvciBIeWdvbiBoYXJkd2FyZSBkdWUgdG8gc2lnbmlmaWNhbnQgcGVyZm9tYW5jZSBpbXBh
Y3QKPj4gK2luIHNvbWUgY2FzZXMgYW5kIGdlbmVyYWxseSBsb3dlciBzZWN1cml0eSByaXNrIHRo
ZSBvcHRpb24gZGVmYXVsdHMgdG8gZmFsc2UuCj4+ICsKPj4gICMjIyBzbWVwICh4ODYpCj4+ICA+
IGA9IDxib29sZWFuPiB8IGh2bWAKPj4gIAo+PiAtPiBEZWZhdWx0OiBgdHJ1ZWAKPj4gKz4gRGVm
YXVsdDogYHRydWVgIHVubGVzcyBydW5uaW5nIGluIHB2LXNoaW0gbW9kZSBvbiBBTUQgb3IgSHln
b24gaGFyZHdhcmUKPj4gIAo+PiAgRmxhZyB0byBlbmFibGUgU3VwZXJ2aXNvciBNb2RlIEV4ZWN1
dGlvbiBQcm90ZWN0aW9uCj4+ICBVc2UgYHNtZXA9aHZtYCB0byBhbGxvdyBTTUVQIHVzZSBieSBI
Vk0gZ3Vlc3RzIG9ubHkuCj4+ICAKPj4gK0luIFBWIHNoaW0gbW9kZSBvbiBBTUQgb3IgSHlnb24g
aGFyZHdhcmUgZHVlIHRvIHNpZ25pZmljYW50IHBlcmZvbWFuY2UgaW1wYWN0Cj4+ICtpbiBzb21l
IGNhc2VzIGFuZCBnZW5lcmFsbHkgbG93ZXIgc2VjdXJpdHkgcmlzayB0aGUgb3B0aW9uIGRlZmF1
bHRzIHRvIGZhbHNlLgo+PiArCj4+ICAjIyMgc210ICh4ODYpCj4+ICA+IGA9IDxib29sZWFuPmAK
Pj4gIAo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYv
c2V0dXAuYwo+PiBpbmRleCA1YmRjMjI5Li44NDMyYjc3IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJj
aC94ODYvc2V0dXAuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+PiBAQCAtMTA1LDkg
KzEwNSw5IEBAIHN0cnVjdCBjcHVpbmZvX3g4NiBfX3JlYWRfbW9zdGx5IGJvb3RfY3B1X2RhdGEg
PSB7IDAsIDAsIDAsIDAsIC0xIH07Cj4+ICAKPj4gIHVuc2lnbmVkIGxvbmcgX19yZWFkX21vc3Rs
eSBtbXVfY3I0X2ZlYXR1cmVzID0gWEVOX01JTklNQUxfQ1I0Owo+PiAgCj4+IC0vKiBzbWVwOiBF
bmFibGUvZGlzYWJsZSBTdXBlcnZpc29yIE1vZGUgRXhlY3V0aW9uIFByb3RlY3Rpb24gKGRlZmF1
bHQgb24pLiAqLwo+PiAtI2RlZmluZSBTTUVQX0hWTV9PTkxZICgtMSkKPj4gLXN0YXRpYyBzOCBf
X2luaXRkYXRhIG9wdF9zbWVwID0gMTsKPj4gKy8qIHNtZXA6IEVuYWJsZS9kaXNhYmxlIFN1cGVy
dmlzb3IgTW9kZSBFeGVjdXRpb24gUHJvdGVjdGlvbiAqLwo+PiArI2RlZmluZSBTTUVQX0hWTV9P
TkxZICgtMikKPj4gK3N0YXRpYyBzOCBfX2luaXRkYXRhIG9wdF9zbWVwID0gLTE7Cj4gCj4gQ291
bGQgeW91IGNoYW5nZSB0aGUgdHlwZSB0byBpbnQ4X3QgaW5zdGVhZCBvZiBzOD8gKGhlcmUgYW5k
IGJlbG93LAo+IGNhbiBiZSBkb25lIG9uIGNvbW1pdCB3aXRoIHRoZSBjaGFuZ2VzIHJlcXVlc3Rl
ZCBieSBKYW4pLgoKVG9vIGxhdGUsIHNvcnJ5LCB0aGlzIHdhcyBjb21taXR0ZWQgYmVmb3JlIHRo
ZSB3ZWVrZW5kIGFscmVhZHkuCihJIGd1ZXNzIEkgc2hvdWxkIGhhdmUgbm90aWNlZCB0aGlzIG15
c2VsZiwgdGhvdWdoLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
