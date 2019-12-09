Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623D116D06
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:22:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHzA-0004E8-6i; Mon, 09 Dec 2019 12:17:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieHz8-0004DO-Ll
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:17:54 +0000
X-Inumbo-ID: ecbc0f78-1a7d-11ea-a1e1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ecbc0f78-1a7d-11ea-a1e1-bc764e2007e4;
 Mon, 09 Dec 2019 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575893874;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IdHWmdL89AFTcNn7gde3T6zcfIwKQtkIaBfK83eXzJg=;
 b=Qdr8T4KqIVJdAAjACH3uvw4USgzpuCbL/oTUebjPTS2BT9ffHC6Cy0Eu
 zTUP0ershKwYiKH9mohBGI1fEerzNb6FMEPMB8e7Mi3xlkzY2dxAK6XJ5
 8Wv/cyjYc2zarYu1SBy3A1T1RKlGgTKaPR1VH8irlxsyvN6jFI/2YTENh I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ey51vp+2KYMhnR/IHTgER0g3Mtxd0Qo8m927IbKqqJ3MMCfmZnXdP4SNrKUaLXuHmz9QoWHU7p
 tcgVTLvgKK0WrLpkFPm32ByYJQUF0aBX+L3dxNhbw/jq1CrVXlCldWJ4ClvB/AwCl7LJq2Mh57
 Ij4dLm6kkHCFszc9mKHAtDhxg974LO2iDrW0auUrHRxoJsqENg9/hBFwKwSWEu3aNn5Jycaace
 KxcJ27/BOiwciiOK4shXPPIlNzZJnsDhqSQWezGKxmJoaDAcW/Q+YqgoBZY2NAAMPpi6FF1bhu
 QL4=
X-SBRS: 2.7
X-MesageID: 9387524
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9387524"
Date: Mon, 9 Dec 2019 13:17:26 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191209121726.GU980@Air-de-Roger>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-5-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205140123.3817-5-pdurrant@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 4/4] xen-blkback: support dynamic unbind/bind
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
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDI6MDE6MjNQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEJ5IHNpbXBseSByZS1hdHRhY2hpbmcgdG8gc2hhcmVkIHJpbmdzIGR1cmluZyBjb25u
ZWN0X3JpbmcoKSByYXRoZXIgdGhhbgo+IGFzc3VtaW5nIHRoZXkgYXJlIGZyZXNobHkgYWxsb2Nh
dGVkIChpLmUgYXNzdW1pbmcgdGhlIGNvdW50ZXJzIGFyZSB6ZXJvKQo+IGl0IGlzIHBvc3NpYmxl
IGZvciB2YmQgaW5zdGFuY2VzIHRvIGJlIHVuYm91bmQgYW5kIHJlLWJvdW5kIGZyb20gYW5kIHRv
Cj4gKHJlc3BlY3RpdmVseSkgYSBydW5uaW5nIGd1ZXN0Lgo+IAo+IFRoaXMgaGFzIGJlZW4gdGVz
dGVkIGJ5IHJ1bm5pbmc6Cj4gCj4gd2hpbGUgdHJ1ZTsgZG8gZGQgaWY9L2Rldi91cmFuZG9tIG9m
PXRlc3QuaW1nIGJzPTFNIGNvdW50PTEwMjQ7IGRvbmUKPiAKPiBpbiBhIFBWIGd1ZXN0IHdoaWxz
dCBydW5uaW5nOgo+IAo+IHdoaWxlIHRydWU7Cj4gICBkbyBlY2hvIHZiZC0kRE9NSUQtJFZCRCA+
dW5iaW5kOwo+ICAgZWNobyB1bmJvdW5kOwo+ICAgc2xlZXAgNTsKPiAgIGVjaG8gdmJkLSRET01J
RC0kVkJEID5iaW5kOwo+ICAgZWNobyBib3VuZDsKPiAgIHNsZWVwIDM7Cj4gICBkb25lCgpTbyB0
aGlzIGRvZXMgdW5iaW5kIGJsa2JhY2sgd2hpbGUgbGVhdmluZyB0aGUgUFYgaW50ZXJmYWNlIGFz
CmNvbm5lY3RlZD8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
