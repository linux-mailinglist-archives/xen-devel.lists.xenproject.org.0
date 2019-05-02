Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34894116B4
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 11:44:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM8ES-0007pR-Vg; Thu, 02 May 2019 09:42:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72Dm=TC=twosheds.srs.infradead.org=batv+f87737d5a47df5c408bc+5730+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1hM8ER-0007pM-Ff
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 09:42:23 +0000
X-Inumbo-ID: 94cffe09-6cbe-11e9-843c-bc764e045a96
Received: from twosheds.infradead.org (unknown
 [2001:8b0:10b:1:21d:7dff:fe04:dbe2])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 94cffe09-6cbe-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=twosheds.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jxk65QryBX0CCvIFxJ61Y7IJiY2kJ16zN66dllwc+vQ=; b=I3qADskPA1ZtsflcPE+72wtkF
 iqgkpnw/fYLfgQ5rOfIHIF37CsClwVXqHSAq+JoGRNVzwAKu/RjAIK+pRxptlweKZ6gW74VfakJeU
 saRrvpTQl65BZCjVKbRqx4tZrZzH/GhwtQTd0yezuNk/8yG/wofVybmdYdVQj/DJ5UGyQNZ4cOYWG
 dIhTRPD+XQ6c8OR4HONtALce9OImxDBAJPj9cLWSJBo+39yPwW/cEdll1sG+Gr4/KpHmgJoJ7RO69
 5+apnluSPdOuEsy3h1vEVVFmC9fTNniUmf/oMzvdcVccT00yp6d/kngFOduYO8xQ5/rSjACSjfOeP
 Zv4xIZAKw==;
Received: from localhost ([127.0.0.1] helo=twosheds.infradead.org)
 by twosheds.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM8EH-004RaI-Pi; Thu, 02 May 2019 09:42:14 +0000
Received: from 213.205.242.27 (SquirrelMail authenticated user dwmw2)
 by twosheds.infradead.org with HTTP; Thu, 2 May 2019 09:42:14 -0000
Message-ID: <c4a03e5ed0c15fece35a47806c5a1e9e.squirrel@twosheds.infradead.org>
In-Reply-To: <5a327ee0-58cd-6526-b3e1-3bda2b71a230@citrix.com>
References: <cover.1556708225.git.dwmw2@infradead.org>
 <c252e7b1f675f5fb0df9c0c90423fc7fc0bc5736.1556708226.git.dwmw2@infradead.org>
 <5CCAA6ED020000780022B0AA@prv1-mh.provo.novell.com>
 <5a327ee0-58cd-6526-b3e1-3bda2b71a230@citrix.com>
