Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55CF8B3AD3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 17:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712908.1113813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NHe-0005Pb-Am; Fri, 26 Apr 2024 15:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712908.1113813; Fri, 26 Apr 2024 15:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NHe-0005M8-7V; Fri, 26 Apr 2024 15:14:42 +0000
Received: by outflank-mailman (input) for mailman id 712908;
 Fri, 26 Apr 2024 15:14:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duI6=L7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s0NHd-0005M0-7p
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 15:14:41 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fce0408-03df-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 17:14:07 +0200 (CEST)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5ac8e8ce2a7so1415407eaf.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 08:14:07 -0700 (PDT)
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
X-Inumbo-ID: 9fce0408-03df-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714144446; x=1714749246; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hczv7kJ3x6yYZjbyvcVzmAkv2O6tyLxbzNm2mopKoVE=;
        b=if9zNWBBx8meSKWV7lyoZAJaoqn2F8BczdOrKc4W5rrIuH7SfTtTE+qpErkqpqkwRv
         P/MpwBbG1z0+J66hFiAO11nQ6tknqslzdY0dsKgMLSG2E5y9Gk0FmxR9WQJq6b3uFlDD
         /TmS8QyrnkIulU+phsiyxCsdWgkLHv9pvmTyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714144446; x=1714749246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hczv7kJ3x6yYZjbyvcVzmAkv2O6tyLxbzNm2mopKoVE=;
        b=vKvXO/ACx8CgQJqC7L4Yc3msDb+KQ9wt81ATjxhRjrNJZCJWfJ5uSCEpmL4DWV9BYJ
         xcHdnz9lxjrSRqxr2C8M3gTm6kT23fsRcRkjE/mrHoW3aH828OwwWMK4MJhEg8DtnpIj
         I0JOneyTCk/GRnqKyzovevMInHp8hIqytQ+wve1HsRHXkr1HgRmOBjYCfWbKxp4oy5Ym
         PdgkMDMimTNpljPvxIqD0MCVYYVzpsTbvSGQ2+n45za3ASEf1a9K+Nr4YjTaPyp3zv9Z
         fBqZPZsetvUPuCstljDX88t1/WMU9XFU2e8pTWtFKMKa4i3NkPx4s8hr/qQ8Yvt5GbBd
         L1eA==
X-Gm-Message-State: AOJu0Yw6JOXROGa6ckRSolQy81vzy+g3CiOP+2OdqeJcuzV3LxAnRg8i
	ebmZ6qUQQ4oYo40YW30eUSeJiADzWPjTBdmMWZrI752rn9139nOkIi5MopydNiOILv9bWbIXjNU
	c2rw/Ba17BGF7b+Dp3Bf+YxwQKD0CeSvlbVLD1H00bOnYrusc3EU=
X-Google-Smtp-Source: AGHT+IH6E7WPMYwsXkhrDDDiP5bARStwqPSDIcCG273nYHfnoGE8SmSfwC6smkTSAO1swzDO8DOD+svPI1Nkx6N1A90=
X-Received: by 2002:a05:6870:d610:b0:233:b5af:bba0 with SMTP id
 a16-20020a056870d61000b00233b5afbba0mr1395067oaq.0.1714144446030; Fri, 26 Apr
 2024 08:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240426143231.4007671-1-george.dunlap@cloud.com>
 <20240426143231.4007671-3-george.dunlap@cloud.com> <76b27178-b860-4148-8878-43afc4f042da@citrix.com>
In-Reply-To: <76b27178-b860-4148-8878-43afc4f042da@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 26 Apr 2024 16:13:55 +0100
Message-ID: <CA+zSX=bok0DTFKt_Ce-0i0pA8PgCA70jT9KB8Q6Ubhiby_UvyA@mail.gmail.com>
Subject: Re: [PATCH 2/3] tools/xenalyze: Ignore HVM_EMUL events harder
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@cloud.com>, 
	Olaf Hering <olaf@aepfle.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 4:06=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 26/04/2024 3:32 pm, George Dunlap wrote:
> > To unify certain common sanity checks, checks are done very early in
> > processing based only on the top-level type.
> >
> > Unfortunately, when TRC_HVM_EMUL was introduced, it broke some of the
> > assumptions about how the top-level types worked.  Namely, traces of
> > this type will show up outside of HVM contexts: in idle domains and in
> > PV domains.
> >
> > Make an explicit exception for TRC_HVM_EMUL types in a number of places=
:
> >
> >  - Pass the record info pointer to toplevel_assert_check, so that it
> >    can exclude TRC_HVM_EMUL records from idle and vcpu data_mode
> >    checks
> >
> >  - Don't attempt to set the vcpu data_type in hvm_process for
> >    TRC_HVM_EMUL records.
> >
> > Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Although I'm tempted to say that if records of this type show up outside
> of HVM context, then it's misnamed or we've got an error in Xen.  Any
> view on which?

I didn't add them; they seem to be about doing emulation of devices on
behalf of an HVM domain.  But since some of these are things like
timers and such, the actual code ends up being run in random contexts;
probably interrupt contexts (which of course can occur when a non-HVM
guest is running).

One example of an event that showed up this way was
TRC_HVM_EMUL_RTC_STOP_TIMER, which is traced from
xen/arch/x86/hvm/rtc.c:rtc_pf_callback().  I didn't trace back how it
came to be called while a PV guest was running, but it was pretty
obvious that it was legit.

It would certainly make the xenalyze code cleaner to make a separate
top-level tracing category for them; but they certainly do seem to be
directly related to HVM, so doing so would seem to be putting the cart
before the horse, as they say (although I could be convinced
otherwise).

 -George

