Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B417BB89F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 17:53:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCQbE-0006H5-Iy; Mon, 23 Sep 2019 15:50:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u+I=XS=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iCQbC-00069A-Hn
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 15:50:02 +0000
X-Inumbo-ID: cd43f21e-de19-11e9-b299-bc764e2007e4
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd43f21e-de19-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 15:50:01 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8NFnmuv189565;
 Mon, 23 Sep 2019 15:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=2oO4fdZgursviwfxS5OS4KKcSwPm/VVVnWwMumS6iR8=;
 b=Ytj17vp+veng1Ffq7RN3iIJlxXXJnBurrCgVx/sIDaKftp9h32uu940yKGoV4Xzudf/b
 CBJAQbb4qdZdA8x1bFUk/vUXG4pSQ6uEUBUjCnreiiaiZmhSx0MZfNvbqGDU02Uw3nm4
 xTuC7IxDUSMmlhmNn5RzvZbWCx6gBHk4rIiWZcSAnNMNRubbebjIsR6a++OZkQSj3tdb
 otNFNNitKJRdEq/7vjmp+1GKs2O3AbIT+0sqPO/ykZCxK7SIekBNOzyPH3CI4H1/InT+
 QqpNLZtgssTQthcnP1yzZ5EUIWe7DeD6lYFkDkytKgov2F9NhjeIb2uhmmjigP/2B4aM fg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2v5cgqqsfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 15:49:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8NFhMQj145693;
 Mon, 23 Sep 2019 15:49:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2v6yvgw4yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 15:49:59 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8NFnwsc010193;
 Mon, 23 Sep 2019 15:49:58 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Sep 2019 08:49:58 -0700
To: Chao Gao <chao.gao@intel.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
 <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
 <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
 <20190923083059.GA12996@gao-cwp>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <4c71c626-5fe3-baf6-dd72-371382ee3fb1@oracle.com>
Date: Mon, 23 Sep 2019 08:49:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923083059.GA12996@gao-cwp>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909230149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909230150
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
 Joao Martins <joao.m.martins@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 "DONGLI.ZHANG" <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8yMy8xOSAxOjMxIEFNLCBDaGFvIEdhbyB3cm90ZToKPiBPbiBXZWQsIFNlcCAxOCwgMjAx
