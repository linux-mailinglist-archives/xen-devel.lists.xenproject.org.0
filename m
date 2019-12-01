Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514F810E20E
	for <lists+xen-devel@lfdr.de>; Sun,  1 Dec 2019 14:36:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibPK1-0003iU-ON; Sun, 01 Dec 2019 13:31:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SYzQ=ZX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ibPK0-0003iM-Ng
 for xen-devel@lists.xenproject.org; Sun, 01 Dec 2019 13:31:32 +0000
X-Inumbo-ID: e2f8c3ea-143e-11ea-a55d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2f8c3ea-143e-11ea-a55d-bc764e2007e4;
 Sun, 01 Dec 2019 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575207093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DZaKH9/HTcoelJsCQtMAAY/CLBFsFlfbiLnm7NPcFSU=;
 b=CMCzx2UlNyAFbLj8doP7pWtxen5fsbbug4Xm9ajjm1/jlV0ElgtF0UO5
 lDVsV1Ap0gwCwhZsQ+le8COrGJmS1HEKEdTIDzR+uZCBG3l3Wc4ULhFiE
 L9BiYWUbMijGg5T1ZicloofdP6Bb+d72wNognvouuZfiNRS5Jn7I5tkvf M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qOOo9EX5oN5g6JV6/7Wq8i4TjD8HP/k0Z9r7aAzlgtEO2GLdwSN4qJRijd/wXalcx3Mmw7n+Xe
 m5IfUibAOi87E6JwUg4LwOi6urUyjxLjUE2UfvXFgCVE9KzzxivBaNn6ZOTmNjxiPaxo5j3dKU
 O0HjIxowwK26Sl4LMTh99qu8ps0jMvrtldFchKrb6BvzQ8ZmNHziBcIhjnIImiSce10yR+d1VV
 bc74I6g+NfvaUV9Y6D3fIsVP/M4mc6A4LFKjLucgrRRK4Cpady0XP0Z0bCY0JjbCb34zFrCO7l
 +qs=
X-SBRS: 2.7
X-MesageID: 9149014
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,265,1571716800"; 
   d="scan'208";a="9149014"
Date: Sun, 1 Dec 2019 14:31:21 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <20191201133121.GC980@Air-de-Roger>
References: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
 <20191115143959.GI72134@Air-de-Roger>
 <81c0740c-edce-05e8-bb2e-3eb0b7a3723c@cardoe.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81c0740c-edce-05e8-bb2e-3eb0b7a3723c@cardoe.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 0/2] x86: clank build check adjustments
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBOb3YgMzAsIDIwMTkgYXQgMTA6MDg6NDBBTSAtMDYwMCwgRG91ZyBHb2xkc3RlaW4g
d3JvdGU6Cj4gT24gMTEvMTUvMTkgODo0NSBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiAK
PiA+IE9uIEZyaSwgTm92IDE1LCAyMDE5IGF0IDExOjQzOjIxQU0gKzAxMDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+ID4gPiAxOiBmaXggY2xhbmcgLm1hY3JvIHJldGVudGlvbiBjaGVjawo+ID4gPiAy
OiBjbGFuZzogbW92ZSBhbmQgZml4IC5za2lwIGNoZWNrCj4gPiBGb3IgYm90aDoKPiA+IAo+ID4g
VGVzdGVkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXN1QGNpdHJpeC5jb20+Cj4gPiBb
T24gRnJlZUJTRCBhbmQgRGViaWFuIDkuNV0KPiA+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IAo+ID4gTm90ZSB0aGVyZSdzIGEgdHlwbyBp
biB0aGlzIGVtYWlsJ3Mgc3ViamVjdCAoY2xhbmsgdiBjbGFuZykuIEFsc28sIGlmCj4gPiBwb3Nz
aWJsZSwgY291bGQgYm90aCBwYXRjaGVzIGhhdmUgdGhlIHNhbWUgcHJlZml4PyAoeDg2L2NsYW5n
KQo+ID4gCj4gUm9nZXIsCj4gCj4gRG8gd2UgbmVlZCB0byBtYWtlIGNoYW5nZXMgdG8gdGhlIGNv
bnRhaW5lcnMgdGhhdCBidWlsZCB0aGUgdHJlZT8gVGhlc2UKPiBwYXRjaGVzIGJyb2tlbiB0aGUg
Y2xhbmcgYnVpbGRzIGluIENJIGFzIGNhbiBiZSBzZWVuIGhlcmU6Cj4gaHR0cHM6Ly9naXRsYWIu
Y29tL3hlbi1wcm9qZWN0L3hlbi8tL2pvYnMvMzY1MjQ2NTYzI0wyMzcxCgpUaGF0J3MgdW5leHBl
Y3RlZCwgdGhlIHZlcnNpb24gb2YgY2xhbmcgaW4gdGhhdCBqb2IgaXMgMy41LCBzbyBpdApzaG91
bGQgYmUgdXNpbmcgLW5vLWludGVncmF0ZWQtYXMgd2hpY2ggaXMgaXQgaW5kZWVkIGRvaW5nLiBX
aWxsIGNoZWNrCnRvbW9ycm93IHRvIHNlZSB3aGF0J3MgZ29pbmcgb24uCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
