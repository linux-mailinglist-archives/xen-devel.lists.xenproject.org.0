Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79C34F5E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:55:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDca-0003SU-Ff; Tue, 04 Jun 2019 17:53:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ygn2=UD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hYDcY-0003SN-Md
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:53:14 +0000
X-Inumbo-ID: 9f9a98ad-86f1-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f9a98ad-86f1-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 17:53:13 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zHPeajWU/CMyOV7T3ODe5nGtuepUfDBCDeqac+WA2tay+OF+pBS38JplwU3XKgqV1B6aIO0GAn
 wezqlc0+Eyt3EyypoA3/4qPKDRrHVgaruMbtVSLq6FeL51QbgVYx+TP0DwoNT51cFL5JngqxaP
 Y6ZcJL8upwnUY0a6YLZFN/LczQzpOaAzxEi/WVGlOkDnE4nqyD0WBXhdnEOMRUsMrYfXH2Nb06
 8+8A3hb2vvayezpw9GgusBm1xvVc7qnrRWwtnlPsFr2wZXn7V3UmoA5HJ3wUBB27giT8W97f08
 q/E=
X-SBRS: 2.7
X-MesageID: 1315076
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1315076"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23798.45032.193051.369884@mariner.uk.xensource.com>
Date: Tue, 4 Jun 2019 18:52:40 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906041026110.14041@sstabellini-ThinkPad-T480s>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
 <alpine.DEB.2.21.1906041000590.14041@sstabellini-ThinkPad-T480s>
 <014113e2-1481-ce57-1807-2cfa01a3a177@arm.com>
 <alpine.DEB.2.21.1906041026110.14041@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RlZmFubyBTdGFiZWxsaW5pIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbcWVtdS11cHN0cmVh
bS00LjExLXRlc3RpbmcgdGVzdF0gMTM2MTg0OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBPbiBU
dWUsIDQgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+IFBlciB0aGUgZGlzY3Vzc2lv
biBiZWZvcmUsIHRoZSAuY29uZmlnIGlzIGRpZmZlcmVudCBiZXR3ZWVuIHRoZSAyIGZsaWdodHMu
Cj4gPiBRRU1VIHRlc3RpbmcgaXMgbm90IHNlbGVjdGluZyBDT05GSUdfTElWRVBBVENIIHdoaWxl
IHN0YWdpbmctNC4xMSBpcy4KPiAKPiBIYXMgYW55Ym9keSB0cmllZCB0byBzdGFydCBzZWxlY3Rp
bmcgQ09ORklHX0xJVkVQQVRDSCBpbiB0aGUgUUVNVSB0ZXN0aW5nCj4gYnJhbmNoPyBJcyBpdCBw
b3NzaWJsZSB0byBnaXZlIGl0IGEgdHJ5PwoKSSBjYW4gZG8gdGhpcyB3ZSB0aGlua3MgaXQncyBk
ZXNpcmFibGUuICBCdXQgSSB0aGluayBpdCBpcyBwcm9iYWJseQphY3R1YWxseSBoZWxwZnVsIHRv
IHRlc3QgYm90aCwganVzdCBpbiBjYXNlIG5vbi1MSVZFUEFUQ0ggYnJlYWtzLiAgQXMKaXQganVz
dCBoYXZlLgoKQUlVSSB0aGlzIGlzIHRob3VnaHQgdG8gYmUgcXVpdGUgYSByYXJlIHByb2JsZW0s
IHNvIGl0IHNob3dpbmcgdXAgaW4gYQpxZW11IGJyYW5jaCBpcyBPSy4KCk90aGVyd2lzZSBtYXli
ZSB3ZSB3b3VsZCBoYXZlIHRvIGFkZCBib3RoIHdpdGgtIGFuZCB3aXRob3V0LUxJVkVQQVRDSAp0
ZXN0cyB0byB0aGUgeGVuLSogZmxpZ2h0cy4gIFdlIGFscmVhZHkgaGF2ZSBib3RoIHdpdGgtIGFu
ZAp3aXRob3V0LVhTTSwgYW5kIHRoaXMgd291bGQgYWRkIGFub3RoZXIgZGltZW5zaW9uIHRvIHRo
ZSBidWlsZCBtYXRyaXguCkFuZCB3ZSB3b3VsZCBoYXZlIHRvIGRlY2lkZSB3aGF0IHN1YnNldCBv
ZiB0aGUgdGVzdHMgc2hvdWxkIGJlIHJ1biBpbgplYWNoIGNvbmZpZ3VyYXRpb24uCgpJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
