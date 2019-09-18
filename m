Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8FB6892
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 18:59:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAdFR-0002k6-VS; Wed, 18 Sep 2019 16:56:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=51Qx=XN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iAdFQ-0002ju-Uk
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 16:56:08 +0000
X-Inumbo-ID: 34467705-da35-11e9-963d-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34467705-da35-11e9-963d-12813bfff9fa;
 Wed, 18 Sep 2019 16:56:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1568825767; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=hg3HLAz4o7A1/SIwF1Q71hQ1YZoIZ9AWMZtjuxt/SMA=;
 b=H2szbego/7+ugMvXe6CXty+pzPb/PRGVtjRSox99ArM6rB44z2z+s1zG2q6rIaY10vNnqVXt
 tSXyKx6dM4YTyp057znjaZ3GCcXpZ3ezsMFsWPlN4GYUyKS3iVtTZulX9HN5uAG5q+nG4bHF
 dettUbos2i6qxPqsgCVf8xtydJI=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mxa.mailgun.org with ESMTP id 5d8261a2.7f46d0106b30-smtp-out-n01;
 Wed, 18 Sep 2019 16:56:02 -0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 7so967170wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2019 09:56:01 -0700 (PDT)
X-Gm-Message-State: APjAAAWCpeiqI+Y+FbsfcrWzGEFVQ6PgDg/e2eEnIw+LUZK6hrVplny+
 Lx+lbH9nZop8XvJslQVweUz1G/2kJalA/XIag0k=
X-Google-Smtp-Source: APXvYqzuOXNXe7UZGC9HPdS8aAIi8+VZPeBJpUoiYOSRyyDpLPavJ/SWEJOg/uFHECQ2otezh//l1lUT+n9nPG+Dqr0=
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr3535908wmf.129.1568825760030; 
 Wed, 18 Sep 2019 09:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190916081024.20931-1-aisaila@bitdefender.com>
 <18854b5e-8e1a-298f-672f-ccc93b5b3a2a@suse.com>
 <3f252f60-6f72-6025-d4dc-d82077e43691@bitdefender.com>
 <f791ad24-a106-1cf6-2ff8-53adca03b1d5@suse.com>
 <65dcce1f-e73a-230d-83bd-271b6312bc48@bitdefender.com>
 <d0bdb8eb-dcd9-cd44-259e-44da6602d3be@bbu.bitdefender.biz>
 <CABfawh==TahJj_ahwsrysTcwd3kOix2WH+G-czT5n873Vznabw@mail.gmail.com>
 <ec4138bc-687c-17db-038a-a882c6307f6f@suse.com>
 <451aaca8-73c7-86d7-949d-2c48654555eb@bitdefender.com>
