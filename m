Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A12310D58F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:16:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaf9l-00044f-1f; Fri, 29 Nov 2019 12:13:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaf9j-00044W-SH
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:13:51 +0000
X-Inumbo-ID: b410d7fa-12a1-11ea-a3e4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b410d7fa-12a1-11ea-a3e4-12813bfff9fa;
 Fri, 29 Nov 2019 12:13:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 76272AE07;
 Fri, 29 Nov 2019 12:13:50 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
 <78b1df38-864c-768e-b306-2db75f3b76e0@citrix.com>
 <e765c741-cba4-42bf-b61a-20a206cd628d@suse.com>
 <24033.2185.509756.178278@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47257a2e-5454-6115-93c9-e1b9ed3a4131@suse.com>
Date: Fri, 29 Nov 2019 13:13:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24033.2185.509756.178278@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overflow in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 GeorgeDunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMzowMSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSmFuIEJldWxpY2ggd3Jp
dGVzICgiUmU6IFtQQVRDSF0gY29uc29sZTogYXZvaWQgYnVmZmVyIG92ZXJmbG93IGluIGd1ZXN0
X2NvbnNvbGVfd3JpdGUoKSIpOgo+PiBPbiAyOS4xMS4yMDE5IDExOjIyLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+Pj4gSXMgc2l6ZW9mKGFycmF5WzBdKSBhbHdheXMgMCwgb3IgaXMgdGhpcyBqdXN0
IGEgR0NDLWlzbSA/wqAgR29kYm9sdAo+Pj4gc3VnZ2VzdHMgaXMgMCBvbiBhbGwgY29tcGlsZXIg
d2Ugc3VwcG9ydC4KPj4+Cj4+PiBFaXRoZXIgd2F5LCBpc24ndCB0aGUgbW9yZSBjb21tb24gaWRp
b20gKyAwdWwgP8KgIFBlcnNvbmFsbHksIEkgZmVlbCB0aGF0Cj4+PiBpcyBjbGVhcmVyIHRvIGZv
bGxvdy4KPj4KPj4gSSBkZWNpZGVkIGFnYWluc3QgKyAwdWwgb3IgYWxpa2UgYmVjYXVzZSBpbiBw
cmluY2lwbGUgc2l6ZV90Cj4+IGFuZCB1bnNpZ25lZCBsb25nIGFyZSBkaWZmZXJlbnQgdHlwZXMu
IEluIHBhcnRpY3VsYXIgMzItYml0Cj4+IHg4NiBnY2MgdXNlcyB1bnNpZ25lZCBpbnQgZm9yIHNp
emVfdCwgYW5kIGhlbmNlIG1pbigpJ3MKPj4gdHlwZSBzYWZldHkgY2hlY2sgd291bGQgY2F1c2Ug
dGhlIGJ1aWxkIHRvIGZhaWwgdGhlcmUuIFRoZQo+PiBzYW1lIHJpc2sgb2J2aW91c2x5IGV4aXN0
cyBmb3IgYW55IDMyLWJpdCBhcmNoIChlLmcuIEFybTMyLAo+PiBidXQgSSBoYXZlbid0IGNoZWNr
ZWQgd2hhdCB0eXBlIGl0IGFjdHVhbGx5IHVzZXMpLgo+IAo+IEkgZG9uJ3Qga25vdyB3aGF0IGkg
d3Jvbmcgd2l0aAo+ICAgIChzaXplX3QpMAo+IHdoaWNoIGlzIHNob3J0ZXIsIGV2ZW4gIQoKVHJ1
ZS4gWWV0IGl0IGNvbnRhaW5zIGEgY2FzdCwgbm8gbWF0dGVyIGhvdyByaXNrLWZyZWUgaXQgbWF5
IGJlCmluIHRoaXMgY2FzZS4gV2l0aCBhIGNhc3QsIEkgY291bGQgYXMgd2VsbCBoYXZlIHdyaXR0
ZW4gKHlldApzaG9ydGVyKSAoc2l6ZV90KWNvdW50LgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
