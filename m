Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0427D3EF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 18:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308.849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNIqM-0001LK-DK; Tue, 29 Sep 2020 16:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308.849; Tue, 29 Sep 2020 16:51:10 +0000
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
	id 1kNIqM-0001Kv-9l; Tue, 29 Sep 2020 16:51:10 +0000
Received: by outflank-mailman (input) for mailman id 308;
 Tue, 29 Sep 2020 16:51:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNIqK-0001Kq-SE
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 16:51:08 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b8855a1-b61c-45b1-b7db-65c69236b646;
 Tue, 29 Sep 2020 16:51:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o5so6166732wrn.13
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 09:51:07 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id u8sm5988706wmj.45.2020.09.29.09.51.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 29 Sep 2020 09:51:06 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zis1=DG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNIqK-0001Kq-SE
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 16:51:08 +0000
X-Inumbo-ID: 1b8855a1-b61c-45b1-b7db-65c69236b646
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1b8855a1-b61c-45b1-b7db-65c69236b646;
	Tue, 29 Sep 2020 16:51:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o5so6166732wrn.13
        for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2020 09:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=TsuaK9SoSUG0c3go0+BvwfW+5IxTsSX3eyGauBMQKLw=;
        b=VgeK0gN0f/e9yHlNrhUfL1f4eX1TxN/uJ1BN3Xt59/DbXt6vpObYN1IpoZGXWQ+5bP
         6cqHRyPBgl/w3UTLQivzCrZcJTY1Lv+04kJGcxcBf5mNCFpDkhYOTC/OcImqC9OzXac2
         SAHSQDV63nSBablWvCbp1WpfTF/IZ2+Plhy8/hIZwFMRkMpPR2PpQNktH6m+m98rSL+I
         5HgcD94cxOqOWtjQYweLYeU7bsLuo4ym8+EJtV/6wEcTn4g/g9XYrIdILb7Jwtq/qa7W
         c0gD3Ce4RUZstHJvs2cpM/oe2fJmaVeOQHqUXS/SFPP2Lh65a7Ldz8k9VXlm4XT3D9ES
         Urtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=TsuaK9SoSUG0c3go0+BvwfW+5IxTsSX3eyGauBMQKLw=;
        b=RJEAnO87IyNdkaYk7NbNMJqC3Svn2sAxgd3lUVuRh11IzBb7LNHfCbfBQQBOLDEH8Y
         nWyOko2pEeuEqvY1ALsQVKVm5lSKF97iOQui93O2DWHtmVPgFn2noz0gulfFKm+2UfJe
         AM93eCTwKjc4uwJYukjB42IK6Aux1zM1Z5V5/hss7mOssV4TFd+JFcJeCcqMWUSaqgun
         JANxghuoevuGju7USHTcggRvfkFa1+nqa+BKXt2DgO9sIgeqw8smDrMkK6YuZn+4W7pa
         68r36p3ZFgoaqoFIenGwEVWGAviDptFAlIB7V9vtoXppi38CNoU9hhqbv6dwZL+guDBr
         KMlw==
X-Gm-Message-State: AOAM5315Wk4L3IqYHJMNmB0rJ1b8bw0EgCVWpf4TiS9VHwXTUTPFIlDQ
	7Eog/SQo5Sqreh3FRs6jU0Y=
X-Google-Smtp-Source: ABdhPJz5TdkEnMrny6ouoGPiop6hSRuvBnTzDkHfKa9EN/ZbrTkOlgExpMYsxMhis94SNEwVYUrL7Q==
X-Received: by 2002:a5d:69cd:: with SMTP id s13mr5211225wrw.379.1601398266733;
        Tue, 29 Sep 2020 09:51:06 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-225.amazon.com. [54.240.197.225])
        by smtp.gmail.com with ESMTPSA id u8sm5988706wmj.45.2020.09.29.09.51.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 09:51:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Dario Faggioli'" <dfaggioli@suse.com>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
In-Reply-To: <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
Subject: RE: [PATCH 05/12] evtchn/sched: reject poll requests for unusable ports
Date: Tue, 29 Sep 2020 17:51:04 +0100
Message-ID: <002501d69680$b935a810$2ba0f830$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgIOCjP2qTdRtKA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 11:59
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>; Dario Faggioli <dfaggioli@suse.com>
> Subject: [PATCH 05/12] evtchn/sched: reject poll requests for unusable ports
> 
> Before and after XSA-342 there has been an asymmetry in how not really
> usable ports get treated in do_poll(): Ones beyond a certain boundary
> (max_evtchns originally, valid_evtchns subsequently) did get refused
> with -EINVAL, while lower ones were accepted despite there potentially
> being no way to wake the vCPU again from its polling state. Arrange to
> also honor evtchn_usable() output in the decision.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> 
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1427,13 +1427,13 @@ static long do_poll(struct sched_poll *s
>          if ( __copy_from_guest_offset(&port, sched_poll->ports, i, 1) )
>              goto out;
> 
> -        rc = -EINVAL;
> -        if ( !port_is_valid(d, port) )
> -            goto out;
> -
> -        rc = 0;
> -        if ( evtchn_port_is_pending(d, port) )
> +        rc = evtchn_port_poll(d, port);
> +        if ( rc )
> +        {
> +            if ( rc > 0 )
> +                rc = 0;
>              goto out;
> +        }
>      }
> 
>      if ( sched_poll->nr_ports == 1 )
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -240,19 +240,6 @@ static inline bool evtchn_is_pending(con
>      return evtchn_usable(evtchn) && d->evtchn_port_ops->is_pending(d, evtchn);
>  }
> 
> -static inline bool evtchn_port_is_pending(struct domain *d, evtchn_port_t port)
> -{
> -    struct evtchn *evtchn = evtchn_from_port(d, port);
> -    bool rc;
> -    unsigned long flags;
> -
> -    spin_lock_irqsave(&evtchn->lock, flags);
> -    rc = evtchn_is_pending(d, evtchn);
> -    spin_unlock_irqrestore(&evtchn->lock, flags);
> -
> -    return rc;
> -}
> -
>  static inline bool evtchn_is_masked(const struct domain *d,
>                                      const struct evtchn *evtchn)
>  {
> @@ -279,6 +266,24 @@ static inline bool evtchn_is_busy(const
>             d->evtchn_port_ops->is_busy(d, evtchn);
>  }
> 
> +static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)
> +{
> +    int rc = -EINVAL;
> +
> +    if ( port_is_valid(d, port) )
> +    {
> +        struct evtchn *evtchn = evtchn_from_port(d, port);
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&evtchn->lock, flags);
> +        if ( evtchn_usable(evtchn) )
> +            rc = evtchn_is_pending(d, evtchn);
> +        spin_unlock_irqrestore(&evtchn->lock, flags);
> +    }
> +
> +    return rc;
> +}
> +
>  static inline int evtchn_port_set_priority(struct domain *d,
>                                             struct evtchn *evtchn,
>                                             unsigned int priority)
> 



