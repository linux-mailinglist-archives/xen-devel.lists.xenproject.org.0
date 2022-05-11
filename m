Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933D523CFB
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 21:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327207.549964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nora0-0006l3-NJ; Wed, 11 May 2022 19:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327207.549964; Wed, 11 May 2022 19:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nora0-0006iQ-Jr; Wed, 11 May 2022 19:01:00 +0000
Received: by outflank-mailman (input) for mailman id 327207;
 Wed, 11 May 2022 19:00:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1norZz-0006iK-IV
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 19:00:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1norZy-0005ZN-EA; Wed, 11 May 2022 19:00:58 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1norZy-0007rj-7H; Wed, 11 May 2022 19:00:58 +0000
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
	bh=FY8W0brpfN+Q1rQaT8fXTSGJxBRp3nDmMa2AIYvXzpY=; b=6v+EItmRIZ8azjcSyhRprTRB5x
	nTUzcNgNbo4vAoSc49bMrwRsTtn670mBOexDdmpdAOfXIIrKq2O/PkwXPSxOZ6ongOYWhL0WZkDjE
	CRhN2MxC3k+mNA+rU+mK7As+5qGx6loY4JdU9TaKsfwoB/4u/WZaYOCv1944Yb1bY3h8=;
Message-ID: <0f4ef9bc-4089-6419-5373-13b0abdf5fd3@xen.org>
Date: Wed, 11 May 2022 20:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 5/7] xenstored: send an evtchn notification on
 introduce_domain
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 anthony.perard@citrix.com, wl@xen.org
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-5-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220505001656.395419-5-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/05/2022 01:16, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> When xs_introduce_domain is called, send out a notification on the
> xenstore event channel so that any (dom0less) domain waiting for the
> xenstore interface to be ready can continue with the initialization.
> Before sending the notification, clear XENSTORE_RECONNECTING.
> 
> The extra notification is harmless for domains that don't require it.
> 
> In xs_wire.h update the commment on top of XENSTORE_RECONNECTING to
> generalize its meaning to suit the dom0less use-case better.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: jgross@suse.com
> CC: anthony.perard@citrix.com
> CC: wl@xen.org
> ---
> If you have better suggestions for the wording in xs_wire.h please
> suggest!
> 
> 
> Changes in v6:
> - use XENSTORE_CONNECTED instead of 0x0
> - update xs_wire.h
> 
> Changes in v5:
> - reset XS_CONNECTION_STATE_RECONNECTING before notifying the domU
> 
> Changes in v2:
> - drop the new late_init parameter
> ---
>   tools/xenstore/xenstored_domain.c | 4 ++++
>   xen/include/public/io/xs_wire.h   | 2 +-

I am not entirely sure this is the right place to mention it. But I 
couldn't find a better one.

The documentation (docs/misc/xenstore-misc.txt) states that the field is 
valid when the server advertised ``Connection State``.

Is there any guarantee the field will be 0 for any previous {C, 
O}xenstored implementation? If not, then I think we need to set the 
feature flag so Linux knows the field can be used.

If yes, then the documentation should be relaxed so an OS knows it can 
safely use the field without checking the feature flag.

>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index ae065fcbee..6f34af225c 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -493,6 +493,10 @@ static struct domain *introduce_domain(const void *ctx,
>   		/* Now domain belongs to its connection. */
>   		talloc_steal(domain->conn, domain);
>   
> +		/* Notify the domain that xenstore is available */
> +		interface->connection = XENSTORE_CONNECTED;
> +		xenevtchn_notify(xce_handle, domain->port);
> +
>   		if (!is_master_domain && !restore)
>   			fire_watches(NULL, ctx, "@introduceDomain", NULL,
>   				     false, NULL);
> diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
> index 953a0050a3..c1ec7c73e3 100644
> --- a/xen/include/public/io/xs_wire.h
> +++ b/xen/include/public/io/xs_wire.h
> @@ -141,7 +141,7 @@ struct xenstore_domain_interface {
>   
>   /* Valid values for the connection field */
>   #define XENSTORE_CONNECTED 0 /* the steady-state */
> -#define XENSTORE_RECONNECT 1 /* guest has initiated a reconnect */
> +#define XENSTORE_RECONNECT 1 /* reconnect in progress */

The definition in the docs needs to be updated.

>   
>   /* Valid values for the error field */
>   #define XENSTORE_ERROR_NONE    0 /* No error */

Cheers,

-- 
Julien Grall

