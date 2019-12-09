Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCB116BA3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:01:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGlb-0003e7-5F; Mon, 09 Dec 2019 10:59:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieGlZ-0003e1-Am
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:59:49 +0000
X-Inumbo-ID: 0432c09e-1a73-11ea-87bc-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0432c09e-1a73-11ea-87bc-12813bfff9fa;
 Mon, 09 Dec 2019 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575889188;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FRz1fnKpX4pMYyAoL/+6yiQg1Kx+UEVMqJrPGJd+Nh8=;
 b=AlI0u1Ujl40drn0wfly3TSMkmR/RR8Gl6q2LvDQPwWwp6jiwE8Sr75ie
 nMEgA3Tn2qJ6/EPmTIk5cGBDvpl4N0XL1cH6DjU9pGJVLSdq+pOFtDYHl
 e4IEELWL6ZNLrt2Nix2LgQXvrAr0IK4K5w78qv64l03V/el/ZwqJoOMXR g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Rkc+D/uIyjZBMTdQbjJi/v2puec5ASxSyq4hTChw2NQ8EUEJ/8T83eHy6F0+c+AYqmb+d9KyV0
 Q8cO0kqVQw4y4Z5Aj49q6I7+pl997Lff5HMyBL41UNcHyQvURZyrQ/2G+zg9AUOpjpdDZF/o0/
 w2KmG+dcUKbDrL5NKj+bI6hvZ8dYAFumUa3AS09YHLqXUgnbp3gjY0zgl8OmrdF5g8/iBx9pBL
 J9jG2cIEOO61+7XETwbxOaX5dYrqStcgUGVX4tiAhw+NhLi535VCxdLdu8800qd/w5zdwJQyOu
 K9w=
X-SBRS: 2.7
X-MesageID: 9740192
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9740192"
Date: Mon, 9 Dec 2019 11:59:42 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191209105942.GR980@Air-de-Roger>
References: <20190802092227.43058-1-roger.pau@citrix.com>
 <921593c4-0848-b22f-3695-dee94fc60900@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <921593c4-0848-b22f-3695-dee94fc60900@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>, Paul Durrant <paul.durrant@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMTI6MjQ6MjlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDIuMDguMjAxOSAxMToyMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gU3dp
dGNoIHJtcnJfaWRlbnRpdHlfbWFwcGluZyB0byB1c2UgaW9tbXVfe3VufW1hcCBpbiBvcmRlciB0
bwo+ID4gZXN0YWJsaXNoIFJNUlIgbWFwcGluZ3MgZm9yIFBWIGRvbWFpbnMsIGxpa2UgaXQncyBk
b25lIGluCj4gPiBhcmNoX2lvbW11X2h3ZG9tX2luaXQuIFRoaXMgc29sdmVzIHRoZSBpc3N1ZSBv
ZiBhIFBWIGhhcmR3YXJlIGRvbWFpbgo+ID4gbm90IGdldHRpbmcgUk1SUiBtYXBwaW5ncyBiZWNh
dXNlIHtzZXQvY2xlYXJ9X2lkZW50aXR5X3AybV9lbnRyeSB3YXMKPiA+IG5vdCBwcm9wZXJseSB1
cGRhdGluZyB0aGUgaW9tbXUgcGFnZSB0YWJsZXMuCj4gCj4gQWl1aSB3ZSBzdGlsbCBkaWRuJ3Qg
Z2V0IHRvIHRoZSBib3R0b20gb2YgdGhpcy4gVG9nZXRoZXIgd2l0aAo+IG15IChtdWNoKSBlYXJs
aWVyIHJlcGx5IEkgdGhpbmsgSSdsbCBkcm9wIHRoaXMgZnJvbSBteSBsaXN0Cj4gb2YgcGVuZGlu
ZyBwYXRjaGVzLCB1bmxlc3MgeW91IGluZGljYXRlIG90aGVyd2lzZS4KClllcywgSUlSQyBSb21h
biBzYWlkIHRoaXMgd2FzIGxpa2VseSBjYXVzZWQgYnkgYSBmaXJtd2FyZSBpc3N1ZT8KClRoZXJl
IHdhcyBhbiBpc3N1ZSBhcyBhIHJlc3VsdCBvZiBvdGhlciBJT01NVSBjaGFuZ2VzIGFuZCB0aGUg
Y29kZQp0aGF0IHdhcyBhbHJlYWR5IGZpeGVkIGJ5IGEgZGlmZmVyZW50IHBhdGNoLCBJIHRoaW5r
IHRoaXMgY2FuIGJlCnNhZmVseSBkcm9wcGVkLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
