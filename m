Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E122C1831AD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 14:36:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCNyb-0001SN-Vp; Thu, 12 Mar 2020 13:34:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCNyb-0001SH-06
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 13:34:17 +0000
X-Inumbo-ID: 2ae4b994-6466-11ea-a6c1-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ae4b994-6466-11ea-a6c1-bc764e2007e4;
 Thu, 12 Mar 2020 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584020057;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3fkEIswWyz8JtUac6RUEP/pqOpvEnmBF/ecZEmZgueI=;
 b=USqQ63jTR6wTx9/jBOGrAf9KWBrN7GuqLRZD4m7yzw32iDewFHIktGid
 /gM6k/FkXq7+BFyuhsmwbkI7ArIyTUjyrc4OzCRfH6u/ld2y8hbZtDyfp
 u19gZGjjY7sxY/8oWmxqYzvymt/VlbKPeNOz3ZIUjIpITuk0fcMGF+ADi s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TR4Uwj+kCQtXTCAB4ueWYfqi2Q8dugKs4Ur8pqWaOmx6bx+GW5k3I0JM+Kafd6JVoevpxS8NG5
 Ji+4oJOelhqyYwLl9t2T8TcYyFq8WwoO1O1w+SX6nEhxG0M8PyV7J5JWbNxBIICHKXDC60gHWU
 EKcW6aSdNJ4Uk6eoN8IzEuJAy1GhBJj/cu+wkiUl7EqhUECKy3TYOxwkpsw6swJ3LsE6OFAQFV
 eebVo9aW25eGnNYIfsIgJGRhHDXgnFUyGde4bT32CV9UzVV8QIA/gFXnCxPf90+GYzCKlRU+9D
 zlI=
X-SBRS: 2.7
X-MesageID: 14026338
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14026338"
To: Jan Beulich <jbeulich@suse.com>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
 <20200312093035.GE24458@Air-de-Roger.citrite.net>
 <20200312105846.GH24458@Air-de-Roger.citrite.net>
 <42b11579-cce8-63aa-7fdb-29d834e77fa2@citrix.com>
 <4c452f19-67ed-2f3e-2174-0c3cafa10052@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9cbd0c66-b657-c236-2de5-43ca8888e4c3@citrix.com>
Date: Thu, 12 Mar 2020 13:34:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4c452f19-67ed-2f3e-2174-0c3cafa10052@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
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

