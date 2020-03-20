Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 439A118D2DD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 16:27:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFJVX-0006Bx-QR; Fri, 20 Mar 2020 15:24:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFJVV-0006Bk-Is
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 15:24:21 +0000
X-Inumbo-ID: def81487-6abe-11ea-bda5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id def81487-6abe-11ea-bda5-12813bfff9fa;
 Fri, 20 Mar 2020 15:24:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44B77AC91;
 Fri, 20 Mar 2020 15:24:20 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <916bbc82cafac74f0a203b48eebfbc711bd33a70.camel@infradead.org>
 <779cc30571e4e2d666454486e883dfbfb8393410.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36e07c20-030c-611c-332c-d741768f82f5@suse.com>
Date: Fri, 20 Mar 2020 16:24:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <779cc30571e4e2d666454486e883dfbfb8393410.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/setup: lift dom0 creation out into
 create_dom0() function
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <xadimgnik@gmail.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxMjo0NiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gVGhlIGNyZWF0aW9uIG9mIGRvbTAg
Y2FuIGJlIHJlbGF0aXZlbHkgc2VsZi1jb250YWluZWQuIFNoaWZ0IGl0IGludG8KPiBhIHNlcGFy
YXRlIGZ1bmN0aW9uIGFuZCBzaW1wbGlmeSBfX3N0YXJ0X3hlbigpIGEgbGl0dGxlIGJpdC4KPiAK
PiBUaGlzIGlzIGEgY2xlYW51cCBpbiBpdHMgb3duIHJpZ2h0LCBidXQgd2lsbCBiZSBldmVuIG1v
cmUgZGVzaXJlYWJsZQo+IHdoZW4gbGl2ZSB1cGRhdGUgcHJvdmlkZXMgYW4gYWx0ZXJuYXRpdmUg
cGF0aCB0aHJvdWdoIF9fc3RhcnRfeGVuKCkKPiB0aGF0IGRvZXNuJ3QgaW52b2x2ZSBjcmVhdGlu
ZyBhIG5ldyBkb20wIGF0IGFsbC4KPiAKPiBNb3ZlIHRoZSBjYWxjdWxhdGlvbiBvZiB0aGUgJ2lu
aXRyZCcgcGFyYW1ldGVyIGZvciBjcmVhdGVfZG9tMCgpCj4gZG93biBwYXN0IHRoZSBjb3NtZXRp
YyBwcmludGsgYWJvdXQgTlggc3VwcG9ydCwgYmVjYXVzZSBpbiB0aGUgZnVsbG5lc3MKPiBvZiB0
aW1lIHRoZSB3aG9sZSBpbml0cmQgYW5kIGNyZWF0ZV9kb20wKCkgcGFydCB3aWxsIGJlIHVuZGVy
IHRoZSBzYW1lCj4gIm5vdCBsaXZlIHVwZGF0ZSIgY29uZGl0aW9uYWwuIEFuZCBpbiB0aGUgbWVh
bnRpbWUgaXQncyBqdXN0IG5lYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91
c2UgPGR3bXdAYW1hem9uLmNvLnVrPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4Kd2l0aCBvbmUgZnVydGhlciBzbWFsbCBjb3NtZXRpYyBhc3BlY3QgdGFrZW4gY2Fy
ZSBvZiAod2hpY2gKb3VnaHQgdG8gYmUgZG9hYmxlIHdoaWxlIGNvbW1pdHRpbmcpOgoKPiAtLS0g
YS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gQEAg
LTY3OSw2ICs2NzksOTIgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXQgY29weV9iaW9zX2U4
MjAoc3RydWN0IGU4MjBlbnRyeSAqbWFwLCB1bnNpZ25lZCBpbnQgbGkKPiAgICAgIHJldHVybiBu
Owo+ICB9Cj4gIAo+ICtzdGF0aWMgc3RydWN0IGRvbWFpbiAqIF9faW5pdCBjcmVhdGVfZG9tMChj
b25zdCBtb2R1bGVfdCAqaW1hZ2UsCgpXZSBwdXQgYmxhbmtzIHRvIHRoZSBsZWZ0IG9mIHN0YXJz
LCBidXQgbm90IHRvIHRoZSByaWdodC4gKEknbSBzdXJlCnlvdSdkIGJlIGFibGUgdG8gcG9pbnQg
b3V0IGV4YW1wbGVzIHRvIHRoZSBjb250cmFyeSwgYnV0IHRoYXQncwp3aGF0IHdlJ3JlIGF0IGxl
YXN0IHN0cml2aW5nIGZvciwgZnJvbSBhbGwgSSBjYW4gdGVsbC4pCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
