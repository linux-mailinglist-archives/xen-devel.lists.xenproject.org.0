Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB55680E0F1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652603.1018546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrnZ-0000hC-RR; Tue, 12 Dec 2023 01:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652603.1018546; Tue, 12 Dec 2023 01:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrnZ-0000eZ-Od; Tue, 12 Dec 2023 01:43:01 +0000
Received: by outflank-mailman (input) for mailman id 652603;
 Tue, 12 Dec 2023 01:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rCrnY-0000eT-MX
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:43:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7cbcb00-988f-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 02:42:59 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E8C73B810DB;
 Tue, 12 Dec 2023 01:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971C5C433C9;
 Tue, 12 Dec 2023 01:42:56 +0000 (UTC)
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
X-Inumbo-ID: c7cbcb00-988f-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702345377;
	bh=U4d/9fWQYS7zwl7KtTCgMHuQhJ6xeiY8xl0mNdzq60g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iZaeUFBKVdvox3gfAlBnDBHJUKlPOMCS6MU5uPIK9PCLexzZfH3a40PxEAwfAG2rB
	 qwvOBADk9Eoyw0GYKvg8WbmoOmQhfclunGXs00cORfRlg3xDK50aFShrFGf1p066Uo
	 cA2o2CH32qWzT/REbGTQP91onKcN9HsQ5gDX+s6aEH4es55XFDeQ/GE75io3zUe8Ab
	 wvriCU5ei9EDv706AnsG5Xw0e+QZhxYAIqGOSb4O81ZV2o6KkB14WbW+QGYC70qBaK
	 b9R5hKM4baYvMAODAfi2S4JQAX9Tqg/Sa00iA8Kkw3KgpeqEGsLrYuzSgf9rKAsDLO
	 5dqfmqe84o5Kw==
Date: Mon, 11 Dec 2023 17:42:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/7] x86/mm: address MISRA C:2012 Rule 2.1
In-Reply-To: <5913d8871ff6c4f320c521e50e550a64e58d4351.1702283415.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312111741390.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <5913d8871ff6c4f320c521e50e550a64e58d4351.1702283415.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> The "return 0" after the swich statement in 'xen/arch/x86/mm.c'
> is unreachable because all switch clauses end with returns.
> However, some of them can be substituted with "break"s to allow
> the "return 0" outside the switch to be reachable.
> 
> No functional changes.

This is correct but makes the code inconsistent. I would either remove
the return 0; at the end of arch_memory_op, or do the following:

- initialize rc to 0 at the beginning: int rc = 0;
- all switch clauses break instead of return;
- at the end: return rc;


> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/mm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 0a66db10b959..8b31426a5348 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4753,7 +4753,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          }
>  
>          spin_unlock(&d->arch.e820_lock);
> -        return 0;
> +        break;
>      }
>  
>      case XENMEM_machine_memory_map:
> @@ -4818,7 +4818,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( __copy_to_guest(arg, &ctxt.map, 1) )
>              return -EFAULT;
>  
> -        return 0;
> +        break;
>      }
>  
>      case XENMEM_machphys_mapping:
> @@ -4834,7 +4834,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( copy_to_guest(arg, &mapping, 1) )
>              return -EFAULT;
>  
> -        return 0;
> +        break;
>      }
>  
>  #ifdef CONFIG_HVM
> -- 
> 2.34.1
> 
> 

