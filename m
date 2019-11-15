Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB845FE079
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:47:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVcqh-0007pA-2i; Fri, 15 Nov 2019 14:45:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=o1em=ZH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iVcqf-0007p0-C2
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:45:21 +0000
X-Inumbo-ID: 8b2be91a-07b6-11ea-adbe-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b2be91a-07b6-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573829119;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Wpkl/Nm2l0hYQYBCo6ExnvhZviNGR90SArpQT6QY7IM=;
 b=Qd1QfLpV++atv08o9YzZpq8NwuNY/pF/99/JxTcnxFWXH96FQEymPx8H
 f8MRuqkA0Ruqz2zU9vpf1FdCj/sHAGVKPf3RHs5tvlmWyHHI/D1rwOy32
 vx6VUE6t6Ov/1ahelzhUAfjkfrSP46C5r9cTFRcl37xpuuN/4vWDsc1AV o=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: D3kpyQaiZC7XM1mU5VhVr2zP2MGuyvV5QW6B2UyXeQ6pFuywR9HlVWRjniNSGrQxfIr1ILspag
 zHl3mVfOgY4QXOgYbGC+b1RWiyXFNGFxzYE5U1/lKJhns7p6+KupFPqJRPM6caDTu36AtOwCGh
 ecoc3DSwGNNn6BzzAgVKLGwlf+2UnNpG4hOBxrizIyz/FMM2pyhUJ3g0OWrzmNyGo+HVfJlwOA
 SSYUh4seER7Xo7cm3NEq+mzCu0Hfh01pU+XGjVZ4RwYqQ0OogtxceaLXuxQarEC/x9YlzUuL34
 OI8=
X-SBRS: 2.7
X-MesageID: 8500274
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8500274"
Date: Fri, 15 Nov 2019 15:45:09 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191115143959.GI72134@Air-de-Roger>
References: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31625143-edf7-2517-b4a0-c49b8b242934@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 0/2] x86: clank build check adjustments
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMTE6NDM6MjFBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gMTogZml4IGNsYW5nIC5tYWNybyByZXRlbnRpb24gY2hlY2sKPiAyOiBjbGFuZzogbW92
ZSBhbmQgZml4IC5za2lwIGNoZWNrCgpGb3IgYm90aDoKClRlc3RlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGFzdUBjaXRyaXguY29tPgpbT24gRnJlZUJTRCBhbmQgRGViaWFuIDkuNV0K
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKTm90
ZSB0aGVyZSdzIGEgdHlwbyBpbiB0aGlzIGVtYWlsJ3Mgc3ViamVjdCAoY2xhbmsgdiBjbGFuZyku
IEFsc28sIGlmCnBvc3NpYmxlLCBjb3VsZCBib3RoIHBhdGNoZXMgaGF2ZSB0aGUgc2FtZSBwcmVm
aXg/ICh4ODYvY2xhbmcpCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
