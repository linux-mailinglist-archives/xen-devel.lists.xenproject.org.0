Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC1CB1907
	for <lists+xen-devel@lfdr.de>; Wed, 10 Dec 2025 02:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182470.1505337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8dN-0006cj-Ix; Wed, 10 Dec 2025 01:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182470.1505337; Wed, 10 Dec 2025 01:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT8dN-0006b8-FC; Wed, 10 Dec 2025 01:04:49 +0000
Received: by outflank-mailman (input) for mailman id 1182470;
 Wed, 10 Dec 2025 01:04:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8oeO=6Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vT8dM-0006b2-4O
 for xen-devel@lists.xenproject.org; Wed, 10 Dec 2025 01:04:48 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3791a481-d564-11f0-b15b-2bf370ae4941;
 Wed, 10 Dec 2025 02:04:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CE65660129;
 Wed, 10 Dec 2025 01:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5665CC4CEF5;
 Wed, 10 Dec 2025 01:04:43 +0000 (UTC)
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
X-Inumbo-ID: 3791a481-d564-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765328684;
	bh=FLCoESsDvUcfNYgbhJE+32xjdx8w9pQv9O0VV0vuu5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dnyf1eNfq5SyypnerN2yr/CfQEDIII5GOP88FPDMK62bwBJjDtxcT0JMQA9+jf+rj
	 VZEnSpFs6Vfxt39Au5snOZH6DnugeMtYwvpwdd7cpS+AvkwH6I4G/Ld1QwHodiPQRY
	 44zNXYTePUWxWJX3FhfrspQR6hFgxRtVEsUgbWca4x7bAhja2i0ouso99UXOlL8/zk
	 XR3MDFRpBjVc0cX+AOeHV/HoYJ9UXo38bszyA/B+3DOV6Dm/Lmxer25VTEtI9rJTIl
	 DA3vgeHZLSO6riVy36i2s6WLxCQXWaQLlbNbmkCPRAKShVNipkjbgT1XfJak2DwW70
	 E/adMiECa2sDw==
