Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6E10A70C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 00:18:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZk4f-0008Sc-2d; Tue, 26 Nov 2019 23:16:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nsV+=ZS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iZk4e-0008SO-Cq
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 23:16:48 +0000
X-Inumbo-ID: d1a83fe8-10a2-11ea-9db0-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1a83fe8-10a2-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 23:16:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 195862068E;
 Tue, 26 Nov 2019 23:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574810207;
 bh=IgK6VvSijGW3VrQp8aIofpvEdqjANcSa/FIdtoEVT8U=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=T25HQnGzCkDFlGdOLUy/481KmXmTH1IToyJtLwQjfTn2PtAvm4IWdbL9E/q6w8vih
 ucjWWtEiOu0pFXJb7B+fl3MVgeuse34TTA5xRDKX0nZ9Py+dXNxwelayoqnOwOl5Tg
 izz8olcMvc8Q+HkCC1isN2/WQNZIqLvD9vKhNtNs=
Date: Tue, 26 Nov 2019 15:16:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <2888ea80-594f-d619-9815-eb13eb102b19@xen.org>
Message-ID: <alpine.DEB.2.21.1911261513520.8205@sstabellini-ThinkPad-T480s>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201407.45042-1-stewart.hildebrand@dornerworks.com>
 <2888ea80-594f-d619-9815-eb13eb102b19@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC XEN PATCH v3 10/11] xen: arm: context switch
 vtimer PPI state.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Ian Campbell <ian.campbell@citrix.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNSBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE1LzExLzIwMTkg
