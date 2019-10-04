Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D847CBFE0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 17:58:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGPvq-0005vL-Fn; Fri, 04 Oct 2019 15:55:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGPvo-0005vC-LQ
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 15:55:48 +0000
X-Inumbo-ID: 6e54e82c-e6bf-11e9-8c93-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e54e82c-e6bf-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570204548;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=CmtLlDh6yM/FgDPpxvZJAJ8tEiFqOUkCjfd71PW+DRo=;
 b=KplXjrYfY6iv475ul4qYzVvlzoaqAP/Nq26uFyb1IGZOV2zMAWVFK2sp
 dGsqZckuNaM8puNDAFgxetSuq5VrEORI209MEb5mCPbbIAktvl4WcK6Vy
 EjBizuGxPjtwD3Z2FkEdba2BkdwIl0Vs+ohiPY067w5TGrfqr7yF+Dxzq w=;
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
IronPort-SDR: l26EOhyri6A/SozLi0dujMWUIJppIt3+oRbusXsdL5VAdtxvEplLVvJulJFvPHeLsepZGFDs+7
 kB18Nlqlnp/400GX/Fa53J3wMTIwyNNgPi31VWenhlg2XmQJbs9yXJS6OlGEC4P8ycuKUkprbq
 qvJiChcC8MaR/uGE3ZX1bFdwK1GHYmEIFz1C0rmN7gquJj+koFD+W5NnF6iwIPSSHy3CSm674F
 77lWmNkpGNZtw+kLplAiImYMm9ycDoswf2QX+cfBhTNmSAg7xiQJLdQnNwGaTl8dMgXWWX6Jj8
 CAo=
X-SBRS: 2.7
X-MesageID: 6479838
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6479838"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23959.27520.714980.795791@mariner.uk.xensource.com>
Date: Fri, 4 Oct 2019 16:55:44 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <2893c735-48b8-6e34-79e1-5dbea6afaa26@suse.com>
References: <20190930172327.784520-1-anthony.perard@citrix.com>
 <23956.50708.749190.711920@mariner.uk.xensource.com>
 <2893c735-48b8-6e34-79e1-5dbea6afaa26@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 0/2] libxl fixes with pci passthrough
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

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1BBVENIIDAvMl0gbGlieGwgZml4ZXMgd2l0aCBw
Y2kgcGFzc3Rocm91Z2giKToKPiBPbiAwMi4xMC4xOSAxNzo0NSwgSWFuIEphY2tzb24gd3JvdGU6
Cj4gPiBIaSBKdWVyZ2VuLiAgSGVyZSdzIGFub3RoZXIgYnVnZml4IHNlcmllcwo+ID4gICAgaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5
L21zZzAzMzIwLmh0bWwKPiA+ICAgIGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Bl
b3BsZS9hcGVyYXJkL3hlbi11bnN0YWJsZS5naXQKPiA+ICAgICNici5maXhlcy1mb3ItcGNpLXB0
LWxpYnhsLXYxCj4gPiBuZWVkaW5nIHlvdXIgcmVsZWFzZSByZXZpZXcuCj4gCj4gRm9yIHRoZSBz
ZXJpZXM6Cj4gCj4gUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKVGhhbmtzLCBwdXQgbXkgZm9ybWFsIGFjayBvbiBpdCwgYW5kIHB1c2hlZC4KCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
