Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBFC9D4D33
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 13:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841496.1256982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE6hC-00084H-7v; Thu, 21 Nov 2024 12:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841496.1256982; Thu, 21 Nov 2024 12:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE6hC-000829-4P; Thu, 21 Nov 2024 12:54:06 +0000
Received: by outflank-mailman (input) for mailman id 841496;
 Thu, 21 Nov 2024 12:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn03=SQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tE6hA-000821-Oa
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 12:54:04 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad73cb04-a807-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 13:54:00 +0100 (CET)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3e6104701ffso529814b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 04:54:00 -0800 (PST)
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
X-Inumbo-ID: ad73cb04-a807-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoyMzMiLCJoZWxvIjoibWFpbC1vaTEteDIzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFkNzNjYjA0LWE4MDctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTkzNjQwLjg2NzM0NCwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732193639; x=1732798439; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLPa+qQyIO24nnTKnhVPUqe2MzOVpFhfno5x/j5Xi0Q=;
        b=QzoswdoBQulZ3Grci5ufza9523cj4oUl3LFqtdA4w3sWQSbx5LilmOXP9bAyXr6t1S
         QitEdkKwIqQcwbzeRHCMq9UwurFACCBDlJ2VJ3+pJdWMw9dSd1PnUYAffKBZ9rg3zvvg
         DwaNiReFFdp/pWP/VFaNdJkBOIBpOGP78P2cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732193639; x=1732798439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLPa+qQyIO24nnTKnhVPUqe2MzOVpFhfno5x/j5Xi0Q=;
        b=H+2+4rGcK40nUiJD2KqLhlDcmfu877Frtf7N8aGPnUM8KAW1BJqUZikJCSwkRtuyZ/
         lYpkvXqefvnna35+xW1VPC+2tuiuFfRoRzz0RE/fuSLykhdMnRD9+5dJoEn9Zk54EAQy
         8nOssA3u47gT4+fXGMnylGJFF6m1Jt6l6TlMXu3eDuHQ3UTQJ4wVa3uDyio6clnl8xhe
         XZpTTFcC8t6jsw1rgEpD2Fk8/DhPTctLHo6Sfxr9xpE7G3kopa2p7iOiWuoMMKQ4oovQ
         J+uD1RcLp+s34N8t3Fm2RUC220KxksHRvp6DRWR7AgFlT3s0HxN+eDOBZCg/kqGltAWa
         5wZw==
X-Forwarded-Encrypted: i=1; AJvYcCW7NDynEG9B8ge4oRd/j4nUgkQFkcEFHLPbZH5FSpm6pHZRnkPovt31/mj7oRxPPRSwEUi46Bw8dNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFP0ffuF2Xeah2pERfvuAeTSzUnpIb6KaeXHvua5o34VN3ef9Z
	nw9OqJnN1N1U+uXTkrVaJ6ez25Z64c4gGU3bzg80F1mPurfq2vG967RlDTpZHX/ijbEHTqWeBTn
	QT0uVgq83bADTsEY0zUNT2+nIAWhMZoM5NuZAQg==
X-Gm-Gg: ASbGncsjaKqTbkgBivL7GTmel9gfrFpvRBwqrsYBq+niU+qgX8OL16G3OKOjPZCC6FM
	42CrhqdOnZXb9EOw/7BG7XD0hZsFQI+SZSw==
X-Google-Smtp-Source: AGHT+IFOmCUreIG0NoTBI7BBYX0sf6zyXXLFu7pJYpzd5rkcHzsMuzuq4SHX9Lr6ocqwaL2DFuxAX3VrhtwD8HIyH5o=
X-Received: by 2002:a05:6808:144c:b0:3e5:f656:dd19 with SMTP id
 5614622812f47-3e7eb6f1e6bmr6737995b6e.19.1732193639483; Thu, 21 Nov 2024
 04:53:59 -0800 (PST)
MIME-Version: 1.0
References: <e470822f190a41b2f1600821b81d7ad158ed33db.camel@gmail.com> <227db2a2-d36f-453e-8886-b8ef0d5f9616@citrix.com>
In-Reply-To: <227db2a2-d36f-453e-8886-b8ef0d5f9616@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 21 Nov 2024 12:53:48 +0000
Message-ID: <CACHz=ZjnfL_MorLcwduhJpUjFLX2y3KtQE8Pd4s=V68OgiV_rA@mail.gmail.com>
Subject: Re: Xen 4.20 release schedule
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: oleksii.kurochko@gmail.com, Xen-devel <xen-devel@lists.xenproject.org>, 
	Community Manager <community.manager@xenproject.org>, 
	"committers @ xenproject . org" <committers@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 1:25=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 21/10/2024 1:02 pm, oleksii.kurochko@gmail.com wrote:
> > Hello everyone,
> >
> > As there were no objections to the proposed release schedule
> > (https://lore.kernel.org/xen-devel/CAMacjJxEi6PThwH2=3DNwG3He8eQn39aiax=
ZCw3bQF7i4YcmjuNw@mail.gmail.com/
> > ), I've updated the wiki with the schedule for Xen 4.20 release
> > (https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes), and
> > it is now accessible from
> > https://xenbits.xen.org/docs/unstable-staging/support-matrix.html.
>
> I have a blocker to raise (against myself...) and no good idea of how to
> proceed.
>
> The for_each_bit work has a unexpected bug.
>
>     for_each_bit ( ... )
>     {
>         if ( ... )
>             break;
>     }
>
> will fall into an infinite loop.  This is caused by for_each_bit()
> hiding a double for() loop, in order to declare two scope-local
> variables of different types.
>
> The two variables are one copy of the source expression (really quite
> important to keep), and one unsigned int iterator (improved optimisation
> capability by not using a wider-scope variable).
>
> Options are (off the top of my head)
>
> 1) Always take the iterator from outer scope
> 2) Iterator always the same type as the source expression
> 3) Figure out some way of expressing "once" in the outer loop
>
> Or anything else that I've missed.
>
> ~Andrew
>

Something like

#define for_each_set_bit(iter, val)                     \
    for ( typeof(val) __v =3D (val), __c=3D1; __c; __c=3D0)   \
        for ( unsigned int (iter);                      \
              __v && ((iter) =3D ffs_g(__v) - 1, true);   \
              __v &=3D __v - 1 )

?

Frediano

