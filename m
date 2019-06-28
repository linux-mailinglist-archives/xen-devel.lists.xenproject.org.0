Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353855A5A7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 22:08:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgx7P-0003Un-U7; Fri, 28 Jun 2019 20:05:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=84UU=U3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgx7P-0003Ui-6D
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 20:05:11 +0000
X-Inumbo-ID: 07e254d4-99e0-11e9-b2cc-f3dd1e4a32a0
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07e254d4-99e0-11e9-b2cc-f3dd1e4a32a0;
 Fri, 28 Jun 2019 20:05:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13E1E2086D;
 Fri, 28 Jun 2019 20:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561752309;
 bh=qtGrfkqPup0qQ3/f7ayA2nfHkcurDypeX+ln+UrhAu4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FUbnFfOhVWZ6c/ldo3MsnEAf8SrKI4swUY7lXSSD/2U58o8nUta85aX0InX/FhLUb
 OpAi6H/3CnWPgjCL1FuWrwZll03oR1ISBmgob7vFugROl1GQuU73xCwphB+U2XNQfD
 /J68l6JdvSd7Mvd/9j1XV26Wq2NtKXjewS8QJvBY=
Date: Fri, 28 Jun 2019 13:05:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20190628131821.19690-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.21.1906281303140.5851@sstabellini-ThinkPad-T480s>
References: <20190628131821.19690-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1061350974-1561752309=:5851"
Subject: Re: [Xen-devel] [PATCH] arm/optee: Fix arm32 build
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1061350974-1561752309=:5851
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 28 Jun 2019, Andrew Cooper wrote:
> A Travis randconfig build notices:
> 
> optee.c: In function ‘allocate_and_pin_shm_rpc’:
> optee.c:383:13: error: format ‘%lx’ expects argument of type
>    ‘long unsigned int’, but argument 5 has type ‘uint64_t’ [-Werror=format=]
>     gdprintk(XENLOG_WARNING, "Guest tries to use the same RPC SHM cookie %lx\n",
>              ^
> 
> Use PRIx64 instead of %lx
> 
> Full logs https://travis-ci.org/andyhhp/xen/jobs/551754253
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien.grall@arm.com>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> ---
>  xen/arch/arm/tee/optee.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 61029855d4..1d79c2c159 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -380,7 +380,8 @@ static struct shm_rpc *allocate_and_pin_shm_rpc(struct optee_domain *ctx,
>          if ( shm_rpc_tmp->cookie == cookie )
>          {
>              spin_unlock(&ctx->lock);
> -            gdprintk(XENLOG_WARNING, "Guest tries to use the same RPC SHM cookie %lx\n",
> +            gdprintk(XENLOG_WARNING,
> +                     "Guest tries to use the same RPC SHM cookie %"PRIx64"\n",
>                       cookie);
>              goto err;
>          }
> @@ -493,7 +494,8 @@ static struct optee_shm_buf *allocate_optee_shm_buf(struct optee_domain *ctx,
>          if ( optee_shm_buf_tmp->cookie == cookie )
>          {
>              spin_unlock(&ctx->lock);
> -            gdprintk(XENLOG_WARNING, "Guest tries to use the same SHM buffer cookie %lx\n",
> +            gdprintk(XENLOG_WARNING,
> +                     "Guest tries to use the same SHM buffer cookie %"PRIx64"\n",
>                       cookie);
>              err_code = -EINVAL;
>              goto err;
> @@ -574,7 +576,8 @@ static void free_optee_shm_buf_pg_list(struct optee_domain *ctx,
>      if ( found )
>          free_pg_list(optee_shm_buf);
>      else
> -        gdprintk(XENLOG_ERR, "Can't find pagelist for SHM buffer with cookie %lx to free it\n",
> +        gdprintk(XENLOG_ERR,
> +                 "Can't find pagelist for SHM buffer with cookie %"PRIx64" to free it\n",
>                   cookie);
>  }
>  
> @@ -1018,7 +1021,8 @@ static int handle_rpc_return(struct optee_domain *ctx,
>               * will overwrite it with actual result. So we can just
>               * continue the call.
>               */
> -            gprintk(XENLOG_ERR, "Can't find SHM-RPC with cookie %lx\n", cookie);
> +            gprintk(XENLOG_ERR, "Can't find SHM-RPC with cookie %"PRIx64"\n",
> +                    cookie);
>  
>              return -ERESTART;
>          }
> @@ -1219,7 +1223,8 @@ static void handle_rpc_cmd_alloc(struct optee_domain *ctx,
>      if ( shm_rpc->xen_arg->params[0].attr != (OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT |
>                                                OPTEE_MSG_ATTR_NONCONTIG) )
>      {
> -        gdprintk(XENLOG_WARNING, "Invalid attrs for shared mem buffer: %lx\n",
> +        gdprintk(XENLOG_WARNING,
> +                 "Invalid attrs for shared mem buffer: %"PRIx64"\n",
>                   shm_rpc->xen_arg->params[0].attr);
>          return;
>      }
> @@ -1268,7 +1273,8 @@ static void handle_rpc_cmd(struct optee_domain *ctx, struct cpu_user_regs *regs,
>  
>      if ( !shm_rpc )
>      {
> -        gdprintk(XENLOG_ERR, "Can't find SHM-RPC with cookie %lx\n", cookie);
> +        gdprintk(XENLOG_ERR, "Can't find SHM-RPC with cookie %"PRIx64"\n",
> +                 cookie);
>          return;
>      }
>  
> -- 
> 2.11.0
> 
--8323329-1061350974-1561752309=:5851
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1061350974-1561752309=:5851--

