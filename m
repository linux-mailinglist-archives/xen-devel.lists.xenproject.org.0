Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8247414D8F6
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:34:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix76Q-0003bm-UB; Thu, 30 Jan 2020 10:31:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q1Hx=3T=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ix76Q-0003bh-7W
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:31:14 +0000
X-Inumbo-ID: a3731ff4-434b-11ea-8396-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3731ff4-434b-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580380273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QBCVVQGcOTC/1tIwvw9xHSKGHO5HXQFQw7OWSF1lDMY=;
 b=IBm8OeCzZ/zPdNPmNN2pDi2jyOvvYxc+cBQyB96t5R8G44s5nGAQpefE
 z6evG+IfL6tYSTmJncDigM65Yk54kfMlyVQ6A8VEh/MnBsD8G+nybJnL+
 wTgG7QXB9+PRL0uj6R7JUxiihAc2cXe9ocvWLSOj7EwrAcVrpNi72w5Vy 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /Z5lcZdlY/5d7FDuyTwy1MlELOr8mGqwk9aX962doINL+7w4x896/H3pBXI3/3fGd/FtPg8/0F
 S09GKaiZlsEoprvCLjh6EPzuWMXctCL8RKAnQ8k63mvqM18hrTbdnLxNPdYfVr8UeBZG3XlFVq
 FGi1AsrS1dPLpi4RPYxPioBxsx3tSOTaN5YIzLiV7vuACnTZ3NrZCzEg2BJ9H4rx7nauRBhp2a
 0EdrkkwDNcPIoyBg52M23ppgpHEAbhjkHP/SSWjeBhUE384Cz2HSYYECU6WjXLRBLB7WXf2EKC
 ZVA=
X-SBRS: 2.7
X-MesageID: 12106400
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="12106400"
Date: Thu, 30 Jan 2020 10:31:10 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20200130103110.GN1288@perard.uk.xensource.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-4-anthony.perard@citrix.com>
 <edaa36a9-e4a0-8255-67b5-ebe51fae87ce@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edaa36a9-e4a0-8255-67b5-ebe51fae87ce@redhat.com>
Subject: Re: [Xen-devel] [PATCH 3/5] OvmfPkg/IndustryStandard/Xen: Apply
 EDK2 coding style to XEN_VCPU_TIME_INFO
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Liming Gao <liming.gao@intel.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDU6MTQ6MzVQTSArMDEwMCwgTGFzemxvIEVyc2VrIHdy
b3RlOgo+IE9uIDAxLzI5LzIwIDEzOjEyLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiBBc3N1bWlu
ZyB0aGUgT1ZNRiBwbGF0Zm9ybXMgY29udGludWUgdG8gYnVpbGQgYXQgdGhpcyBzdGFnZSBpbnRv
IHRoZQo+IHNlcmllcywgYW5kIHByb3ZpZGVkIHRoYXQgKDEpIGFuZCAoMikgYXJlIGZpeGVkOgoK
SSdsbCBmaXggKDEpIGFuZCAoMikuCgpJJ3ZlIGJ1aWxkIHRlc3RzIGJvdGggT3ZtZlhlbiBhbmQg
T3ZtZlBrZ1g2NCwgYW5kIEkndmUgZ3JlcCBmb3Igc29tZSBvZgp0aG9zZSBmaWVsZCwgYW5kIHRo
ZSBzdHJ1Y3QgbmFtZSwgc28gSSB0aGluayBBcm1WaXJ0WGVuIHdpbGwgYWxzbwpjb250aW51ZSB0
byBidWlsZC4KCj4gUmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+
CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
