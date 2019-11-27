Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C28A10ACC1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:42:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZto3-00011g-V7; Wed, 27 Nov 2019 09:40:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZto3-00011Z-Cy
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:40:19 +0000
X-Inumbo-ID: ec00fe00-10f9-11ea-a55d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec00fe00-10f9-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574847618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qWoJu6UpPYVfJ7kBAaDrna3p2r/wL3Ge5mjn0AdvA2Y=;
 b=SPl3ZBT8V4O5/octWAeKqK5MtS7SSGaTEfBVKvgLtNZ4Wi8PqG/FMKSA
 Z2wyNf5ZDtI8hKBXVSut4hd0eAbIikd8e7j+2I5L6v/rlH6blAF+16lCX
 rJMKmP02NDRvs4nlb5hg0nz0yga5WlsPSZ1bxjKyxqhgjl1uuLq1LloFp k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vINnbmwRcEuoz0N3DrDpyVJOmvW3K+siMy9zt48U0L0B1rCm+vXfs57ysWmNZEmYAqRhEKDHLD
 ZtdYAnpJsVC7Ma4cNYQeW+OCF009PIBCkw8g+8n1w1b3OyCPsCjth9kRu8hdKb4q0Xp7Bfr17z
 yuQ9XcQJyxl4pMTwRZIp4rSytLb49Ik/gMPMChSzaZ6WC8CGYffswNx6WUDnW0HdsN0Jydye6S
 BulEoXwPJg3trlTKRAvFBHnC9hVq2K/tNncwZv2fVgh0t4Tw7uaTOQPLiZ/gc6mTynSI1ogbul
 WPU=
