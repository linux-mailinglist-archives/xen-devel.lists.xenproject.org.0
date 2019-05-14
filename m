Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F3D1CC8D
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 18:11:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQZzL-0000nx-91; Tue, 14 May 2019 16:09:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=riyJ=TO=amazon.de=prvs=030cd7570=sironi@srs-us1.protection.inumbo.net>)
 id 1hQZzJ-0000ns-EP
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 16:09:09 +0000
X-Inumbo-ID: 995f0b88-7662-11e9-821a-d760ff980d15
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 995f0b88-7662-11e9-821a-d760ff980d15;
 Tue, 14 May 2019 16:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1557850146; x=1589386146;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=plFXiYh0xL6L4GZRf8G+HDY7MbdFYndRHWvRX7zth/w=;
 b=ZBiTgtcSutWm4WZq0zTbkOwSaN4geL/hEhvYq6dspPnOV3Xc/OtTP8Oj
 pFGvBuO2BJ6SPY4u4cIWAKOr+ydJuZfbuFBx3bUhEVWdRunzA8bXLvCiX
 3GwbkHQEC2Qh+K4cmXU4H9fKZ0P0INV+8/jl+cODcWyAq0HgK89v2VDU4 s=;
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="402102493"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 May 2019 16:09:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4EG8wr5099411
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 14 May 2019 16:09:03 GMT
Received: from EX13D02EUC004.ant.amazon.com (10.43.164.117) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 May 2019 16:09:03 +0000
Received: from EX13D02EUC001.ant.amazon.com (10.43.164.92) by
 EX13D02EUC004.ant.amazon.com (10.43.164.117) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 14 May 2019 16:09:02 +0000
Received: from EX13D02EUC001.ant.amazon.com ([10.43.164.92]) by
 EX13D02EUC001.ant.amazon.com ([10.43.164.92]) with mapi id 15.00.1367.000;
 Tue, 14 May 2019 16:09:02 +0000
From: "Sironi, Filippo" <sironi@amazon.de>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Thread-Topic: [PATCH v2 1/2] KVM: Start populating /sys/hypervisor with KVM
 entries
Thread-Index: AQHVCmguTMwTmVyYP0+tMrT8Z/dQMaZqvgUAgAAL5IA=
Date: Tue, 14 May 2019 16:09:01 +0000
Message-ID: <56DAB9BD-2543-49DA-9886-C9C8F2B814F9@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-2-git-send-email-sironi@amazon.de>
 <d03f6be5-d8dc-4389-e14c-295f36a68827@de.ibm.com>
In-Reply-To: <d03f6be5-d8dc-4389-e14c-295f36a68827@de.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.163]
Content-ID: <CCC5E4FD52492B49A46973EAD664A3EF@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/2] KVM: Start populating
 /sys/hypervisor with KVM entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: KVM list <kvm@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "vasu.srinivasan@oracle.com" <vasu.srinivasan@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE0LiBNYXkgMjAxOSwgYXQgMTc6MjYsIENocmlzdGlhbiBCb3JudHJhZWdlciA8Ym9y
