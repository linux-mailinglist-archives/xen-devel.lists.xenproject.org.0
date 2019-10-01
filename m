Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 577BEC319B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:38:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFVM-0004SA-ND; Tue, 01 Oct 2019 10:35:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehNT=X2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iFFVL-0004Rz-0C
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:35:39 +0000
X-Inumbo-ID: 353c811a-e437-11e9-bf31-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 353c811a-e437-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569926138;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2E5MaSqe8cM52Alp8l/E5DQtEbSAc3CSlW8cTRe8AV4=;
 b=ArdchyNoo0lUwZHMx+IrJr1/8jtuFhi8mTV4AXhJ61PnvTLnWO7uvRo2
 aqSH4IZGUJLEpNFdE40SoTYMcQZthBqisW46232hkvaRxL5A4rfdA/7Zr
 gWQOkcbFVCXh2xUDQaE38ZrwLJJutDSl4TkKY4lPYNN2HU/emymfxgfY9 g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lUy4iRRX8PVEmepJ/Fy2kzsR6SkuC0vtq4YNetF9UIHM+6VIE9ipcHtEhIEgH4bmzy2OjAC901
 ISFwR36UwQG/oyv1tL+b00mZH3PrVyBHw31+weDXsiq+kXBuBiCkaGGD7oKO1wqzGxbVUugWrp
 WUwwODGGgH8m75QHPd7rlJ2BQFzJyQCMuBSEBluNjE72jb9hzvc94S1WkwvE9n24OWr1UfcHWC
 +Ds9s6AORM2JUdPy3SFHR89Ub1QldxLm5lba0/adjDzFrrEIxc6yfj8z+Ca4Db1x7NJkqJSfWu
 d9I=
X-SBRS: 2.7
X-MesageID: 6587621
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6587621"
Date: Tue, 1 Oct 2019 11:35:22 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Message-ID: <20191001103522.GG1163@perard.uk.xensource.com>
References: <20190930172327.784520-1-anthony.perard@citrix.com>
 <20190930172327.784520-3-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930172327.784520-3-anthony.perard@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH 2/2] libxl_pci: Fix guest shutdown with PCI
 PT attached
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
Cc: Sander
 Eikelenboom <linux@eikelenboom.it>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmV3cml0ZSBvZiB0aGUgY29tbWl0IG1lc3NhZ2U6CgpCZWZvcmUgdGhlIHByb2JsZW1hdGljIGNv
bW1pdCwgbGlieGwgdXNlZCB0byBpZ25vcmUgZXJyb3Igd2hlbgpkZXN0cm95aW5nIChmb3JjZSA9
PSB0cnVlKSBhIHBhc3N0aHJvdWdoIGRldmljZSwgZXNwZWNpYWxseSBlcnJvciB0aGF0CmhhcHBl
bnMgd2hlbiBkZWFsaW5nIHdpdGggdGhlIERNLgoKU2luY2UgZmFlNDg4MGM0NWZlLCBpZiB0aGUg
RE0gZmFpbGVkIHRvIGRldGFjaCB0aGUgcGNpIGRldmljZSB3aXRoaW4KdGhlIGFsbG93ZWQgdGlt
ZSwgdGhlIHRpbWVkIG91dCBlcnJvciByYWlzZWQgc2tpcCBwYXJ0IG9mCnBjaV9yZW1vdmVfKiwg
YnV0IGFsc28gcmFpc2UgdGhlIGVycm9yIHVwIHRvIHRoZSBjYWxsZXIgb2YKbGlieGxfX2Rldmlj
ZV9wY2lfZGVzdHJveV9hbGwsIGxpYnhsX19kZXN0cm95X2RvbWlkLCBhbmQgdGh1cyB0aGUKZGVz
dHJ1Y3Rpb24gb2YgdGhlIGRvbWFpbiBmYWlscy4KCkluIHRoaXMgcGF0Y2gsIGlmIHRoZSBETSBk
aWRuJ3QgY29uZmlybWVkIHRoYXQgdGhlIGRldmljZSBpcyByZW1vdmVkLAp3ZSB3aWxsIHByaW50
IGEgd2FybmluZyBhbmQga2VlcCBnb2luZyBpZiBmb3JjZT10cnVlLiAgVGhlIHBhdGNoCnJlb3Jk
ZXIgdGhlIGZ1bmN0aW9ucyBzbyB0aGF0IHBjaV9yZW1vdmVfdGltZW91dCgpIGNhbGxzCnBjaV9y
ZW1vdmVfZGV0YXRjaGVkKCkgbGlrZSBpdCdzIGRvbmUgd2hlbiBETSBjYWxscyBhcmUgc3VjY2Vz
c2Z1bC4KCldlIGFsc28gY2xlYW4gdGhlIFFNUCBzdGF0ZXMgYW5kIGFzc29jaWF0ZWQgdGltZW91
dHMgZWFybGllciwgYXMgc29vbgphcyB0aGV5IGFyZSBub3QgbmVlZGVkIGFueW1vcmUuCgpSZXBv
cnRlZC1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KRml4ZXM6
IGZhZTQ4ODBjNDVmZTAxNWU1NjdhZmEyMjNmNzhiZjE3YTZkOThlMWIKU2lnbmVkLW9mZi1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgotLSAKQW50aG9ueSBQ
RVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
