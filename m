Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE54192D88
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 16:55:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH8Kv-0007LN-CF; Wed, 25 Mar 2020 15:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lu4h=5K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jH8Ku-0007LI-GC
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:52:56 +0000
X-Inumbo-ID: b10ac8e8-6eb0-11ea-864b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b10ac8e8-6eb0-11ea-864b-12813bfff9fa;
 Wed, 25 Mar 2020 15:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585151575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DwgBsCH7AUADIEFg38UN6CQRQ4RcWO45tVZBzCoJRpQ=;
 b=M0XrwlSZ3hKv62YZs00SC6D+jmcnpBEsCE9kHaJxvfVXcHdbynyVy788
 qCgmvBzoYUIn1unoverHU4ilvzD6y18B4jBQarKl/C+V1SFU+QDA0rYVA
 sRoMd3xTaP0RNRcHj68cVc5GTwxuOJiJyTUtXj3Y+HOnvads2nJwaDXds 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: om8msj9X3J1yeyXfDgmztXon40wo6JDNkwY+HcwwP9Zr1XyYo8d0YONc4nsz4T3fcmNaTbA0ko
 55Mq2JDUvb0Ft+lSdIQPaqP00evE7eDa7BzCi8ufFcBI9q8GzBR9lg+p7132Hnt8heB+vnwtfE
 FjBi4/EZKDbnU+8/uM7vjjOnr9/nidkMtHsMp/GC0iTpMYzKLS9anbPtRfjQdSh0HDjFId1ZpT
 TMw+De/p3D7PMpUXnRLGCoz0zXeecDLRCgL2XLkQr1bsMptA9/fBjcNubxIxJfjWEarAgwHD0d
 jKM=
X-SBRS: 2.7
X-MesageID: 15027811
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,304,1580792400"; d="scan'208";a="15027811"
Date: Wed, 25 Mar 2020 16:52:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Message-ID: <20200325155247.GE28601@Air-de-Roger>
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <46457bd6e877abe12a8c005c23f0f1aab13afd24.1584981438.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46457bd6e877abe12a8c005c23f0f1aab13afd24.1584981438.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v12 2/3] x86/mem_sharing: reset a fork
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 23, 2020 at 10:04:36AM -0700, Tamas K Lengyel wrote:
> Implement hypercall that allows a fork to shed all memory that got allocated
> for it during its execution and re-load its vCPU context from the parent VM.
> This allows the forked VM to reset into the same state the parent VM is in a
> faster way then creating a new fork would be. Measurements show about a 2x
> speedup during normal fuzzing operations. Performance may vary depending how
> much memory got allocated for the forked VM. If it has been completely
> deduplicated from the parent VM then creating a new fork would likely be more
> performant.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

One minor nit below.

> ---
> v12: remove continuation & add comment back
>      address style issues pointed out by Jan
> ---
>  xen/arch/x86/mm/mem_sharing.c | 77 +++++++++++++++++++++++++++++++++++
>  xen/include/public/memory.h   |  1 +
>  2 files changed, 78 insertions(+)
> 
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 23deeddff2..930a5f58ef 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1775,6 +1775,60 @@ static int fork(struct domain *cd, struct domain *d)
>      return rc;
>  }
>  
> +/*
> + * The fork reset operation is intended to be used on short-lived forks only.
> + * There is no hypercall continuation operation implemented for this reason.
> + * For forks that obtain a larger memory footprint it is likely going to be
> + * more performant to create a new fork instead of resetting an existing one.
> + *
> + * TODO: In case this hypercall would become useful on forks with larger memory
> + * footprints the hypercall continuation should be implemented (or if this
> + * feature needs to be become "stable").
> + */
> +static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
> +{
> +    int rc;
> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    struct page_info *page, *tmp;
> +
> +    spin_lock(&d->page_alloc_lock);
> +    domain_pause(d);
> +
> +    page_list_for_each_safe(page, tmp, &d->page_list)
> +    {
> +        p2m_type_t p2mt;
> +        p2m_access_t p2ma;
> +        mfn_t mfn = page_to_mfn(page);
> +        gfn_t gfn = mfn_to_gfn(d, mfn);
> +
> +        mfn = __get_gfn_type_access(p2m, gfn_x(gfn), &p2mt, &p2ma,
> +                                    0, NULL, false);
> +
> +        /* only reset pages that are sharable */
> +        if ( !p2m_is_sharable(p2mt) )
> +            continue;
> +
> +        /* take an extra reference or just skip if can't for whatever reason */
> +        if ( !get_page(page, d) )
> +            continue;

You can join both conditions above into a single one, if both just
need to perform a continue.

Thanks, Roger.

