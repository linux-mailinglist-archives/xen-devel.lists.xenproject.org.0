Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB18033526
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:40:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpw7-0006EM-A2; Mon, 03 Jun 2019 16:35:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YxrJ=UC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hXpw6-0006EH-Ib
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:35:50 +0000
X-Inumbo-ID: a292ad8e-861d-11e9-aaba-6fcf2cd5a4e7
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a292ad8e-861d-11e9-aaba-6fcf2cd5a4e7;
 Mon, 03 Jun 2019 16:35:45 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: ZHFW0qsLKxbq1h/YnKjlshz5NLAQArvia+W5QHzOjd/joRfBpFoTm0v5tvzCKJjjL+JvalvSGO
 8CN4ht1qnPQYkqBT3zPec4DphdSOEcdCfUnuxoVHEVcRfvf0HnA3OcrVhF8FlS3s2eMKP1DGu1
 HmMB6FQZY22zYGBzCQPVRufh19WN5KClpS0012MY9otDMYanHASg24Qd49dBqqw976O/a0a+HB
 lpcZU9RkaSb/Xe3y1a5mOOYTG1G2303QXVoXd3aOesSsXZdIDs+aF03OFnUJfpayaQ2n1zLuJC
 VYE=
X-SBRS: 2.7
X-MesageID: 1227844
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,547,1549947600"; 
   d="scan'208";a="1227844"
Date: Mon, 3 Jun 2019 18:35:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190603163530.rx7f6mnnb5a6d7qt@Air-de-Roger>
References: <5CEE5C4D02000078002335A0@prv1-mh.provo.novell.com>
 <20190603141254.neovzuf2rdxywhss@Air-de-Roger>
 <5CF53F630200007800234B85@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF53F630200007800234B85@prv1-mh.provo.novell.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDk6NDA6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAzLjA2LjE5IGF0IDE2OjEyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDQ6MTc6NDlBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gSW4gcGFydGljdWxhciB3aXRoIGFuIGVuYWJsZWQgSU9NTVUgKGJ1
