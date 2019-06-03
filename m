Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2A331D7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 16:16:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXni7-0006oo-Q1; Mon, 03 Jun 2019 14:13:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YxrJ=UC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hXni5-0006of-LV
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:13:13 +0000
X-Inumbo-ID: b704bf8c-8609-11e9-b759-63891f5be6bb
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b704bf8c-8609-11e9-b759-63891f5be6bb;
 Mon, 03 Jun 2019 14:13:10 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: zjcO7tGOVorAcwCSoeTKrudPujHDVh64VakynO8gt8Q3b/QxcpFiyqdoV3/haZ0J1IMdB+qYGx
 ifPtu107DwCjXUOmi5aL4AR+3VUMmP42j6BoYQn22Tl7FK4OYEc+J/pyK77RcJeL4Sy+nbuiLP
 CcNuotpP/gRAF2qehVSaJ5RwBpQ370x7qpFBHJcqLe03Cs6YMaiXGeJPhgRzojcuzFw8dSoz5i
 nmAvrADMAXdEP26BbKzM+paCBcDCR0cVH8GSYzyYdZmU9SXS2l4X6fdIe8paSuF0nkwue20NVn
 g00=
X-SBRS: 2.7
X-MesageID: 1245872
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,547,1549947600"; 
   d="scan'208";a="1245872"
Date: Mon, 3 Jun 2019 16:12:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190603141254.neovzuf2rdxywhss@Air-de-Roger>
References: <5CEE5C4D02000078002335A0@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CEE5C4D02000078002335A0@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/SMP: don't try to stop already stopped
 CPUs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDQ6MTc6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4gcGFydGljdWxhciB3aXRoIGFuIGVuYWJsZWQgSU9NTVUgKGJ1dCBub3QgcmVhbGx5
