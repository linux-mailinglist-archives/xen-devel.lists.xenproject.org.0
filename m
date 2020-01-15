Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE813BDC5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:51:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irgDe-000502-MT; Wed, 15 Jan 2020 10:48:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jRQ3=3E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1irgDd-0004zx-D9
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 10:48:13 +0000
X-Inumbo-ID: 6aa6ce78-3784-11ea-ac27-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aa6ce78-3784-11ea-ac27-bc764e2007e4;
 Wed, 15 Jan 2020 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579085247;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ij+hBslatPt4p1FJp8/UWgXXaiumWTGdBTccc410/Js=;
 b=edsv1DUB3Hxch5LbDteonRONoh6xMZk5klvJpCwnMHPCVlSHFAJOXT5s
 yAqMUDyZQiy9O9DFa91fToRyJkb/sTs8MXVHWgJpToTt2fJbCCudlSz/M
 gsVNQ+vd6rRyFnyT5bPNJq7FrkEaopJzB9fuDAtZ7kSt8qpeL/1eHFFCZ A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AFWKu8BIHD215xRu7S86kaALL8ZSyMB6MgQx/ZkcY001TjufUMZsajz2h8SnhJUyI24a/CRoBb
 1OcEP88m0PLY8RDgjaB6WJLfpzWEKVheAVQo9LLuFCA/0DRTA4MHBgJgTbqkT443dyV05XLw/+
 QduI4RRjBDCKhbWrl+8BUsQzqtnFhdH9mZoZByLgz+LtrRayz1EwrT07QcgghRufCyu+h7sWlE
 9vpssPsPqWJnZuJdIuTu6EOEvRfxX9TG3li8ZMSKbXrzi4GhW6IGtsqhvO8vwnJmymsT3PDVFg
 VCU=
X-SBRS: 2.7
X-MesageID: 10951109
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,322,1574139600"; d="scan'208";a="10951109"
To: Lars Kurth <lars.kurth@citrix.com>, Lars Kurth <lars.kurth@xenproject.org>
References: <cover.1577733361.git.lars.kurth@citrix.com>
 <2d005116379febe0e6cfe0ea32792eb90bc74f9d.1577733361.git.lars.kurth@citrix.com>
 <B1A02147-899C-4A5E-BAF8-193A05F7B60C@citrix.com>
 <8FA8F918-1B5B-40D5-93B6-0706FFB3F436@citrix.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <9521b7b2-434a-defc-a327-6fe214075c5c@citrix.com>
