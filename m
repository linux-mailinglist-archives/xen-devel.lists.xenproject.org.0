Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A806C2590
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 18:59:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEyyk-0000tv-Iw; Mon, 30 Sep 2019 16:56:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jhqc=XZ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iEyyj-0000tq-Ks
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 16:56:53 +0000
X-Inumbo-ID: 4cf25c1b-e3a3-11e9-96dc-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 4cf25c1b-e3a3-11e9-96dc-12813bfff9fa;
 Mon, 30 Sep 2019 16:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569862613;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=re04GIfScrTqSkwS2Tx/7/F3mBkhjikbiMKtu/N9Q6U=;
 b=A8nbju7fc7Tx0RBSqq5NjOD5WUecpHd+mN3FRYQFccX/r3L6ZgMJk+BP
 9mmSjbML8uTWnEPcvhPi7eJfTB1AGvhKSArrAjA7dgI7FaS44MGqLGKcz
 512GoNGhELbd6HkfRcv6UJ9aOukxuvq2svBh5lrMQE+dhwnmfeW7F0d6L Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QPY7ve94fMkb6qTWyBVXlyppGdl/6LCO9uTuES8tULO/aiQotfuChn4nxB/GkgFSW2Ry6/5d2h
 CCFcyVrSqB8qcffn1mRuU/xJl0Bg8swQtaS4tJzvFl1Ro0k8Dm12O5mcrQBugrL1JuMfkCI8Ha
 Y+ImKvyc+j8YjDFQWVxyc7iTHFheQ9J6ffDQIy6LhTumStdosmz9U1IBUUKDVpj/iGJTWlndbb
 VgahQ0UgEitcqFSSIFbtL08RUK4vwnkj5NgawPvSwaLo8sioNdmkvPb05i3MKQGkYwiNeN95P0
 NiQ=
X-SBRS: 2.7
X-MesageID: 6264396
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6264396"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23954.13249.837344.255494@mariner.uk.xensource.com>
Date: Mon, 30 Sep 2019 17:56:33 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190930165309.1600-1-julien.grall@arm.com>
References: <20190930165309.1600-1-julien.grall@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RESEND PATCH v2] Update my e-mail in MAINTAINERS
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIltSRVNFTkQgUEFUQ0ggdjJdIFVwZGF0ZSBteSBlLW1haWwg
aW4gTUFJTlRBSU5FUlMiKToKPiBJIHdpbGwgc29vbiBsb3NlIGFjY2VzcyB0byBteSBBcm0gZS1t
YWlsIGFkZHJlc3MuIFVwZGF0ZSBpdCB0bwo+IGp1bGllbkB4ZW4ub3JnCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDYzoganVsaWVuQHhl
bi5vcmcKCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
CmFuZCBwdXNoZWQuCgpTb3JyeSBmb3IgeW91IGhhdmluZyB0byByZXNlbmQgaXQuCgpJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
