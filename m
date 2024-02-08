Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7D84D962
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 05:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677980.1054954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXw5S-0001eV-8M; Thu, 08 Feb 2024 04:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677980.1054954; Thu, 08 Feb 2024 04:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXw5S-0001bb-4d; Thu, 08 Feb 2024 04:32:34 +0000
Received: by outflank-mailman (input) for mailman id 677980;
 Thu, 08 Feb 2024 04:32:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gCg7=JR=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXw5P-0001bV-Uf
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 04:32:31 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f877d14-c63b-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 05:32:28 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5116ba772dcso1125045e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 20:32:26 -0800 (PST)
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
X-Inumbo-ID: 0f877d14-c63b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707366745; x=1707971545; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLrj5IveP/vEqO7sfcC1oMCN9R0hIR+aMlfjkSVMrTU=;
        b=HDE4RU+s+y9vkPVs14wC7FMyqQC74mqRhGA/H861UiWy0Mq+XryWNyQWxeAAVvNly4
         XuuK9+w/ooTqBTd7wHh0dfHYMiwRgS7CYU7QyEporAFiMPWWAtyAwW9KJQooiwcBaJOq
         LxPWnL0rLPWbLMS8l3KdmE/DVgNq4rbw288xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707366745; x=1707971545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLrj5IveP/vEqO7sfcC1oMCN9R0hIR+aMlfjkSVMrTU=;
        b=JTuB6h4g1YWvQw7wfKY0j9YFHcjvOBwE6JsWo9Qo+b3BKNKauBdwJZmZt6GvRfE1Af
         44XvPLnnV1cZVVcO9zv4e3Yx1UIsVhHgAnkbHyODLSiXp5KP9dxiGH/8yA2Y1YyAz0zI
         oWpIzQfmYSUQyO8sglbv+7aIM0XIJzsHH4/9UGaXVtqvzCcFxIexEMdo1CCPgkwPkAWt
         RjVUlt2o5m7rsn+aeFyq3W92+CBXHFnTefKx3R+fNfvQzeueQq/+EC3dSvyxqq/NAtsz
         PdET/nE0kjn5HkBnYzbl7iyDt1jCCZRwA1jqQVZopRAIHl3bP41Cwa88Yy2U/+xvwiVh
         D4Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWjtzmo74QWBT8XDvHPC4AmGyWdqlyygpd2JPJCVbqAErIAMo5LA+f5Gi139ifTya3q6YFSgH5Az/y6lIo6hDguzjT+m+REtK5LdWp8RuE=
X-Gm-Message-State: AOJu0YxPgoZA95PMOVb8DWhbhAOTBS3uxprxj/Ks8MDZXnCjZ3UfcT/0
	kaoDbAZRH+horjwvOHc0xiiLHkCmlaKH6zv1CjtGv9jCa5n/0LLsGYnXTu+q7h3yAFeXkyuIZEp
	OHebzpUw8V3JT7CmGpxSu3iO3l3U0iCqPQkB4sQ==
X-Google-Smtp-Source: AGHT+IEZzZlfVyEQYBNYIf9/kYGrGOIl9/4R49z6p7u5xBBP4X3qaveiFdXQg6RJyzrBtxGK6BhaaVhgvXszLKxkuqk=
X-Received: by 2002:a05:6512:10ca:b0:511:693c:976c with SMTP id
 k10-20020a05651210ca00b00511693c976cmr2087664lfg.47.1707366745623; Wed, 07
 Feb 2024 20:32:25 -0800 (PST)
MIME-Version: 1.0
References: <1b854c6b38787675294c58eea25556ce241b2b4f.1707213023.git.w1benny@gmail.com>
 <CA+zSX=beYAGb81zqD19YNAV3cXPFTk-7V68XYn59Eb3mGFH_Jg@mail.gmail.com>
 <507f29cf-7a07-4f3d-81e8-2236a8380b1a@citrix.com> <CABfawh=6AHZzH1aBP2A=oRUTvjVmgd6QQNxEQAwGCBV_9-CTcA@mail.gmail.com>
In-Reply-To: <CABfawh=6AHZzH1aBP2A=oRUTvjVmgd6QQNxEQAwGCBV_9-CTcA@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 8 Feb 2024 04:32:13 +0000
Message-ID: <CA+zSX=Zou19sjb8ToLTaMjLHLYmqptsMXCT50Y9MwGykOaTrZQ@mail.gmail.com>
Subject: Re: [PATCH] x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>, 
	xen-devel@lists.xenproject.org, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 9:21=E2=80=AFAM Tamas K Lengyel <tamas@tklengyel.com=
> wrote:
>
> On Wed, Feb 7, 2024 at 5:21=E2=80=AFPM Andrew Cooper <andrew.cooper3@citr=
ix.com> wrote:
> >
> > On 07/02/2024 1:18 am, George Dunlap wrote:
> > > On Tue, Feb 6, 2024 at 6:08=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail=
.com> wrote:
> > >> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> > >>
> > >> This patch addresses a behavior discrepancy in the handling of altp2=
m views,
> > >> where upon the creation and subsequent EPT violation, the page acces=
s
> > >> permissions were incorrectly inherited from the hostp2m instead of r=
especting
> > >> the altp2m default_access.
> > >>
> > >> Previously, when a new altp2m view was established with restrictive
> > >> default_access permissions and activated via xc_altp2m_switch_to_vie=
w(),
> > >> it failed to trigger an event on the first access violation.  This b=
ehavior
> > >> diverged from the intended mechanism, where the altp2m's default_acc=
ess
> > >> should dictate the initial permissions, ensuring proper event trigge=
ring on
> > >> access violations.
> > >>
> > >> The correction involves modifying the handling mechanism to respect =
the
> > >> altp2m view's default_access upon its activation, eliminating the ne=
ed for
> > >> setting memory access permissions for the entire altp2m range (e.g. =
within
> > >> xen-access.c).  This change not only aligns the behavior with the ex=
pected
> > >> access control logic but also results in a significant performance i=
mprovement
> > >> by reducing the overhead associated with setting memory access permi=
ssions
> > >> across the altp2m range.
> > >>
> > >> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> > > Thanks Petr, this looks like a great change.
> > >
> > > Two things:
> > >
> > > - Probably worth adjusting the comment at the top of
> > > p2m_altp2m_get_or_propagate to mention that you use the altp2m
> > > default_access when propagating from the host p2m
> > >
> > > - This represents a change in behavior, so probably at least worth a
> > > mention in CHANGELOG.md?
> >
> > This is a bugfix to an tech preview feature.  It's not remotely close t=
o
> > CHANGELOG material.
> >
> > Tangent.  SUPPORT.md says tech preview on ARM, despite there being no
> > support in the slightest.  Patches were posted and never taken.
> >
> > > Tamas, I guess this is OK from an interface compatibility point of
> > > view?  In theory it should always have been behaving this way.
> >
> > Given the already-provided Ack, I expect that has been considered and
> > deemed ok.
>
> Correct, this is just a bugfix.

Er, ok, just one more comment: this could allow an altp2m to have more
permissions than the host; for example, the host p2m entry could be
p2m_access_r, but if the altp2m's default_access were p2m_access_rw,
it would override that.  Is that the behavior we want?  Or do we want
to do some sort of intersection of permissions?

If the former, I'd propose the comment be adjusted thus:

 * If the entry is invalid, and the host entry was valid, propagate
 * the host's entry to the altp2m, retaining page order but using the
 * altp2m's default_access, and indicate that the caller should re-try
 * the faulting instruction.

I could do that on check-in.

 -George

