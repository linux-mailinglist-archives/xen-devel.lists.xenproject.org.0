Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3167EA5B2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632022.985885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2f2N-0005On-Kp; Mon, 13 Nov 2023 22:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632022.985885; Mon, 13 Nov 2023 22:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2f2N-0005Li-Hg; Mon, 13 Nov 2023 22:04:07 +0000
Received: by outflank-mailman (input) for mailman id 632022;
 Mon, 13 Nov 2023 22:04:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r2f2M-0005Lc-1U
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:04:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2f2L-0002fG-BC; Mon, 13 Nov 2023 22:04:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2f2L-0002x4-6O; Mon, 13 Nov 2023 22:04:05 +0000
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
	bh=bKEvVTgAWl7vU9e/e1LuY9pdTLgdtAsisf2AnHR/10k=; b=wwUEGhgUwedgYFAdcL/XdUVXb9
	4f5flB9HL9PkFUaAFasx2zVwWywCbPF6JDqEUVB9M3lByC2iLtL1VnArzaznRy5XXvJME+Uj33NUG
	ymDNfeJ0li8xEFuryGonlYCBilW+lLpXYS94YkZbixzItsfYtJk5D64HKH8F1aTR42uU=;
Message-ID: <3df5d15e-c42d-4e95-bbea-41969a0b2b5e@xen.org>
Date: Mon, 13 Nov 2023 22:04:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/29] tools/xenstored: map stubdom interface
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-26-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231110160804.29021-26-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/11/2023 16:08, Juergen Gross wrote:
> When running as stubdom, map the stubdom's Xenstore ring page in order
> to support using the 9pfs frontend.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstored/core.c   |  2 ++
>   tools/xenstored/domain.c | 27 ++++++++++++++++++++++++++-
>   tools/xenstored/domain.h |  1 +
>   3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
> index b9ec50b34c..4a9d874f17 100644
> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -2991,6 +2991,8 @@ int main(int argc, char *argv[])
>   		lu_read_state();
>   #endif
>   
> +	stubdom_init();
> +
>   	check_store();
>   
>   	/* Get ready to listen to the tools. */
> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index fa17f68618..162b87b460 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -37,6 +37,10 @@
>   #include <xenctrl.h>
>   #include <xen/grant_table.h>
>   
> +#ifdef __MINIOS__
> +#include <mini-os/xenbus.h>
> +#endif
> +
>   static xc_interface **xc_handle;
>   xengnttab_handle **xgt_handle;
>   static evtchn_port_t virq_port;
> @@ -500,6 +504,11 @@ static void *map_interface(domid_t domid)
>   	if (domid == xenbus_master_domid())
>   		return xenbus_map();
>   
> +#ifdef __MINIOS__
> +	if (domid == stub_domid)
> +		return xenstore_buf;
> +#endif
> +
>   	return xengnttab_map_grant_ref(*xgt_handle, domid,
>   				       GNTTAB_RESERVED_XENSTORE,
>   				       PROT_READ|PROT_WRITE);
> @@ -509,7 +518,7 @@ static void unmap_interface(domid_t domid, void *interface)
>   {
>   	if (domid == xenbus_master_domid())
>   		unmap_xenbus(interface);
> -	else
> +	else if (domid != stub_domid)
>   		xengnttab_unmap(*xgt_handle, interface, 1);
>   }
>   
> @@ -1214,6 +1223,22 @@ void dom0_init(void)
>   	xenevtchn_notify(xce_handle, dom0->port);
>   }
>   
> +void stubdom_init(void)
> +{
> +#ifdef __MINIOS__
> +	struct domain *stubdom;
> +
> +	if (stub_domid < 0)
> +		return;
> +
> +	stubdom = introduce_domain(NULL, stub_domid, xenbus_evtchn, false);
> +	if (!stubdom)
> +		barf_perror("Failed to initialize stubdom");
> +
> +	xenevtchn_notify(xce_handle, stubdom->port);

If I compare to introduce_domain(), it is not entirely clear to me why 
the notification is done unconditionally here. Can you clarify?

> +#endif
> +}
> +
>   static unsigned int domhash_fn(const void *k)
>   {
>   	return *(const unsigned int *)k;
> diff --git a/tools/xenstored/domain.h b/tools/xenstored/domain.h
> index 6c00540311..49c60c56bf 100644
> --- a/tools/xenstored/domain.h
> +++ b/tools/xenstored/domain.h
> @@ -85,6 +85,7 @@ int do_reset_watches(const void *ctx, struct connection *conn,
>   void domain_static_init(void);
>   void domain_init(int evtfd);
>   void dom0_init(void);
> +void stubdom_init(void);
>   void domain_deinit(void);
>   void ignore_connection(struct connection *conn, unsigned int err);
>   

Cheers,

-- 
Julien Grall

