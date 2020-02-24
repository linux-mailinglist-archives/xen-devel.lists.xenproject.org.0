Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDBB16A5B2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 13:05:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6CRN-0004Kj-Fu; Mon, 24 Feb 2020 12:02:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6CRL-0004Ke-SI
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 12:02:23 +0000
X-Inumbo-ID: 83ae17bd-56fd-11ea-8aef-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83ae17bd-56fd-11ea-8aef-12813bfff9fa;
 Mon, 24 Feb 2020 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582545744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yg8AHeUS27FLcsgshAKA8T/vsveTbcXsFOxU9FRJjRI=;
 b=BEPL+Oyf273Y7oGWofCXEndso/Az5ooUzSdU4/j9EG2NUJc18OjqxsJ3
 VJOPEdiv26IT1ykCUhpcphTvS5wo8gcfdXy+FAo1f955Vx4evUSST307n
 KRXwRLmTK+/LoBXLSrfmYKbhGz9S1Leeei5QgQJjE6YcR1rfQkGUqpCwj I=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: en1Sc0AVuYyl5IXntznqGf90gRzIvMDGCW728TdSkMXReB723udDX/3405jqCZaZhUpCj78FWp
 pUn3wQ1C9/RNKDyDLtVXZof81eQvaJbjJ5Ok6QNqNFbG+qCJRqjdfuLgU/Gs4fO2JE0w/Ya6G2
 moIELWiRIMwc5aBT9ADPKVhOvBsIX3CbCEj5rBz8Sx+dhQmJvX68ueP0+y5nJwrQZ6UkWxW2Xh
 sRorSfUOOdhx7R8qF8mehJ26eBkv7wQR18AX7/wxkc49Yd4XnuwjhlpHjvnALGBxjf5lR+n3aj
 3RI=
X-SBRS: 2.7
X-MesageID: 12906414
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="12906414"
Date: Mon, 24 Feb 2020 13:02:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200224120214.GN4679@Air-de-Roger>
References: <20200218122114.17596-1-jgross@suse.com>
 <20200218122114.17596-4-jgross@suse.com>
 <20200224112539.GL4679@Air-de-Roger>
 <b01bd510-58c2-4a05-4e0a-dbf3ab6abd57@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b01bd510-58c2-4a05-4e0a-dbf3ab6abd57@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 3/4] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTI6NDQ6NDhQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyNC4wMi4yMCAxMjoyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgRmViIDE4LCAyMDIwIGF0IDAxOjIxOjEzUE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6Cj4gPiA+IFNvbWUga2V5aGFuZGxlcnMgYXJlIGNhbGxpbmcgcHJvY2Vzc19wZW5kaW5nX3Nv
ZnRpcnFzKCkgd2hpbGUgaG9sZGluZwo+ID4gPiBhIHJjdV9yZWFkX2xvY2soKS4gVGhpcyBpcyB3
cm9uZywgYXMgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCkgbWlnaHQKPiA+ID4gYWN0aXZhdGUg
cmN1IGNhbGxzIHdoaWNoIHNob3VsZCBub3QgaGFwcGVuIGluc2lkZSBhIHJjdV9yZWFkX2xvY2so
KS4KPiA+IAo+ID4gSXQgbWlnaHQgYmUgaGVscGZ1bCB0byB0dXJuIHRoZSBBU1NFUlQgaW4gcHJv
Y2Vzc19wZW5kaW5nX3NvZnRpcnFzCj4gPiBpbnRvIEFTU0VSVF9OT1RfSU5fQVRPTUlDIGFsc28s
IGFzIGl0IHdvdWxkIGNhdGNoIHN1Y2ggbWlzc3VzZXMKPiA+IEFGQUlDVC4KPiAKPiBObywgdGhp
cyB3b3VsZCBiZSB0cmlnZ2VyaW5nIGluIF9fY3B1X3VwKCkgYXQgc3lzdGVtIGJvb3QuCgpZZXMs
IHNhdyB0aGF0IGluIHRoZSBuZXh0IHBhdGNoLgoKPiA+IAo+ID4gPiAKPiA+ID4gRm9yIHRoYXQg
cHVycG9zZSBhZGQgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzX25vcmN1KCkgd2hpY2ggd2lsbCBu
b3QKPiA+ID4gZG8gYW55IHJjdSBhY3Rpdml0eSBhbmQgdXNlIHRoaXMgZm9yIGtleWhhbmRsZXJz
Lgo+ID4gCj4gPiBJIHdvbmRlciBpZiBmb3Iga2V5aGFuZGxlcnMgaXQgbWlnaHQgYmUgZWFzaWVy
IHRvIGp1c3QgZGlzYWJsZSB0aGUKPiA+IHdhdGNoZG9nIGluIGhhbmRsZV9rZXlwcmVzcyBhbmQg
cmVtb3ZlIHRoZSBzb2Z0aXJxIHByb2Nlc3NpbmcgZnJvbSB0aGUKPiA+IGhhbmRsZXJzLgo+ID4g
Cj4gPiBBdCB0aGUgZW5kIG9mIGRheSB3ZSB3YW50IHRoZSBrZXloYW5kZXJzIHRvIHJ1biBhcyBm
YXN0IGFzIHBvc3NpYmxlIGluCj4gPiBvcmRlciB0byBnZXQgdGhlIGRhdGEgb3V0LCBhbmQgd2Ug
b25seSBjYXJlIGFib3V0IHRoZSB3YXRjaGRvZyBub3QKPiA+IHRyaWdnZXJpbmc/IChtYXliZSBJ
J20gbWlzc2luZyBzb21ldGhpbmcgaGVyZSkKPiAKPiBJdCBpcyBub3QgdGhhdCBzaW1wbGUsIEkg
YmVsaWV2ZS4KPiAKPiBZb3UnZCBuZWVkIHRvIGJlIHZlcnkgY2FyZWZ1bCB0aGF0IG90aGVyIGZ1
bmN0aW9uYWxpdHkgd291bGRuJ3Qgc3VmZmVyLgo+IEknbSBlLmcuIG5vdCBzdXJlIHRpbWVfY2Fs
aWJyYXRpb24gd29uJ3QgbGVhZCB0byBhIGhhbmdpbmcgc3lzdGVtIHRoZW4uCgpBRkFJQ1QgdGlt
ZV9jYWxpYnJhdGlvbiBpcyB1c2VkIHRvIHN5bmMgdGhlIHRpbWVzdGFtcHMgb2YgdGhlIHZhcmlv
dXMKQ1BVcyBzbyB0aGF0IHRoZXkgZG9uJ3QgZHJpZnQgdG9vIG11Y2gsIGJ1dCBJIGRvbid0IHRo
aW5rIG5vdApleGVjdXRpbmcgaXQgY291bGQgbGVhZCB0byBhIGhhbmcsIGl0IHdvdWxkIGxlYWQg
dG8gKGJpZ2dlcikgc2tld3MKYmV0d2VlbiBDUFVzLCBidXQgc3VjaCBza2V3cyBoYXBwZW4gYW55
d2F5LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