X-SBRS: 2.7
X-MesageID: 9021124
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="9021124"
Date: Wed, 27 Nov 2019 10:40:11 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191127094011.GM980@Air-de-Roger>
References: <20191126150112.12704-1-andrew.cooper3@citrix.com>
 <20191126150112.12704-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126150112.12704-3-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/2] AMD/IOMMU: Render IO_PAGE_FAULT errors
 in a more useful manner
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMDM6MDE6MTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBQcmludCB0aGUgUENJIGNvb3JkaW5hdGVzIGluIGl0cyBjb21tb24gZm9ybWF0IGFu
ZCB1c2UgZCV1IG5vdGF0aW9uIGZvciB0aGUKPiBkb21haW4uICBBcyB3ZWxsIGFzIHByaW50aW5n
IGZsYWdzLCBkZWNvZGUgdGhlbS4gIElPX1BBR0VfRkFVTFQgaXMgdXNlZCBmb3IKPiBpbnRlcnJ1
cHQgcmVtYXBwaW5nIGVycm9ycyBhcyB3ZWxsIGFzIERNQSByZW1hcHBpbmcgZXJyb3JzLgo+IAo+
IEJlZm9yZToKPiAgIChYRU4pIEFNRC1WaTogSU9fUEFHRV9GQVVMVDogZG9tYWluID0gMCwgZGV2
aWNlIGlkID0gMHhhMSwgZmF1bHQgYWRkcmVzcyA9IDB4YmY2OTUwMDAsIGZsYWdzID0gMHgxMAo+
ICAgKFhFTikgQU1ELVZpOiBJT19QQUdFX0ZBVUxUOiBkb21haW4gPSAwLCBkZXZpY2UgaWQgPSAw
eGExLCBmYXVsdCBhZGRyZXNzID0gMHhiZjY5NTA0MCwgZmxhZ3MgPSAweDEwCj4gICAoWEVOKSBB
TUQtVmk6IElPX1BBR0VfRkFVTFQ6IGRvbWFpbiA9IDAsIGRldmljZSBpZCA9IDB4YTEsIGZhdWx0
IGFkZHJlc3MgPSAweGZmZmZmZmYwLCBmbGFncyA9IDB4MzAKPiAgIChYRU4pIEFNRC1WaTogSU9f
UEFHRV9GQVVMVDogZG9tYWluID0gMCwgZGV2aWNlIGlkID0gMHhhMSwgZmF1bHQgYWRkcmVzcyA9
IDB4MTAwMDAwMDAwLCBmbGFncyA9IDB4MzAKPiAgIChYRU4pIEFNRC1WaTogSU9fUEFHRV9GQVVM
VDogZG9tYWluID0gMCwgZGV2aWNlIGlkID0gMHhhMSwgZmF1bHQgYWRkcmVzcyA9IDB4MTAwMDAw
MDQwLCBmbGFncyA9IDB4MzAKPiAKPiBBZnRlcjoKPiAgIChYRU4pIEFNRC1WaTogSU9fUEFHRV9G
QVVMVDogMDAwMDowMDoxNC4xIGQwIGFkZHIgMDAwMDAwMDBiZjVmYzAwMCBmbGFncyAweDEwIFBS
Cj4gICAoWEVOKSBBTUQtVmk6IElPX1BBR0VfRkFVTFQ6IDAwMDA6MDA6MTQuMSBkMCBhZGRyIDAw
MDAwMDAwYmY1ZmMwNDAgZmxhZ3MgMHgxMCBQUgo+ICAgKFhFTikgQU1ELVZpOiBJT19QQUdFX0ZB
VUxUOiAwMDAwOjAwOjE0LjEgZDAgYWRkciAwMDAwMDAwMGZmZmZmZmYwIGZsYWdzIDB4MzAgUlcg
UFIKPiAgIChYRU4pIEFNRC1WaTogSU9fUEFHRV9GQVVMVDogMDAwMDowMDoxNC4xIGQwIGFkZHIg
MDAwMDAwMDEwMDAwMDAwMCBmbGFncyAweDMwIFJXIFBSCj4gICAoWEVOKSBBTUQtVmk6IElPX1BB
R0VfRkFVTFQ6IDAwMDA6MDA6MTQuMSBkMCBhZGRyIDAwMDAwMDAxMDAwMDAwNDAgZmxhZ3MgMHgz
MCBSVyBQUgoKTml0OiBJIHdvdWxkIHBsYWNlIHRoZSBkb21haW4gaWQgaW5mb3JtYXRpb24gYXQg
dGhlIGJlZ2lubmluZyAoc2luY2UKdGhhdCdzIG1vcmUgc2ltaWxhciB0byBncHJpbnRrIGZvcm1h
dCksIGFuZCBtYXliZSBkcm9wIHRoZSBBTUQtVmkKcHJlZml4LCBpdCdzIG5vdCB2ZXJ5IHVzZWZ1
bCBJTU86CgooWEVOKSBkMCBJT19QQUdFX0ZBVUxUIDAwMDA6MDA6MTQuMSBhZGRyIDAwMDAwMDAx
MDAwMDAwNDAgZmxhZ3MgMHgzMCBSVyBQUgoKQnV0IEknbSBub3Qgc3BlY2lhbGx5IGNvbmNlcm5l
ZC4KCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkluIGl0J3MgY3VycmVudCBmb3JtIG9y
IHdpdGggc29tZSBvZiB0aGUgc3VnZ2VzdGlvbnMsIGluIGFueSBjYXNlIGl0J3MKY2VydGFpbmx5
IGFuIGltcHJvdmVtZW50LgoKPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2Uu
Y29tPgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgICAgICB8IDM1ICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vYW1kLWlvbW11
LXByb3RvLmggfCAgMyAtLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAx
OCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL2lvbW11X2luaXQuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0
LmMKPiBpbmRleCA4YWE4Nzg4Nzk3Li5jZDRlNmUxNmI4IDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCj4gQEAgLTUxMywxMCArNTEzLDcgQEAgc3RhdGljIGh3
X2lycV9jb250cm9sbGVyIGlvbW11X3gyYXBpY190eXBlID0gewo+ICAKPiAgc3RhdGljIHZvaWQg
cGFyc2VfZXZlbnRfbG9nX2VudHJ5KHN0cnVjdCBhbWRfaW9tbXUgKmlvbW11LCB1MzIgZW50cnlb
XSkKPiAgewo+IC0gICAgdTE2IGRvbWFpbl9pZCwgZGV2aWNlX2lkLCBmbGFnczsKPiAtICAgIHVu
c2lnbmVkIGludCBiZGY7Cj4gICAgICB1MzIgY29kZTsKPiAtICAgIHU2NCAqYWRkcjsKPiAgICAg
IGludCBjb3VudCA9IDA7Cj4gICAgICBzdGF0aWMgY29uc3QgY2hhciAqY29uc3QgZXZlbnRfc3Ry
W10gPSB7Cj4gICNkZWZpbmUgRVZFTlRfU1RSKG5hbWUpIFtJT01NVV9FVkVOVF8jI25hbWUgLSAx
XSA9ICNuYW1lCj4gQEAgLTU2MCwxOCArNTU3LDI2IEBAIHN0YXRpYyB2b2lkIHBhcnNlX2V2ZW50
X2xvZ19lbnRyeShzdHJ1Y3QgYW1kX2lvbW11ICppb21tdSwgdTMyIGVudHJ5W10pCj4gIAo+ICAg
ICAgaWYgKCBjb2RlID09IElPTU1VX0VWRU5UX0lPX1BBR0VfRkFVTFQgKQo+ICAgICAgewo+IC0g
ICAgICAgIGRldmljZV9pZCA9IGlvbW11X2dldF9kZXZpZF9mcm9tX2V2ZW50KGVudHJ5WzBdKTsK
PiAtICAgICAgICBkb21haW5faWQgPSBnZXRfZmllbGRfZnJvbV9yZWdfdTMyKGVudHJ5WzFdLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfRVZFTlRf
RE9NQUlOX0lEX01BU0ssCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBJT01NVV9FVkVOVF9ET01BSU5fSURfU0hJRlQpOwo+IC0gICAgICAgIGZsYWdzID0gZ2V0
X2ZpZWxkX2Zyb21fcmVnX3UzMihlbnRyeVsxXSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgSU9NTVVfRVZFTlRfRkxBR1NfTUFTSywKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfRVZFTlRfRkxBR1NfU0hJRlQpOwo+IC0gICAg
ICAgIGFkZHI9ICh1NjQqKSAoZW50cnkgKyAyKTsKPiAtICAgICAgICBwcmludGsoWEVOTE9HX0VS
UiAiQU1ELVZpOiAiCj4gLSAgICAgICAgICAgICAgICIlczogZG9tYWluID0gJWQsIGRldmljZSBp
ZCA9ICUjeCwgIgo+IC0gICAgICAgICAgICAgICAiZmF1bHQgYWRkcmVzcyA9ICUjIlBSSXg2NCIs
IGZsYWdzID0gJSN4XG4iLAo+IC0gICAgICAgICAgICAgICBjb2RlX3N0ciwgZG9tYWluX2lkLCBk
ZXZpY2VfaWQsICphZGRyLCBmbGFncyk7Cj4gKyAgICAgICAgdW5zaWduZWQgaW50IGJkZjsKPiAr
ICAgICAgICB1aW50MTZfdCBkZXZpY2VfaWQgPSBNQVNLX0VYVFIoZW50cnlbMF0sIElPTU1VX0NN
RF9ERVZJQ0VfSURfTUFTSyk7Cj4gKyAgICAgICAgdWludDE2X3QgZG9tYWluX2lkID0gTUFTS19F
WFRSKGVudHJ5WzFdLCBJT01NVV9FVkVOVF9ET01BSU5fSURfTUFTSyk7Cj4gKyAgICAgICAgdWlu
dDE2X3QgZmxhZ3MgPSBNQVNLX0VYVFIoZW50cnlbMV0sIElPTU1VX0VWRU5UX0ZMQUdTX01BU0sp
OwoKSSB3b3VsZG4ndCBtaW5kIHVzaW5nIHVzaW5nIHVuc2lnbmVkIGludCBmb3IgdGhlIHZhcmlh
YmxlcyBhYm92ZS4KCj4gKyAgICAgICAgdWludDY0X3QgYWRkciA9ICoodWludDY0X3QgKikoZW50
cnkgKyAyKTsKPiArCj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIkFNRC1WaTogJXM6ICUw
NHg6JTAyeDolMDJ4LiV1IGQlZCBhZGRyICUwMTYiUFJJeDY0Cj4gKyAgICAgICAgICAgICAgICIg
ZmxhZ3MgJSN4JXMlcyVzJXMlcyVzJXMlcyVzJXNcbiIsCj4gKyAgICAgICAgICAgICAgIGNvZGVf
c3RyLCBpb21tdS0+c2VnLCBQQ0lfQlVTKGRldmljZV9pZCksIFBDSV9TTE9UKGRldmljZV9pZCks
Cj4gKyAgICAgICAgICAgICAgIFBDSV9GVU5DKGRldmljZV9pZCksIGRvbWFpbl9pZCwgYWRkciwg
ZmxhZ3MsCj4gKyAgICAgICAgICAgICAgIChmbGFncyAmIDB4ZTAwKSA/ICIgPz8iIDogIiIsCj4g
KyAgICAgICAgICAgICAgIChmbGFncyAmIDB4MTAwKSA/ICIgVFIiIDogIiIsCj4gKyAgICAgICAg
ICAgICAgIChmbGFncyAmIDB4MDgwKSA/ICIgUloiIDogIiIsCj4gKyAgICAgICAgICAgICAgIChm
bGFncyAmIDB4MDQwKSA/ICIgUEUiIDogIiIsCj4gKyAgICAgICAgICAgICAgIChmbGFncyAmIDB4
MDIwKSA/ICIgUlciIDogIiIsCj4gKyAgICAgICAgICAgICAgIChmbGFncyAmIDB4MDEwKSA/ICIg
UFIiIDogIiIsCj4gKyAgICAgICAgICAgICAgIChmbGFncyAmIDB4MDA4KSA/ICIgSSIgOiAiIiwK
PiArICAgICAgICAgICAgICAgKGZsYWdzICYgMHgwMDQpID8gIiBVUyIgOiAiIiwKPiArICAgICAg
ICAgICAgICAgKGZsYWdzICYgMHgwMDIpID8gIiBOWCIgOiAiIiwKPiArICAgICAgICAgICAgICAg
KGZsYWdzICYgMHgwMDEpID8gIiBHTiIgOiAiIik7CgpJIHdvbGQgcmF0aGVyIGhhdmUgdGhvc2Ug
YWRkZWQgd2l0aCBwcm9wZXIgZGVmaW5lZCBuYW1lcyB0bwphbWQtaW9tbXUtZGVmcy5oLgoKVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
