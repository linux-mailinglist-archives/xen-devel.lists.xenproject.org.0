Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64264B8393
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 23:42:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB48g-0003CS-Ku; Thu, 19 Sep 2019 21:38:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GLrY=XO=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iB48f-0003CN-1N
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 21:38:57 +0000
X-Inumbo-ID: e14a04ca-db25-11e9-b299-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e14a04ca-db25-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 21:38:55 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8JLclFx067496;
 Thu, 19 Sep 2019 21:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=k0XfivaFR9EsR1TetIlFgwefu0O8RmbBIKuUEGG679s=;
 b=DhD8vfDhpfi5Zkbww243kIGw52d1RWTPEVeVWZ3R27u+bU8v4J6BTBD8EOj01cF3pR5d
 g0CODPzrZP9Ks/VspS0seK7agvcuveG16I4RLNpy1XWZ2YcYQMGrLdZ3VyXyOZRapNSy
 4EDpyj2KR2lxorlDaV+Mz64I0OjH2j26Ej/5R4AZ4EIJTjdUxHkOibCSHnA0fN3t4zII
 c2k7zF+OLmA57I0Eq8Mp8IhPRtyZ6C+GbgGU+I6C882bHZ4j1ECbxLBc1vYCeUD2PcK6
 xARPtpcIeodODUa0ppHRvnvaBW5dRyBO+/1dpYP8DVSWzWq/qgHLVNeCRCWqR7CvnODf bQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2v3vb4xqps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 21:38:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8JLcY6n195321;
 Thu, 19 Sep 2019 21:38:54 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2v3vb6pydv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Sep 2019 21:38:54 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8JLcrht017826;
 Thu, 19 Sep 2019 21:38:53 GMT
Received: from [10.211.47.34] (/10.211.47.34)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Sep 2019 14:38:52 -0700
To: Jan Beulich <jbeulich@suse.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
 <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
 <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
 <e75f5253-df1d-2d47-6724-df06d1a33448@suse.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <8571e4db-d3dc-6a58-8711-2947c97f8953@oracle.com>
