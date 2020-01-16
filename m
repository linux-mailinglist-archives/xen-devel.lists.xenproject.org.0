Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844113F3D6
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 19:46:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isA7Q-0007k6-I8; Thu, 16 Jan 2020 18:43:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M+HB=3F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isA7P-0007k1-3o
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 18:43:47 +0000
X-Inumbo-ID: 1bacd3a0-3890-11ea-ac27-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bacd3a0-3890-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 18:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579200218;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=vndVmppHrX01R3BBRa6xF5W9PCI9m3EtlQ6Vl5CREGM=;
 b=Jyyq6T410QAMOToueSTJ4yQ5RZuhW1N6ZhK6xtAQfdgIvGPhHjStJ5fr
 l2amgKuH7rtCoJEZCCq6Pw7jOfPjEFo23hbdHXrPh4Wsonyxj4mgRIW1E
 ECopQCeYsrosmWTwDTILVEm00pCLd1BRCDDzeps4HhAX30wEnFMzieh4A k=;
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
IronPort-SDR: jNaqeyDSb3K4tNoEwyEE/eRMNLlRF+6y24MbKJVyC1lCVQk7cpd3iUV84WOqqn78DwORHviJdx
 UQTsL2Hl+98zPdxv/Gq7W+zybkaVfo+nqWhg3NOc1fTP9k6qPqnTgB+4+JvvAesjq6/8H+NeMA
 YEAMaFY1wcYcM4lGNRA9IKf+gqP1icKoeruhKhZGSYoyM9mLvlFvPw68B6VL9dHTwmGUExn21V
 WHPGmzN9J8k/qn7XnkTEZksUtyX7J6uv6rhLrKzJMxYrjgn/X0OmJpdpn4+3RjYKyYTAYJzmaR
 CqU=
X-SBRS: 2.7
X-MesageID: 11203352
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,327,1574139600"; d="scan'208";a="11203352"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24096.44750.716272.872008@mariner.uk.xensource.com>
Date: Thu, 16 Jan 2020 18:43:26 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200116093602.4203-1-pdurrant@amazon.com>
References: <20200116093602.4203-1-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 0/6] xl/libxl: domid
 allocation/preservation changes
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, "jandryuk@gmail.com" <jandryuk@gmail.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2MyAwLzZdIHhsL2xpYnhsOiBkb21pZCBhbGxv
Y2F0aW9uL3ByZXNlcnZhdGlvbiBjaGFuZ2VzIik6Cj4gVGhpcyBzZXJpZXMgd2FzIHByZXZpb3Vz
bHkgbmFtZWQgInhsL2xpYnhsOiBhbGxvdyBjcmVhdGlvbiBvZiBkb21haW5zIHdpdGgKPiBhIHNw
ZWNpZmllZCBkb21pZCIuCgpUaGFua3MuICBJIHRoaW5rIEFudGhvbnkgb3VnaHQgdG8gaGF2ZSBi
ZWVuIG1hZGUgYSBtYWludGFpbmVyIG9mCnRvb2xzL3hsIGF0IHRoZSBzYW1lIHRpbWUgYXMgb2Yg
dG9vbHMvbGlieGwuICBCdXQgdGhhdCBpc24ndCBzbyBpbgpNQUlOVEFJTkVSUyByaWdodCBub3cs
IHNvIGhlIHdhc24ndCBDQydkIG9uIGFsbCB0aGVzZSBwYXRjaGVzLiAgSWYgeW91CmNvdWxkIGZp
eCB0aGF0IHVwIG1hbnVhbGx5IGZvciBmdXR1cmUgbWFpbHMsIHRoYXQgd291bGQgYmUgZ3JlYXQu
CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
