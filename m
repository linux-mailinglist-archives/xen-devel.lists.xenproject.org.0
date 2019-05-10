Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836BE19E39
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:30:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5Zi-0003cZ-47; Fri, 10 May 2019 13:28:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5Zg-0003cI-P3
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:28:32 +0000
X-Inumbo-ID: 813f5262-7327-11e9-9171-aff9d4a3e0cf
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 813f5262-7327-11e9-9171-aff9d4a3e0cf;
 Fri, 10 May 2019 13:28:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA04374;
 Fri, 10 May 2019 06:28:31 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF7DE3F575;
 Fri, 10 May 2019 06:28:30 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-13-julien.grall@arm.com>
 <5CD5748A020000780022D844@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <517ac616-ba23-67e6-b474-33e7bc094624@arm.com>
Date: Fri, 10 May 2019 14:28:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD5748A020000780022D844@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 12/14] xen/x86: pv: Convert update_intpte()
 to use typesafe MFN
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8wNS8yMDE5IDEzOjU0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gQEAgLTIxNzcsOCAr
MjE3Nyw4IEBAIHN0YXRpYyBpbnQgbW9kX2wxX2VudHJ5KGwxX3BnZW50cnlfdCAqcGwxZSwgbDFf
cGdlbnRyeV90IG5sMWUsCj4+ICAgICAgIH0KPj4gICAgICAgZWxzZSBpZiAoIHB2X2wxdGZfY2hl
Y2tfbDFlKHB0X2RvbSwgbmwxZSkgKQo+PiAgICAgICAgICAgcmV0dXJuIC1FUkVTVEFSVDsKPj4g
LSAgICBlbHNlIGlmICggdW5saWtlbHkoIVVQREFURV9FTlRSWShsMSwgcGwxZSwgb2wxZSwgbmwx
ZSwgZ2wxbWZuLCBwdF92Y3B1LAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHByZXNlcnZlX2FkKSkgKQo+PiArICAgIGVsc2UgaWYgKCB1bmxpa2VseSghVVBEQVRFX0VO
VFJZKGwxLCBwbDFlLCBvbDFlLCBubDFlLCBnbDFtZm4sCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcHRfdmNwdSwgcHJlc2VydmVfYWQpKSApCj4gCj4gU3RyYXkgY2hh
bmdlPwoKWWVzLCBJIHdpbGwgZml4IGl0LgoKPiAKPj4gQEAgLTM5MzksMTUgKzM5NDAsMTUgQEAg
bG9uZyBkb19tbXVfdXBkYXRlKAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICggKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYg
UEdUX2NvdW50X21hc2spID4KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgxICsg
ISEocGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfcGlubmVkKSArCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAocGFnZXRhYmxlX2dldF9wZm4oY3Vyci0+YXJjaC5ndWVzdF90
YWJsZV91c2VyKSA9PQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbikgKyBs
b2NhbF9pbl91c2UpICkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChtZm5fZXEo
cGFnZXRhYmxlX2dldF9tZm4oY3Vyci0+YXJjaC5ndWVzdF90YWJsZV91c2VyKSwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWZuKSkgKyBsb2NhbF9pbl91c2UpICkK
PiAKPiBUaGVyZSdzIGEgc3RyYXkgcGFpciBvZiBwYXJlbnRoZXNlcyBub3cgbGVmdCBhcm91bmQg
YSBmdW5jdGlvbiBjYWxsLgoKT2suCgoKPiAKPj4gLS0tIGEveGVuL2FyY2gveDg2L3B2L21tLmgK
Pj4gKysrIGIveGVuL2FyY2gveDg2L3B2L21tLmgKPj4gQEAgLTM3LDcgKzM3LDcgQEAgc3RhdGlj
IGlubGluZSBsMV9wZ2VudHJ5X3QgZ3Vlc3RfZ2V0X2VmZl9sMWUodW5zaWduZWQgbG9uZyBsaW5l
YXIpCj4+ICAgICogUmV0dXJucyBmYWxzZSBmb3IgZmFpbHVyZSAocG9pbnRlciBub3QgdmFsaWQp
LCB0cnVlIGZvciBzdWNjZXNzLgo+PiAgICAqLwo+PiAgIHN0YXRpYyBpbmxpbmUgYm9vbCB1cGRh
dGVfaW50cHRlKGludHB0ZV90ICpwLCBpbnRwdGVfdCBvbGQsIGludHB0ZV90IG5ldywKPj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWZuLCBzdHJ1Y3Qg
dmNwdSAqdiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbiwg
c3RydWN0IHZjcHUgKnYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9v
bCBwcmVzZXJ2ZV9hZCkKPiAKPiBXb3VsZCB5b3UgbWluZCByZS1mbG93aW5nIHRoaXMsIGFzIHRo
ZSBsYXN0IHBhcmFtZXRlciBkZWNsYXJhdGlvbiBub3cKPiBmaXRzIG9uIHRoZSBlYXJsaWVyIGxp
bmU/CgpPay4KCj4gCj4gV2l0aCBhdCBsZWFzdCB0aGUgZm9ybWVyIHR3byB0YWtlbiBjYXJlIG9m
Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rIHlv
dS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
