Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B8A1BD6D9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:08:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jThlo-0000Cw-5c; Wed, 29 Apr 2020 08:08:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUw1=6N=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jThln-0000Co-6r
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:08:39 +0000
X-Inumbo-ID: a141fc14-89f0-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a141fc14-89f0-11ea-b07b-bc764e2007e4;
 Wed, 29 Apr 2020 08:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588147719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SvqjqrMYBeAWdvlE9uFbwfuApkwoz+pxaUFqhR/+AoA=;
 b=KcLtX1tRC/kTzz7KR9Vof3r8xWtATbx70RKjV/AZUEfuDhRoSHq6C5PP
 a6UiUD5/pbHlDiNfAXAKgbp14DplkDLJ7ZJhb4SinX19Zh7htiLYbLAtt
 wPdriXa0kmRnc6BvketpYU0Eu7DtnBSk/UnbGmqig1Hg/rOtjek1CVsv3 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: v+W0FvZPDADtrtRFyvHbab+JiVV7fLX9G3uXuDTHaxcIc25z7eq8h3OottxwssSEcZTrdaTqQ8
 ZhVpsDmPm7UBG83APn4+G4HkINBNvID4TCPHPcHmM0q5V0l6m54ks/MKTBZYC7xAtUGtb0wt/+
 UVTwUeDKCmixs4MteQnWjJAzaaJl73IFSGW2xX8mCWQBvWNs9B4x7CVNYioN2q+EMiFdfbekuT
 Vzjbuhnw/OrzpcWXxboy3QrptaISwW9Z5OW1OpZ3VnpTIuNAiLUliw8lq2OW3X1uNZDe3WsOik
 KIE=
X-SBRS: 2.7
X-MesageID: 16406208
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,330,1583211600"; d="scan'208";a="16406208"
Date: Wed, 29 Apr 2020 10:08:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v2] mem_sharing: map shared_info page to same gfn during
 fork
Message-ID: <20200429080826.GW28601@Air-de-Roger>
References: <6497e71a791bbc17b1ace3f5f260bd61275b76ba.1588087596.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6497e71a791bbc17b1ace3f5f260bd61275b76ba.1588087596.git.tamas.lengyel@intel.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 08:29:00AM -0700, Tamas K Lengyel wrote:
> During a VM fork we copy the shared_info page; however, we also need to ensure
> that the page is mapped into the same GFN in the fork as its in the parent.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> Suggested-by: Roger Pau Monne <roger.pau@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