dCBub3QgcmVhbGx5IGxpbWl0ZWQgdG8gdGhpcwo+ID4+IGNhc2UpLCB0cnlpbmcgdG8gaW52b2tl
IGZpeHVwX2lycXMoKSBhZnRlciBoYXZpbmcgYWxyZWFkeSBkb25lCj4gPj4gZGlzYWJsZV9JT19B
UElDKCkgLT4gY2xlYXJfSU9fQVBJQygpIGlzIGEgcmF0aGVyIGJhZCBpZGVhOgo+ID4+IAo+ID4+
ICBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDgwMjZhMDM2Pl0gYW1kX2lvbW11X3JlYWRfaW9hcGlj
X2Zyb21faXJlKzB4ZGUvMHgxMTMKPiA+PiAgUkZMQUdTOiAwMDAwMDAwMDAwMDEwMDA2ICAgQ09O
VEVYVDogaHlwZXJ2aXNvciAoZDB2MCkKPiA+PiAgcmF4OiBmZmZmODMyMDI5MWRlMDBjICAgcmJ4
OiAwMDAwMDAwMDAwMDAwMDAzICAgcmN4OiBmZmZmODMyMDM1MDAwMDAwCj4gPj4gIHJkeDogMDAw
MDAwMDAwMDAwMDAwMCAgIHJzaTogMDAwMDAwMDAwMDAwMDAwMCAgIHJkaTogZmZmZjgyZDA4MDVj
YTg0MAo+ID4+ICByYnA6IGZmZmY4MzAwOWU4YTc5YzggICByc3A6IGZmZmY4MzAwOWU4YTc5YTgg
ICByODogIDAwMDAwMDAwMDAwMDAwMDAKPiA+PiAgcjk6ICAwMDAwMDAwMDAwMDAwMDA0ICAgcjEw
OiAwMDAwMDAwMDAwMDhiOWY5ICAgcjExOiAwMDAwMDAwMDAwMDAwMDA2Cj4gPj4gIHIxMjogMDAw
MDAwMDAwMDAxMDAwMCAgIHIxMzogMDAwMDAwMDAwMDAwMDAwMyAgIHIxNDogMDAwMDAwMDAwMDAw
MDAwMAo+ID4+ICByMTU6IDAwMDAwMDAwZmZmZWZmZmYgICBjcjA6IDAwMDAwMDAwODAwNTAwMzMg
ICBjcjQ6IDAwMDAwMDAwMDAzNDA2ZTAKPiA+PiAgY3IzOiAwMDAwMDAyMDM1ZDU5MDAwICAgY3Iy
OiBmZmZmODg4MjRjY2I0ZWUwCj4gPj4gIGZzYjogMDAwMDdmMjE0M2YwODg0MCAgIGdzYjogZmZm
Zjg4ODI1NmEwMDAwMCAgIGdzczogMDAwMDAwMDAwMDAwMDAwMAo+ID4+ICBkczogMDAwMCAgIGVz
OiAwMDAwICAgZnM6IDAwMDAgICBnczogMDAwMCAgIHNzOiBlMDEwICAgY3M6IGUwMDgKPiA+PiAg
WGVuIGNvZGUgYXJvdW5kIDxmZmZmODJkMDgwMjZhMDM2PiAKPiA+IChhbWRfaW9tbXVfcmVhZF9p
b2FwaWNfZnJvbV9pcmUrMHhkZS8weDExMyk6Cj4gPj4gICBmZiAwNyAwMCAwMCAzOSBkMyA3NCAw
MiA8MGY+IDBiIDQxIDgxIGU0IDAwIGY4IGZmIGZmIDhiIDEwIDg5IGQwIDI1IDAwIDAwCj4gPj4g
IFhlbiBzdGFjayB0cmFjZSBmcm9tIHJzcD1mZmZmODMwMDllOGE3OWE4Ogo+ID4+ICAuLi4KPiA+
PiAgWGVuIGNhbGwgdHJhY2U6Cj4gPj4gICAgIFs8ZmZmZjgyZDA4MDI2YTAzNj5dIGFtZF9pb21t
dV9yZWFkX2lvYXBpY19mcm9tX2lyZSsweGRlLzB4MTEzCj4gPj4gICAgIFs8ZmZmZjgyZDA4MDI2
YmY3Yj5dIGlvbW11X3JlYWRfYXBpY19mcm9tX2lyZSsweDEwLzB4MTIKPiA+PiAgICAgWzxmZmZm
ODJkMDgwMjdmNzE4Pl0gaW9fYXBpYy5jI21vZGlmeV9JT19BUElDX2lycSsweDVlLzB4MTI2Cj4g
Pj4gICAgIFs8ZmZmZjgyZDA4MDI3ZjljNT5dIGlvX2FwaWMuYyN1bm1hc2tfSU9fQVBJQ19pcnEr
MHgyZC8weDQxCj4gPj4gICAgIFs8ZmZmZjgyZDA4MDI4OWJjNz5dIGZpeHVwX2lycXMrMHgzMjAv
MHg0MGIKPiA+PiAgICAgWzxmZmZmODJkMDgwMmE4MmM0Pl0gc21wX3NlbmRfc3RvcCsweDRiLzB4
YTgKPiA+PiAgICAgWzxmZmZmODJkMDgwMmE3YjJmPl0gbWFjaGluZV9yZXN0YXJ0KzB4OTgvMHgy
ODgKPiA+PiAgICAgWzxmZmZmODJkMDgwMjUyMjQyPl0gY29uc29sZV9zdXNwZW5kKzAvMHgyOAo+
ID4+ICAgICBbPGZmZmY4MmQwODAyYjAxZGE+XSBkb19nZW5lcmFsX3Byb3RlY3Rpb24rMHgyMDQv
MHgyNGUKPiA+PiAgICAgWzxmZmZmODJkMDgwMzg1YTNkPl0geDg2XzY0L2VudHJ5LlMjaGFuZGxl
X2V4Y2VwdGlvbl9zYXZlZCsweDY4LzB4OTQKPiA+PiAgICAgWzwwMDAwMDAwMGFhNWI1MjZiPl0g
MDAwMDAwMDBhYTViNTI2Ygo+ID4+ICAgICBbPGZmZmY4MmQwODAyYTdjN2Q+XSBtYWNoaW5lX3Jl
c3RhcnQrMHgxZTYvMHgyODgKPiA+PiAgICAgWzxmZmZmODJkMDgwMjQwZjc1Pl0gaHdkb21fc2h1
dGRvd24rMHhhMi8weDExZAo+ID4+ICAgICBbPGZmZmY4MmQwODAyMGJhYTI+XSBkb21haW5fc2h1
dGRvd24rMHg0Zi8weGQ4Cj4gPj4gICAgIFs8ZmZmZjgyZDA4MDIzZmU5OD5dIGRvX3NjaGVkX29w
KzB4MTJmLzB4NDJhCj4gPj4gICAgIFs8ZmZmZjgyZDA4MDM3ZTQwND5dIHB2X2h5cGVyY2FsbCsw
eDFlNC8weDU2NAo+ID4+ICAgICBbPGZmZmY4MmQwODAzODU0MzI+XSBsc3Rhcl9lbnRlcisweDEx
Mi8weDEyMAo+ID4+IAo+ID4+IERvbid0IGNhbGwgZml4dXBfaXJxcygpIGFuZCBkb24ndCBzZW5k
IGFueSBJUEkgaWYgdGhlcmUncyBvbmx5IG9uZQo+ID4+IG9ubGluZSBDUFUgYW55d2F5LCBhbmQg
ZG9uJ3QgY2FsbCBfX3N0b3BfdGhpc19jcHUoKSBhdCBhbGwgd2hlbiB0aGUgQ1BVCj4gPj4gd2Un
cmUgb24gd2FzIGFscmVhZHkgbWFya2VkIG9mZmxpbmUgKGJ5IGEgcHJpb3IgaW52b2NhdGlvbiBv
Zgo+ID4+IF9fc3RvcF90aGlzX2NwdSgpKS4KPiA+PiAKPiA+PiBSZXBvcnRlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPj4gCj4gPj4gLS0tIGEveGVuL2FyY2gv
eDg2L3NtcC5jCj4gPj4gKysrIGIveGVuL2FyY2gveDg2L3NtcC5jCj4gPj4gQEAgLTMwMiwyMyAr
MzAyLDMxIEBAIHN0YXRpYyB2b2lkIHN0b3BfdGhpc19jcHUodm9pZCAqZHVtbXkpCj4gPj4gICAq
Lwo+ID4+ICB2b2lkIHNtcF9zZW5kX3N0b3Aodm9pZCkKPiA+PiAgewo+ID4+IC0gICAgaW50IHRp
bWVvdXQgPSAxMDsKPiA+PiArICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lk
KCk7Cj4gPj4gIAo+ID4+IC0gICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiA+PiAtICAgIGZpeHVw
X2lycXMoY3B1bWFza19vZihzbXBfcHJvY2Vzc29yX2lkKCkpLCAwKTsKPiA+PiAtICAgIGxvY2Fs
X2lycV9lbmFibGUoKTsKPiA+PiAtCj4gPj4gLSAgICBzbXBfY2FsbF9mdW5jdGlvbihzdG9wX3Ro
aXNfY3B1LCBOVUxMLCAwKTsKPiA+PiAtCj4gPj4gLSAgICAvKiBXYWl0IDEwbXMgZm9yIGFsbCBv
dGhlciBDUFVzIHRvIGdvIG9mZmxpbmUuICovCj4gPj4gLSAgICB3aGlsZSAoIChudW1fb25saW5l
X2NwdXMoKSA+IDEpICYmICh0aW1lb3V0LS0gPiAwKSApCj4gPj4gLSAgICAgICAgbWRlbGF5KDEp
Owo+ID4+IC0KPiA+PiAtICAgIGxvY2FsX2lycV9kaXNhYmxlKCk7Cj4gPj4gLSAgICBkaXNhYmxl
X0lPX0FQSUMoKTsKPiA+PiAtICAgIGhwZXRfZGlzYWJsZSgpOwo+ID4+IC0gICAgX19zdG9wX3Ro
aXNfY3B1KCk7Cj4gPj4gLSAgICBsb2NhbF9pcnFfZW5hYmxlKCk7Cj4gPj4gKyAgICBpZiAoIG51
bV9vbmxpbmVfY3B1cygpID4gMSApCj4gPj4gKyAgICB7Cj4gPj4gKyAgICAgICAgaW50IHRpbWVv
dXQgPSAxMDsKPiA+PiArCj4gPj4gKyAgICAgICAgbG9jYWxfaXJxX2Rpc2FibGUoKTsKPiA+PiAr
ICAgICAgICBmaXh1cF9pcnFzKGNwdW1hc2tfb2YoY3B1KSwgMCk7Cj4gPj4gKyAgICAgICAgbG9j
YWxfaXJxX2VuYWJsZSgpOwo+ID4+ICsKPiA+PiArICAgICAgICBzbXBfY2FsbF9mdW5jdGlvbihz
dG9wX3RoaXNfY3B1LCBOVUxMLCAwKTsKPiA+PiArCj4gPj4gKyAgICAgICAgLyogV2FpdCAxMG1z
IGZvciBhbGwgb3RoZXIgQ1BVcyB0byBnbyBvZmZsaW5lLiAqLwo+ID4+ICsgICAgICAgIHdoaWxl
ICggKG51bV9vbmxpbmVfY3B1cygpID4gMSkgJiYgKHRpbWVvdXQtLSA+IDApICkKPiA+PiArICAg
ICAgICAgICAgbWRlbGF5KDEpOwo+ID4+ICsgICAgfQo+ID4+ICsKPiA+PiArICAgIGlmICggY3B1
X29ubGluZShjcHUpICkKPiA+IAo+ID4gV29uJ3QgdGhpcyBiZSBiZXR0ZXIgcGxhY2VkIGluc2lk
ZSB0aGUgcHJldmlvdXMgaWY/IElzIGl0IHZhbGlkIHRvCj4gPiBoYXZlIGEgc2luZ2xlIENQVSBh
bmQgdHJ5IHRvIG9mZmxpbmUgaXQ/Cj4gCj4gTm8gdG8gdGhlIGZpcnN0IHF1ZXN0aW9uLCBhbmQg
SSdtIG5vdCBzdXJlIEkgc2VlIGhvdyB5b3UgY2FtZSB0bwo+IHRoZSAybmQgb25lLiBJZiB0aGVy
ZSdzIGp1c3QgYSBzaW5nbGUgb25saW5lIENQVSwgdGhlbiB0aGVyZSdzIG5vCj4gbmVlZCB0byBm
aXh1cF9pcnFzKCksIGFuZCB0aGVyZSdzIG5vLW9uZSB0byBJUEkuIFlldCB0aGUgbG9jYWwgQ1BV
Cj4gc3RpbGwgbmVlZHMgdG8gZG8gZXZlcnl0aGluZyB0aGF0IHNob3VsZCBoYXBwZW4gb25jZSBp
biBVUCBtb2RlLAo+IHVubGVzcyB0aGlzIENQVSBoYXMgYmVlbiBvZmZsaW5lZCBhbHJlYWR5IGJl
Zm9yZSAoYXMgd2FzIHRoZQo+IGNhc2UgaW4gQW5kcmV3J3MgcmVwb3J0LCBhdCBsZWFzdCBhcyBm
YXIgYXMgSSB3YXMgYWJsZSB0byBkZWR1Y2UpLgoKU29ycnksIEkgZ290IGNvbmZ1c2VkLiBBRkFJ
Q1QgdGhlIGxvZ2ljIGlzIGNvcnJlY3Q6CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
