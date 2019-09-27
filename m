Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BC8C05DC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:58:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpnK-0002MZ-Px; Fri, 27 Sep 2019 12:56:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDpnJ-0002MS-61
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:56:21 +0000
X-Inumbo-ID: 338e38d6-e126-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 338e38d6-e126-11e9-8628-bc764e2007e4;
 Fri, 27 Sep 2019 12:56:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CFAD2B172;
 Fri, 27 Sep 2019 12:56:19 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-5-liuwe@microsoft.com>
 <20190925102354.2tr5ojk6yvfsqtxy@Air-de-Roger>
 <20190927113058.53xs3sw57as3r3tr@debian>
 <f5459c03-dcc7-e498-1a78-d2bad960ef18@suse.com>
 <20190927124745.6ozkkm4qpilr7j66@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ff37535-fc22-411d-0484-541778a55793@suse.com>
Date: Fri, 27 Sep 2019 14:56:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927124745.6ozkkm4qpilr7j66@debian>
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

T24gMjcuMDkuMjAxOSAxNDo0NywgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIFNlcCAyNywgMjAx
OSBhdCAwMTozOToxNFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjcuMDkuMjAx
OSAxMzozMCwgV2VpIExpdSB3cm90ZToKPj4+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDEyOjIz
OjU0UE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gQWxzbyBpdCBtaWdodCBi
ZSBuaWNlIHRvIGludHJvZHVjZSBzb21ldGhpbmcgbGlrZToKPj4+Pgo+Pj4+IGVudW0gZ3Vlc3Rf
dHlwZSB7Cj4+Pj4gICAgIFhFTl9HVUVTVCwKPj4+PiB9IGd1ZXN0X3R5cGU7Cj4+Pj4KPj4+Cj4+
PiBUaGlzIHdvcmtzIGZvciBtZS4KPj4+Cj4+Pj4gU28gdGhhdCB5b3UgY2FuIGFkZCBhIHN3aXRj
aCBoZXJlLCBldmVuIGlmIHRoZSBvbmx5IGNhc2UgaXMgWGVuIEFUTS4gSQo+Pj4+IGd1ZXNzIHRo
aXMgd2lsbCBiZSBkb25lIGluIGEgbGF0ZXIgcGF0Y2gsIG9yIGludHJvZHVjZSBhbgo+Pj4+IGh5
cGVydmlzb3Jfb3BzIHN0cnVjdCB0aGF0IGNvbnRhaW4gcG9pbnRlcnMgdG8gZnVuY3Rpb25zIHRv
IGFsbG93IGZvcgo+Pj4+IGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMuCj4+Pj4KPj4+Cj4+PiBJ
IGRlYmF0ZWQgdGhpcy4gVGhlc2UgY2hhbmdlcyByZXF1aXJlIG1vcmUgY29kZSBjaHVybiB3aXRo
IG5vIGFwcGFyZW50Cj4+PiBiZW5lZml0LCBidXQgaWYgcGVvcGxlIGFncmVlIHRoaXMgaXMgYmV0
dGVyIEkgY2FuIG1ha2UgdGhvc2UgY2hhbmdlcy4KPj4KPj4gV2VsbCwgaWYgdGhlIGV4cGVjdGF0
aW9uIGlzIGZvciB0aGUgZW51bSB0byBncm93IChldmVuIGp1c3QgYnkgb25lCj4+IGZ1cnRoZXIg
ZW50cnkpLCB0aGVuIHllcywgSSdkIGFncmVlIHRoYXQgYSBzd2l0Y2goKSB3b3VsZCBiZSBuaWNl
Lgo+IAo+IE5vdCBzdXJlIGlmIHlvdSBub3RpY2UgY29tbWVudHMgaW4gYSBsYXRlciBlbWFpbC4K
PiAKPiBEbyB5b3UgcHJlZmVyIGVudW0rc3dpdGNoIHNvbHV0aW9uIG9yIGh5cGVydmlzb3Jfb3Ag
c3RydWN0PwoKSGFyZCB0byB0ZWxsIHdpdGhvdXQga25vd2luZyBob3cgbWFueSBzd2l0Y2goKSB0
aGVyZSB3b3VsZAplbmQgdXAgYmVpbmcuIFRoZSBtb3JlIG9mIHRoZW0sIHRoZSBiZXR0ZXIgSSdk
IGxpa2UgdGhlIG9wcwpzdHJ1Y3R1cmUgdmFyaWFudC4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
