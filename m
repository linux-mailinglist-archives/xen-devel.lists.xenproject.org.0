Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9687E17141C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 10:25:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7FNl-00067g-V5; Thu, 27 Feb 2020 09:23:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3dSL=4P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7FNk-00067U-GF
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 09:23:00 +0000
X-Inumbo-ID: be467d3c-5942-11ea-960c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be467d3c-5942-11ea-960c-12813bfff9fa;
 Thu, 27 Feb 2020 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582795379;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k+HhCTcQH9JuGm0+Rt8w3XBtIXdG5Y1blSFsLna0Ngo=;
 b=Z4Cj9TpfQ1UtTAbx+80MNCZWTMw9VoEyCt1H03JbK3CuPa++Wjj+NHSd
 0COP+t12LXn10MtWWUOWj2PJFo+BafajqrR0BMorh25F/+t1KWnhVZHiw
 73mrCqJtbYpSxFg9gxoQekflq2CvvbPdQeBwFofpWZK+ViFmA/GngfAGp c=;
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
IronPort-SDR: UozWGzO7Nswo2eUGXE9TEkDBjvR0ZsxJLD44zLCHaDaCTmtr/GJPW5gjfRA1p/EfEe/6A7tzN3
 vWRTm9N5jafaciL3CfpwnqyO7buhSDZEOBx1Eby0xG90cyRg3JwC3CJymFDm50eN0PadoB1hub
 Gvc6cXdIvuoNFYxCUjb7N3+56FhJ61CGZhn12hvM0K5qodLz9SwGqOoiU54gG/AsOBkP2OxXhN
 Fqa9Tg7aGgqFLpZepBSBjOPXOFCRfguv7w4Xk8yV3/wsyNErC43KaTBLi5UEh9d1ixn5PhA/T1
 B60=
X-SBRS: 2.7
X-MesageID: 13271592
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,491,1574139600"; d="scan'208";a="13271592"
Date: Thu, 27 Feb 2020 10:22:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200227092250.GL24458@Air-de-Roger.citrite.net>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226113355.2532224-8-anthony.perard@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [XEN PATCH v3 07/23] xen/build: Use obj-y +=
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTE6MzM6MzlBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhpcyBpcyBwYXJ0IG9mIHVwZ3JhZGluZyBvdXIgYnVpbGQgc3lzdGVtIGFuZCBp
bXBvcnQgbW9yZSBvZiBMaW51eCdzCj4gb25lLgo+IAo+IEluIExpbnV4LCBzdWJkaXIteSBpbiBN
YWtlZmlsZXMgaXMgb25seSB1c2VkIHRvIGRlc2NlbmQgaW50bwo+IHN1YmRpcmVjdG9yeSB3aGVu
IHRoZXJlIGFyZSBubyBvYmplY3QgdG8gYnVpbGQsIFhlbiBkb2Vzbid0IGhhdmUgdGhhdAo+IGFu
ZCBhbGwgc3ViZGlyIGhhdmUgb2JqZWN0IHRvIGJlIGluY2x1ZGVkIGluIHRoZSBmaW5hbCBiaW5h
cnkuCj4gCj4gVG8gYWxsb3cgdGhlIG5ldyBzeW50YXgsIHRoZSAib2JqLXkiIGFuZCAic3ViZGly
LSoiIGNhbGN1bGF0aW9uIGluCj4gUnVsZXMubWsgaXMgY2hhbmdlZCBhbmQgcGFydGlhbGx5IGlt
cG9ydGVkIGZyb20gTGludXgncyBLYnVpbGQuCj4gCj4gVGhlIGNvbW1hbmQgdXNlZCB0byBtb2Rp
ZnkgdGhlIE1ha2VmaWxlIHdhczoKPiAgICAgc2VkIC1pIC1yICdzI15zdWJkaXItKC4qKSNvYmot
XDEvIzsnICoqL01ha2VmaWxlCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpMR1RNOgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
