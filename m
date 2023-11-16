Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA167EE57B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 17:49:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634514.990025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3fXc-0003mc-SR; Thu, 16 Nov 2023 16:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634514.990025; Thu, 16 Nov 2023 16:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3fXc-0003kv-Pj; Thu, 16 Nov 2023 16:48:32 +0000
Received: by outflank-mailman (input) for mailman id 634514;
 Thu, 16 Nov 2023 16:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3aAy=G5=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1r3fXb-0003kp-Pu
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 16:48:31 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8dbb85f-849f-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 17:48:30 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c51682fddeso23339611fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 08:48:30 -0800 (PST)
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
X-Inumbo-ID: f8dbb85f-849f-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1700153310; x=1700758110; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSIn+dRSpxIKS0rwox3CNlHfwQbAw5iB///8MwoXY+E=;
        b=OIF0lHqjnAyXk8cARI1zJDNKfEqN3/I8x92qfj0Yp4gauCM3Ovvh3+Qg+9h2137P7p
         /15bCpRCYqUQWoMLmFU8QKBCz4FAb9B8ZOi9g4QVsKR51rt5Y5wng/jK3qSVerzMSR1O
         1ILkRYvcElqL3iGvr6B/9LpRXNQtIrBOrsTqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700153310; x=1700758110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSIn+dRSpxIKS0rwox3CNlHfwQbAw5iB///8MwoXY+E=;
        b=IwgSwtiI74kaQNhR5Wcdx27NX81J8ux91fnSEaKlkgvU9RQgkGZGV4r8LgP/XzpjdO
         MGD0MymW1EG+S0Up6l1QIgD/spghXo9ryDmt+pg0YxpZkFon3B2yvUxRBq6b4xbJNX7T
         6kIcdnlIHfdS2aaigaR7B2lbqOMIRrdMOW/7ZzZelKmu8f6AEfvwhJAKEL2LD7qx8C18
         x3fy5lyUblr3VzD5FFVTmn2KqXS6ehz8/gqDsPiF9T7QZpiKCbnAVzRpX/eXa4/3iC2g
         h7BxLUcGWbTsdh8wQWw3GghPqUVMh/QhXlemnYj1Y+brWH+ht4slFaix77HDRzIGWwpY
         70vA==
X-Gm-Message-State: AOJu0YwY7KhCjgrouzQr85jud15sfj844cwAp4eGAjxSjvHVdAP6CSP6
	spGxUp/xaBH2XhmYNRqi6H+lgL9qOr/phupdhBjR6w==
X-Google-Smtp-Source: AGHT+IH56unoY1QAqhM0jSwdBGp80mhf/LyW1T0JTTDeslXzzyi2waNLYHXIFFHodWAaM4iDnT/9u4Jk8eKDf2UFmNM=
X-Received: by 2002:a05:651c:4d2:b0:2c5:2d7:40b with SMTP id
 e18-20020a05651c04d200b002c502d7040bmr1207228lji.26.1700153309968; Thu, 16
 Nov 2023 08:48:29 -0800 (PST)
MIME-Version: 1.0
References: <20231114133003.20887-1-jgross@suse.com>
In-Reply-To: <20231114133003.20887-1-jgross@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 16 Nov 2023 16:48:19 +0000
Message-ID: <CA+zSX=YW4ezSGD_Wf8LiOznTxQgdjLaQddzV7G7Udi5qayVDUA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/sched: fix sched_move_domain()
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, 
	Henry Wang <Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 1:30=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
>
> When moving a domain out of a cpupool running with the credit2
> scheduler and having multiple run-queues, the following ASSERT() can
> be observed:
>
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04023a700>] R credit2.c#csched2_unit_remove+0xe3/0xe7
> (XEN)    [<ffff82d040246adb>] S sched_move_domain+0x2f3/0x5b1
> (XEN)    [<ffff82d040234cf7>] S cpupool.c#cpupool_move_domain_locked+0x1d=
/0x3b
> (XEN)    [<ffff82d040236025>] S cpupool_move_domain+0x24/0x35
> (XEN)    [<ffff82d040206513>] S domain_kill+0xa5/0x116
> (XEN)    [<ffff82d040232b12>] S do_domctl+0xe5f/0x1951
> (XEN)    [<ffff82d0402276ba>] S timer.c#timer_lock+0x69/0x143
> (XEN)    [<ffff82d0402dc71b>] S pv_hypercall+0x44e/0x4a9
> (XEN)    [<ffff82d0402012b7>] S lstar_enter+0x137/0x140
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 1:
> (XEN) Assertion 'svc->rqd =3D=3D c2rqd(sched_unit_master(unit))' failed a=
t common/sched/credit2.c:1159
> (XEN) ****************************************
>
> This is happening as sched_move_domain() is setting a different cpu
> for a scheduling unit without telling the scheduler. When this unit is
> removed from the scheduler, the ASSERT() will trigger.
>
> In non-debug builds the result is usually a clobbered pointer, leading
> to another crash a short time later.
>
> Fix that by swapping the two involved actions (setting another cpu and
> removing the unit from the scheduler).
>
> Cc: Henry Wang <Henry.Wang@arm.com>
> Link: https://github.com/Dasharo/dasharo-issues/issues/488
> Fixes: 70fadc41635b ("xen/cpupool: support moving domain between cpupools=
 with different granularity")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - added Link: (reporter didn't want to be added by name)
> ---
>  xen/common/sched/core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 12deefa745..e9f7486197 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -738,12 +738,13 @@ int sched_move_domain(struct domain *d, struct cpup=
ool *c)
>      new_p =3D cpumask_first(d->cpupool->cpu_valid);

There's a comment just above here which should probably be updated;
something like "Remove all units from the old scheduler, and
temporarily move them to the same processor to make locking easier
when moving the new units to nwe processors."

With that change:

Reviewed-by: George Dunlap <george.dunlap@cloud.com>

I could change that on check-if you'd like.

I take it at this point this is just for the 4.19 branch, and this
will be a candidate for backport to 4.18.1?

 -George

