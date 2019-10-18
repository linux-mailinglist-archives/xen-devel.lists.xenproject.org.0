Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92055DCA1C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 18:00:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLUbs-0002VT-4Q; Fri, 18 Oct 2019 15:56:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/MKZ=YL=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iLUbr-0002VO-0i
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 15:56:11 +0000
X-Inumbo-ID: cd5fa590-f1bf-11e9-beca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd5fa590-f1bf-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571414171;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=hYImDmoSvBExWJ8Yy6hU3n60kTmSnzSCNdoKG0be/e8=;
 b=YmWkgsaVyY4nsErHTHQhf9wAMmpARWyDPPd5SA1o1yxAAAaaKNdq39gU
 44zcrsD4EVkVMYasNO2lv+jyXsDNWCmgxtDWbzgH3goABixmcTH8YlxnK
 DSRxs6M5gRSMBHPME1ZlXAQ0EOXkAMZgES9BM7kEl4so0rpqaa8WWhkqT A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lsVWaSpnmDp0G3FF4RIlgR6HsZtE10LCkGxrWpW/Gwj3hevdf5M91uPLNceq4hklJDRPDpetXE
 6ukuBwXx6NYoWZuPmAf72FCauECfWRJuYx9cD9zmdazS4cHpS9/kJ303KiC7x7Cn6m/l6x/8r6
 lEKI6f2tnOsuJ+5jXcWckrYKMgTpjWCUJwAHb8yW7f35AzT2quA7TSi1uMoK7203nboHBEmsfB
 142bWcfO3CaoSucrfqPW1AgnjyfR8ZtHkeLBjCNlaAhxP78Db8lx4TjX426Mi/nxT2b7/gpVBi
 QQ4=
X-SBRS: 2.7
X-MesageID: 7103192
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,312,1566878400"; 
   d="scan'208";a="7103192"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23977.57494.266150.354517@mariner.uk.xensource.com>
Date: Fri, 18 Oct 2019 16:56:06 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <707b518c-045c-0db7-0c6b-939d6d5566d8@arm.com>
References: <20191018150653.24862-1-ian.jackson@eu.citrix.com>
 <20191018150653.24862-11-ian.jackson@eu.citrix.com>
 <38a9ad6c-6624-3e2a-aca7-20cb8ee14ce9@arm.com>
 <23977.57197.104861.3770@mariner.uk.xensource.com>
 <707b518c-045c-0db7-0c6b-939d6d5566d8@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v5 10/10] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul
 Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbWEVOIFBBVENIIGZvci00LjEzIHY1IDEwLzEwXSBs
aWJ4bC94bDogT3ZlcmhhdWwgcGFzc3Rocm91Z2ggc2V0dGluZyBsb2dpYyIpOgo+IE9uIDE4LzEw
LzIwMTkgMTY6NTEsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSSB3b3VsZG4ndCBtaW5kIGNoYW5n
aW5nIHRoaXMgdG8KPiA+ICAgICBjX2luZm8tPnBhc3N0aHJvdWdoICE9IExJQlhMX1BBU1NUSFJP
VUdIX1NIQVJFX1BUCj4gCj4gSSB0aGluayBpdCB3b3VsZCBuZWVkIHRvIGJlCj4gCj4gY19pbmZv
LT5wYXNzdGhyb3VnaCAhPSBMSUJYTF9QQVNTVEhST1VHSF9TSEFSRV9QVCAmJiBjX2luZm8tPnBh
c3N0aHJvdWdoICE9IAo+IExJQlhMX1BBU1NUSFJPVUdIX0RJU0FCTEVELgoKRXJyLCBpbmRlZWQu
ICBJJ2xsIGRvIHRoaXMgb3IgYSBzd2l0Y2goKS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
