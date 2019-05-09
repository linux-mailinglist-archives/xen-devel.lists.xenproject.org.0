Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C21903B
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 20:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOnnJ-0008RN-85; Thu, 09 May 2019 18:29:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kt3J=TJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hOnnI-0008RI-8Q
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 18:29:24 +0000
X-Inumbo-ID: 5db84d91-7288-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 5db84d91-7288-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 18:29:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31538374;
 Thu,  9 May 2019 11:29:22 -0700 (PDT)
Received: from [10.37.9.129] (unknown [10.37.9.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 040F33F738;
 Thu,  9 May 2019 11:29:19 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091104530.25766@sstabellini-ThinkPad-T480s>
 <51dbab9b-b0a5-c207-f1ef-e70b997a0078@arm.com>
 <alpine.DEB.2.21.1905091115560.25766@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bdd8f1c9-e51d-1084-a2da-3f3e89edc690@arm.com>
Date: Thu, 9 May 2019 19:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905091115560.25766@sstabellini-ThinkPad-T480s>
Content-Language: en-US
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
Cc: Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, andrii_anisov@epam.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDUvOS8xOSA3OjE2IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gT24gVGh1LCA5IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBP
biA1LzkvMTkgNzowNiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gVHVlLCA3
IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3hlbi9kb21haW4uaCBiL3hlbi9pbmNsdWRlL3hlbi9kb21haW4uaAo+Pj4+IGluZGV4IGQx
YmZjODJmNTcuLmYxNzYxZmUxODMgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2Rv
bWFpbi5oCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCj4+Pj4gQEAgLTExOCw0
ICsxMTgsMTIgQEAgc3RydWN0IHZudW1hX2luZm8gewo+Pj4+ICAgICAgdm9pZCB2bnVtYV9kZXN0
cm95KHN0cnVjdCB2bnVtYV9pbmZvICp2bnVtYSk7Cj4+Pj4gICAgKyNpZmRlZiBDT05GSUdfSEFT
X00yUAo+Pj4+ICsjZGVmaW5lIGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oZCkgKHsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+Pj4+ICsgICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZF8gPSAo
ZCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+ICsg
ICAgbWZuX3RvX2dmbihkXywgX21mbihfX3ZpcnRfdG9fbWZuKGRfLT5zaGFyZWRfaW5mbykpKTsg
ICAgICAgXAo+Pj4KPj4+IEFyZW4ndCB5b3UgbWlzc2luZyBhIF9nZm4gaGVyZT8KPj4+Cj4+PiAg
ICAgX2dmbihtZm5fdG9fZ2ZuKGQsIF9tZm4oX192aXJ0X3RvX21mbihkLT5zaGFyZWRfaW5mbykp
KSk7Cj4+Cj4+IFBhdGNoICMzIG9mIHRoaXMgc2VyaWVzIGNvbnZlcnQgbWZuX3RvX2dmbiB0byB1
c2UgdHlwZXNhZmUgTUZOICYgR0ZOLiBTbyB0aGUKPj4gZnVuY3Rpb24gbm93IHJldHVybiBhIGdm
bl90Lgo+IAo+IEFoISBTb21laG93IEkgYW0gbWlzc2luZyBwYXRjaGVzIDItMy00IGluIG15IGlu
Ym94LiBJJ2xsIHRyeSB0byBnZXQgdGhlbQo+IGZyb20gdGhlIGFyY2hpdmUuCgpCZWNhdXNlIHRo
ZXkgYXJlIHg4NiBzcGVjaWZpYyA6KS4gVGhlIHJhdGlvbmFsZSBvZiBpbXBsZW1lbnRpbmcgCmRv
bWFpbl9zaGFyZWRfaW5mb19nZm4oKSBpbiBjb21tb24gY29kZSBpcyBhbnkgYXJjaCB1c2luZyBN
MlAgc2hvdWxkIApwcm92aWRlIGEgc2ltaWxhciBoZWxwZXIuCgpBcm0gZG9lc24ndCBoYXZlIGFu
IE0yUCwgaGVuY2Ugd2h5IG1mbl90b19nZm4gaXMgbm90IGV4aXN0ZW50LgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
