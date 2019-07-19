Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B136E3C6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:54:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoPY8-0000fw-97; Fri, 19 Jul 2019 09:51:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoPY6-0000fl-5K
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:51:34 +0000
X-Inumbo-ID: c9e26c0d-aa0a-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c9e26c0d-aa0a-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 09:51:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57D15337;
 Fri, 19 Jul 2019 02:51:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5F153F59C;
 Fri, 19 Jul 2019 02:51:30 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <581a9cc4-5ba7-717e-faf3-ac52d529d61d@citrix.com>
 <e3d349b3-76bc-677e-5209-fb09fc9b3ea7@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7b6d8734-8302-25a2-fe2a-e12bb1f53472@arm.com>
Date: Fri, 19 Jul 2019 10:51:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <e3d349b3-76bc-677e-5209-fb09fc9b3ea7@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8wNy8yMDE5IDE4OjMzLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEFuZHJl
dywKPiAKPiBPbiAxOC4wNy4xOSAyMDoxNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gSWYgeW91
IGNhbiBjb21lIHVwIHdpdGggYSBzdWl0YWJsZSBwaWVjZSBvZiB0ZXh0LCBJIGNhbiBmaXggdXAg
b24gY29tbWl0Lgo+IAo+IEZvbGxvd2luZyB0ZXh0IG1pZ2h0IGhhdmUgYSBiZXR0ZXIgcmVmZXJl
bmNlIHRvIHRoZSBjdXJyZW50IHByb2JsZW06Cj4gCj4gQ3VycmVudGx5IHZ1bm1hcCgpIGlzIGNh
bGxlZCBmcm9twqAgZnJvbSB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgd2l0aCBhbgoKcy8gIGZy
b20vLwoKPiBhZGRyZXNzIHBvdGVudGlhbGx5IG5vdCBwYWdlIGFsaWduZWQuIEluc3RlYWQgb2Yg
Zml4aW5nIHRoYXQgaW4gQVJNIGNvZGUsCgpzL0FSTS9Bcm0vCgo+IHdlIGxldCB2dW5tYXAoKSBt
YWtpbmcgYWxpZ25tZW50IGJ5IGl0c2VsZiBhbmQgc3RyaXBwaW5nIG90aGVyIGV4aXN0aW5nCj4g
dnVubWFwKCkgY2FsbHMgZnJvbSBwcmlvciBtYXNraW5nLiBUaGlzIG1ha2VzIGl0IGNvbnNpc3Rl
bnQgd2l0aCBob3cKPiB7LHVufW1hcF9kb21haW5fcGFnZSgpIGN1cnJlbnRseSB3b3Jrcy4KClRo
ZSBjb21taXQgbWVzc2FnZSBkb2VzIG5vdCBzdGF0ZSB3aGF0IGNvdWxkIGdvZXMgd3JvbmcgaWYg
dGhlIHBhZ2UgaXMgbm90IAphbGlnbmVkLiBTbyBob3cgYWJvdXQ6CgpTaW5jZSBjb21taXQgOWNj
MDYxOGViMCAieGVuL2FybTogbW06IFNhbml0eSBjaGVjayBhbnkgdXBkYXRlIG9mIFhlbiBwYWdl
IAp0YWJsZXMiLCB0aGUgTU0gY29kZSByZXF1aXJlcyB0aGUgdmlydHVhbCBhZGRyZXNzIHRvIGJl
IHBhZ2UtYWxpZ25lZC4gQXMgdGhlIAp2dW5tYXAoKSBoZWxwZXIgaXMgZGlyZWN0bHkgdXNlZCB0
aGUgdmlydHVhbCBhZGRyZXNzIHBhc3NlZCBieSBpdHMgY2FsbGVyLCB0aGlzIApub3cgaW1wbGll
cyB0aGUgY2FsbGVyIHNob3VsZCBwYXNzIGEgcGFnZS1hbGlnbmVkIHZpcnR1YWwgYWRkcmVzcy4K
Ck9uZSBvZiB0aGUgY2FsbGVyIGluIHhlbi9hcmNoL2FybS9jcHVlcnJhdGEuYyBtYXkgYWN0dWFs
bHkgcGFzcyBhbiB1bmFsaWduZWQgCmFkZHJlc3MgcmVzdWx0aW5nIHRoZSB2dW5tYXAoKSB0byBz
aWxlbnRseSBmYWlsIGFuZCBwb3RlbnRpYWxseSBtYWtpbmcgZnV0dXJlIAp1c2VyIG9mIHZtYXAo
KSB0byBmYWlsICh0aGUgTU0gY29kZSBkb2VzIG5vdCBhbGxvdyB0byByZXBsYWNlIGV4aXN0aW5n
IG1hcHBpbmcpLgoKSW4gZ2VuZXJhbCwgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgdnVubWFw
KCkgbW9yZSByZXNpbGllbnQgdG8gdW5hbGlnbmVkIAphZGRyZXNzLiBTbyB0aGUgZnVuY3Rpb24g
aXMgbm93IHBhZ2UtYWxpZ25pbmcgdGhlIHZpcnR1YWwgYWRkcmVzcy4KCk5vdGUgdGhhdCBmb3Ig
bXVsdGktcGFnZXMgdmlydHVhbCBtYXBwaW5nLCB0aGUgYWRkcmVzcyBzaG91bGQgc3RpbGwgcG9p
bnQgaW50byAKdGhlIGZpcnN0IHBhZ2UuIE90aGVyd2lzZSwgdnVubWFwKCkgbWF5IG9ubHkgcGFy
dGlhbGx5IHJlbW92ZSB0aGUgbWFwcGluZy4KCj4gCj4gV2l0aCB0aGUgbWFpbiBjaGFuZ2UsIGFs
c286Cj4gIMKgLSByZXBsYWNlIG9wZW5jb2RlZCBQQUdFX01BU0sgbWFjcm8gaW4gdm1faW5kZXgo
KQoKV2h5IGRpZCB5b3UgcmVtb3ZlIHRoZSBmb2xsb3dpbmcgbGluZToKICAtIHN0cmlwIGFsbCBl
eGlzdGluZyB2dW5tYXAoKSBjYWxscyBmcm9tIHByaW9yIG1hc2tpbmcKCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPiAKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
