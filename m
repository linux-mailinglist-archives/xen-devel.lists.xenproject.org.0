Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F7B151C7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 19:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062936.1428678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugnga-0003VY-0H; Tue, 29 Jul 2025 17:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062936.1428678; Tue, 29 Jul 2025 17:00:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugngZ-0003Sd-Td; Tue, 29 Jul 2025 17:00:19 +0000
Received: by outflank-mailman (input) for mailman id 1062936;
 Tue, 29 Jul 2025 17:00:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ugngX-0003SX-V5
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 17:00:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugngX-007Yz1-1V;
 Tue, 29 Jul 2025 17:00:17 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ugngX-00G47D-0Y;
 Tue, 29 Jul 2025 17:00:17 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=BQok/6F0fOgok3e+qEA5enMeelzeGRZBxmCo/lKLmH0=; b=R0kKIDW/W8znVSxzM95UHYv2f7
	ItUmNoyvNo1zS6AFUQVq7wH1VHqDYT2EflLvT7Gotgx09lZbwRJhWn3JsRWus+TjnEjRBKgt6Wff0
	Y+xCZgIu2yClojToRaNWkNyPWEqwQKKrWnq2FXCgjVU4lmVB8Y4i36nX+tmiWAElb2A4=;
Date: Tue, 29 Jul 2025 19:00:15 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 5/9] tools/libxenevtchn: add xenevtchn_bind() under
 Mini-OS
Message-ID: <aIj-H5QvGMhFLh4c@l14>
References: <20250729110146.10580-1-jgross@suse.com>
 <20250729110146.10580-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729110146.10580-6-jgross@suse.com>

On Tue, Jul 29, 2025 at 01:01:41PM +0200, Juergen Gross wrote:
> In order to reactivate an event channel after kexec() of Mini-OS,
> libxenevtchn needs to allocate the port data for the event channel
> and set the handler again. Add a new interface xenevtchn_bind()
> for that purpose, available under Mini-OS only.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  tools/include/xenevtchn.h  | 11 +++++++++++
>  tools/libs/evtchn/minios.c | 17 +++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
> index 1255c85178..113a718d67 100644
> --- a/tools/include/xenevtchn.h
> +++ b/tools/include/xenevtchn.h
> @@ -173,6 +173,17 @@ int xenevtchn_unmask(xenevtchn_handle *xce, evtchn_port_t port);
>   */
>  int xenevtchn_restrict(xenevtchn_handle *xce, domid_t domid);
>  
> +/**
> + * Bind an event channel under Mini-OS.
> + *
> + * Bind an event channel specified by its known port after a kexec() of
> + * Mini-OS. This function is available under Mini-OS only!

Would guarding this prototype within "#ifdef __MINIOS__" be useful to
prevent it from been used? That would give an error earlier when
compiling, rather than later when linking a binary.

In anycase: Acked-by: Anthony PERARD <anthony.perard@vates.tech>

> + *
> + * @parm xce handle to the open evtchn interface
> + * @parm port the event channel to bind again
> + * @return 0 on success, -1 on failure with errno set appropriately.
> + */
> +int xenevtchn_bind(xenevtchn_handle *xce, evtchn_port_t port);
>  #endif
>  
>  /*

Thanks,

-- 
Anthony PERARD

