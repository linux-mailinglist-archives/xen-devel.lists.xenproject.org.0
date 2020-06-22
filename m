Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEBD204026
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 21:20:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnRzR-0001no-LH; Mon, 22 Jun 2020 19:20:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OZr4=AD=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jnRzQ-0001nj-2l
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 19:20:20 +0000
X-Inumbo-ID: 688cd16c-b4bd-11ea-b7bb-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 688cd16c-b4bd-11ea-b7bb-bc764e2007e4;
 Mon, 22 Jun 2020 19:20:19 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y18so1677351lfh.11
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2020 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FQGOol6oHmAM1Ng4z/uCNOq7Oann9kEoHMOFg8EwYLs=;
 b=IFBDbRGuOV6E9NDzvc7om4hzvpex+EGEmN8GTzzHydmrjGWlNV1uO2E/g0yWsPAWi9
 zjE8fuW1yOUP8g12Xuq00kdOTLqwSAJjTTg4ZhbhSNW78kg7QgBPir5Ap1BUj/a16o21
 J57EE3or5bby4Cv0SEw6LiqfvNQgXwWltI7MvZlT8kzMM3Tsk60+advzEk7PdkR7W8ew
 lAX4Uf72XIJc7hIEhbjko+c/4/DUWSRg2tWy/gAaZ6fE3lyf47k3iqQJVh4oETlneyHj
 rbyugQ5vCtpTGtNlXxITC7wQNanT6yfSqWFi8FTnk95apjQCxRAxuFuuW7sA49kDUMsN
 wbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FQGOol6oHmAM1Ng4z/uCNOq7Oann9kEoHMOFg8EwYLs=;
 b=QQPqW8lF3daF5ru+UGgWBtSvYCaOmWFv9I6SL14yN82gshU1Brm4JEHT+6l8Sn7cnU
 8vAycMXdRUDBfqQG9EAh2ozcIRb0CChS1PjRsxo+I57k/L5oPmowtvbsJaQM2YEpm57b
 qTHEAmBoCmKVIPYbF71XT9SDv5AC7iNuj3lORWpFvZfjIHSa9txDtabkVjWLosYRXUKQ
 Ap1tlt5IW98xnRU7/lY2G0Dk1Zoiba/RESK5VbGeqHEDbJs61qzPeHFT04x8SkhtrAB4
 nHeYYU8uAju8kO7X6BKfftk2e3itviKwsnfvpDX1/6s26y3v+0UpGEu6rufJCxiY2nvE
 mHeg==
X-Gm-Message-State: AOAM531phwGYfINbqbsir3VdPyQNLmcnPsmlhinXO+7m+obLDtEgsrY0
 bo+xWezq/1ewQcyaRtcyoKfAqnS4fLYAt4E1vI0=
X-Google-Smtp-Source: ABdhPJz4RZaNe5vITzo3tnXIR0fi+rJgtxh0xTAogXKk2pl7INIbw94pdlI6wWGIyDWeWTdqocO4Dka7MgKG6ttG2UI=
X-Received: by 2002:a19:b07:: with SMTP id 7mr10494968lfl.38.1592853617855;
 Mon, 22 Jun 2020 12:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <1592363698-4266-1-git-send-email-jrdr.linux@gmail.com>
 <d9e8ad0f-f2aa-eea4-5bc7-a802c626ace6@oracle.com>
 <CAFqt6zbJD+k9xkV9Se0nL2qKfnea3mRrWJ4gzPmPJBquYk4M+w@mail.gmail.com>
 <fe2a1d23-7abd-86a9-4aec-2c14fb11cdea@nvidia.com>
 <CAFqt6zb8hK+mpqfrZ_QoGLO4nNfbHvZ7aJLRrcNRgDsywFHKqg@mail.gmail.com>
 <5a5133e6-b84d-a2cc-fcb4-db85c4e65d62@oracle.com>
In-Reply-To: <5a5133e6-b84d-a2cc-fcb4-db85c4e65d62@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 23 Jun 2020 00:58:32 +0530
Message-ID: <CAFqt6zY0wGGL2gkL9Vi3udEp3xNUzUoGmuJpj_H1ff7EBYr-qw@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, paul@xen.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 23, 2020 at 12:40 AM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
> On 6/22/20 2:52 PM, Souptick Joarder wrote:
> >
> > I read the code again. I think, this check is needed to handle a scenario when
> > lock_pages() return -ENOSPC. Better to keep this check. Let me post v2 of this
> > RFC for a clear view.
>
>
> Actually, error handling seems to be somewhat broken here. If
> lock_pages() returns number of pinned pages then that's what we end up
> returning from privcmd_ioctl_dm_op(), all the way to user ioctl(). Which
> I don't think is right, we should return proper (negative) error.
>

What -ERRNO is more appropriate here ? -ENOSPC ?

>
> Do you mind fixing that we well? Then you should be able to avoid
> testing pages in a loop.

Ok, let me try to fix it.
>
>
> -boris
>

