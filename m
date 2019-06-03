Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0978332AE5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 10:32:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXiLC-0004ht-7S; Mon, 03 Jun 2019 08:29:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXiLB-0004hn-5L
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 08:29:13 +0000
X-Inumbo-ID: a99fd87b-85d9-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a99fd87b-85d9-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 08:29:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 02:29:10 -0600
Message-Id: <5CF4DA5102000078002346DF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 02:29:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
 <a30a6fc9-5c3c-081b-d268-231e89f135be@citrix.com>
 <5CF14F650200007800234123@prv1-mh.provo.novell.com>
 <f6744ab2-896d-e44d-8b1c-c6a77c456b51@citrix.com>
In-Reply-To: <f6744ab2-896d-e44d-8b1c-c6a77c456b51@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] adjust special domain creation (and
 call it earlier on x86)
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDE4OjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAwODo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Cj4+Pj4gKyNp
ZmRlZiBDT05GSUdfSEFTX1BDSQo+Pj4+ICsgICAgSU5JVF9MSVNUX0hFQUQoJmRvbV94ZW4tPmFy
Y2gucGRldl9saXN0KTsKPj4+PiArI2VuZGlmCj4+PiBUaGUgcG9zaXRpb24gb2YgdGhpcyBpZGVu
dGlmaWVzIHRoYXQgd2UndmUgZ290IG9idmlvdXNseSBnb3QgYnVncwo+Pj4gKHBlcmhhcHMgbGF0
ZW50KSBlbHNld2hlcmUsIHNlZWluZyBhcyBvdGhlciBzcGVjaWFsIGRvbWFpbnMgZG9uJ3QgZ2V0
Cj4+PiB3b3JraW5nIGNvbnN0cnVjdHMgc3VjaCBhcyBsaXN0X2VtcHR5KCkuCj4+Pgo+Pj4gSW4g
dGhlIGNvZGUgd2hpY2ggY3VycmVudGx5IGV4aXN0cywgSSBjYW4ndCBzcG90IGl0IGV2ZXIgYmVp
bmcgdG91Y2hlZAo+Pj4gZm9yIEFSTSwgYnV0IGl0IGlzIGNvbnN0cnVjdGVkIGZvciBhbGwgbm9u
LXNwZWNpYWwgeDg2IGd1ZXN0cyBhdCB0aGUgdG9wCj4+PiBvZiBhcmNoX2RvbWFpbl9jcmVhdGUo
KS4KPj4+Cj4+PiBJIHRoaW5rIHRoZSBiZXN0IG9wdGlvbiwgZ2l2ZW4gdGhlICNpZmRlZiBoZXJl
LCBpcyB0byByZXBvc2l0aW9uIHRoZQo+Pj4gcGRldiBmaWVsZHMgaW50byBzdHJ1Y3QgZG9tYWlu
LCByYXRoZXIgdGhhbiBhcmNoX2RvbWFpbiwgYW5kIGhhdmUgdGhpcwo+Pj4gY29kZSBmcmFnbWVu
dCBuZWFyIHRoZSB0b3Agb2YgZG9tYWluX2NyZWF0ZSgpIHdoZXJlIHNwZWNpYWwgZG9tYWlucyB3
aWxsCj4+PiBhbGwgYmUgY292ZXJlZC4KPj4gRXhjZXB0IHRoYXQgaWYgSSBkbyB0aGlzLCB0aGVu
IG5vdCBieSBzcGVjaWFsIGNhc2luZyBzcGVjaWFsIGRvbWFpbnMuCj4gCj4gV2hhdCBzcGVjaWFs
IGNhc2luZz8gIFRoZXJlIGlzIGEgYmxvY2sgb2YgY29kZSBuZWFyIHRoZSBzdGFydCBvZgo+IGRv
bWFpbl9jcmVhdGUoKSB3aGljaCBpcyBydW4gZm9yIGFsbCBkb21haW4sIGluY2x1ZGluZyBzcGVj
aWFsIG9uZXMuCgpPaCwgcGVyaGFwcyBhIG1pc3VuZGVyc3RhbmRpbmcgb24gbXkgcGFydCB0aGVu
LCBhcyB5b3Ugd2VyZQpzYXlpbmcgIndoZXJlIHNwZWNpYWwgZG9tYWlucyB3aWxsIGFsbCBiZSBj
b3ZlcmVkIiwgd2l0aG91dCBhbHNvCm1lbnRpb25pbmcgbm9uLXNwZWNpYWwgb25lcy4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
