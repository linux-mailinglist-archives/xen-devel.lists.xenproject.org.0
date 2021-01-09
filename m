Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E612F0190
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 17:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64236.113640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyH9U-0001cH-0T; Sat, 09 Jan 2021 16:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64236.113640; Sat, 09 Jan 2021 16:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyH9T-0001bs-Sc; Sat, 09 Jan 2021 16:31:43 +0000
Received: by outflank-mailman (input) for mailman id 64236;
 Sat, 09 Jan 2021 16:31:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kyH9S-0001bn-LB
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 16:31:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyH9Q-0003tB-BR; Sat, 09 Jan 2021 16:31:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kyH9P-00048I-TW; Sat, 09 Jan 2021 16:31:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=qfMlg+iG/gh9uYWvX+gIXRh/PNyrZH1nvRYXxxYgwAo=; b=biGCs7R8+JpjLaPDx24QihHsz5
	mFQnLjmyoU6csE0BlVS+kPlJkiIDJ/pCvqKt28I4iRnbTR1uUPrkx/qsxbqX9GR7FSvS3+Vy8gH5I
	5EFsJs1CcJ1xxe/FZeYukki7AmgPgpkA+vE4oZSBnjlxG84L9gpXx1HU7cY2wwzd0rSQ=;
Subject: Re: [PATCH v4 07/10] evtchn: add helper for port_is_valid() +
 evtchn_from_port()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
 <a2f29b53-c79a-6440-fcaa-97ad28bab0b5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6ed19357-cc6e-c100-07bf-020eea916da1@xen.org>