T24gMTIvMDMvMjAyMCAxMzoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTIuMDMuMjAyMCAx
MzowNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTIvMDMvMjAyMCAxMDo1OCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgTWFyIDEyLCAyMDIwIGF0IDEwOjMwOjM1QU0g
KzAxMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gT24gV2VkLCBNYXIgMTEsIDIwMjAg
YXQgMDY6MzQ6NTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4gYy9zIGM0Nzk4
NGFhYmVhZCAibnZteDogaW1wbGVtZW50IHN1cHBvcnQgZm9yIE1TUiBiaXRtYXBzIiBpbnRyb2R1
Y2VkIGEgdXNlIG9mCj4+Pj4+IG1hcF9kb21haW5fcGFnZSgpIHdoaWNoIG1heSBnZXQgdXNlZCBp
biB0aGUgbWlkZGxlIG9mIGNvbnRleHQgc3dpdGNoLgo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIG5vdCBz
YWZlLCBhbmQgY2F1c2VzIFhlbiB0byBkZWFkbG9jayBvbiB0aGUgbWFwY2FjaGUgbG9jazoKPj4+
Pj4KPj4+Pj4gICAoWEVOKSBYZW4gY2FsbCB0cmFjZToKPj4+Pj4gICAoWEVOKSAgICBbPGZmZmY4
MmQwODAyMmQ2YWU+XSBSIF9zcGluX2xvY2srMHgzNC8weDVlCj4+Pj4+ICAgKFhFTikgICAgWzxm
ZmZmODJkMDgwMzIxOWQ3Pl0gRiBtYXBfZG9tYWluX3BhZ2UrMHgyNTAvMHg1MjcKPj4+Pj4gICAo
WEVOKSAgICBbPGZmZmY4MmQwODAzNTYzMzI+XSBGIGRvX3BhZ2VfZmF1bHQrMHg0MjAvMHg3ODAK
Pj4+Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzOGRhM2Q+XSBGIHg4Nl82NC9lbnRyeS5TI2hh
bmRsZV9leGNlcHRpb25fc2F2ZWQrMHg2OC8weDk0Cj4+Pj4+ICAgKFhFTikgICAgWzxmZmZmODJk
MDgwMzE3MjlmPl0gRiBfX2ZpbmRfbmV4dF96ZXJvX2JpdCsweDI4LzB4NjkKPj4+Pj4gICAoWEVO
KSAgICBbPGZmZmY4MmQwODAzMjFhNGQ+XSBGIG1hcF9kb21haW5fcGFnZSsweDJjNi8weDUyNwo+
Pj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI5ZWViMj5dIEYgbnZteF91cGRhdGVfZXhlY19j
b250cm9sKzB4MWQ3LzB4MzIzCj4+Pj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjk5ZjVhPl0g
RiB2bXhfdXBkYXRlX2NwdV9leGVjX2NvbnRyb2wrMHgyMy8weDQwCj4+Pj4+ICAgKFhFTikgICAg
WzxmZmZmODJkMDgwMjlhM2Y3Pl0gRiBhcmNoL3g4Ni9odm0vdm14L3ZteC5jI3ZteF9jdHh0X3N3
aXRjaF9mcm9tKzB4YjcvMHgxMjEKPj4+Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMWQ3OTY+
XSBGIGFyY2gveDg2L2RvbWFpbi5jI19fY29udGV4dF9zd2l0Y2grMHgxMjQvMHg0YTkKPj4+Pj4g
ICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMjA5MjU+XSBGIGNvbnRleHRfc3dpdGNoKzB4MTU0LzB4
NjJjCj4+Pj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjUyZjNlPl0gRiBjb21tb24vc2NoZWQv
Y29yZS5jI3NjaGVkX2NvbnRleHRfc3dpdGNoKzB4MTZhLzB4MTc1Cj4+Pj4+ICAgKFhFTikgICAg
WzxmZmZmODJkMDgwMjUzODc3Pl0gRiBjb21tb24vc2NoZWQvY29yZS5jI3NjaGVkdWxlKzB4MmFk
LzB4MmJjCj4+Pj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjJjYzk3Pl0gRiBjb21tb24vc29m
dGlycS5jI19fZG9fc29mdGlycSsweGI3LzB4YzgKPj4+Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQw
ODAyMmNkMzg+XSBGIGRvX3NvZnRpcnErMHgxOC8weDFhCj4+Pj4+ICAgKFhFTikgICAgWzxmZmZm
ODJkMDgwMmEyZmJiPl0gRiB2bXhfYXNtX2RvX3ZtZW50cnkrMHgyYi8weDMwCj4+Pj4+Cj4+Pj4+
IENvbnZlcnQgdGhlIGRvbWhlYXAgcGFnZSBpbnRvIGJlaW5nIGEgeGVuaGVhcCBwYWdlLgo+Pj4+
IEZpeGVzOiBjNDc5ODRhYWJlYWQ1MzkxICgnbnZteDogaW1wbGVtZW50IHN1cHBvcnQgZm9yIE1T
UiBiaXRtYXBzJykKPj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4+PiAtLS0KPj4+Pj4gQ0M6IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4KPj4+Pj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+Pj4+IEND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+Pj4gQ0M6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+Pj4+Pgo+Pj4+PiBJIHN1c3BlY3QgdGhpcyBp
cyB0aGUgbm90LXF1aXRlLWNvbnNpc3RlbnQtZW5vdWdoLXRvLWJpc2VjdCBpc3N1ZSB3aGljaAo+
Pj4+PiBPU1NUZXN0IGlzIGhpdHRpbmcgYW5kIGludGVyZmVyaW5nIHdpdGggcHVzaGVzIHRvIG1h
c3Rlci4KPj4+Pj4gLS0tCj4+Pj4+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgICAgICAg
IHwgMTkgKysrKy0tLS0tLS0tLS0tLS0tLQo+Pj4+PiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
dm14L3Z2bXguaCB8ICAyICstCj4+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgMTYgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL3ZteC92dm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKPj4+Pj4gaW5kZXgg
OTI2YTExYzE1Zi4uZjA0OTkyMDE5NiAxMDA2NDQKPj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdnZteC5jCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+Pj4+
PiBAQCAtMTMwLDEyICsxMzAsOSBAQCBpbnQgbnZteF92Y3B1X2luaXRpYWxpc2Uoc3RydWN0IHZj
cHUgKnYpCj4+Pj4+ICAKPj4+Pj4gICAgICBpZiAoIGNwdV9oYXNfdm14X21zcl9iaXRtYXAgKQo+
Pj4+PiAgICAgIHsKPj4+Pj4gLSAgICAgICAgbnZteC0+bXNyX21lcmdlZCA9IGFsbG9jX2RvbWhl
YXBfcGFnZShkLCBNRU1GX25vX293bmVyKTsKPj4+Pj4gKyAgICAgICAgbnZteC0+bXNyX21lcmdl
ZCA9IGFsbG9jX3hlbmhlYXBfcGFnZSgpOwo+Pj4+IENvdWxkIHdlIGFsc28gdXNlIF9fbWFwX2Rv
bWFpbl9wYWdlX2dsb2JhbCBoZXJlIChrZWVwaW5nIHRoZSBkb21oZWFwCj4+Pj4gYWxsb2NhdGlv
bikgaW4gb3JkZXIgdG8gbWFwIHRoZSBwYWdlIG9uIGluaXQgYW5kIGtlZXAgaXQgbWFwcGVkIHVu
dGlsCj4+Pj4gdGhlIGRvbWFpbiBpcyBkZXN0cm95ZWQ/Cj4+PiBKdXN0IHJlYWQgJ252bXggZGVh
ZGxvY2sgd2l0aCBNU1IgYml0bWFwcycgbm93IGFuZCByZWFsaXplZCB0aGF0IHlvdQo+Pj4gbWVu
dGlvbiB1c2luZyBtYXBfZG9tYWluX3BhZ2VfZ2xvYmFsIHRoZXJlIGFzIGFuIG9wdGlvbiBhbHNv
LCBzbyBJCj4+PiBndWVzcyB5b3Ugd2VudCB3aXRoIHRoZSB4ZW5oZWFwIHBhZ2Ugb3B0aW9uIGJl
Y2F1c2UgaXQgd2FzIHNpbXBsZXIuCj4+IEEgZG9taGVhcCBwYWdlIHdoaWNoIGlzIG1hcHBlZCBn
bG9iYWxseSBmb3IgaXRzIGVudGlyZSBsaWZldGltZSBpcwo+PiBzdHJpY3RseSBncmVhdGVyIG92
ZXJoZWFkIHRoYW4gYSB4ZW5oZWFwIHBhZ2UsIGJlY2F1c2UgaXQgYWxzbyB1c2VzIHZtYXAKPj4g
c3BhY2UuCj4+Cj4+IGdsb2JhbCBkb21oZWFwIG1hcHBpbmdzIGFyZSBmb3Igd2hlcmUgd2UgbmVl
ZCB0byBtYWludGFpbiBhIG1hcHBpbmcgZm9yCj4+IG1vcmUgdGhhbiBhIHNpbmdsZSB0cmFuc2ll
bnQgYWNjZXNzLCBidXQgd2UgZG9uJ3Qga25vdyBpZi93aGF0L3doZXJlIGF0Cj4+IHRoZSB0aW1l
IHRoZSBkb21haW4gaXMgY3JlYXRlZC4KPiBJIGRpZG4ndCB0aGluayB0aGF0J3MgdGhlIG9ubHkg
Y3JpdGVyaWE6CgpJdCBpc24ndCB0aGUgb25seSBjcml0ZXJpYS7CoCBkb21oZWFwK2dsb2JhbCBk
b2VzIGFsc28gbGV0IHlvdSBnZXQKd29ya2luZyBOVU1BIHBvc2l0aW9uaW5nLsKgIEhvd2V2ZXIu
Li4KCj4gT25lIGxhcmdlIHN5c3RlbXMgdGhlCj4geGVuaGVhcCBtYXkgYmUgZXhoYXVzdGVkIHdo
aWxlIHRoZSBkb21oZWFwIGlzbid0LCBhbmQgaGVuY2UKPiB1c2luZyBkb21oZWFwIHBhZ2VzIChh
bmQgZ2xvYmFsIG1hcHBpbmdzKSBhbGxvd3MgdG8gYXZvaWQKPiAtRU5PTUVNLgoKLi4uIG9uIGxh
cmdlIHN5c3RlbXMsIHlvdSBtb3JlIGxpa2VseSB0byBydW4gb3V0IG9mIHZtYXAgc3BhY2UgdGhh
bgp4ZW5oZWFwIHNwYWNlLCBzZWVpbmcgYXMgdGhlIGZvcm1lciBpcyBsaW1pdGVkIHRvIDY0RyAo
aW5jIGlvbWFwL2ZpeG1hcAptYXBwaW5ncyksIGFuZCB0aGUgbGF0dGVyIHRvcHMgb3V0IGF0IDRU
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
