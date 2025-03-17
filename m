Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D863FA65AF5
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 18:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917582.1322458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuEQ0-00063K-7F; Mon, 17 Mar 2025 17:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917582.1322458; Mon, 17 Mar 2025 17:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuEQ0-00061b-4Z; Mon, 17 Mar 2025 17:38:28 +0000
Received: by outflank-mailman (input) for mailman id 917582;
 Mon, 17 Mar 2025 17:38:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuEPy-00061V-Ax
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 17:38:26 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a075288b-0356-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 18:38:25 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-224341bbc1dso87544685ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 10:38:25 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6888683sm78265245ad.36.2025.03.17.10.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:38:23 -0700 (PDT)
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
X-Inumbo-ID: a075288b-0356-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742233104; x=1742837904; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mz0cXC9mDpEa8EIt4lHU6a/Zcb6/WPHOMtKypK8FUxA=;
        b=kB/CxOD+D+bs7QVcWvh042DT0+6k8Tr2dMduTuzySU6NcDB/8hVUrsdl95efePqN5Z
         szCjckVXoxOWdKMkf6sQh34XyaOIYJuM0BJHGUXv0Qgg1F+gqbsAfXnfU2aKG4yGUqLa
         T3yc1dpx7hgjIoTNvLmUydNAZ/EZAC/yzepaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233104; x=1742837904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz0cXC9mDpEa8EIt4lHU6a/Zcb6/WPHOMtKypK8FUxA=;
        b=sXRsyDelrCKthGLuNqXVE9xmgXRIg6//a1dzDbte5WMtotcvuyG6mlPv92X3VYMusb
         7ZsOtkh69F8bNddeR9952t+BzaVpl+bK4rrztHmtsgqIUxbBypyrHFzcW1KhGgj+5LQw
         b4VkxYnzHL3hyTTWbnakTyh8LCD+Tzm0XAXf+vxd0ST7KWELnIe5N3Xk1v0UXYJbmm2w
         z5dhRf4ItAQCwX9DBR9uRP1Lvuv7z1H8oqPGhMB0+qYaw3nRrFAQokG2wgUjEZskh/E8
         7UkVFuW8hh8E8aZ4XlNEmCGbFXXSq9y1itXLrY+N7lcLyIuNq9ZJkVI4VRILL+FQvEVY
         dgEA==
X-Forwarded-Encrypted: i=1; AJvYcCWtSajeK7lmSbvCmFJmtBX+QRfmCq37HIjEN3B1theyWauISAMKpEq08eCuksOVxxcf6Yv9/pCA+eQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKiShGshuRzdI1TD3wmH8aMNtXQ9jNPMbSjsgZJkkkza8KVpTa
	fL3+Y9ieKt1N1C1nV9ML96gfe/80WJpaY2ruuzE4aLoQXktq8x51aFF54A6Mg++kA3eQ+CtJcwp
	C
X-Gm-Gg: ASbGncsluisPwsqM3PqSNC702v9NYF7Nt3uQ+YrLQy/T0YF86hm62s0zgcoYiOlT9vo
	0bXuq/lbbUYsTY4NymDHrFhaYb/wK2fdHmaUhOgxCnl5TGGK/YIvIcK75lIAaQ9oR32+BR2d4eR
	f0RcyH96AXF1QDIeMzwDBukWU2uV2Ny9tyHDBLReJODTotRzQUYfNNg+N76C6aU0ibTmcnvaFeC
	CrRvvgy5cXyoxiVvPwM8pzx34qkNhAvTpkgJq/IpuRxyf1K4Bq7RF3aa4x/ICkSzWeEphOxMgEq
	4zqIU20zQGJ9TCxsZ/QDvIwodA4l17wjclPxlwts6xTQTiyoBWD3CEU=
X-Google-Smtp-Source: AGHT+IFv7e3p7m7qorEKeH5hWhaSPQ0udIXRytqSa+//ClLXQuX4svNcgsNtp0hS27ygkk3op+Xmyg==
X-Received: by 2002:a17:902:f691:b0:224:e2a:9ff5 with SMTP id d9443c01a7336-2262c51bbd3mr5147125ad.9.1742233103599;
        Mon, 17 Mar 2025 10:38:23 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:38:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: S3 regression on AMD in 4.20
Message-ID: <Z9heCs3k1HORqfBY@macbook.local>
References: <20250314030628.96166-1-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2503141417540.3477110@ubuntu-linux-20-04-desktop>
 <Z9SsYF0pYTkZXg9I@mail-itl>
 <Z9TBaEeUcVrjaACL@mail-itl>
 <fd27f66c-12ce-4f94-8cc3-a8fbc18694a4@citrix.com>
 <Z9hGH0GLq-I1cKzt@macbook.local>
 <8d96f12b-c780-4aea-92a4-5034d1c5c7f6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d96f12b-c780-4aea-92a4-5034d1c5c7f6@suse.com>

