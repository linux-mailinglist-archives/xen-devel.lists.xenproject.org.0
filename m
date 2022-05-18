Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9EF52BFDE
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 19:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332404.556095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrN61-00019P-W9; Wed, 18 May 2022 17:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332404.556095; Wed, 18 May 2022 17:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrN61-00016x-TA; Wed, 18 May 2022 17:04:25 +0000
Received: by outflank-mailman (input) for mailman id 332404;
 Wed, 18 May 2022 17:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oo/d=V2=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nrN5z-00016r-Lz
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 17:04:23 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fe2e77b-d6cc-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 19:04:22 +0200 (CEST)
Received: by mail-ot1-x334.google.com with SMTP id
 y20-20020a056830071400b00606a2ebd91bso1780744ots.5
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 10:04:22 -0700 (PDT)
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
X-Inumbo-ID: 8fe2e77b-d6cc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1FKO2SC4YduXW1JyydrxoRnczkyFkssvYlUA6YM8QXw=;
        b=Dbjsdog7x2DC/G8rFYotMdPTAcKDt+MZFUYYnlYERdq2iMXp6RRHND0ilR0WZVS+Lg
         SAKYHLTnMEs1p8ABkel5nZraGgyLTuNIdNc+ZgpTchv8jwmoEMapMkovva6jWz/my8di
         9Ye1BBpCdtE16gQxrZJ4uLaUjN+fGqWQyzYq0k+qVByaNU3VxJTxWMhVXxuoyKX/cmZb
         tSuwUIKSd7Sthpv4no2p/C/uRqe6GHn6EWpNreFh4Z/p+YZBoDhjNKwOipuUCTgaNY0L
         lCwGTEedzzabDp7QQ9860XDTTXU2BplpUv/0yECJGZahH1AeVn6XiYTS6gFw34gzU1Rq
         4S+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1FKO2SC4YduXW1JyydrxoRnczkyFkssvYlUA6YM8QXw=;
        b=oVnk5Pm7O5WFR9XdLbADvx5t13GVfAnKIMqS+Y+5O7Jx3ZocqdG4dNX2Ui3FHcuFLY
         dkEU8xoEgDAjiAHZ0KmuJabv8A7WJiCmbF6qFkAt1gLI+rESdV0bw6NlK/XhrU2nLE4/
         EQ60R/ZrgCw65G48G2pxFvyibjG90hZ3JXjfMhNyKq0X7r9WIcFj83of+vIW6rq7ZiiM
         ykLMHbBHeSagBYtSxO8wFCxgSTvIH8MMppM3vuO9Do8vJdCS4qfIR6vDUK36h9yRfUE4
         PyFD9XohwrdWOhmTsgcqkH2+ddgkr5vFWoKRNKQvasx1iqY2eUt9PyfeD6zeUklP1Fwl
         o5Nw==
X-Gm-Message-State: AOAM5328UpI0nI3MzFOkX6sHchH8W1czZ6tPUVqIr/9HFdM+eL3tm/GO
	D46ayNDsLqSoA1s+8XQ0461fxBx09n0f6Cqn0BOR2iMFyB4=
X-Google-Smtp-Source: ABdhPJwBPtvPEiXpLzyo7ka3RcpNGnUqGM8K3GA7sVU5wNJ3GgFZjOGJGzEwMwJXXpx31gyg0fTTQlxQkoCWdtEMgVE=
X-Received: by 2002:a05:6830:1e86:b0:606:48b8:252c with SMTP id
 n6-20020a0568301e8600b0060648b8252cmr276032otr.204.1652893461247; Wed, 18 May
 2022 10:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <f3fdd4e99892549dc68e7511f2d84f51af446e86.1651073086.git.tamas.lengyel@intel.com>
 <YnOIEb9sNfshZwtZ@Air-de-Roger> <CABfawh=WnQtGehg2mX4Lnz9y3AyAnaUjUyc4FNxjGvoc_YcOBg@mail.gmail.com>
 <CABfawh=2wHwxGuihNY=ecKcdx8ZapmWnNzx=O6nRxm1ENpr62g@mail.gmail.com> <f15dfd96-f104-7d5e-048a-8a9095520197@suse.com>
In-Reply-To: <f15dfd96-f104-7d5e-048a-8a9095520197@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 18 May 2022 13:03:45 -0400
Message-ID: <CABfawhmSFxa23PrmCzaQEvqUE1nZuVB1i1iw_terDa1BCq5gig@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools/libxc: change xc_memshr_fork_reset API to match hypervisor
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	Juergen Gross <jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2022 at 11:48 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 18.05.2022 17:01, Tamas K Lengyel wrote:
> > On Thu, May 12, 2022 at 9:46 AM Tamas K Lengyel
> > <tamas.k.lengyel@gmail.com> wrote:
> >>
> >> On Thu, May 5, 2022 at 4:27 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> >>>
> >>> On Wed, Apr 27, 2022 at 11:34:19AM -0400, Tamas K Lengyel wrote:
> >>>> Need to separately specify if the reset is for the memory or for the=
 VM state,
> >>>> or both.
> >>>>
> >>>> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> >>>
> >>> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >>
> >> Patch ping. Can this patch be merged please?
> >
> > Patch ping.
>
> Your mail (and I guess also your earlier one) was _To_ Roger, which
> is odd since he already did provide R-b. What you're missing is a
> tool stack maintainer ack aiui, so it may help if you send your
> pings _To_ the respective people.

True, but all the toolstack maintainers have been CC-d from the start.
Is it the case that CC-ing is now officially insufficient? What's the
point of ./scripts/add_maintainers.pl then which specifically adds
maintainers only as CC? How are you supposed to get their attention?
Just know you specifically have to send emails to them and not the
mailinglist? I'm getting the distinct impression that the toolstack
side has simply become unmaintained/orphaned with no one left who
actually is looking at the mailinglist.

Tamas

