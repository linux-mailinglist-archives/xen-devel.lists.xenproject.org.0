Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C458C4B39
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:18:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbeo-0003Jh-8Z; Wed, 02 Oct 2019 10:14:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xXQL=X3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFbem-0003Jc-Fc
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:14:52 +0000
X-Inumbo-ID: 7848e96e-e4fd-11e9-9712-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 7848e96e-e4fd-11e9-9712-12813bfff9fa;
 Wed, 02 Oct 2019 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570011292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/7XwJicWxf2779ZInP9ioHLsEov/rMyX+bTzV5r/OnU=;
 b=Wg8+TpW17mLdq7dOhjAwMCwgi43NOwbfM3mI8MQbaeC9VsB22FI919f2
 hhUNqv/Ktfd+DTPFkmOQksighmdPap+s/q05Uv0e4MftWm0+rc48TUY8F
 n13KIM++ojt+Iex0ghE+BncV/s6fP8r3EWXLqdyLTgJzIueykmQdDjiV2 k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: B1FP82QirFbQU7u9q3rylD3nmnZ230dIQssoHdo0sibtfllFCLaBImG1a4gL767DfdvxLKyfvZ
 4ELHLh9QAyIwGmqGXFKmHRe5xjJbJl5j1ujaM9veeBSTbj7v8jRPXluYLZ9iBpZa4/BrSKXx16
 PjyMuzcQ/Nnsiaik9oHqVBbBGem3lMJc79ylbgryMXeiF+hg9T9sHTGlMhrSAkbQMIg4enmfHi
 ImuWz22KjFWRKQdcVHFByL5tsqU1Lzdjufonqasm3nMcAKKsG9Ye31sCKbN8Drwih9qQqTjgf9
 KHE=
X-SBRS: 2.7
X-MesageID: 6427109
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,574,1559534400"; 
   d="scan'208";a="6427109"
Date: Wed, 2 Oct 2019 12:14:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191002101433.f7565dqdcu6kaspz@Air-de-Roger>
References: <87c597a3-d7f0-bd20-4c43-afd5ec919be3@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87c597a3-d7f0-bd20-4c43-afd5ec919be3@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] IOMMU: add missing HVM check
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMTI6MTA6MDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRml4IGFuIHVuZ3VhcmRlZCBkLT5hcmNoLmh2bSBhY2Nlc3MgaW4gYXNzaWduX2Rldmlj
ZSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkkn
bSBhbHNvIGFkZGluZyBKdWVyZ2VuIGFzIEkgdGhpbmsgdGhpcyBpcyBzdWl0YWJsZSBmb3IgNC4x
My4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
