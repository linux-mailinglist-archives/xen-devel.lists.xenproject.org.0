Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9361835B1D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:19:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTv3-0002Pl-Mn; Wed, 05 Jun 2019 11:17:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYTv2-0002Pf-FT
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:17:24 +0000
X-Inumbo-ID: 7d81f236-8783-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7d81f236-8783-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 11:17:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91353374;
 Wed,  5 Jun 2019 04:17:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E66BC3F5AF;
 Wed,  5 Jun 2019 04:17:20 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-15-julien.grall@arm.com>
 <5CF7A268020000780023579B@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <94c12b25-b833-0a0f-2309-63f6dcce36a4@arm.com>
Date: Wed, 5 Jun 2019 12:17:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF7A268020000780023579B@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNS8wNi8yMDE5IDEyOjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwMy4w
Ni4xOSBhdCAxODowMywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gQXQgdGhlIG1v
bWVudCwgQXJtIGlzIHByb3ZpZGluZyBhIGR1bW15IGltcGxlbWVudGF0aW9uIGZvciB0aGUgTTJQ
Cj4+IGhlbHBlcnMgdXNlZCBpbiBjb21tb24gY29kZS4gSG93ZXZlciwgdGhleSBhcmUgcXVpdGUg
aXNvbGF0ZWQgYW5kIGNvdWxkCj4+IGJlIHVzZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlIGluIHRo
ZSBmdXR1cmUuIFNvIG1vdmUgYWxsIHRoZSBoZWxwZXJzIGluCj4+IHhlbi9tbS5oLgo+IAo+IEFu
ZCB3aGVyZSdzIHRoZSBwcm9ibGVtIHRoZW4gYWRkaW5nIC4uLgo+IAo+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vbW0uaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+PiBAQCAtNjU1LDQg
KzY1NSwxOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9wcml2aWxl
Z2VkX2d1ZXN0cygKPj4gICAgICAgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdChwYWdlLCBkb21f
eGVuLCBmbGFncyk7Cj4+ICAgfQo+PiAgIAo+PiArLyoKPj4gKyAqIER1bW15IGltcGxlbWVudGF0
aW9uIG9mIE0yUC1yZWxhdGVkIGhlbHBlcnMgZm9yIGNvbW1vbiBjb2RlIHdoZW4KPj4gKyAqIHRo
ZSBhcmNoaXRlY3R1cmUgZG9lc24ndCBoYXZlIGFuIE0yUC4KPj4gKyAqLwo+PiArI2lmbmRlZiBD
T05GSUdfSEFTX00yUAo+PiArCj4+ICsjZGVmaW5lIElOVkFMSURfTTJQX0VOVFJZICAgICAgICAo
fjBVTCkKPj4gKyNkZWZpbmUgU0hBUkVEX00yUF9FTlRSWSAgICAgICAgICh+MFVMIC0gMVVMKQo+
PiArI2RlZmluZSBTSEFSRURfTTJQKF9lKSAgICAgICAgICAgKChfZSkgPT0gU0hBUkVEX00yUF9F
TlRSWSkKPj4gKwo+PiArc3RhdGljIGlubGluZSB2b2lkIHNldF9wZm5fZnJvbV9tZm4obWZuX3Qg
bWZuLCB1bnNpZ25lZCBsb25nIHBmbikge30KPj4gKwo+PiArI2VuZGlmCj4gCj4gLi4uIG1mbl90
b19nbWZuKCkgdG8gdGhpcyBzZXQ/IFBlcmhhcHMgYSBkZWNsYXJhdGlvbiB3aXRob3V0IGFueQo+
IGRlZmluaXRpb24gYW55d2hlcmU/CgpUaGUgb25seSBwdXJwb3NlIGZvciB0aGlzIHdvdWxkIGJl
IHRvIG1ha2Ugc29tZSBjb2RlIGNvbXBpbGUgYW5kIGV4cGVjdCB0aGUgCmNvbXBpbGVyIHRvIHJl
bW92ZSBpdC4gU28gSSBhbSBub3QgaW4gZmF2b3Igb2YgZGVmaW5pbmcgbWZuX3RvX2dtZm4oKSBp
biBhbnkgCmZvcm0gZm9yIEFybS4KCj4gCj4gQWxzbyBwbGVhc2UgdGFrZSB0aGUgb3Bwb3J0dW5p
dHkgYW5kIGRyb3AgdGhlIHVubmVjZXNzYXJ5IHVuZGVyc2NvcmUKPiBmcm9tIF9lLiBBbmQgYWN0
dWFsbHksIHNob3VsZG4ndCB0aGlzIHVuaWZvcm1seSByZXR1cm4gZmFsc2U/IEF0IHdoaWNoCj4g
cG9pbnQgeW91IGRvbid0IGV2ZW4gbmVlZCBTSEFSRURfTTJQX0VOVFJZLgoKSSB0aG91Z2h0IGFi
b3V0IGl0LiBCdXQgSSB3YXNuJ3Qgc3VyZSBpZiB0aGVyZSB3b3VsZCBiZSBhbnkgaXNzdWUgd2l0
aCB0aGF0IAppbXBsZW1lbnRhdGlvbi4gSSBhbSBoYXBweSB0byBpbXBsZW1lbnQgU0hBUkVEX00y
UCB0aGlzIHdheS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
