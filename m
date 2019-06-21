Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601704E0B0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 08:58:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heDSI-0001zm-BZ; Fri, 21 Jun 2019 06:55:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heDSG-0001zh-WE
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 06:55:25 +0000
X-Inumbo-ID: 8a91302b-93f1-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a91302b-93f1-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 06:55:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 00:55:22 -0600
Message-Id: <5D0C7F560200007800239F35@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 00:55:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B86D9020000780021F2C1@prv1-mh.provo.novell.com>
 <90fef86b-68bb-8116-6be4-6778ffe0a366@citrix.com>
In-Reply-To: <90fef86b-68bb-8116-6be4-6778ffe0a366@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 43/50] x86emul: support AVX512_VNNI insns
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDE3OjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jCj4+IEBAIC00NzksNyArNDc5LDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBleHQwZjM4X3RhYmxlIHsKPj4gICAgICBbMHg0ZF0gPSB7IC5zaW1kX3Np
emUgPSBzaW1kX3NjYWxhcl92ZXh3LCAuZDhzID0gZDhzX2RxIH0sCj4+ICAgICAgWzB4NGVdID0g
eyAuc2ltZF9zaXplID0gc2ltZF9wYWNrZWRfZnAsIC50d29fb3AgPSAxLCAuZDhzID0gZDhzX3Zs
IH0sCj4+ICAgICAgWzB4NGZdID0geyAuc2ltZF9zaXplID0gc2ltZF9zY2FsYXJfdmV4dywgLmQ4
cyA9IGQ4c19kcSB9LAo+PiAtICAgIFsweDUyIC4uLiAweDUzXSA9IHsgLnNpbWRfc2l6ZSA9IHNp
bWRfMTI4LCAuZDhzID0gNCB9LAo+PiArICAgIFsweDUwIC4uLiAweDUzXSA9IHsgLnNpbWRfc2l6
ZSA9IHNpbWRfcGFja2VkX2ludCwgLmQ4cyA9IGQ4c192bCB9LAo+IAo+IEhhbmcgb24gLSBpcyB0
aGUgcHJldmlvdXMgcGF0Y2ggY29ycmVjdD8gIFNob3VsZG4ndCBpdCBoYXZlCj4gc2ltZF9wYWNr
ZWRfaW50L2Q4c192bCBmcm9tIHRoZSBnZXRnbz8KClllcywgaXQgaXMuIFRoZSBzaXR1YXRpb24g
aGVyZSBpcyB0aGUgb3Bwb3NpdGUgdG8gd2hhdCB3ZSBoYXZlIHdpdGgKNEZNQVBTOiBUaGUgc3Bl
Y2lhbCBGMi1wcmVmaXhlZCBlbmNvZGluZyBnZXRzIGludHJvZHVjZWQgZmlyc3QKKHByZXZpb3Vz
IHBhdGNoKSwgYW5kIGdldHMgY29udmVydGVkIHRvIGEgZGVjb2RlIHNwZWNpYWwgY2FzZQpoZXJl
IChmb3IgY29uc2lzdGVuY3kgc3VjaCB0aGF0IHRoZSAibm9ybWFsIiA2Ni1wcmVmaXhlZCBvcGVy
YW5kCmNoYXJhY3RlcmlzdGljcyBhcHBlYXIgaW4gdGhlIHRhYmxlLgoKPj4gQEAgLTMyMTEsNiAr
MzIxMiw4IEBAIHg4Nl9kZWNvZGUoCj4+ICAKPj4gICAgICAgICAgICAgICAgICBzd2l0Y2ggKCBi
ICkKPj4gICAgICAgICAgICAgICAgICB7Cj4+ICsgICAgICAgICAgICAgICAgLyogdnA0ZHB3c3Nk
eyxzfSBuZWVkIHNwZWNpYWwgY2FzaW5nICovCj4gCj4gU3BlY2lhbCBjYXNlcyBzaG91bGQgYmUg
ZGlzY3Vzc2VkLgoKSSdsbCBjbG9uZSB3aGF0IEkndmUgYWRkZWQgdG8gdGhlIDRGTUFQUyBwYXRj
aC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