bnRyYWVnZXJAZGUuaWJtLmNvbT4gd3JvdGU6Cj4gCj4gCj4gCj4gT24gMTQuMDUuMTkgMTc6MTYs
IEZpbGlwcG8gU2lyb25pIHdyb3RlOgo+PiBTdGFydCBwb3B1bGF0aW5nIC9zeXMvaHlwZXJ2aXNv
ciB3aXRoIEtWTSBlbnRyaWVzIHdoZW4gd2UncmUgcnVubmluZyBvbgo+PiBLVk0uIFRoaXMgaXMg
dG8gcmVwbGljYXRlIGZ1bmN0aW9uYWxpdHkgdGhhdCdzIGF2YWlsYWJsZSB3aGVuIHdlJ3JlCj4+
IHJ1bm5pbmcgb24gWGVuLgo+PiAKPj4gU3RhcnQgd2l0aCAvc3lzL2h5cGVydmlzb3IvdXVpZCwg
d2hpY2ggdXNlcnMgcHJlZmVyIG92ZXIKPj4gL3N5cy9kZXZpY2VzL3ZpcnR1YWwvZG1pL2lkL3By
b2R1Y3RfdXVpZCBhcyBhIHdheSB0byByZWNvZ25pemUgYSB2aXJ0dWFsCj4+IG1hY2hpbmUsIHNp
bmNlIGl0J3MgYWxzbyBhdmFpbGFibGUgd2hlbiBydW5uaW5nIG9uIFhlbiBIVk0gYW5kIG9uIFhl
biBQVgo+PiBhbmQsIG9uIHRvcCBvZiB0aGF0IGRvZXNuJ3QgcmVxdWlyZSByb290IHByaXZpbGVn
ZXMgYnkgZGVmYXVsdC4KPj4gTGV0J3MgY3JlYXRlIGFyY2gtc3BlY2lmaWMgaG9va3Mgc28gdGhh
dCBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlcyBjYW4KPj4gcHJvdmlkZSBkaWZmZXJlbnQgaW1wbGVt
ZW50YXRpb25zLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBTaXJvbmkgPHNpcm9uaUBh
bWF6b24uZGU+Cj4+IC0tLQo+PiB2MjoKPj4gKiBtb3ZlIHRoZSByZXRyaWV2YWwgb2YgdGhlIFZN
IFVVSUQgb3V0IG9mIHV1aWRfc2hvdyBhbmQgaW50bwo+PiAga3ZtX3BhcmFfZ2V0X3V1aWQsIHdo
aWNoIGlzIGEgd2VhayBmdW5jdGlvbiB0aGF0IGNhbiBiZSBvdmVyd3JpdHRlbgo+PiAKPj4gZHJp
dmVycy9LY29uZmlnICAgICAgICAgICAgICB8ICAyICsrCj4+IGRyaXZlcnMvTWFrZWZpbGUgICAg
ICAgICAgICAgfCAgMiArKwo+PiBkcml2ZXJzL2t2bS9LY29uZmlnICAgICAgICAgIHwgMTQgKysr
KysrKysrKysrKysKPj4gZHJpdmVycy9rdm0vTWFrZWZpbGUgICAgICAgICB8ICAxICsKPj4gZHJp
dmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+PiA1IGZpbGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykKPj4gY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMva3ZtL0tjb25maWcKPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
a3ZtL01ha2VmaWxlCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2t2bS9zeXMtaHlwZXJ2
aXNvci5jCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9LY29uZmlnIGIvZHJpdmVycy9LY29u
ZmlnCj4+IGluZGV4IDQ1ZjlkZWNiOTg0OC4uOTBlYjgzNWZlOTUxIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9LY29uZmlnCj4+IEBAIC0xNDYsNiArMTQ2
LDggQEAgc291cmNlICJkcml2ZXJzL2h2L0tjb25maWciCj4+IAo+PiBzb3VyY2UgImRyaXZlcnMv
eGVuL0tjb25maWciCj4+IAo+PiArc291cmNlICJkcml2ZXJzL2t2bS9LY29uZmlnIgo+PiArCj4+
IHNvdXJjZSAiZHJpdmVycy9zdGFnaW5nL0tjb25maWciCj4+IAo+PiBzb3VyY2UgImRyaXZlcnMv
cGxhdGZvcm0vS2NvbmZpZyIKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvTWFrZWZpbGUgYi9kcml2
ZXJzL01ha2VmaWxlCj4+IGluZGV4IGM2MWNkZTU1NDM0MC4uNzljYzkyYTNmNmJmIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvTWFrZWZpbGUKPj4gQEAg
LTQ0LDYgKzQ0LDggQEAgb2JqLXkJCQkJKz0gc29jLwo+PiBvYmotJChDT05GSUdfVklSVElPKQkJ
Kz0gdmlydGlvLwo+PiBvYmotJChDT05GSUdfWEVOKQkJKz0geGVuLwo+PiAKPj4gK29iai0kKENP
TkZJR19LVk1fR1VFU1QpCQkrPSBrdm0vCj4+ICsKPj4gIyByZWd1bGF0b3JzIGVhcmx5LCBzaW5j
ZSBzb21lIHN1YnN5c3RlbXMgcmVseSBvbiB0aGVtIHRvIGluaXRpYWxpemUKPj4gb2JqLSQoQ09O
RklHX1JFR1VMQVRPUikJCSs9IHJlZ3VsYXRvci8KPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2t2bS9LY29uZmlnIGIvZHJpdmVycy9rdm0vS2NvbmZpZwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjNmYzA0MWRmN2MxMQo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL2RyaXZlcnMva3ZtL0tjb25maWcKPj4gQEAgLTAsMCArMSwxNCBAQAo+PiArbWVudSAi
S1ZNIGRyaXZlciBzdXBwb3J0Igo+PiArICAgICAgICBkZXBlbmRzIG9uIEtWTV9HVUVTVAo+PiAr
Cj4+ICtjb25maWcgS1ZNX1NZU19IWVBFUlZJU09SCj4+ICsgICAgICAgIGJvb2wgIkNyZWF0ZSBL
Vk0gZW50cmllcyB1bmRlciAvc3lzL2h5cGVydmlzb3IiCj4+ICsgICAgICAgIGRlcGVuZHMgb24g
U1lTRlMKPj4gKyAgICAgICAgc2VsZWN0IFNZU19IWVBFUlZJU09SCj4+ICsgICAgICAgIGRlZmF1
bHQgeQo+PiArICAgICAgICBoZWxwCj4+ICsgICAgICAgICAgQ3JlYXRlIEtWTSBlbnRyaWVzIHVu
ZGVyIC9zeXMvaHlwZXJ2aXNvciAoZS5nLiwgdXVpZCkuIFdoZW4gcnVubmluZwo+PiArICAgICAg
ICAgIG5hdGl2ZSBvciBvbiBhbm90aGVyIGh5cGVydmlzb3IsIC9zeXMvaHlwZXJ2aXNvciBtYXkg
c3RpbGwgYmUKPj4gKyAgICAgICAgICBwcmVzZW50LCBidXQgaXQgd2lsbCBoYXZlIG5vIEtWTSBl
bnRyaWVzLgo+PiArCj4+ICtlbmRtZW51Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2t2bS9NYWtl
ZmlsZSBiL2RyaXZlcnMva3ZtL01ha2VmaWxlCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uNzNhNDNmYzk5NGI5Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
ZHJpdmVycy9rdm0vTWFrZWZpbGUKPj4gQEAgLTAsMCArMSBAQAo+PiArb2JqLSQoQ09ORklHX0tW
TV9TWVNfSFlQRVJWSVNPUikgKz0gc3lzLWh5cGVydmlzb3Iubwo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYyBiL2RyaXZlcnMva3ZtL3N5cy1oeXBlcnZpc29yLmMK
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi40M2IxZDFhMDk4
MDcKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL2t2bS9zeXMtaHlwZXJ2aXNvci5j
Cj4+IEBAIC0wLDAgKzEsMzAgQEAKPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wICovCj4+ICsKPj4gKyNpbmNsdWRlIDxhc20va3ZtX3BhcmEuaD4KPj4gKwo+PiArI2luY2x1
ZGUgPGxpbnV4L2tvYmplY3QuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9zeXNmcy5oPgo+PiArCj4+
ICtfX3dlYWsgY29uc3QgY2hhciAqa3ZtX3BhcmFfZ2V0X3V1aWQodm9pZCkKPj4gK3sKPj4gKwly
ZXR1cm4gTlVMTDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHNzaXplX3QgdXVpZF9zaG93KHN0cnVj
dCBrb2JqZWN0ICpvYmosCj4+ICsJCQkgc3RydWN0IGtvYmpfYXR0cmlidXRlICphdHRyLAo+PiAr
CQkJIGNoYXIgKmJ1ZikKPj4gK3sKPj4gKwljb25zdCBjaGFyICp1dWlkID0ga3ZtX3BhcmFfZ2V0
X3V1aWQoKTsKPiAKPiBJIHdvdWxkIHByZWZlciB0byBoYXZlIGt2bV9wYXJhX2dldF91dWlkIHJl
dHVybiBhIHV1aWRfdAo+IGJ1dCBjaGFyICogd2lsbCBwcm9iYWJseSB3b3JrIG91dCBhcyB3ZWxs
LgoKTGV0IG1lIGdpdmUgdGhpcyBhIHF1aWNrIHNwaW4uCgo+PiArCXJldHVybiBzcHJpbnRmKGJ1
ZiwgIiVzXG4iLCB1dWlkKTsKPj4gK30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCBrb2JqX2F0dHJp
YnV0ZSB1dWlkID0gX19BVFRSX1JPKHV1aWQpOwo+PiArCj4+ICtzdGF0aWMgaW50IF9faW5pdCB1
dWlkX2luaXQodm9pZCkKPj4gK3sKPj4gKwlpZiAoIWt2bV9wYXJhX2F2YWlsYWJsZSgpKQo+IAo+
IElzbnQga3ZtX3BhcmFfYXZhaWxhYmxlIGEgZnVuY3Rpb24gdGhhdCBpcyBkZWZpbmVkIGluIHRo
ZSBjb250ZXh0IG9mIHRoZSBIT1NUCj4gYW5kIG5vdCBvZiB0aGUgZ3Vlc3Q/CgpObywga3ZtX3Bh
cmFfYXZhaWxhYmxlIGlzIGRlZmluZWQgaW4gdGhlIGd1ZXN0IGNvbnRleHQuCk9uIHg4NiwgaXQg
Y2hlY2tzIGZvciB0aGUgcHJlc2VuY2Ugb2YgdGhlIEtWTSBDUFVJRCBsZWFmcy4KCj4+ICsJCXJl
dHVybiAwOwo+PiArCXJldHVybiBzeXNmc19jcmVhdGVfZmlsZShoeXBlcnZpc29yX2tvYmosICZ1
dWlkLmF0dHIpOwo+PiArfQo+PiArCj4+ICtkZXZpY2VfaW5pdGNhbGwodXVpZF9pbml0KTsKCgoK
CkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEw
MTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBI
ZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0
IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
