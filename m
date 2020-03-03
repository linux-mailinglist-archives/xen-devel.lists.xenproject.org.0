Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD7E176ECF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 06:36:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j909i-00015O-7R; Tue, 03 Mar 2020 05:31:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQGm=4U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j909g-00015J-9t
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 05:31:44 +0000
X-Inumbo-ID: 42c17e92-5d10-11ea-a07c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42c17e92-5d10-11ea-a07c-12813bfff9fa;
 Tue, 03 Mar 2020 05:31:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B49AAE1E;
 Tue,  3 Mar 2020 05:31:40 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9b3423b9-6cf1-1cc3-5011-f383979f12aa@suse.com>
 <96b8db2cab78470bd7cab97b6bbca3049999dfd3.camel@suse.com>
 <26a2f836-9d64-0507-63ec-1aad496dc8ae@suse.com>
 <68fc62c1fab2e200374d9758784cc8e63972124f.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <343e0b27-92be-fa55-a049-4cd5ebf87c1b@suse.com>
Date: Tue, 3 Mar 2020 06:31:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <68fc62c1fab2e200374d9758784cc8e63972124f.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] credit2: avoid NULL deref in
 csched2_res_pick() when tracing
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
Cc: George Dunlap <george.dunlap@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDMuMjAgMTk6MTYsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIE1vbiwgMjAyMC0w
My0wMiBhdCAxNzo1OSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMDIuMDMuMjAg
MTc6NDksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pj4gT24gTW9uLCAyMDIwLTAzLTAyIGF0IDA5
OjU4ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pgo+Pj4+ICAgICAgQEAgLTIzNjAsNiAr
MjM2MCw4IEBACj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICB1bml0LT5jcHVfc29mdF9h
ZmZpbml0eSk7Cj4+Pj4gICAgICAgICAgICAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hf
Y3B1KGNwdSksCj4+Pj4gY3B1bWFza19zY3JhdGNoX2NwdShjcHUpLAo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJm1pbl9zX3JxZC0+YWN0aXZlKTsKPj4+PiAgICAgICsKPj4+PiAgICAg
ICsgICAgICAgIEJVR19PTighbWluX3JxZCk7Cj4+Pj4gICAgICAgICAgIH0KPj4+PiAgICAgICAg
ICAgZWxzZSBpZiAoIG1pbl9ycWQgKQo+Pj4+ICAgICAgICAgICB7Cj4+Pj4KPj4+PiBwb3NzaWJs
eSBhY2NvbXBhbmllZCBieSBhIGNvbW1lbnQuIFRob3VnaHRzPwo+Pj4+Cj4+PiBZZXMsIEkgdGhp
bmsgdGhpcyBpcyBhIGdvb2QgaWRlYS4KPj4+Cj4+PiBQZXJzb25hbGx5LCBJJ2QgcHV0IHRoZSBC
VUdfT04oKSBvdXRzaWRlIG9mIHRoZSAiaWYge30gZWxzZSBpZiB7fQo+Pj4gZWxzZQo+Pj4ge30i
IGJsb2NrIChpLmUuLCBqdXN0IGFib3ZlIHRoZSBjcHVtYXNrX2N5Y2xlKCkuCj4+Cj4+IEkgZG9u
J3QgdGhpbmsgc28uCj4+Cj4+IE90aGVyd2lzZSB0aGUgImVsc2UgaWYgKCBtaW5fcnFkICkiIHdv
dWxkbid0IG1ha2Ugc2Vuc2UuCj4+Cj4gV2h5IHdvdWxkbid0IGl0Pwo+IAo+IEkgbWVhbiwgd2hh
dCBJIHdhcyBzYXlpbmcgaXMgdGhhdCBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSwK
PiBqdXN0IGJlZm9yZSB0aGlzOgo+IAo+ICAgbmV3X2NwdSA9IGNwdW1hc2tfY3ljbGUobWluX3Jx
ZC0+cGlja19iaWFzLCBjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSkpOwo+ICAgbWluX3JxZC0+cGlj
a19iaWFzID0gbmV3X2NwdTsKClNvcnJ5LCBteSBicmFpbiB3YXMgaW4gYSBsb3cgcG93ZXIgc3Rh
dGUuCgpJIG1hbmFnZWQgdG8gdW5kZXJzdGFuZCB5b3UgY29tcGxldGVseSB3cm9uZywgdGhpbmtp
bmcgeW91IHdhbnRlZCB0bwphZGQgdGhlIEJVR19PTigpIGJlZm9yZSB0aGUgaWYgLi4uIGJsb2Nr
LgoKU29ycnkgZm9yIHRoZSBub2lzZSwKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