OSBhdCAwMjoxNjoxM1BNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+PiBPbiA5LzE2LzE5IDExOjQ4
IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDE3LjA5LjIwMTkgMDA6MjAsIEpvZSBKaW4g
d3JvdGU6Cj4+Pj4gT24gOS8xNi8xOSAxOjAxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4g
T24gMTMuMDkuMjAxOSAxODozOCwgSm9lIEppbiB3cm90ZToKPj4+Pj4+IE9uIDkvMTMvMTkgMTI6
MTQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDEyLjA5LjIwMTkgMjA6MDMsIEpv
ZSBKaW4gd3JvdGU6Cj4+Pj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMK
Pj4+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwo+Pj4+Pj4+PiBAQCAt
NDEyLDYgKzQxMiw5IEBAIGludCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4+Pj4+Pj4+ICAgICAgICAg
ICAgICAgICAgcGlycV9kcGNpLT5nbXNpLmd2ZWMgPSBwdF9pcnFfYmluZC0+dS5tc2kuZ3ZlYzsK
Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ2ZsYWdzID0gZ2ZsYWdz
Owo+Pj4+Pj4+PiAgICAgICAgICAgICAgfQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsgICAgICAgICAg
ICBpZiAoIGh2bV9mdW5jcy5zeW5jX3Bpcl90b19pcnIgKQo+Pj4+Pj4+PiArICAgICAgICAgICAg
ICAgIGh2bV9mdW5jcy5zeW5jX3Bpcl90b19pcnIoZC0+dmNwdVtwaXJxX2RwY2ktPmdtc2kuZGVz
dF92Y3B1X2lkXSk7Cj4+Pj4+Pj4KPj4+Pj4+PiBJZiB0aGUgbmVlZCBmb3IgdGhpcyBjaGFuZ2Ug
Y2FuIGJlIHByb3Blcmx5IGV4cGxhaW5lZCwgdGhlbiBpdAo+Pj4+Pj4+IHN0aWxsIHdhbnRzIGNv
bnZlcnRpbmcgdG8gYWx0ZXJuYXRpdmVfdmNhbGwoKSAtIHRoZSB0aGUgb3RoZXIKPj4+Pj4+PiBj
YWxsZXIgb2YgdGhpcyBob29rLiBPciBwZXJoYXBzIGV2ZW4gYmV0dGVyIG1vdmUgdmxhcGljLmMn
cwo+Pj4+Pj4+IHdyYXBwZXIgKHN1aXRhYmx5IHJlbmFtZWQpIGludG8gaHZtLmgsIGFuZCB1c2Ug
aXQgaGVyZS4KPj4+Pj4+Cj4+Pj4+PiBZZXMgSSBhZ3JlZSwgSSdtIG5vdCAxMDAlIHN1cmUsIHNv
IEkgc2V0IGl0IHRvIFJGQy4KPj4+Pj4KPj4+Pj4gQW5kIGJ0dywgcGxlYXNlIGFsc28gYXR0YWNo
IGEgYnJpZWYgY29tbWVudCBoZXJlLCB0byBjbGFyaWZ5Cj4+Pj4+IHdoeSB0aGUgc3luY2luZyBp
cyBuZWVkZWQgcHJlY2lzZWx5IGF0IHRoaXMgcG9pbnQuCj4+Pj4+Cj4+Pj4+Pj4gQWRkaXRpb25h
bGx5LCB0aGUgY29kZSBzZXR0aW5nIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQKPj4+Pj4+
PiAocmlnaHQgYWZ0ZXIgeW91ciBjb2RlIGluc2VydGlvbikgYWxsb3dzIGZvciB0aGUgZmllbGQg
dG8gYmUKPj4+Pj4+PiBpbnZhbGlkLCB3aGljaCBJIHRoaW5rIHlvdSBuZWVkIHRvIGd1YXJkIGFn
YWluc3QuCj4+Pj4+Pgo+Pj4+Pj4gSSB0aGluayB5b3UgbWVhbnMgbXVsdGlwbGUgZGVzdGluYXRp
b24sIHRoZW4gaXQncyAtMT8KPj4+Pj4KPj4+Pj4gVGhlIHJlYXNvbiBmb3Igd2h5IGl0IG1pZ2h0
IGJlIC0xIGFyZSBpcnJlbGV2YW50IGhlcmUsIEkgdGhpbmsuCj4+Pj4+IFlvdSBuZWVkIHRvIGhh
bmRsZSB0aGUgY2FzZSBib3RoIHRvIGF2b2lkIGFuIG91dC1vZi1ib3VuZHMKPj4+Pj4gYXJyYXkg
YWNjZXNzIGFuZCB0byBtYWtlIHN1cmUgYW4gSVJSIGJpdCB3b3VsZG4ndCBzdGlsbCBnZXQKPj4+
Pj4gcHJvcGFnYXRlZCB0b28gbGF0ZSBpbiBzb21lIHNwZWNpYWwgY2FzZS4KPj4+Pgo+Pj4+IEFk
ZCBmb2xsb3dpbmcgY2hlY2tzPwo+Pj4+ICAgICAgICAgICAgIGlmICggZGVzdF92Y3B1X2lkID49
IDAgJiYgZGVzdF92Y3B1X2lkIDwgZC0+bWF4X3ZjcHVzICYmCj4+Pj4gICAgICAgICAgICAgICAg
ICBkLT52Y3B1W2Rlc3RfdmNwdV9pZF0tPnJ1bnN0YXRlLnN0YXRlIDw9IFJVTlNUQVRFX2Jsb2Nr
ZWQgKQo+Pj4KPj4+IEp1c3QgdGhlID49IHBhcnQgc2hvdWxkIHN1ZmZpY2U7IHdpdGhvdXQgYW4g
ZXhwbGFuYXRpb24gSSBkb24ndAo+Pj4gc2VlIHdoeSB5b3Ugd2FudCB0aGUgcnVuc3RhdGUgY2hl
Y2sgKHdoaWNoIGFmdGVyIGFsbCBpcyByYWN5Cj4+PiBhbnl3YXkgYWZhaWN0KS4KPj4+Cj4+Pj4+
IEFsc28gLSB3aGF0IGFib3V0IHRoZSByZXNwZWN0aXZlIG90aGVyIHBhdGggaW4gdGhlIGZ1bmN0
aW9uLAo+Pj4+PiBkZWFsaW5nIHdpdGggUFRfSVJRX1RZUEVfUENJIGFuZCBQVF9JUlFfVFlQRV9N
U0lfVFJBTlNMQVRFPyBJdAo+Pj4+PiBzZWVtcyB0byBtZSB0aGF0IHRoZXJlJ3MgdGhlIHNhbWUg
Y2hhbmNlIG9mIGRlZmVycmluZyBJUlIKPj4+Pj4gcHJvcGFnYXRpb24gZm9yIHRvbyBsb25nPwo+
Pj4+Cj4+Pj4gVGhpcyBpcyBwb3NzaWJsZSwgY2FuIHlvdSBwbGVhc2UgaGVscCBvbiBob3cgdG8g
Z2V0IHdoaWNoIHZjcHUgYXNzb2NpYXRlIHRoZSBJUlE/Cj4+Pj4gSSBkaWQgbm90IGZvdW5kIGFu
eSBoZWxwZXIgb24gY3VycmVudCBYZW4uCj4+Pgo+Pj4gVGhlcmUncyBubyBzdWNoIGhlbHBlciwg
SSdtIGFmcmFpZC4gTG9va2luZyBhdCBodm1fbWlncmF0ZV9waXJxKCkKPj4+IGFuZCBodm1fZ2ly
cV9kZXN0XzJfdmNwdV9pZCgpIEkgbm90aWNlIHRoYXQgdGhlIGZvcm1lciBkb2VzIG5vdGhpbmcK
Pj4+IGlmIHBpcnFfZHBjaS0+Z21zaS5wb3N0ZWQgaXMgc2V0LiBIZW5jZSBwaXJxX2RwY2ktPmdt
c2kuZGVzdF92Y3B1X2lkCj4+PiBpc24ndCByZWFsbHkgdXNlZCBpbiB0aGlzIGNhc2UgKHBsZWFz
ZSBkb3VibGUgY2hlY2spLCBhbmQgc28geW91IG1heQo+Pj4gd2FudCB0byB1cGRhdGUgdGhlIGZp
ZWxkIGFsb25nc2lkZSBzZXR0aW5nIHBpcnFfZHBjaS0+Z21zaS5wb3N0ZWQgaW4KPj4+IHB0X2ly
cV9jcmVhdGVfYmluZCgpLCBjb3ZlcmluZyB0aGUgbXVsdGkgZGVzdGluYXRpb24gY2FzZS4KPj4+
Cj4+PiBZb3VyIGNvZGUgYWRkaXRpb24gc3RpbGwgdmlzaWJsZSBpbiBjb250ZXh0IGFib3ZlIG1h
eSB0aGVuIHdhbnQgdG8KPj4+IGJlIGZ1cnRoZXIgY29uZGl0aW9uYWxpemVkIHVwb24gaW9tbXVf
aW50cG9zdCBvciAocGVyaGFwcyBiZXR0ZXIpCj4+PiBwaXJxX2RwY2ktPmdtc2kucG9zdGVkIGJl
aW5nIHNldC4KPj4+Cj4+Cj4+IFNvcnJ5IHRoaXMgaXMgbmV3IHRvIG1lLCBhbmQgSSBoYXZlIHRv
IHN0dWR5IGZyb20gY29kZS4KPj4gRG8geW91IHRoaW5rIGJlbG93IGNoZWNrIGNvdmVyIGFsbCBj
b25kaXRpb25zPwo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8u
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKPj4gaW5kZXggNDI5MGM3YzcxMC4uOTBj
M2RhNDQxZCAxMDA2NDQKPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwo+PiAr
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jCj4+IEBAIC00MTIsNiArNDEyLDEwIEBA
IGludCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4+ICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdt
c2kuZ3ZlYyA9IHB0X2lycV9iaW5kLT51Lm1zaS5ndmVjOwo+PiAgICAgICAgICAgICAgICAgcGly
cV9kcGNpLT5nbXNpLmdmbGFncyA9IGdmbGFnczsKPj4gICAgICAgICAgICAgfQo+PiArCj4+ICsg
ICAgICAgICAgICAvKiBOb3RpZnkgZ3Vlc3Qgb2YgcGVuZGluZyBpbnRlcnJ1cHRzIGlmIG5lY2Vz
c2FyeSAqLwo+PiArICAgICAgICAgICAgaWYgKCBkZXN0X3ZjcHVfaWQgPj0gMCAmJiBpb21tdV9p
bnRwb3N0ICYmIHBpcnFfZHBjaS0+Z21zaS5wb3N0ZWQgKQo+IAo+IEhpIEpvZSwKPiAKPiBEbyB5
b3UgZW5hYmxlIHZ0LWQgcG9zdGVkIGludGVycnVwdCBpbiBYZW4gYm9vdCBvcHRpb25zPyBJIGRv
bid0IHNlZQo+IHdoeSBpdCBpcyBzcGVjaWZpYyB0byB2dC1kIHBvc3RlZCBpbnRlcnJ1cHQuIElm
IG9ubHkgQ1BVIHNpZGUgcG9zdGVkCj4gaW50ZXJydXB0IGlzIGVuYWJsZWQsIGl0IGlzIGFsc28g
cG9zc2libGUgdGhhdCBpbnRlcnJ1cHRzIGFyZSBub3QKPiBwcm9wYWdhdGVkIGZyb20gUElSIHRv
IElSUiBpbiB0aW1lLgoKSGkgQ2hhbywKClllcyB2dC1kIHBvc3RlZCBpbnRlcnJ1cHQgYmVlbiBl
bmFibGVkIG9uIGJvb3Rpbmc6CgooWEVOKSBWTVg6IFN1cHBvcnRlZCBhZHZhbmNlZCBmZWF0dXJl
czoKKFhFTikgIC0gQVBJQyBNTUlPIGFjY2VzcyB2aXJ0dWFsaXNhdGlvbgooWEVOKSAgLSBBUElD
IFRQUiBzaGFkb3cKKFhFTikgIC0gRXh0ZW5kZWQgUGFnZSBUYWJsZXMgKEVQVCkKKFhFTikgIC0g
VmlydHVhbC1Qcm9jZXNzb3IgSWRlbnRpZmllcnMgKFZQSUQpCihYRU4pICAtIFZpcnR1YWwgTk1J
CihYRU4pICAtIE1TUiBkaXJlY3QtYWNjZXNzIGJpdG1hcAooWEVOKSAgLSBVbnJlc3RyaWN0ZWQg
R3Vlc3QKKFhFTikgIC0gQVBJQyBSZWdpc3RlciBWaXJ0dWFsaXphdGlvbgooWEVOKSAgLSBWaXJ0
dWFsIEludGVycnVwdCBEZWxpdmVyeQooWEVOKSAgLSBQb3N0ZWQgSW50ZXJydXB0IFByb2Nlc3Np
bmcKKFhFTikgIC0gVk1DUyBzaGFkb3dpbmcKCkxvb2sgYXQgdmxhcGljX3NldF9pcnEoKSwgYW5k
IHNlZW1zIGlmIHBvc3RlZCBpbnRlcnJ1cHQgYmVlbiBlbmFibGVkLCBpdCBzZXQgUElSCmJ1dCBu
b3QgSVJSPwoKIDE3MCAgICAgaWYgKCBodm1fZnVuY3MuZGVsaXZlcl9wb3N0ZWRfaW50ciApCiAx
NzEgICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3MuZGVsaXZlcl9wb3N0ZWRfaW50
ciwgdGFyZ2V0LCB2ZWMpOwogMTcyICAgICBlbHNlIGlmICggIXZsYXBpY190ZXN0X2FuZF9zZXRf
aXJyKHZlYywgdmxhcGljKSApCiAxNzMgICAgICAgICB2Y3B1X2tpY2sodGFyZ2V0KTsKClRoYW5r
cywKSm9lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
