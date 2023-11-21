Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C3F7F36CD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 20:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638137.994478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5WPh-000465-Hm; Tue, 21 Nov 2023 19:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638137.994478; Tue, 21 Nov 2023 19:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5WPh-00043t-F3; Tue, 21 Nov 2023 19:28:01 +0000
Received: by outflank-mailman (input) for mailman id 638137;
 Tue, 21 Nov 2023 19:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+imu=HC=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r5WPf-00041z-EF
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 19:27:59 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11bd7c03-88a4-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 20:27:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id ACF2B20116;
 Tue, 21 Nov 2023 20:27:54 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IoVr3EtTTkq8; Tue, 21 Nov 2023 20:27:54 +0100 (CET)
Received: from begin (unknown [46.231.241.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 7108020103;
 Tue, 21 Nov 2023 20:27:54 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r5WPZ-0000000GRES-304N; Tue, 21 Nov 2023 20:27:53 +0100
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
X-Inumbo-ID: 11bd7c03-88a4-11ee-9b0e-b553b5be7939
Date: Tue, 21 Nov 2023 20:27:53 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 2/5] Mini-OS: get own domid
Message-ID: <20231121192753.6sd6gcwu76w6lez3@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231121094953.22430-1-jgross@suse.com>
 <20231121094953.22430-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231121094953.22430-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le mar. 21 nov. 2023 10:49:50 +0100, a ecrit:
> Get the own domid via creation of a temporary event channel. There is
> no "official" way to read the own domid in PV guests, so use the event
> channel interface to get it:
> 
> - allocate an unbound event channel specifying DOMID_SELF for the
>   other end
> 
> - read the event channel status which will contain the own domid in
>   unbound.dom
> 
> - close the event channel
> 
> Signed-off-by: Juergen Gross <jgross@suse.com

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
> V2:
> - new patch
> V3:
> - rename function to get_domid() (Julien Grall)
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  events.c      | 33 +++++++++++++++++++++++++++++++++
>  include/lib.h |  3 +++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/events.c b/events.c
> index cdae90f4..4683e8e1 100644
> --- a/events.c
> +++ b/events.c
> @@ -261,6 +261,39 @@ int evtchn_get_peercontext(evtchn_port_t local_port, char *ctx, int size)
>      return rc;
>  }
>  
> +/* Replace below when a hypercall is available to get the domid. */
> +domid_t get_domid(void)
> +{
> +    int rc;
> +    domid_t domid = DOMID_INVALID;
> +    evtchn_alloc_unbound_t op;
> +    struct evtchn_status status;
> +    struct evtchn_close close;
> +
> +    op.dom = DOMID_SELF;
> +    op.remote_dom = DOMID_SELF;
> +    rc = HYPERVISOR_event_channel_op(EVTCHNOP_alloc_unbound, &op);
> +    if ( rc )
> +    {
> +        printk("ERROR: alloc_unbound failed with rc=%d", rc);
> +        return domid;
> +    }
> +
> +    status.dom = DOMID_SELF;
> +    status.port = op.port;
> +    rc = HYPERVISOR_event_channel_op(EVTCHNOP_status, &status);
> +    if ( rc )
> +        printk("ERROR: EVTCHNOP_status failed with rc=%d", rc);
> +    else
> +        domid = status.u.unbound.dom;
> +
> +    close.port = op.port;
> +    rc = HYPERVISOR_event_channel_op(EVTCHNOP_close, &close);
> +    if ( rc )
> +        printk("WARN: close_port %d failed rc=%d. ignored\n", close.port, rc);
> +
> +    return domid;
> +}
>  
>  /*
>   * Local variables:
> diff --git a/include/lib.h b/include/lib.h
> index fd8c36de..dd68985a 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -154,6 +154,9 @@ do {                                                           \
>  /* Consistency check as much as possible. */
>  void sanity_check(void);
>  
> +/* Get own domid. */
> +domid_t get_domid(void);
> +
>  #ifdef HAVE_LIBC
>  extern struct wait_queue_head event_queue;
>  
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

