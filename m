Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEA438B07
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 15:10:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZEam-0005cx-O0; Fri, 07 Jun 2019 13:07:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hZEal-0005cs-5b
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 13:07:35 +0000
X-Inumbo-ID: 36bcb2df-8925-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 36bcb2df-8925-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 13:07:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 07 Jun 2019 07:07:33 -0600
Message-Id: <5CFA61940200007800236408@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 07 Jun 2019 07:07:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CFA5D8102000078002363C1@prv1-mh.provo.novell.com>
 <7e1b3b55-b649-faf3-c7ee-5c3ab9fb4dea@citrix.com>
In-Reply-To: <7e1b3b55-b649-faf3-c7ee-5c3ab9fb4dea@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/AMD: make use of CPUID leaf 0xb when
 available
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
Cc: Pu Wen <puwen@hygon.cn>, Brian Woods <brian.woods@amd.com>,
 WeiLiu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDE0OjUzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMDYvMjAxOSAxMzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEluaXRpYWxs
eSBJIGRpZCBzaW1wbHkgc3R1bWJsZSBhY3Jvc3MgYSBiYWNrcG9ydCBvZiBMaW51eCBjb21taXQK
Pj4gZTBjZWVhZTcwOCAoIng4Ni9DUFUvaHlnb246IEZpeCBwaHlzX3Byb2NfaWQgY2FsY3VsYXRp
b24gbG9naWMgZm9yCj4+IG11bHRpLWRpZSBwcm9jZXNzb3JzIikgdG8gb3VyIGtlcm5lbHMuIFRo
ZXJlIEkgZ290IHB1enpsZWQgYnkgdGhlIGNsYWltCj4+IHRoYXQgYSBzaW1pbGFyIGNoYW5nZSBp
c24ndCBuZWVkZWQgb24gdGhlIEFNRCBzaWRlLiBBcyBwZXIgdGhlIHdlYiBwYWdlCj4+IGNpdGVk
IFsxXSwgdGhlcmUgYXJlbid0IHN1cHBvc2VkIHRvIGJlIGFmZmVjdGVkIEFNRCBwcm9jZXNzb3Jz
LCBidXQKPj4gYWNjb3JkaW5nIHRvIG15IHJlYWRpbmcgdGhlcmUgYXJlOiBUaGUgRVBZQyA3MDAw
IHNlcmllcyBjb21lcyB3aXRoIDgsCj4+IDE2LCAyNCwgb3IgMzIgY29yZXMsIHdoaWNoIEkgaW1w
bHkgdG8gYmUgMSwgMiwgMywgb3IgNCBkaWUgcHJvY2Vzc29ycy4KPj4gQW5kIG1hbnkgb2YgdGhl
bSBoYXZlICIxUC8yUCIgaW4gdGhlICJzb2NrZXQgY291bnQiIGNvbHVtbi4gVGhlcmVmb3JlCj4+
IG91ciBjYWxjdWxhdGlvbiwgYmVpbmcgYmFzZWQgb24gQ1BVSUQuODAwMDAwMDguRUJYWzE1OjEy
XSwgd291bGQgYmUKPj4gc2ltaWxhcmx5IHdyb25nIG9uIHN1Y2ggMi1zb2NrZXQgMS0gb3IgMi1k
aWUgc3lzdGVtcy4KPj4KPj4gQ2hlY2tpbmcgTGludXggY29kZSBJIHRoZW4gZm91bmQgdGhhdCB0
aGV5IGRvbid0IGV2ZW4gcmVseSBvbiB0aGUKPj4gY2FsY3VsYXRpb24gd2UgY3VycmVudGx5IHVz
ZSBhbnltb3JlLCBhdCBsZWFzdCBub3QgaW4gdGhlIGNhc2Ugd2hlbgo+PiBsZWFmIDB4YiBpcyBh
dmFpbGFibGUgKHdoaWNoIGlzIHRoZSBjYXNlIG9uIEZhbTE3KS4gTGV0J3MgZm9sbG93Cj4+IFN1
cmF2ZWUncyBMaW51eCBjb21taXQgMzk4NmEwYTgwNSAoIng4Ni9DUFUvQU1EOiBEZXJpdmUgQ1BV
IHRvcG9sb2d5Cj4+IGZyb20gQ1BVSUQgZnVuY3Rpb24gMHhCIHdoZW4gYXZhaWxhYmxlIikgaW4g
dGhpcyByZWdhcmQgdG8gYWRkcmVzcyB0aGlzLgo+Pgo+PiBUbyBhdm9pZCBsb2dnaW5nIGR1cGxp
Y2F0ZSBpbmZvcm1hdGlvbiwgbWFrZSB0aGUgZnVuY3Rpb24gcmV0dXJuIGJvb2wuCj4+IE1vdmUg
aXRzIGFuZCBkZXRlY3RfaHQoKSdzIGRlY2xhcmF0aW9uIHRvIGEgcHJpdmF0ZSBoZWFkZXIgYXQg
dGhlIHNhbWUKPj4gdGltZS4KPj4KPj4gWzFdIGh0dHBzOi8vd3d3LmFtZC5jb20vZW4vcHJvZHVj
dHMvc3BlY2lmaWNhdGlvbnMvcHJvY2Vzc29ycyAKPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLgoKPiBIeWdvbiBGYW0xOGggaXMgYmFz
aWNhbGx5IGlkZW50aWNhbCB0byBBTUQgRmFtMTdoIGF0IHRoZSBtb21lbnQsIHNvIGFuCj4gZXF1
aXZhbGVudCBjaGFuZ2UgaW4gaHlnb24uYyBzaG91bGQgYWxzbyBiZSBtYWRlLgoKV2VsbCwgdGhl
IHNpdHVhdGlvbiBvbiB0aGUgTGludXggc2lkZSBpc24ndCBlbnRpcmVseSBjbGVhcjogVGhleSBk
bwp1c2UgdGhlIGZ1bmN0aW9uLCBidXQgYWZ0ZXJ3YXJkcyBuZXZlcnRoZWxlc3Mgb3ZlcnJpZGUK
Yy0+cGh5c19wcm9jX2lkIGJ5IHRoYXQgc2xpZ2h0bHkgb2RkIGFwcHJvYWNoLiBUaGVyZWZvcmUg
SSdkCnJlYWxseSBwcmVmZXIgY2xhcmlmaWNhdGlvbiBvbiB3aGF0IGlzIHJlYWxseSBuZWVkZWQg
dGhlcmUgZmlyc3QsCmFuZCB0aGVuIGFsc28gc2VlIHdoZXRoZXIgdGhlIEFNRCBzaWRlIG1heSBh
bHNvIG5lZWQgZnVydGhlcgphZGp1c3RtZW50LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
