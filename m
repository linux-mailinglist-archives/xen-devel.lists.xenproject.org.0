Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B33A6671
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 12:19:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i55rd-0001gp-9V; Tue, 03 Sep 2019 10:16:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i55rb-0001gh-S6
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 10:16:39 +0000
X-Inumbo-ID: ea3704ce-ce33-11e9-ab8c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea3704ce-ce33-11e9-ab8c-12813bfff9fa;
 Tue, 03 Sep 2019 10:16:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 74EDCAC7F;
 Tue,  3 Sep 2019 10:16:37 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46c66d92-87c0-d90f-921d-68082d52c798@suse.com>
Date: Tue, 3 Sep 2019 12:16:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828080028.18205-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/4] xen: refactor debugtrace data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDguMjAxOSAxMDowMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBcyBhIHByZXBhcmF0
aW9uIGZvciBwZXItY3B1IGJ1ZmZlcnMgZG8gYSBsaXR0bGUgcmVmYWN0b3Jpbmcgb2YgdGhlCj4g
ZGVidWd0cmFjZSBkYXRhOiBwdXQgdGhlIG5lZWRlZCBidWZmZXIgYWRtaW4gZGF0YSBpbnRvIHRo
ZSBidWZmZXIgYXMKPiBpdCB3aWxsIGJlIG5lZWRlZCBmb3IgZWFjaCBidWZmZXIuCj4gCj4gV2hp
bGUgYXQgaXQgc3dpdGNoIGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlIGFuZCBkZWJ1Z3RyYWNl
X3VzZWQgdG8KPiBib29sIGFuZCBkZWxldGUgYW4gZW1wdHkgbGluZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIHhlbi9jb21tb24v
ZGVidWd0cmFjZS5jIHwgNjIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZGVidWd0cmFjZS5jIGIveGVuL2Nv
bW1vbi9kZWJ1Z3RyYWNlLmMKPiBpbmRleCBhMmZhYjBkNzJjLi43YTllNGZiOTlmIDEwMDY0NAo+
IC0tLSBhL3hlbi9jb21tb24vZGVidWd0cmFjZS5jCj4gKysrIGIveGVuL2NvbW1vbi9kZWJ1Z3Ry
YWNlLmMKPiBAQCAtMTUsMzMgKzE1LDM5IEBACj4gICNpbmNsdWRlIDx4ZW4vd2F0Y2hkb2cuaD4K
PiAgCj4gIC8qIFNlbmQgb3V0cHV0IGRpcmVjdCB0byBjb25zb2xlLCBvciBidWZmZXIgaXQ/ICov
Cj4gLXN0YXRpYyB2b2xhdGlsZSBpbnQgZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGU7Cj4gK3N0
YXRpYyB2b2xhdGlsZSBib29sIGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlOwo+ICAKPiAtc3Rh
dGljIGNoYXIgICAgICAgICpkZWJ1Z3RyYWNlX2J1ZjsgLyogRGVidWctdHJhY2UgYnVmZmVyICov
Cj4gLXN0YXRpYyB1bnNpZ25lZCBpbnQgZGVidWd0cmFjZV9wcmQ7IC8qIFByb2R1Y2VyIGluZGV4
ICAgICAqLwo+IC1zdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2Vfa2lsb2J5dGVzID0gMTI4
LCBkZWJ1Z3RyYWNlX2J5dGVzOwo+IC1zdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2VfdXNl
ZDsKPiArc3RydWN0IGRlYnVndHJhY2VfZGF0YV9zIHsKCklzIHRoZSBfcyBzdWZmaXggcmVhbGx5
IG5lZWRlZCBmb3Igc29tZSByZWFzb24/Cgo+ICsgICAgdW5zaWduZWQgbG9uZyBieXRlczsgLyog
U2l6ZSBvZiBidWZmZXIuICovCj4gKyAgICB1bnNpZ25lZCBsb25nIHByZDsgICAvKiBQcm9kdWNl
ciBpbmRleC4gKi8KClNlZWluZyB0aGF0IHlvdSBzd2l0Y2ggZnJvbSBpbnQgdG8gbG9uZyBoZXJl
IC0gYXJlIHlvdSByZWFsbHkKZmFuY3lpbmcgdGhlc2UgYnVmZmVycyB0byBnbyBiZXlvbmQgNEdp
QiBpbiBzaXplPwoKPiArICAgIGNoYXIgICAgICAgICAgYnVmW107Cj4gK307Cj4gKwo+ICtzdGF0
aWMgc3RydWN0IGRlYnVndHJhY2VfZGF0YV9zICpkZWJ0cl9kYXRhOwoKSG93IGFib3V0IHMvZGVi
dHIvZHQvIG9yIHMvZGVidHIvZGVidWd0cmFjZS8gPwoKPiArc3RhdGljIHVuc2lnbmVkIGludCBk
ZWJ1Z3RyYWNlX2tpbG9ieXRlcyA9IDEyODsKClNpbmNlIHlvdSB0b3VjaCB0aGlzIGFueXdheSwg
YWRkIF9faW5pdGRhdGE/IE1heWJlIGFsc28gbW92ZSBpdApuZXh0IHRvIGl0cyBpbnRlZ2VyX3Bh
cmFtKCk/Cgo+ICtzdGF0aWMgYm9vbCBkZWJ1Z3RyYWNlX3VzZWQ7Cj4gIHN0YXRpYyBERUZJTkVf
U1BJTkxPQ0soZGVidWd0cmFjZV9sb2NrKTsKPiAgaW50ZWdlcl9wYXJhbSgiZGVidWd0cmFjZSIs
IGRlYnVndHJhY2Vfa2lsb2J5dGVzKTsKPiAgCj4gIHN0YXRpYyB2b2lkIGRlYnVndHJhY2VfZHVt
cF93b3JrZXIodm9pZCkKPiAgewo+IC0gICAgaWYgKCAoZGVidWd0cmFjZV9ieXRlcyA9PSAwKSB8
fCAhZGVidWd0cmFjZV91c2VkICkKPiArICAgIGlmICggIWRlYnRyX2RhdGEgfHwgIWRlYnVndHJh
Y2VfdXNlZCApCj4gICAgICAgICAgcmV0dXJuOwoKV2h5IGRvbid0IHlvdSBnZXQgcmlkIG9mIHRo
ZSBsZWZ0IHNpZGUgb2YgdGhlIHx8IGFsdG9nZXRoZXI/Cgo+IEBAIC0xNjUsMTIgKzE3MSwxNCBA
QCBzdGF0aWMgaW50IF9faW5pdCBkZWJ1Z3RyYWNlX2luaXQodm9pZCkKPiAgICAgICAgICByZXR1
cm4gMDsKPiAgCj4gICAgICBvcmRlciA9IGdldF9vcmRlcl9mcm9tX2J5dGVzKGJ5dGVzKTsKPiAt
ICAgIGRlYnVndHJhY2VfYnVmID0gYWxsb2NfeGVuaGVhcF9wYWdlcyhvcmRlciwgMCk7Cj4gLSAg
ICBBU1NFUlQoZGVidWd0cmFjZV9idWYgIT0gTlVMTCk7Cj4gKyAgICBkYXRhID0gYWxsb2NfeGVu
aGVhcF9wYWdlcyhvcmRlciwgMCk7Cj4gKyAgICBpZiAoICFkYXRhICkKPiArICAgICAgICByZXR1
cm4gLUVOT01FTTsKPiAgCj4gLSAgICBtZW1zZXQoZGVidWd0cmFjZV9idWYsICdcMCcsIGJ5dGVz
KTsKPiArICAgIG1lbXNldChkYXRhLCAnXDAnLCBieXRlcyk7Cj4gIAo+IC0gICAgZGVidWd0cmFj
ZV9ieXRlcyA9IGJ5dGVzOwo+ICsgICAgZGF0YS0+Ynl0ZXMgPSBieXRlcyAtIHNpemVvZigqZGF0
YSk7Cj4gKyAgICBkZWJ0cl9kYXRhID0gZGF0YTsKClRoZSBhbGxvY2F0aW9uIG1heSBlbmQgdXAg
YmVpbmcgYWxtb3N0IHR3aWNlIGFzIGJpZyBhcyB3aGF0IGdldHMKYWN0dWFsbHkgdXNlZCB0aGlz
IHdheS4gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byByZS1jYWxjdWxhdGUKImJ5dGVzIiBmcm9t
ICJvcmRlciI/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
