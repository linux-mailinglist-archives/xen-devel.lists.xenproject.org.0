Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1A3778B
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 17:13:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYu20-0002WN-HI; Thu, 06 Jun 2019 15:10:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYu1y-0002WH-Mx
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 15:10:18 +0000
X-Inumbo-ID: 3169b090-886d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3169b090-886d-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 15:10:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CF11A78;
 Thu,  6 Jun 2019 08:10:17 -0700 (PDT)
Received: from [10.1.38.31] (iphone-de-raul.cambridge.arm.com [10.1.38.31])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6678E3F5AF;
 Thu,  6 Jun 2019 08:10:15 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
 <20190603220245.22750-3-sstabellini@kernel.org>
 <5CF616110200007800234E4D@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8aa38d48-3479-ead8-f540-dca6294e98bb@arm.com>
Date: Thu, 6 Jun 2019 16:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF616110200007800234E4D@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNi80LzE5IDc6NTYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0
LjA2LjE5IGF0IDAwOjAyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IC0tLSBh
L3hlbi9hcmNoL2FybS9zZXR1cC5jCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4+IEBA
IC00ODIsNyArNDgyLDE0IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3BkeCh2b2lkKQo+PiAg
IHsKPj4gICAgICAgcGFkZHJfdCBiYW5rX3N0YXJ0LCBiYW5rX3NpemUsIGJhbmtfZW5kOwo+PiAg
IAo+PiAtICAgIHU2NCBtYXNrID0gcGR4X2luaXRfbWFzayhib290aW5mby5tZW0uYmFua1swXS5z
dGFydCk7Cj4+ICsgICAgLyoKPj4gKyAgICAgKiBBcm0gZG9lcyBub3QgaGF2ZSBhbnkgcmVzdHJp
Y3Rpb25zIG9uIHRoZSBiaXRzIHRvIGNvbXByZXNzLiBQYXNzIDAgdG8KPj4gKyAgICAgKiBsZXQg
dGhlIGNvbW1vbiBjb2RlIGZ1cnRoZXIgcmVzdHJpY3QgdGhlIG1hc2suCj4+ICsgICAgICoKPj4g
KyAgICAgKiBJZiB0aGUgbG9naWMgY2hhbmdlcyBpbiBwZm5fcGR4X2hvbGVfc2V0dXAgd2UgbWln
aHQgaGF2ZSB0bwo+PiArICAgICAqIHVwZGF0ZSB0aGlzIGZ1bmN0aW9uIHRvby4KPj4gKyAgICAg
Ki8KPj4gKyAgICB1NjQgbWFzayA9IHBkeF9pbml0X21hc2soMHgwKTsKPiAKPiBTZWVpbmcgSnVs
aWVuJ3MgY2xhcmlmaWNhdGlvbiBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbidzIGRpc2N1c3Npb24s
Cj4gaG93IGFib3V0IHN3aXRjaGluZyB0aGlzIG9uZSB0byB1aW50NjRfdCBhcyB3ZWxsIGF0IHRo
aXMgb2NjYXNpb24/Cj4gCj4+IC0tLSBhL3hlbi9jb21tb24vcGR4LmMKPj4gKysrIGIveGVuL2Nv
bW1vbi9wZHguYwo+PiBAQCAtNTAsOSArNTAsMTIgQEAgc3RhdGljIHU2NCBfX2luaXQgZmlsbF9t
YXNrKHU2NCBtYXNrKQo+PiAgICAgICByZXR1cm4gbWFzazsKPj4gICB9Cj4+ICAgCj4+ICsvKgo+
PiArICogV2UgZG9uJ3QgY29tcHJlc3MgdGhlIGZpcnN0IE1BWF9PUkRFUiBiaXQgb2YgdGhlIGFk
ZHJlc3Nlcy4KPj4gKyAqLwo+IAo+IFRoaXMgaXMgYSBzaW5nbGUgbGluZSBjb21tZW50Lgo+IAo+
PiAgIHU2NCBfX2luaXQgcGR4X2luaXRfbWFzayh1NjQgYmFzZV9hZGRyKQo+IAo+IEl0IHdvdWxk
bid0IGhhbXBlciBwYXRjaCByZWFkYWJpbGl0eSBtdWNoIGlmIGV2ZW4gdGhpcyBvbmUgd2FzCj4g
c3dpdGNoZWQgdG8gdWludDY0X3QgYXQgdGhlIHNhbWUgdGltZSwgdGh1cyByZXN0b3JpbmcgY29u
c2lzdGVuY3kKPiB3aXRoIC4uLgoKT24gQXJtIHdlIGRvbid0IHRlbmQgdG8gbWl4IGNsZWFuLXVw
IGFuZCBmaXguIEl0IHdvdWxkIGJlIHByZWZlcmFibGUgaWYgCnRoZSBzd2l0Y2ggdG8gdWludDY0
X3QgaXMgZG9uZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
