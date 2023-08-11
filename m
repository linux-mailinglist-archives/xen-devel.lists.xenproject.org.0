Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DC779ABA
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 00:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582685.912557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUaeQ-0004WQ-TM; Fri, 11 Aug 2023 22:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582685.912557; Fri, 11 Aug 2023 22:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUaeQ-0004Te-QK; Fri, 11 Aug 2023 22:30:34 +0000
Received: by outflank-mailman (input) for mailman id 582685;
 Fri, 11 Aug 2023 22:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUaeP-0004TW-Do
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 22:30:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adedd064-3896-11ee-b284-6b7b168915f2;
 Sat, 12 Aug 2023 00:30:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65AAF6534C;
 Fri, 11 Aug 2023 22:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EEFC433C7;
 Fri, 11 Aug 2023 22:30:28 +0000 (UTC)
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
X-Inumbo-ID: adedd064-3896-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691793029;
	bh=gJh/BRJQN4ktdky2+xR1SdegEWPljAkFhdN+Qjj1Fgg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TrNuKeqRIUK9IEzU7bl0Oj5EvEgXKkPQrQuR8WF37wJtM1g3Fj7lJbsEqfEoG6/IH
	 rFnVa+xLHXPpKADyDqpOLf/kJMezdn+ihOrGZGoPR/sLoOPd1qcArhQX/O511h5yzE
	 ZwIDihUCNynPVWAtrLwILXKiabGokUvUg070PsNnHXZBnpPoebuxCc/1VfWQeMQ0FF
	 3dFvTWlAKHGJEjP6J7hBVe+v+Eg6Wwzs+PmZYjfv/fbQDEVXZU6gt5RMY9wrXSdWVg
	 dnuKcAHEe1insMQtiP2u5PiNg9CKnMuimhOhhPD6/jPy0ncpLtfGPfQ9c1UKaXjvA+
	 6F3YkCQou9IKg==
Date: Fri, 11 Aug 2023 15:30:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
In-Reply-To: <5500643d99b315aa4344e5e3a833e6efa9a0413f.1691737296.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111528510.2127516@ubuntu-linux-20-04-desktop>
References: <5500643d99b315aa4344e5e3a833e6efa9a0413f.1691737296.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Federico Serafini wrote:
> Uniform the auto-generated hypercall-decls with the corresponding
> definitions to address violations of MISRA C:2012 Rule 8.3:
> "All declarations of an object or function shall use the same names and
> type qualifiers".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/include/hypercall-defs.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
> index 6d361ddfce..4feddce571 100644
> --- a/xen/include/hypercall-defs.c
> +++ b/xen/include/hypercall-defs.c
> @@ -107,11 +107,16 @@ defhandle: physdev_op_compat_t
>  prefix: do PREFIX_hvm PREFIX_compat PREFIX_do_arm
>  physdev_op(int cmd, void *arg)
>  
> -prefix: do PREFIX_hvm PREFIX_compat
> +prefix: do PREFIX_hvm
>  #if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>  grant_table_op(unsigned int cmd, void *uop, unsigned int count)
>  #endif
>  
> +prefix: PREFIX_compat
> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
> +grant_table_op(unsigned int cmd, void *cmp_uop, unsigned int count)
> +#endif

Everything checks out, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

The other changes are uncontroversial. This one about splitting out the
compat version of grant_table_op is not great. I wonder if it would be
better to rename cmp_uop to uop in xen/common/compat/grant_table.c. I'll
let Jan and the others decide I am OK either way.


>  prefix: do PREFIX_hvm
>  memory_op(unsigned long cmd, void *arg)
>  
> @@ -136,7 +141,7 @@ xenoprof_op(int op, void *arg)
>  prefix: compat
>  set_timer_op(uint32_t lo, int32_t hi)
>  multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
> -memory_op(unsigned int cmd, void *arg)
> +memory_op(unsigned int cmd, void *compat)
>  #ifdef CONFIG_IOREQ_SERVER
>  dm_op(domid_t domid, unsigned int nr_bufs, void *bufs)
>  #endif
> @@ -172,7 +177,7 @@ console_io(unsigned int cmd, unsigned int count, char *buffer)
>  vm_assist(unsigned int cmd, unsigned int type)
>  event_channel_op(int cmd, void *arg)
>  mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
> -multicall(multicall_entry_t *call_list, unsigned int nr_calls)
> +multicall(multicall_entry_t *call_list, uint32_t nr_calls)
>  #ifdef CONFIG_PV
>  mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
>  stack_switch(unsigned long ss, unsigned long esp)
> -- 
> 2.34.1
> 

