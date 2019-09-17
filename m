Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D38B5401
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:22:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAH8L-0006Yy-2w; Tue, 17 Sep 2019 17:19:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAH8J-0006Ya-0F
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:19:19 +0000
X-Inumbo-ID: 479e761a-d96f-11e9-961c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 479e761a-d96f-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740758;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zTWp+kPAacUPjU7ztp5oiUXmGrIHXGtTa3wkHnD0CtA=;
 b=Jno1Prz2Rzt9YBzRnTeE7kat5nFxT02bDao5+A5yWlZ/iUWhbcg/RqDo
 E8CqVpnmlBZO6Gt20OhEpum3HrLWQQqSJvgKtUrMoxgomH9P2pcGnUJqm
 qFXPOBwkJRosxERytA/9a4FNfk4NicFNp/plus0tkIJSbrwGHIdY6mWRu 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: idRAXYBX+tz3xSFzE37VlN9CdoeL9zQisB3WXvGwB0cyOEtZwcG459U7W4s1nShXB23hMsOMrk
 bLANZ1E3JPbiIFr3IWWpqnLYQd36tI+uKgZwv1ROGBrNjb2XjRfm4TLUagnITVfnK9sEjW+3LP
 baFNVL6ZZh/4X0hksjk0qLseMk7awPqOF/fPtbsGHGUuiNoKluXnhYUb9nI5MJoLyab9ieUHy/
 svu+1TRiMhYNb3noO7h2+G0RZNqGVVrvpAV/pELtXuVaIGjenLJET3/RFalBzEbnw4Bc4fCcYG
 7eg=
X-SBRS: 2.7
X-MesageID: 5686081
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5686081"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.5522.999447.418653@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:19:14 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-29-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-29-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 28/35] libxl_pci: Use ev_qmp in do_pci_add
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDI4LzM1XSBsaWJ4bF9wY2k6IFVzZSBldl9x
bXAgaW4gZG9fcGNpX2FkZCIpOgo+IFRoaXMgcGF0Y2ggYWxzbyByZXBsYWNlcyB0aGUgdXNlIG9m
Cj4gbGlieGxfX3dhaXRfZm9yX2RldmljZV9tb2RlbF9kZXByZWNhdGVkKCkgYnkgaXRzIGVxdWl2
YWxlbnQKPiB3aXRob3V0IHRoZSBuZWVkIGZvciBhIHRocmVhZC4KCkFnYWluLCB3b3VsZCBpdCBi
ZSBlYXN5IHRvIGFkZCBhIHByZS1wYXRjaCBzbyBJIGNhbiBzZWUgdGhlIGNvZGUKY2hhbmdlcyA/
ICBJZiBub3QgSSB3aWxsIGNvbXBhcmUgbGluZS1ieS1saW5lIGJ5IGhhbmQuCgpUaGFua3MsCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
