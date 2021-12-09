Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D606546E932
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 14:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243054.420347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJYj-0008Oq-9l; Thu, 09 Dec 2021 13:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243054.420347; Thu, 09 Dec 2021 13:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvJYj-0008Mx-6n; Thu, 09 Dec 2021 13:34:05 +0000
Received: by outflank-mailman (input) for mailman id 243054;
 Thu, 09 Dec 2021 13:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJm+=Q2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1mvJYh-0008Mn-Om
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 13:34:03 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac48eff4-58f4-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 14:34:02 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id m12so9016311ljj.6
 for <xen-devel@lists.xenproject.org>; Thu, 09 Dec 2021 05:34:02 -0800 (PST)
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
X-Inumbo-ID: ac48eff4-58f4-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O76rkSWVYvT8dqcbYxWXkft11qCzS7vPXfRaeYRgH0o=;
        b=bJuHVu9gaL1Se+1rc82qxSY2NdZFatzJz8gU2uFX1OadNXVJklcPd8TgGPpwCCt/YB
         /v+JfOGdmhpuBefn6kcEyBUBuLrMD3KLU1ITiDHnQXOFQsqwLwGKE07TOCPK+MLx7LyZ
         6dPeUw9yP5bZsXJO4wgqeBByRUIJOoiH52gWnAGXaINrswYjHVLnLwy2ujXpB/qsBPfU
         KBzn95a5ILxWhNCgk+gHt6FQzUCAcEHhSjWO84OgycakLU28tlncD7SkjcDOTkKPbMvi
         zQk14DdGAgAoF9i2uDXptOciQRLibPAbkhY7sFORHpbOm+74BBIE1gFO00wdLFMiIMVq
         hbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O76rkSWVYvT8dqcbYxWXkft11qCzS7vPXfRaeYRgH0o=;
        b=wB3cQPc0yz4AQDD3CZdJWIbapJEb++Z0TzZTl2eUZ5sdawloJNTOqSEDPaO0PhvACN
         oExZc1ClWFdwtN3WnJAR7bKt/t9IWXAsX1Qe6a7G2roqbyCxZhA9UQDQEvH4geYf11ic
         gOc3lOYkeZ7XZXNGLR9P4gisyqar6LDqCdtiExgaV364KND/6+G0tySvrf55ucZZSVXO
         DVH1IYj9N8zPbChtrLFoc7agVBxpQW+yEv9T5H/QoydzjZWeeJsL2r/ErMPZlNV/tQQv
         mZ+TnkMnoTnhpfFL7hXV+lW//g4BjmfWcpfg/XuBgxZxY4CZSMthhi145gKdDsPZ/LrF
         T9Mg==
X-Gm-Message-State: AOAM532AXW0xiO4Ly7pC3+ZFf3VlOkniZF3mSjfxIKKUU2PlVLo8LWNP
	rtAZdVn01pYEdOYU7afEfD/PBgC/YluGyj5aCoE=
X-Google-Smtp-Source: ABdhPJw2Q7UAC7Bybn7lBMlFi19V0gfRtH0qpSwt/WHhNNsoeYTz28c+PsXzif51RGDPVX41lB64B2ZPlhPRQNqP74I=
X-Received: by 2002:a2e:b177:: with SMTP id a23mr6238821ljm.168.1639056842424;
 Thu, 09 Dec 2021 05:34:02 -0800 (PST)
MIME-Version: 1.0
References: <d82be159-c4a4-73a7-9fb5-2128b6925e3d@suse.com>
 <CAKf6xpuDwV5nv9c3CX+Lo4e+dM=Uo=iv1nmeNtQNObfgD_wChg@mail.gmail.com> <fff78341-1e35-f245-e1ce-47f0fec9b86b@gmail.com>
In-Reply-To: <fff78341-1e35-f245-e1ce-47f0fec9b86b@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 9 Dec 2021 08:33:50 -0500
Message-ID: <CAKf6xpvoB3fxM-gCcaXeY3vdMNYF5uV+nZUOFUQ+=KZ_59UV=Q@mail.gmail.com>
Subject: Re: attaching device to PV guest broken by your rework of libxl's PCI handling?
To: Paul Durrant <paul@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Anthony Perard <anthony.perard@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 8:08 AM Durrant, Paul <xadimgnik@gmail.com> wrote:
>
> On 09/12/2021 04:58, Jason Andryuk wrote:
> >
> > My attempt at a fix was this:
> > https://lore.kernel.org/xen-devel/20210812005700.3159-1-jandryuk@gmail.com/
> >
> > It was in terms of PCI & stubdom startup , but that is the same as PV
> > hotplug.  There were questions about further re-work which went
> > unanswered, but my patch at least restores the old working state.
> >
>
> I guess the question is do we need to wait for 'connected' in any case
> other than initial creation?

It's the other way around.  When running (not initial creation -
!starting) and there are already entries (num_devs != NULL), we have
to wait for Connected to avoid interfering with Reconfiguring.

Regards,
Jason

