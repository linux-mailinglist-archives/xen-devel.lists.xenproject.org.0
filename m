Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600B6887E3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 20:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488919.757221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNfhJ-0000wH-Rz; Thu, 02 Feb 2023 19:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488919.757221; Thu, 02 Feb 2023 19:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNfhJ-0000tr-PJ; Thu, 02 Feb 2023 19:56:41 +0000
Received: by outflank-mailman (input) for mailman id 488919;
 Thu, 02 Feb 2023 19:56:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvQ0=56=redhat.com=msnitzer@srs-se1.protection.inumbo.net>)
 id 1pNfhI-0000tl-Si
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 19:56:40 +0000
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b363f225-a333-11ed-9254-a70e01b1f5fa;
 Thu, 02 Feb 2023 20:56:37 +0100 (CET)
Received: by mail-qt1-f182.google.com with SMTP id cr22so3188307qtb.10
 for <xen-devel@lists.xenproject.org>; Thu, 02 Feb 2023 11:56:37 -0800 (PST)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 h6-20020a05620a10a600b007246f005d8bsm293223qkk.116.2023.02.02.11.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 11:56:35 -0800 (PST)
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
X-Inumbo-ID: b363f225-a333-11ed-9254-a70e01b1f5fa
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=puPH7Nn4Vxt3kUnQKHCGR9XbgEDlt42vfosxQIpu+cs=;
        b=VvC/2JA+Ok/fgjCpiQ6GqyjKMcVaUDZxUpulHOe+ApP7g283G5j17BdLshKAvtdtFo
         BkUhyEBgcoh+RXWGMv3pRk38YrEQIPckGV2wVeinLDGNFvYYC1eT0PU0psDdiklvoxYh
         riyV3OO0jZB0ir6c7v1yRsLCa89y+X7eqAlKQxUnOk8cetdNj6RAEgrkOOnsdnJGt6UU
         MCl6Tg8zseXV876Vo+bic5NJVhPch46j+SeCIDiQYWUDm8jrZP2yuDUnJ9oIVX3SwjBc
         H5ag/snYAbzxD/PZaNdmswfmNPQVOLYhaqpecVybqaN/V0Aj6tGhI8u9kAOAUQNW8DQq
         Ij4A==
X-Gm-Message-State: AO0yUKX9QOyVOgLbf4rornYao44+NtIf9ULpEIrS4yInC1VFvzJ+hNNS
	C5CnRVvDQoBDDRfCho7qj3K6
X-Google-Smtp-Source: AK7set92dyhIkHCdWF7e92O2MXu6mUmZ6lpekQmSoPBHbD1dR3CVvDYQ1CtAQ9IvY8M0gdRPR2pO1A==
X-Received: by 2002:a05:622a:511:b0:3b8:6c68:6109 with SMTP id l17-20020a05622a051100b003b86c686109mr13439452qtx.21.1675367796153;
        Thu, 02 Feb 2023 11:56:36 -0800 (PST)
Date: Thu, 2 Feb 2023 14:56:34 -0500
From: Mike Snitzer <snitzer@kernel.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	dm-devel@redhat.com
Subject: Re: [RFC PATCH 0/7] Allow race-free block device handling
Message-ID: <Y9wVcskXyOk3bbzC@redhat.com>
References: <20230126033358.1880-1-demi@invisiblethingslab.com>
 <Y9vp3XDEQAl7TLND@redhat.com>
 <Y9wEF3rWfpiCKc2i@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9wEF3rWfpiCKc2i@itl-email>

On Thu, Feb 02 2023 at  1:41P -0500,
Demi Marie Obenour <demi@invisiblethingslab.com> wrote:

> On Thu, Feb 02, 2023 at 11:50:37AM -0500, Mike Snitzer wrote:
> > On Wed, Jan 25 2023 at 10:33P -0500,
> > Demi Marie Obenour <demi@invisiblethingslab.com> wrote:
> > 
> > > This work aims to allow userspace to create and destroy block devices
> > > in a race-free and leak-free way,
> > 
> > "race-free and leak-free way" implies there both races and leaks in
> > existing code. You're making claims that are likely very specific to
> > your Xen use-case.  Please explain more carefully.
> 
> Will do in v2.
> 
> > > and to allow them to be exposed to
> > > other Xen VMs via blkback without leaks or races.  It’s marked as RFC
> > > for a few reasons:
> > > 
> > > - The code has been only lightly tested.  It might be unstable or
> > >   insecure.
> > > 
> > > - The DM_DEV_CREATE ioctl gains a new flag.  Unknown flags were
> > >   previously ignored, so this could theoretically break buggy userspace
> > >   tools.
> > 
> > Not seeing a reason that type of DM change is needed. If you feel
> > strongly about it send a separate patch and we can discuss it.
> 
> Patch 2/7 is the diskseq change.  v2 will contain a revised and tested
> version with a greatly expanded commit message.

I'm aware that 2/7 is where you make the DM change to disallow unknown
flags, what I'm saying is I don't see a reason for that change.

Certainly doesn't look to be a requirement for everything else in that
patch.

So send a separate patch, but I'm inclined to _not_ accept it because
it does potentially break some userspace.
 
> > > - I have no idea if I got the block device reference counting and
> > >   locking correct.
> > 
> > Your headers and justifcation for this line of work are really way too
> > terse. Please take the time to clearly make the case for your changes
> > in both the patch headers and code.
> 
> I will expand the commit message in v2, but I am not sure what you want
> me to add to the code comments.  Would you mind explaining?

Nothing specific about code, was just a general reminder (based on how
terse the 2/7 header was).

Mike