On Mon, Mar 17, 2025 at 05:11:56PM +0100, Jan Beulich wrote:
> On 17.03.2025 16:56, Roger Pau Monné wrote:
> > On Sat, Mar 15, 2025 at 12:02:50AM +0000, Andrew Cooper wrote:
> >> On 14/03/2025 11:53 pm, Marek Marczykowski-Górecki wrote:
> >>> On Fri, Mar 14, 2025 at 11:23:28PM +0100, Marek Marczykowski-Górecki wrote:
> >>>> On Fri, Mar 14, 2025 at 02:19:19PM -0700, Stefano Stabellini wrote:
> >>>>> On Fri, 14 Mar 2025, Marek Marczykowski-Górecki wrote:
> >>>>>> This is AMD Zen2 (Ryzen 5 4500U specifically), in a HP Probook 445 G7.
> >>>>>>
> >>>>>> This one has working S3, so add a test for it here.
> >>>>>>
> >>>>>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >>>>>> ---
> >>>>>> Cc: Jan Beulich <jbeulich@suse.com>
> >>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>>>>
> >>>>>> The suspend test added here currently fails on staging[1], but passes on
> >>>>>> staging-4.19[2]. So the regression wants fixing before committing this
> >>>>>> patch.
> >>>>>>
> >>>>>> [1] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408437140
> >>>>>> [2] https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9408943441
> >>>>> We could commit the patch now without the s3 test.
> >>>>>
> >>>>> I don't know what the x86 maintainers think about fixing the suspend
> >>>>> bug, but one idea would be to run a bisection between 4.20 and 4.19.
> >>>> I'm on it already, but it's annoying. Lets convert this thread to
> >>>> discussion about the issue:
> >>>>
> >>>> So, I bisected it between staging-4.19 and master. The breakage is
> >>>> somewhere between (inclusive):
> >>>> eb21ce14d709 x86/boot: Rewrite EFI/MBI2 code partly in C
> >>>> and
> >>>> 47990ecef286 x86/boot: Improve MBI2 structure check
> >>>>
> >>>> But, the first one breaks booting on this system and it remains broken
> >>>> until the second commit (or its parent) - at which point S3 is already
> >>>> broken. So, there is a range of 71 commits that may be responsible...
> >>>>
> >>>> But then, based on a matrix chat and Jan's observation I've tried
> >>>> reverting f75780d26b2f "xen: move per-cpu area management into common
> >>>> code" just on top of 47990ecef286, and that fixed suspend.
> >>>> Applying "xen/percpu: don't initialize percpu on resume" on top of
> >>>> 47990ecef286 fixes suspend too.
> >>>> But applying it on top of master
> >>>> (91772f8420dfa2fcfe4db68480c216db5b79c512 specifically) does not fix it,
> >>>> but the failure mode is different than without the patch - system resets
> >>>> on S3 resume, with no crash message on the serial console (even with
> >>>> sync_console), instead of hanging.
> >>>> And one more data point: reverting f75780d26b2f on top of master is the
> >>>> same as applying "xen/percpu: don't initialize percpu on resume" on
> >>>> master - system reset on S3 resume.
> >>>> So, it looks like there are more issues...
> >>> Another bisection round and I have the second culprit:
> >>>
> >>>     8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
> >>>
> >>> With master+"xen/percpu: don't initialize percpu on resume"+revert of
> >>> 8e60d47cf011 suspend works again on this AMD system.
> >>
> >> That's not surprising in the slightest.
> >>
> >> Caching hardware values in Xen isn't safe across S3, which QubesOS has
> >> found time and time again, and for which we still have outstanding bugs.
> >>
> >> S3 turns most of the system off.  RAM gets preserved, but devices and
> >> plenty of internal registers don't.
> > 
> > I think I've spotted the issue.  enable_iommu() called on resume
> > (ab)uses set_msi_affinity() to force an MSI register write, as it's
> > previous behavior was to unconditionally propagate the values.  With
> > my change it would no longer perform such writes on resume.
> > 
> > I think the patch below should help.
> > 
> > I wonder if we should unconditionally propagate the write from
> > __setup_msi_irq(), as it's also unlikely to make any difference to
> > skip that write, and would further keep the previous behavior.
> 
> That might be better. In fact I wonder whether it wouldn't better be
> callers of write_msi_msg() to use ...
> 
> > ---
> > commit 1d9bfd0d45f6b547b19f0d2f752fc3bd10103971
> > Author: Roger Pau Monne <roger.pau@citrix.com>
> > Date:   Mon Mar 17 15:40:11 2025 +0100
> > 
> >     x86/msi: always propagate MSI writes when not in active system mode
> >     
> >     Relax the limitation on MSI register writes, and only apply it when the
> >     system is in active state.  For example AMD IOMMU drivers rely on using
> >     set_msi_affinity() to force an MSI register write on resume from
> >     suspension.
> >     
> >     The original patch intention was to reduce the number of MSI register
> >     writes when the system is in active state.  Leave the other states to
> >     always perform the writes, as it's safer given the existing code, and it's
> >     expected to not make a difference performance wise.
> >     
> >     Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> >     Fixes: ('8e60d47cf011 x86/iommu: avoid MSI address and data writes if IRT index hasn't changed')
> >     Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > --- a/xen/arch/x86/msi.c
> > +++ b/xen/arch/x86/msi.c
> > @@ -189,6 +189,15 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg,
> >  {
> >      entry->msg = *msg;
> >  
> > +    if ( unlikely(system_state != SYS_STATE_active) )
> 
> ... this condition as needed. Conceivably there might be cases where even
> during resume writes aren't always necessary to propagate to hardware.

Isn't this going to be quite more cumbersome, and I don't think the
cases outside of active mode are very interesting or relevant
performance wise?

The main purpose of the original change was the reduce the number of
PCI accesses during 'active' state, as every time an interrupt is
migrated to a different CPU such a (possibly redundant) PCI config
write would happen.

Thanks, Roger.

