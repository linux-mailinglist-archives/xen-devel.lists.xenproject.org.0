Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 809CD554E9D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 17:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354088.581116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41v1-0005Jn-8b; Wed, 22 Jun 2022 15:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354088.581116; Wed, 22 Jun 2022 15:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41v1-0005GW-4d; Wed, 22 Jun 2022 15:05:23 +0000
Received: by outflank-mailman (input) for mailman id 354088;
 Wed, 22 Jun 2022 15:05:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o41uy-0005GQ-Rk
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 15:05:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o41uy-0006sJ-8S; Wed, 22 Jun 2022 15:05:20 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o41uy-0002yF-1P; Wed, 22 Jun 2022 15:05:20 +0000
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
	bh=BFCMwyrNPp2qFe9FX3HCPNNL5Vv2AAfhhxTeX/ShkmI=; b=B77U3qPZF7i/8twLir5wK0ZuRg
	MDUE5YPwGC7bWb6JoT9O18DECLB7KFOn0hG716ObwrPkhiHTlyyzXNsEUGgKrvO3eAWauq8VSEGnh
	CW3rASEo2giW1LRHrfzoKD7T5gy4XYdeIJ4Mrfc9YtBEgdElmdqNbULgEWK3I9Mqp37k=;
Message-ID: <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
Date: Wed, 22 Jun 2022 16:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/06/2022 15:38, Rahul Singh wrote:
> Guest can request the Xen to close the event channels. Ignore the
> request from guest to close the static channels as static event channels
> should not be closed.

Why do you want to prevent the guest to close static ports? The problem 
I can see is...

[...]

> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index 84f0055a5a..cedc98ccaf 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -294,7 +294,8 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>    * If port is zero get the next free port and allocate. If port is non-zero
>    * allocate the specified port.
>    */
> -int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port,
> +                         bool is_static)
>   {
>       struct evtchn *chn;
>       struct domain *d;
> @@ -330,6 +331,7 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
>       evtchn_write_lock(chn);
>   
>       chn->state = ECS_UNBOUND;
> +    chn->is_static = is_static;
>       if ( (chn->u.unbound.remote_domid = alloc->remote_dom) == DOMID_SELF )
>           chn->u.unbound.remote_domid = current->domain->domain_id;
>       evtchn_port_init(d, chn);
> @@ -368,7 +370,7 @@ static void double_evtchn_unlock(struct evtchn *lchn, struct evtchn *rchn)
>    * allocate the specified lport.
>    */
>   int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
> -                            evtchn_port_t lport)
> +                            evtchn_port_t lport, bool is_static)
>   {
>       struct evtchn *lchn, *rchn;
>       struct domain *rd;
> @@ -423,6 +425,7 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
>       lchn->u.interdomain.remote_dom  = rd;
>       lchn->u.interdomain.remote_port = rport;
>       lchn->state                     = ECS_INTERDOMAIN;
> +    lchn->is_static                 = is_static;
>       evtchn_port_init(ld, lchn);
>       
>       rchn->u.interdomain.remote_dom  = ld;
> @@ -659,6 +662,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
>           rc = -EINVAL;
>           goto out;
>       }
> +    /* Guest cannot close a static event channel. */
> +    if ( chn1->is_static && guest )
> +        goto out;

... at least the interdomain structure store pointer to the domain. I am 
a bit concerned that we would end up to leave dangling pointers (such as 
chn->u.interdomain.remote_domain) as evtchn_close() is also used while 
destroying the domain.

Also, AFAICT Xen will return 0 (i.e. success) to the caller. I think 
this is a mistake because we didn't close the port as requested.

Cheers,

-- 
Julien Grall

