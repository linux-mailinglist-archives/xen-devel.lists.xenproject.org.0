Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A06015329B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 15:15:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izLQ5-0002fs-RX; Wed, 05 Feb 2020 14:12:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Mrlp=3Z=twosheds.srs.infradead.org=batv+7b3f961faae4e524adf6+6009+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1izLQ4-0002fk-M2
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 14:12:44 +0000
X-Inumbo-ID: 8a3d0542-4821-11ea-b211-bc764e2007e4
Received: from twosheds.infradead.org (unknown
 [2001:8b0:10b:1:21d:7dff:fe04:dbe2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a3d0542-4821-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=twosheds.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Cc:To:From:Subject:Date:References:In-Reply-To:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HTFj2JJpXVLA0UHs5GKX9+8B+/IFbgPXHr2m2OGky0s=; b=h1n8mJ9D19xw8vzqp+5ByTUO5
 J1QNEXmYhnV3VpJfUIJRqYdeVyrm0HGgl4N0j/YDdNYWZSZe5sq81TUrFEfrC7AblDsPIZB1anMdC
 3pPmROuEjbW2Kx1Ex87kCF6IoJJcrO9w/pluT23wDiY/ACFSZVjoz4vT8Rb4WZ1Kr0YD5RHFJZH5u
 bJ7SMPeHzHotBbesP7AAt95DC3HKc3xscm6qqsG4C77e5BpYwG8lrGv/ytY8Rpa/cUIVcsuSdAD6O
 gkrhkP5cfhLMs1DxgWGs95L6USLGetWne1qoWNMO+fSIHSw+2MT6JqtAH2TcJnqebN0c93TKndhse
 bSdzmWERg==;
Received: from localhost ([127.0.0.1] helo=twosheds.infradead.org)
 by twosheds.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izLPP-001d0a-57; Wed, 05 Feb 2020 14:12:03 +0000
Received: from 212.187.182.165 (SquirrelMail authenticated user dwmw2)
 by twosheds.infradead.org with HTTP; Wed, 5 Feb 2020 14:12:03 -0000
Message-ID: <35f374ade4ae914b086e3335bc76fbe2.squirrel@twosheds.infradead.org>
In-Reply-To: <00ee9b49-2a95-9305-846a-b395e37b8728@suse.com>
References: <20200204151441.10626-1-stewart.hildebrand@dornerworks.com>
 <89f9cdc5-bd93-7c15-7832-740db273aca6@suse.com>
 <428eb589-ec3d-1527-02ce-92e2d4367a1a@citrix.com>
 <81c41a686f6a520936342f04b62d7c27c137f57e.camel@infradead.org>
 <eff7962d-c6e8-c185-43b6-5c851423cddd@suse.com>
 <59013bb7dbf9b79daa6dd280c4448418aa1fc56b.camel@infradead.org>
 <df6f5f23-ee65-f289-7dc4-5a42da931bf9@suse.com>
 <e418d66183d1ad8597458fa57d024641047a2de5.camel@infradead.org>
 <00ee9b49-2a95-9305-846a-b395e37b8728@suse.com>
Date: Wed, 5 Feb 2020 14:12:03 -0000
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Jan Beulich" <jbeulich@suse.com>
User-Agent: SquirrelMail/1.4.23 [SVN]-1.fc30.20190710
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 twosheds.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Xen-devel] [XEN PATCH v2 1/2] Check zone before merging
 adjacent blocks in heap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDA1LjAyLjIwMjAgMTI6MjMsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4gT24gV2Vk
LCAyMDIwLTAyLTA1IGF0IDExOjQ5ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFlldCwg
YXMgeW91IHNheSBlbHNld2hlcmUsIHdoZXRoZXIgYW4gTUZOIGhhcyBhbgo+Pj4gZW50cnkgaW4g
ZnJhbWVfdGFibGVbXSBpcyBlbnRpcmVseSB1bmNsZWFyLCBzbyBwZXJtaXR0aW5nIGJvb3QtCj4+
PiBhbGxvY2F0b3IgcGFnZXMgdG8gYmUgZnJlZWQgdmlhIGFsbG9jX2RvbWhlYXBfcGFnZXMoKSBu
ZXZlcnRoZWxlc3MKPj4+IHN0aWxsIGRvZXNuJ3QgbG9vayBhbnkgYmV0dGVyIGFuIGlkZWEgdG8g
bWUuCj4+Cj4+IEhtLCBJIGRvbid0IHRoaW5rIEkgc2FpZCB0aGF0LCBkaWQgST8gVGhhdCB3b3Vs
ZCBiZSBhIG5ldyBhbmQgZXhjaXRpbmcKPj4gY29tcGxpY2F0aW9uLgo+Pgo+PiBJIHRoaW5rIGV2
ZXJ5IE1GTiBoYW5kZWQgb3V0IGJ5IHRoZSBib290IGFsbG9jYXRvciAqc2hvdWxkKiBoYXZlIGEK
Pj4gY29ycmVzcG9uZGluZyBlbnRyeSBpbiB0aGUgZnJhbWUgdGFibGUuIEFsbCB0aGUgUERYIHNl
dHVwIGlzIGRvbmUgZm9yCj4+IHRob3NlIHBhZ2VzLCBqdXN0IGFzIGl0IGlzIGZvciBoZWFwIHBh
Z2VzLiBJbiBmYWN0LCBzb21lIG9mIHRoYXQgc2V0dXAKPj4gaXMgKm9ubHkqIGRvbmUgaW4gaW5p
dF9ib290X3BhZ2VzKCkgcmlnaHQgbm93LCBhbmQgaWYgcGFnZSByYW5nZXMgZG9uJ3QKPj4gZ28g
dGhyb3VnaCB0aGUgYm9vdCBhbGxvY2F0b3IgYW5kIGVuZCB1cCBiZWluZyB0cmFuc2ZlcnJlZCB0
byB0aGUgaGVhcAo+PiBpbiBlbmRfYm9vdF9hbGxvY2F0b3IoKSwgdGhpbmdzIChsaWtlIGJhZHBh
Z2VzPSBvbiB0aGUgY29tbWFuZCBsaW5lKQo+PiBkb24ndCB3b3JrIHJpZ2h0Lgo+Cj4gSSBndWVz
cyBJIHNob3VsZCBoYXZlIHNhaWQgIndoZXRoZXIgYW4gTUZOIGhhcyBhIHByb3Blcmx5IGluaXRp
YWxpemVkCj4gZW50cnkgaW4gZnJhbWVfdGFibGVbXSBpcyBlbnRpcmVseSB1bmNsZWFyIi4KCkFo
YSwgcmlnaHQuIFllcywgSSBhZG1pdCB0byBoYXZpbmcgc2FpZCB0aGF0IDopCgpJIHRoaW5rIHdl
IGhhdmUgYSB2aWFibGUgcGF0aCB0byBmaXhpbmcgdGhhdCwgYnkgZm9sZGluZyBQR0NfYnJva2Vu
IGluIHRvCnRoZSBzdGF0ZSBiaXRzIHNvIHRoYXQgd2UgY2FuIGRpc2FtYmlndWF0ZS4gV2lsbCBl
eHBlcmltZW50LgoKCi0tIApkd213MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
