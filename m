Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDD150852
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:26:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycdf-00041E-4E; Mon, 03 Feb 2020 14:23:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UUio=3X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iycdd-000419-8v
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:23:45 +0000
X-Inumbo-ID: c8543f54-4690-11ea-ad98-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8543f54-4690-11ea-ad98-bc764e2007e4;
 Mon, 03 Feb 2020 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580739824;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PpO2kAFySPOyx8k9ys0vkDw+SUcYOHjnMRwTvqF/P7A=;
 b=EDGPnsWmH6L5Ic+W6TEr5r7iYmmgo6KG8TmqejLUKAWZl+oHP0nKyFXk
 E33GE6G7uulcDtFIlXrYtT+CdI5JYSg6SSNKcLeqiJ8K216pngA2l7XzN
 lqeLguRMk/J7rXfjdA2KTNSCPnYykvPeLIaaQT5EZWZvmrZ2QCHRlxJ+o Q=;
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
IronPort-SDR: dmW+vPpVHTFCUopx+xCuZUVILtLddulmrIUrwoBD8Ms++Us5kN9TFaIbqPYDNWA8527mRpUbDO
 Y7YnGJ1J6qTF+xrBgUipV/1BcCY7WlhhxWx4uQisJeED2BDsqWnD9IwbzixR2gjeQ60xQifkNJ
 3a1YZkJqyXrdKRrgBe5FlUbtg1OdFuPS7XtNHRBuexv4tJfUCz1UJoO4hSkWhn1e3Y0VjRI9Qs
 ViisBJkH5j63u6g0EN9j96X83yso12C4BMDMO0sXMb52+tbaNNKURUJN+scKOPKKLjJKXQUvny
 aAo=
X-SBRS: 2.7
X-MesageID: 11858958
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="11858958"
Date: Mon, 3 Feb 2020 14:23:37 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203142337.GE2306@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-12-anthony.perard@citrix.com>
 <abe8cad9-0a64-d813-74c5-e6e13f0eace8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abe8cad9-0a64-d813-74c5-e6e13f0eace8@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 11/12] xen/build: introduce ccflags-y
 and CFLAGS_$@
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDI6Mzk6NDNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDEuMjAyMCAxMTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gSSBoYXZl
IHRvIGFkbWl0IHRoYXQgSSdtIGFsc28gYSBsaXR0bGUgcHV6emxlZCBieSB0aGUgbmFtaW5nLCBu
bwo+IG1hdHRlciB0aGF0IGl0J3MgdGFrZW4gZnJvbSBMaW51eC4gSXQgZG9lc24ndCByZWFsbHkg
c2VlbSB0byBmaXQKPiBDRkxBR1MvQUZMQUdTIGFuZCBjX2ZsYWdzL2FfZmxhZ3MuCgpTbyBJJ3Zl
IGxvb2sgaW50byB0aGUgaGlzdG9yeSBvZiBMaW51eCwgY2NmbGFncy15IHdhcyBpbnRyb2R1Y2Ug
dG8gZ2V0CnJpZCBvZiBFWFRSQV9DRkxBR1MgYW5kIGVzcGVjaWFsbHkgdG8gaGF2ZSB0aGUgLXkg
cGFydCBpbiB0aGUgbmFtZSBvZgp0aGUgdmFyaWFibGUuCgpTbywgaW5zdGVhZCBvZiBjY2ZsYWdz
LXkgYW5kIHRoZSBsaWtlLCB3ZSBjb3VsZCB1c2UgQ0ZMQUdTLXkgaW4gTWFrZWZpbGUKb2Ygc3Vi
ZGlyZWN0b3JpZXMuCgpGb3IgbWFrZWZpbGVzIGluIHN1YmRpciwgTGludXggaGFzOgogICAgQ0ZM
QUdTXyRACiAgICBDRkxBR1NfUkVNT1ZFXyRACiAgICBjY2ZsYWdzLXkKICAgIHN1YmRpci1jY2Zs
YWdzLXkKc28gQ0ZMQUdTLXkgd291bGQgYmUgYmV0dGVyIChhbmQgd2UgY2FuIHRoaW5rIGFib3V0
IHRoZSBzdWJkaXIgb25lCmxhdGVyKS4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
