Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD9990E9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 12:32:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0kLY-0008HO-HJ; Thu, 22 Aug 2019 10:29:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r9la=WS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0kLW-0008H2-Tn
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 10:29:34 +0000
X-Inumbo-ID: bab2a1ba-c4c7-11e9-add4-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bab2a1ba-c4c7-11e9-add4-12813bfff9fa;
 Thu, 22 Aug 2019 10:29:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03D8E15AD;
 Thu, 22 Aug 2019 03:29:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 340CC3F246;
 Thu, 22 Aug 2019 03:29:30 -0700 (PDT)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>, xen-devel@lists.xen.org,
 xen-devel@lists.xenproject.org
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d5aca603-3b30-e3ea-1256-51de8ca40eaf@arm.com>
Date: Thu, 22 Aug 2019 11:29:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821081931.90887-10-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: wipawel@amazon.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF3ZWwsCgpPbiAyMS8wOC8yMDE5IDA5OjE5LCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90
ZToKPiBMaXZlcGF0Y2ggb25seSB0cmFja3MgYW4gZW50aXJlIHBheWxvYWQgYXBwbGllZC9yZXZl
cnRlZCBzdGF0ZS4gQnV0LAo+IHdpdGggYW4gb3B0aW9uIHRvIHN1cHBseSB0aGUgYXBwbHlfcGF5
bG9hZCgpIGFuZC9vciByZXZlcnRfcGF5bG9hZCgpCj4gZnVuY3Rpb25zIGFzIG9wdGlvbmFsIGhv
b2tzLCBpdCBiZWNvbWVzIHBvc3NpYmxlIHRvIGludGVybWl4IHRoZQo+IGV4ZWN1dGlvbiBvZiB0
aGUgb3JpZ2luYWwgYXBwbHlfcGF5bG9hZCgpL3JldmVydF9wYXlsb2FkKCkgZnVuY3Rpb25zCj4g
d2l0aCB0aGVpciBkeW5hbWljYWxseSBzdXBwbGllZCBjb3VudGVycGFydHMuCj4gSXQgaXMgaW1w
b3J0YW50IHRoZW4gdG8gdHJhY2sgdGhlIGN1cnJlbnQgc3RhdGUgb2YgZXZlcnkgZnVuY3Rpb24K
PiBiZWluZyBwYXRjaGVkIGFuZCBwcmV2ZW50IHNpdHVhdGlvbnMgb2YgdW5pbnRlbnRpb25hbCBk
b3VibGUtYXBwbHkKPiBvciB1bmFwcGxpZWQgcmV2ZXJ0Lgo+IAo+IFRvIHN1cHBvcnQgdGhhdCwg
aXQgaXMgbmVjZXNzYXJ5IHRvIGV4dGVuZCBwdWJsaWMgaW50ZXJmYWNlIG9mIHRoZQo+IGxpdmVw
YXRjaC4gVGhlIHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyBnZXRzIGFkZGl0aW9uYWwgZmllbGQgaG9s
ZGluZwo+IHRoZSBhcHBsaWVkL3JldmVydGVkIHN0YXRlIG1hcmtlci4KPiAKPiBUbyByZWZsZWN0
IHRoZSBsaXZlcGF0Y2ggcGF5bG9hZCBBQkkgY2hhbmdlLCBidW1wIHRoZSB2ZXJzaW9uIGZsYWcK
PiBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJTSU9OIHVwIHRvIDIuCj4gCj4gVGhlIGFib3ZlIHNvbHV0
aW9uIG9ubHkgYXBwbGllcyB0byB4ODYgYXJjaGl0ZWN0dXJlIGZvciBub3cuCj4gCj4gU2lnbmVk
LW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdpY3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+IFJldmll
d2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJhc2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+Cj4gUmV2aWV3ZWQtYnk6
IE1hcnRpbiBQb2hsYWNrIDxtcG9obGFja0BhbWF6b24uZGU+Cj4gLS0tCj4gICB4ZW4vYXJjaC94
ODYvbGl2ZXBhdGNoLmMgICAgfCAyMCArKysrKysrKysrKysrKysrKysrLQo+ICAgeGVuL2NvbW1v
bi9saXZlcGF0Y2guYyAgICAgIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8IDExICsrKysrKysrKystCj4gICB4
ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmggfCAgMiArLQo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA2
NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbGl2ZXBhdGNoLmMgYi94ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMKPiBpbmRleCA0MzZl
ZTQwZmUxLi43NmZhOTFhMDgyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9saXZlcGF0Y2gu
Ywo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYwo+IEBAIC02MSw2ICs2MSwxNCBAQCB2
b2lkIG5vaW5saW5lIGFyY2hfbGl2ZXBhdGNoX2FwcGx5KHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAq
ZnVuYykKPiAgICAgICBpZiAoICFsZW4gKQo+ICAgICAgICAgICByZXR1cm47Cj4gICAKPiArICAg
IC8qIElmIHRoZSBhcHBseSBhY3Rpb24gaGFzIGJlZW4gYWxyZWFkeSBleGVjdXRlZCBvbiB0aGlz
IGZ1bmN0aW9uLCBkbyBub3RoaW5nLi4uICovCj4gKyAgICBpZiAoIGZ1bmMtPmFwcGxpZWQgPT0g
TElWRVBBVENIX0ZVTkNfQVBQTElFRCApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKFhFTkxP
R19XQVJOSU5HIExJVkVQQVRDSCAiJXM6ICVzIGhhcyBiZWVuIGFscmVhZHkgYXBwbGllZCBiZWZv
cmVcbiIsCj4gKyAgICAgICAgICAgICAgICBfX2Z1bmNfXywgZnVuYy0+bmFtZSk7Cj4gKyAgICAg
ICAgcmV0dXJuOwo+ICsgICAgfQoKRG9lcyB0aGlzIG5lZWQgdG8gaW4gYXJjaCBzcGVjaWZpYyBj
b2RlPwoKPiArCj4gICAgICAgbWVtY3B5KGZ1bmMtPm9wYXF1ZSwgb2xkX3B0ciwgbGVuKTsKPiAg
ICAgICBpZiAoIGZ1bmMtPm5ld19hZGRyICkKPiAgICAgICB7Cj4gQEAgLTc3LDE1ICs4NSwyNSBA
QCB2b2lkIG5vaW5saW5lIGFyY2hfbGl2ZXBhdGNoX2FwcGx5KHN0cnVjdCBsaXZlcGF0Y2hfZnVu
YyAqZnVuYykKPiAgICAgICAgICAgYWRkX25vcHMoaW5zbiwgbGVuKTsKPiAgIAo+ICAgICAgIG1l
bWNweShvbGRfcHRyLCBpbnNuLCBsZW4pOwo+ICsgICAgZnVuYy0+YXBwbGllZCA9IExJVkVQQVRD
SF9GVU5DX0FQUExJRUQ7Cj4gICB9Cj4gICAKPiAgIC8qCj4gICAgKiAibm9pbmxpbmUiIHRvIGNh
dXNlIGNvbnRyb2wgZmxvdyBjaGFuZ2UgYW5kIHRodXMgaW52YWxpZGF0ZSBJJCBhbmQKPiAgICAq
IGNhdXNlIHJlZmV0Y2ggYWZ0ZXIgbW9kaWZpY2F0aW9uLgo+ICAgICovCj4gLXZvaWQgbm9pbmxp
bmUgYXJjaF9saXZlcGF0Y2hfcmV2ZXJ0KGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVu
YykKPiArdm9pZCBub2lubGluZSBhcmNoX2xpdmVwYXRjaF9yZXZlcnQoc3RydWN0IGxpdmVwYXRj
aF9mdW5jICpmdW5jKQo+ICAgewo+ICsgICAgLyogSWYgdGhlIGFwcGx5IGFjdGlvbiBoYXNuJ3Qg
YmVlbiBleGVjdXRlZCBvbiB0aGlzIGZ1bmN0aW9uLCBkbyBub3RoaW5nLi4uICovCj4gKyAgICBp
ZiAoICFmdW5jLT5vbGRfYWRkciB8fCBmdW5jLT5hcHBsaWVkID09IExJVkVQQVRDSF9GVU5DX05P
VF9BUFBMSUVEICkKPiArICAgIHsKPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgTElW
RVBBVENIICIlczogJXMgaGFzIG5vdCBiZWVuIGFwcGxpZWQgYmVmb3JlXG4iLAo+ICsgICAgICAg
ICAgICAgICAgX19mdW5jX18sIGZ1bmMtPm5hbWUpOwo+ICsgICAgICAgIHJldHVybjsKPiArICAg
IH0KPiArCj4gICAgICAgbWVtY3B5KGZ1bmMtPm9sZF9hZGRyLCBmdW5jLT5vcGFxdWUsIGxpdmVw
YXRjaF9pbnNuX2xlbihmdW5jKSk7Cj4gKyAgICBmdW5jLT5hcHBsaWVkID0gTElWRVBBVENIX0ZV
TkNfTk9UX0FQUExJRUQ7Cj4gICB9Cj4gICAKPiAgIC8qCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vbGl2ZXBhdGNoLmMgYi94ZW4vY29tbW9uL2xpdmVwYXRjaC5jCj4gaW5kZXggNTg1ZWM5ODE5
YS4uMDkwYTQ4OTc3YiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2xpdmVwYXRjaC5jCj4gKysr
IGIveGVuL2NvbW1vbi9saXZlcGF0Y2guYwo+IEBAIC0xMjQyLDYgKzEyNDIsMjkgQEAgc3RhdGlj
IGlubGluZSB2b2lkIHJldmVydF9wYXlsb2FkX3RhaWwoc3RydWN0IHBheWxvYWQgKmRhdGEpCj4g
ICAgICAgZGF0YS0+c3RhdGUgPSBMSVZFUEFUQ0hfU1RBVEVfQ0hFQ0tFRDsKPiAgIH0KPiAgIAo+
ICsvKgo+ICsgKiBDaGVjayBpZiBhbiBhY3Rpb24gaGFzIGFwcGxpZWQgdGhlIHNhbWUgc3RhdGUg
dG8gYWxsIHBheWxvYWQncyBmdW5jdGlvbnMgY29uc2lzdGVudGx5Lgo+ICsgKi8KPiArc3RhdGlj
IGlubGluZSBib29sIHdhc19hY3Rpb25fY29uc2lzdGVudChjb25zdCBzdHJ1Y3QgcGF5bG9hZCAq
ZGF0YSwgbGl2ZXBhdGNoX2Z1bmNfc3RhdGVfdCBleHBlY3RlZF9zdGF0ZSkKPiArewo+ICsgICAg
aW50IGk7Cj4gKwo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBkYXRhLT5uZnVuY3M7IGkrKyApCj4g
KyAgICB7Cj4gKyAgICAgICAgc3RydWN0IGxpdmVwYXRjaF9mdW5jICpmID0gJihkYXRhLT5mdW5j
c1tpXSk7Cj4gKwo+ICsgICAgICAgIGlmICggZi0+YXBwbGllZCAhPSBleHBlY3RlZF9zdGF0ZSAp
CgpQZXIgdGhlIGRlZmluaXRpb24gb2YgbGl2ZXBhdGhfZnVuYywgdGhlIGZpZWxkICJhcHBsaWVk
IiBvbmx5IGV4aXN0cyBmb3IgeDg2LiBTbyAKdGhpcyB3aWxsIG5vdCBjb21waWxlZCBvbiBBcm0u
Cgo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENI
ICIlczogUGF5bG9hZCBoYXMgYSBmdW5jdGlvbjogJyVzJyB3aXRoIGluY29uc2lzdGVudCBhcHBs
aWVkIHN0YXRlLlxuIiwKPiArICAgICAgICAgICAgICAgICAgIGRhdGEtPm5hbWUsIGYtPm5hbWUg
PzogIm5vbmFtZSIpOwo+ICsKPiArICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsgICAgICAg
IH0KPiArICAgIH0KPiArCj4gKyAgICByZXR1cm4gdHJ1ZTsKPiArfQo+ICsKPiAgIC8qCj4gICAg
KiBUaGlzIGZ1bmN0aW9uIGlzIGV4ZWN1dGVkIGhhdmluZyBhbGwgb3RoZXIgQ1BVcyB3aXRoIG5v
IGRlZXAgc3RhY2sgKHdlIG1heQo+ICAgICogaGF2ZSBjcHVfaWRsZSBvbiBpdCkgYW5kIElSUXMg
ZGlzYWJsZWQuCj4gQEAgLTEyNjgsNiArMTI5MSw5IEBAIHN0YXRpYyB2b2lkIGxpdmVwYXRjaF9k
b19hY3Rpb24odm9pZCkKPiAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgcmMgPSBhcHBs
eV9wYXlsb2FkKGRhdGEpOwo+ICAgCj4gKyAgICAgICAgaWYgKCAhd2FzX2FjdGlvbl9jb25zaXN0
ZW50KGRhdGEsIHJjID8gTElWRVBBVENIX0ZVTkNfTk9UX0FQUExJRUQgOiBMSVZFUEFUQ0hfRlVO
Q19BUFBMSUVEKSApCgpSZWdhcmRsZXNzIHRoZSBjb21waWxhdGlvbiBpc3N1ZSBhYm92ZSwgbm9u
ZSBvZiB0aGUgY29tbW9uIGNvZGUgd2lsbCBzZXQgdGhlIApzdGF0ZS4gU28gZm9yIEFybSwgdGhp
cyB3b3VsZCBsaWtlbHkgbWVhbiB0aGUgZnVuY3Rpb24gcmV0dXJuIGZhbHNlLgoKPiArICAgICAg
ICAgICAgcGFuaWMoImxpdmVwYXRjaDogcGFydGlhbGx5IGFwcGxpZWQgcGF5bG9hZCAnJXMnIVxu
IiwgZGF0YS0+bmFtZSk7CgpJIGNhbiBzZWUgYXQgbGVhc3QgYSBjYXNlIHdoZXJlIHRoZSBwYW5p
YyBjYW4gYmUgcmVhY2hlZCBoZXJlLiBQZXIgdGhlIGNoYW5nZXMgCmluIGFyY2hfbGl2ZXBhdGNo
X2FwcGx5KCksIGYtPmFwcGxpZWQgd2lsbCBvbmx5IGJlIHNldCB0byBMSVZFUEFUQ0hfRlVOQ19B
UFBMSUVEIAppZiBsaXZlcGF0Y2hfaW5zbl9sZW4oKSBpcyBub3QgMC4KCkkgZG9uJ3Qga25vdyB3
aGV0aGVyIGxpdmVwYXRjaF9pbnNuX2xlbigpIGNhbiBldmVyIHJldHVybiAwIGFzIG15IGxpdmVw
YXRjaCAKa25vd2xlZGdlIGlzIGxpbWl0ZWQuIEJ1dCB0aGUgY29kZSBsaXZlIGxpdHRsZSBkb3Vi
dCB0aGlzIGlzIGEgdGhlb3JpdGljYWwgCnBvc3NpYmlsaXR5IHRoYXQgYWZ0ZXIgdGhpcyBwYXRj
aCB3aWxsIHR1cm4gaW50byBjcmFzaGluZyBYZW4uCgpNb3JlIGdlbmVyYWxseSwgSSBhbSBub3Qg
dmVyeSBjb21mb3J0YWJsZSB0byBzZWUgcGFuaWMoKSBpbiB0aGUgbWlkZGxlIG9mIHRoZSAKY29k
ZS4gQ291bGQgeW91IGV4cGxhaW4gd2h5IHBhbmljIGlzIHRoZSBiZXN0IHNvbHV0aW9uIG92ZXIg
cmV2ZXJ0aW5nIHRoZSB3b3JrPwoKTXkgcXVlc3Rpb24gYXBwbGllcyBmb3IgYWxsIHRoZSBvdGhl
ciBwYW5pYygpIGJlbG93LgoKPiArCj4gICAgICAgICAgIGlmICggcmMgPT0gMCApCj4gICAgICAg
ICAgICAgICBhcHBseV9wYXlsb2FkX3RhaWwoZGF0YSk7Cj4gICAgICAgICAgIGJyZWFrOwo+IEBA
IC0xMjgyLDYgKzEzMDgsOSBAQCBzdGF0aWMgdm9pZCBsaXZlcGF0Y2hfZG9fYWN0aW9uKHZvaWQp
Cj4gICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgIHJjID0gcmV2ZXJ0X3BheWxvYWQoZGF0
YSk7Cj4gICAKPiArICAgICAgICBpZiAoICF3YXNfYWN0aW9uX2NvbnNpc3RlbnQoZGF0YSwgcmMg
PyBMSVZFUEFUQ0hfRlVOQ19BUFBMSUVEIDogTElWRVBBVENIX0ZVTkNfTk9UX0FQUExJRUQpICkK
PiArICAgICAgICAgICAgcGFuaWMoImxpdmVwYXRjaDogcGFydGlhbGx5IHJldmVydGVkIHBheWxv
YWQgJyVzJyFcbiIsIGRhdGEtPm5hbWUpOwo+ICsKPiAgICAgICAgICAgaWYgKCByYyA9PSAwICkK
PiAgICAgICAgICAgICAgIHJldmVydF9wYXlsb2FkX3RhaWwoZGF0YSk7Cj4gICAgICAgICAgIGJy
ZWFrOwo+IEBAIC0xMzA0LDYgKzEzMzMsOSBAQCBzdGF0aWMgdm9pZCBsaXZlcGF0Y2hfZG9fYWN0
aW9uKHZvaWQpCj4gICAgICAgICAgICAgICAgICAgb3RoZXItPnJjID0gcmV2ZXJ0X3BheWxvYWQo
b3RoZXIpOwo+ICAgCj4gICAKPiArICAgICAgICAgICAgaWYgKCAhd2FzX2FjdGlvbl9jb25zaXN0
ZW50KG90aGVyLCByYyA/IExJVkVQQVRDSF9GVU5DX0FQUExJRUQgOiBMSVZFUEFUQ0hfRlVOQ19O
T1RfQVBQTElFRCkgKQo+ICsgICAgICAgICAgICAgICAgcGFuaWMoImxpdmVwYXRjaDogcGFydGlh
bGx5IHJldmVydGVkIHBheWxvYWQgJyVzJyFcbiIsIG90aGVyLT5uYW1lKTsKPiArCj4gICAgICAg
ICAgICAgICBpZiAoIG90aGVyLT5yYyA9PSAwICkKPiAgICAgICAgICAgICAgICAgICByZXZlcnRf
cGF5bG9hZF90YWlsKG90aGVyKTsKPiAgICAgICAgICAgICAgIGVsc2UKPiBAQCAtMTMyNCw2ICsx
MzU2LDkgQEAgc3RhdGljIHZvaWQgbGl2ZXBhdGNoX2RvX2FjdGlvbih2b2lkKQo+ICAgICAgICAg
ICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgIHJjID0gYXBwbHlfcGF5bG9hZChkYXRhKTsK
PiAgIAo+ICsgICAgICAgICAgICBpZiAoICF3YXNfYWN0aW9uX2NvbnNpc3RlbnQoZGF0YSwgcmMg
PyBMSVZFUEFUQ0hfRlVOQ19OT1RfQVBQTElFRCA6IExJVkVQQVRDSF9GVU5DX0FQUExJRUQpICkK
PiArICAgICAgICAgICAgICAgIHBhbmljKCJsaXZlcGF0Y2g6IHBhcnRpYWxseSBhcHBsaWVkIHBh
eWxvYWQgJyVzJyFcbiIsIGRhdGEtPm5hbWUpOwo+ICsKPiAgICAgICAgICAgICAgIGlmICggcmMg
PT0gMCApCj4gICAgICAgICAgICAgICAgICAgYXBwbHlfcGF5bG9hZF90YWlsKGRhdGEpOwo+ICAg
ICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCBiL3hl
bi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+IGluZGV4IDFiMmIxNjVhNmQuLmI1NWFkNmQwNTAg
MTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCj4gKysrIGIveGVuL2lu
Y2x1ZGUvcHVibGljL3N5c2N0bC5oCj4gQEAgLTgxOCw3ICs4MTgsNyBAQCBzdHJ1Y3QgeGVuX3N5
c2N0bF9jcHVfZmVhdHVyZXNldCB7Cj4gICAgKiAgICAgSWYgemVybyBleGl0IHdpdGggc3VjY2Vz
cy4KPiAgICAqLwo+ICAgCj4gLSNkZWZpbmUgTElWRVBBVENIX1BBWUxPQURfVkVSU0lPTiAxCj4g
KyNkZWZpbmUgTElWRVBBVENIX1BBWUxPQURfVkVSU0lPTiAyCj4gICAvKgo+ICAgICogLmxpdmVw
YXRjaC5mdW5jcyBzdHJ1Y3R1cmUgbGF5b3V0IGRlZmluZWQgaW4gdGhlIGBQYXlsb2FkIGZvcm1h
dGAKPiAgICAqIHNlY3Rpb24gaW4gdGhlIExpdmUgUGF0Y2ggZGVzaWduIGRvY3VtZW50Lgo+IEBA
IC04MjYsNiArODI2LDExIEBAIHN0cnVjdCB4ZW5fc3lzY3RsX2NwdV9mZWF0dXJlc2V0IHsKPiAg
ICAqIFdlIGd1YXJkIHRoaXMgd2l0aCBfX1hFTl9fIGFzIHRvb2xzdGFja3MgU0hPVUxEIG5vdCB1
c2UgaXQuCj4gICAgKi8KPiAgICNpZmRlZiBfX1hFTl9fCj4gK3R5cGVkZWYgZW51bSBsaXZlcGF0
Y2hfZnVuY19zdGF0ZSB7Cj4gKyAgICBMSVZFUEFUQ0hfRlVOQ19OT1RfQVBQTElFRCA9IDAsCj4g
KyAgICBMSVZFUEFUQ0hfRlVOQ19BUFBMSUVEID0gMQoKQUZBSUssIGVudW0gd2lsbCBhbHdheXMg
c3RhcnQgY291bnRpbmcgZnJvbSAwLCBzbyBpcyBpdCByZWFsbHkgbmVjZXNzYXJ5IHRvIApzcGVj
aWZ5IHRoZSBleGFjdCB2YWx1ZXM/Cgo+ICt9IGxpdmVwYXRjaF9mdW5jX3N0YXRlX3Q7Cj4gKwo+
ICAgc3RydWN0IGxpdmVwYXRjaF9mdW5jIHsKPiAgICAgICBjb25zdCBjaGFyICpuYW1lOyAgICAg
ICAvKiBOYW1lIG9mIGZ1bmN0aW9uIHRvIGJlIHBhdGNoZWQuICovCj4gICAgICAgdm9pZCAqbmV3
X2FkZHI7Cj4gQEAgLTgzNCw2ICs4MzksMTAgQEAgc3RydWN0IGxpdmVwYXRjaF9mdW5jIHsKPiAg
ICAgICB1aW50MzJfdCBvbGRfc2l6ZTsKPiAgICAgICB1aW50OF90IHZlcnNpb247ICAgICAgICAv
KiBNVVNUIGJlIExJVkVQQVRDSF9QQVlMT0FEX1ZFUlNJT04uICovCj4gICAgICAgdWludDhfdCBv
cGFxdWVbMzFdOwo+ICsjaWYgZGVmaW5lZCBDT05GSUdfWDg2Cj4gKyAgICB1aW50OF90IGFwcGxp
ZWQ7Cj4gKyAgICB1aW50OF90IF9wYWRbN107Cj4gKyNlbmRpZgoKQWJvdmUsIHlvdSBpbmNyZWFz
ZSB0aGUgdmVyc2lvbiBvZiB0aGUgcGF5bG9hZCBoZXJlIGV2ZW4gZm9yIEFybSB3aGVuIHRoZXJl
IGFyZSAKbm8gbW9kaWZpY2F0aW9uIGluIEFybS4gVGhpcyByYWlzZXMgdGhlIHF1ZXN0aW9uIG9u
IHdoZXRoZXIgd2Ugd291bGQgbmVlZCB0byAKaW5jcmVhc2UgdGhlIHZlcnNpb24gd2hlbiBBcm0g
aXMgZ29pbmcgdG8gYmUgc3VwcG9ydGVkPwoKPiAgIH07Cj4gICB0eXBlZGVmIHN0cnVjdCBsaXZl
cGF0Y2hfZnVuYyBsaXZlcGF0Y2hfZnVuY190Owo+ICAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaCBiL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaAo+
IGluZGV4IDJhZWM1MzJlZTIuLmE5MzEyNmY2MzEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2xpdmVwYXRjaC5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCj4gQEAg
LTExNyw3ICsxMTcsNyBAQCBpbnQgYXJjaF9saXZlcGF0Y2hfcXVpZXNjZSh2b2lkKTsKPiAgIHZv
aWQgYXJjaF9saXZlcGF0Y2hfcmV2aXZlKHZvaWQpOwo+ICAgCj4gICB2b2lkIGFyY2hfbGl2ZXBh
dGNoX2FwcGx5KHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYyk7Cj4gLXZvaWQgYXJjaF9saXZl
cGF0Y2hfcmV2ZXJ0KGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYyk7Cj4gK3ZvaWQg
YXJjaF9saXZlcGF0Y2hfcmV2ZXJ0KHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYyk7Cj4gICB2
b2lkIGFyY2hfbGl2ZXBhdGNoX3Bvc3RfYWN0aW9uKHZvaWQpOwo+ICAgCj4gICB2b2lkIGFyY2hf
bGl2ZXBhdGNoX21hc2sodm9pZCk7Cj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
