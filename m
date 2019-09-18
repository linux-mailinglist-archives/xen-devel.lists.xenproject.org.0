Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17700B60C6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 11:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAWYe-0001tW-Pj; Wed, 18 Sep 2019 09:47:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAWYc-0001tR-Lk
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 09:47:30 +0000
X-Inumbo-ID: 533329dc-d9f9-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 533329dc-d9f9-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 09:47:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3D802B77D;
 Wed, 18 Sep 2019 09:47:25 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
 <d0bdb8eb-dcd9-cd44-259e-44da6602d3be@bbu.bitdefender.biz>
 <CABfawh==TahJj_ahwsrysTcwd3kOix2WH+G-czT5n873Vznabw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec4138bc-687c-17db-038a-a882c6307f6f@suse.com>
Date: Wed, 18 Sep 2019 11:47:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawh==TahJj_ahwsrysTcwd3kOix2WH+G-czT5n873Vznabw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 Razvan Cojocaru <rcojocaru@bbu.bitdefender.biz>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAxNzowOSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgU2Vw
IDE3LCAyMDE5IGF0IDg6MjQgQU0gUmF6dmFuIENvam9jYXJ1Cj4gPHJjb2pvY2FydUBiYnUuYml0
ZGVmZW5kZXIuYml6PiB3cm90ZToKPj4KPj4gT24gOS8xNy8xOSA1OjExIFBNLCBBbGV4YW5kcnUg
U3RlZmFuIElTQUlMQSB3cm90ZToKPj4+Pj4+PiArYm9vbCBodm1fbW9uaXRvcl9jaGVja19wMm0o
dW5zaWduZWQgbG9uZyBnbGEsIGdmbl90IGdmbiwgdWludDMyX3QgcGZlYywKPj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qga2luZCkKPj4+Pj4+PiArewo+Pj4+Pj4+
ICsgICAgeGVubWVtX2FjY2Vzc190IGFjY2VzczsKPj4+Pj4+PiArICAgIHZtX2V2ZW50X3JlcXVl
c3RfdCByZXEgPSB7fTsKPj4+Pj4+PiArICAgIHBhZGRyX3QgZ3BhID0gKGdmbl90b19nYWRkcihn
Zm4pIHwgKGdsYSAmIH5QQUdFX01BU0spKTsKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICBBU1NFUlQo
Y3VycmVudC0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCk7Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICsg
ICAgY3VycmVudC0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCA9IGZhbHNlOwo+Pj4+Pj4+ICsK
Pj4+Pj4+PiArICAgIGlmICggcDJtX2dldF9tZW1fYWNjZXNzKGN1cnJlbnQtPmRvbWFpbiwgZ2Zu
LCAmYWNjZXNzLAo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWx0cDJtX3Zj
cHVfaWR4KGN1cnJlbnQpKSAhPSAwICkKPj4+Pj4+PiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4+
Pj4+PiAuLi4gbmV4dCB0byB0aGUgY2FsbCBoZXJlIChidXQgdGhlIG1haW50YWluZXJzIG9mIHRo
ZSBmaWxlIHdvdWxkCj4+Pj4+PiBoYXZlIHRvIGp1ZGdlIGluIHRoZSBlbmQpLiBUaGF0IHNhaWQs
IEkgY29udGludWUgdG8gbm90IHVuZGVyc3RhbmQKPj4+Pj4+IHdoeSBhIG5vdCBmb3VuZCBlbnRy
eSBtZWFucyB1bnJlc3RyaWN0ZWQgYWNjZXNzLiBJc24ndCBpdAo+Pj4+Pj4gLT5kZWZhdWx0X2Fj
Y2VzcyB3aGljaCBjb250cm9scyB3aGF0IHN1Y2ggYSAidmlydHVhbCIgZW50cnkgd291bGQKPj4+
Pj4+IHBlcm1pdD8KPj4+Pj4gSSdtIHNvcnJ5IGZvciB0aGlzIG1pc2xlYWRpbmcgY29tbWVudC4g
VGhlIGNvZGUgc3RhdGVzIHRoYXQgaWYgZW50cnkgd2FzCj4+Pj4+IG5vdCBmb3VuZCB0aGUgYWNj
ZXNzIHdpbGwgYmUgZGVmYXVsdF9hY2Nlc3MgYW5kIHJldHVybiAwLiBTbyBpbiB0aGlzCj4+Pj4+
IGNhc2UgdGhlIGRlZmF1bHRfYWNjZXNzIHdpbGwgYmUgY2hlY2tlZC4KPj4+Pj4KPj4+Pj4gLyog
SWYgcmVxdWVzdCB0byBnZXQgZGVmYXVsdCBhY2Nlc3MuICovCj4+Pj4+IGlmICggZ2ZuX2VxKGdm
biwgSU5WQUxJRF9HRk4pICkKPj4+Pj4gewo+Pj4+PiAgICAgICAgKmFjY2VzcyA9IG1lbWFjY2Vz
c1twMm0tPmRlZmF1bHRfYWNjZXNzXTsKPj4+Pj4gICAgICAgIHJldHVybiAwOwo+Pj4+PiB9Cj4+
Pj4+Cj4+Pj4+IElmIHRoaXMgY2xlYXJzIHRoaW5nIHVwIEkgY2FuIHJlbW92ZSB0aGUgIk5PVEUi
IHBhcnQgaWYgdGhlIGNvbW1lbnQuCj4+Pj4gSSdtIGFmcmFpZCBpdCBkb2Vzbid0IGNsZWFyIHRo
aW5ncyB1cDogSSdtIHN0aWxsIGxvc3QgYXMgdG8gd2h5Cj4+Pj4gImVudHJ5IG5vdCBmb3VuZCIg
aW1wbGllcyAiZnVsbCBhY2Nlc3MiLiBBbmQgSSdtIGZ1cnRoZXIgbG9zdCBhcwo+Pj4+IHRvIHdo
YXQgdGhlIGNvZGUgZnJhZ21lbnQgYWJvdmUgKGRlYWxpbmcgd2l0aCBJTlZBTElEX0dGTiwgYnV0
Cj4+Pj4gbm90IHJlYWxseSB0aGUgImVudHJ5IG5vdCBmb3VuZCIgY2FzZSwgd2hpY2ggd291bGQg
YmUgSU5WQUxJRF9NRk4KPj4+PiBjb21pbmcgYmFjayBmcm9tIGEgdHJhbnNsYXRpb24pIGlzIHN1
cHBvc2VkIHRvIHRlbGwgbWUuCj4+Pj4KPj4+IEl0IGlzIHNhZmUgZW5vdWdoIHRvIGNvbnNpZGVy
IGEgaW52YWxpZCBtZm4gZnJvbSBob3N0cDIgdG8gYmUgYQo+Pj4gdmlvbGF0aW9uLiBUaGVyZSBp
cyBzdGlsbCBhIHNtYWxsIHByb2JsZW0gd2l0aCBoYXZpbmcgdGhlIGFsdHAybSB2aWV3Cj4+PiBu
b3QgaGF2aW5nIHRoZSBwYWdlIHByb3BhZ2F0ZWQgZnJvbSBob3N0cDJtLiBJbiB0aGlzIGNhc2Ug
d2UgaGF2ZSB0byB1c2UKPj4+IGFsdHAybV9nZXRfZWZmZWN0aXZlX2VudHJ5KCkuCj4+Cj4+IElu
IHRoZSBhYnNlbmNlIG9mIGNsZWFyIGd1aWRhbmNlIGZyb20gdGhlIEludGVsIFNETSBvbiB3aGF0
IHRoZSBoYXJkd2FyZQo+PiBkZWZhdWx0IGlzIGZvciBhIHBhZ2Ugbm90IHByZXNlbnQgaW4gdGhl
IHAybSwgd2Ugc2hvdWxkIHByb2JhYmx5IGZvbGxvdwo+PiBKYW4ncyBhZHZpY2UgYW5kIGNoZWNr
IHZpb2xhdGlvbnMgYWdhaW5zdCBkZWZhdWx0X2FjY2VzcyBmb3Igc3VjaCBwYWdlcy4KPiAKPiBU
aGUgU0RNIGlzIHZlcnkgY2xlYXIgdGhhdCBwYWdlcyB0aGF0IGFyZSBub3QgcHJlc2VudCBpbiB0
aGUgRVBUIGFyZSBhCj4gdmlvbGF0aW9uOgo+IAo+IDI4LjIuMgo+IEFuIEVQVCBwYWdpbmctc3Ry
dWN0dXJlIGVudHJ5IGlzIHByZXNlbnQgaWYgYW55IG9mIGJpdHMgMjowIGlzIDE7Cj4gb3RoZXJ3
aXNlLCB0aGUgZW50cnkgaXMgbm90IHByZXNlbnQuIFRoZSBwcm9jZXNzb3IKPiBpZ25vcmVzIGJp
dHMgNjI6MyBhbmQgdXNlcyB0aGUgZW50cnkgbmVpdGhlciB0byByZWZlcmVuY2UgYW5vdGhlciBF
UFQKPiBwYWdpbmctc3RydWN0dXJlIGVudHJ5IG5vciB0byBwcm9kdWNlIGEKPiBwaHlzaWNhbCBh
ZGRyZXNzLiBBIHJlZmVyZW5jZSB1c2luZyBhIGd1ZXN0LXBoeXNpY2FsIGFkZHJlc3Mgd2hvc2UK
PiB0cmFuc2xhdGlvbiBlbmNvdW50ZXJzIGFuIEVQVCBwYWdpbmctc3RydWMtCj4gdHVyZSB0aGF0
IGlzIG5vdCBwcmVzZW50IGNhdXNlcyBhbiBFUFQgdmlvbGF0aW9uIChzZWUgU2VjdGlvbiAyOC4y
LjMuMikuCj4gCj4gMjguMi4zLjIKPiBFUFQgVmlvbGF0aW9ucwo+IEFuIEVQVCB2aW9sYXRpb24g
bWF5IG9jY3VyIGR1cmluZyBhbiBhY2Nlc3MgdXNpbmcgYSBndWVzdC1waHlzaWNhbAo+IGFkZHJl
c3Mgd2hvc2UgdHJhbnNsYXRpb24gZG9lcyBub3QgY2F1c2UgYW4KPiBFUFQgbWlzY29uZmlndXJh
dGlvbi4gQW4gRVBUIHZpb2xhdGlvbiBvY2N1cnMgaW4gYW55IG9mIHRoZSBmb2xsb3dpbmcKPiBz
aXR1YXRpb25zOgo+IOKAoiBUcmFuc2xhdGlvbiBvZiB0aGUgZ3Vlc3QtcGh5c2ljYWwgYWRkcmVz
cyBlbmNvdW50ZXJzIGFuIEVQVAo+IHBhZ2luZy1zdHJ1Y3R1cmUgZW50cnkgdGhhdCBpcyBub3Qg
cHJlc2VudCAoc2VlCj4gU2VjdGlvbiAyOC4yLjIpLgoKSSdtIG5vdCBzdXJlIGlmIC8gaG93IHRo
aXMgaGVscHMgKG90aGVyIHRoYW4gdG8gYW5zd2VyIFJhenZhbidzCmltbWVkaWF0ZSBxdWVzdGlv
bik6IEl0IHdhcyBmb3IgYSByZWFzb24gdGhhdCBJIHRhbGtlZCBhYm91dAoidmlydHVhbCIgZW50
cmllcywgZS5nLiBvbmVzIHRoYXQgd291bGQgYmUgdGhlcmUgaWYgdGhleSBoYWQKYmVlbiBwcm9w
YWdhdGVkIGFscmVhZHkuIEFsYmVpdCBwcm9wYWdhdGVkIG9uZXMgcHJvYmFibHkgYXJlbid0CmEg
Z29vZCBjYXNlIGhlcmUsIHNpbmNlIHRob3NlIGRvbid0IGhhdmUgZGVmYXVsdF9hY2Nlc3MKcGVy
bWlzc2lvbnMgYW55d2F5LgoKQnV0IGFueXdheSAtIHdoYXQgbXkgb3JpZ2luYWwgcmVtYXJrIGhl
cmUgd2FzIGFib3V0IHdhcyB0aGUKKG1pc3NpbmcpIGRpc3RpbmN0aW9uIG9mIHRoZSBkaWZmZXJl
bnQgZmFpbHVyZSBtb2RlcyBvZgpwMm1fZ2V0X21lbV9hY2Nlc3MoKS4gRm9yIGV4YW1wbGUgSSdk
IGV4cGVjdCBhIEdGTiBtYXBwaW5nCnRvIHBoeXNpY2FsIG1lbW9yeSBhY2Nlc3MgdG8gd2hpY2gg
aXMgZW11bGF0ZWQgdG8gZ28gdGhlCi1FU1JDSCByZXR1cm4gcGF0aCwgZHVlIHRvIElOVkFMSURf
TUZOIGNvbWluZyBiYWNrLiBZZXQgc3VjaApHRk5zIHN0aWxsIG91Z2h0IHRvIGhhdmUgYWNjZXNz
IGNvbnRyb2xzIChhdCBsZWFzdCBpbiB0aGVvcnkpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
