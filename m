Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB4549CB1A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 14:44:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260909.451165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCiaO-0008RT-Ib; Wed, 26 Jan 2022 13:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260909.451165; Wed, 26 Jan 2022 13:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCiaO-0008Pd-FV; Wed, 26 Jan 2022 13:43:44 +0000
Received: by outflank-mailman (input) for mailman id 260909;
 Wed, 26 Jan 2022 13:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKVh=SK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nCiaN-0008PW-7h
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 13:43:43 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f982dc07-7ead-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 14:43:42 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id e9so9235571ljq.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jan 2022 05:43:42 -0800 (PST)
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
X-Inumbo-ID: f982dc07-7ead-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gMni9wn2lI5Ay+Ji6nDoLzcxqxpYyMWJcG/nvWMzgec=;
        b=bK37PTttXv4jaPZFDghvL5yZRHV1HKeDh+hXrHE6+P2MKRtM2aJAnxNQlu3tJ0inqv
         Vhj56HIU4kBYTudwKYY98HwtCxOCnGxnqR2a8wnYktNlInmtLM26ewY9P2uEEiRvXeJL
         gq8aGcLnEZFhk+HJvITKq7s7U3J9EuYuqTpwk47pTn0K1IESMsy6STDjiXUCAfFEUKsU
         UmysZeqI7jbKETSTQMwH1c9Z/cPVDhUAIqSvKrs3gyfGOxcn/zvHbj2dm65kfqsv4Z0/
         wwynxO6eblSxARqrcAqEddDjh+CeuQhB9zhimzjbsYPVE8qSb6gaQQkzNh6BREATZ2M0
         U8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gMni9wn2lI5Ay+Ji6nDoLzcxqxpYyMWJcG/nvWMzgec=;
        b=WbpJug/DldhUcqHj2onZGm9hVuB8RdA4HVit8F7ZbGLYqt5HztQArNlGuGrT1AJwl5
         kwbHKArLMlmx2Xvvsa+iIl/zE3eitvG+Lks16o6Pa61H10oCjzKs6/zRmDHYvaUohfpf
         zGY3gl7lOwpj5o7KsuFXoaWF86Gv+y8dqMeafzv+swLfXacSJPmkNZFgHZ5+v7iGkWTm
         zb8vnZAuQeM5rhReiKebAFch+oFDpjHGmNBdqHF/8oa9qTKVP9PoAOsrde08PUdA3tDF
         q1Dv/Ke+4KYbjc+IcYsznURzkA/SY6/zQMrKxyzksVME7h/G6W0Ol+hK6r3NknmPiQga
         /5og==
X-Gm-Message-State: AOAM531XbRTSgpagRLJuqJAImSUT6c8PcX7rPl+DpbAAic6gTM2VcpZS
	Hy4f0FLaQarB7g+YkGtH1g2b2t8s5inDo0+HbsY=
X-Google-Smtp-Source: ABdhPJx//VB5lloxzuc+JaSBuwksC5FZfWbpvzfPHPGA+tJE0rT0Vfw5y5CD72i7G5Vxu1w6RvfeqhVzfViG6JiUVoA=
X-Received: by 2002:a05:651c:1241:: with SMTP id h1mr18260308ljh.459.1643204621863;
 Wed, 26 Jan 2022 05:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20211210193434.75566-1-jandryuk@gmail.com> <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
In-Reply-To: <adfe1c14-f773-0592-e304-d80da8380cc0@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Jan 2022 08:43:30 -0500
Message-ID: <CAKf6xpv0=ex+OrFb1z4TpaULsmMaPQqmmsxoY_d4yJRt6Zx3sw@mail.gmail.com>
Subject: Re: [PATCH] xen-hvm: Allow disabling buffer_io_timer
To: Paul Durrant <paul@xen.org>
Cc: QEMU <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 8:40 AM Durrant, Paul <xadimgnik@gmail.com> wrote:
>
> On 10/12/2021 11:34, Jason Andryuk wrote:
> > commit f37f29d31488 "xen: slightly simplify bufioreq handling" hard
> > coded setting req.count = 1 during initial field setup before the main
> > loop.  This missed a subtlety that an early exit from the loop when
> > there are no ioreqs to process, would have req.count == 0 for the return
> > value.  handle_buffered_io() would then remove state->buffered_io_timer.
> > Instead handle_buffered_iopage() is basically always returning true and
> > handle_buffered_io() always re-setting the timer.
> >
> > Restore the disabling of the timer by introducing a new handled_ioreq
> > boolean and use as the return value.  The named variable will more
> > clearly show the intent of the code.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Reviewed-by: Paul Durrant <paul@xen.org>

Thanks, Paul.

What is the next step for getting this into QEMU?

To re-state more plainly, this patch fixes a bug to let QEMU go idle
for longer stretches of time.  Without it, buffer_io_timer continues
to re-arm and fire every 100ms even if there is nothing to do.

Regards,
Jason

