Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072E540FA19
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 16:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189452.339163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mREkw-0004RQ-Cn; Fri, 17 Sep 2021 14:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189452.339163; Fri, 17 Sep 2021 14:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mREkw-0004Oh-91; Fri, 17 Sep 2021 14:22:22 +0000
Received: by outflank-mailman (input) for mailman id 189452;
 Fri, 17 Sep 2021 14:22:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ph2s=OH=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1mREku-0004Ob-VD
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 14:22:20 +0000
Received: from MTA-06-4.privateemail.com (unknown [198.54.122.56])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaa55fce-17c2-11ec-b6ba-12813bfff9fa;
 Fri, 17 Sep 2021 14:22:20 +0000 (UTC)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
 by mta-06.privateemail.com (Postfix) with ESMTP id 3E1401800209
 for <xen-devel@lists.xenproject.org>; Fri, 17 Sep 2021 10:22:19 -0400 (EDT)
Received: from mail-wr1-f51.google.com (unknown [10.20.151.230])
 by mta-06.privateemail.com (Postfix) with ESMTPA id 254A41800200
 for <xen-devel@lists.xenproject.org>; Fri, 17 Sep 2021 10:22:19 -0400 (EDT)
Received: by mail-wr1-f51.google.com with SMTP id t18so15549490wrb.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 Sep 2021 07:22:19 -0700 (PDT)
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
X-Inumbo-ID: aaa55fce-17c2-11ec-b6ba-12813bfff9fa
X-Gm-Message-State: AOAM53041YfH5HfKwI3+5hbkl5jUPFODplhy5jQeqyYLEWDqnNshk9sz
	z+ZAM0mZ7qKJSlRlifja4WkOxrYpfQRybI157r0=
X-Google-Smtp-Source: ABdhPJwyY6jEs4fX6nDZzhwypKgH6lJhUFFf92sguZ1vRcBsb8Y/SI0mAz2NX0eMVkH5dpPS9rrXHpMQRS1GzNeocbc=
X-Received: by 2002:adf:e6c9:: with SMTP id y9mr12616102wrm.429.1631888537841;
 Fri, 17 Sep 2021 07:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <c21708c84c850ff8c976a3934099c54da044e7d9.1631802816.git.tamas.lengyel@intel.com>
 <52b28c4d-1cf1-6c98-e1dc-1e0f7b2f768c@suse.com>
In-Reply-To: <52b28c4d-1cf1-6c98-e1dc-1e0f7b2f768c@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 Sep 2021 10:21:41 -0400
X-Gmail-Original-Message-ID: <CABfawh=B3zwfroiu=pPY5BTCMBkapYEGXixkRg66aXLQWxwU4A@mail.gmail.com>
Message-ID: <CABfawh=B3zwfroiu=pPY5BTCMBkapYEGXixkRg66aXLQWxwU4A@mail.gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: don't lock parent during fork reset
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Sep 17, 2021 at 3:26 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.09.2021 17:04, Tamas K Lengyel wrote:
> > During fork reset operation the parent domain doesn't need to be gathered using
> > rcu_lock_live_remote_domain_by_id as the fork reset doesn't modify anything on
> > the parent. The parent is also guaranteed to be paused while forks are active.
> > This patch reduces lock contention when performing resets in parallel.
>
> I'm a little in trouble following you here: RCU locks aren't really
> locks in that sense, so "lock contention" seems misleading to me. I
> can see that rcu_lock_domain_by_id()'s loop is extra overhead.
>
> Furthermore - does the parent being paused really mean the parent
> can't go away behind the back of the fork reset? In fork() I see
>
>     if ( rc && rc != -ERESTART )
>     {
>         domain_unpause(d);
>         put_domain(d);
>         cd->parent = NULL;
>     }
>
> i.e. the ref gets dropped before the parent pointer gets cleared. If
> the parent having a reference kept was indeed properly guaranteed, I
> agree the code change itself is fine.
>
> (The sequence looks correct at the other put_domain() site [dealing
> with the success case of fork(), when the reference gets retained]
> in domain_relinquish_resources().)

This code above you copied is when the fork() fails. Calling
fork_reset() before fork() successfully returns is not a sane sequence
and it is not "supported" by any means. If someone would try to do
that it would be racy as-is already with or without this patch.
Clearing the cd->parent pointer first here on the error path wouldn't
guarantee that sequence to be safe or sane either. Adding an extra
field to struct domain that signifies that "fork is complete" would be
a way to make that safe. But since the toolstack using this interface
is already sane (ie. never calls fork_reset before a successful fork)
I really don't think that's necessary. It would just grow struct
domain for very little benefit.

Tamas

