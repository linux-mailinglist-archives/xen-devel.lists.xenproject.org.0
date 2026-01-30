Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOvkMW/9e2lEJwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 01:38:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59560B5F6F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 01:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217147.1526960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlcW6-0005oc-BE; Fri, 30 Jan 2026 00:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217147.1526960; Fri, 30 Jan 2026 00:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlcW6-0005lm-7n; Fri, 30 Jan 2026 00:37:42 +0000
Received: by outflank-mailman (input) for mailman id 1217147;
 Fri, 30 Jan 2026 00:37:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+hK=AD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vlcW4-0005lg-Vp
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 00:37:40 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e065cda9-fd73-11f0-b160-2bf370ae4941;
 Fri, 30 Jan 2026 01:37:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F24556001A;
 Fri, 30 Jan 2026 00:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8C4C16AAE;
 Fri, 30 Jan 2026 00:37:35 +0000 (UTC)
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
X-Inumbo-ID: e065cda9-fd73-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769733456;
	bh=i0keCIhFda6evaNyBPFwQYFrGOnQMP6B8Lxs5pCR4fE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ul992zkoV82eQRq/lmxNRfzCu1VDbDPUryinRwaRPoEgMMulEBR3kBbSbvmiFWqtr
	 VqCl+6/f6qvqHWSTk8V2Wa2jgXvRURFHsfuQT7x10FXEpr98K3yevDUsYbmFIXSEls
	 yPyGeavpQr6tDCZG/oILANa0zi4VYkuI8xzme5fjutbP+gU5u97Kckm7e2FAuMwaGL
	 hG6eWt614TzIVhLUflAQXN8l8a7TP/PKnNN89X8tUCa/S5i8cgf57MHFLUAGGqZVnM
	 G1MF7fWma740+VN/2Qit2vO+T2X7ETWew7DQdwK4JD6/NUobUxUPXCCVRZ110qlVPT
	 rXEN+/g5bp2/A==
Date: Thu, 29 Jan 2026 16:37:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v4] xen/domain: introduce DOMID_ANY
In-Reply-To: <20260109140747.195460-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601291635070.2238666@ubuntu-linux-20-04-desktop>
References: <20260109140747.195460-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 59560B5F6F
X-Rspamd-Action: no action

On Fri, 9 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add a new symbol DOMID_ANY to improve the readability of the code.
> 
> Update all relevant domid_alloc() call sites.
> 
> Amends: 2d5065060710 ("xen/domain: unify domain ID allocation")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

I think it improves readability and this new version addresses Roger's
concerns as far as I can tell.

One minor comment: domid_alloc effectively still accept DOMID_INVALID to
say "give me any DOMID" although it is no longer documented or used. If
we wanted to enforce a different behavior between DOMID_INVALID and
DOMID_ANY we would need to modify domid_alloc.

However, I think this patch is sufficient as it is:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v3:
> - new value for DOMID_ANY instead of aliasing DOMID_INVALID
> - Link to v3: https://lore.kernel.org/xen-devel/20250924030630.122229-2-dmukhin@ford.com/
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
> index 17eb22a9a854..65da0d075a2b 100644
> --- a/tools/tests/domid/harness.h
> +++ b/tools/tests/domid/harness.h
> @@ -41,6 +41,7 @@ extern unsigned long find_next_zero_bit(const unsigned long *addr,
>  
>  #define DOMID_FIRST_RESERVED            (100)
>  #define DOMID_INVALID                   (101)
> +#define DOMID_ANY                       (102)
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
> index 495ef7b16aa0..9130c38681df 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -842,7 +842,7 @@ void __init create_domUs(void)
>          if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>              panic("No more domain IDs available\n");
>  
> -        domid = domid_alloc(DOMID_INVALID);
> +        domid = domid_alloc(DOMID_ANY);
>          if ( domid == DOMID_INVALID )
>              panic("Error allocating ID for domain %s\n", dt_node_name(node));
>  
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 29a7726d32d0..e2c8990531ad 100644
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
> index 7f15204c3885..b5789c32ae1f 100644
> --- a/xen/include/public/xen.h
> +++ b/xen/include/public/xen.h
> @@ -608,6 +608,11 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>  /* DOMID_INVALID is used to identify pages with unknown owner. */
>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>  
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
> +#define DOMID_ANY            xen_mk_uint(0x7FF5)
> +#endif
> +
>  /* Idle domain. */
>  #define DOMID_IDLE           xen_mk_uint(0x7FFF)
>  
> -- 
> 2.52.0
> 

