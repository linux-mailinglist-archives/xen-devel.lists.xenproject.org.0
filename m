Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F070631B2D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 09:21:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446421.701993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox23N-0001TZ-T2; Mon, 21 Nov 2022 08:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446421.701993; Mon, 21 Nov 2022 08:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox23N-0001Qi-QG; Mon, 21 Nov 2022 08:21:21 +0000
Received: by outflank-mailman (input) for mailman id 446421;
 Mon, 21 Nov 2022 08:18:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ufje=3V=google.com=yuzhao@srs-se1.protection.inumbo.net>)
 id 1ox20o-0000TJ-3q
 for xen-devel@lists.xen.org; Mon, 21 Nov 2022 08:18:42 +0000
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [2607:f8b0:4864:20::e2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a8b8484-6975-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 09:18:41 +0100 (CET)
Received: by mail-vs1-xe2a.google.com with SMTP id t5so10483954vsh.8
 for <xen-devel@lists.xen.org>; Mon, 21 Nov 2022 00:18:40 -0800 (PST)
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
X-Inumbo-ID: 1a8b8484-6975-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5FNLqZ3+KdQjzm7Sx3mBq4NxeuMTkAwBYeRYu3X/hpw=;
        b=ZT1IBXqXR8n7CAGsZwETJtXB5s+32HQ0WfDf9ELFM7TnqZKlgWOeBc/bChoGMeTXZI
         DBw5IgWzhYRwwB8q2PlTYpDsgp/Xn0faD8qlQqeqGTzK+LtA5bO4pTSl6VhvOF3XjuUB
         v7cQhUjxPdiSW4o/cUm4GMGrYxkl6E57CDG+DeRbt7ONLQ4PRpM51bw/quQN3Qeh/nRb
         JOozyTr672VPCmMVeXPM/Pap3nqPGUKwDDQvfOazKh7eIRlTkGXUgXoNOSeHNoDkShnQ
         BYjmuzxMjI4p4EU4gVYY8/BJb9B8jMg9lMMiMnAoeTTtQL0QVNNx19/DQH0TeRn3a1mM
         HCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5FNLqZ3+KdQjzm7Sx3mBq4NxeuMTkAwBYeRYu3X/hpw=;
        b=5fdvJ+5DLTsZrkncGLlOfUDJXAvqKb25ydwgMvpuuAdQNyqzEwEG57Kcwie4dv1h+F
         Dz+XH/HeCDu7G5R5S+xUoFnNvevrfOvOkarWfcMxiJHaXlwV/8rLcpB3eaZFTyxjoNZ5
         Qfd+lBy0HPlJHZ8DTeTCT26UH7qSA5r67KC6HddQNW+s9xwqkOt+B2qpTtuIG2c05NLL
         OfcHqWZke3jkTSgkhOBZfuylJuc0mxP6/kLDPFBdpIJeT/Es4FxykOL1URPG9yf2j8r2
         z4HwLxru90YHz5dzHlLsA/86ZOeSmuaY8fG+jSVde9t4Bbj02c3WTqanN+9ANIZnGe/h
         nLfA==
X-Gm-Message-State: ANoB5pmLbF/i5nTL6bjY6EJTHu1nIQf/C1jKHxhj2Y0ZIetD5cIDbOmP
	pNbFBm1X1wh1vAdhi7ahPR76Z6jexu3b2/yy+4EHaw==
X-Google-Smtp-Source: AA0mqf6QG/XZV0N6cp0tywJ1b6hLNvJyyPYmMjylRsqJ9dVG67YrNCJaKMIbcALAv7PxmXvGlzEcAkmgNqBCPxSecSs=
X-Received: by 2002:a67:c98e:0:b0:3ad:3d65:22b with SMTP id
 y14-20020a67c98e000000b003ad3d65022bmr3275421vsk.65.1669018718896; Mon, 21
 Nov 2022 00:18:38 -0800 (PST)
MIME-Version: 1.0
References: <42579618-f8e2-9fd2-0b6c-f2c87f7c57a6@eikelenboom.it> <99178e0a-ff6a-9bfa-4ade-b4bf6fdc306f@suse.com>
In-Reply-To: <99178e0a-ff6a-9bfa-4ade-b4bf6fdc306f@suse.com>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 21 Nov 2022 01:18:02 -0700
Message-ID: <CAOUHufY8it25rBbV1QeO3-wF3g32VkDwrsT6mL4fQUNZsMGkKw@mail.gmail.com>
Subject: Re: Xen-unstable Linux-6.1.0-rc5 BUG: unable to handle page fault for
 address: ffff8880083374d0
To: Juergen Gross <jgross@suse.com>, Sander Eikelenboom <linux@eikelenboom.it>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 21, 2022 at 12:10 AM Juergen Gross <jgross@suse.com> wrote:
>
> On 19.11.22 09:28, Sander Eikelenboom wrote:
> > Hi Yu / Juergen,

Hi Sander / Juergen,

Thanks for the report and the analysis.

> > This night I got a dom0 kernel crash on my new Ryzen box running Xen-unstable
> > and a Linux-6.1.0-rc5 kernel.
> > I did enable the new and shiny MGLRU, could this be related ?
>
> It might be related, but I think it could happen independently from it.

Yes, I think it's related.

> > Nov 19 06:30:11 serveerstertje kernel: [68959.647371] BUG: unable to handle page
> > fault for address: ffff8880083374d0
> > Nov 19 06:30:11 serveerstertje kernel: [68959.663555] #PF: supervisor write
> > access in kernel mode
> > Nov 19 06:30:11 serveerstertje kernel: [68959.677542] #PF: error_code(0x0003) -
> > permissions violation
> > Nov 19 06:30:11 serveerstertje kernel: [68959.691181] PGD 3026067 P4D 3026067
> > PUD 3027067 PMD 7fee5067 PTE 8010000008337065
> > Nov 19 06:30:11 serveerstertje kernel: [68959.705084] Oops: 0003 [#1] PREEMPT
> > SMP NOPTI
> > Nov 19 06:30:11 serveerstertje kernel: [68959.718710] CPU: 7 PID: 158 Comm:
> > kswapd0 Not tainted 6.1.0-rc5-20221118-doflr-mac80211debug+ #1
> > Nov 19 06:30:11 serveerstertje kernel: [68959.732457] Hardware name: To Be
> > Filled By O.E.M. To Be Filled By O.E.M./B450 Pro4 R2.0, BIOS P5.60 10/20/2022
> > Nov 19 06:30:11 serveerstertje kernel: [68959.746391] RIP:
> > e030:pmdp_test_and_clear_young+0x25/0x40
>
> The kernel tired to reset the "accessed" bit in the pmd entry.

Correct.

> It does so only since commit eed9a328aa1ae. Before that
> pmdp_test_and_clear_young() could be called only for huge pages, which are
> disabled in Xen PV guests.

Correct. After that commit, we also can clear the accessed bit in
non-leaf PMD entries (pointing to PTE tables).

> pmdp_test_and_clear_young() does a test_and_clear_bit() of the pmd entry, which
> is failing since the hypervisor is emulating pte entry modifications only (pmd
> and pud entries can be set via hypercalls only).
>
> Could you please test the attached patch whether it fixes the issue for you?

There is a runtime kill switch for ARCH_HAS_NONLEAF_PMD_YOUNG, since I
wasn't able to verify this capability on all x86 varieties. The following
should do it:

  # cat /sys/kernel/mm/lru_gen/enabled
  0x0007
  # echo 3 >/sys/kernel/mm/lru_gen/enabled

Details are in Documentation/admin-guide/mm/multigen_lru.rst.

Alternatively, we could make ARCH_HAS_NONLEAF_PMD_YOUNG a runtime
check similar to arch_has_hw_pte_young() on arm64.

