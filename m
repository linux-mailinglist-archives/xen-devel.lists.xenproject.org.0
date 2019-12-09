Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C711716D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 17:22:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieLkf-0002Qo-Hy; Mon, 09 Dec 2019 16:19:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieLkd-0002Qj-Rd
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 16:19:11 +0000
X-Inumbo-ID: a1a9664e-1a9f-11ea-8813-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1a9664e-1a9f-11ea-8813-12813bfff9fa;
 Mon, 09 Dec 2019 16:19:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7C82B109;
 Mon,  9 Dec 2019 16:19:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88fc6e0d-0c1c-67fb-d50a-a15743ce23c9@suse.com>
Date: Mon, 9 Dec 2019 17:19:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205223008.8623-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/6] xen/domctl: Consolidate hypercall
 continuation handling at the top level
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
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAyMzozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvZG9tY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiBAQCAtMzI2LDkg
KzMyNiwxMiBAQCBsb25nIGFyY2hfZG9fZG9tY3RsKAo+ICAKPiAgICAgIHN3aXRjaCAoIGRvbWN0
bC0+Y21kICkKPiAgICAgIHsKPiAtCj4gICAgICBjYXNlIFhFTl9ET01DVExfc2hhZG93X29wOgo+
ICAgICAgICAgIHJldCA9IHBhZ2luZ19kb21jdGwoZCwgJmRvbWN0bC0+dS5zaGFkb3dfb3AsIHVf
ZG9tY3RsLCAwKTsKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIENvbnRpbnVhdGlvbnMgZnJv
bSBwYWdpbmdfZG9tY3RsKCkgc3dpdGNoIGluZGV4IHRvIGFyY2hfMSwgYW5kCj4gKyAgICAgICAg
ICogY2FuJ3QgdXNlIHRoZSBjb21tb24gZG9tY3RsIGNvbnRpbnVhdGlvbiBwYXRoLgo+ICsgICAg
ICAgICAqLwo+ICAgICAgICAgIGlmICggcmV0ID09IC1FUkVTVEFSVCApCj4gICAgICAgICAgICAg
IHJldHVybiBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlvbihfX0hZUEVSVklTT1JfYXJjaF8x
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImgi
LCB1X2RvbWN0bCk7CgpUaGVyZSdzIGFsc28gWEVOX0RPTUNUTF9nZXRwYWdlZnJhbWVpbmZvMyBk
b3duIGZyb20gaGVyZSB3aGljaApub3cgaW52b2tlcyBhIGNvbnRpbnVhdGlvbi4KCj4gQEAgLTEw
ODAsNiArMTA2OCw5IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVu
X2RvbWN0bF90KSB1X2RvbWN0bCkKPiAgICAgIGlmICggY29weWJhY2sgJiYgX19jb3B5X3RvX2d1
ZXN0KHVfZG9tY3RsLCBvcCwgMSkgKQo+ICAgICAgICAgIHJldCA9IC1FRkFVTFQ7Cj4gIAo+ICsg
ICAgaWYgKCByZXQgPT0gLUVSRVNUQVJUICkKPiArICAgICAgICByZXQgPSBoeXBlcmNhbGxfY3Jl
YXRlX2NvbnRpbnVhdGlvbihfX0hZUEVSVklTT1JfZG9tY3RsLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJoIiwgdV9kb21jdGwpOwoKWW91IG1heSB3YW50
IHRvIG1lbnRpb24gaW4gdGhlIGRlc2NyaXB0aW9uIHRoZSBidWcgeW91IGZpeCBoZXJlOgpQcmV2
aW91c2x5IHRoZSAtRUZBVUxUIHJldHVybmluZyB2aXNpYmxlIGluIGNvbnRleHQgc2hvdWxkIGhh
dmUKY2FuY2VsZWQgYW55IGFjdGl2ZSBjb250aW51YXRpb24uCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
