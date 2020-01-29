Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B714CCFE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 16:10:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwowQ-0001Wb-TY; Wed, 29 Jan 2020 15:07:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwowP-0001WW-Ut
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 15:07:41 +0000
X-Inumbo-ID: 17f2152c-42a9-11ea-ad98-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17f2152c-42a9-11ea-ad98-bc764e2007e4;
 Wed, 29 Jan 2020 15:07:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0DC20B116;
 Wed, 29 Jan 2020 15:07:40 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200129143831.1369-1-pdurrant@amazon.com>
 <20200129143831.1369-3-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7342d93-84c3-d844-433e-c3d845c336c2@suse.com>
Date: Wed, 29 Jan 2020 16:07:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129143831.1369-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 2/4] mm: modify domain_adjust_tot_pages()
 to better handle a zero adjustment
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxNTozOCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21t
b24vbWVtb3J5LmMKPiArKysgYi94ZW4vY29tbW9uL21lbW9yeS5jCj4gQEAgLTcyNyw4ICs3Mjcs
NyBAQCBzdGF0aWMgbG9uZyBtZW1vcnlfZXhjaGFuZ2UoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4
ZW5fbWVtb3J5X2V4Y2hhbmdlX3QpIGFyZykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAoaiAqICgxVUwgPDwgZXhjaC5vdXQuZXh0ZW50X29yZGVyKSkpOwo+ICAKPiAgICAgICAgICAg
ICAgICAgIHNwaW5fbG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsKPiAtICAgICAgICAgICAgICAg
IGRyb3BfZG9tX3JlZiA9IChkZWNfY291bnQgJiYKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAhZG9tYWluX2FkanVzdF90b3RfcGFnZXMoZCwgLWRlY19jb3VudCkpOwo+ICsgICAg
ICAgICAgICAgICAgZHJvcF9kb21fcmVmID0gIWRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKGQsIC1k
ZWNfY291bnQpOwoKQW5kIGl0J3Mgb25seSBub3cgdGhhdCBJIHNlZSBpdCBpbiB0aGlzIHNoYXBl
IHRoYXQgaXQgYmVjb21lcwpjbGVhciB0byBtZSB3aHkgdGhlIGNoYW5nZSBhYm92ZSBzaG91bGRu
J3QgYmUgZG9uZSwgYW5kIHdoeSBpbgp5b3VyIG90aGVyIHBhdGNoIGNvZGUgc2hvdWxkIGJlIHdy
aXR0ZW4gc2ltaWxhciB0byB0aGUgYWJvdmU6ClRoZSBhYnN0cmFjdCBtb2RlbCByZXF1aXJlcyB0
aGF0IHRoZSBkb21haW4gcmVmZXJlbmNlIGJlCmRyb3BwZWQgb25seSB3aGVuIC0+dG90X3BhZ2Vz
IF90cmFuc2l0aW9uc18gdG8gemVyby4gTm8gZHJvcApzaG91bGQgb2NjdXIgaWYgdGhlIGNvdW50
IHdhcyBhbHJlYWR5IHplcm8uIEdyYW50ZWQgdGhpcyBtYXkKYmUgdGVjaG5pY2FsbHkgaW1wb3Nz
aWJsZSBpbiB0aGUgc3BlY2lmaWMgY2FzZSBoZXJlLCBidXQgdGhlCmNvZGUgd291bGQgc3RpbGwg
YmV0dGVyIHJlZmxlY3QgdGhpcyBnZW5lcmFsIG1vZGVsLCB0byBwcmV2ZW50Cml0IGdldHRpbmcg
KG1pcy0pY2xvbmVkIGludG8gb3RoZXIgcGxhY2VzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
