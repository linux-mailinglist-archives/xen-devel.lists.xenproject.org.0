Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E298318315E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 14:28:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCNpj-0000Qe-QD; Thu, 12 Mar 2020 13:25:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCNpi-0000QZ-I2
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 13:25:06 +0000
X-Inumbo-ID: e2502cf0-6464-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2502cf0-6464-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 13:25:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EFCB6ABC7;
 Thu, 12 Mar 2020 13:25:03 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
 <20200312093035.GE24458@Air-de-Roger.citrite.net>
 <20200312105846.GH24458@Air-de-Roger.citrite.net>
 <42b11579-cce8-63aa-7fdb-29d834e77fa2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c452f19-67ed-2f3e-2174-0c3cafa10052@suse.com>
Date: Thu, 12 Mar 2020 14:25:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <42b11579-cce8-63aa-7fdb-29d834e77fa2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix deadlock with MSR bitmap
 merging
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAyMCAxMzowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8wMy8yMDIw
IDEwOjU4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiBPbiBUaHUsIE1hciAxMiwgMjAyMCBh
dCAxMDozMDozNUFNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4gT24gV2VkLCBN
YXIgMTEsIDIwMjAgYXQgMDY6MzQ6NTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+
PiBjL3MgYzQ3OTg0YWFiZWFkICJudm14OiBpbXBsZW1lbnQgc3VwcG9ydCBmb3IgTVNSIGJpdG1h
cHMiIGludHJvZHVjZWQgYSB1c2Ugb2YKPj4+PiBtYXBfZG9tYWluX3BhZ2UoKSB3aGljaCBtYXkg
Z2V0IHVzZWQgaW4gdGhlIG1pZGRsZSBvZiBjb250ZXh0IHN3aXRjaC4KPj4+Pgo+Pj4+IFRoaXMg
aXMgbm90IHNhZmUsIGFuZCBjYXVzZXMgWGVuIHRvIGRlYWRsb2NrIG9uIHRoZSBtYXBjYWNoZSBs
b2NrOgo+Pj4+Cj4+Pj4gICAoWEVOKSBYZW4gY2FsbCB0cmFjZToKPj4+PiAgIChYRU4pICAgIFs8
ZmZmZjgyZDA4MDIyZDZhZT5dIFIgX3NwaW5fbG9jaysweDM0LzB4NWUKPj4+PiAgIChYRU4pICAg
IFs8ZmZmZjgyZDA4MDMyMTlkNz5dIEYgbWFwX2RvbWFpbl9wYWdlKzB4MjUwLzB4NTI3Cj4+Pj4g
ICAoWEVOKSAgICBbPGZmZmY4MmQwODAzNTYzMzI+XSBGIGRvX3BhZ2VfZmF1bHQrMHg0MjAvMHg3
ODAKPj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDM4ZGEzZD5dIEYgeDg2XzY0L2VudHJ5LlMj
aGFuZGxlX2V4Y2VwdGlvbl9zYXZlZCsweDY4LzB4OTQKPj4+PiAgIChYRU4pICAgIFs8ZmZmZjgy
ZDA4MDMxNzI5Zj5dIEYgX19maW5kX25leHRfemVyb19iaXQrMHgyOC8weDY5Cj4+Pj4gICAoWEVO
KSAgICBbPGZmZmY4MmQwODAzMjFhNGQ+XSBGIG1hcF9kb21haW5fcGFnZSsweDJjNi8weDUyNwo+
Pj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjllZWIyPl0gRiBudm14X3VwZGF0ZV9leGVjX2Nv
bnRyb2wrMHgxZDcvMHgzMjMKPj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI5OWY1YT5dIEYg
dm14X3VwZGF0ZV9jcHVfZXhlY19jb250cm9sKzB4MjMvMHg0MAo+Pj4+ICAgKFhFTikgICAgWzxm
ZmZmODJkMDgwMjlhM2Y3Pl0gRiBhcmNoL3g4Ni9odm0vdm14L3ZteC5jI3ZteF9jdHh0X3N3aXRj
aF9mcm9tKzB4YjcvMHgxMjEKPj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMxZDc5Nj5dIEYg
YXJjaC94ODYvZG9tYWluLmMjX19jb250ZXh0X3N3aXRjaCsweDEyNC8weDRhOQo+Pj4+ICAgKFhF
TikgICAgWzxmZmZmODJkMDgwMzIwOTI1Pl0gRiBjb250ZXh0X3N3aXRjaCsweDE1NC8weDYyYwo+
Pj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjUyZjNlPl0gRiBjb21tb24vc2NoZWQvY29yZS5j
I3NjaGVkX2NvbnRleHRfc3dpdGNoKzB4MTZhLzB4MTc1Cj4+Pj4gICAoWEVOKSAgICBbPGZmZmY4
MmQwODAyNTM4Nzc+XSBGIGNvbW1vbi9zY2hlZC9jb3JlLmMjc2NoZWR1bGUrMHgyYWQvMHgyYmMK
Pj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIyY2M5Nz5dIEYgY29tbW9uL3NvZnRpcnEuYyNf
X2RvX3NvZnRpcnErMHhiNy8weGM4Cj4+Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyMmNkMzg+
XSBGIGRvX3NvZnRpcnErMHgxOC8weDFhCj4+Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyYTJm
YmI+XSBGIHZteF9hc21fZG9fdm1lbnRyeSsweDJiLzB4MzAKPj4+Pgo+Pj4+IENvbnZlcnQgdGhl
IGRvbWhlYXAgcGFnZSBpbnRvIGJlaW5nIGEgeGVuaGVhcCBwYWdlLgo+Pj4gRml4ZXM6IGM0Nzk4
NGFhYmVhZDUzOTEgKCdudm14OiBpbXBsZW1lbnQgc3VwcG9ydCBmb3IgTVNSIGJpdG1hcHMnKQo+
Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+Pj4+IC0tLQo+Pj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+
Cj4+Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+Pj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+Pj4+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4KPj4+Pgo+Pj4+IEkgc3VzcGVjdCB0aGlzIGlzIHRoZSBub3QtcXVpdGUtY29uc2lz
dGVudC1lbm91Z2gtdG8tYmlzZWN0IGlzc3VlIHdoaWNoCj4+Pj4gT1NTVGVzdCBpcyBoaXR0aW5n
IGFuZCBpbnRlcmZlcmluZyB3aXRoIHB1c2hlcyB0byBtYXN0ZXIuCj4+Pj4gLS0tCj4+Pj4gIHhl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyAgICAgICAgfCAxOSArKysrLS0tLS0tLS0tLS0tLS0t
Cj4+Pj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92dm14LmggfCAgMiArLQo+Pj4+ICAy
IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2
L2h2bS92bXgvdnZteC5jCj4+Pj4gaW5kZXggOTI2YTExYzE1Zi4uZjA0OTkyMDE5NiAxMDA2NDQK
Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKPj4+PiArKysgYi94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMKPj4+PiBAQCAtMTMwLDEyICsxMzAsOSBAQCBpbnQgbnZteF92
Y3B1X2luaXRpYWxpc2Uoc3RydWN0IHZjcHUgKnYpCj4+Pj4gIAo+Pj4+ICAgICAgaWYgKCBjcHVf
aGFzX3ZteF9tc3JfYml0bWFwICkKPj4+PiAgICAgIHsKPj4+PiAtICAgICAgICBudm14LT5tc3Jf
bWVyZ2VkID0gYWxsb2NfZG9taGVhcF9wYWdlKGQsIE1FTUZfbm9fb3duZXIpOwo+Pj4+ICsgICAg
ICAgIG52bXgtPm1zcl9tZXJnZWQgPSBhbGxvY194ZW5oZWFwX3BhZ2UoKTsKPj4+IENvdWxkIHdl
IGFsc28gdXNlIF9fbWFwX2RvbWFpbl9wYWdlX2dsb2JhbCBoZXJlIChrZWVwaW5nIHRoZSBkb21o
ZWFwCj4+PiBhbGxvY2F0aW9uKSBpbiBvcmRlciB0byBtYXAgdGhlIHBhZ2Ugb24gaW5pdCBhbmQg
a2VlcCBpdCBtYXBwZWQgdW50aWwKPj4+IHRoZSBkb21haW4gaXMgZGVzdHJveWVkPwo+PiBKdXN0
IHJlYWQgJ252bXggZGVhZGxvY2sgd2l0aCBNU1IgYml0bWFwcycgbm93IGFuZCByZWFsaXplZCB0
aGF0IHlvdQo+PiBtZW50aW9uIHVzaW5nIG1hcF9kb21haW5fcGFnZV9nbG9iYWwgdGhlcmUgYXMg
YW4gb3B0aW9uIGFsc28sIHNvIEkKPj4gZ3Vlc3MgeW91IHdlbnQgd2l0aCB0aGUgeGVuaGVhcCBw
YWdlIG9wdGlvbiBiZWNhdXNlIGl0IHdhcyBzaW1wbGVyLgo+IAo+IEEgZG9taGVhcCBwYWdlIHdo
aWNoIGlzIG1hcHBlZCBnbG9iYWxseSBmb3IgaXRzIGVudGlyZSBsaWZldGltZSBpcwo+IHN0cmlj
dGx5IGdyZWF0ZXIgb3ZlcmhlYWQgdGhhbiBhIHhlbmhlYXAgcGFnZSwgYmVjYXVzZSBpdCBhbHNv
IHVzZXMgdm1hcAo+IHNwYWNlLgo+IAo+IGdsb2JhbCBkb21oZWFwIG1hcHBpbmdzIGFyZSBmb3Ig
d2hlcmUgd2UgbmVlZCB0byBtYWludGFpbiBhIG1hcHBpbmcgZm9yCj4gbW9yZSB0aGFuIGEgc2lu
Z2xlIHRyYW5zaWVudCBhY2Nlc3MsIGJ1dCB3ZSBkb24ndCBrbm93IGlmL3doYXQvd2hlcmUgYXQK
PiB0aGUgdGltZSB0aGUgZG9tYWluIGlzIGNyZWF0ZWQuCgpJIGRpZG4ndCB0aGluayB0aGF0J3Mg
dGhlIG9ubHkgY3JpdGVyaWE6IE9uZSBsYXJnZSBzeXN0ZW1zIHRoZQp4ZW5oZWFwIG1heSBiZSBl
eGhhdXN0ZWQgd2hpbGUgdGhlIGRvbWhlYXAgaXNuJ3QsIGFuZCBoZW5jZQp1c2luZyBkb21oZWFw
IHBhZ2VzIChhbmQgZ2xvYmFsIG1hcHBpbmdzKSBhbGxvd3MgdG8gYXZvaWQKLUVOT01FTS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
