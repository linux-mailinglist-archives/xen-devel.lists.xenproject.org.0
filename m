Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A66C0476
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:42:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoal-000821-NN; Fri, 27 Sep 2019 11:39:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDoak-00081w-8F
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:39:18 +0000
X-Inumbo-ID: 6fcbf69a-e11b-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6fcbf69a-e11b-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 11:39:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10D9AB18A;
 Fri, 27 Sep 2019 11:39:16 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-5-liuwe@microsoft.com>
 <20190925102354.2tr5ojk6yvfsqtxy@Air-de-Roger>
 <20190927113058.53xs3sw57as3r3tr@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f5459c03-dcc7-e498-1a78-d2bad960ef18@suse.com>
Date: Fri, 27 Sep 2019 13:39:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927113058.53xs3sw57as3r3tr@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next RFC 4/8] x86: factor out xen
 variants for hypervisor setup code
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <liuwe@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxMzozMCwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIFNlcCAyNSwgMjAx
OSBhdCAxMjoyMzo1NFBNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+PiBBbHNvIGl0
IG1pZ2h0IGJlIG5pY2UgdG8gaW50cm9kdWNlIHNvbWV0aGluZyBsaWtlOgo+Pgo+PiBlbnVtIGd1
ZXN0X3R5cGUgewo+PiAgICAgWEVOX0dVRVNULAo+PiB9IGd1ZXN0X3R5cGU7Cj4+Cj4gCj4gVGhp
cyB3b3JrcyBmb3IgbWUuCj4gCj4+IFNvIHRoYXQgeW91IGNhbiBhZGQgYSBzd2l0Y2ggaGVyZSwg
ZXZlbiBpZiB0aGUgb25seSBjYXNlIGlzIFhlbiBBVE0uIEkKPj4gZ3Vlc3MgdGhpcyB3aWxsIGJl
IGRvbmUgaW4gYSBsYXRlciBwYXRjaCwgb3IgaW50cm9kdWNlIGFuCj4+IGh5cGVydmlzb3Jfb3Bz
IHN0cnVjdCB0aGF0IGNvbnRhaW4gcG9pbnRlcnMgdG8gZnVuY3Rpb25zIHRvIGFsbG93IGZvcgo+
PiBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb25zLgo+Pgo+IAo+IEkgZGViYXRlZCB0aGlzLiBUaGVz
ZSBjaGFuZ2VzIHJlcXVpcmUgbW9yZSBjb2RlIGNodXJuIHdpdGggbm8gYXBwYXJlbnQKPiBiZW5l
Zml0LCBidXQgaWYgcGVvcGxlIGFncmVlIHRoaXMgaXMgYmV0dGVyIEkgY2FuIG1ha2UgdGhvc2Ug
Y2hhbmdlcy4KCldlbGwsIGlmIHRoZSBleHBlY3RhdGlvbiBpcyBmb3IgdGhlIGVudW0gdG8gZ3Jv
dyAoZXZlbiBqdXN0IGJ5IG9uZQpmdXJ0aGVyIGVudHJ5KSwgdGhlbiB5ZXMsIEknZCBhZ3JlZSB0
aGF0IGEgc3dpdGNoKCkgd291bGQgYmUgbmljZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
