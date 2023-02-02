Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37C36884D0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 17:51:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488866.757145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNco7-0007ml-8m; Thu, 02 Feb 2023 16:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488866.757145; Thu, 02 Feb 2023 16:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNco7-0007l4-3r; Thu, 02 Feb 2023 16:51:31 +0000
Received: by outflank-mailman (input) for mailman id 488866;
 Thu, 02 Feb 2023 16:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SvQ0=56=redhat.com=msnitzer@srs-se1.protection.inumbo.net>)
 id 1pNcnK-0007jK-D7
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 16:50:42 +0000
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b93cdf18-a319-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 17:50:40 +0100 (CET)
Received: by mail-qt1-f173.google.com with SMTP id w3so2518250qts.7
 for <xen-devel@lists.xenproject.org>; Thu, 02 Feb 2023 08:50:40 -0800 (PST)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05620a034900b0071eddd3bebbsm31687qkm.81.2023.02.02.08.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 08:50:38 -0800 (PST)
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
X-Inumbo-ID: b93cdf18-a319-11ed-b63b-5f92e7d2e73a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1tztcBchRZ+ahQ+Rv8slGEZ3rlEReGoboay+wBElNpk=;
        b=X620MAly2Vy6OEgASJxhu7lIpwNz9UWg8EIk8uzA7zbeMqdfA2mZCLmYVnsSCfsnvV
         +o3IrQG1ExVx6eS4nQy8hqZvcmNpIsOMmwavleu0cnEWmNiIGgisSD8nkDXd2AuwSI73
         bTWUpNWpbUae6qxXHup06Zlcl+9sEE32aihqiK8TgnoY/AGZfafM9UWOg+WNKNPgOVJC
         6xjTs7FBzZXgair6hGi6r7IAXzLltUm+unmjV4RostwRcBAGGuNzFN35yGG3OXoFisgM
         TYS36YcqW/8hz6m8mhQh17pUc51jpSE2ISvQpr99HKf33wC4DlviktRoksRHMF6jAxk/
         mKhw==
X-Gm-Message-State: AO0yUKUmwCgaexzJVBY058Lmz2OOHSvjXLdtAB4qFjA14+abNyLCzxjE
	KgMYmQ1Zuguy/nq58XzmsqO/
X-Google-Smtp-Source: AK7set+4Pyeb5ompgmUg0JYUv54bCb2ceknHgU0XW/UAy594tQAOCFstY5279x2+bA/W3Ae7xhvLGQ==
X-Received: by 2002:a05:622a:1788:b0:3b8:2ea9:a093 with SMTP id s8-20020a05622a178800b003b82ea9a093mr13141578qtk.1.1675356639078;
        Thu, 02 Feb 2023 08:50:39 -0800 (PST)
Date: Thu, 2 Feb 2023 11:50:37 -0500
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
Message-ID: <Y9vp3XDEQAl7TLND@redhat.com>
References: <20230126033358.1880-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230126033358.1880-1-demi@invisiblethingslab.com>

On Wed, Jan 25 2023 at 10:33P -0500,
Demi Marie Obenour <demi@invisiblethingslab.com> wrote:

> This work aims to allow userspace to create and destroy block devices
> in a race-free and leak-free way,

"race-free and leak-free way" implies there both races and leaks in
existing code. You're making claims that are likely very specific to
your Xen use-case.  Please explain more carefully.

> and to allow them to be exposed to
> other Xen VMs via blkback without leaks or races.  It’s marked as RFC
> for a few reasons:
> 
> - The code has been only lightly tested.  It might be unstable or
>   insecure.
> 
> - The DM_DEV_CREATE ioctl gains a new flag.  Unknown flags were
>   previously ignored, so this could theoretically break buggy userspace
>   tools.

Not seeing a reason that type of DM change is needed. If you feel
strongly about it send a separate patch and we can discuss it.

> - I have no idea if I got the block device reference counting and
>   locking correct.

Your headers and justifcation for this line of work are really way too
terse. Please take the time to clearly make the case for your changes
in both the patch headers and code.

Mike

