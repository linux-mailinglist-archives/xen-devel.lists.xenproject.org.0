Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4226B43DB6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 15:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110232.1459499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAMO-00007w-Ek; Thu, 04 Sep 2025 13:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110232.1459499; Thu, 04 Sep 2025 13:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuAMO-00005y-Bd; Thu, 04 Sep 2025 13:50:44 +0000
Received: by outflank-mailman (input) for mailman id 1110232;
 Thu, 04 Sep 2025 13:50:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uuAMN-00005r-4E
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 13:50:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uuAML-006HO8-3D;
 Thu, 04 Sep 2025 13:50:42 +0000
Received: from [2a01:cb15:80df:da00:d2b0:117d:791c:30c0] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uuAML-00FhpW-1x;
 Thu, 04 Sep 2025 13:50:41 +0000
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
	bh=PJHhQ3H+JmhApB2mrrcegAdSDYOEPR9jp4epF8Fwyrc=; b=seTSi5vVo+NK7DKlhNRn8QjLXP
	tGVfx5K2TFBzWihR5wYvLU7RyWmYgrvvhChcXiKog3Ds9FmZtxLc9yJ+iupP/WW6lxzl/s+LUBF9M
	SXvsD0ry8Uf2SmfZDlEo0kjDnDrCgqt8F706QPYBQvTBPTXkQgIZazRWtDFtuvqnDbB4=;
Date: Thu, 4 Sep 2025 15:50:38 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v17 3/4] tools/tests: introduce unit tests for domain ID
 allocator
Message-ID: <aLmZLm2_G48yfPWR@l14>
References: <20250829232132.3460081-1-dmukhin@ford.com>
 <20250829232132.3460081-4-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829232132.3460081-4-dmukhin@ford.com>

On Fri, Aug 29, 2025 at 04:21:31PM -0700, dmukhin@xen.org wrote:
> diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> new file mode 100644
> index 000000000000..22f1f15d11db
> --- /dev/null
> +++ b/tools/tests/domid/Makefile
> +# NB: $1 cannot be a list

Why not? It would be the same as writing the rule multiple time for
different targets.

Is about my comment on "prerequisite" on v16? In this rule, "harness.h"
is a prerequisite.

> +define emit-harness-nested-rule
> +$(1): $(CURDIR)/harness.h
> +	mkdir -p $$(@D);
> +	ln -sf $$< $$@;
> +
> +endef
> diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
> new file mode 100644
> index 000000000000..5915c4699a5c
> --- /dev/null
> +++ b/tools/tests/domid/test-domid.c
> +
> +#include <sysexits.h>
> +
> +#include "harness.h"
> +
> +#define verify(exp, fmt, args...) \
> +while (!(exp)) { \
> +    printf(fmt, ## args); \
> +    exit(EX_SOFTWARE); \

We never used any of "EX_*" macro, or even <sysexits.h>. I'm not sure
it's a good idea to introduce such use where exit(1) would have been
more than enough but sysexits.h seems to be available on BSD so it's
probably fine. It would be nice to change that to exit(1) and remove
sysexits.h.

Anyway, patch looks good enough so:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