Date: Sat, 9 Jan 2021 16:31:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a2f29b53-c79a-6440-fcaa-97ad28bab0b5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2021 13:12, Jan Beulich wrote:
> The combination is pretty common, so adding a simple local helper seems
> worthwhile. Make it const- and type-correct, in turn requiring the
> two called function to also be const-correct (and at this occasion also
> make them type-correct).

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v4: New.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -147,6 +147,11 @@ static bool virq_is_global(unsigned int
>       return true;
>   }
>   
> +static struct evtchn *_evtchn_from_port(const struct domain *d,
> +                                        evtchn_port_t port)
> +{
> +    return port_is_valid(d, port) ? evtchn_from_port(d, port) : NULL;
> +}
>   
>   static struct evtchn *alloc_evtchn_bucket(struct domain *d, unsigned int port)
>   {
> @@ -361,9 +366,9 @@ static long evtchn_bind_interdomain(evtc
>           ERROR_EXIT(lport);
>       lchn = evtchn_from_port(ld, lport);
>   
> -    if ( !port_is_valid(rd, rport) )
> +    rchn = _evtchn_from_port(rd, rport);
> +    if ( !rchn )
>           ERROR_EXIT_DOM(-EINVAL, rd);
> -    rchn = evtchn_from_port(rd, rport);
>   
>       double_evtchn_lock(lchn, rchn);
>   
> @@ -600,15 +605,12 @@ static long evtchn_bind_pirq(evtchn_bind
>   int evtchn_close(struct domain *d1, int port1, bool guest)
>   {
>       struct domain *d2 = NULL;
> -    struct evtchn *chn1, *chn2;
> -    int            port2;
> +    struct evtchn *chn1 = _evtchn_from_port(d1, port1), *chn2;
>       long           rc = 0;
>   
> -    if ( !port_is_valid(d1, port1) )
> +    if ( !chn1 )
>           return -EINVAL;
>   
> -    chn1 = evtchn_from_port(d1, port1);
> -
>    again:
>       write_lock(&d1->event_lock);
>   
> @@ -695,10 +697,8 @@ int evtchn_close(struct domain *d1, int
>               goto out;
>           }
>   
> -        port2 = chn1->u.interdomain.remote_port;
> -        BUG_ON(!port_is_valid(d2, port2));
> -
> -        chn2 = evtchn_from_port(d2, port2);
> +        chn2 = _evtchn_from_port(d2, chn1->u.interdomain.remote_port);
> +        BUG_ON(!chn2);
>           BUG_ON(chn2->state != ECS_INTERDOMAIN);
>           BUG_ON(chn2->u.interdomain.remote_dom != d1);
>   
> @@ -736,15 +736,13 @@ int evtchn_close(struct domain *d1, int
>   
>   int evtchn_send(struct domain *ld, unsigned int lport)
>   {
> -    struct evtchn *lchn, *rchn;
> +    struct evtchn *lchn = _evtchn_from_port(ld, lport), *rchn;
>       struct domain *rd;
>       int            rport, ret = 0;
>   
> -    if ( !port_is_valid(ld, lport) )
> +    if ( !lchn )
>           return -EINVAL;
>   
> -    lchn = evtchn_from_port(ld, lport);
> -
>       evtchn_read_lock(lchn);
>   
>       /* Guest cannot send via a Xen-attached event channel. */
> @@ -956,7 +954,6 @@ int evtchn_status(evtchn_status_t *statu
>   {
>       struct domain   *d;
>       domid_t          dom = status->dom;
> -    int              port = status->port;
>       struct evtchn   *chn;
>       long             rc = 0;
>   
> @@ -964,14 +961,13 @@ int evtchn_status(evtchn_status_t *statu
>       if ( d == NULL )
>           return -ESRCH;
>   
> -    if ( !port_is_valid(d, port) )
> +    chn = _evtchn_from_port(d, status->port);
> +    if ( !chn )
>       {
>           rcu_unlock_domain(d);
>           return -EINVAL;
>       }
>   
> -    chn = evtchn_from_port(d, port);
> -
>       evtchn_read_lock(chn);
>   
>       if ( consumer_is_xen(chn) )
> @@ -1036,11 +1032,10 @@ long evtchn_bind_vcpu(unsigned int port,
>       if ( (v = domain_vcpu(d, vcpu_id)) == NULL )
>           return -ENOENT;
>   
> -    if ( !port_is_valid(d, port) )
> +    chn = _evtchn_from_port(d, port);
> +    if ( !chn )
>           return -EINVAL;
>   
> -    chn = evtchn_from_port(d, port);
> -
>       write_lock(&d->event_lock);
>   
>       /* Guest cannot re-bind a Xen-attached event channel. */
> @@ -1086,13 +1081,11 @@ long evtchn_bind_vcpu(unsigned int port,
>   int evtchn_unmask(unsigned int port)
>   {
>       struct domain *d = current->domain;
> -    struct evtchn *evtchn;
> +    struct evtchn *evtchn = _evtchn_from_port(d, port);
>   
> -    if ( unlikely(!port_is_valid(d, port)) )
> +    if ( unlikely(!evtchn) )
>           return -EINVAL;
>   
> -    evtchn = evtchn_from_port(d, port);
> -
>       evtchn_read_lock(evtchn);
>   
>       evtchn_port_unmask(d, evtchn);
> @@ -1175,14 +1168,12 @@ static long evtchn_set_priority(const st
>   {
>       struct domain *d = current->domain;
>       unsigned int port = set_priority->port;
> -    struct evtchn *chn;
> +    struct evtchn *chn = _evtchn_from_port(d, port);
>       long ret;
>   
> -    if ( !port_is_valid(d, port) )
> +    if ( !chn )
>           return -EINVAL;
>   
> -    chn = evtchn_from_port(d, port);
> -
>       evtchn_read_lock(chn);
>   
>       ret = evtchn_port_set_priority(d, chn, set_priority->priority);
> @@ -1408,10 +1399,10 @@ void free_xen_event_channel(struct domai
>   
>   void notify_via_xen_event_channel(struct domain *ld, int lport)
>   {
> -    struct evtchn *lchn, *rchn;
> +    struct evtchn *lchn = _evtchn_from_port(ld, lport), *rchn;
>       struct domain *rd;
>   
> -    if ( !port_is_valid(ld, lport) )
> +    if ( !lchn )
>       {
>           /*
>            * Make sure ->is_dying is read /after/ ->valid_evtchns, pairing
> @@ -1422,8 +1413,6 @@ void notify_via_xen_event_channel(struct
>           return;
>       }
>   
> -    lchn = evtchn_from_port(ld, lport);
> -
>       if ( !evtchn_read_trylock(lchn) )
>           return;
>   
> @@ -1577,16 +1566,17 @@ static void domain_dump_evtchn_info(stru
>              "Polling vCPUs: {%*pbl}\n"
>              "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
>   
> -    for ( port = 1; port_is_valid(d, port); ++port )
> +    for ( port = 1; ; ++port )
>       {
> -        struct evtchn *chn;
> +        struct evtchn *chn = _evtchn_from_port(d, port);
>           char *ssid;
>   
> +        if ( !chn )
> +            break;
> +
>           if ( !(port & 0x3f) )
>               process_pending_softirqs();
>   
> -        chn = evtchn_from_port(d, port);
> -
>           if ( !evtchn_read_trylock(chn) )
>           {
>               printk("    %4u in flux\n", port);
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -120,7 +120,7 @@ static inline void evtchn_read_unlock(st
>       read_unlock(&evtchn->lock);
>   }
>   
> -static inline bool_t port_is_valid(struct domain *d, unsigned int p)
> +static inline bool port_is_valid(const struct domain *d, evtchn_port_t p)
>   {
>       if ( p >= read_atomic(&d->valid_evtchns) )
>           return false;
> @@ -135,7 +135,8 @@ static inline bool_t port_is_valid(struc
>       return true;
>   }
>   
> -static inline struct evtchn *evtchn_from_port(struct domain *d, unsigned int p)
> +static inline struct evtchn *evtchn_from_port(const struct domain *d,
> +                                              evtchn_port_t p)
>   {
>       if ( p < EVTCHNS_PER_BUCKET )
>           return &d->evtchn[array_index_nospec(p, EVTCHNS_PER_BUCKET)];
> 

-- 
Julien Grall

