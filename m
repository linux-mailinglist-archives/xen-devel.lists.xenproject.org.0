Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA5B6EB6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 23:19:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAhK9-0006VD-1C; Wed, 18 Sep 2019 21:17:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8f0=XN=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1iAhK7-0006Uy-3b
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 21:17:15 +0000
X-Inumbo-ID: af14a96e-da59-11e9-a337-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af14a96e-da59-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 21:17:14 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ILGaZY081787;
 Wed, 18 Sep 2019 21:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=+NeFaoYcYp1GOsLElcWEsJ81GvPIUGOG8Ur13KqTcNA=;
 b=hhAQMGeCWevQ8GZyW3DA+PooDdjd9irPq7m5dLITu2hmNzRR8R6h70MaGvGrJ2aiBOoi
 OVR6w7VtlUUnAwM9Dg41Evti1HuhIMCj2AQOQ8irUaFXZqDjSPutkv9DKeUA4OIwggzp
 L8chSBPQeXu7oO7W6MYg3U481+JuUbb+pKi/oqoUeBk2Jix0OmTyy+7p5j8TovIMkByY
 E+aoYju6wUi3Ztnu1HU8qd0SJE3570ZU8Qcfyb3Md87E9yV7WGRyja65rm3hSoYEtI7z
 vn3Rh6xk+oyw3/XPOhfdUxxaivH4qPplY3FUm6z18lTn6aYRaBoR0DY7N/to0z9IHQ+Z bA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2v3vb5004m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 21:17:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ILF1IQ196233;
 Wed, 18 Sep 2019 21:17:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2v3vb4061f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 21:17:12 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8ILHB3c017441;
 Wed, 18 Sep 2019 21:17:11 GMT
Received: from [10.211.46.60] (/10.211.46.60)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Sep 2019 14:16:16 -0700
To: Jan Beulich <jbeulich@suse.com>
References: <70457d4e-068f-0160-532b-e00dd295b3b1@oracle.com>
 <015923df-34c5-95e0-295f-84bd84c25884@suse.com>
 <081dab07-bf85-6477-a710-38f671ec20ba@oracle.com>
 <30e5e335-9c01-ef8c-3437-3d42fb31e8f0@suse.com>
 <8b94f6bb-defe-c8e4-de8a-1404ab209e5e@oracle.com>
 <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <bae64f76-ac83-1208-fd4f-9e763e3c1caf@oracle.com>
Date: Wed, 18 Sep 2019 14:16:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b4f576d6-b98c-37fd-f5d6-1d79523006ac@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909180182
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9384
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909180182
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

