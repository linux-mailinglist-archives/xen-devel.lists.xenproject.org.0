Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D37BFF15
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 16:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615061.956214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDdJ-0000Zc-Nd; Tue, 10 Oct 2023 14:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615061.956214; Tue, 10 Oct 2023 14:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqDdJ-0000Xw-Kh; Tue, 10 Oct 2023 14:22:49 +0000
Received: by outflank-mailman (input) for mailman id 615061;
 Tue, 10 Oct 2023 14:22:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KIu=FY=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qqDdI-0000Xq-LN
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 14:22:48 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b98e550-6778-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 16:22:46 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53447d0241eso10229390a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Oct 2023 07:22:46 -0700 (PDT)
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
X-Inumbo-ID: 7b98e550-6778-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696947766; x=1697552566; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jjgCMQrMRxO7UT+Dgjs8+PUls1MVudu/KuMSQSGIC0Q=;
        b=Jq7Lruc31OsRK4qLg0rrIxL+FvyFzip/Xq0aTznd1bZcUYUtgltOgZthb4xW9yl1ki
         13TwfBgKIlvYeg9AQZIdad9xZQ3YLpR+hvVTnqyYmHtHK6B3XfpT4WlVNa7uLeELiULI
         pra9Lj08Kb/m8J4NJ7lD3R5jm/FULVpz7PS1WN4THEXfa384apmUjjyVUpI3Fwyw1mwv
         +FlJ+2v1iaEHJMRvXzoFfMawjLgeLjZ7NNMCPMaO1ncR7anrKdRi9Xv60tg9/MfFCJ0V
         G3YMAfTxdepSjS8W4J0SKbExFCjojWFbKTnRkCyfSgTcee1sWx1ZJlcMSovZGinZNbuz
         mvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947766; x=1697552566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjgCMQrMRxO7UT+Dgjs8+PUls1MVudu/KuMSQSGIC0Q=;
        b=xPf1wRRzDRlG4zzrFJZ1yO/aBpGOyhMVfiNiCf0tuPuNfWDU0T/nE1lLHLIzu1pHEo
         /cwd4wR7EQ8NzM0piWyahMbLLhOKTd/kYXi7h2jqCoPHTIJ3gOKhtqjrQN/9Av+f+H4O
         UVBb4+H7ihFKkbUJ4smmH22oQuzS4d2K7EcPfW+cF6bRDJLG27YNKStKKwPPpXwkZal/
         RzArfAjD46NfDh1DMdLhwHAd7jcEtkB3yPsVe1Vt5KnHK7ZLa2WQ5fo5oCoNeO1eXgmA
         F1q0RWulTkK5Bh4mKHp67tqIl69d35Bx8hJrtw3GjsBNlsO+lYKqM0qc7dwAQyCtkOVD
         Y6cw==
X-Gm-Message-State: AOJu0YwEQpJgpIaLEIW4bAIjBY6dsxrTLj/g/alPD+O/gwVjR/qd0BVH
	y6G4SeTlqXKMSSq73cT2I9oCoirxGuO11sETvPyhDw==
X-Google-Smtp-Source: AGHT+IGEzqDJ7Iy6V8fGm6hyIdbMLIhMRY6DQ2ciMjUlAXpHOvBPGkT6Hr6/thaPTJdBzt6mz7WRCQImQ+TQaICLcuc=
X-Received: by 2002:aa7:d5d0:0:b0:522:6e3f:b65 with SMTP id
 d16-20020aa7d5d0000000b005226e3f0b65mr15498021eds.33.1696947765800; Tue, 10
 Oct 2023 07:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1696850733.git.viresh.kumar@linaro.org> <957de2a53dde99a653b47af9c95bc17692870294.1696850733.git.viresh.kumar@linaro.org>
 <920a671c-1927-4086-950f-db8e3293a989@linaro.org>
In-Reply-To: <920a671c-1927-4086-950f-db8e3293a989@linaro.org>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 10 Oct 2023 19:52:32 +0530
Message-ID: <CAKohpon4aYmr9TxhS8H7fVTU_xyhvErr12qViuYAUEf8RX5DGg@mail.gmail.com>
Subject: Re: [Stratos-dev] [PATCH V3 2/2] xen: privcmd: Add support for ioeventfd
To: Bill Mills <bill.mills@linaro.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, stratos-dev@op-lists.linaro.org, 
	Erik Schilling <erik.schilling@linaro.org>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Bill,

On Tue, 10 Oct 2023 at 18:52, Bill Mills <bill.mills@linaro.org> wrote:
> On 10/9/23 7:29 AM, Viresh Kumar via Stratos-dev wrote:

> > -config XEN_PRIVCMD_IRQFD
> > -     bool "Xen irqfd support"
> > +config XEN_PRIVCMD_EVENTFD
> > +     bool "Xen Ioeventfd and irqfd support"
>
> You certainly know about kernel policies better than I but why the
> CONGIG_ name change?
>
> With this change all downstream distros need to find this and re-enable
> it if they want to keep a working Xen system.
>
> I presume the kernel can still work in the old way and not use your new
> mode correct?
>
> I would certainly change the description but I wonder about keeping the
> CONFIG_ name the same.
>
> No issue if I am obviously wrong and this is done all the time.

You are absolutely right Bill, but this is a special case. The CONFIG option
here (XEN_PRIVCMD_IRQFD) is recently added (by me) and is currently
present in linux-next only. Hopefully this and the other commit will make it
to Linus's master together.

No one using this currently downstream and so life won't be that complicated
for anyone and so I wanted to put this under the same config option, since they
are related too.

Hope it makes sense.

--
Viresh

