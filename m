Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956948813E
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 04:55:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254797.436686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n62or-0002Mb-E8; Sat, 08 Jan 2022 03:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254797.436686; Sat, 08 Jan 2022 03:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n62or-0002Ji-9k; Sat, 08 Jan 2022 03:55:05 +0000
Received: by outflank-mailman (input) for mailman id 254797;
 Sat, 08 Jan 2022 03:55:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n62op-0002Jc-WB
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 03:55:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n62oo-0002nF-P5; Sat, 08 Jan 2022 03:55:02 +0000
Received: from [5.195.40.20] (helo=[10.235.48.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n62oo-0005GP-Fd; Sat, 08 Jan 2022 03:55:02 +0000
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
	bh=FYRfsdaCx2Q43gUUko8QJbLa85UbwnZLgGISak8Tq8I=; b=vUGSlvm2ZPx+Uqt/CfyLuAAEmB
	JfNWWlSGcJsNGziQfN07iKYRMjH0aAmKaj4wm0bTgR+MAJsNpxNSjgssG0ZdMDSLaPrJ8bdiAwWN7
	r5V2HNlyODawaQIaqq1IFTwNAQptSijC8RHFDq0A+oOzuJyzVndjg8e+clWNWwSXSNwo=;
Message-ID: <3c2bb1e9-16d7-0329-9396-db7705f84ae6@xen.org>
Date: Sat, 8 Jan 2022 07:54:58 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [XEN PATCH 6/7] xenstored: do_introduce: handle the late_init
 case
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-6-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220108004912.3820176-6-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/01/2022 00:49, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> If the function is called with late_init set then also notify the domain
> using the xenstore event channel.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: wl@xen.org
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: julien@xen.org
> ---
>   tools/xenstore/xenstored_domain.c | 15 ++++++++++-----

All the changes to the protocol should be reflected in 
docs/misc/xenstore.txt. However...

>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index d03c7d93a9..17b8021ca8 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -429,7 +429,7 @@ static void domain_conn_reset(struct domain *domain)
>   
>   static struct domain *introduce_domain(const void *ctx,
>   				       unsigned int domid,
> -				       evtchn_port_t port, bool restore)
> +				       evtchn_port_t port, bool restore, bool late_init)
>   {
>   	struct domain *domain;
>   	int rc;
> @@ -461,6 +461,9 @@ static struct domain *introduce_domain(const void *ctx,
>   		/* Now domain belongs to its connection. */
>   		talloc_steal(domain->conn, domain);
>   
> +		if (late_init)
> +			xenevtchn_notify(xce_handle, domain->port);

... I am not convinced the parameter late_init is necessary. I believe 
it would be safe to always raise an event channel because a domain 
should be resilient (event channel are just to say "Please check the 
status", there are no data carried).

If you really need late_init, then it should be made optional to avoid 
breaking existing user of Xenstore (IHMO the protocol is stable and 
should be backward compatible).

Cheers,

-- 
Julien Grall