IGxpbWl0ZWQgdG8gdGhpcwo+IGNhc2UpLCB0cnlpbmcgdG8gaW52b2tlIGZpeHVwX2lycXMoKSBh
ZnRlciBoYXZpbmcgYWxyZWFkeSBkb25lCj4gZGlzYWJsZV9JT19BUElDKCkgLT4gY2xlYXJfSU9f
QVBJQygpIGlzIGEgcmF0aGVyIGJhZCBpZGVhOgo+IAo+ICBSSVA6ICAgIGUwMDg6WzxmZmZmODJk
MDgwMjZhMDM2Pl0gYW1kX2lvbW11X3JlYWRfaW9hcGljX2Zyb21faXJlKzB4ZGUvMHgxMTMKPiAg
UkZMQUdTOiAwMDAwMDAwMDAwMDEwMDA2ICAgQ09OVEVYVDogaHlwZXJ2aXNvciAoZDB2MCkKPiAg
cmF4OiBmZmZmODMyMDI5MWRlMDBjICAgcmJ4OiAwMDAwMDAwMDAwMDAwMDAzICAgcmN4OiBmZmZm
ODMyMDM1MDAwMDAwCj4gIHJkeDogMDAwMDAwMDAwMDAwMDAwMCAgIHJzaTogMDAwMDAwMDAwMDAw
MDAwMCAgIHJkaTogZmZmZjgyZDA4MDVjYTg0MAo+ICByYnA6IGZmZmY4MzAwOWU4YTc5YzggICBy
c3A6IGZmZmY4MzAwOWU4YTc5YTggICByODogIDAwMDAwMDAwMDAwMDAwMDAKPiAgcjk6ICAwMDAw
MDAwMDAwMDAwMDA0ICAgcjEwOiAwMDAwMDAwMDAwMDhiOWY5ICAgcjExOiAwMDAwMDAwMDAwMDAw
MDA2Cj4gIHIxMjogMDAwMDAwMDAwMDAxMDAwMCAgIHIxMzogMDAwMDAwMDAwMDAwMDAwMyAgIHIx
NDogMDAwMDAwMDAwMDAwMDAwMAo+ICByMTU6IDAwMDAwMDAwZmZmZWZmZmYgICBjcjA6IDAwMDAw
MDAwODAwNTAwMzMgICBjcjQ6IDAwMDAwMDAwMDAzNDA2ZTAKPiAgY3IzOiAwMDAwMDAyMDM1ZDU5
MDAwICAgY3IyOiBmZmZmODg4MjRjY2I0ZWUwCj4gIGZzYjogMDAwMDdmMjE0M2YwODg0MCAgIGdz
YjogZmZmZjg4ODI1NmEwMDAwMCAgIGdzczogMDAwMDAwMDAwMDAwMDAwMAo+ICBkczogMDAwMCAg
IGVzOiAwMDAwICAgZnM6IDAwMDAgICBnczogMDAwMCAgIHNzOiBlMDEwICAgY3M6IGUwMDgKPiAg
WGVuIGNvZGUgYXJvdW5kIDxmZmZmODJkMDgwMjZhMDM2PiAoYW1kX2lvbW11X3JlYWRfaW9hcGlj
X2Zyb21faXJlKzB4ZGUvMHgxMTMpOgo+ICAgZmYgMDcgMDAgMDAgMzkgZDMgNzQgMDIgPDBmPiAw
YiA0MSA4MSBlNCAwMCBmOCBmZiBmZiA4YiAxMCA4OSBkMCAyNSAwMCAwMAo+ICBYZW4gc3RhY2sg
dHJhY2UgZnJvbSByc3A9ZmZmZjgzMDA5ZThhNzlhODoKPiAgLi4uCj4gIFhlbiBjYWxsIHRyYWNl
Ogo+ICAgICBbPGZmZmY4MmQwODAyNmEwMzY+XSBhbWRfaW9tbXVfcmVhZF9pb2FwaWNfZnJvbV9p
cmUrMHhkZS8weDExMwo+ICAgICBbPGZmZmY4MmQwODAyNmJmN2I+XSBpb21tdV9yZWFkX2FwaWNf
ZnJvbV9pcmUrMHgxMC8weDEyCj4gICAgIFs8ZmZmZjgyZDA4MDI3ZjcxOD5dIGlvX2FwaWMuYyNt
b2RpZnlfSU9fQVBJQ19pcnErMHg1ZS8weDEyNgo+ICAgICBbPGZmZmY4MmQwODAyN2Y5YzU+XSBp
b19hcGljLmMjdW5tYXNrX0lPX0FQSUNfaXJxKzB4MmQvMHg0MQo+ICAgICBbPGZmZmY4MmQwODAy
ODliYzc+XSBmaXh1cF9pcnFzKzB4MzIwLzB4NDBiCj4gICAgIFs8ZmZmZjgyZDA4MDJhODJjND5d
IHNtcF9zZW5kX3N0b3ArMHg0Yi8weGE4Cj4gICAgIFs8ZmZmZjgyZDA4MDJhN2IyZj5dIG1hY2hp
bmVfcmVzdGFydCsweDk4LzB4Mjg4Cj4gICAgIFs8ZmZmZjgyZDA4MDI1MjI0Mj5dIGNvbnNvbGVf
c3VzcGVuZCswLzB4MjgKPiAgICAgWzxmZmZmODJkMDgwMmIwMWRhPl0gZG9fZ2VuZXJhbF9wcm90
ZWN0aW9uKzB4MjA0LzB4MjRlCj4gICAgIFs8ZmZmZjgyZDA4MDM4NWEzZD5dIHg4Nl82NC9lbnRy
eS5TI2hhbmRsZV9leGNlcHRpb25fc2F2ZWQrMHg2OC8weDk0Cj4gICAgIFs8MDAwMDAwMDBhYTVi
NTI2Yj5dIDAwMDAwMDAwYWE1YjUyNmIKPiAgICAgWzxmZmZmODJkMDgwMmE3YzdkPl0gbWFjaGlu
ZV9yZXN0YXJ0KzB4MWU2LzB4Mjg4Cj4gICAgIFs8ZmZmZjgyZDA4MDI0MGY3NT5dIGh3ZG9tX3No
dXRkb3duKzB4YTIvMHgxMWQKPiAgICAgWzxmZmZmODJkMDgwMjBiYWEyPl0gZG9tYWluX3NodXRk
b3duKzB4NGYvMHhkOAo+ICAgICBbPGZmZmY4MmQwODAyM2ZlOTg+XSBkb19zY2hlZF9vcCsweDEy
Zi8weDQyYQo+ICAgICBbPGZmZmY4MmQwODAzN2U0MDQ+XSBwdl9oeXBlcmNhbGwrMHgxZTQvMHg1
NjQKPiAgICAgWzxmZmZmODJkMDgwMzg1NDMyPl0gbHN0YXJfZW50ZXIrMHgxMTIvMHgxMjAKPiAK
PiBEb24ndCBjYWxsIGZpeHVwX2lycXMoKSBhbmQgZG9uJ3Qgc2VuZCBhbnkgSVBJIGlmIHRoZXJl
J3Mgb25seSBvbmUKPiBvbmxpbmUgQ1BVIGFueXdheSwgYW5kIGRvbid0IGNhbGwgX19zdG9wX3Ro
aXNfY3B1KCkgYXQgYWxsIHdoZW4gdGhlIENQVQo+IHdlJ3JlIG9uIHdhcyBhbHJlYWR5IG1hcmtl
ZCBvZmZsaW5lIChieSBhIHByaW9yIGludm9jYXRpb24gb2YKPiBfX3N0b3BfdGhpc19jcHUoKSku
Cj4gCj4gUmVwb3J0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwo+IEBA
IC0zMDIsMjMgKzMwMiwzMSBAQCBzdGF0aWMgdm9pZCBzdG9wX3RoaXNfY3B1KHZvaWQgKmR1bW15
KQo+ICAgKi8KPiAgdm9pZCBzbXBfc2VuZF9zdG9wKHZvaWQpCj4gIHsKPiAtICAgIGludCB0aW1l
b3V0ID0gMTA7Cj4gKyAgICB1bnNpZ25lZCBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+
ICAKPiAtICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7Cj4gLSAgICBmaXh1cF9pcnFzKGNwdW1hc2tf
b2Yoc21wX3Byb2Nlc3Nvcl9pZCgpKSwgMCk7Cj4gLSAgICBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4g
LQo+IC0gICAgc21wX2NhbGxfZnVuY3Rpb24oc3RvcF90aGlzX2NwdSwgTlVMTCwgMCk7Cj4gLQo+
IC0gICAgLyogV2FpdCAxMG1zIGZvciBhbGwgb3RoZXIgQ1BVcyB0byBnbyBvZmZsaW5lLiAqLwo+
IC0gICAgd2hpbGUgKCAobnVtX29ubGluZV9jcHVzKCkgPiAxKSAmJiAodGltZW91dC0tID4gMCkg
KQo+IC0gICAgICAgIG1kZWxheSgxKTsKPiAtCj4gLSAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwo+
IC0gICAgZGlzYWJsZV9JT19BUElDKCk7Cj4gLSAgICBocGV0X2Rpc2FibGUoKTsKPiAtICAgIF9f
c3RvcF90aGlzX2NwdSgpOwo+IC0gICAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+ICsgICAgaWYgKCBu
dW1fb25saW5lX2NwdXMoKSA+IDEgKQo+ICsgICAgewo+ICsgICAgICAgIGludCB0aW1lb3V0ID0g
MTA7Cj4gKwo+ICsgICAgICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7Cj4gKyAgICAgICAgZml4dXBf
aXJxcyhjcHVtYXNrX29mKGNwdSksIDApOwo+ICsgICAgICAgIGxvY2FsX2lycV9lbmFibGUoKTsK
PiArCj4gKyAgICAgICAgc21wX2NhbGxfZnVuY3Rpb24oc3RvcF90aGlzX2NwdSwgTlVMTCwgMCk7
Cj4gKwo+ICsgICAgICAgIC8qIFdhaXQgMTBtcyBmb3IgYWxsIG90aGVyIENQVXMgdG8gZ28gb2Zm
bGluZS4gKi8KPiArICAgICAgICB3aGlsZSAoIChudW1fb25saW5lX2NwdXMoKSA+IDEpICYmICh0
aW1lb3V0LS0gPiAwKSApCj4gKyAgICAgICAgICAgIG1kZWxheSgxKTsKPiArICAgIH0KPiArCj4g
KyAgICBpZiAoIGNwdV9vbmxpbmUoY3B1KSApCgpXb24ndCB0aGlzIGJlIGJldHRlciBwbGFjZWQg
aW5zaWRlIHRoZSBwcmV2aW91cyBpZj8gSXMgaXQgdmFsaWQgdG8KaGF2ZSBhIHNpbmdsZSBDUFUg
YW5kIHRyeSB0byBvZmZsaW5lIGl0PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
