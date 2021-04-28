Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087BB36DCDD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 18:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119474.225967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbmur-0006pZ-7S; Wed, 28 Apr 2021 16:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119474.225967; Wed, 28 Apr 2021 16:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbmur-0006pA-4A; Wed, 28 Apr 2021 16:19:57 +0000
Received: by outflank-mailman (input) for mailman id 119474;
 Wed, 28 Apr 2021 16:19:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1fc=JZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lbmup-0006p5-Q8
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 16:19:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58e4627c-8d69-4064-9496-80e293909010;
 Wed, 28 Apr 2021 16:19:54 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 58e4627c-8d69-4064-9496-80e293909010
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619626794;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=awQiHHh7o4kNgACH03sYnlx/j6evZ4mcTWvR9z5m6wA=;
  b=Z0JGY58ePHmHt4aw3mL6bqVbsxmGlVf762zOLf9PlvXXUSKBl//AoOjH
   bsqaVtiTORMPMIOmxE4HdjEzA334G6Gv1kUBNRX8DilAvA9zuvHNXcXSB
   +6p7+xsI2zTWkKrZ8D7MZxT8GMaOor9EEp9TKp/m0HMEvrH8C5KIWtdVn
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ue+jQdC6130Paog5bfm6Im+/tDkchCcOnM8EUptCulEHyQ0NDeoRyyWA6qIYBjGROZX8oYkrGK
 7rs9rPKKRkdgb433K45GA8URa6Q9A/09S1AhhwQY3Jm02F+mcRayEdmm5M95xHh28fg2fgc2FR
 9mGw/HDzQ1cnsCdETkVM3xYgstR2EpVofRv8NMSU3Fpw56QTz+Y3h0Tavv2w6rbCf/3vrwDfwc
 rTbVrgq2njcXKUeenL7XE7G0Sz6zy250+GA/JjwQh1gMwJLElBrnlAed21PpXogaG8R6Fmu8wz
 XqQ=
X-SBRS: 5.1
X-MesageID: 43011809
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fFsx+6zAmPR9uzfeHmI8KrPw5b1zdoIgy1knxilNYDZSddGVkN
 3roeQD2XbP+VQscVwphNzoAse9aFzG85od2+gsFJekGDLroW65aLxlhLGP/xTFOwnTstFQzr
 1hda8WMrLNJHx3l9zz7gX9M/tI+rm62Zulj+vf0HthJDsCA8pdxjx0EwOKVnBxLTMtObMCCJ
 Ge6sBbzgDQGkg/U8LTPBQ4Y9Q=
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="43011809"
Date: Wed, 28 Apr 2021 17:19:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 20/21] libs/{light,guest}: implement
 xc_cpuid_apply_policy in libxl
Message-ID: <YImLJmwTX2E7waOr@perard>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-21-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210413140140.73690-21-roger.pau@citrix.com>

On Tue, Apr 13, 2021 at 04:01:38PM +0200, Roger Pau Monne wrote:
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> index 539fc4869e6..cadc8b2a05e 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -436,6 +438,42 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
>       */
>      bool nested_virt = info->nested_hvm.val > 0;
>  
> +    policy = xc_cpu_policy_init();
> +    if (!policy) {
> +        LOGE(ERROR, "Failed to init CPU policy");
> +        rc = ERROR_FAIL;
> +        goto out;
> +    }
> +
> +    rc = xc_cpu_policy_get_domain(ctx->xch, domid, policy);

libxc return values should be stored in 'r'.

> +    if (rc) {
> +        LOGE(ERROR, "Failed to fetch domain %u CPU policy", domid);

It's probably better to use LOGED(ERROR, domid, ...)  to log the domid.
libvirt might be able to use that domid information, but I'm not sure
about that. At least, using LOG*D macros would make logging the domid
consistent with the rest of libxl.

Also use the LOG*D variant for other LOG*, to record the domid
every time.

> +        rc = ERROR_FAIL;
> +        goto out;
> +    }
> +
> +    /*
> +     * Account for feature which have been disabled by default since Xen 4.13,

Why the 's' from "features" has been removed? Also, if it must be
removed then I'm pretty sure that we should also change "have been"
to "has been".


Thanks,

-- 
Anthony PERARD

