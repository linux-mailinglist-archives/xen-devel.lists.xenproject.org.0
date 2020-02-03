Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B49FA150558
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:35:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZxI-0003Lh-Oy; Mon, 03 Feb 2020 11:31:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UUio=3X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iyZxH-0003Lc-Fa
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 11:31:51 +0000
X-Inumbo-ID: c4de9c4c-4678-11ea-ad98-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4de9c4c-4678-11ea-ad98-bc764e2007e4;
 Mon, 03 Feb 2020 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580729510;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KsmD5hG1iDc5dB+juIS2LcxOK+Ap+S2d8TpmKeKKKn0=;
 b=RGANlnYNEWh4zvjKLTW9YeKGJvPScmkxHvign+Ugw7STTLoKR0mXP9yp
 n9qeP/atqis+jXdeVWLqB5T3tLpAA4om4l6bLtD7NIJ7R8lNM08tqSIbN
 w/SkvS3hIWYqwggmB4UfzUYE+hFMd4Le5y4/pY4F7A17GSqM/ZGQYmAme E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1O5E+4/D2W92QXIOdPy/5hhvyZMabS1Tu0A08zDvyInVh+kOmlwQRae+GM5b2ju2ogQk1NxV7y
 FbqPMYObv5kAuwaaCjO4Zg9OZnwtjl16nEQ+MkOLVHP/rr7PaIDcZvuSp4+eQTFlcdGzcUXDhB
 wZmKHviHVhE5AO/l51rtq3FWpRnDZAA8nRvpnfjMTLqbO5Uxyxz4dUhpGhC+CGcC0Ff3upmloT
 6GKLYeqDOd9NCX1YZmFCZk68U5l0gcNm1rz+ejjM3exhxZiNcDbcuqGQFlzmB2w6XiGW/iOY6J
 +N8=
X-SBRS: 2.7
X-MesageID: 12455248
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12455248"
Date: Mon, 3 Feb 2020 11:31:47 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203113147.GA2306@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-3-anthony.perard@citrix.com>
 <af46bb71-eb4b-d17c-f434-8d076083c12c@suse.com>
 <20200130165444.GP1288@perard.uk.xensource.com>
 <36d3139d-0619-0c55-369e-0b8da13a604c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36d3139d-0619-0c55-369e-0b8da13a604c@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2 02/12] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDk6MzU6MTZBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQWx0ZXJuYXRpdmVseSwgdG8gcmV0YWluIHRoaXMgImxhdGNoaW5nIiBlZmZlY3QsIGhv
dyBhYm91dAo+IAo+IHN1YmRpci15IDo9ICQoc3ViZGlyLXkpICQoZmlsdGVyICUvLCAkKG9iai15
KSkKClNvdW5kcyBnb29kLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
