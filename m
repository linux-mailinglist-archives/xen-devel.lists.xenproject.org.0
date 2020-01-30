Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8723414E04B
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:56:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDyQ-0007uL-Ab; Thu, 30 Jan 2020 17:51:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m3I1=3T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ixDyO-0007uG-Oz
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:51:24 +0000
X-Inumbo-ID: 2109327c-4389-11ea-8ad4-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2109327c-4389-11ea-8ad4-12813bfff9fa;
 Thu, 30 Jan 2020 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580406683;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=8cq+0Kfq3tM8yNLjQe1cdQbWp1lm/05NZgsYTYPocis=;
 b=RWVV35OKJuJOAdRXtxZgIqnRg3yy4L6tbjTx8jt9Nm5B9lnxTj/fEeqf
 r1vdashstOGD65jMqarmTkiUUvp7jDWYah6b7aMAQlRb0R6wJiQ9m3KYS
 CyXtSDS4TIzn4xb55/SXWPpG4doNByg3+rRB5iwBfZEaleETUbsi3vtfM 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zQSij3q5tcHgLSIPJq4EX2lsD6nyi1/K6/caFBin9Ws6VUZs+wzXejl9+8wFP1VCwzCszxEVQL
 Y002IZXvOCfhgtnoOVDiwYhL70etaFVjk4G22WGjNAK+iBTvOjm5EB6k8g18fVsO0/cc/86POu
 6c5vfmXFqryjANHhtfEJcY6wsxzRC+KFsH+1znk8hRYeW3+0msdaOm7avgxCPaE5cveNQqJBqU
 zkP2A5s1X3qbT4Bk40rEViO5AxZPO4MI/ueQrQHbhNX1bNCY2/PtVs7T5Qlj6cKC4dHI8AjBh9
 pdU=
X-SBRS: 2.7
X-MesageID: 11870698
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11870698"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24115.6034.292721.461301@mariner.uk.xensource.com>
Date: Thu, 30 Jan 2020 17:51:14 +0000
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
In-Reply-To: <8046f9a470344b87b9c5e21d17506085@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
 <24115.4852.346085.817614@mariner.uk.xensource.com>
 <8046f9a470344b87b9c5e21d17506085@EX13D32EUC003.ant.amazon.com>
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

PiA+IEhpLiAgKEknbSByZXBseWluZyB0byB0aGUgMS8gaGVyZSBiZWNhdXNlIEkgZG9uJ3Qgc2Vl
bSB0byBoYXZlIGFueSAwLwo+ID4gaW4gbXkgaW5ib3guLi4pCj4gCj4gT2gsIEkgbXVzdCBoYXZl
IGZvcmdvdCB0byBjb3B5IHRoZSBjb21iaW5lZCBjYyBsaXN0IG9udG8gdGhlIGNvdmVyIGxldHRl
ci4gU29ycnkgYWJvdXQgdGhhdC4KClRoZXJlJ3MgYSBidWcgaW4gZ2l0LXNlbmQtZW1haWwgaW4g
dGhpcyBhcmVhLgoKPiBEb24ndCB3b3JyeSwgeW91ciBmZWVkYmFjayBpcyBmaW5lLi4uIGNlcnRh
aW5seSBub3QgYXNraW5nIHRvbyBtdWNoLgoKR29vZCwgdGhhbmtzLAoKSWFuLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
