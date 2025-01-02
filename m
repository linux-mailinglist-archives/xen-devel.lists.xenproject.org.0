Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538E99FFF7A
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:37:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864486.1275716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTR0C-0008Cx-Bn; Thu, 02 Jan 2025 19:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864486.1275716; Thu, 02 Jan 2025 19:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTR0C-0008BC-9C; Thu, 02 Jan 2025 19:37:04 +0000
Received: by outflank-mailman (input) for mailman id 864486;
 Thu, 02 Jan 2025 19:37:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqxF=T2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTR0B-0008B4-51
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:37:03 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efaacd54-c940-11ef-a0dc-8be0dac302b0;
 Thu, 02 Jan 2025 20:37:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EF050A411CE;
 Thu,  2 Jan 2025 19:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450FBC4CED6;
 Thu,  2 Jan 2025 19:36:57 +0000 (UTC)
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
X-Inumbo-ID: efaacd54-c940-11ef-a0dc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735846620;
	bh=yoJEu+fgU8+FCvlj6nDDstyl/wVqK7ew3HsdnhojhNU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AuoHrFZsi+AFPcJ4u2DVKWyFidfqc3JnhPkBm3UQE2zHdUkGC3B/IOVp+YnnESjmU
	 ZLhZRZcYyv4Jp+az0hyP8k9UHCxuLLhITX4jhUAX5xZG7s/YuKXpFVtUDd1qAQ31xM
	 4q8QKnHxX/2CPrQ44MjpYhuiOr9q9t0vV6ZPnPaAoahl30Qo0WYl91Id/KkSYI43DV
	 7qNGa2fN+Qc2A6lQ/9F5bsz1nORgHhwEtpdmqv6+GQxv/nxzP3IURG04zLCRh3D2A/
	 PkybrQPLxXd71k/shQBCvOXscTsMHS0/H0h+Hi5MQEevszi0XNpCtQtRKkvXdzlG4a
	 7hZACeiRSxEAA==
Date: Thu, 2 Jan 2025 11:36:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1] ioreq: allow arch_vcpu_ioreq_completion() to
 signal an error
In-Reply-To: <20241220093514.3094521-1-Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2501021136490.16425@ubuntu-linux-20-04-desktop>
References: <20241220093514.3094521-1-Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Dec 2024, Sergiy Kibrik wrote:
> Return false from arch_vcpu_ioreq_completion() when completion is not handled.
> According to coding-best-practices.pandoc an error should be propagated to
> caller, if caller is expecting to handle it, which seems to the case for
> callers of arch_vcpu_ioreq_completion().
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This change has been suggested by Jan some time ago during review of another
> series, here's link to discussion:
> https://lore.kernel.org/xen-devel/952701cd-83d8-4c1f-9f38-ee63ba582d66@suse.com/
> ---
>  xen/arch/x86/hvm/ioreq.c | 2 +-
>  xen/include/xen/ioreq.h  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 5c3d0c69aa..9b1592d505 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -47,7 +47,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>  
>      default:
>          ASSERT_UNREACHABLE();
> -        break;
> +        return false;
>      }
>  
>      return true;
> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index 29a17e8ff5..2583eca0d5 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -118,7 +118,7 @@ bool arch_vcpu_ioreq_completion(enum vio_completion completion);
>  static inline bool arch_vcpu_ioreq_completion(enum vio_completion completion)
>  {
>      ASSERT_UNREACHABLE();
> -    return true;
> +    return false;
>  }
>  #endif
>  
> -- 
> 2.25.1
> 

