Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4A11519F0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 12:36:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iywSa-0004dG-4v; Tue, 04 Feb 2020 11:33:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jKxq=3Y=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iywSY-0004dB-Q2
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 11:33:38 +0000
X-Inumbo-ID: 2e37bb82-4742-11ea-8f12-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e37bb82-4742-11ea-8f12-12813bfff9fa;
 Tue, 04 Feb 2020 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580816016;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gmVSz5Pb4bafx+rNd8+01+hG2uvGsQ+X2wVD0KTJtck=;
 b=WYznl0/pSRFaDun+TtEZDP6NDiOkGRn6/IWVFEZ4EhQDt6EfKf5uA3P2
 pyZ8i1QwJcJSmb8lWnohtzsEm7E8WoZz9KBB08CJg13QvkdcTdHVBGAEx
 sXUO12DJrvu/fGTbOYWQ4/eZWaTArVt7uy+DFEB26yOYSCWRBqWy5hN3J Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: srC/OjxWeqPEkC942bGPaZTTr5mpwRGChBtEtH3ONo9RpkhZsdHlaf71cVg9zjsrmTrmm1Puk5
 cbIaqE5uJZ7GBn/ulM/kurd+hs+4HKh0TokRj+qbfve7p0iEVmGnv8Nt1Sthanc6wKYVtfwOo+
 nmc20/f5X3QIwlJM5iHiZCCw3b/U+76d3VleWAzKMsr9R5PHtngpAOA8C/vlCz0t8wNkCD0xpa
 ISw/d2vnPoWgoT5n1Mc8B+YaBF8RZrPDo1Se5pdk2PWd5ioMrqvqyoHBy+JxRCBH4ZzhE3ZwhI
 zoc=
X-SBRS: 2.7
X-MesageID: 11914762
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="11914762"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>
References: <20200204093411.15887-1-julien@xen.org>
 <20200204093411.15887-3-julien@xen.org> <20200204105156.GH4679@Air-de-Roger>
 <58bc6c70-89f5-cdcf-552c-1ea5a3fa5508@xen.org>
 <20200204112807.GK4679@Air-de-Roger>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 mQINBFPqG+MBEACwPYTQpHepyshcufo0dVmqxDo917iWPslB8lauFxVf4WZtGvQSsKStHJSj
 92Qkxp4CH2DwudI8qpVbnWCXsZxodDWac9c3PordLwz5/XL41LevEoM3NWRm5TNgJ3ckPA+J
 K5OfSK04QtmwSHFP3G/SXDJpGs+oDJgASta2AOl9vPV+t3xG6xyfa2NMGn9wmEvvVMD44Z7R
 W3RhZPn/NEZ5gaJhIUMgTChGwwWDOX0YPY19vcy5fT4bTIxvoZsLOkLSGoZb/jHIzkAAznug
 Q7PPeZJ1kXpbW9EHHaUHiCD9C87dMyty0N3TmWfp0VvBCaw32yFtM9jUgB7UVneoZUMUKeHA
 fgIXhJ7I7JFmw3J0PjGLxCLHf2Q5JOD8jeEXpdxugqF7B/fWYYmyIgwKutiGZeoPhl9c/7RE
 Bf6f9Qv4AtQoJwtLw6+5pDXsTD5q/GwhPjt7ohF7aQZTMMHhZuS52/izKhDzIufl6uiqUBge
 0lqG+/ViLKwCkxHDREuSUTtfjRc9/AoAt2V2HOfgKORSCjFC1eI0+8UMxlfdq2z1AAchinU0
 eSkRpX2An3CPEjgGFmu2Je4a/R/Kd6nGU8AFaE8ta0oq5BSFDRYdcKchw4TSxetkG6iUtqOO
 ZFS7VAdF00eqFJNQpi6IUQryhnrOByw+zSobqlOPUO7XC5fjnwARAQABtCRHZW9yZ2UgVy4g
 RHVubGFwIDxkdW5sYXBnQHVtaWNoLmVkdT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgID
 AQACHgECF4ACGQEWIQTXqBy2bTNXPzpOYFimNjwxBZC0bQUCXEowWQUJDCJ7dgAKCRCmNjwx
 BZC0beKvEACJ75YlJXd7TnNHgFyiCJkm/qPeoQ3sFGSDZuZh7SKcdt9+3V2bFEb0Mii1hQaz
 3hRqZb8sYPHJrGP0ljK09k3wf8k3OuNxziLQBJyzvn7WNlE4wBEcy/Ejo9TVBdA4ph5D0YaZ
 nqdsPmxe/xlTFuSkgu4ep1v9dfVP1TQR0e+JIBa/Ss+cKC5intKm+8JxpOploAHuzaPu0L/X
 FapzsIXqgT9eIQeBEgO2hge6h9Jov3WeED/vh8kA7f8c6zQ/gs5E7VGALwsiLrhr0LZFcKcw
 kI3oCCrB/C/wyPZv789Ra8EXbeRSJmTjcnBwHRPjnjwQmetRDD1t+VyrkC6uujT5jmgOBzaj
 KCqZ8PcMAssOzdzQtKmjUQ2b3ICPs2X13xZ5M5/OVs1W3TG5gkvMh4YoHi4ilFnOk+v3/j7q
 65FG6N0JLb94Ndi80HkIOQQ1XVGTyu6bUPaBg3rWK91Csp1682kD/dNVF3FKHrRLmSVtmEQR
 5rK0+VGc/FmR6vd4haKGWIRuPxzg+pBR77avIZpU7C7+UXGuZ5CbHwIdY8LojJg2TuUdqaVj
 yxmEZLOA8rVHipCGrslRNthVbJrGN/pqtKjCClFZHIAYJQ9EGLHXLG9Pj76opfjHij3MpR3o
 pCGAh6KsCrfrsvjnpDwqSbngGyEVH030irSk4SwIqZ7FwA==
