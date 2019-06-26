Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F5857300
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 22:46:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgEm8-0000Vd-2m; Wed, 26 Jun 2019 20:44:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=udJa=UZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hgEm6-0000VY-Pu
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 20:44:14 +0000
X-Inumbo-ID: 27a595a7-9853-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27a595a7-9853-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 20:44:12 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 5mfBwzQ7TMfToUnsB+HCF2M42QMHy8dTJVK9YxsZYA+cOl7xpiiWItH9qbbViL27Qgeq+k3eWQ
 UAxG+H3pAWZwEpGd0COyHj+Nfj+qkN6kLdySpvUsLRCzgJPXQdc+SUYiMT+0M+M5mANQvojoTJ
 iiez5qwt6Kb3b9fsmqL6lhzFNbPE3R8zRjHKNKBouWhEdW2fwwO4sKErmylaaG0qmeZikf5rp0
 leZYj7jGRXKFn8GoTwtzl4nkg+tnsKDDdhkdhyq6S2K/b+HZ2aDGL/fmpJGGvLtTaR55sHJG2t
 DMk=
X-SBRS: 2.7
X-MesageID: 2290841
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,421,1557201600"; 
   d="scan'208";a="2290841"
To: <xen-devel@lists.xenproject.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261309000.5851@sstabellini-ThinkPad-T480s>
 <12426eb9-1545-b1f7-a85a-55c9e04b8cc4@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <86de69b7-b18c-1285-de94-89f18137ca0f@citrix.com>
Date: Wed, 26 Jun 2019 21:44:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <12426eb9-1545-b1f7-a85a-55c9e04b8cc4@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 14/17] xen/arm64: head: Remove ID map as
 soon as it is not used
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDYvMjAxOSAyMTozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDYvMjYvMTkgOToy
NSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBNb24sIDEwIEp1biAyMDE5LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBUaGUgSUQgbWFwIG1heSBjbGFzaCB3aXRoIG90aGVyIHBh
cnRzIG9mIHRoZSBYZW4gdmlydHVhbCBtZW1vcnkgbGF5b3V0Lgo+Pj4gQXQgdGhlIG1vbWVudCwg
WGVuIGlzIGhhbmRsaW5nIHRoZSBjbGFzaCBieSBvbmx5IGNyZWF0aW5nIGEgbWFwcGluZyB0bwo+
Pj4gdGhlIHJ1bnRpbWUgdmlydHVhbCBhZGRyZXNzIGJlZm9yZSBlbmFibGluZyB0aGUgTU1VLgo+
Pj4KPj4+IFRoZSByZXN0IG9mIHRoZSBtYXBwaW5ncyAoc3VjaCBhcyB0aGUgZml4bWFwKSB3aWxs
IGJlIG1hcHBlZCBhZnRlciB0aGUKPj4+IE1NVSBpcyBlbmFibGVkLiBIb3dldmVyLCB0aGUgY29k
ZSBkb2luZyB0aGUgbWFwcGluZyBpcyBub3Qgc2FmZSBhcyBpdAo+Pj4gcmVwbGFjZSBtYXBwaW5n
IHdpdGhvdXQgdXNpbmcgdGhlIEJyZWFrLUJlZm9yZS1NYWtlIHNlcXVlbmNlLgo+Pj4KPj4+IEFz
IHRoZSBJRCBtYXAgY2FuIGJlIGFueXdoZXJlIGluIHRoZSBtZW1vcnksIGl0IGlzIGVhc2llciB0
byByZW1vdmUgYWxsCj4+PiB0aGUgZW50cmllcyBhZGRlZCBhcyBzb29uIGFzIHRoZSBJRCBtYXAg
aXMgbm90IHVzZWQgcmF0aGVyIHRoYW4gYWRkaW5nCj4+PiB0aGUgQnJlYWstQmVmb3JlLU1ha2Ug
c2VxdWVuY2UgZXZlcnl3aGVyZS4KPj4KPj4gSSB0aGluayBpdCBpcyBhIGdvb2QgaWRlYSwgYnV0
IEkgd291bGQgYXNrIHlvdSB0byBtZW50aW9uIDE6MSBtYXAKPj4gaW5zdGVhZCBvZiAiSUQgbWFw
IiBpbiBjb21tZW50cyBhbmQgY29tbWl0IG1lc3NhZ2VzIGJlY2F1c2UgdGhhdCBpcyB0aGUKPj4g
d29yZGluZyB3ZSB1c2VkIGluIGFsbCBjb21tZW50cyBzbyBmYXIgKHNlZSB0aGUgb25lIGluCj4+
IGNyZWF0ZV9wYWdlX3RhYmxlcyBhbmQgbW0uYykuIEl0IGlzIGVhc2llciB0byBncmVwIGFuZCBy
ZWZlciB0byBpZiB3ZQo+PiB1c2UgdGhlIHNhbWUgbm9tZW5jbGF0dXJlLiBOb3RlIHRoYXQgSSBk
b24ndCBjYXJlIGFib3V0IHdoaWNoCj4+IG5vbWVuY2xhdHVyZSB3ZSBkZWNpZGUgdG8gdXNlLCBJ
IGFtIG9ubHkgYXNraW5nIGZvciBjb25zaXN0ZW5jeS4KPj4gT3RoZXJ3aXNlLCBpdCB3b3VsZCBh
bHNvIHdvcmsgaWYgeW91IHNheSBpdCBib3RoIHdheSBhdCBsZWFzdCBvbmNlOgo+Pgo+PiDCoCBU
aGUgSUQgbWFwICgxOjEgbWFwKSBtYXkgY2xhc2ggWy4uLl0KPgo+IEkgd291bGQgcmF0aGVyIGRy
b3AgdGhlIHdvcmRpbmcgMToxIGFzIHRoaXMgaXMgY29uZnVzaW5nLiBJdCBpcyBhbHNvCj4gbm90
IHRyaXZpYWwgdG8gZmluZCBhbnl0aGluZyBvbiBnb29nbGUgdHlwaW5nICIxOjEiLgoKIm9uZS10
by1vbmUgbWFwcGluZyIsIG9yICJpZGVudGl0eSBtYXAiIGFyZSBib3RoIGNvbW1vbiB0ZXJtaW5v
bG9neS7CoAoxOjEgaXMgYSBjb21tb24gcmVwcmVzZW50YXRpb24gZm9yIHRoZSBmb3JtZXIsIHdo
ZXJlYXMgSUQgaXMgbm90IGEKYWJicmV2aWF0aW9uIG9mICJJZGVudGl0eSIuCgpJZiB5b3UgZG9u
J3Qgd2FudCB0byB1c2UgMToxLCB0aGVuIHlvdSBuZWVkIHRvIHNheSAiVGhlIGlkZW50aXR5IG1h
cCIgdG8KcmV0YWluIGNsYXJpdHkuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