MjA6MTQsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToKPiA+IEZyb206IElhbiBDYW1wYmVsbCA8
aWFuLmNhbXBiZWxsQGNpdHJpeC5jb20+Cj4gPiAKPiA+IC4uLiBpbnN0ZWFkIG9mIGFydGlmaWNp
YWxseSBtYXNraW5nIHRoZSB0aW1lciBpbnRlcnJ1cHQgaW4gdGhlIHRpbWVyCj4gPiBzdGF0ZSBh
bmQgcmVseWluZyBvbiB0aGUgZ3Vlc3QgdG8gdW5tYXNrICh3aGljaCBpdCBpc24ndCByZXF1aXJl
ZCB0bwo+ID4gZG8gcGVyIHRoZSBoL3cgc3BlYywgYWx0aG91Z2ggTGludXggZG9lcykuCj4gPiAK
PiA+IEJ5IHVzaW5nIHRoZSBuZXdseSBhZGRlZCBod3BwaSBzYXZlL3Jlc3RvcmUgZnVuY3Rpb25h
bGl0eSB3ZSBtYWtlIHVzZQo+ID4gb2YgdGhlIEdJQ0QgSVtTQ11BQ1RJVkVSIHJlZ2lzdGVycyB0
byBzYXZlIGFuZCByZXN0b3JlIHRoZSBhY3RpdmUKPiA+IHN0YXRlIG9mIHRoZSBpbnRlcnJ1cHQs
IHdoaWNoIHByZXZlbnRzIHRoZSBuZXN0ZWQgaW52b2NhdGlvbnMgd2hpY2gKPiA+IHRoZSBjdXJy
ZW50IG1hc2tpbmcgd29ya3MgYXJvdW5kLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBJYW4gQ2Ft
cGJlbGwgPGlhbi5jYW1wYmVsbEBjaXRyaXguY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogU3Rld2Fy
dCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgo+ID4gLS0t
Cj4gPiB2MjogUmViYXNlZCwgaW4gcGFydGljdWxhciBvdmVyIEp1bGllbidzIHBhc3N0aHJvdWdo
IHN0dWZmIHdoaWNoCj4gPiAgICAgIHJld29ya2VkIGEgYnVuY2ggb2YgSVJRIHJlbGF0ZWQgc3R1
ZmYuCj4gPiAgICAgIEFsc28gbGFyZ2VseSByZXdyaXR0ZW4gc2luY2UgcHJlY3Vyc29yIHBhdGNo
ZXMgbm93IGxheSB2ZXJ5Cj4gPiAgICAgIGRpZmZlcmVudCBncm91bmR3b3JrLgo+ID4gCj4gPiB2
MzogQWRkcmVzcyBmZWVkYmFjayBmcm9tIHYyIFsxXToKPiA+ICAgICogUmVtb3ZlIHZpcnRfdGlt
ZXJfaXJxcyBwZXJmb3JtYW5jZSBjb3VudGVyIHNpbmNlIGl0IGlzIG5vdyB1bnVzZWQuCj4gPiAg
ICAqIEFkZCBjYXZlYXQgdG8gY29tbWVudCBhYm91dCBub3QgdXNpbmcgSSpBQ1RJVkVSIHJlZ2lz
dGVyLgo+ID4gICAgKiBIQUNLOiBkb24ndCBpbml0aWFsaXplIHBlbmRpbmdfaXJxLT5pcnEgaW4g
dnRpbWVyIGZvciBuZXcgdkdJQyB0bwo+ID4gICAgICBhbGxvd3MgdXMgdG8gYnVpbGQgd2l0aCBD
T05GSUdfTkVXX1ZHSUM9eQo+ID4gCj4gPiBbMV0KPiA+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNS0xMS9tc2cwMTA2NS5odG1sCj4gPiAt
LS0KPiA+IAo+ID4gTm90ZTogUmVnYXJkaW5nIFN0ZWZhbm8ncyBjb21tZW50IGluIFsyXSwgSSBk
aWQgdGVzdCBpdCB3aXRoIHRoZSBjYWxsCj4gPiB0byBnaWNfaHdwcGlfc2V0X3BlbmRpbmcgcmVt
b3ZlZCwgYW5kIEkgd2FzIGFibGUgdG8gYm9vdCBkb20wLgo+IAo+IFdoZW4gZGVhbGluZyB3aXRo
IHRoZSB2R0lDLCB0ZXN0aW5nIGlzIG5vdCBlbm91Z2ggdG8ganVzdGlmeSB0aGUgcmVtb3ZhbCBv
Zgo+IHNvbWUgY29kZS4gV2UgbmVlZCBhIHdvcmRlZCBqdXN0aWZpY2F0aW9uIG9mIHdoeSBpdCBp
cyAob3Igbm90KSBuZWNlc3NhcnkuCj4gCj4gSW4gdGhpcyBjYXNlIHRoZSB0aW1lciBpcyBsZXZl
bCAoZGVzcGl0ZSBzb21lIGJyb2tlbiBIVyBtaXNjb25maWd1cmluZyBpdCksIHNvCj4gYnkgcmVt
b3Zpbmcgc2V0X3BlbmRpbmcoKSB5b3UgZG9uJ3QgYWZmZWN0IGFueXRoaW5nIGFzIHJlc3Rvcmlu
ZyB0aGUgdGltZXIKPiByZWdpc3RlcnMgd2lsbCBhdXRvbWF0aWNhbGx5IG1hcmsgdGhlIGludGVy
cnVwdCBwZW5kaW5nLgo+IAo+ID4gCj4gPiBbMl0KPiA+IGh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNS0xMi9tc2cwMjY4My5odG1sCj4gPiAt
LS0KPiA+ICAgeGVuL2FyY2gvYXJtL3RpbWUuYyAgICAgICAgICAgICAgfCAyNiArKy0tLS0tLS0t
LS0tLS0tLS0KPiA+ICAgeGVuL2FyY2gvYXJtL3Z0aW1lci5jICAgICAgICAgICAgfCA0NSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ID4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2Rv
bWFpbi5oICAgICB8ICAxICsKPiA+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9wZXJmY19kZWZuLmgg
fCAgMSAtCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRp
b25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGltZS5jIGIveGVuL2Fy
Y2gvYXJtL3RpbWUuYwo+ID4gaW5kZXggNzM5YmNmMTg2Yy4uZTNhMjNiOGUxNiAxMDA2NDQKPiA+
IC0tLSBhL3hlbi9hcmNoL2FybS90aW1lLmMKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS90aW1lLmMK
PiA+IEBAIC0yNDMsMjggKzI0Myw2IEBAIHN0YXRpYyB2b2lkIHRpbWVyX2ludGVycnVwdChpbnQg
aXJxLCB2b2lkICpkZXZfaWQsCj4gPiBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiA+ICAg
ICAgIH0KPiA+ICAgfQo+ID4gICAtc3RhdGljIHZvaWQgdnRpbWVyX2ludGVycnVwdChpbnQgaXJx
LCB2b2lkICpkZXZfaWQsIHN0cnVjdCBjcHVfdXNlcl9yZWdzCj4gPiAqcmVncykKPiA+IC17Cj4g
PiAtICAgIC8qCj4gPiAtICAgICAqIEVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdHMgY2FuIGJlIHVz
ZWQgZm9yIHRoZSB2aXJ0dWFsIHRpbWVyLiBFdmVuCj4gPiAtICAgICAqIGlmIHRoZSB0aW1lciBv
dXRwdXQgc2lnbmFsIGlzIG1hc2tlZCBpbiB0aGUgY29udGV4dCBzd2l0Y2gsIHRoZQo+ID4gLSAg
ICAgKiBHSUMgd2lsbCBrZWVwIHRyYWNrIHRoYXQgb2YgYW55IGludGVycnVwdHMgcmFpc2VkIHdo
aWxlIElSUVMgYXJlCj4gPiAtICAgICAqIGRpc2FibGVkLiBBcyBzb29uIGFzIElSUXMgYXJlIHJl
LWVuYWJsZWQsIHRoZSB2aXJ0dWFsIGludGVycnVwdAo+ID4gLSAgICAgKiB3aWxsIGJlIGluamVj
dGVkIHRvIFhlbi4KPiA+IC0gICAgICoKPiA+IC0gICAgICogSWYgYW4gSURMRSB2Q1BVIHdhcyBz
Y2hlZHVsZWQgbmV4dCB0aGVuIHdlIHNob3VsZCBpZ25vcmUgdGhlCj4gPiAtICAgICAqIGludGVy
cnVwdC4KPiA+IC0gICAgICovCj4gPiAtICAgIGlmICggdW5saWtlbHkoaXNfaWRsZV92Y3B1KGN1
cnJlbnQpKSApCj4gPiAtICAgICAgICByZXR1cm47Cj4gPiAtCj4gPiAtICAgIHBlcmZjX2luY3Io
dmlydF90aW1lcl9pcnFzKTsKPiA+IC0KPiA+IC0gICAgY3VycmVudC0+YXJjaC52aXJ0X3RpbWVy
LmN0bCA9IFJFQURfU1lTUkVHMzIoQ05UVl9DVExfRUwwKTsKPiA+IC0gICAgV1JJVEVfU1lTUkVH
MzIoY3VycmVudC0+YXJjaC52aXJ0X3RpbWVyLmN0bCB8IENOVHhfQ1RMX01BU0ssCj4gPiBDTlRW
X0NUTF9FTDApOwo+ID4gLSAgICB2Z2ljX2luamVjdF9pcnEoY3VycmVudC0+ZG9tYWluLCBjdXJy
ZW50LCBjdXJyZW50LT5hcmNoLnZpcnRfdGltZXIuaXJxLAo+ID4gdHJ1ZSk7Cj4gPiAtfQo+ID4g
LQo+ID4gICAvKgo+ID4gICAgKiBBcmNoIHRpbWVyIGludGVycnVwdCByZWFsbHkgb3VnaHQgdG8g
YmUgbGV2ZWwgdHJpZ2dlcmVkLCBzaW5jZSB0aGUKPiA+ICAgICogZGVzaWduIG9mIHRoZSB0aW1l
ci9jb21wYXJhdG9yIG1lY2hhbmlzbSBpcyBiYXNlZCBhcm91bmQgdGhhdAo+ID4gQEAgLTMwNCw4
ICsyODIsOCBAQCB2b2lkIGluaXRfdGltZXJfaW50ZXJydXB0KHZvaWQpCj4gPiAgICAgICAgIHJl
cXVlc3RfaXJxKHRpbWVyX2lycVtUSU1FUl9IWVBfUFBJXSwgMCwgdGltZXJfaW50ZXJydXB0LAo+
ID4gICAgICAgICAgICAgICAgICAgImh5cHRpbWVyIiwgTlVMTCk7Cj4gPiAtICAgIHJlcXVlc3Rf
aXJxKHRpbWVyX2lycVtUSU1FUl9WSVJUX1BQSV0sIDAsIHZ0aW1lcl9pbnRlcnJ1cHQsCj4gPiAt
ICAgICAgICAgICAgICAgICAgICJ2aXJ0aW1lciIsIE5VTEwpOwo+ID4gKyAgICByb3V0ZV9od3Bw
aV90b19jdXJyZW50X3ZjcHUodGltZXJfaXJxW1RJTUVSX1ZJUlRfUFBJXSwgInZpcnRpbWVyIik7
Cj4gPiArCj4gPiAgICAgICByZXF1ZXN0X2lycSh0aW1lcl9pcnFbVElNRVJfUEhZU19OT05TRUNV
UkVfUFBJXSwgMCwgdGltZXJfaW50ZXJydXB0LAo+ID4gICAgICAgICAgICAgICAgICAgInBoeXRp
bWVyIiwgTlVMTCk7Cj4gPiAgIGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdnRpbWVyLmMgYi94
ZW4vYXJjaC9hcm0vdnRpbWVyLmMKPiA+IGluZGV4IGU2YWViZGFjOWUuLjZlMzQ5ODk1MmQgMTAw
NjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vdnRpbWVyLmMKPiA+ICsrKyBiL3hlbi9hcmNoL2Fy
bS92dGltZXIuYwo+ID4gQEAgLTU1LDkgKzU1LDE5IEBAIHN0YXRpYyB2b2lkIHBoeXNfdGltZXJf
ZXhwaXJlZCh2b2lkICpkYXRhKQo+ID4gICBzdGF0aWMgdm9pZCB2aXJ0X3RpbWVyX2V4cGlyZWQo
dm9pZCAqZGF0YSkKPiA+ICAgewo+ID4gICAgICAgc3RydWN0IHZ0aW1lciAqdCA9IGRhdGE7Cj4g
PiAtICAgIHQtPmN0bCB8PSBDTlR4X0NUTF9NQVNLOwo+ID4gLSAgICB2Z2ljX2luamVjdF9pcnEo
dC0+di0+ZG9tYWluLCB0LT52LCB0LT5pcnEsIHRydWUpOwo+ID4gLSAgICBwZXJmY19pbmNyKHZ0
aW1lcl92aXJ0X2luamVjdCk7Cj4gPiArICAgIHQtPmN0bCB8PSBDTlR4X0NUTF9QRU5ESU5HOwo+
IAo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBuZWNlc3NhcnkuIElmIHRoZSBzb2Z0d2FyZSB0aW1l
ciBmaXJlLCB0aGVuIHRoZSB2aXJ0dWFsCj4gdGltZXIgKGluIEhXKSB3b3VsZCBoYXZlIGZpcmVk
IHRvby4gU28gYnkgcmVzdG9yaW5nIHRoZSB0aW1lciwgdGhlbiB0aGUgSFcKPiBzaG91bGQgYnkg
aXRzZWxmIHNldCB0aGUgcGVuZGluZyBiaXQgYW5kIHRyaWdnZXIgdGhlIGludGVycnVwdC4KPiAK
PiA+ICsgICAgaWYgKCAhKHQtPmN0bCAmIENOVHhfQ1RMX01BU0spICkKPiAKPiBUaGUgdGltZXIg
aXMgb25seSBzZXQgaWYgdGhlIHZpcnR1YWwgdGltZXIgaXMgZW5hYmxlZCBhbmQgbm90IG1hc2tl
ZC4gU28gSQo+IHRoaW5rIHRoaXMgY2hlY2sgaXMgdW5uZWNlc3NhcnkgYXMgd2UgY291bGQgbmV2
ZXIgcmVhY2hlZCB0aGlzIGNvZGUgd2l0aCB0aGUKPiB2aXJ0dWFsIHRpbWVyIG1hc2tlZC4KPiAK
PiA+ICsgICAgewo+ID4gKyAgICAgICAgLyoKPiA+ICsgICAgICAgICAqIEFuIGVkZ2UgdHJpZ2dl
cmVkIGludGVycnVwdCBzaG91bGQgbm93IGJlIHBlbmRpbmcuIFNpbmNlCj4gCj4gVGhpcyBkb2Vz
IG5vdCBtYWtlIHNlbnNlLCB0aGUgdGltZXIgaW50ZXJydXB0IG91Z2h0IHRvIGJlIGxldmVsLiBT
byB3aHkgYXJlCj4geW91IGV2ZW4gc3BlYWtpbmcgYWJvdXQgZWRnZSBoZXJlPwo+IAo+ID4gKyAg
ICAgICAgICogdGhpcyB0aW1lciBjYW4gbmV2ZXIgZXhwaXJlIHdoaWxlIHRoZSBkb21haW4gaXMg
c2NoZWR1bGVkCj4gPiArICAgICAgICAgKiB3ZSBrbm93IHRoYXQgdGhlIGdpY19yZXN0b3JlX2h3
cHBpIGluIHZpcnRfdGltZXJfcmVzdG9yZQo+ID4gKyAgICAgICAgICogd2lsbCBjYXVzZSB0aGUg
cmVhbCBod3BwaSB0byBvY2N1ciBhbmQgYmUgcm91dGVkLgo+ID4gKyAgICAgICAgICovCj4gPiAr
ICAgICAgICBnaWNfaHdwcGlfc2V0X3BlbmRpbmcoJnQtPnBwaV9zdGF0ZSk7Cj4gPiArICAgICAg
ICB2Y3B1X3VuYmxvY2sodC0+dik7Cj4gPiArICAgICAgICBwZXJmY19pbmNyKHZ0aW1lcl92aXJ0
X2luamVjdCk7Cj4gPiArICAgIH0KPiAKPiBJIHRoaW5rIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB2
aXJ0X3RpbWVyX2V4cGlyZWQgY291bGQgb25seSBiZToKPiAKPiB2Y3B1X3VubG9jayguLi4pOwog
IF4gdmNwdV91bmJsb2NrCgpZb3VyIHJlYXNvbmluZyBzZWVtcyBzb3VuZAoKCj4gcGVyZmNfaW5j
cih2dGltZXJfdmlydF9pbmplY3QpOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
