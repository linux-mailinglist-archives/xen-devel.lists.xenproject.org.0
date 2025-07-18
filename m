Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50446B099D1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 04:32:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047794.1418175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucatt-0002PL-EC; Fri, 18 Jul 2025 02:32:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047794.1418175; Fri, 18 Jul 2025 02:32:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucatt-0002Lx-Af; Fri, 18 Jul 2025 02:32:41 +0000
Received: by outflank-mailman (input) for mailman id 1047794;
 Fri, 18 Jul 2025 02:32:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucatr-0001bv-VC
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 02:32:39 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 782a20dc-637f-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 04:32:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A22AA5744F;
 Fri, 18 Jul 2025 02:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC5BC4CEE3;
 Fri, 18 Jul 2025 02:32:36 +0000 (UTC)
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
X-Inumbo-ID: 782a20dc-637f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752805956;
	bh=YiH6ONk0Z8Raz2jrn8baX4waqxoVieSKtFG22iIDJH0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z6Au4rzLYA75fvSidQlPMJKgZzvmmnIEMnbnl8pc+oSs8L1XMMOFwvocx9te4QDle
	 0TtLiwDMnUVlXXjuFgsFVYmrSuqTlZtteh1hnwY4TSs6YSf9QbqXXtSHfoiDh6IjtN
	 r2KJeqCEIr0AXBwD6I3qx5LOddqKFPqeJGklx7QUl/BN+f7hyz4VyuZVhU0XXWmh2E
	 xqu5DfPcU5mgL0VhgZZqv+dK5nlW9DUprjT2DBbJgEBeNWuZSb2GpiDDcJjnFdUGbw
	 TXKA8x+xyQzqZprsymt6PUwkEnQ+TBHD377Uh/kDTrDTvbsytY6wFrZOP5qgm5BzML
	 K7cfCTOK184wg==
Date: Thu, 17 Jul 2025 19:32:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v2 16/17] tools/init-dom0less: Configure already-introduced
 domains
In-Reply-To: <20250716211504.291104-17-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171928110.15546@ubuntu-linux-20-04-desktop>
References: <20250716211504.291104-1-jason.andryuk@amd.com> <20250716211504.291104-17-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Jason Andryuk wrote:
> With xenstore automatically introducing domains at startup, the
> xs_is_domain_introduced() check is no longer accurate.

We can still use xs_is_domain_introduced() to skip configure_xenstore?


> Instead, process
> all domains and introduce non-introduced domains.  This writes the
> xenstore entries and xl configuration for xenstore-enhanced domains as
> those entries are still useful with an already-introduced domain.

This is OK but to protect against mistakes such as calling init-dom0less
twice, we could simply check if one of the mandatory xenstore entries
is already present, and if so return early from create_xenstore.


> Non-xenstore domains are still skipped.
> 
> While at it, remove domain_exists() which is just a simple wrapper.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  tools/helpers/init-dom0less.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
> index 6ae7cf2e7e..4336e0f418 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -324,16 +324,14 @@ static int init_domain(struct xs_handle *xsh,
>      if (rc)
>          err(1, "writing to xenstore");
>  
> -    rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
> -    if (!rc)
> -        err(1, "xs_introduce_domain");
> -    return 0;
> -}
> +    if (!xs_is_domain_introduced(xsh, info->domid)) {
> +        rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn,
> +                                 xenstore_evtchn);
> +        if (!rc)
> +            err(1, "xs_introduce_domain");
> +    }
>  
> -/* Check if domain has been configured in XS */
> -static bool domain_exists(struct xs_handle *xsh, int domid)
> -{
> -    return xs_is_domain_introduced(xsh, domid);
> +    return 0;
>  }
>  
>  int main(int argc, char **argv)
> @@ -376,14 +374,10 @@ int main(int argc, char **argv)
>              continue;
>  
>          printf("Checking domid: %u\n", domid);
> -        if (!domain_exists(xsh, domid)) {
> -            rc = init_domain(xsh, xch, xfh, &info[i]);
> -            if (rc < 0) {
> -                fprintf(stderr, "init_domain failed.\n");
> -                goto out;
> -            }
> -        } else {
> -            printf("Domain %u has already been initialized\n", domid);
> +        rc = init_domain(xsh, xch, xfh, &info[i]);
> +        if (rc < 0) {
> +            fprintf(stderr, "init_domain failed.\n");
> +            goto out;
>          }
>      }
>  out:
> -- 
> 2.50.0
> 
> 

