Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E7D67BF93
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 23:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484613.751272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKnvO-0000im-U4; Wed, 25 Jan 2023 22:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484613.751272; Wed, 25 Jan 2023 22:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKnvO-0000gV-Pe; Wed, 25 Jan 2023 22:07:22 +0000
Received: by outflank-mailman (input) for mailman id 484613;
 Wed, 25 Jan 2023 22:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKnvO-0000gP-3Q
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 22:07:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2f81672-9cfc-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 23:07:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 838B6B81BE0;
 Wed, 25 Jan 2023 22:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2822EC433EF;
 Wed, 25 Jan 2023 22:07:17 +0000 (UTC)
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
X-Inumbo-ID: a2f81672-9cfc-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674684438;
	bh=+67Nm9MEXf9tqfA8JJgsd8crv/UF0jOLjrPwb+n11Ac=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gX2egELc5SZdxp4rDaGX8Ol0GPtMmRl5zkdC1lek8jGKXzo/WlEzz9dOGDyWBeJ2J
	 rvugQsULNsrMQEGoTG6CSA9jeJvlk3tTuWmv/8uwxcsVMSni6aw/lKjv2nKJ+/XuSX
	 dleZRbL7JhfPuuac7yck8DtnBFs5vizHGSzcJAFG3bWlwL70YOU2nunxYUdqIajnjt
	 D5lKT90yWlBrWrnO+qGTuy02g4NMasnmKlOJNfVz+e8bzPTkfmJe64r8vv1kPalDJ8
	 CeW1u8F74Se5eLiZtJAAutrsU/RAiG9GI3JwVYQFaiEeeedTDY3wdzzQ+Kwavkg3bj
	 Nv8JVqzFZirfQ==
Date: Wed, 25 Jan 2023 14:07:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
    stefano.stabellini@amd.com, alex.bennee@linaro.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [QEMU][PATCH v4 07/10] hw/xen/xen-hvm-common: Use g_new and
 error_setg_errno
In-Reply-To: <20230125085407.7144-8-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251406170.1978264@ubuntu-linux-20-04-desktop>
References: <20230125085407.7144-1-vikram.garhwal@amd.com> <20230125085407.7144-8-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jan 2023, Vikram Garhwal wrote:
> Replace g_malloc with g_new and perror with error_setg_errno.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  hw/xen/xen-hvm-common.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 94dbbe97ed..01c8ec1956 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -34,7 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
>      trace_xen_ram_alloc(ram_addr, size);
>  
>      nr_pfn = size >> TARGET_PAGE_BITS;
> -    pfn_list = g_malloc(sizeof (*pfn_list) * nr_pfn);
> +    pfn_list = g_new(xen_pfn_t, nr_pfn);
>  
>      for (i = 0; i < nr_pfn; i++) {
>          pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
> @@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
>              return;
>          }
>          if (errno != ENOTTY /* old Xen */) {
> -            perror("xendevicemodel_shutdown failed");
> +            error_report("xendevicemodel_shutdown failed with error %d", errno);

You can use strerror(errno), here and below.

Either way:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



>          }
>          /* well, try the old thing then */
>      }
> @@ -797,7 +797,7 @@ static void xen_do_ioreq_register(XenIOState *state,
>      }
>  
>      /* Note: cpus is empty at this point in init */
> -    state->cpu_by_vcpu_id = g_malloc0(max_cpus * sizeof(CPUState *));
> +    state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
>  
>      rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
>      if (rc < 0) {
> @@ -806,7 +806,7 @@ static void xen_do_ioreq_register(XenIOState *state,
>          goto err;
>      }
>  
> -    state->ioreq_local_port = g_malloc0(max_cpus * sizeof (evtchn_port_t));
> +    state->ioreq_local_port = g_new0(evtchn_port_t, max_cpus);
>  
>      /* FIXME: how about if we overflow the page here? */
>      for (i = 0; i < max_cpus; i++) {
> @@ -860,13 +860,13 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
>  
>      state->xce_handle = xenevtchn_open(NULL, 0);
>      if (state->xce_handle == NULL) {
> -        perror("xen: event channel open");
> +        error_report("xen: event channel open failed with error %d", errno);
>          goto err;
>      }
>  
>      state->xenstore = xs_daemon_open();
>      if (state->xenstore == NULL) {
> -        perror("xen: xenstore open");
> +        error_report("xen: xenstore open failed with error %d", errno);
>          goto err;
>      }
>  
> -- 
> 2.17.0
> 
> 

