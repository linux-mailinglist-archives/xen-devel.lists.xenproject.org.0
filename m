Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3712ED2166
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 09:10:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iISWp-0000pN-72; Thu, 10 Oct 2019 07:06:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iISWn-0000pI-GH
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 07:06:25 +0000
X-Inumbo-ID: 77f86cb6-eb2c-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77f86cb6-eb2c-11e9-8c93-bc764e2007e4;
 Thu, 10 Oct 2019 07:06:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 07B37AEF6;
 Thu, 10 Oct 2019 07:06:23 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191009182114.9376-1-andrew.cooper3@citrix.com>
 <CACCGGhAhK_fbiJbUn-nPnFEWK6AvFye1r7Di-3j5UEwNW916rg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72a06a9d-53f8-925e-6e2b-4115bb952245@suse.com>
Date: Thu, 10 Oct 2019 09:06:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACCGGhAhK_fbiJbUn-nPnFEWK6AvFye1r7Di-3j5UEwNW916rg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/hvm: Fix the use of "hap=0" following
 c/s c0902a9a143a
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Paul Durrant <pdurrant@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAyMDo1NiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE9uIFdlZCwgOSBPY3Qg
MjAxOSBhdCAxOToyMSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+Cj4+IGMvcyBjMDkwMmE5YTE0M2EgcmVmYWN0b3JlZCBodm1fZW5hYmxlKCkgYSBs
aXR0bGUsIGJ1dCBkcm9wcGVkIHRoZSBsb2dpYyB3aGljaAo+PiBjbGVhcmVkIGhhcF9zdXBwb3J0
ZWQgaW4gdGhlIGNhc2UgdGhhdCB0aGUgdXNlciBoYWQgYXNrZWQgZm9yIGl0IG9mZi4KPj4KPj4g
VGhpcyByZXN1bHRzIGluIFhlbiBib290aW5nIHVwLCBjbGFpbWluZzoKPj4KPj4gICAoWEVOKSBI
Vk06IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQKSBkZXRlY3RlZCBidXQgZGlzYWJsZWQK
Pj4KPj4gYnV0IHdpdGggSEFQIGFkdmVydGlzZWQgdmlhIHN5c2N0bCwgYW5kIFhFTl9ET01DVExf
Q0RGX2hhcCBiZWluZyBhY2NlcHRlZCBpbgo+PiBkb21haW5fY3JlYXRlKCkuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gCj4g
VGhhdCBzaG91bGQgaGF2ZSBiZWVuIGxhcmdlbHkgY29kZSBtb3ZlbWVudCwgc28gSSBkb24ndCBr
bm93IGhvdyBJCj4gbWFuYWdlZCB0byBkcm9wIHRoYXQuCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdWwg
RHVycmFudCA8cGF1bEB4ZW4ub3JnPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
