Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF077FD67
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 20:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585560.916738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWhIe-00081D-9e; Thu, 17 Aug 2023 18:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585560.916738; Thu, 17 Aug 2023 18:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWhIe-0007yx-6a; Thu, 17 Aug 2023 18:00:48 +0000
Received: by outflank-mailman (input) for mailman id 585560;
 Thu, 17 Aug 2023 18:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qWhIc-0007yr-Tu
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 18:00:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcaba502-3d27-11ee-877d-cb3800f73035;
 Thu, 17 Aug 2023 20:00:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A882636E4;
 Thu, 17 Aug 2023 18:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BF9C433C8;
 Thu, 17 Aug 2023 18:00:41 +0000 (UTC)
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
X-Inumbo-ID: fcaba502-3d27-11ee-877d-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692295243;
	bh=q+X11AJmd6T2WJlrCSX5q5KLEJjvKVYu6RniQC/RcY4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U9LYNousMO2F55fr+d35Lu9B51z4Y0Ehe/NsPDAUQU9b1cA2Fvn2HReDkOvtyD7SI
	 esRIUkM260vhHluWlNNBzjFTdhsdZMrJXMkaQs5JDdye/gEaar6LOQIirKdJ1R56iN
	 DlL9E25/G9SbEKksTf9cWexUuUWlfT5v00jebhD3bAJl/eN2bA1nAgD0ZTJG/+tFh5
	 Pcccv6l3dk+hgnF+aQjqMavT/6tiIpGfcVhrD4Wu+F9NRXH2nMcoNlq7Q9WcoyjoLY
	 lAcrMA4sXVvJGMOAAZiIxA5WElzeZ50mwmzl696ouxNIpMI3f6GleVC8MExVm2CO77
	 5Jh5h/lWLPpjg==
Date: Thu, 17 Aug 2023 11:00:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 1/3] vm_event: rework inclusions to use arch-indipendent
 header
In-Reply-To: <6ef8207eee081e2c9a3914a14025077fc72b19e6.1692275359.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308171100320.6458@ubuntu-linux-20-04-desktop>
References: <cover.1692275359.git.nicola.vetrini@bugseng.com> <6ef8207eee081e2c9a3914a14025077fc72b19e6.1692275359.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Aug 2023, Nicola Vetrini wrote:
> The arch-specific header <asm/vm_event.h> should be included by the
> common header <xen/vm_event.h>, so that the latter can be included
> in the source files.
> 
> This also resolves violations of MISRA C:2012 Rule 8.4 that were
> caused by declarations for
> 'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
> in <asm/vm_event.h> not being visible when
> defining functions in 'xen/arch/x86/vm_event.c'
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Include the arch-specific header in the common one, and only include
>   the latter in source files.
> 
> The following functions have been mainly touched by the following commits,
> but the present commit does not solve a problem introduced by one of them per se, except perhaps the first one mentioned, which is why I didn't put a Fixes tag in this v2:
> - 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
> - adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs and p2m_vm_event_fill_regs")
> - 9864841914c2 ("x86/vm_event: add support for VM_EVENT_REASON_INTERRUPT")
> ---
>  xen/arch/arm/include/asm/vm_event.h | 1 -
>  xen/arch/arm/vm_event.c             | 2 +-
>  xen/arch/x86/vm_event.c             | 2 +-
>  xen/include/xen/vm_event.h          | 1 +
>  4 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/vm_event.h b/xen/arch/arm/include/asm/vm_event.h
> index abe7db1970ca..4d861373b38d 100644
> --- a/xen/arch/arm/include/asm/vm_event.h
> +++ b/xen/arch/arm/include/asm/vm_event.h
> @@ -20,7 +20,6 @@
>  #define __ASM_ARM_VM_EVENT_H__
>  
>  #include <xen/sched.h>
> -#include <xen/vm_event.h>
>  #include <public/domctl.h>
>  
>  static inline int vm_event_init_domain(struct domain *d)
> diff --git a/xen/arch/arm/vm_event.c b/xen/arch/arm/vm_event.c
> index ba99f56eb20c..ccfd25bbbca9 100644
> --- a/xen/arch/arm/vm_event.c
> +++ b/xen/arch/arm/vm_event.c
> @@ -8,7 +8,7 @@
>   */
>  
>  #include <xen/sched.h>
> -#include <asm/vm_event.h>
> +#include <xen/vm_event.h>
>  
>  void vm_event_fill_regs(vm_event_request_t *req)
>  {
> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
> index 7027c08a926b..e6c7ad5337dd 100644
> --- a/xen/arch/x86/vm_event.c
> +++ b/xen/arch/x86/vm_event.c
> @@ -20,7 +20,7 @@
>  
>  #include <xen/sched.h>
>  #include <xen/mem_access.h>
> -#include <asm/vm_event.h>
> +#include <xen/vm_event.h>
>  
>  /* Implicitly serialized by the domctl lock. */
>  int vm_event_init_domain(struct domain *d)
> diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
> index 92811d9110e5..9a86358b42ae 100644
> --- a/xen/include/xen/vm_event.h
> +++ b/xen/include/xen/vm_event.h
> @@ -25,6 +25,7 @@
>  
>  #include <xen/sched.h>
>  #include <public/vm_event.h>
> +#include <asm/vm_event.h>
>  
>  struct vm_event_domain
>  {
> -- 
> 2.34.1
> 

