Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0C923B36
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 12:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752252.1160435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaZs-0007ck-2n; Tue, 02 Jul 2024 10:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752252.1160435; Tue, 02 Jul 2024 10:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaZs-0007ay-02; Tue, 02 Jul 2024 10:17:36 +0000
Received: by outflank-mailman (input) for mailman id 752252;
 Tue, 02 Jul 2024 10:17:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FvPd=OC=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1sOaZq-0007ao-BB
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 10:17:34 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aac15fb-385c-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 12:17:32 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1f9cd92b146so25955035ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 03:17:32 -0700 (PDT)
Received: from localhost ([122.172.82.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac1549e59sm82771525ad.179.2024.07.02.03.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 03:17:29 -0700 (PDT)
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
X-Inumbo-ID: 4aac15fb-385c-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719915450; x=1720520250; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4pKTTPmrnQobxgE7l8dU8flNulXP3EKlbQMbrPlJki0=;
        b=atVXrH5p2fMLTF3AMsNrx6H49uTAapb7wDwEp6iTri/9/XZ9iMzPpCDYzE8wqzqvSY
         fD37YioAP1z4ckzibx07ygcZAAeo3IdB0X/p3nVhNxdQJODevYLkt00CUmpgK0wXiPQ3
         /9ME8i8y+jPn6FPU16BL2W7a10lxYFK2e+/LPerJ5ECVWb9tpx/4I70R9z6Wmx1h04GP
         WX0q1B9tP04qZG7N1e3suvUBj6/Mr7Fl7UBYf1OGd06xGSXmKkkqmPUkATZPGXchGV1N
         /m8B4yM9f6OnvfcC4MeoT3QXcto+ad6BzPVQtyQvUquvdL/mt/1of+m+7VgYzFmnue6z
         /Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719915450; x=1720520250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pKTTPmrnQobxgE7l8dU8flNulXP3EKlbQMbrPlJki0=;
        b=uMlXOGJYrO3+tYSyFZBj98osa0rCfeS3+AIPitVNTtDq6DtYghCAx7ZAFaoA8YnZpx
         RpsE6VbwMk7sd1/+yIXAsZN+JuGxogF05IDeSKHm/+8jsvVREvFasf8cPaVVsKw9WhgB
         /gS6LgquPHi/HrHQUVmoHbBsn55rC8OGvoNFeb79xZubZGh5kDw5S+KT43u1TkA6szYk
         gUW+vKshdPaUSqUKactjV+fh0Vi2TerAyI142+n4vMmDAU0Ev7pNvKO7ayHNQLNrO849
         D7uzFtbW5JIH8XFLWomDCgcRJjeKbzOlgiacJUhEoOlOJq6fb3N2FAtUWvxyUQOn7oRB
         c+zw==
X-Forwarded-Encrypted: i=1; AJvYcCVFyJPnh8Tr6DLxw7PBrZgA/T3zHviN991piuhJRDH+U4Z7PiZATCWbDSvUcyEnTtZGa+gtc018/cJBUlahZY17S70w5V4Y0RmoCm8yGv4=
X-Gm-Message-State: AOJu0YyZBj1wY2F7pKYkFtPBdLx5OsOfcxrU8qW5AIV7yoZYq3f6+46q
	u5xNGfVXrLn0L9VzqR8f89RuHkFCLs42tbJfz666vLlHSuvHjgM25/2XCKWNF3o=
X-Google-Smtp-Source: AGHT+IHMrBbMSgnyrBXJhkELUhdwwa1R4OK+0ew1rSLs2lXmY8A6OkIB5/dasHrqflqjUaIo8Xz5rw==
X-Received: by 2002:a17:902:c40c:b0:1f9:b1a4:d43e with SMTP id d9443c01a7336-1fadbc96accmr80929285ad.20.1719915450474;
        Tue, 02 Jul 2024 03:17:30 -0700 (PDT)
Date: Tue, 2 Jul 2024 15:47:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xen: privcmd: Switch from mutex to spinlock for
 irqfds
Message-ID: <20240702101727.nytmrgdzcebtinbt@vireshk-i7>
References: <a66d7a7a9001424d432f52a9fc3931a1f345464f.1718703669.git.viresh.kumar@linaro.org>
 <17aa46c3-89e9-40aa-bb15-817230712f07@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17aa46c3-89e9-40aa-bb15-817230712f07@suse.com>

On 02-07-24, 12:12, Juergen Gross wrote:
> On 18.06.24 11:42, Viresh Kumar wrote:
> > irqfd_wakeup() gets EPOLLHUP, when it is called by
> > eventfd_release() by way of wake_up_poll(&ctx->wqh, EPOLLHUP), which
> > gets called under spin_lock_irqsave(). We can't use a mutex here as it
> > will lead to a deadlock.
> > 
> > Fix it by switching over to a spin lock.
> > 
> > Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >   drivers/xen/privcmd.c | 26 +++++++++++++++-----------
> >   1 file changed, 15 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index 67dfa4778864..5ceb6c56cf3e 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -13,7 +13,6 @@
> >   #include <linux/file.h>
> >   #include <linux/kernel.h>
> >   #include <linux/module.h>
> > -#include <linux/mutex.h>
> 
> I don't think you can drop that. There is still the ioreq_lock mutex.

You are right. The header got included from somewhere else I believe
since the build didn't fail for me.

> I can fix that up while committing, with that:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks.

-- 
viresh

