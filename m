Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F61529DE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:26:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izImr-0002xU-M8; Wed, 05 Feb 2020 11:24:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jt5G=3Z=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1izImq-0002xA-Ae
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:24:04 +0000
X-Inumbo-ID: 01dc08b8-480a-11ea-a933-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01dc08b8-480a-11ea-a933-bc764e2007e4;
 Wed, 05 Feb 2020 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580901840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sM8dvnNGa0vDTzI9W2kWUeZkFbxi6jT45HOQnU+CuDw=;
 b=GQQD6jQ9d7EiWAoeqbE8dJ8ebXPuXQFf4nFik48sQLBXRfatvcNQsMZc
 rFpmf6YT/rHdkSdQdFtBmrvPjnS6w0JR5+onZPqS39X0yyejOIKcvEpXm
 pi1cAhS3EmfUi+XeJ5Z2Q+6k6Vf6BipdwenkkCp1V0D+P1Y/8XXZ7scI2 o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ouC4/1dCwKJ7k7am9aB0J6FGtSeJ+dq7j+hbSB/j7fTZWcQW4CA6Hy1uGNSZc6CxOv+Z9VDzEd
 BDOutDfC4mERpKh+NdAFBxSfbhGgZxIJBfSk8CXd7nonR9H4IQ0VKLNzYaxC5HJRfzhy3ob2gh
 Q64SVTv0u5hT9kqqJLa/k6R93N4QSyQGa5sDGpL5wznpH+ePU7WkEPe39l4GAcsYwTIxipF4a+
 Ulghjr3uVrRbwAGGiM/X4m5bv1GtVw0aWLU3ZXbGh21E+psbKkPEvo1N+vfahl8/1qXa80/v1a
 eys=
X-SBRS: 2.7
X-MesageID: 12344948
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="12344948"
Date: Wed, 5 Feb 2020 11:23:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200205112357.GB85066@perard.uk.xensource.com>
References: <20200205093724.2854-1-pdurrant@amazon.com>
 <20200205104716.GA85066@perard.uk.xensource.com>
 <822309f6c7ef4109b731d37efbad5793@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <822309f6c7ef4109b731d37efbad5793@EX13D32EUC003.ant.amazon.com>
Subject: Re: [Xen-devel] [PATCH] libxl: fix assertion failure in stub domain
 creation
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTA6NTA6NDZBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29t
Pgo+ID4gT24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDk6Mzc6MjRBTSArMDAwMCwgUGF1bCBEdXJy
YW50IHdyb3RlOgo+ID4gPgo+ID4gPiAtICAgIHNkc3MtPnB2cWVtdS5ndWVzdF9kb21pZCA9IDA7
Cj4gPiA+ICsgICAgc2Rzcy0+cHZxZW11Lmd1ZXN0X2RvbWlkID0gSU5WQUxJRF9ET01JRDsKPiA+
IAo+ID4gSG93IHRoaXMgd29ya3M/IElOVkFMSURfRE9NSUQgc2VlbXMgdG8gYmUgZGlyZWN0bHkg
ZmVlZCB0bwo+ID4geGNfZG9tYWluX2NyZWF0ZSgpLCB3aGljaCBpcyB1c2luZyBYRU5fRE9NQ1RM
X2NyZWF0ZWRvbWFpbi4KPiA+IEJ1dCBhIGNvbW1lbnQgaW4gZG9tY3RsLmggZm9yIFhFTl9ET01D
VExfY3JlYXRlZG9tYWluIHJlYWQ6Cj4gPiAgICAgTkIuIHhlbl9kb21jdGwuZG9tYWluIGlzIGFu
IElOL09VVCBwYXJhbWV0ZXIgZm9yIHRoaXMgb3BlcmF0aW9uLgo+ID4gICAgIElmIGl0IGlzIHNw
ZWNpZmllZCBhcyB6ZXJvLCBhbiBpZCBpcyBhdXRvLWFsbG9jYXRlZCBhbmQgcmV0dXJuZWQuCj4g
PiBTbywgaXMgeGNfZG9tYWluX2NyZWF0ZSBnb2luZyB0byBjcmVhdGUgYSBuZXcgZG9tYWluIHdp
dGgKPiA+IGRvbWlkPT1JTlZBTElEX0RPTUlEPwo+ID4gCj4gCj4gQXMgaXQgaGFwcGVucywgbm8u
IFRoYXQgY29tbWVudCBpcyB3cm9uZy4gSXQgc2hvdWxkIHJlYWQgIklmIGl0IGlzIG5vdCBzZXQg
dG8gYSB2YWxpZCB2YWx1ZSwgYW4gaWQgaXMgYXV0by1hbGxvY2F0ZWQgYW5kIHJldHVybmVkIi4K
Ck9rLCB0aGVuOgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
