Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D3B188CD1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 19:08:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEGar-0001hf-Jg; Tue, 17 Mar 2020 18:05:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iujj=5C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jEGaq-0001ha-LY
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 18:05:32 +0000
X-Inumbo-ID: e3948f20-6879-11ea-bec1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3948f20-6879-11ea-bec1-bc764e2007e4;
 Tue, 17 Mar 2020 18:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584468332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SqSdZuA6wxscEH7Hlgfkg2kkgvWQ4PVwbN+yMzvzo7Y=;
 b=V+x0IGPXG+aWH9pZBq89oT5ERXmOHaAx377K8LsgXd/Pqd7kM9RTiug9
 uikJ9FTx5Uk3h28sXGs5lDOf+xrTHJ9yKu6eQiBXtK5mT28FSXR3aNSDq
 dnjoKmrdTouNC16tZ8bHydGIbYM8XlRChRkZzo8Ov8wmR5GhXizY9RL8i Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /jC2Fk4zZ5lLnq1rH/nJghZil7WqovvOBgEMXgLCN5uCN542fbtVbH72heZdZF/O8j/IVSKFEq
 sE8fT89uaA3+adyQ4/L2XNV6PNKJxEXNyZLzitBMCah9YZO6aepEg8hyOh+TBp0hjOdppPVIt1
 MlCUTrrvC2sBooC/e05K8lZoA44M4A0Ax2DgT7Hk1GE+zDaXzr9h7KkNjFV2s3wDT9gVjaJH6d
 a3h6XeV2XZm3oXXIzUq/XkHYKx/Ly6p2vabEhzGGeS9L0EzhFtNgU+jjJcC9YhrJc1lazMkBPk
 Uw0=
X-SBRS: 2.7
X-MesageID: 14145025
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,565,1574139600"; d="scan'208";a="14145025"
Date: Tue, 17 Mar 2020 18:05:24 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20200317180524.GA4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-16-anthony.perard@citrix.com>
 <20200227110504.GN24458@Air-de-Roger.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227110504.GN24458@Air-de-Roger.citrite.net>
