Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D92046A5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 03:20:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnXbA-0001sE-RA; Tue, 23 Jun 2020 01:19:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pvsx=AE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jnXb9-0001s8-60
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 01:19:39 +0000
X-Inumbo-ID: 9b2b10c0-b4ef-11ea-bef2-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b2b10c0-b4ef-11ea-bef2-12813bfff9fa;
 Tue, 23 Jun 2020 01:19:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76C162053B;
 Tue, 23 Jun 2020 01:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592875177;
 bh=4OIRBLg0H5N3bTEb42UdP6Mxrr+RntsK/pnHuwgTYh4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0GYXeFn5S0k7Z2rh9P66W3HmFEEip564VofjPy/wJOVHHTTBqbkYpB/i4Y5Bwjsnk
 X3nZwKHZHR1FKGYBdQOqJsWS82OqHn3ZJ1G9sgvXPWFbhqqdg1TSe6GO7cpgPO+h6n
 PngixMCGY4CskEFvf5bcPl/0J5bCI/rwZPmvCqIU=
Date: Mon, 22 Jun 2020 18:19:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
In-Reply-To: <20200619223332.438344-3-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.21.2006221809380.8121@sstabellini-ThinkPad-T480s>
References: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
 <20200619223332.438344-3-volodymyr_babchuk@epam.com>
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
> Trusted Applications use popular approach to determine required size
> of buffer: client provides a memory reference with the NULL pointer to
> a buffer. This is so called "Null memory reference". TA updates the
> reference with the required size and returns it back to the
> client. Then client allocates buffer of needed size and repeats the
> operation.
> 
> This behavior is described in TEE Client API Specification, paragraph
> 3.2.5. Memory References.
> 
> OP-TEE represents this null memory reference as a TMEM parameter with
> buf_ptr = 0x0. This is the only case when we should allow TMEM
> buffer without the OPTEE_MSG_ATTR_NONCONTIG flag. This also the
> special case for a buffer with OPTEE_MSG_ATTR_NONCONTIG flag.
> 
> This could lead to a potential issue, because IPA 0x0 is a valid
> address, but OP-TEE will treat it as a special case. So, care should
> be taken when construction OP-TEE enabled guest to make sure that such
> guest have no memory at IPA 0x0 and none of its memory is mapped at PA
> 0x0.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> 
> Changes from v1:
>  - Added comment with TODO about possible PA/IPA 0x0 issue
>  - The same is described in the commit message
>  - Added check in translate_noncontig() for the NULL ptr buffer
> 
> ---
>  xen/arch/arm/tee/optee.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 6963238056..70bfef7e5f 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -215,6 +215,15 @@ static bool optee_probe(void)
>      return true;
>  }
>  
> +/*
> + * TODO: There is a potential issue with guests that either have RAM
> + * at IPA of 0x0 or some of theirs memory is mapped at PA 0x0. This is
                               ^ their

> + * because PA of 0x0 is considered as NULL pointer by OP-TEE. It will
> + * not be able to map buffer with such pointer to TA address space, or
> + * use such buffer for communication with the guest. We either need to
> + * check that guest have no such mappings or ensure that OP-TEE
> + * enabled guest will not be created with such mappings.
> + */
>  static int optee_domain_init(struct domain *d)
>  {
>      struct arm_smccc_res resp;
> @@ -725,6 +734,15 @@ static int translate_noncontig(struct optee_domain *ctx,
>          uint64_t next_page_data;
>      } *guest_data, *xen_data;
>  
> +    /*
> +     * Special case: buffer with buf_ptr == 0x0 is considered as NULL
> +     * pointer by OP-TEE. No translation is needed. This can lead to
> +     * an issue as IPA 0x0 is a valid address for Xen. See the comment
> +     * near optee_domain_init()
> +     */
> +    if ( !param->u.tmem.buf_ptr )
> +        return 0;

Given that today it is not possible for this to happen, it could even be
an ASSERT. But I think I would just return an error, maybe -EINVAL?

Aside from this, and the small grammar issue, everything else looks fine
to me.

Let's wait for Julien's reply, but if this is the only thing I could fix
on commit.


>      /* Offset of user buffer withing OPTEE_MSG_NONCONTIG_PAGE_SIZE-sized page */
>      offset = param->u.tmem.buf_ptr & (OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1);
>  
> @@ -865,9 +883,12 @@ static int translate_params(struct optee_domain *ctx,
>              }
>              else
>              {
> -                gdprintk(XENLOG_WARNING, "Guest tries to use old tmem arg\n");
> -                ret = -EINVAL;
> -                goto out;
> +                if ( call->xen_arg->params[i].u.tmem.buf_ptr )
> +                {
> +                    gdprintk(XENLOG_WARNING, "Guest tries to use old tmem arg\n");
> +                    ret = -EINVAL;
> +                    goto out;
> +                }
>              }
>              break;
>          case OPTEE_MSG_ATTR_TYPE_NONE:
> -- 
> 2.26.2
> 