Message-ID: <eaf932d8-79f2-61dd-9648-189c9e2ea955@citrix.com>
Date: Tue, 4 Feb 2020 11:33:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200204112807.GK4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi80LzIwIDExOjI4IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIFR1ZSwgRmVi
IDA0LCAyMDIwIGF0IDExOjExOjExQU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4KPj4K
Pj4gT24gMDQvMDIvMjAyMCAxMDo1MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFR1
ZSwgRmViIDA0LCAyMDIwIGF0IDA5OjM0OjExQU0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgo+Pj4+Cj4+Pj4gVW5s
aWtlIHNoYWRvd19lbmFibGUoKSwgaGFwX2VuYWJsZSgpIGNhbiBvbmx5IGJlIGNhbGxlZCBvbmNl
IGR1cmluZwo+Pj4+IGRvbWFpbiBjcmVhdGlvbiBhbmQgd2l0aCB0aGUgbW9kZSBlcXVhbCB0byBt
b2RlIGVxdWFsIHRvCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiBl
cXVhbHMgdG8KPj4KPj4gV2lsbCBmaXggaXQuCj4+Cj4+Pj4gUEdfZXh0ZXJuYWwgfCBQR190cmFu
c2xhdGUgfCBQR19yZWZjb3VudHMuCj4+Pj4KPj4+PiBJZiBpdCB3ZXJlIGNhbGxlZCB0d2ljZSwg
dGhlbiB3ZSBtaWdodCBoYXZlIHNvbWV0aGluZyBpbnRlcmVzdGluZwo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGEgcHJvYmxlbQo+Pj4+IHByb2Js
ZW0gYXMgdGhlIHAybSB0YWJsZXMgd291bGQgYmUgcmUtYWxsb2NhdGVkIChhbmQgdGhlcmVmb3Jl
IGFsbCB0aGUKPj4+PiBtYXBwaW5ncyB3b3VsZCBiZSBsb3N0KS4KPj4+Pgo+Pj4+IEFkZCBjb2Rl
IHRvIHNhbml0eSBjaGVjayB0aGUgbW9kZSBhbmQgdGhhdCB0aGUgZnVuY3Rpb24gaXMgb25seSBj
YWxsZWQKPj4+PiBvbmNlLiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBhbiBpZiBjaGVja2luZyB0
aGF0IFBHX3RyYW5zbGF0ZSBpcyBzZXQuCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeIGFkZCBhbiBpZgo+Pgo+PiBXaWxsIGZpeCBpdC4KPj4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4+Pj4KPj4+PiAtLS0KPj4+
Pgo+Pj4+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aGVuIFBHX3RyYW5zbGF0ZSB3YXMgZW5m
b3JjZWQuCj4+Pj4gLS0tCj4+Pj4gICB4ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jIHwgMTggKysr
KysrKysrKystLS0tLS0tCj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vaGFw
L2hhcC5jIGIveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+Pj4+IGluZGV4IDMxMzYyYTMxYjYu
LmI3MzRlMmU2ZDMgMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMKPj4+PiBAQCAtNDQ1LDYgKzQ0NSwx
MyBAQCBpbnQgaGFwX2VuYWJsZShzdHJ1Y3QgZG9tYWluICpkLCB1MzIgbW9kZSkKPj4+PiAgICAg
ICB1bnNpZ25lZCBpbnQgaTsKPj4+PiAgICAgICBpbnQgcnYgPSAwOwo+Pj4+ICsgICAgaWYgKCBt
b2RlICE9IChQR19leHRlcm5hbCB8IFBHX3RyYW5zbGF0ZSB8IFBHX3JlZmNvdW50cykgKQo+Pj4+
ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICsKPj4+PiArICAgIC8qIFRoZSBmdW5jdGlv
biBjYW4gb25seSBiZSBjYWxsZWQgb25jZSAqLwo+Pj4+ICsgICAgaWYgKCBkLT5hcmNoLnBhZ2lu
Zy5tb2RlICE9IDAgKQo+Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4KPj4+IElmIHlv
dSB3YW50IHRvIHJldHVybiBFSU5WQUwgZm9yIGJvdGggdGhleSBjYW4gYmUgbWVyZ2VkIGludG8g
YSBzaW5nbGUKPj4+IGlmLiBBbHNvIG5vdGUgdGhhdCB0aGlzIHdvdWxkIHVzdWFsbHkgYmUgd3Jp
dHRlbiBhcwo+Pj4gaWYgKCBkLT5hcmNoLnBhZ2luZy5tb2RlICkgdG8ga2VlcCBpdCBzaG9ydGVy
Lgo+Pgo+PiBUbyBiZSBob25lc3QsIHRoaXMgaXMgYSBtYXR0ZXIgb2YgdGFzdGUuIFRoZXJlIGlz
IGFsc28gYW4gYXJndW1lbnQgdGhhdCBmb3IKPj4gTUlTUkEsIHlvdXIgc3VnZ2VzdGlvbiBpcyBu
b3QgY29tcGxpYW50IChzZWUgUnVsZSAxNC40KS4KPiAKPiBPaCwgdGhlbiB3ZSBzaG91bGQgYWRk
IHRob3NlIHJ1bGVzIHRvIENPRElOR19TVFlMRSBpZiB0aGV5IGFyZSB0byBiZQo+IGVuZm9yY2Vk
Lgo+IAo+IFNvIGZhciB0aGUgc3R5bGUgb2YgbW9zdCBvZiB0aGUgaHlwZXJ2aXNvciBjb2RlIGlz
IHRvIG9taXQgdGhlIHZhbHVlCj4gd2hlbiBjb21wYXJpbmcgYWdhaW5zdCAwIG9yIE5VTEwgQUZB
SUsuCj4gCj4gSSBkb24ndCBoYXZlIGFuIGlzc3VlIHdpdGggcmVxdWlyaW5nIGV4cGxpY2l0IGNv
bXBhcmlzb25zLCBidXQgaXQKPiBuZWVkcyB0byBiZSBkb2N1bWVudGVkIHNvIHdlIGNhbiBhaW0g
dG8gaGF2ZSBhbiBob21vZ2VuZW91cyBzdHlsZSwKPiBiZWNhdXNlIHNvIGZhciBJJ3ZlIGJlZW4g
cmVjb21tZW5kaW5nIHRoZSBvdGhlciB3YXkgYXJvdW5kLgoKSW5kZWVkLCB0aGUgZ2VuZXJhbCBw
cmVmZXJlbmNlIG9mIHRoZSBjb2RlYmFzZSBhcyBhIHdob2xlIGlzIHRvIGZhdm9yCmNvbmNpc2Vu
ZXNzIGluIHRoaXMgY2FzZTsgdGhlcmUncyB2YWx1ZSBpbiBiZWluZyBjb25zaXN0ZW50LgoKSSBk
b24ndCB3YW50IHRvIGJlIGFubm95aW5nIGFib3V0IHRoaXMuICBJIGRvbid0IGFncmVlIHdpdGgg
dGhlIE1JU1JBCnJ1bGUgaGVyZTsgYnV0IEkgZG8gdGhpbmsgdGhhdCBNSVNSQSBpcyBpbXBvcnRh
bnQuICBPVE9IIHRoaXMgaXMgaW4geDg2CmNvZGUsIHdoaWNoIEkgZG9uJ3QgdGhpbmsgYW55b25l
IGhhcyBzdWdnZXN0ZWQgYmVjb21lIE1JU1JBIGNvbXBsaWFudC4KQW5kIGlmIHdlJ3JlIGdvaW5n
IHRvIHN0YXJ0IG1ha2luZyB0aGVzZSBzb3J0cyBvZiBjaGFuZ2VzLCBJIGFncmVlIHRoYXQKd2Ug
c2hvdWxkIGhhdmUgYSBkaXNjdXNzaW9uIGFib3V0IGl0LCByYXRoZXIgdGhhbiBpbXBsaWNpdGx5
IGRvIHRoaW5ncwpzb21ldGltZXMgb25lIHdheSBhbmQgc29tZXRpbWVzIGFub3RoZXIuCgogLUdl
b3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
