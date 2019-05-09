Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35C19315
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 21:52:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOp2z-0006Iz-9b; Thu, 09 May 2019 19:49:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UEDQ=TJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hOp2y-0006IZ-3y
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:40 +0000
X-Inumbo-ID: 9476cfd4-7293-11e9-83a3-df30a6862550
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9476cfd4-7293-11e9-83a3-df30a6862550;
 Thu, 09 May 2019 19:49:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E38A421744;
 Thu,  9 May 2019 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557431378;
 bh=l6t9MFznAB6TJolwl6iHkMxSxX7ObORZNuN2CAr8Rog=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=k0ZlqGFHd8wtgqfnXd/X5wqtCmoOKZBR6dyidfdqbFg8XcBqANuM3+9P59tyHIR7q
 Z6wPHIph1kZ6gOzB2Dtj7xdrX71wRJ8aBga2vkSqu+zQZSbpaa1vzvjHliCntRAWa4
 bnTYL6q/MMWtCgLKhKhpmG7al9ffVoL1frxvQfaQ=
Date: Thu, 9 May 2019 12:49:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <bdd8f1c9-e51d-1084-a2da-3f3e89edc690@arm.com>
Message-ID: <alpine.DEB.2.21.1905091249180.25766@sstabellini-ThinkPad-T480s>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
 <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
 <alpine.DEB.2.21.1905091115560.25766@sstabellini-ThinkPad-T480s>
 <bdd8f1c9-e51d-1084-a2da-3f3e89edc690@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, andrii_anisov@epam.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA5IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiA1LzkvMTkgNzoxNiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gVGh1
LCA5IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4g
T24gNS85LzE5IDc6MDYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBPbiBU
dWUsIDcgTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gPiA+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmggYi94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPiA+
ID4gPiA+IGluZGV4IGQxYmZjODJmNTcuLmYxNzYxZmUxODMgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgKPiA+ID4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hl
bi9kb21haW4uaAo+ID4gPiA+ID4gQEAgLTExOCw0ICsxMTgsMTIgQEAgc3RydWN0IHZudW1hX2lu
Zm8gewo+ID4gPiA+ID4gICAgICB2b2lkIHZudW1hX2Rlc3Ryb3koc3RydWN0IHZudW1hX2luZm8g
KnZudW1hKTsKPiA+ID4gPiA+ICAgICsjaWZkZWYgQ09ORklHX0hBU19NMlAKPiA+ID4gPiA+ICsj
ZGVmaW5lIGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oZCkgKHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gPiA+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkXyA9IChkKTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+
ICsgICAgbWZuX3RvX2dmbihkXywgX21mbihfX3ZpcnRfdG9fbWZuKGRfLT5zaGFyZWRfaW5mbykp
KTsgICAgICAgXAo+ID4gPiA+IAo+ID4gPiA+IEFyZW4ndCB5b3UgbWlzc2luZyBhIF9nZm4gaGVy
ZT8KPiA+ID4gPiAKPiA+ID4gPiAgICAgX2dmbihtZm5fdG9fZ2ZuKGQsIF9tZm4oX192aXJ0X3Rv
X21mbihkLT5zaGFyZWRfaW5mbykpKSk7Cj4gPiA+IAo+ID4gPiBQYXRjaCAjMyBvZiB0aGlzIHNl
cmllcyBjb252ZXJ0IG1mbl90b19nZm4gdG8gdXNlIHR5cGVzYWZlIE1GTiAmIEdGTi4gU28KPiA+
ID4gdGhlCj4gPiA+IGZ1bmN0aW9uIG5vdyByZXR1cm4gYSBnZm5fdC4KPiA+IAo+ID4gQWghIFNv
bWVob3cgSSBhbSBtaXNzaW5nIHBhdGNoZXMgMi0zLTQgaW4gbXkgaW5ib3guIEknbGwgdHJ5IHRv
IGdldCB0aGVtCj4gPiBmcm9tIHRoZSBhcmNoaXZlLgo+IAo+IEJlY2F1c2UgdGhleSBhcmUgeDg2
IHNwZWNpZmljIDopLiBUaGUgcmF0aW9uYWxlIG9mIGltcGxlbWVudGluZwo+IGRvbWFpbl9zaGFy
ZWRfaW5mb19nZm4oKSBpbiBjb21tb24gY29kZSBpcyBhbnkgYXJjaCB1c2luZyBNMlAgc2hvdWxk
IHByb3ZpZGUgYQo+IHNpbWlsYXIgaGVscGVyLgo+IAo+IEFybSBkb2Vzbid0IGhhdmUgYW4gTTJQ
LCBoZW5jZSB3aHkgbWZuX3RvX2dmbiBpcyBub3QgZXhpc3RlbnQuCgpBbGwgcmlnaHQuIEFkZCBt
eSBhY2tlZC1ieSB0byB0aGlzIHBhdGNoLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
