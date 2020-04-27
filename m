Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7991B981B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 09:04:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSxnf-0007a2-Tf; Mon, 27 Apr 2020 07:03:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jSxnd-0007Zx-Tz
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 07:03:29 +0000
X-Inumbo-ID: 324b6cb0-8855-11ea-ae69-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 324b6cb0-8855-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 07:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587971008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BN3wGjAuN8c6DF9G6lxWdWTjyeenKN9BrohQiVa706k=;
 b=gnNrF8BOYMSKJfITc9OwDPqscKju3TrJ9DsPIsyKS0xdaPnVUU4Lt7em
 LqeBiO6pQmhpwCTpnH/GsDZT39vBgvNAlphYG1UynL2k2Bz/pphNpiqSx
 UfpGxnn1lkqLPFOZAS5JXTJkG3qIQ/ghH6zwSj1runOAC09au79zqMLVP I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KKixjztdLUHt7/4mGwYZ2EU00Qdufx4HQ47+20+ml1fDoCHHlUPCXXEq0jMErO1/nz3itTOtCU
 AIxgpdxXav6fezM2D/eVXBhdTKhNDrNi1EuCZCoMSxd3mxcPLFlXeJsss60LZ9TMk78cqMPpYI
 doJKdTj9mawzSCfytBrCNvR0mjt6f6l/aGbgUu/sbJsL4MePH9MP8jTmHzJyHVpfB8XV1sRDkT
 m64F8/ga+gT3OmHkk6OeR2HVlr0ku5zUmYUZE6T9XeuCC7eay/OfqOXCw8WWF2a84AYhLfhqql
 uOc=
X-SBRS: 2.7
X-MesageID: 16969369
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,323,1583211600"; d="scan'208";a="16969369"
Date: Mon, 27 Apr 2020 09:03:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Subject: Re: Xen network domain performance for 10Gb NIC
Message-ID: <20200427070317.GL28601@Air-de-Roger>
References: <1359850718.562651.1587928713792.ref@mail.yahoo.com>
 <1359850718.562651.1587928713792@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1359850718.562651.1587928713792@mail.yahoo.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Apr 26, 2020 at 07:18:33PM +0000, tosher 1 wrote:
>  Hi everyone,
> 
> Lately, I have been experimenting with 10Gb NIC performance on Xen domains. I have found that network performance is very poor for PV networking when a driver domain is used as a network backend.
> 
> My experimental setup is I have two machines connected by the 10Gb network: a server running the Xen hypervisor and a desktop machine working as a client. I have Ubuntu 18.04.3 LTS running on the Dom0, Domus, Driver Domain, and client desktop, where the Xen version is 4.9. I measured the network bandwidth using iPerf3.
> 
> The network bandwidth between a DomU using Dom0 as backend and the client desktop is like 9.39Gbits/sec. However, when I use a network driver domain, which has the 10Gb NIC by PCI pass through, the bandwidth between the DomU and the client desktop is like 2.41Gbit/sec is one direction and 4.48Gbits/sec in another direction. Here, by direction, I mean the client-server direction for iPerf3.
> 
> These results indicate a huge performance degradation, which is unexpected. I am wondering if I am missing any key points here which I should have taken care of or if there is any tweak that I can apply.

Driver domains with passthrough devices need to perform IOMMU
operations in order to add/remove page table entries when doing grant
maps (ie: IOMMU TLB flushes), while dom0 doesn't need to because it
has the whole RAM identity mapped in the IOMMU tables. Depending on
how fast your IOMMU is and what capabilities it has doing such
operations can introduce a significant amount of overhead.

I would give a try to a newer version of Xen also, there have been
some changes in IOMMU management, but I would guess your bottleneck
doesn't come from the code itself, but rather from the IOMMU.

Roger.

