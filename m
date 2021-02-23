Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C3322B5B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 14:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88781.167107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEXfi-0005Jf-88; Tue, 23 Feb 2021 13:24:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88781.167107; Tue, 23 Feb 2021 13:24:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEXfi-0005JE-52; Tue, 23 Feb 2021 13:24:14 +0000
Received: by outflank-mailman (input) for mailman id 88781;
 Tue, 23 Feb 2021 13:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=10EA=HZ=gmail.com=ash.j.wilding@srs-us1.protection.inumbo.net>)
 id 1lEXfg-0005J5-Cn
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 13:24:12 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a863917-e589-431b-8253-77e72fbb7cd1;
 Tue, 23 Feb 2021 13:24:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u14so22588865wri.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Feb 2021 05:24:11 -0800 (PST)
Received: from ud64051762ce75c.ant.amazon.com ([90.205.254.186])
 by smtp.googlemail.com with ESMTPSA id z2sm2701318wml.30.2021.02.23.05.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 05:24:10 -0800 (PST)
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
X-Inumbo-ID: 5a863917-e589-431b-8253-77e72fbb7cd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1qCgwT6+fcYuuNIjgXIClkAwKS8Ev4UEDiigD0oQpOs=;
        b=T55UF9K8Yu9uPckE5MDIruu+aCoc5nUirVBi3iLfHQ+JbLpD1mPKu3EqXRB9ZxQ1Cb
         ufUve26zFIP1rmFHrD0tnqQd6lyzjt1ILONZIlWQvxNHv8lWeHoSXjhchljysiThxURm
         YYXD/XoAs3Ok4IWW4fytHOLNAlaWK47XTLi4ic4D1HRhgVDDUHLc5WnRlPO6BGzmbv8Z
         hPBxEE171ePgnoZTiZxRtUAKnnLTo6PWROaysMAPwRTMnHaxbRZ001J+Sg8aTx4nA/cu
         exwGhz1Y9+24FZcJMGXjNzOM0YZjqoB+iUzzhQj8Qyblj8IWU9OhDf4MXtytmiSOkG/v
         7y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1qCgwT6+fcYuuNIjgXIClkAwKS8Ev4UEDiigD0oQpOs=;
        b=OZGVaCL2byd7AL0xc9TZIvRzhYfAMZ5XOiHIUZvj7kP3CwQcBLDZM/TC+3nt1wRvl/
         Pq/407k0QVU6NHsjfTl0sK3vrsB4uSdPG/r769qk88ZyQvp+25j0zWSW6dE6mwMbyGyo
         w+njWprFv1uq3a3xpToFlX8eTQ982B+XqddWbM1jYmcqWAmqHugCH0tD2FfiEXSoeed7
         BXJtCqjYIF2Lo0aErcGRzP/rBE97OgFqC8whu+MhxD11/ucE4YWPcPIG698qslXl1FaG
         1Y1VVZ5ZWTejgXbsHpr41/yJpHW5BkpxG2ualBHlUxOKByQU9nl1wuGy/fHEs67Q2LTX
         ajSA==
X-Gm-Message-State: AOAM530hCymKUf/aMcL3iyqOzd1Ogm8SV6yC2ieoYsfztBtfzB7vGQSM
	IZbINJOyuI8t6IgS7OWPcy8=
X-Google-Smtp-Source: ABdhPJweDBz9dctw2JqZqTOEBaZUMCVq3uDO6rdCypzWN6KU4VUQArYD+Fej3qSVBi360615r8KhDw==
X-Received: by 2002:a5d:5910:: with SMTP id v16mr26393884wrd.304.1614086650936;
        Tue, 23 Feb 2021 05:24:10 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
To: julien@xen.org
Cc: ash.j.wilding@gmail.com,
	dfaggioli@suse.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	jgrall@amazon.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: RE: [PATCH for-4.15] xen/sched: Add missing memory barrier in vcpu_block()
Date: Tue, 23 Feb 2021 13:24:08 +0000
Message-Id: <20210223132408.10283-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210220194701.24202-1-julien@xen.org>
References: <20210220194701.24202-1-julien@xen.org>

Hi Julien,

Thanks for looking at this,

> vcpu_block() is now gaining an smp_mb__after_atomic() to prevent the
> CPU to read any information about local events before the flag
> _VPF_blocked is set.

Reviewed-by: Ash Wilding <ash.j.wilding@gmail.com>


As an aside,

> I couldn't convince myself whether the Arm implementation of
> local_events_need_delivery() contains enough barrier to prevent the
> re-ordering. However, I don't think we want to play with devil here
> as the function may be optimized in the future.

Agreed.

The vgic_vcpu_pending_irq() and vgic_evtchn_irq_pending() in the call
path of local_events_need_delivery() both call spin_lock_irqsave(),
which has an arch_lock_acquire_barrier() in its call path.

That just happens to map to a heavier smp_mb() on Arm right now, but
relying on this behaviour would be shaky; I can imagine a future update
to arch_lock_acquire_barrier() that relaxes it down to just acquire
semantics like its name implies (for example an LSE-based lock_acquire()
using LDUMAXA),in which case any code incorrectly relying on that full
barrier behaviour may break. I'm guessing this is what you meant by the
function may be optimized in future?

Do we know whether there is an expectation for previous loads/stores
to have been observed before local_events_need_delivery()? I'm wondering
whether it would make sense to have an smb_mb() at the start of the
*_nomask() variant in local_events_need_delivery()'s call path.

Doing so would obviate the need for this particular patch, though would
not obviate the need to identify and fix similar set_bit() patterns.


Cheers,
Ash.


