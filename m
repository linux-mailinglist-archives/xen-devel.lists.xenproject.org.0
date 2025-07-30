Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C7B1648B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 18:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064225.1429944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9Yi-0002qm-V6; Wed, 30 Jul 2025 16:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064225.1429944; Wed, 30 Jul 2025 16:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh9Yi-0002oL-SO; Wed, 30 Jul 2025 16:21:40 +0000
Received: by outflank-mailman (input) for mailman id 1064225;
 Wed, 30 Jul 2025 16:21:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uh9Yh-0002oF-48
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 16:21:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh9Yf-009EQo-2T;
 Wed, 30 Jul 2025 16:21:37 +0000
Received: from [2a01:cb15:80df:da00:4c1a:a750:6210:2b8] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uh9Yf-00H4k7-0x;
 Wed, 30 Jul 2025 16:21:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=dglFxj8kzyyTt6XhTrXLxjOjX4km1s2fqcL0nSkyIvE=; b=MNcRB0pTjkxU0gfMd68LQ0IPOj
	4XmZ4NalgZDEjzOQBlplvjx6hQihSAelNpwZxgIqEYygulwLYi6AZktPp3URmRKK4fN49hZex2gVQ
	FVrVk+tRir7ggxUNgz9O+zajRVq48g59jhq+LhhstfXsRBwGYb7ZC5k85lfUpVgKYgP8=;
Date: Wed, 30 Jul 2025 18:21:35 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 7/7] tools: allow to limit xenstore features via guest
 config
Message-ID: <aIpGjxj2vyMwUTBi@l14>
References: <20250725131928.19286-1-jgross@suse.com>
 <20250725131928.19286-8-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725131928.19286-8-jgross@suse.com>

On Fri, Jul 25, 2025 at 03:19:28PM +0200, Juergen Gross wrote:
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index a61085ca3b..2a7923533f 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -494,6 +494,18 @@ retry_transaction:
>      if (!xs_transaction_end(ctx->xsh, t, 0))
>          if (errno == EAGAIN)
>              goto retry_transaction;
> +
> +    if (info->xenstore_feature_mask != ~0U) {
> +        unsigned int features;
> +
> +        if (xs_get_features_supported(ctx->xsh, &features) &&
> +            !xs_set_features_domain(ctx->xsh, domid,
> +                                    features & info->xenstore_feature_mask)) {
> +            LOG(ERROR, "Failed to set Xenstore features");

Surly xs_{get,set}* set errno on failure, and we know the domid, can you
use LOGED for the error message?

> +            return ERROR_FAIL;

Unfortunately, this function does an allocation that isn't collected in
GC, `vm_path` is leaked. Could you replace that by `rc=ERROR_FAIL; goto
out;`, then place out: at the right place and return `rc` at the end of
the function?

> +        }
> +    }
> +
>      xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port);
>      free(vm_path);
>      return 0;

Thanks,

-- 
Anthony PERARD