Date: Wed, 15 Jan 2020 10:47:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8FA8F918-1B5B-40D5-93B6-0706FFB3F436@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/7] Add guide on Communication Best
 Practice
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xMy8yMCA5OjIxIFBNLCBMYXJzIEt1cnRoIHdyb3RlOgo+IAo+IAo+IO+7v09uIDEzLzAx
LzIwMjAsIDE5OjU0LCAiR2VvcmdlIER1bmxhcCIgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT4g
d3JvdGU6Cj4gCj4gICAgIAo+ICAgICA+IE9uIERlYyAzMCwgMjAxOSwgYXQgNzozMiBQTSwgTGFy
cyBLdXJ0aCA8bGFycy5rdXJ0aEB4ZW5wcm9qZWN0Lm9yZz4gd3JvdGU6Cj4gICAgID4gCj4gICAg
ID4gRnJvbTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+ICAgICA+IAo+ICAg
ICA+IFRoaXMgZ3VpZGUgY292ZXJzIHRoZSBidWxrIG9uIEJlc3QgUHJhY3RpY2UgcmVsYXRlZCB0
byBjb2RlIHJldmlldwo+ICAgICA+IEl0IHByaW1hcmlseSBmb2N1c3NlcyBvbiBjb2RlIHJldmll
dyBpbnRlcmFjdGlvbnMKPiAgICAgPiBJdCBhbHNvIGNvdmVycyBob3cgdG8gZGVhbCB3aXRoIE1p
c3VuZGVyc3RhbmRpbmdzIGFuZCBDdWx0dXJhbAo+ICAgICA+IERpZmZlcmVuY2VzCj4gICAgID4g
Cj4gICAgID4gKyMjIyBBdm9pZCBvcGluaW9uOiBzdGljayB0byB0aGUgZmFjdHMKPiAgICAgCj4g
ICAgIEluIG15IHRhbGsgb24gdGhpcyBzdWJqZWN0IEkgc2FpZCDigJxBdm9pZCAqaW5mbGFtbWF0
b3J5IGxhbmd1YWdlKuKAnS4gIEF0IHNvbWUgbGV2ZWwgaXTigJlzIGdvb2QgdG8gaGF2ZSBzdHJv
bmcgb3BpbmlvbnMgb24gd2hhdCBjb2RlIHNob3VsZCBsb29rIGxpa2UuICBJdOKAmXMgbm90IG9w
aW5pb25zIHRoYXQgYXJlIGEgcHJvYmxlbSwgb3IgZXZlbiBleHByZXNzaW5nIG9waW5pb25zLCBi
dXQgZXhwcmVzc2luZyB0aGVtIGluIGEgcHJvdm9jYXRpdmUgb3IgaW5mbGFtbWF0b3J5IHdheS4K
PiAKPiBMZXQgbWUgbG9vayBhdCB0aGlzIGFnYWluOiBJIGRvbid0IGZlZWwgc3Ryb25nbHkgYWJv
dXQgaXQKPiAKPiBJIGNoYW5nZWQgdGhlIHRpdGxlIGJlY2F1c2UgSSBmZWx0IHRoYXQgdGhlIGJ1
bGsgb2YgdGhlIAo+IGV4YW1wbGUgaXMgYWN0dWFsbHkgYWJvdXQgc3RpY2tpbmcgdG8gdGhlIGZh
Y3RzIGFuIG9waW5pb24gCj4gYW5kIHRoZSBpbmZsYW1tYXRvcnkgZWxlbWVudCB3YXMgc2Vjb25k
YXJ5LiBTbyBpdCBmZWx0IG1vcmUKPiBuYXR1cmFsIHRvIG1lIHRvIGNoYW5nZSB0aGUgdGl0bGUu
CgpSaWdodDsgdGhlIHBvaW50IHRob3VnaCBzcGVjaWZpY2FsbHkgaXMgdGhhdCBwZW9wbGUncyBu
YXR1cmFsLCBhbmQKcHJvYmFibHkgaGVhbHRoeSByZXNwb25zZSB0byBwb29ybHktd3JpdHRlbiBj
b2RlLCBvciB0bwppbmNvbnNpZGVyYXRlbHktd3JpdHRlbiBwYXRjaCBzZXJpZXMgaW4gYW55IHdh
eSwgaXMgdG8gdXNlIGNoYXJnZWQKbGFuZ3VhZ2UuICBJIHdvdWxkbid0IGNhbGwgYW55IGNvZGUg
ImdhcmJhZ2UiLCBidXQgY29kZSBzdWJtaXR0ZWQgaXMKc29tZXRpbWVzIGFjdHVhbGx5IHRlcnJp
YmxlLCBmcmFnaWxlLCBzcGFnaGV0dGksIGluZWZmaWNpZW50LCByYWN5LAptZXNzeSAtLSB3aGF0
ZXZlciBiYWQgdGhpbmdzIHlvdSBjYW4gc2F5IGFib3V0IGl0IC0tIGFuZCBhbnkKd2VsbC10cmFp
bmVkIGRldmVsb3BlciB3aWxsIGhhdmUgdGhlIHNhbWUgb3Bpbmlvbi4KCkl0J3Mgbm90IGEgcHJv
YmxlbSBhdCBhbGwgdG8gaGF2ZSBvcGluaW9ucyBvbiBjb2RlOyBJIHRoaW5rIHRoYXQncyBhCnBy
ZXJlcXVpc2l0ZSBmb3IgYmVpbmcgYSBnb29kIGRldmVsb3Blci4gIEl0J3MgYWxzbyBub3QgYSBw
cm9ibGVtIGF0IGFsbAp0byBzYXksICJUaGlzIGNvZGUgaXMgZ3JlYXQiIG9yIHNvbWV0aGluZyBw
b3NpdGl2ZSBhYm91dCB0aGUgc3VibWl0dGVyOwpub3IgaXMgaXQgYSBwcm9ibGVtIHRvIHRhbGsg
KnRvZ2V0aGVyKiBhYm91dCBzb21ldGhpbmcgbm90IHdyaXR0ZW4gYnkKdGhlIHN1Ym1pdHRlciAo
IldvdywgdGhpcyBjb2RlIHlvdSdyZSB0cnlpbmcgdG8gZml4IGlzIGEgbWVzcy4iKSAgVGhlCnBv
aW50IHNwZWNpZmljYWxseSBpcyB0byBhdm9pZCB0aGluZ3Mgd2hpY2ggYXJlIGxpa2VseSB0byBw
cm92b2tlIGEKbmVnYXRpdmUgZW1vdGlvbmFsIHJlc3BvbnNlIGluIHRoZSBzdWJtaXR0ZXIuCgo+
IEJ1dCB0aGVuIGxvb2tpbmcgYXQgdGhlIGRlZmluaXRpb24gb2YgaW5mbGFtbWF0b3J5IGxhbmd1
YWdlLAo+IGFrYSAgImFuIGluZmxhbW1hdG9yeSBxdWVzdGlvbiBvciBhbiBpbmZsYW1tYXRvcnkg
c3RhdGVtZW50Cj4gd291bGQgYmUgb25lIHdoaWNoIHdvdWxkIHNvbWVob3cgcHJlZGlzcG9zZSB0
aGUgbGlzdGVuZXJzCj4gdG93YXJkcyBhIHN1YmplY3QgaW4gYW4gdW5yZWFzb25hYmxlLCBwcmVq
dWRpY2VkIHdheS4iCj4gSXQgaXMgY2xlYXJseSBhbHNvIHRydWUgdGhhdCB0aGUgZXhhbXBsZSBp
cyBpbmZsYW1tYXRvcnkuCj4gCj4gSSB0aGluayBJIG1heSBoYXZlIHRyaXBwZWQgb3ZlciBhbiBh
cmVhIHdoZXJlIHRoZXJlIGlzIG5vIGdvb2QKPiBsYW5ndWFnZSBtYXRjaDogdGhlIEdlcm1hbiB0
cmFuc2xhdGlvbnMgb2YgaW5mbGFtbWF0b3J5Cj4gYXVmcsO8aHJlcmlzY2ggJiBhdWZ3aWVnbGVy
aXNjaCBoYXZlIGFuIGVsZW1lbnQgb2YgcmViZWxsaW9uCj4gYW5kIG1pc2NoaWVmIHRvIHRoZW0g
KGF0IGxlYXN0IHdoZW4gSSBncmV3IHVwKS4KCiJQcm92b2NhdGl2ZSI/ICJjaGFyZ2VkIj8gImxv
YWRlZCI/ICAiZGVyb2dhdG9yeSI/ICJjb250ZW1wdHVvdXMiPwoKPiBJIGFtIHdvbmRlcmluZyB0
aG91Z2gsIHdoZXRoZXIgaXQgaXMgbmVjZXNzYXJ5IHRvIGluY2x1ZGUgCj4gYSBkZWZpbml0aW9u
IG9mIGFuIGluZmxhbW1hdG9yeSBxdWVzdGlvbiBvciBhbiBpbmZsYW1tYXRvcnkKPiBzdGF0ZW1l
bnQgaWYgd2Ugc3RpY2sgd2l0aCBpdCBpbiB0aGUgdGl0bGUKCkkgdGhpbmsgcGVvcGxlIHNob3Vs
ZCBiZSBhYmxlIHRvIHBpY2sgdXAgd2hhdCB3ZSBtZWFuIGZyb20gdGhlIHJlYXNvbmluZwphbmQg
ZnJvbSB0aGUgZXhhbXBsZXMuCgogLUdlb3JnZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
