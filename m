Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3DFF8DD5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 12:17:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUU7p-00079t-QC; Tue, 12 Nov 2019 11:14:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WaD3=ZE=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iUU7o-00079o-UL
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 11:14:20 +0000
X-Inumbo-ID: 92180f36-053d-11ea-b678-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92180f36-053d-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 11:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573557259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Rlp7eA7FbRl+tREdn2Ig8orcF1br26uWgw1dXvzyn7s=;
 b=ZAC+FMqDQv99jkeuu3RztKXN+U21WMgMUgOSKtCQJj6n2/37jd9s1JY0
 D2d7PAVJRF6tipUOzAXvS6Xc1VcXekxUpdxXH6WbLeGVGLFEOJ38FdszD
 GnQHYMqwkvKDWzcoXD8EQ3S8k+h3ItyAoDRBBlhPp/Imh8GeSXW9Yvkf2 g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pTJczdCRb5zkDMD/GYr1tQQ+umYQAYq5Ob8EfhMZj0UTv0ysFgrd1zyDc9sF52+OPMbmEeE8sz
 zt15PfSL21ZjaUPeNO++08pOPdqjFZQcN0FZgVcT9mC1K1XjtXky9IS/XP3Blp6qNksFVSYwud
 Xsg1esknh0c/gAJEePCtT8PkWqCP/4YoA8iE4P8s6WEk/eMAh3tYTSPOkH0czYNAKWZxA3KMMu
 EWQXAtGViWYpHxCyrl+9SAgX3kVVSV+wn0zNKosVsbcCRhTBNXsTM2Ki1A/tWYb/qafXFELB5O
 ZgE=
X-SBRS: 2.7
X-MesageID: 8704552
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,296,1569297600"; 
   d="scan'208";a="8704552"
Date: Tue, 12 Nov 2019 11:14:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20191112111416.GA2337@perard.uk.xensource.com>
References: <20191108190952.22163-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108190952.22163-1-sstabellini@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH] Introduce a description of a new optional
 tag for Backports
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
Cc: lars.kurth@citrix.com, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMDgsIDIwMTkgYXQgMTE6MDk6NTJBTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+ICtCYWNrcG9ydCBUYWcKPiArLS0tLS0tLS0tLS0tCj4gKwo+ICtBIGJhY2tw
b3J0IHRhZyBpcyBhbiBvcHRpb25hbCB0YWcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHJlcXVl
c3QgYQo+ICtnaXZlbiBjb21taXQgdG8gYmUgYmFja3BvcnRlZCB0byB0aGUgc3RhYmxlIHRyZWVz
Ogo+ICsKPiArICAgIEJhY2twb3J0OiBhbGwKWy4uLl0KClNob3VsZCB3ZSBkZXNjcmliZSB0aGUg
Rml4ZXM6IHRhZyBhcyB3ZWxsPyBUaGVzZSB3b3VsZCBoYXZlIGEgc2ltaWxhcgpwdXJwb3NlIHRv
IHRoZSBiYWNrcG9ydCB0YWcsIEkgbWVhbiBpdCBjb3VsZCBoZWxwIGZpZ3VyZSBvdXQgd2hpY2gK
Y29tbWl0IHRvIGJhY2twb3J0IHRvIHdoaWNoIHRyZWUuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
