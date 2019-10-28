Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF90E76DB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 17:43:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP85P-0000Ng-8o; Mon, 28 Oct 2019 16:41:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP85N-0000NS-Ng
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 16:41:41 +0000
X-Inumbo-ID: d148cf9e-f9a1-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d148cf9e-f9a1-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572280901;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=bf8YC0rdI+6PEHF6nfMp5393vfTnBnvzjscrO4LQTRU=;
 b=LPzg/IAQ4ZrjwugdCcavylMSTvVIunrFUMo/p7suiwUmNloo9dGHhAuX
 erOrWZSIHt+vJliOT8TECh8umB6Qd2XXjB99TAHyeDcGHLwOJzURLjXg7
 lzQtUSH6jiJBSv1vby2p1zZvENPxeVqfpgLo8jj1Sy0CJuu8Pf3P24sRT M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /3ihAsZzWp25ckd2yzbUosMUteN9eQwkZ0vUVRV2Iap73PqBdg6Wb9Hnq1TxHRBtmOKGjBj2CB
 kH6cvwlHPj8GrmmFvP9rCoflBCVQyYv7CYuT9EwNHfejFeZFKzObV+HcLisygouhPhNL8XxLon
 YlfsNnc9Js9f5HI6mOYDcl7hjtGvI+5tIElsY3uMKP2syTSud5eBQCLEh8OVEK4i9pMcnvTV8D
 Wmt4Y3B7DyyCMs2VIZCQ7bmqoled+gfGcWeNB3o9P353H9PULvgS62og3Y0jZ3dUaC21r8o0t1
 fMY=
X-SBRS: 2.7
X-MesageID: 7974044
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7974044"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23991.6721.942851.712375@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 16:41:37 +0000
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
In-Reply-To: <fd1456c411e13d43ca909e43c2800086c5ef3046.1572038720.git.m.a.young@durham.ac.uk>
References: <cover.1572038720.git.m.a.young@durham.ac.uk>
 <fd1456c411e13d43ca909e43c2800086c5ef3046.1572038720.git.m.a.young@durham.ac.uk>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH 3/3] Example Fedora 31 grub.cfg and
 grubenv files
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WU9VTkcsIE1JQ0hBRUwgQS4gd3JpdGVzICgiW1hFTiBQQVRDSCAzLzNdIEV4YW1wbGUgRmVkb3Jh
IDMxIGdydWIuY2ZnIGFuZCBncnViZW52IGZpbGVzIik6Cj4gVGhpcyBwYXRjaCBhZGRzIGFuIGV4
YW1wbGUgZ3J1Yi5jZmcgYW5kIGdydWJlbnYgZmlsZSBmb3IgcmVmZXJlbmNlCgpBY2tlZC1ieTog
SWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpBY3R1YWwgdGVzdCBjYXNl
cyBvZiBzb21lIGtpbmQgd291bGQgYmUgbW9zdCB3ZWxjb21lLgoKVGhhbmtzLApJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
