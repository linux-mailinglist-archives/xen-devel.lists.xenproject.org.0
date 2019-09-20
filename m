Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE8B9626
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 19:03:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBMHE-0005MW-FD; Fri, 20 Sep 2019 17:01:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tu7L=XP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iBMHD-0005MM-6L
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 17:00:59 +0000
X-Inumbo-ID: 372a68c4-dbc8-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 372a68c4-dbc8-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568998859;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6TeNOa1rprJCbAkEfyEIOnaff80VZTezSscH5IYGquw=;
 b=WauDpxr4wRQaMLgTjWyAbMix15XpYPcdCNoPbrjJjVRGP6hCDyH1uR0Q
 RQavVKtnXefFruOfoFvb/u5bdXV5I1GuqZS2+jrw77WHF8CATNiYxkwbh
 ZoWbBY5h6AuND+oF95FZJS/RsbFvtqNXVZAIZre3MX9uY5sFzKFrOUG7j 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QAYN7nDmhRvlSnvtnChmfBo1kcVC/Pzhs1HcBb7iwPaz3Da4l4uiSKwghCbDmTOG9gEdwQhHWN
 mktfnUiZSJbuvnIrKUfIkN8Y9g1poGxIgO4/tSrn28pudFIzicAOA0nLKHUVvjWjup8QO3Svn3
 GYlkoheuO0B2SdGeMvB442GTr/Q3IaST+1w1d4qzgWe+LgnHp12ob9qaq2j/1H5fX+GvLRehVA
 MrD/ZcwVfkz1INrCnClhiiwkPH7+xDk5PbgR93sp01PHmCyJXW8L73Yb3d99huQmWF7q1pb74I
 6kM=
X-SBRS: 2.7
X-MesageID: 5921661
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,529,1559534400"; 
   d="scan'208";a="5921661"
Date: Fri, 20 Sep 2019 18:00:54 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20190920170054.GX1308@perard.uk.xensource.com>
References: <20190920161902.1353598-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920161902.1353598-1-anthony.perard@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] tools/ocaml: Build fix following libxl API
 changes
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
 David Scott <dave@recoil.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDU6MTk6MDJQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhlIGZvbGxvd2luZyBsaWJ4bCBBUEkgYmVjYW1lIGFzeW5jaHJvbm91cyBhbmQg
Z2FpbmVkIGFuIGFkZGl0aW9uYWwKPiBgYW9faG93JyBwYXJhbWV0ZXI6Cj4gICAgIGxpYnhsX2Rv
bWFpbl9wYXVzZSgpCj4gICAgIGxpYnhsX2RvbWFpbl91bnBhdXNlKCkKPiAgICAgbGlieGxfc2Vu
ZF90cmlnZ2VyKCkKPiAKPiBBZGFwdCB0aGUgb2NhbWwgYmluZGluZy4KPiAKPiBCdWlsZCB0ZXN0
ZWQgb25seS4KPiAKPiBGaXhlczogZWRhYTYzMWRkY2VlNjY1Y2RmYWUxY2Y2YmM3NDkyYzc5MWUw
MWVmNAo+IEZpeGVzOiA5NTYyN2I4N2MzMTU5OTI4NDU4ZWU1ODZlOGM1YzU5M2JkZDI0OGQ4Cj4g
U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIEN1cnJlbnRseSwgYWxsIGxpYnhsIEFQSSB0aGF0IHRh
a2VzIGFuIGBhb19ob3dgIGhhdmUgYD9hc3luYzonYSAtPiB1bml0YAo+ICAgICBpbiB0aGUgb2Nh
bWwgZGVmaW5pdGlvbiAoYW5kIGFuIGV4dHJhIHVudXNlZCB2YWx1ZSB1bml0IGluIHRoZSBjIHN0
dWIKPiAgICAgZmlsZSksIGlzIHRoYXQgYHVuaXRgIG5lZWRlZCA/Cj4gICAgIAo+ICAgICBJIHRy
aWVkIHRvIGFkZCBpdCwgYnV0IHRoZW4gZm9yIHN0dWJfeGxfc2VuZF90cmlnZ2VyKCkgSSBoYWQg
dG8gdXNlCj4gICAgIENBTUxwYXJhbTYsIGFuZCB0aGF0IGRvZXNuJ3QgZXhpc3QuCgpJIGRpc2Nv
dmVyZWQgQ0FNTHhwYXJhbTEgbWFjcm8sIGJ1dCB0aGF0J3Mgbm90IGJldHRlcjoKICAgIEZpbGUg
InhlbmxpZ2h0Lm1sIiwgbGluZSAxNzM1LCBjaGFyYWN0ZXJzIDI1LTg0OgogICAgRXJyb3I6IEFu
IGV4dGVybmFsIGZ1bmN0aW9uIHdpdGggbW9yZSB0aGFuIDUgYXJndW1lbnRzIHJlcXVpcmVzIGEg
c2Vjb25kIHN0dWIgZnVuY3Rpb24KICAgICAgICAgICBmb3IgbmF0aXZlLWNvZGUgY29tcGlsYXRp
b24KLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
