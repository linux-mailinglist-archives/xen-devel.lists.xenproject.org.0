Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC39412825D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 19:48:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiNGr-0007Nc-0Q; Fri, 20 Dec 2019 18:45:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiNGp-0007NX-Gp
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 18:45:03 +0000
X-Inumbo-ID: d4c15acb-2358-11ea-93d4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4c15acb-2358-11ea-93d4-12813bfff9fa;
 Fri, 20 Dec 2019 18:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576867502;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=B9xisDR0RIA15S0xV3Dv16RxgWxKiYv0qx1z+aLOjVQ=;
 b=bqaR1Ff2Aoo2Roup6GAJWVWm3iD8sRgPfNbe/O4GzgkABid26fguDQSU
 uHkAzNMNFgJsW+ptlj1+LvBGqqI/vWBqcZtwnK+4/4HzOLU+Ov32qynCv
 hJ8u9Evd2ROLy+bk4Ca3Qxrj+b5AtDo+Niaxzu/jLlrkUYJjNq3GGIDp9 Q=;
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
IronPort-SDR: bSCumzJ3YiBou0T+cdaF1HlDpZhBjnaI8JakfYFm9YwUcqrFq7kzsZIsXnOmD1/nJnyEQ9tuE1
 ERcbPmMCGs6ZG3Fokxd/cB41Y8d3lhwAXbOSTuqMAOQ8rd8SwGaSS9br1ME3V2g/H6UjZHE+XY
 6MWbI9q1dr1vW2QENirAMqN30Ad5v7zx0DqOzdMO7A6cEarUx+QYCeos+JrJOnIyALgB0aOxy6
 MD6WZ30tNUEr5vMIffJ6pFSIkeml4IRXAzrSSVyTcBpha+3ZIs77GkhSUDjK2ZqSEPaXgr7l5S
 QlM=
X-SBRS: 2.7
X-MesageID: 10595143
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10595143"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24061.5802.960159.728410@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 18:44:58 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <ac3f416e-94fb-fd93-a4fb-b9db3cdc25bc@citrix.com>
References: <20191220173502.15615-1-andrew.cooper3@citrix.com>
 <24061.4572.799452.523703@mariner.uk.xensource.com>
 <ac3f416e-94fb-fd93-a4fb-b9db3cdc25bc@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxc/migration: Drop unimplemneted domain
 types
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIXSBsaWJ4Yy9taWdyYXRpb246IERyb3Ag
dW5pbXBsZW1uZXRlZCBkb21haW4gdHlwZXMiKToKPiBPbiAyMC8xMi8yMDE5IDE4OjI0LCBJYW4g
SmFja3NvbiB3cm90ZToKPiA+IENvdWxkIHRoZXJlIGJlIGFueSBzb2Z0d2FyZSB3aGljaCB1c2Vz
IHRoZW0gPwo+IAo+IE5vdCBwbGF1c2libHksIG5vLCBnaXZlbi4uLgo+IAo+ID4gRWcsIG1heWJl
IHNvbWVvbmUgcHV0IHRoZSBSRkMgc2VyaWVzIGludG8gcHJvZHVjdGlvbiA/Cj4gCj4gLi4uIHRo
ZSByYXRoZXIgbGFyZ2Ugc2V0IG9mIG91dHN0YW5kaW5nIFRPRE8gaXRlbXMgaW4gSWFuQydzIFJG
QyBzZXJpZXMsCj4gd2hpY2ggaW5jbHVkZWQgInRoZSBoeXBlcnZpc29yIGlzIHVuc3RhYmxlIHdo
ZW4gbG9nZGlydHkgZ2V0cyBlbmFibGVkIiBJSVJDLgoKT0sgOi0pLgoKQWNrZWQtYnk6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