Subject: Re: [Xen-devel] [XEN PATCH v3 15/23] xen/build: have the root
 Makefile generates the CFLAGS
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMTI6MDU6MDRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEZlYiAyNiwgMjAyMCBhdCAxMTozMzo0N0FNICswMDAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+ICtpZmVxICgkKENPTkZJR19ERUJVRykseSkKPiA+ICtDRkxB
R1MgKz0gLU8xCj4gPiArZWxzZQo+ID4gK0NGTEFHUyArPSAtTzIKPiA+ICtlbmRpZgo+IAo+IExv
bmcgdGVybSB3ZSBtaWdodCB3YW50IHRvIG1ha2UgdGhlIG9wdGltaXphdGlvbiBsZXZlbCBzZWxl
Y3RhYmxlIGluCj4gS2NvbmZpZyBJTU8uCgpZZXAuCgo+ID4gK2lmbmVxICgkKENPTkZJR19DQ19J
U19DTEFORykseSkKPiA+ICsjIENsYW5nIGRvZXNuJ3QgdW5kZXJzdGFuZCB0aGlzIGNvbW1hbmQg
bGluZSBhcmd1bWVudCwgYW5kIGRvZXNuJ3QgYXBwZWFyIHRvCj4gPiArIyBoYXZlIGFuIHN1aXRh
YmxlIGFsdGVybmF0aXZlLiAgVGhlIHJlc3VsdGluZyBjb21waWxlZCBiaW5hcnkgZG9lcyBmdW5j
dGlvbiwKPiA+ICsjIGJ1dCBoYXMgYW4gZXhjZXNzaXZlbHkgbGFyZ2Ugc3ltYm9sIHRhYmxlLgo+
ID4gK0NGTEFHUyArPSAtV2EsLS1zdHJpcC1sb2NhbC1hYnNvbHV0ZQo+IAo+IFRoaXMgaXMgbm90
IHJlYWxseSByZWxhdGVkIHRvIGNsYW5nLCBidXQgdG8gdGhlIGFzc2VtYmxlci4gSWYgY2xhbmcg
aXMKPiB1c2VkIHdpdGggLW5vLWludGVncmF0ZWQtYXMgaXQncyBxdWl0ZSBsaWtlbHkgdGhhdCB0
aGUgR05VIGFzc2VtYmxlcgo+IHdpbGwgYmUgdXNlZCwgYW5kIGhlbmNlIHRoaXMgb3B0aW9uIHdv
dWxkIGJlIGF2YWlsYWJsZS4KPiAKPiBDYW4gd2UgdXNlIGNjLW9wdGlvbi1hZGQgaGVyZSBpbiBv
cmRlciB0byBkZXRlY3Qgd2hldGhlciB0aGUgYnVpbGQKPiB0b29sY2hhaW4gc3VwcG9ydCB0aGUg
b3B0aW9uPwoKVGhhdCBjYW4gYmUgZG9uZSwgYnV0IEkgdGhpbmsgSSdsbCBkbyB0aGF0IGFzIGEg
Zm9sbG93IHVwIG9mIHRoaXMgcGF0Y2gsCnRvIGF2b2lkIHRvbyBtYW55IGNoYW5nZXMgd2hlbiBt
b3ZpbmcgdGhlIGNmbGFncyBhcm91bmQuCgo+IElkZWFsbHkgdGhpcyBzaG91bGQgYmUgZG9uZSBh
ZnRlciB0aGUgaW50ZWdyYXRlZCBhc3NlbWJsZXIgdGVzdHMKPiBwZXJmb3JtZWQgaW4geDg2L1J1
bGVzLm1rLgoKPiA+ICtpZmVxICgkKENPTkZJR19VQlNBTikseSkKPiA+ICtDRkxBR1NfVUJTQU4g
Oj0gLWZzYW5pdGl6ZT11bmRlZmluZWQKPiA+ICtlbHNlCj4gPiArQ0ZMQUdTX1VCU0FOIDo9Cj4g
Cj4gRG8geW91IG5lZWQgdG8gZGVmaW5lIHRoaXMgdG8gZW1wdHkgc28gaXQgY2FuIGJlIGV4cG9y
dGVkIGJlbG93PyBJc24ndAo+IGl0IGVub3VnaCB0byBqdXN0IG5vdCBzZXQgaXQgYXQgYWxsPwoK
VGhhdCBoYXMgdHdvIGZ1bmN0aW9ucywgc2V0dGluZyB0aGUgY29ycmVjdCBmbGF2b3IgZm9yIHRo
ZSB2YXJpYWJsZSBhbmQKcmVzZXQgdGhlIHZhbHVlIGlmIHRoZSB2YWx1ZSBoYXBwZW4gdG8gYWxy
ZWFkeSBiZSBpbiB0aGUgZW52aXJvbm1lbnQuClRoZSBzZWNvbmQgb25lIGlzIGltcG9ydGFudCBJ
IHRoaW5rLgoKPiA+ICsjIGRlZmluZSBuZXcgdmFyaWFibGVzIHRvIGF2b2lkIHRoZSBvbmVzIGRl
ZmluZXMgaW4gQ29uZmlnLm1rCj4gPiArZXhwb3J0IFhFTl9DRkxBR1MgOj0gJChDRkxBR1MpCj4g
PiArZXhwb3J0IFhFTl9BRkxBR1MgOj0gJChBRkxBR1MpCj4gPiArZXhwb3J0IFhFTl9MREZMQUdT
IDo9ICQoTERGTEFHUykKPiA+ICtleHBvcnQgQ0ZMQUdTX1VCU0FOCj4gCj4gWW91IG1pZ2h0IHdh
bnQgdG8gcmVuYW1lIHRoaXMgdG8gWEVOX0NGTEFHU19VQlNBTiBmb3IgY29oZXJlbmN5IHdpdGgK
PiB0aGUgcmVzdCBvZiB0aGUgZXhwb3J0ZWQgdmFyaWFibGVzPwoKSSBkb24ndCBrbm93LCBJIHRo
aW5rIGl0J3MgZmluZSBsaWtlIHRoYXQuIFRoZXkgYXJlIG90aGVyIGV4cG9ydGVkCnZhcmlhYmxl
cywgbGlrZSBDRkxBR1Mtc3RhY2stYm91bmRhcnkgZm9yIGZsYWdzLiBOb3QgYWRkaW5nIFhFTl8g
cHJlZml4CnRvIGFsbCBvZiB0aGVtIG1lYW4gbGVzcyBtb2RpZmljYXRpb25zLCBhbmQgbGVzcyBl
cnJvcnMgd2hlbiBkb2luZyBzby4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