Date: Thu, 19 Sep 2019 14:38:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e75f5253-df1d-2d47-6724-df06d1a33448@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9385
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909190179
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9385
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909190179
Subject: Re: [Xen-devel] [PATCH RFC] pass-through: sync pir to irr after
 msix vector been updated
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
Cc: xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8xOS8xOSAzOjI0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOC4wOS4yMDE5IDIz
OjE2LCBKb2UgSmluIHdyb3RlOgo+PiBPbiA5LzE2LzE5IDExOjQ4IFBNLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+IE9uIDE3LjA5LjIwMTkgMDA6MjAsIEpvZSBKaW4gd3JvdGU6Cj4+Pj4gT24gOS8x
Ni8xOSAxOjAxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTMuMDkuMjAxOSAxODoz
OCwgSm9lIEppbiB3cm90ZToKPj4+Pj4+IE9uIDkvMTMvMTkgMTI6MTQgQU0sIEphbiBCZXVsaWNo
IHdyb3RlOgo+Pj4+Pj4+IE9uIDEyLjA5LjIwMTkgMjA6MDMsIEpvZSBKaW4gd3JvdGU6Cj4+Pj4+
Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKPj4+Pj4+Pj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwo+Pj4+Pj4+PiBAQCAtNDEyLDYgKzQxMiw5IEBAIGlu
dCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgcGlycV9kcGNp
LT5nbXNpLmd2ZWMgPSBwdF9pcnFfYmluZC0+dS5tc2kuZ3ZlYzsKPj4+Pj4+Pj4gICAgICAgICAg
ICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ2ZsYWdzID0gZ2ZsYWdzOwo+Pj4+Pj4+PiAgICAgICAg
ICAgICAgfQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsgICAgICAgICAgICBpZiAoIGh2bV9mdW5jcy5z
eW5jX3Bpcl90b19pcnIgKQo+Pj4+Pj4+PiArICAgICAgICAgICAgICAgIGh2bV9mdW5jcy5zeW5j
X3Bpcl90b19pcnIoZC0+dmNwdVtwaXJxX2RwY2ktPmdtc2kuZGVzdF92Y3B1X2lkXSk7Cj4+Pj4+
Pj4KPj4+Pj4+PiBJZiB0aGUgbmVlZCBmb3IgdGhpcyBjaGFuZ2UgY2FuIGJlIHByb3Blcmx5IGV4
cGxhaW5lZCwgdGhlbiBpdAo+Pj4+Pj4+IHN0aWxsIHdhbnRzIGNvbnZlcnRpbmcgdG8gYWx0ZXJu
YXRpdmVfdmNhbGwoKSAtIHRoZSB0aGUgb3RoZXIKPj4+Pj4+PiBjYWxsZXIgb2YgdGhpcyBob29r
LiBPciBwZXJoYXBzIGV2ZW4gYmV0dGVyIG1vdmUgdmxhcGljLmMncwo+Pj4+Pj4+IHdyYXBwZXIg
KHN1aXRhYmx5IHJlbmFtZWQpIGludG8gaHZtLmgsIGFuZCB1c2UgaXQgaGVyZS4KPj4+Pj4+Cj4+
Pj4+PiBZZXMgSSBhZ3JlZSwgSSdtIG5vdCAxMDAlIHN1cmUsIHNvIEkgc2V0IGl0IHRvIFJGQy4K
Pj4+Pj4KPj4+Pj4gQW5kIGJ0dywgcGxlYXNlIGFsc28gYXR0YWNoIGEgYnJpZWYgY29tbWVudCBo
ZXJlLCB0byBjbGFyaWZ5Cj4+Pj4+IHdoeSB0aGUgc3luY2luZyBpcyBuZWVkZWQgcHJlY2lzZWx5
IGF0IHRoaXMgcG9pbnQuCj4+Pj4+Cj4+Pj4+Pj4gQWRkaXRpb25hbGx5LCB0aGUgY29kZSBzZXR0
aW5nIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQKPj4+Pj4+PiAocmlnaHQgYWZ0ZXIgeW91
ciBjb2RlIGluc2VydGlvbikgYWxsb3dzIGZvciB0aGUgZmllbGQgdG8gYmUKPj4+Pj4+PiBpbnZh
bGlkLCB3aGljaCBJIHRoaW5rIHlvdSBuZWVkIHRvIGd1YXJkIGFnYWluc3QuCj4+Pj4+Pgo+Pj4+
Pj4gSSB0aGluayB5b3UgbWVhbnMgbXVsdGlwbGUgZGVzdGluYXRpb24sIHRoZW4gaXQncyAtMT8K
Pj4+Pj4KPj4+Pj4gVGhlIHJlYXNvbiBmb3Igd2h5IGl0IG1pZ2h0IGJlIC0xIGFyZSBpcnJlbGV2
YW50IGhlcmUsIEkgdGhpbmsuCj4+Pj4+IFlvdSBuZWVkIHRvIGhhbmRsZSB0aGUgY2FzZSBib3Ro
IHRvIGF2b2lkIGFuIG91dC1vZi1ib3VuZHMKPj4+Pj4gYXJyYXkgYWNjZXNzIGFuZCB0byBtYWtl
IHN1cmUgYW4gSVJSIGJpdCB3b3VsZG4ndCBzdGlsbCBnZXQKPj4+Pj4gcHJvcGFnYXRlZCB0b28g
bGF0ZSBpbiBzb21lIHNwZWNpYWwgY2FzZS4KPj4+Pgo+Pj4+IEFkZCBmb2xsb3dpbmcgY2hlY2tz
Pwo+Pj4+ICAgICAgICAgICAgIGlmICggZGVzdF92Y3B1X2lkID49IDAgJiYgZGVzdF92Y3B1X2lk
IDwgZC0+bWF4X3ZjcHVzICYmCj4+Pj4gICAgICAgICAgICAgICAgICBkLT52Y3B1W2Rlc3RfdmNw
dV9pZF0tPnJ1bnN0YXRlLnN0YXRlIDw9IFJVTlNUQVRFX2Jsb2NrZWQgKQo+Pj4KPj4+IEp1c3Qg
dGhlID49IHBhcnQgc2hvdWxkIHN1ZmZpY2U7IHdpdGhvdXQgYW4gZXhwbGFuYXRpb24gSSBkb24n
dAo+Pj4gc2VlIHdoeSB5b3Ugd2FudCB0aGUgcnVuc3RhdGUgY2hlY2sgKHdoaWNoIGFmdGVyIGFs
bCBpcyByYWN5Cj4+PiBhbnl3YXkgYWZhaWN0KS4KPj4+Cj4+Pj4+IEFsc28gLSB3aGF0IGFib3V0
IHRoZSByZXNwZWN0aXZlIG90aGVyIHBhdGggaW4gdGhlIGZ1bmN0aW9uLAo+Pj4+PiBkZWFsaW5n
IHdpdGggUFRfSVJRX1RZUEVfUENJIGFuZCBQVF9JUlFfVFlQRV9NU0lfVFJBTlNMQVRFPyBJdAo+
Pj4+PiBzZWVtcyB0byBtZSB0aGF0IHRoZXJlJ3MgdGhlIHNhbWUgY2hhbmNlIG9mIGRlZmVycmlu
ZyBJUlIKPj4+Pj4gcHJvcGFnYXRpb24gZm9yIHRvbyBsb25nPwo+Pj4+Cj4+Pj4gVGhpcyBpcyBw
b3NzaWJsZSwgY2FuIHlvdSBwbGVhc2UgaGVscCBvbiBob3cgdG8gZ2V0IHdoaWNoIHZjcHUgYXNz
b2NpYXRlIHRoZSBJUlE/Cj4+Pj4gSSBkaWQgbm90IGZvdW5kIGFueSBoZWxwZXIgb24gY3VycmVu
dCBYZW4uCj4+Pgo+Pj4gVGhlcmUncyBubyBzdWNoIGhlbHBlciwgSSdtIGFmcmFpZC4gTG9va2lu
ZyBhdCBodm1fbWlncmF0ZV9waXJxKCkKPj4+IGFuZCBodm1fZ2lycV9kZXN0XzJfdmNwdV9pZCgp
IEkgbm90aWNlIHRoYXQgdGhlIGZvcm1lciBkb2VzIG5vdGhpbmcKPj4+IGlmIHBpcnFfZHBjaS0+
Z21zaS5wb3N0ZWQgaXMgc2V0LiBIZW5jZSBwaXJxX2RwY2ktPmdtc2kuZGVzdF92Y3B1X2lkCj4+
PiBpc24ndCByZWFsbHkgdXNlZCBpbiB0aGlzIGNhc2UgKHBsZWFzZSBkb3VibGUgY2hlY2spLCBh
bmQgc28geW91IG1heQo+Pj4gd2FudCB0byB1cGRhdGUgdGhlIGZpZWxkIGFsb25nc2lkZSBzZXR0
aW5nIHBpcnFfZHBjaS0+Z21zaS5wb3N0ZWQgaW4KPj4+IHB0X2lycV9jcmVhdGVfYmluZCgpLCBj
b3ZlcmluZyB0aGUgbXVsdGkgZGVzdGluYXRpb24gY2FzZS4KPj4+Cj4+PiBZb3VyIGNvZGUgYWRk
aXRpb24gc3RpbGwgdmlzaWJsZSBpbiBjb250ZXh0IGFib3ZlIG1heSB0aGVuIHdhbnQgdG8KPj4+
IGJlIGZ1cnRoZXIgY29uZGl0aW9uYWxpemVkIHVwb24gaW9tbXVfaW50cG9zdCBvciAocGVyaGFw
cyBiZXR0ZXIpCj4+PiBwaXJxX2RwY2ktPmdtc2kucG9zdGVkIGJlaW5nIHNldC4KPj4+Cj4+Cj4+
IFNvcnJ5IHRoaXMgaXMgbmV3IHRvIG1lLCBhbmQgSSBoYXZlIHRvIHN0dWR5IGZyb20gY29kZS4K
Pj4gRG8geW91IHRoaW5rIGJlbG93IGNoZWNrIGNvdmVyIGFsbCBjb25kaXRpb25zPwo+IAo+IEkg
ZG9lcyBhZmFpY3Q7IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdG8gY2hlY2sgYm90aCBpb21tdV9p
bnRwb3N0IGFuZAo+IHBpcnFfZHBjaS0+Z21zaS5wb3N0ZWQgLSBqdXN0IHRoZSBsYXR0ZXIgb3Vn
aHQgdG8gYmUgZW5vdWdoLiBXaGF0J3MKPiBzdGlsbCBtaXNzaW5nIGlzIHRoZSBmdXJ0aGVyIHVw
ZGF0aW5nIG9mIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQKPiAoYXMgZXhwbGFpbmVkIGJl
Zm9yZSwgc3RpbGwgdmlzaWJsZSBpbiBjb250ZXh0IGFib3ZlKS4KPiAKCiA0MjIKIDQyMyAgICAg
ICAgIGRlc3RfdmNwdV9pZCA9IGh2bV9naXJxX2Rlc3RfMl92Y3B1X2lkKGQsIGRlc3QsIGRlc3Rf
bW9kZSk7CiA0MjQgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZGVzdF92Y3B1X2lkID0gZGVzdF92
Y3B1X2lkOwoKZGVzdF92Y3B1X2lkIHVwZGF0ZWQgbGF0ZXIgYnkgYWJvdmUgY29kZSwgZG8gSSBt
aXNzZWQgc29tZXRoaW5nPwoKVGhhbmtzLApKb2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
