Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18719E60
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:40:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5jN-00057L-KK; Fri, 10 May 2019 13:38:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5jL-00057D-G4
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:38:31 +0000
X-Inumbo-ID: e5a07d04-7328-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e5a07d04-7328-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:38:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B71C7A78;
 Fri, 10 May 2019 06:38:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B3653F575;
 Fri, 10 May 2019 06:38:28 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-15-julien.grall@arm.com>
 <5CD57C6F020000780022D8BC@prv1-mh.provo.novell.com>
 <8e10cc12-d9be-3891-fae9-501ab9a69019@arm.com>
 <5CD57E98020000780022D914@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7bcfb193-6859-d2b6-a145-2a806563cd9b@arm.com>
Date: Fri, 10 May 2019 14:38:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD57E98020000780022D914@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 14/14] xen/mm: Provide dummy M2P-related
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8wNS8yMDE5IDE0OjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMC4wNS4x
OSBhdCAxNToyOSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMTAvMDUvMjAx
OSAxNDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwNy4wNS4xOSBhdCAxNzoxNCwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
bW0uaAo+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4+Pj4gQEAgLTY1OCw0ICs2NTgs
MTggQEAgc3RhdGljIGlubGluZSB2b2lkIHNoYXJlX3hlbl9wYWdlX3dpdGhfcHJpdmlsZWdlZF9n
dWVzdHMoCj4+Pj4gICAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGFnZSwgZG9tX3hl
biwgZmxhZ3MpOwo+Pj4+ICAgIH0KPj4+PiAgICAKPj4+PiArLyoKPj4+PiArICogRHVtbXkgaW1w
bGVtZW50YXRpb24gb2YgTTJQLXJlbGF0ZWQgaGVscGVycyBmb3IgY29tbW9uIGNvZGUgd2hlbgo+
Pj4+ICsgKiB0aGUgYXJjaGl0ZWN0dXJlIGRvZXNuJ3QgaGF2ZSBhbiBNMlAuCj4+Pj4gKyAqLwo+
Pj4+ICsjaWZuZGVmIENPTkZJR19IQVNfTTJQCj4+Pj4gKwo+Pj4+ICsjZGVmaW5lIElOVkFMSURf
TTJQX0VOVFJZICAgICAgICAofjBVTCkKPj4+PiArI2RlZmluZSBTSEFSRURfTTJQX0VOVFJZICAg
ICAgICAgKH4wVUwgLSAxVUwpCj4+Pj4gKyNkZWZpbmUgU0hBUkVEX00yUChfZSkgICAgICAgICAg
ICgoX2UpID09IFNIQVJFRF9NMlBfRU5UUlkpCj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW5saW5lIHZv
aWQgc2V0X3Bmbl9mcm9tX21mbihtZm5fdCBtZm4sIHVuc2lnbmVkIGxvbmcgcGZuKSB7fQo+Pj4+
ICsKPj4+PiArI2VuZGlmCj4+Pgo+Pj4gSW4gb3JkZXIgZm9yIHRoaW5ncyB0byBub3QgYmUgc2Nh
dHRlcmVkIGFyb3VuZCwgY291bGQKPj4+IGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oKSAoc2VlIHBh
dGNoIDkpIG1vdmUgaGVyZT8gSXQgZG9lc24ndAo+Pj4gbG9vayBhcyBpZiB0aGlzIHdvdWxkIGNh
dXNlIGEgYnVpbGQgaXNzdWUuCj4+Cj4+IFRoZSB0d28gYXJlIGRpZmZlcmVudCwgb25lIGRlYWwg
d2l0aCBtZW1vcnksIHRoZSBvdGhlciB3aXRoIGEgZG9tYWluLiBTbyB0aGUKPj4gY3VycmVudCBz
cGxpdCBtYWtlcyBzZW5zZS4KPiAKPiBXZWxsLCB0aGF0J3Mgb25lIHBlcnNwZWN0aXZlIHRvIHRh
a2UuIFRoZSBvdGhlciBpcyB0aGF0IGl0J3MgbW0gdG8gb2J0YWluCj4gYSBzcGVjaWZpYyBvdGhl
ciBmb3JtIG9mIGEgZ2l2ZW4gYWRkcmVzcy4KSXQgaXMganVzdCBhbiBpbXBsZW1lbnRhdGlvbiBk
ZXRhaWwuIElmIEkgZm9sbG93IHlvdXIgdmlldywgd2Ugd291bGQgaGF2ZSBhIApzaW5nbGUgaGVh
ZGVyIGZvciBldmVyeXRoaW5nIHVuZGVyIHRoZSBzYW1lICNpZmRlZi4uLgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
