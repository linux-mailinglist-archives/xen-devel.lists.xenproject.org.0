Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95D428B1BE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 11:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5841.15218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRuRI-0000lT-Q1; Mon, 12 Oct 2020 09:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5841.15218; Mon, 12 Oct 2020 09:48:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRuRI-0000l4-Mf; Mon, 12 Oct 2020 09:48:20 +0000
Received: by outflank-mailman (input) for mailman id 5841;
 Mon, 12 Oct 2020 09:48:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K42p=DT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kRuRH-0000kz-Kp
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:48:19 +0000
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b48031dc-42de-41d2-ad4a-e23f919ac538;
 Mon, 12 Oct 2020 09:48:18 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id lw21so22321353ejb.6
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 02:48:18 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id a20sm10378289ejg.41.2020.10.12.02.48.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Oct 2020 02:48:17 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=K42p=DT=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kRuRH-0000kz-Kp
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 09:48:19 +0000
X-Inumbo-ID: b48031dc-42de-41d2-ad4a-e23f919ac538
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b48031dc-42de-41d2-ad4a-e23f919ac538;
	Mon, 12 Oct 2020 09:48:18 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id lw21so22321353ejb.6
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 02:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=gQnbn6MBOYsJAO8/g7lEu+HeG9m4dHt4A8REBchbeaw=;
        b=j80APBo2nhuqj6esymsB/CgBBZOtDpj8thFjXIVk4DR6hJpdkg/YFirXyb0MAosamm
         Gck+K15gakP7PvRCWvEsd6zGCJq01SorZg7bpgJcDbFayITohBeTH+FQulbdasj9R6zy
         mX9yNtc7XZbqxowSfvUNb6rAb2iUOVGcFur7kyvqJ1wnvEqrbRKYOtYvYufhqSqxA+CO
         P2IHVEry36lKnicfl0XiYAflAQv3MXjdl6dEs19YjmOKQ7mdVjUxkcLk714ILt8gbKtw
         smkYlWATUUJqZ2GVWhQFQFINVCyEIkBFhq3MPb7zkIvGGuy9KCZ2RwuiQBJZBOOox9rj
         VxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=gQnbn6MBOYsJAO8/g7lEu+HeG9m4dHt4A8REBchbeaw=;
        b=Dgosqf8N0G4lWYJpUCHigPn0u5syXEdVefL4sthfZiA+ixY7w2totev45grsKvZVqy
         ss/+S3BYw6qw/A1r70Ojwb0V46pEjZIBMikpoSUcvx8e4lGjcS2sISe4PPVo8wseQZod
         qP9o/TC/4U26gZ9sYNMhSQLCxOF/YpNpXuLsfUpRuPGokqXOkMYfxuY6VThMjxRtfVPW
         iQDsth9hqg2EoPtjH0mLuR8AxcpaCiqk4KgOOBhi5+D6iXDzJC314Wqd1l1qz1waLgVw
         d47NRPtfgC/sMW2MGPoLJ+PDkDg9LEAOu8pdeY4b1NvYQ6MpdPwzogJAeqHGvX/aA+LL
         q8Kw==
X-Gm-Message-State: AOAM531WBKFSbV32uUsUsf1uMUtTFA04+0g43+0jFtPeWuedthKGeLo0
	qvkONM0ULF3F8ZB7jl3R0x0=
X-Google-Smtp-Source: ABdhPJxw82uoVsIauKlzAtTWV2T7T9MvYIFW5/4N0n6COT2UwSB22pdQOC66tSmgN/gFXnEqco3Hzw==
X-Received: by 2002:a17:906:490d:: with SMTP id b13mr26734070ejq.122.1602496097762;
        Mon, 12 Oct 2020 02:48:17 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
        by smtp.gmail.com with ESMTPSA id a20sm10378289ejg.41.2020.10.12.02.48.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2020 02:48:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Jan Beulich'" <jbeulich@suse.com>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com> <20201012092740.1617-2-jgross@suse.com>
