Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59171AD952
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 14:45:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Izh-0007sJ-Vu; Mon, 09 Sep 2019 12:42:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiN8=XE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7Izg-0007sE-PS
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 12:42:08 +0000
X-Inumbo-ID: 3bae6a48-d2ff-11e9-b76c-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bae6a48-d2ff-11e9-b76c-bc764e2007e4;
 Mon, 09 Sep 2019 12:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568032928;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=eGAi7oGFJfUHvYIBJ5fRR+TK1ESvqxKm78paMSOD+xI=;
 b=hoiOACl/PjHtKCKhDvQy1n4pG6849vJ+aCVK94u7Some4N1LnTW8+gqt
 7uVlMg9kGQ/45CE7w3CYH3atrRcPMS3evjEO4x5wkolheoRBMeydvzPAG
 j6F629fDDiGJPsJxfWQOfyT4OgaM1Etil+oW5KxTaQL42IbU+yMhkvA4F I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IFENilvkUyYvd9wMfNR6gaPHcjRPMCWl/r617BG7zTzLXGDcVlf8V2G+3Ad08of1pO5twUMS57
 CR1Tosq+HHIEXPSujPPRftvTUkpfJKSG5riWQSKEYYaZT1cCM1FL/Xv9T+W0u2ZSiAuySgFTzt
 Bt7kHiNDHqSwsjztxZHEnlOHArEqBI6BBYJoq+Nh+uVLj/QUHRYdXLySZiFIfo/awj+Aon4uAP
 Lh6WJmpJ/3qaRQrVkNl5uEqH7VON6g26+tQOPyc9/c/g0TMZl7sXPeOSfLhXDVRvjtkcgBOaDE
 kLY=
X-SBRS: 2.7
X-MesageID: 5363388
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5363388"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23926.18558.942759.385214@mariner.uk.xensource.com>
Date: Mon, 9 Sep 2019 13:41:34 +0100
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <20190906124103.8535-1-jgross@suse.com>
References: <20190906124103.8535-1-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2] tools/libs: put common Makefile parts
 into new libs.mk
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

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJbUEFUQ0ggdjJdIHRvb2xzL2xpYnM6IHB1dCBjb21tb24g
TWFrZWZpbGUgcGFydHMgaW50byBuZXcgbGlicy5tayIpOgo+IFRoZSBNYWtlZmlsZSBiZWxvdyB0
b29scy9saWJzIGhhdmUgYSBsb3QgaW4gY29tbW9uLiBQdXQgdGhvc2UgY29tbW9uCj4gcGFydHMg
aW50byBhIG5ldyBsaWJzLm1rIGFuZCBpbmNsdWRlIHRoYXQgZnJvbSB0aGUgc3BlY2lmaWMgTWFr
ZWZpbGVzLgouLi4KPiAgdG9vbHMvbGlicy9jYWxsL01ha2VmaWxlICAgICAgICAgIHwgODYgKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgdG9vbHMvbGlicy9kZXZpY2Vtb2Rl
bC9NYWtlZmlsZSAgIHwgODggKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IHRvb2xzL2xpYnMvZXZ0Y2huL01ha2VmaWxlICAgICAgICB8IDg2ICsrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL2xpYnMvZm9yZWlnbm1lbW9yeS9NYWtlZmlsZSB8
IDg2ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL2xpYnMvZ250
dGFiL01ha2VmaWxlICAgICAgICB8IDg2ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gIHRvb2xzL2xpYnMvbGlicy5tayAgICAgICAgICAgICAgICB8IDk1ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICB0b29scy9saWJzL3Rvb2xjb3JlL01ha2Vm
aWxlICAgICAgfCA4NSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB0b29s
cy9saWJzL3Rvb2xsb2cvTWFrZWZpbGUgICAgICAgfCA4NCArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCgpXb3csIGltcHJlc3NpdmUhCgpIYXZlIHlvdSBkb25lIGFueSBjaGVja3Mg
dGhhdCB0aGUgcmVzdWx0cyBhcmUgaWRlbnRpY2FsIChvciwgSSBndWVzcywKc3VmZmljaWVudGx5
IHNpbWlsYXIpID8gIChJZiBvbmx5IHdlIGhhZCBhIHJlcHJvZHVjaWJsZSBidWlsZC4uLikKCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
