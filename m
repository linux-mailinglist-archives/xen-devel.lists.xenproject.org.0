Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C10938ABB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 14:56:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZENF-0004UL-UA; Fri, 07 Jun 2019 12:53:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0f+t=UG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hZENF-0004UD-7d
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 12:53:37 +0000
X-Inumbo-ID: 42ef5b4e-8923-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 42ef5b4e-8923-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 12:53:35 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v6ilnnV0GzK7QnkkwHki/BlGpl65Q0GQVjbrtpocGx8LiZKjwOrULDTsON+8iudKUVUBbk2Wqt
 kLJF/nzLMSoEkAh8mYjCuKi6IxDIGufx2pUwuy7LCMR+CAQOE7tjnp/p2Ty8DOc1/Ad+OPY6Ys
 4MwtYSVi7erJAVkDHGySSk9sOaRb49HzznYOA1lKqDex8odVjtTB57JVy8o7NPOVcEby985336
 XvggLrTDOuq0/++OY44HP9QHwCEvNw5k/eIR2d1kacSlGj3+RbF3m2sfs0hE9xxO8oYNb2NuZQ
 Iw8=
X-SBRS: -0.9
X-MesageID: 1453843
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,563,1557201600"; 
   d="scan'208";a="1453843"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CFA5D8102000078002363C1@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7e1b3b55-b649-faf3-c7ee-5c3ab9fb4dea@citrix.com>
Date: Fri, 7 Jun 2019 13:53:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CFA5D8102000078002363C1@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Pu
 Wen <puwen@hygon.cn>, Brian Woods <brian.woods@amd.com>, Wei Liu <wl@xen.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDYvMjAxOSAxMzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW5pdGlhbGx5IEkgZGlk
IHNpbXBseSBzdHVtYmxlIGFjcm9zcyBhIGJhY2twb3J0IG9mIExpbnV4IGNvbW1pdAo+IGUwY2Vl
YWU3MDggKCJ4ODYvQ1BVL2h5Z29uOiBGaXggcGh5c19wcm9jX2lkIGNhbGN1bGF0aW9uIGxvZ2lj
IGZvcgo+IG11bHRpLWRpZSBwcm9jZXNzb3JzIikgdG8gb3VyIGtlcm5lbHMuIFRoZXJlIEkgZ290
IHB1enpsZWQgYnkgdGhlIGNsYWltCj4gdGhhdCBhIHNpbWlsYXIgY2hhbmdlIGlzbid0IG5lZWRl
ZCBvbiB0aGUgQU1EIHNpZGUuIEFzIHBlciB0aGUgd2ViIHBhZ2UKPiBjaXRlZCBbMV0sIHRoZXJl
IGFyZW4ndCBzdXBwb3NlZCB0byBiZSBhZmZlY3RlZCBBTUQgcHJvY2Vzc29ycywgYnV0Cj4gYWNj
b3JkaW5nIHRvIG15IHJlYWRpbmcgdGhlcmUgYXJlOiBUaGUgRVBZQyA3MDAwIHNlcmllcyBjb21l
cyB3aXRoIDgsCj4gMTYsIDI0LCBvciAzMiBjb3Jlcywgd2hpY2ggSSBpbXBseSB0byBiZSAxLCAy
LCAzLCBvciA0IGRpZSBwcm9jZXNzb3JzLgo+IEFuZCBtYW55IG9mIHRoZW0gaGF2ZSAiMVAvMlAi
IGluIHRoZSAic29ja2V0IGNvdW50IiBjb2x1bW4uIFRoZXJlZm9yZQo+IG91ciBjYWxjdWxhdGlv
biwgYmVpbmcgYmFzZWQgb24gQ1BVSUQuODAwMDAwMDguRUJYWzE1OjEyXSwgd291bGQgYmUKPiBz
aW1pbGFybHkgd3Jvbmcgb24gc3VjaCAyLXNvY2tldCAxLSBvciAyLWRpZSBzeXN0ZW1zLgo+Cj4g
Q2hlY2tpbmcgTGludXggY29kZSBJIHRoZW4gZm91bmQgdGhhdCB0aGV5IGRvbid0IGV2ZW4gcmVs
eSBvbiB0aGUKPiBjYWxjdWxhdGlvbiB3ZSBjdXJyZW50bHkgdXNlIGFueW1vcmUsIGF0IGxlYXN0
IG5vdCBpbiB0aGUgY2FzZSB3aGVuCj4gbGVhZiAweGIgaXMgYXZhaWxhYmxlICh3aGljaCBpcyB0
aGUgY2FzZSBvbiBGYW0xNykuIExldCdzIGZvbGxvdwo+IFN1cmF2ZWUncyBMaW51eCBjb21taXQg
Mzk4NmEwYTgwNSAoIng4Ni9DUFUvQU1EOiBEZXJpdmUgQ1BVIHRvcG9sb2d5Cj4gZnJvbSBDUFVJ
RCBmdW5jdGlvbiAweEIgd2hlbiBhdmFpbGFibGUiKSBpbiB0aGlzIHJlZ2FyZCB0byBhZGRyZXNz
IHRoaXMuCj4KPiBUbyBhdm9pZCBsb2dnaW5nIGR1cGxpY2F0ZSBpbmZvcm1hdGlvbiwgbWFrZSB0
aGUgZnVuY3Rpb24gcmV0dXJuIGJvb2wuCj4gTW92ZSBpdHMgYW5kIGRldGVjdF9odCgpJ3MgZGVj
bGFyYXRpb24gdG8gYSBwcml2YXRlIGhlYWRlciBhdCB0aGUgc2FtZQo+IHRpbWUuCj4KPiBbMV0g
aHR0cHM6Ly93d3cuYW1kLmNvbS9lbi9wcm9kdWN0cy9zcGVjaWZpY2F0aW9ucy9wcm9jZXNzb3Jz
IAo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQWNr
ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpIeWdvbiBG
YW0xOGggaXMgYmFzaWNhbGx5IGlkZW50aWNhbCB0byBBTUQgRmFtMTdoIGF0IHRoZSBtb21lbnQs
IHNvIGFuCmVxdWl2YWxlbnQgY2hhbmdlIGluIGh5Z29uLmMgc2hvdWxkIGFsc28gYmUgbWFkZS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