In-Reply-To: <20201012092740.1617-2-jgross@suse.com>
Subject: RE: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id together
Date: Mon, 12 Oct 2020 10:48:16 +0100
Message-ID: <001101d6a07c$cf7c7f80$6e757e80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJ57sLa/Hg8NzwnPjAH3Ul9dW38wQCnOCG/qEfhDJA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Juergen Gross
> Sent: 12 October 2020 10:28
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Jan Beulich <jbeulich@suse.com>; Julien
> Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id together
> 
> The queue for a fifo event is depending on the vcpu_id and the
> priority of the event. When sending an event it might happen the
> event needs to change queues and the old queue needs to be kept for
> keeping the links between queue elements intact. For this purpose
> the event channel contains last_priority and last_vcpu_id values
> elements for being able to identify the old queue.
> 
> In order to avoid races always access last_priority and last_vcpu_id
> with a single atomic operation avoiding any inconsistencies.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/event_fifo.c | 25 +++++++++++++++++++------
>  xen/include/xen/sched.h |  3 +--
>  2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
> index fc189152e1..fffbd409c8 100644
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -42,6 +42,14 @@ struct evtchn_fifo_domain {
>      unsigned int num_evtchns;
>  };
> 
> +union evtchn_fifo_lastq {
> +    u32 raw;
> +    struct {
> +        u8 last_priority;
> +        u16 last_vcpu_id;
> +    };
> +};

I guess you want to s/u32/uint32_t, etc. above.

> +
>  static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
>                                                         unsigned int port)
>  {
> @@ -86,16 +94,18 @@ static struct evtchn_fifo_queue *lock_old_queue(const struct domain *d,
>      struct vcpu *v;
>      struct evtchn_fifo_queue *q, *old_q;
>      unsigned int try;
> +    union evtchn_fifo_lastq lastq;
> 
>      for ( try = 0; try < 3; try++ )
>      {
> -        v = d->vcpu[evtchn->last_vcpu_id];
> -        old_q = &v->evtchn_fifo->queue[evtchn->last_priority];
> +        lastq.raw = read_atomic(&evtchn->fifo_lastq);
> +        v = d->vcpu[lastq.last_vcpu_id];
> +        old_q = &v->evtchn_fifo->queue[lastq.last_priority];
> 
>          spin_lock_irqsave(&old_q->lock, *flags);
> 
> -        v = d->vcpu[evtchn->last_vcpu_id];
> -        q = &v->evtchn_fifo->queue[evtchn->last_priority];
> +        v = d->vcpu[lastq.last_vcpu_id];
> +        q = &v->evtchn_fifo->queue[lastq.last_priority];
> 
>          if ( old_q == q )
>              return old_q;
> @@ -246,8 +256,11 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
>          /* Moved to a different queue? */
>          if ( old_q != q )
>          {
> -            evtchn->last_vcpu_id = v->vcpu_id;
> -            evtchn->last_priority = q->priority;
> +            union evtchn_fifo_lastq lastq;
> +
> +            lastq.last_vcpu_id = v->vcpu_id;
> +            lastq.last_priority = q->priority;
> +            write_atomic(&evtchn->fifo_lastq, lastq.raw);
> 

You're going to leak some stack here I think. Perhaps add a 'pad' field between 'last_priority' and 'last_vcpu_id' and zero it?

  Paul

>              spin_unlock_irqrestore(&old_q->lock, flags);
>              spin_lock_irqsave(&q->lock, flags);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index d8ed83f869..a298ff4df8 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -114,8 +114,7 @@ struct evtchn
>          u16 virq;      /* state == ECS_VIRQ */
>      } u;
>      u8 priority;
> -    u8 last_priority;
> -    u16 last_vcpu_id;
> +    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
>  #ifdef CONFIG_XSM
>      union {
>  #ifdef XSM_NEED_GENERIC_EVTCHN_SSID
> --
> 2.26.2
> 



