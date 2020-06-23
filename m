Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49382046A6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 03:20:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnXbG-0001sX-3h; Tue, 23 Jun 2020 01:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pvsx=AE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jnXbE-0001s8-20
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 01:19:44 +0000
X-Inumbo-ID: 9d70a0de-b4ef-11ea-bef2-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d70a0de-b4ef-11ea-bef2-12813bfff9fa;
 Tue, 23 Jun 2020 01:19:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 866B62053B;
 Tue, 23 Jun 2020 01:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592875181;
 bh=w6rTVAhgIBPh0garjvhse4Q6AvioIJLVTatcx1vBVuI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=gdQ4R5aB/2vicmqYRFKzs0bLFh+3N8XMCVfWakp129haNAF2QoO8Yew6231FBodW5
 G/Mp8mndv73JHNaQBj9lMBXKLgXMXrLjbKaX6TiKLof0M7/gO5Qd4NWFMVVqNxlGG1
 IzxaQyQVsxbjhE/Wh1WH+NRusqFhGPVwqsOTdkRA=
Date: Mon, 22 Jun 2020 18:19:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] optee: immediately free buffers that are released
 by OP-TEE
In-Reply-To: <20200619223332.438344-2-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.21.2006221759540.8121@sstabellini-ThinkPad-T480s>
References: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
 <20200619223332.438344-2-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pdurrant@amazon.com" <pdurrant@amazon.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 19 Jun 2020, Volodymyr Babchuk wrote:
> Normal World can share buffer with OP-TEE for two reasons:
> 1. Some client application wants to exchange data with TA
> 2. OP-TEE asks for shared buffer for internal needs
> 
> The second case was handle more strictly than necessary:
> 
> 1. In RPC request OP-TEE asks for buffer
> 2. NW allocates buffer and provides it via RPC response
> 3. Xen pins pages and translates data
> 4. Xen provides buffer to OP-TEE
> 5. OP-TEE uses it
> 6. OP-TEE sends request to free the buffer
> 7. NW frees the buffer and sends the RPC response
> 8. Xen unpins pages and forgets about the buffer
> 
> The problem is that Xen should forget about buffer in between stages 6
> and 7. I.e. the right flow should be like this:
> 
> 6. OP-TEE sends request to free the buffer
> 7. Xen unpins pages and forgets about the buffer
> 8. NW frees the buffer and sends the RPC response
> 
> This is because OP-TEE internally frees the buffer before sending the
> "free SHM buffer" request. So we have no reason to hold reference for
> this buffer anymore. Moreover, in multiprocessor systems NW have time
> to reuse buffer cookie for another buffer. Xen complained about this
> and denied the new buffer registration. I have seen this issue while
> running tests on iMX SoC.
> 
> So, this patch basically corrects that behavior by freeing the buffer
> earlier, when handling RPC return from OP-TEE.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

There are a couple of grammar issues in the comments, but we can fix
them on commit.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> 
> Changes from v1:
>  - reworded the comments
>  - added WARN() for a case when OP-TEE wants to release not the
>    buffer it requeset to allocate durint this call
> 
> ---
>  xen/arch/arm/tee/optee.c | 32 ++++++++++++++++++++++++++++----
>  1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 6a035355db..6963238056 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -1099,6 +1099,34 @@ static int handle_rpc_return(struct optee_domain *ctx,
>          if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_ALLOC )
>              call->rpc_buffer_type = shm_rpc->xen_arg->params[0].u.value.a;
>  
> +        /*
> +         * OP-TEE is signalling that it has freed the buffer that it
> +         * requested before. This is the right time for us to do the
> +         * same.
> +         */
> +        if ( shm_rpc->xen_arg->cmd == OPTEE_RPC_CMD_SHM_FREE )
> +        {
> +            uint64_t cookie = shm_rpc->xen_arg->params[0].u.value.b;
> +
> +            free_optee_shm_buf(ctx, cookie);
> +
> +            /*
> +             * OP-TEE asks to free buffer, but this is not the same
> +             * buffer we previously allocated for it. While nothing
> +             * prevents OP-TEE from asking this, it is the strange
                                                          ^ a

> +             * situation. This may or may not be caused by a bug in
> +             * OP-TEE or mediator. But is better to print warning.
                                          ^ it is

> +             */
> +            if ( call->rpc_data_cookie && call->rpc_data_cookie != cookie )
> +            {
> +                gprintk(XENLOG_ERR,
> +                        "Saved RPC cookie does not corresponds to OP-TEE's (%"PRIx64" != %"PRIx64")\n",
                                                      ^ correspond


> +                        call->rpc_data_cookie, cookie);
> +
> +                WARN();
> +            }
> +            call->rpc_data_cookie = 0;
> +        }
>          unmap_domain_page(shm_rpc->xen_arg);
>      }
>  
> @@ -1464,10 +1492,6 @@ static void handle_rpc_cmd(struct optee_domain *ctx, struct cpu_user_regs *regs,
>              }
>              break;
>          case OPTEE_RPC_CMD_SHM_FREE:
> -            free_optee_shm_buf(ctx, shm_rpc->xen_arg->params[0].u.value.b);
> -            if ( call->rpc_data_cookie ==
> -                 shm_rpc->xen_arg->params[0].u.value.b )
> -                call->rpc_data_cookie = 0;
>              break;
>          default:
>              break;
> -- 
> 2.26.2
> 