In-Reply-To: <451aaca8-73c7-86d7-949d-2c48654555eb@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 18 Sep 2019 10:55:23 -0600
X-Gmail-Original-Message-ID: <CABfawhnd1z8ObeGRc9zys_03WCOa_=OW_w-vdSQTfAdy7hj1FA@mail.gmail.com>
Message-ID: <CABfawhnd1z8ObeGRc9zys_03WCOa_=OW_w-vdSQTfAdy7hj1FA@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
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
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgNDozNSBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDE4LjA5LjIwMTkgMTI6
NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gT24gMTcuMDkuMjAxOSAxNzowOSwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4+IE9uIFR1ZSwgU2VwIDE3LCAyMDE5IGF0IDg6MjQgQU0gUmF6dmFu
IENvam9jYXJ1Cj4gPj4gPHJjb2pvY2FydUBiYnUuYml0ZGVmZW5kZXIuYml6PiB3cm90ZToKPiA+
Pj4KPiA+Pj4gT24gOS8xNy8xOSA1OjExIFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90
ZToKPiA+Pj4+Pj4+PiArYm9vbCBodm1fbW9uaXRvcl9jaGVja19wMm0odW5zaWduZWQgbG9uZyBn
bGEsIGdmbl90IGdmbiwgdWludDMyX3QgcGZlYywKPiA+Pj4+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdWludDE2X3Qga2luZCkKPiA+Pj4+Pj4+PiArewo+ID4+Pj4+Pj4+ICsgICAg
eGVubWVtX2FjY2Vzc190IGFjY2VzczsKPiA+Pj4+Pj4+PiArICAgIHZtX2V2ZW50X3JlcXVlc3Rf
dCByZXEgPSB7fTsKPiA+Pj4+Pj4+PiArICAgIHBhZGRyX3QgZ3BhID0gKGdmbl90b19nYWRkcihn
Zm4pIHwgKGdsYSAmIH5QQUdFX01BU0spKTsKPiA+Pj4+Pj4+PiArCj4gPj4+Pj4+Pj4gKyAgICBB
U1NFUlQoY3VycmVudC0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCk7Cj4gPj4+Pj4+Pj4gKwo+
ID4+Pj4+Pj4+ICsgICAgY3VycmVudC0+YXJjaC52bV9ldmVudC0+c2VuZF9ldmVudCA9IGZhbHNl
Owo+ID4+Pj4+Pj4+ICsKPiA+Pj4+Pj4+PiArICAgIGlmICggcDJtX2dldF9tZW1fYWNjZXNzKGN1
cnJlbnQtPmRvbWFpbiwgZ2ZuLCAmYWNjZXNzLAo+ID4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYWx0cDJtX3ZjcHVfaWR4KGN1cnJlbnQpKSAhPSAwICkKPiA+Pj4+Pj4+PiAr
ICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPj4+Pj4+PiAuLi4gbmV4dCB0byB0aGUgY2FsbCBoZXJl
IChidXQgdGhlIG1haW50YWluZXJzIG9mIHRoZSBmaWxlIHdvdWxkCj4gPj4+Pj4+PiBoYXZlIHRv
IGp1ZGdlIGluIHRoZSBlbmQpLiBUaGF0IHNhaWQsIEkgY29udGludWUgdG8gbm90IHVuZGVyc3Rh
bmQKPiA+Pj4+Pj4+IHdoeSBhIG5vdCBmb3VuZCBlbnRyeSBtZWFucyB1bnJlc3RyaWN0ZWQgYWNj
ZXNzLiBJc24ndCBpdAo+ID4+Pj4+Pj4gLT5kZWZhdWx0X2FjY2VzcyB3aGljaCBjb250cm9scyB3
aGF0IHN1Y2ggYSAidmlydHVhbCIgZW50cnkgd291bGQKPiA+Pj4+Pj4+IHBlcm1pdD8KPiA+Pj4+
Pj4gSSdtIHNvcnJ5IGZvciB0aGlzIG1pc2xlYWRpbmcgY29tbWVudC4gVGhlIGNvZGUgc3RhdGVz
IHRoYXQgaWYgZW50cnkgd2FzCj4gPj4+Pj4+IG5vdCBmb3VuZCB0aGUgYWNjZXNzIHdpbGwgYmUg
ZGVmYXVsdF9hY2Nlc3MgYW5kIHJldHVybiAwLiBTbyBpbiB0aGlzCj4gPj4+Pj4+IGNhc2UgdGhl
IGRlZmF1bHRfYWNjZXNzIHdpbGwgYmUgY2hlY2tlZC4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gLyogSWYg
cmVxdWVzdCB0byBnZXQgZGVmYXVsdCBhY2Nlc3MuICovCj4gPj4+Pj4+IGlmICggZ2ZuX2VxKGdm
biwgSU5WQUxJRF9HRk4pICkKPiA+Pj4+Pj4gewo+ID4+Pj4+PiAgICAgICAgICphY2Nlc3MgPSBt
ZW1hY2Nlc3NbcDJtLT5kZWZhdWx0X2FjY2Vzc107Cj4gPj4+Pj4+ICAgICAgICAgcmV0dXJuIDA7
Cj4gPj4+Pj4+IH0KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSWYgdGhpcyBjbGVhcnMgdGhpbmcgdXAgSSBj
YW4gcmVtb3ZlIHRoZSAiTk9URSIgcGFydCBpZiB0aGUgY29tbWVudC4KPiA+Pj4+PiBJJ20gYWZy
YWlkIGl0IGRvZXNuJ3QgY2xlYXIgdGhpbmdzIHVwOiBJJ20gc3RpbGwgbG9zdCBhcyB0byB3aHkK
PiA+Pj4+PiAiZW50cnkgbm90IGZvdW5kIiBpbXBsaWVzICJmdWxsIGFjY2VzcyIuIEFuZCBJJ20g
ZnVydGhlciBsb3N0IGFzCj4gPj4+Pj4gdG8gd2hhdCB0aGUgY29kZSBmcmFnbWVudCBhYm92ZSAo
ZGVhbGluZyB3aXRoIElOVkFMSURfR0ZOLCBidXQKPiA+Pj4+PiBub3QgcmVhbGx5IHRoZSAiZW50
cnkgbm90IGZvdW5kIiBjYXNlLCB3aGljaCB3b3VsZCBiZSBJTlZBTElEX01GTgo+ID4+Pj4+IGNv
bWluZyBiYWNrIGZyb20gYSB0cmFuc2xhdGlvbikgaXMgc3VwcG9zZWQgdG8gdGVsbCBtZS4KPiA+
Pj4+Pgo+ID4+Pj4gSXQgaXMgc2FmZSBlbm91Z2ggdG8gY29uc2lkZXIgYSBpbnZhbGlkIG1mbiBm
cm9tIGhvc3RwMiB0byBiZSBhCj4gPj4+PiB2aW9sYXRpb24uIFRoZXJlIGlzIHN0aWxsIGEgc21h
bGwgcHJvYmxlbSB3aXRoIGhhdmluZyB0aGUgYWx0cDJtIHZpZXcKPiA+Pj4+IG5vdCBoYXZpbmcg
dGhlIHBhZ2UgcHJvcGFnYXRlZCBmcm9tIGhvc3RwMm0uIEluIHRoaXMgY2FzZSB3ZSBoYXZlIHRv
IHVzZQo+ID4+Pj4gYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkoKS4KPiA+Pj4KPiA+Pj4gSW4g
dGhlIGFic2VuY2Ugb2YgY2xlYXIgZ3VpZGFuY2UgZnJvbSB0aGUgSW50ZWwgU0RNIG9uIHdoYXQg
dGhlIGhhcmR3YXJlCj4gPj4+IGRlZmF1bHQgaXMgZm9yIGEgcGFnZSBub3QgcHJlc2VudCBpbiB0
aGUgcDJtLCB3ZSBzaG91bGQgcHJvYmFibHkgZm9sbG93Cj4gPj4+IEphbidzIGFkdmljZSBhbmQg
Y2hlY2sgdmlvbGF0aW9ucyBhZ2FpbnN0IGRlZmF1bHRfYWNjZXNzIGZvciBzdWNoIHBhZ2VzLgo+
ID4+Cj4gPj4gVGhlIFNETSBpcyB2ZXJ5IGNsZWFyIHRoYXQgcGFnZXMgdGhhdCBhcmUgbm90IHBy
ZXNlbnQgaW4gdGhlIEVQVCBhcmUgYQo+ID4+IHZpb2xhdGlvbjoKPiA+Pgo+ID4+IDI4LjIuMgo+
ID4+IEFuIEVQVCBwYWdpbmctc3RydWN0dXJlIGVudHJ5IGlzIHByZXNlbnQgaWYgYW55IG9mIGJp
dHMgMjowIGlzIDE7Cj4gPj4gb3RoZXJ3aXNlLCB0aGUgZW50cnkgaXMgbm90IHByZXNlbnQuIFRo
ZSBwcm9jZXNzb3IKPiA+PiBpZ25vcmVzIGJpdHMgNjI6MyBhbmQgdXNlcyB0aGUgZW50cnkgbmVp
dGhlciB0byByZWZlcmVuY2UgYW5vdGhlciBFUFQKPiA+PiBwYWdpbmctc3RydWN0dXJlIGVudHJ5
IG5vciB0byBwcm9kdWNlIGEKPiA+PiBwaHlzaWNhbCBhZGRyZXNzLiBBIHJlZmVyZW5jZSB1c2lu
ZyBhIGd1ZXN0LXBoeXNpY2FsIGFkZHJlc3Mgd2hvc2UKPiA+PiB0cmFuc2xhdGlvbiBlbmNvdW50
ZXJzIGFuIEVQVCBwYWdpbmctc3RydWMtCj4gPj4gdHVyZSB0aGF0IGlzIG5vdCBwcmVzZW50IGNh
dXNlcyBhbiBFUFQgdmlvbGF0aW9uIChzZWUgU2VjdGlvbiAyOC4yLjMuMikuCj4gPj4KPiA+PiAy
OC4yLjMuMgo+ID4+IEVQVCBWaW9sYXRpb25zCj4gPj4gQW4gRVBUIHZpb2xhdGlvbiBtYXkgb2Nj
dXIgZHVyaW5nIGFuIGFjY2VzcyB1c2luZyBhIGd1ZXN0LXBoeXNpY2FsCj4gPj4gYWRkcmVzcyB3
aG9zZSB0cmFuc2xhdGlvbiBkb2VzIG5vdCBjYXVzZSBhbgo+ID4+IEVQVCBtaXNjb25maWd1cmF0
aW9uLiBBbiBFUFQgdmlvbGF0aW9uIG9jY3VycyBpbiBhbnkgb2YgdGhlIGZvbGxvd2luZwo+ID4+
IHNpdHVhdGlvbnM6Cj4gPj4g4oCiIFRyYW5zbGF0aW9uIG9mIHRoZSBndWVzdC1waHlzaWNhbCBh
ZGRyZXNzIGVuY291bnRlcnMgYW4gRVBUCj4gPj4gcGFnaW5nLXN0cnVjdHVyZSBlbnRyeSB0aGF0
IGlzIG5vdCBwcmVzZW50IChzZWUKPiA+PiBTZWN0aW9uIDI4LjIuMikuCj4gPgo+ID4gSSdtIG5v
dCBzdXJlIGlmIC8gaG93IHRoaXMgaGVscHMgKG90aGVyIHRoYW4gdG8gYW5zd2VyIFJhenZhbidz
Cj4gPiBpbW1lZGlhdGUgcXVlc3Rpb24pOiBJdCB3YXMgZm9yIGEgcmVhc29uIHRoYXQgSSB0YWxr
ZWQgYWJvdXQKPiA+ICJ2aXJ0dWFsIiBlbnRyaWVzLCBlLmcuIG9uZXMgdGhhdCB3b3VsZCBiZSB0
aGVyZSBpZiB0aGV5IGhhZAo+ID4gYmVlbiBwcm9wYWdhdGVkIGFscmVhZHkuIEFsYmVpdCBwcm9w
YWdhdGVkIG9uZXMgcHJvYmFibHkgYXJlbid0Cj4gPiBhIGdvb2QgY2FzZSBoZXJlLCBzaW5jZSB0
aG9zZSBkb24ndCBoYXZlIGRlZmF1bHRfYWNjZXNzCj4gPiBwZXJtaXNzaW9ucyBhbnl3YXkuCj4g
Pgo+ID4gQnV0IGFueXdheSAtIHdoYXQgbXkgb3JpZ2luYWwgcmVtYXJrIGhlcmUgd2FzIGFib3V0
IHdhcyB0aGUKPiA+IChtaXNzaW5nKSBkaXN0aW5jdGlvbiBvZiB0aGUgZGlmZmVyZW50IGZhaWx1
cmUgbW9kZXMgb2YKPiA+IHAybV9nZXRfbWVtX2FjY2VzcygpLiBGb3IgZXhhbXBsZSBJJ2QgZXhw
ZWN0IGEgR0ZOIG1hcHBpbmcKPiA+IHRvIHBoeXNpY2FsIG1lbW9yeSBhY2Nlc3MgdG8gd2hpY2gg
aXMgZW11bGF0ZWQgdG8gZ28gdGhlCj4gPiAtRVNSQ0ggcmV0dXJuIHBhdGgsIGR1ZSB0byBJTlZB
TElEX01GTiBjb21pbmcgYmFjay4gWWV0IHN1Y2gKPiA+IEdGTnMgc3RpbGwgb3VnaHQgdG8gaGF2
ZSBhY2Nlc3MgY29udHJvbHMgKGF0IGxlYXN0IGluIHRoZW9yeSkuCj4gPgo+Cj4gSSBhZ3JlZSB3
aXRoIHRoaXMgYW5kIEkgdGhpbmsgdGhleSBzaG91bGQgYmUgdHJlYXRlZCBhcyBYRU5NRU1fYWNj
ZXNzX24uCj4gSWYgZXZlcnlvbmUgaXMgT0sgd2l0aCB0aGlzIEkgd2lsbCBhZGQgYSAtRVNSQ0gg
cGF0aCB0aGF0IHVzZXMKPiBYRU5NRU1fYWNjZXNzX24gYXMgYWNjZXNzLgo+CgpZZWFwLCB0aGF0
IHNvdW5kcyBhcHByb3ByaWF0ZS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
