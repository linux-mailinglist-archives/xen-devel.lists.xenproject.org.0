Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819048813A
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 04:46:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254793.436675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n62gR-0000se-Hc; Sat, 08 Jan 2022 03:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254793.436675; Sat, 08 Jan 2022 03:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n62gR-0000qV-EM; Sat, 08 Jan 2022 03:46:23 +0000
Received: by outflank-mailman (input) for mailman id 254793;
 Sat, 08 Jan 2022 03:46:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n62gQ-0000qP-Nx
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 03:46:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n62gP-0002c3-M8; Sat, 08 Jan 2022 03:46:21 +0000
Received: from [5.195.40.20] (helo=[10.235.48.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n62gP-0004nH-Ab; Sat, 08 Jan 2022 03:46:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=xpcea/bKwdi2Vy7dwXdyPwuczXG0hAgS1diSuvFYf18=; b=sjfPd1FtB7KsqHTDCdp6Jgy5tQ
	J/5ANLmscY0YZjNMiz8niFJgD3277UC78tDfOO0++cT5WXbBdbnm6Xg+zzdqHwtR0n8e00I8fKm1B
	epN7KwS2D6nhT4TfKNXLzSt/J7VfD2Bt2dK6uoIIkLYJG/Owv+dV0RthWPVKWbf4ANRI=;
Message-ID: <553d0fcb-98d0-78b2-81ea-350e9f530e6b@xen.org>
Date: Sat, 8 Jan 2022 07:46:17 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [XEN PATCH 3/7] tools: add a late_init argument to
 xs_introduce_domain
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org,
 anthony.perard@citrix.com, jgross@suse.com, marmarek@invisiblethingslab.com
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220108004912.3820176-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/01/2022 00:49, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Add a late_init argument to xs_introduce_domain to handle dom0less
> guests whose xenstore interfaces are initialized after boot.
> 
> This patch mechanically adds the new parameter; it doesn't change
> behaviors.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: wl@xen.org
> CC: anthony.perard@citrix.com
> CC: jgross@suse.com
> CC: marmarek@invisiblethingslab.com
> ---
>   tools/include/xenstore.h          | 3 ++-
>   tools/libs/light/libxl_dom.c      | 3 ++-
>   tools/libs/store/xs.c             | 8 ++++++--
>   tools/python/xen/lowlevel/xs/xs.c | 2 +-
>   4 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/include/xenstore.h b/tools/include/xenstore.h
> index 2b3f69fb61..1a302b5ff9 100644
> --- a/tools/include/xenstore.h
> +++ b/tools/include/xenstore.h
> @@ -226,7 +226,8 @@ bool xs_transaction_end(struct xs_handle *h, xs_transaction_t t,
>   bool xs_introduce_domain(struct xs_handle *h,
>   			 unsigned int domid,
>   			 unsigned long mfn,
> -                         unsigned int eventchn);
> +			 unsigned int eventchn,
> +			 bool late_init);
>   
>   /* Set the target of a domain
>    * This tells the store daemon that a domain is targetting another one, so
> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 2abaab439c..bacfdfa9df 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -497,7 +497,8 @@ retry_transaction:
>       if (!xs_transaction_end(ctx->xsh, t, 0))
>           if (errno == EAGAIN)
>               goto retry_transaction;
> -    xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port);
> +    xs_introduce_domain(ctx->xsh, domid, state->store_mfn, state->store_port,
> +                        false);
>       free(vm_path);
>       return 0;
>   }
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 7a9a8b1656..dd47d607fd 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -1089,16 +1089,18 @@ bool xs_transaction_end(struct xs_handle *h, xs_transaction_t t,
>    */
>   bool xs_introduce_domain(struct xs_handle *h,
>   			 unsigned int domid, unsigned long mfn,
> -			 unsigned int eventchn)
> +			 unsigned int eventchn, bool late_init)

The interface of libstore is meant to be stable/versioned. So I don't 
think you can change xs_introduce_domain().

>   {
>   	char domid_str[MAX_STRLEN(domid)];
>   	char mfn_str[MAX_STRLEN(mfn)];
>   	char eventchn_str[MAX_STRLEN(eventchn)];
> -	struct iovec iov[3];
> +	char late_init_str[MAX_STRLEN(late_init)];
> +	struct iovec iov[4];
>   
>   	snprintf(domid_str, sizeof(domid_str), "%u", domid);
>   	snprintf(mfn_str, sizeof(mfn_str), "%lu", mfn);
>   	snprintf(eventchn_str, sizeof(eventchn_str), "%u", eventchn);
> +	snprintf(late_init_str, sizeof(late_init_str), "%u", late_init);
>   
>   	iov[0].iov_base = domid_str;
>   	iov[0].iov_len = strlen(domid_str) + 1;
> @@ -1106,6 +1108,8 @@ bool xs_introduce_domain(struct xs_handle *h,
>   	iov[1].iov_len = strlen(mfn_str) + 1;
>   	iov[2].iov_base = eventchn_str;
>   	iov[2].iov_len = strlen(eventchn_str) + 1;
> +	iov[3].iov_base = late_init_str;
> +	iov[3].iov_len = strlen(late_init_str) + 1;
>   
>   	return xs_bool(xs_talkv(h, XBT_NULL, XS_INTRODUCE, iov,
>   				ARRAY_SIZE(iov), NULL));
> diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowlevel/xs/xs.c
> index 0dad7fa5f2..dc667fb231 100644
> --- a/tools/python/xen/lowlevel/xs/xs.c
> +++ b/tools/python/xen/lowlevel/xs/xs.c
> @@ -678,7 +678,7 @@ static PyObject *xspy_introduce_domain(XsHandle *self, PyObject *args)
>           return NULL;
>   
>       Py_BEGIN_ALLOW_THREADS
> -    result = xs_introduce_domain(xh, dom, page, port);
> +    result = xs_introduce_domain(xh, dom, page, port, false);
>       Py_END_ALLOW_THREADS
>   
>       return none(result);

Cheers,

-- 
Julien Grall

