Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B594E14DFF1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:33:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDfG-0005tw-3Y; Thu, 30 Jan 2020 17:31:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m3I1=3T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ixDfE-0005tp-OQ
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:31:36 +0000
X-Inumbo-ID: 5ceeee4c-4386-11ea-b211-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ceeee4c-4386-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 17:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580405496;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DOrhLN1x2C4YjehqIH9XAEx+ArY1JVhWqwJCNdSw/jY=;
 b=D+0wu8ykNmS30Hr9hDT6snbt5xxdX5TOcnBGZ+VttwYpVuPPzKWWdqHH
 EJb2ju4fZYsoLGFKwTP7vVCZ323rd5ZqjfzuHdgXOZgZi8ium6KJVhDyT
 DRF7++Jb3WN6lbHWx1E56cScyIC1AjTi5V3QM/h6iYEPTaWHaxf2TRn8B s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rovqQjwqMZlZ35sdKe/FxxNBYZzAbh3ja0N007m6c/oPZs3n3ldbqQiW/IWU4AMl9OgDhn100M
 2w9n+ZJJYl6LpLjmp5gHTVhpKD5jkdwiI8zTIIi3/nz7qXPUn99+8HXs9KD36K8LLzyxM4H3ec
 ThkpcnTiHdyEyCsgvLsz7Afq+7mXHrHRcGkc1zpBUbmgXWbi6Kno7KwviG+1l+EyzrItM8eE6k
 mjyoMJdu9Q7Z2YmtwG2T4VfFd1+4Jw12aQWHsQvZaHhTDS3tNOsVfJLVNV7KU/3+xSMLlozfAg
 vQ8=
X-SBRS: 2.7
X-MesageID: 11709199
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11709199"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24115.4852.346085.817614@mariner.uk.xensource.com>
Date: Thu, 30 Jan 2020 17:31:32 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200122144446.919-2-pdurrant@amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NCAxLzddIGxpYnhsOiBhZGQgZGVmaW5pdGlv
biBvZiBJTlZBTElEX0RPTUlEIHRvIHRoZSBBUEkiKToKPiBDdXJyZW50bHkgYm90aCB4bCBhbmQg
bGlieGwgaGF2ZSBpbnRlcm5hbCBkZWZpbml0aW9ucyBvZiBJTlZBTElEX0RPTUlECj4gd2hpY2gg
aGFwcGVuIHRvIGJlIGlkZW50aWNhbC4gSG93ZXZlciwgZm9yIHRoZSBwdXJwb3NlcyBvZiBkZXNj
cmliaW5nIHRoZQo+IGJlaGF2aW91ciBvZiBsaWJ4bF9kb21haW5fY3JlYXRlX25ldy9yZXN0b3Jl
KCkgaXQgaXMgdXNlZnVsIHRvIGhhdmUgYQo+IHNwZWNpZmllZCBpbnZhbGlkIHZhbHVlIGZvciBh
IGRvbWFpbiBpZC4KCkhpLiAgKEknbSByZXBseWluZyB0byB0aGUgMS8gaGVyZSBiZWNhdXNlIEkg
ZG9uJ3Qgc2VlbSB0byBoYXZlIGFueSAwLwppbiBteSBpbmJveC4uLikKClRoYW5rcyBmb3IgYWxs
IHRoaXMuICBBcyB3ZWxsIGFzIHlvdXIgdXNlIGNhc2UsIHdoaWNoIGlzIGluIGl0c2VsZgp2YWx1
YWJsZSwgSSB0aGluayB0aGlzIGNoYW5nZSBpcyBpbXBvcnRhbnQgZm9yIG90aGVyIHJlYXNvbnMu
ClNvIEkgd2FudCB0byBzZWUgaXQgZ28gaW4uCgpZb3UnbGwgc2VlIEkgaGF2ZSByZXBsaWVkIHdp
dGggc29tZSBjb21tZW50cyBhYm91dCB0aGUgaW1wbGVtZW50YXRpb24uCkkgaG9wZSB5b3Ugd29u
J3QgYmUgZGlzY291cmFnZWQuICBJZiB5b3UgZmVlbCBJIGFtIGFza2luZyBmb3IgdG9vIG11Y2gK
d29yayBJIG1pZ2h0IGJlIGluY2xpbmVkIHRvIHBpY2sgdXAgc29tZSBvZiB0aGlzIG15c2VsZjsg
aWYgc28sIHBsZWFzZQpsZXQgbWUga25vdy4gIEkgZGVmaW5pdGVseSBkb24ndCB3YW50IHRoaXMg
dG8gYmUgZHJvcHBlZC4KClRoYW5rcy4KClJlZ2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
