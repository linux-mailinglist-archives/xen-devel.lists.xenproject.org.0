Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0835AB7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:56:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTY8-00084S-S6; Wed, 05 Jun 2019 10:53:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONy6=UE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hYTY7-00084N-HY
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:53:43 +0000
X-Inumbo-ID: 2def5a80-8780-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2def5a80-8780-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 10:53:41 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8lLQsYJZgwU+SmT9xz34Sp13xWieO5tYi8Pb1yCVZ/WOMzOjZL64FxojYHhJMD1wlI4QRoqdxZ
 Kz0oTpKx5705/67sdi8ggj89AP/kTyKOlNOwiTqm1lbhSRPkhVPLlnjiOf6R4VMcksa/5fOb0X
 ClsrRNqHvhApMJFiRsa0ukKs3vV+c+D0d79m8i3R5Q5PM2N1RBP5KhW5GAFb1G/tI/BI66Mr2e
 kEkJgo1n1Obze1lE4+KmMTQ/zSWajiu0uKKfd4aJkYjtd1jHOEoekMVWOrpdGgrOd9NTjcUJE5
 7Jo=
X-SBRS: 2.7
X-MesageID: 1344546
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1344546"
Date: Wed, 5 Jun 2019 11:53:38 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
Message-ID: <20190605105338.GH2126@perard.uk.xensource.com>
References: <20190522145140.12943-1-anthony.perard@citrix.com>
 <20190522195442.5bf116ff.olaf@aepfle.de>
 <20190523094148.GB2126@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523094148.GB2126@perard.uk.xensource.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH qemu-xen 4.10 & 4.11] xen_disk: Disable file
 locking for the PV disk backend
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTA6NDE6NDhBTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMDc6NTQ6NDJQTSArMDIwMCwgT2xhZiBI
ZXJpbmcgd3JvdGU6Cj4gPiBBbSBXZWQsIDIyIE1heSAyMDE5IDE1OjUxOjQwICswMTAwCj4gPiBz
Y2hyaWViIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjoKPiA+IAo+
ID4gPiBDYW4geW91IGdpdmUgaXQgYSB0cnkgd2l0aCBvbmUgb2YgdGhlIGFmZmVjdGVkIHFlbXU/
IChxZW11LXhlbi00LjEwIG9yCj4gPiA+IHFlbXUteGVuLTQuMTEpCj4gPiAKPiA+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoLiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlzIG5vIGVhc3kgd2F5IHRvIHRyaWdn
ZXIgdGhlIHJhY2UuCj4gPiBJcyB0aGUgY2hhbmdlZCBjb2RlIHBhdGggYWxzbyBleGVyY2lzZWQg
Zm9yIFBWIGRvbVVzPwo+IAo+IFllcyEgVGhlIGNvZGUgcGF0aCBpcyBleGVjdXRlZCBldmVyeSB0
aW1lIGEgZGlzayBpcyBhdHRhY2hlZCB2aWEgdGhlCj4gcWRpc2sgYmFja2VuZC4gU28gYXMgbG9u
ZyBhcyBndWVzdCBjYW4gYWNjZXNzIHRoZSBwdiBkaXNrLCB0aGVuIGl0J3MKPiBmaW5lIChmb3Ig
Ym90aCBIVk0gYW5kIFBWIGRvbVVzLCBhbmQgUFZIKS4KPiAKPiBBbm90aGVyIHdheSB0byBtYWtl
IHN1cmUgdGhhdCB0aGUgbG9ja2luZyBpcyBkaXNhYmxlIGlzIHRvIGF0dGFjaCBhIGRpc2sKPiB0
byBhIHNlY29uZCBndWVzdCwgcWVtdSBzaG91bGQgbm90IGNvbXBsYWluIGFueW1vcmUuIEkndmUg
dGVzdGVkIGJvdGgKPiAicmF3IiBkaXNrIGFuZCAicWNvdzIiIGRpc2sgYnV0IEknbSBub3Qgc3Vy
ZSBpZiBvdGhlciBraW5kIG9mIGRpc2sgbmVlZHMKPiB0byBiZSB0ZXN0ZWQuCgpPbGFmLCBkaWQg
eW91IGFwcGx5IHRoaXMgcGF0Y2ggYW5kIHJ1biBzb21lIGd1ZXN0PyBEbyB0aGV5IHN0aWxsIGJv
b3Q/Ckl0IGRvZXNuJ3QgbWF0dGVyIGlmIHlvdSBjYW4ndCB0cmlnZ2VyIHRoZSByYWNlIHdpdGgg
b3Igd2l0aG91dCB0aGlzCnBhdGNoLCBJIGp1c3Qgd2FudCB0byBrbm93IGlmIHRoZXJlIGFyZSBh
bnkgcmVncmVzc2lvbi4KU28sIG1heSBoYXZlIEkgeW91ciAiVGVzdGVkLWJ5IiA/IEFuZCBJIHdp
bGwgdHJ5IHRvIGFwcGx5IGl0IHRvIG91cgpxZW11LXhlbiBicmFuY2hlcy4KClRoYW5rcywKCi0t
IApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