Date: Thu, 2 May 2019 09:42:14 -0000
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
User-Agent: SquirrelMail/1.4.22-21.fc27
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 twosheds.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [RFC PATCH 2/7] x86/boot: Remove gratuitous call
 back into low-memory code
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMDIvMDUvMjAxOSAwOToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAxLjA1
LjE5IGF0IDEzOjE3LCA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4+PiBXZSBhcHBlYXIg
dG8gaGF2ZSBpbXBsZW1lbnRlZCBhIG1lbWNweSgpIGluIHRoZSBsb3ctbWVtb3J5IHRyYW1wb2xp
bmUKPj4+IHdoaWNoIHdlIHRoZW4gY2FsbCBpbnRvIGZyb20gX19zdGFydF94ZW4oKSwgZm9yIG5v
IGFkZXF1YXRlbHkgZGVmaW5lZAo+Pj4gcmVhc29uLgo+PiBNYXkgSSBzdWdnZXN0IHRoYXQgaW4g
Y2FzZXMgbGlrZSB0aGlzIHlvdSBsb29rIGF0IHRoZSBjb21taXQKPj4gaW50cm9kdWNpbmcgdGhl
IGZ1bmN0aW9uPyBJdCBzdXBwbGllcyBhIHJlYXNvbjoKPj4KPj4gIkFkZCBhIG5ldyByYXcgZTgy
MCB0YWJsZSBmb3IgY29tbW9uIHB1cnBvc2UgYW5kIGNvcHkgdGhlIEJJT1MgYnVmZmVyCj4+ICB0
byBpdC4gRG9pbmcgdGhlIGNvcHlpbmcgaW4gYXNzZW1ibHkgYXZvaWRzIHRoZSBuZWVkIHRvIGV4
cG9ydCB0aGUKPj4gIHN5bWJvbHMgZm9yIHRoZSBCSU9TIEU4MjAgYnVmZmVyIGFuZCBudW1iZXIg
b2YgZW50cmllcy4iCj4KPiBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCBEYXZpZCBoZXJlLsKgIFRo
YXQgZGVzY3JpcHRpb24gaXMgY29tcGxldGVseQo+IGluc3VmZmljaWVudCBmb3IganVzdGlmeWlu
ZyB3aHkgdGhlIGxvZ2ljIHdhcyBkb25lIHRoYXQgd2F5IGluIHRoZSBlbmQsCj4gYW5kIEkgd291
bGQgbm90IGhhdmUgYWNjZXB0ZWQgdGhlIHBhdGNoIGluIHRoYXQgZm9ybSBhdCBhbGwuCj4KPiBU
byBiZSBjbGVhci7CoCBJIHVuZGVyc3RhbmQgKGFuZCBhZ3JlZSkgd2h5IGhhdmluZyBvdXIgbWFp
biBjb3B5IG9mIHRoZQo+IGU4MjAgdGFibGUgaW4gdGhlIHRyYW1wb2xpbmUgaXMgYSBiYWQgdGhp
bmcsIGFuZCBtb3ZpbmcgdGhlIG1haW4gY29weQo+IG91dCBvZiB0aGUgdHJhbXBvbGluZSBpcyBm
aW5lLgo+Cj4gV2hhdCBpc24ndCBmaW5lIGlzIHdoeSwgaW4gdGhlIGFkanVzdGVkIHdvcmxkLCB3
ZSBjYWxsIGJhY2sgaW50byB3aGF0Cj4gYXBwZWFycyB0byBiZSB0aGUgdHJhbXBvbGluZSwgYnV0
IGlzbid0LCB0byBnZXQgYWNjZXNzIHRvIGRhdGEgd2hpY2ggdGhlCj4gY2FsbGluZyBjb2RlIGNh
biBhbHJlYWR5IGFjY2Vzcy7CoCBJbiBwYXJ0aWN1bGFyLi4uCj4KPj4gSSBoYXZlIHRvIGFkbWl0
IHRoYXQgSSBzZWUgdmFsdWUgaW4gdGhpcywgYXMgaXQgYXZvaWRzIGludHJvZHVjdGlvbgo+PiBv
ZiB3cm9uZyBhY2Nlc3NlcyB0byB0aGVzZSB2YXJpYWJsZXMuCj4KPiAuLi50aGlzIHJlYXNvbmlu
ZyBpcyBib2d1cy7CoCBXZSdyZSBlaXRoZXIgYWNjZXNzaW5nIHRoZSBkYXRhIGl0c2VsZiwgb3IK
PiB0aGUgbWVtY3B5IGZ1bmN0aW9uLCBidXQgdGhlcmUgaXMgbm8gcG9zc2libGUgd2F5IHRvIHBy
b2dyYW1hdGljYWxseQo+IGF2b2lkICJ3cm9uZyIgYWNjZXNzIGludG8gdGhlIHRyYW1wb2xpbmUs
IGJlY2F1c2Ugd2UncmUgc3RpbGwgYWNjZXNzaW5nCj4gaXQuCj4KPiBUaGVyZWZvcmUsIEkgZG9u
J3QgdW5kZXJzdGFuZCB3aGF0IHBvc3NpYmxlIGJlbmVmaXQgbm90IGV4cG9ydGluZyB0aGUKPiBk
YXRhIGhhcyBpbiB0aGUgZmlyc3QgcGxhY2UsIGFuZCB3aHkgY29tcGxpY2F0aW5nIGl0IHdpdGgg
YSBjYWxsIHRvIGEKPiBmdW5jdGlvbiAod2hpY2ggaXNuJ3QgYWN0dWFsbHkgZXhlY3V0aW5nIHdo
ZXJlIGl0IGFwcGVhcnMgdG8gbGl2ZSksIGlzCj4gY29uc2lkZXJlZCBhIGJlbmVmaXQuCgpOb3Rl
IHRoYXQgYWZ0ZXIgYnJpbmdpbmcgdGhlc2UgdHdvIGdyYXR1aXRvdXNseSBkaWZmZXJlbnRseSBo
YW5kbGVkCnN5bWJvbHMgaW4gbGluZSB3aXRoIGV2ZXJ5dGhpbmcgZWxzZSBpbiB0aGUgYm9vdCB0
cmFtcG9saW5lLCBhIGxhdGVyIHBhdGNoCmluIHRoZSBzZXJpZXMgcHV0cyBhbGwgdGhpcyBzdHVm
ZiBpbnRvIGl0cyBvd24gZGF0YSBzZWN0aW9uIHdoaWNoIGlzCmNvcGllZCBiYWNrIHVwIHRvIHRo
ZSBYZW4gaW1hZ2UgYXQgdGhlIGVuZCBvZiB0aGUgcmVhbCBtb2RlIHBoYXNlIG9mIGJvb3QsCmFu
ZCBhbGwgdGhlIHBvaW50ZXIgZ3ltbmFzdGljcyBmb3IgYWxsIG9mIHRoZW0gZ28gYXdheSBjb21w
bGV0ZWx5CgotLQpkd213MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
