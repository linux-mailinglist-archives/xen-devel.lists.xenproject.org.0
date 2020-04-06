Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617C619F1FD
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 11:03:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLNep-0006of-Dv; Mon, 06 Apr 2020 09:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lhp/=5W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jLNeo-0006oa-4z
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 09:03:02 +0000
X-Inumbo-ID: 6a91bb4a-77e5-11ea-bfdb-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a91bb4a-77e5-11ea-bfdb-12813bfff9fa;
 Mon, 06 Apr 2020 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586163781;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7NHbB9BsfudNyev+nKE/1EJEWNA2WPr4keczYxzGBKc=;
 b=RbKVbDRAYuhvAYeNQMWxKjcAktSPJR+aq9K8XeflwCq1zlw2E+rKqgNq
 QfmiFOkJrZexDvEVCbWqOrPjFBjrFQMIzzLLlQ15N/Cd/TZjkii3+jcW1
 V1XC7VX63PBojEukve4rehiDl88jWJF/iJ3NnHZ5MB7Pm+vZiSFdZkIoF A=;
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
IronPort-SDR: sfPgwiT0RDqtOpIx8BpsOCGBpAYrEzJ8byAffdFSgPLT9oxrM1pLGxV1YpTJCLmm+D5/KjNwTc
 4UshXQsueyUHBq1QxYi9jubJ5prBv2AV1sK3XdnCfpQ5nvwcoAgTHamzh1kzvb9Msqal7Yq7ju
 qkhW17FkqJq6jUNmkeLMrG3DrtG4VCWd4pl8ZCS6WZTcR9wCZPK+yuKDj30clW5wGNYiAOrJNF
 kaoORMq+5pf6CxfxkMZjiwGVrinU52Ub1BjdqlJR6wPq5FyizUbdSQa9w4AHuCK67Qe5lhHDdp
 LIU=
X-SBRS: 2.7
X-MesageID: 15445372
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15445372"
Date: Mon, 6 Apr 2020 11:02:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/blkfront: fix memory allocation flags in
 blkfront_setup_indirect()
Message-ID: <20200406090250.GX28601@Air-de-Roger>
References: <20200403090034.8753-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200403090034.8753-1-jgross@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 03, 2020 at 11:00:34AM +0200, Juergen Gross wrote:
> Commit 1d5c76e664333 ("xen-blkfront: switch kcalloc to kvcalloc for
> large array allocation") didn't fix the issue it was meant to, as the
> flags for allocating the memory are GFP_NOIO, which will lead the
> memory allocation falling back to kmalloc().
> 
> So instead of GFP_NOIO use GFP_KERNEL and do all the memory allocation
> in blkfront_setup_indirect() in a memalloc_noio_{save,restore} section.
> 
> Fixes: 1d5c76e664333 ("xen-blkfront: switch kcalloc to kvcalloc for large array allocation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