T24gOS8xNi8xOSAxMTo0OCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDkuMjAxOSAw
MDoyMCwgSm9lIEppbiB3cm90ZToKPj4gT24gOS8xNi8xOSAxOjAxIEFNLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+IE9uIDEzLjA5LjIwMTkgMTg6MzgsIEpvZSBKaW4gd3JvdGU6Cj4+Pj4gT24gOS8x
My8xOSAxMjoxNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEyLjA5LjIwMTkgMjA6
MDMsIEpvZSBKaW4gd3JvdGU6Cj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
by5jCj4+Pj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jCj4+Pj4+PiBAQCAt
NDEyLDYgKzQxMiw5IEBAIGludCBwdF9pcnFfY3JlYXRlX2JpbmQoCj4+Pj4+PiAgICAgICAgICAg
ICAgICAgIHBpcnFfZHBjaS0+Z21zaS5ndmVjID0gcHRfaXJxX2JpbmQtPnUubXNpLmd2ZWM7Cj4+
Pj4+PiAgICAgICAgICAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5nZmxhZ3MgPSBnZmxhZ3M7Cj4+
Pj4+PiAgICAgICAgICAgICAgfQo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICAgICAgICAgIGlmICggaHZt
X2Z1bmNzLnN5bmNfcGlyX3RvX2lyciApCj4+Pj4+PiArICAgICAgICAgICAgICAgIGh2bV9mdW5j
cy5zeW5jX3Bpcl90b19pcnIoZC0+dmNwdVtwaXJxX2RwY2ktPmdtc2kuZGVzdF92Y3B1X2lkXSk7
Cj4+Pj4+Cj4+Pj4+IElmIHRoZSBuZWVkIGZvciB0aGlzIGNoYW5nZSBjYW4gYmUgcHJvcGVybHkg
ZXhwbGFpbmVkLCB0aGVuIGl0Cj4+Pj4+IHN0aWxsIHdhbnRzIGNvbnZlcnRpbmcgdG8gYWx0ZXJu
YXRpdmVfdmNhbGwoKSAtIHRoZSB0aGUgb3RoZXIKPj4+Pj4gY2FsbGVyIG9mIHRoaXMgaG9vay4g
T3IgcGVyaGFwcyBldmVuIGJldHRlciBtb3ZlIHZsYXBpYy5jJ3MKPj4+Pj4gd3JhcHBlciAoc3Vp
dGFibHkgcmVuYW1lZCkgaW50byBodm0uaCwgYW5kIHVzZSBpdCBoZXJlLgo+Pj4+Cj4+Pj4gWWVz
IEkgYWdyZWUsIEknbSBub3QgMTAwJSBzdXJlLCBzbyBJIHNldCBpdCB0byBSRkMuCj4+Pgo+Pj4g
QW5kIGJ0dywgcGxlYXNlIGFsc28gYXR0YWNoIGEgYnJpZWYgY29tbWVudCBoZXJlLCB0byBjbGFy
aWZ5Cj4+PiB3aHkgdGhlIHN5bmNpbmcgaXMgbmVlZGVkIHByZWNpc2VseSBhdCB0aGlzIHBvaW50
Lgo+Pj4KPj4+Pj4gQWRkaXRpb25hbGx5LCB0aGUgY29kZSBzZXR0aW5nIHBpcnFfZHBjaS0+Z21z
aS5kZXN0X3ZjcHVfaWQKPj4+Pj4gKHJpZ2h0IGFmdGVyIHlvdXIgY29kZSBpbnNlcnRpb24pIGFs
bG93cyBmb3IgdGhlIGZpZWxkIHRvIGJlCj4+Pj4+IGludmFsaWQsIHdoaWNoIEkgdGhpbmsgeW91
IG5lZWQgdG8gZ3VhcmQgYWdhaW5zdC4KPj4+Pgo+Pj4+IEkgdGhpbmsgeW91IG1lYW5zIG11bHRp
cGxlIGRlc3RpbmF0aW9uLCB0aGVuIGl0J3MgLTE/Cj4+Pgo+Pj4gVGhlIHJlYXNvbiBmb3Igd2h5
IGl0IG1pZ2h0IGJlIC0xIGFyZSBpcnJlbGV2YW50IGhlcmUsIEkgdGhpbmsuCj4+PiBZb3UgbmVl
ZCB0byBoYW5kbGUgdGhlIGNhc2UgYm90aCB0byBhdm9pZCBhbiBvdXQtb2YtYm91bmRzCj4+PiBh
cnJheSBhY2Nlc3MgYW5kIHRvIG1ha2Ugc3VyZSBhbiBJUlIgYml0IHdvdWxkbid0IHN0aWxsIGdl
dAo+Pj4gcHJvcGFnYXRlZCB0b28gbGF0ZSBpbiBzb21lIHNwZWNpYWwgY2FzZS4KPj4KPj4gQWRk
IGZvbGxvd2luZyBjaGVja3M/Cj4+ICAgICAgICAgICAgIGlmICggZGVzdF92Y3B1X2lkID49IDAg
JiYgZGVzdF92Y3B1X2lkIDwgZC0+bWF4X3ZjcHVzICYmCj4+ICAgICAgICAgICAgICAgICAgZC0+
dmNwdVtkZXN0X3ZjcHVfaWRdLT5ydW5zdGF0ZS5zdGF0ZSA8PSBSVU5TVEFURV9ibG9ja2VkICkK
PiAKPiBKdXN0IHRoZSA+PSBwYXJ0IHNob3VsZCBzdWZmaWNlOyB3aXRob3V0IGFuIGV4cGxhbmF0
aW9uIEkgZG9uJ3QKPiBzZWUgd2h5IHlvdSB3YW50IHRoZSBydW5zdGF0ZSBjaGVjayAod2hpY2gg
YWZ0ZXIgYWxsIGlzIHJhY3kKPiBhbnl3YXkgYWZhaWN0KS4KPiAKPj4+IEFsc28gLSB3aGF0IGFi
b3V0IHRoZSByZXNwZWN0aXZlIG90aGVyIHBhdGggaW4gdGhlIGZ1bmN0aW9uLAo+Pj4gZGVhbGlu
ZyB3aXRoIFBUX0lSUV9UWVBFX1BDSSBhbmQgUFRfSVJRX1RZUEVfTVNJX1RSQU5TTEFURT8gSXQK
Pj4+IHNlZW1zIHRvIG1lIHRoYXQgdGhlcmUncyB0aGUgc2FtZSBjaGFuY2Ugb2YgZGVmZXJyaW5n
IElSUgo+Pj4gcHJvcGFnYXRpb24gZm9yIHRvbyBsb25nPwo+Pgo+PiBUaGlzIGlzIHBvc3NpYmxl
LCBjYW4geW91IHBsZWFzZSBoZWxwIG9uIGhvdyB0byBnZXQgd2hpY2ggdmNwdSBhc3NvY2lhdGUg
dGhlIElSUT8KPj4gSSBkaWQgbm90IGZvdW5kIGFueSBoZWxwZXIgb24gY3VycmVudCBYZW4uCj4g
Cj4gVGhlcmUncyBubyBzdWNoIGhlbHBlciwgSSdtIGFmcmFpZC4gTG9va2luZyBhdCBodm1fbWln
cmF0ZV9waXJxKCkKPiBhbmQgaHZtX2dpcnFfZGVzdF8yX3ZjcHVfaWQoKSBJIG5vdGljZSB0aGF0
IHRoZSBmb3JtZXIgZG9lcyBub3RoaW5nCj4gaWYgcGlycV9kcGNpLT5nbXNpLnBvc3RlZCBpcyBz
ZXQuIEhlbmNlIHBpcnFfZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWQKPiBpc24ndCByZWFsbHkgdXNl
ZCBpbiB0aGlzIGNhc2UgKHBsZWFzZSBkb3VibGUgY2hlY2spLCBhbmQgc28geW91IG1heQo+IHdh
bnQgdG8gdXBkYXRlIHRoZSBmaWVsZCBhbG9uZ3NpZGUgc2V0dGluZyBwaXJxX2RwY2ktPmdtc2ku
cG9zdGVkIGluCj4gcHRfaXJxX2NyZWF0ZV9iaW5kKCksIGNvdmVyaW5nIHRoZSBtdWx0aSBkZXN0
aW5hdGlvbiBjYXNlLgo+IAo+IFlvdXIgY29kZSBhZGRpdGlvbiBzdGlsbCB2aXNpYmxlIGluIGNv
bnRleHQgYWJvdmUgbWF5IHRoZW4gd2FudCB0bwo+IGJlIGZ1cnRoZXIgY29uZGl0aW9uYWxpemVk
IHVwb24gaW9tbXVfaW50cG9zdCBvciAocGVyaGFwcyBiZXR0ZXIpCj4gcGlycV9kcGNpLT5nbXNp
LnBvc3RlZCBiZWluZyBzZXQuCj4gCgpTb3JyeSB0aGlzIGlzIG5ldyB0byBtZSwgYW5kIEkgaGF2
ZSB0byBzdHVkeSBmcm9tIGNvZGUuCkRvIHlvdSB0aGluayBiZWxvdyBjaGVjayBjb3ZlciBhbGwg
Y29uZGl0aW9ucz8KCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwppbmRleCA0MjkwYzdjNzEwLi45MGMzZGE0NDFk
IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pby5jCisrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKQEAgLTQxMiw2ICs0MTIsMTAgQEAgaW50IHB0X2lycV9jcmVh
dGVfYmluZCgKICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kuZ3ZlYyA9IHB0X2lycV9i
aW5kLT51Lm1zaS5ndmVjOwogICAgICAgICAgICAgICAgIHBpcnFfZHBjaS0+Z21zaS5nZmxhZ3Mg
PSBnZmxhZ3M7CiAgICAgICAgICAgICB9CisKKyAgICAgICAgICAgIC8qIE5vdGlmeSBndWVzdCBv
ZiBwZW5kaW5nIGludGVycnVwdHMgaWYgbmVjZXNzYXJ5ICovCisgICAgICAgICAgICBpZiAoIGRl
c3RfdmNwdV9pZCA+PSAwICYmIGlvbW11X2ludHBvc3QgJiYgcGlycV9kcGNpLT5nbXNpLnBvc3Rl
ZCApCisgICAgICAgICAgICAgICAgdmxhcGljX3N5bmNfcGlyX3RvX2lycihkLT52Y3B1W3BpcnFf
ZHBjaS0+Z21zaS5kZXN0X3ZjcHVfaWRdKTsKICAgICAgICAgfQogICAgICAgICAvKiBDYWxjdWxh
dGUgZGVzdF92Y3B1X2lkIGZvciBNU0ktdHlwZSBwaXJxIG1pZ3JhdGlvbi4gKi8KICAgICAgICAg
ZGVzdCA9IE1BU0tfRVhUUihwaXJxX2RwY2ktPmdtc2kuZ2ZsYWdzLAoKClRoYW5rcywKSm9lCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
