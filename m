Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100D0819520
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 01:23:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657270.1026040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkMO-0002cp-SQ; Wed, 20 Dec 2023 00:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657270.1026040; Wed, 20 Dec 2023 00:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkMO-0002aE-PO; Wed, 20 Dec 2023 00:22:52 +0000
Received: by outflank-mailman (input) for mailman id 657270;
 Wed, 20 Dec 2023 00:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFkMN-0002a8-NU
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 00:22:51 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8e630a0-9ecd-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 01:22:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 43D02B81A38;
 Wed, 20 Dec 2023 00:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97A5C433C8;
 Wed, 20 Dec 2023 00:22:48 +0000 (UTC)
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
X-Inumbo-ID: e8e630a0-9ecd-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703031769;
	bh=YRNcQyLcUY96uoC7qORwMB2Uuc3WL9dDhu+/F4/Wi00=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fc9WJqSLg7RL59rz/0fSndmwaEzIyo5PWf1xyQ0MIl7IUOGSdwAOOen1B0VsgA7v+
	 DC1uN9BGz0JL7UjVLHGPCcNt0d45j0rlBVFjA+MB8UU8HSGPRKPTNoec7bdNtwgdce
	 9ugg3Pzwg0E8zlgWmkEL/gghOmrEzO9GeEF4GEUaQlGEwE2sJyjU3/8Wzt92+oRcLs
	 s5Jw1sJSsbR4+XdiB+kE3fRA8Iixxta6ckSTlC6uosWNdKperEoZyXHy+Zjhj2cVKX
	 s/qKzfQAnZVpvsZ3N7NDOjrT3InfCyyqmxGu2rFsNcMDWEsqZ2uprP/oLovJlpzb78
	 nADj9cCOZUKUg==
Date: Tue, 19 Dec 2023 16:22:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/mm: use "break" in arch_memory_op()
In-Reply-To: <e944cc4f-354c-4752-8794-03e6a7517372@suse.com>
Message-ID: <alpine.DEB.2.22.394.2312191620000.3175268@ubuntu-linux-20-04-desktop>
References: <e944cc4f-354c-4752-8794-03e6a7517372@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Dec 2023, Jan Beulich wrote:
> The final return statement is unreachable and hence disliked by Misra
> C:2012 (rule 2.1). Convert those case-specific (main) return statements
> which already use "rc", or in one case when it can be used without
> further adding of code, to break.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is an alternative proposal to
> https://lists.xen.org/archives/html/xen-devel/2023-12/msg01537.html.
> Yet another option would be to simply pull the default case out of the
> switch() statement.
> 
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4724,7 +4724,7 @@ long arch_memory_op(unsigned long cmd, X
>          spin_unlock(&d->arch.e820_lock);
>  
>          rcu_unlock_domain(d);
> -        return rc;
> +        break;
>      }
>  
>      case XENMEM_memory_map:
> @@ -4818,7 +4818,7 @@ long arch_memory_op(unsigned long cmd, X
>          if ( __copy_to_guest(arg, &ctxt.map, 1) )
>              return -EFAULT;
>  
> -        return 0;
> +        break;
>      }

There are also two other return 0; under case XENMEM_memory_map and
XENMEM_machphys_mapping. I would be consistent and either leave this
return 0 alone, or change all the return 0.

Either way, this patch is correct, so:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>      case XENMEM_machphys_mapping:
> @@ -4880,7 +4880,7 @@ long arch_memory_op(unsigned long cmd, X
>          }
>  
>          rcu_unlock_domain(d);
> -        return rc;
> +        break;
>      }
>  #endif
>  
> @@ -4888,7 +4888,7 @@ long arch_memory_op(unsigned long cmd, X
>          return subarch_memory_op(cmd, arg);
>      }
>  
> -    return 0;
> +    return rc;
>  }
>  
>  int cf_check mmio_ro_emulated_write(
> 

