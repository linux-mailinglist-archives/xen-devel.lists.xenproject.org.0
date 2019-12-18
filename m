Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBCB124BF4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 16:45:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihbTg-0002OY-GE; Wed, 18 Dec 2019 15:43:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R8h6=2I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ihbTe-0002OR-Pn
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 15:43:06 +0000
X-Inumbo-ID: 106d92ee-21ad-11ea-a1e1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 106d92ee-21ad-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576683777;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=4nBg4ufJHray5sFJZv5QkflOagr+hYV7Ub+JuiWcaNA=;
 b=EW7/K59C5gWGKF0Nyr+uighbnk56Iy6wxLTWr0ZvksOz/GK9HHhPRWY9
 kY7BjigXbgjofQO8Mc+ozX412wvvtV58gtu/KqC4o+ReOb448JK8+h8Qc
 rBIZz2mtu6dxW0xyVx5xdkkARgIdZW+eD02I6UlhnSk71JsQjCigmCisI k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3iPYobgG8ZNn2wyew/Vwx39MD6RPT+i4eDTwWrJ1Cm3isvCuSINg+TVCoy1bD7OKQGHi5ust1a
 625YhWwZJ7cYFPNK7Ren6LhgsSHbLdM3clHjxXZXSCT8YdTGwFXK9pvwMRFrrRYdDh6xYifbCz
 j0/9QpcW5XSdiKjGFO7vFQMb/kglnD2mqipaDh0FnSLxd3/f6DrswEQTVt5Vmcya/aWfQPq8VP
 a0heMwVh00ruMj1+5HvgSXrGavMYsXo7BCQkpTWiHwLmhA5KNe24KjbyfKErL3ZR2D0nL9mNYn
 U0Q=
X-SBRS: 2.7
X-MesageID: 10300842
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,330,1571716800"; d="scan'208";a="10300842"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24058.18686.905401.403506@mariner.uk.xensource.com>
Date: Wed, 18 Dec 2019 15:42:54 +0000
To: Steven Haigh <netwiz@crc.id.au>
In-Reply-To: <35b942031521f25b63e60634ee86f1b52f504eb3.1576631444.git.netwiz@crc.id.au>
References: <35b942031521f25b63e60634ee86f1b52f504eb3.1576631444.git.netwiz@crc.id.au>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] [tools/hotplug] Use ip on systems where
 brctl is not available
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RldmVuIEhhaWdoIHdyaXRlcyAoIltQQVRDSF0gW3Rvb2xzL2hvdHBsdWddIFVzZSBpcCBvbiBz
eXN0ZW1zIHdoZXJlIGJyY3RsIGlzIG5vdCBhdmFpbGFibGUiKToKPiBOZXdlciBkaXN0cm9zIGxp
a2UgQ2VudE9TIDggZG8gbm90IGhhdmUgYnJjdGwgYXZhaWxhYmxlLiBBcyBzdWNoLCB3ZQo+IGNh
bid0IHVzZSBpdCB0byBjb25maWd1cmUgbmV0d29ya2luZyBhbnltb3JlLgo+IAo+IFRoaXMgcGF0
Y2ggd2lsbCBmYWxsIGJhY2sgdG8gJ2lwJyBvciAnYnJpZGdlJyBjb21tYW5kcyBpZiBicmN0bCBp
cyBub3QKPiBhdmFpbGFibGUgaW4gdGhlIHdvcmtpbmcgUEFUSC4KClRoaXMgbG9va3MgZ29vZCB0
byBtZSBhdCBsZWFzdCBpbiB0aGUgYnJjdGwgY2FzZS4gIEkgaGF2ZSB0d28gbWlub3IKY29tbWVu
dHMuCgpGb3IgdGhlIGF2b2lkYW5jZSBvZiBkb3VidCwgSSBndWVzcyB5b3UgaGF2ZSB0ZXN0ZWQg
dGhpcyBpbiB0aGUKYGlwJy9gYnJpZGdlJyBjYXNlID8gIEhvdyB0aG9yb3VnaGx5ID8gOi0pCgo+
IC1pZiBbIC16ICIkYnJpZGdlIiBdCj4gLXRoZW4KPiAtICBicmlkZ2U9JChicmN0bCBzaG93IHwg
YXdrICdOUj09MntwcmludCQxfScpCj4gLQo+ICtpZiBbIC16ICIkYnJpZGdlIiBdOyB0aGVuCgpU
aGUgcHJlc3VtYWJseS11bmludGVudGlvbmFsIHN0eWxlIGNoYW5nZSBtYWtlcyB0aGUgcmV2aWV3
IHNsaWdodGx5CmhhcmRlci4uLgoKPiAtICAgIGJyaWRnZT0kKGJyY3RsIHNob3cgfCBjdXQgLWQg
Igo+ICsgICAgaWYgd2hpY2ggYnJjdGwgPiYvZGV2L251bGw7IHRoZW4KCk1heWJlIGludHJvZHVj
ZQogICBoYXZlX2JyY3RsICgpIHsgLi4uIH0Kc28gd2UgY2FuIHNheQogICBpZiBoYXZlX2JyY3Rs
OyB0aGVuCj8KClJlZ2FyZHMsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