Date: Tue, 9 Dec 2025 17:04:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v3] xen/domain: introduce DOMID_ANY
In-Reply-To: <20250924030630.122229-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2512091704020.19429@ubuntu-linux-20-04-desktop>
References: <20250924030630.122229-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add a new symbol DOMID_ANY aliasing DOMID_INVALID to improve the readability
> of the code.
> 
> Update all relevant domid_alloc() call sites.
> 
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes since v2:
> - move DOMID_ANY back to the public header; add proper guards
> - CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2056319227
> - Link to v2: https://lore.kernel.org/xen-devel/20250920174732.1207847-2-dmukhin@ford.com/
> ---
>  tools/tests/domid/harness.h             |  1 +
>  tools/tests/domid/test-domid.c          | 12 ++++++------
>  xen/common/device-tree/dom0less-build.c |  2 +-
>  xen/common/domctl.c                     |  2 +-
>  xen/common/domid.c                      |  2 +-
>  xen/include/public/xen.h                |  5 +++++
>  6 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/tests/domid/harness.h b/tools/tests/domid/harness.h
> index 17eb22a9a854..610b564d4061 100644
> --- a/tools/tests/domid/harness.h
> +++ b/tools/tests/domid/harness.h
> @@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
>  
>  #define DOMID_FIRST_RESERVED            (100)
>  #define DOMID_INVALID                   (101)
> +#define DOMID_ANY                       DOMID_INVALID
>  
>  #endif /* _TEST_HARNESS_ */
>  
> diff --git a/tools/tests/domid/test-domid.c b/tools/tests/domid/test-domid.c
> index 5915c4699a5c..71cc4e7fd86d 100644
> --- a/tools/tests/domid/test-domid.c
> +++ b/tools/tests/domid/test-domid.c
> @@ -41,20 +41,20 @@ int main(int argc, char **argv)
>          domid_free(expected);
>  
>      /*
> -     * Test that that two consecutive calls of domid_alloc(DOMID_INVALID)
> +     * Test that that two consecutive calls of domid_alloc(DOMID_ANY)
>       * will never return the same ID.
>       * NB: ID#0 is reserved and shall not be allocated by
> -     * domid_alloc(DOMID_INVALID).
> +     * domid_alloc(DOMID_ANY).
>       */
>      for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
>      {
> -        allocated = domid_alloc(DOMID_INVALID);
> +        allocated = domid_alloc(DOMID_ANY);
>          verify(allocated == expected,
>                 "TEST 3: expected %u allocated %u\n", expected, allocated);
>      }
>      for ( expected = 1; expected < DOMID_FIRST_RESERVED; expected++ )
>      {
> -        allocated = domid_alloc(DOMID_INVALID);
> +        allocated = domid_alloc(DOMID_ANY);
>          verify(allocated == DOMID_INVALID,
>                 "TEST 4: expected %u allocated %u\n", DOMID_INVALID, allocated);
>      }
> @@ -64,7 +64,7 @@ int main(int argc, char **argv)
>          domid_free(expected);
>      for ( expected = 1; expected < DOMID_FIRST_RESERVED / 2; expected++ )
>      {
> -        allocated = domid_alloc(DOMID_INVALID);
> +        allocated = domid_alloc(DOMID_ANY);
>          verify(allocated == expected,
>                 "TEST 5: expected %u allocated %u\n", expected, allocated);
>      }
> @@ -72,7 +72,7 @@ int main(int argc, char **argv)
>      /* Re-allocate last ID from [1..DOMID_FIRST_RESERVED - 1]. */
>      expected = DOMID_FIRST_RESERVED - 1;
>      domid_free(DOMID_FIRST_RESERVED - 1);
> -    allocated = domid_alloc(DOMID_INVALID);
> +    allocated = domid_alloc(DOMID_ANY);
>      verify(allocated == expected,
>             "TEST 6: expected %u allocated %u\n", expected, allocated);
>  
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 9fd004c42af7..e2764768c983 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -848,7 +848,7 @@ void __init create_domUs(void)
>          if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>              panic("No more domain IDs available\n");
>  
> -        domid = domid_alloc(DOMID_INVALID);
> +        domid = domid_alloc(DOMID_ANY);
>          if ( domid == DOMID_INVALID )
>              panic("Error allocating ID for domain %s\n", dt_node_name(node));
>  
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 954d79022645..ca91686a03d8 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -410,7 +410,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>      case XEN_DOMCTL_createdomain:
>      {
>          /* NB: ID#0 is reserved, find the first suitable ID instead. */
> -        domid_t domid = domid_alloc(op->domain ?: DOMID_INVALID);
> +        domid_t domid = domid_alloc(op->domain ?: DOMID_ANY);
>  
>          if ( domid == DOMID_INVALID )
>          {
> diff --git a/xen/common/domid.c b/xen/common/domid.c
> index 2387ddb08300..76b7f3e7ae6e 100644
> --- a/xen/common/domid.c
> +++ b/xen/common/domid.c
> @@ -19,7 +19,7 @@ static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
>   * @param domid Domain ID hint:
>   * - If an explicit domain ID is provided, verify its availability and use it
>   *   if ID is not used;
> - * - If DOMID_INVALID is provided, search [1..DOMID_FIRST_RESERVED-1] range,
> + * - If DOMID_ANY is provided, search [1..DOMID_FIRST_RESERVED-1] range,
>   *   starting from the last used ID. Implementation guarantees that two
>   *   consecutive calls will never return the same ID. ID#0 is reserved for
>   *   the first boot domain (currently, dom0) and excluded from the allocation
> diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> index 82b9c05a76b7..29b7c81ba1bb 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -608,6 +608,11 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>  /* DOMID_INVALID is used to identify pages with unknown owner. */
>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>  
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
> +#define DOMID_ANY            DOMID_INVALID
> +#endif
> +
>  /* Idle domain. */
>  #define DOMID_IDLE           xen_mk_uint(0x7FFF)
>  
> -- 
> 2.51.0
> 

