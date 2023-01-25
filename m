Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9629E67BF59
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 22:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484596.751242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKnju-0006Kl-8I; Wed, 25 Jan 2023 21:55:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484596.751242; Wed, 25 Jan 2023 21:55:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKnju-0006Hu-5B; Wed, 25 Jan 2023 21:55:30 +0000
Received: by outflank-mailman (input) for mailman id 484596;
 Wed, 25 Jan 2023 21:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKnjt-0006Ho-2L
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 21:55:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9745774-9cfa-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 22:55:26 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 776B261617;
 Wed, 25 Jan 2023 21:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DCDC433D2;
 Wed, 25 Jan 2023 21:55:23 +0000 (UTC)
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
X-Inumbo-ID: f9745774-9cfa-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674683724;
	bh=11+YS4X+XuTHVoAhxZs3uahEcdGhI+UChCKBPLj63h4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m5mxuaEzJVDELptAiXncQR0RH0C2faHVpX5k7miFSwLgvs3biZdfHBlU35eumllYF
	 FW6mY55A6RrbaoGbSdPj6E++6hXcdYijji4makH5EfYqNkEIzmkE/GACWbBxErXrXY
	 lEDB6sTPE/ocPi4xdxs6kG5yZfkXZNAHC+iccfvyznIIslDHkC3n+fTv9lEFRR5V+c
	 Mhf5Su9OaKF2TQzF2rbBQlJQsSAwaftoS6cK4QYe9unsdNuACbEyMzCHS2COTftC26
	 lapU0BfWtlrWDzScGz7ZIjgL5mfUpo76bo/trZ2pIbnXrmb59qfLXzYJH3FGqJjXUE
	 FtyV5e9cVUXcw==
Date: Wed, 25 Jan 2023 13:55:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
    stefano.stabellini@amd.com, alex.bennee@linaro.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Eduardo Habkost <eduardo@habkost.net>, 
    "Michael S. Tsirkin" <mst@redhat.com>, 
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [QEMU][PATCH v4 04/10] xen-hvm: reorganize xen-hvm and move
 common function to xen-hvm-common
In-Reply-To: <20230125085407.7144-5-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251329520.1978264@ubuntu-linux-20-04-desktop>
References: <20230125085407.7144-1-vikram.garhwal@amd.com> <20230125085407.7144-5-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jan 2023, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This patch does following:
> 1. creates arch_handle_ioreq() and arch_xen_set_memory(). This is done in
>     preparation for moving most of xen-hvm code to an arch-neutral location,
>     move the x86-specific portion of xen_set_memory to arch_xen_set_memory.
>     Also, move handle_vmport_ioreq to arch_handle_ioreq.
> 
> 2. Pure code movement: move common functions to hw/xen/xen-hvm-common.c
>     Extract common functionalities from hw/i386/xen/xen-hvm.c and move them to
>     hw/xen/xen-hvm-common.c. These common functions are useful for creating
>     an IOREQ server.
> 
>     xen_hvm_init_pc() contains the architecture independent code for creating
>     and mapping a IOREQ server, connecting memory and IO listeners, initializing
>     a xen bus and registering backends. Moved this common xen code to a new
>     function xen_register_ioreq() which can be used by both x86 and ARM machines.
> 
>     Following functions are moved to hw/xen/xen-hvm-common.c:
>         xen_vcpu_eport(), xen_vcpu_ioreq(), xen_ram_alloc(), xen_set_memory(),
>         xen_region_add(), xen_region_del(), xen_io_add(), xen_io_del(),
>         xen_device_realize(), xen_device_unrealize(),
>         cpu_get_ioreq_from_shared_memory(), cpu_get_ioreq(), do_inp(),
>         do_outp(), rw_phys_req_item(), read_phys_req_item(),
>         write_phys_req_item(), cpu_ioreq_pio(), cpu_ioreq_move(),
>         cpu_ioreq_config(), handle_ioreq(), handle_buffered_iopage(),
>         handle_buffered_io(), cpu_handle_ioreq(), xen_main_loop_prepare(),
>         xen_hvm_change_state_handler(), xen_exit_notifier(),
>         xen_map_ioreq_server(), destroy_hvm_domain() and
>         xen_shutdown_fatal_error()
> 
> 3. Removed static type from below functions:
>     1. xen_region_add()
>     2. xen_region_del()
>     3. xen_io_add()
>     4. xen_io_del()
>     5. xen_device_realize()
>     6. xen_device_unrealize()
>     7. xen_hvm_change_state_handler()
>     8. cpu_ioreq_pio()
>     9. xen_exit_notifier()
> 
> 4. Replace TARGET_PAGE_SIZE with XC_PAGE_SIZE to match the page side with Xen.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

One comment below

[...]

> +void xen_exit_notifier(Notifier *n, void *data)
> +{
> +    XenIOState *state = container_of(n, XenIOState, exit);
> +
> +    xen_destroy_ioreq_server(xen_domid, state->ioservid);

In the original code we had:

-    if (state->fres != NULL) {
-        xenforeignmemory_unmap_resource(xen_fmem, state->fres);
-    }

Should we add it here?


I went through the manual process of comparing all the code additions
and deletions (not fun!) and everything checks out except for this.


> +    xenevtchn_close(state->xce_handle);
> +    xs_daemon_close(state->xenstore);
> +}

