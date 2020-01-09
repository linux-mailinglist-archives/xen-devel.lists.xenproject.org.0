Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F613575A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:47:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipVJd-0002uH-9T; Thu, 09 Jan 2020 10:45:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipVJb-0002uB-S6
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:45:23 +0000
X-Inumbo-ID: 22f6ae6b-32cd-11ea-b998-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22f6ae6b-32cd-11ea-b998-12813bfff9fa;
 Thu, 09 Jan 2020 10:45:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33A6BAD56;
 Thu,  9 Jan 2020 10:45:14 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20200109054031.18455-1-jgross@suse.com>
 <791d2e94-3d46-bc8d-b929-280bfe7f2f51@citrix.com>
 <beb1d847-caee-ddc0-1688-34a42072095f@suse.com>
 <41cc4690-8ab7-5580-d1d6-8d7ce5be51e9@suse.com>
 <e6518f6c-639a-18bf-5dec-3eddc0d22449@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00146925-0548-8ae2-2514-6ae04a8d2930@suse.com>
Date: Thu, 9 Jan 2020 11:45:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e6518f6c-639a-18bf-5dec-3eddc0d22449@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make CONFIG_DEBUG_LOCKS usable without
 CONFIG_DEBUG
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxMTozOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzkvMjAgMTA6
MzAgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwOS4wMS4yMDIwIDExOjE1LCBKw7xyZ2Vu
IEdyb8OfICB3cm90ZToKPj4+IE9uIDA5LjAxLjIwIDExOjA3LCBHZW9yZ2UgRHVubGFwIHdyb3Rl
Ogo+Pj4+IE9uIDEvOS8yMCA1OjQwIEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+PiBJbiBl
eHBlcnQgbW9kZSBpdCBpcyBwb3NzaWJsZSB0byBlbmFibGUgQ09ORklHX0RFQlVHX0xPQ0tTIHdp
dGhvdXQKPj4+Pj4gaGF2aW5nIGVuYWJsZWQgQ09ORklHX0RFQlVHLiBUaGUgY29kaW5nIGlzIGRl
cGVuZGluZyBvbiBDT05GSUdfREVCVUcKPj4+Pj4gYXMgaXQgaXMgdXNpbmcgQVNTRVJUKCksIGhv
d2V2ZXIuCj4+Pj4KPj4+PiBBbnkgcmVhc29uIG5vdCB0byB1c2UgQlVHX09OKCkgaW4gdGhhdCBj
YXNlPwo+Pj4KPj4+IFRoZSBtYWluIHJlYXNvbiBpcyB0aGUgbWlzc2luZyBtZXNzYWdlIHdoaWNo
IGNvbmRpdGlvbiBmYWlsZWQuCj4+Pgo+Pj4gQSByZW5hbWUgKCJCVUdfQVNTRVJUIj8pIGNvdWxk
IGJlIGFuIGFsdGVybmF0aXZlIHRvIGp1c3QgZHJvcHBpbmcKPj4+IHRoZSBtZXNzYWdlLiBCb3Ro
IHdvdWxkIGJlIGZpbmUgd2l0aCBtZS4KPj4KPj4gSG93IGFib3V0Cj4+Cj4+ICAgICBpZiAoIC4u
LiApCj4+ICAgICB7Cj4+ICAgICAgICAgcHJpbnRrKC4uLik7Cj4+ICAgICAgICAgQlVHKCk7Cj4+
ICAgICB9Cj4gCj4gSXMgdGhlcmUgYSByZWFzb24gd2UgY2FuJ3QgbWFrZSBCVUdfT04oKSBwcmlu
dCB0aGUgY29uZGl0aW9uPwoKT2YgY291cnNlIHdlIGNvdWxkLCBpbiBwcmluY2lwbGUsIGF0IHRo
ZSBwcmljZSBvZiBhIG1lYW5pbmdmdWwKZ3Jvd3RoIG9mIHRoZSAucm9kYXRhIHNlY3Rpb24uIElm
IHdlIGRvIHRoaXMsIHBlcmhhcHMgd2UnZCB3YW50CnNvbWV0aGluZyBsaWtlIExpbnV4J2VzIENP
TkZJR19ERUJVR19CVUdWRVJCT1NFIHRvIGNvbnRyb2wgdGhpcy4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
