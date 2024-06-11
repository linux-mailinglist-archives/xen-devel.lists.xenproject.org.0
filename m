Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 561069037EC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 11:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738196.1144866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxu1-00028j-Kz; Tue, 11 Jun 2024 09:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738196.1144866; Tue, 11 Jun 2024 09:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxu1-00024H-Hh; Tue, 11 Jun 2024 09:34:53 +0000
Received: by outflank-mailman (input) for mailman id 738196;
 Tue, 11 Jun 2024 09:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rr1P=NN=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGxu0-000247-Bl
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 09:34:52 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d92deb77-27d5-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 11:34:50 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6f97a4c4588so1785054a34.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 02:34:50 -0700 (PDT)
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
X-Inumbo-ID: d92deb77-27d5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718098489; x=1718703289; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCPQMBYY0J4AiCv1dyzFad01O/YvgYeZmL/mAmkRHB8=;
        b=HN3WVP1IVZVBHcRzsUfnVCXPnJp0KtCZ2FICbu3t9fIrWMgTGZQNJnsfrlguATrzR0
         oUzqhDX6VXcuzodkquntL13ih5BoE9UAExTrNbWMHqKMcIV6LS57BFjiTjqSb9dUSbOv
         VxpLzrGGLb9FGHrgUHpGtlRsUhO6zW3YC2L1e2rQzAPcs7ZUP3MBYelmt9HtXUdjUxGH
         BHIQ8V0yp2uR180lxs5rPic5FeIusziaAEqRcVfEtj21Yxy6aPu0AkkglxWqlaCNqqVH
         NwKSULE+ytz/MknbKi2whUHjuQgskLAdBSPGzdD+hajuJ3zu+qv1qI725FsBq9uV+MQ8
         r1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098489; x=1718703289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCPQMBYY0J4AiCv1dyzFad01O/YvgYeZmL/mAmkRHB8=;
        b=cVSdJ0bXwsRmetIBfrlvywoK9W56rnqNkUlhc4IXTkI1uoKSuf60Vj9LGv47b0ftl0
         JecWeyzIrj8md6y8Fekjnk7lFlqwNpavi+mKkusepciSk1ov3NTUaThiWCLIRDO+JCc0
         O/pGUXv3mp3q/NhPoSQ0BQ6qup/CqRz9XiHoPm2nSbbkDEWklWvt9H3run+ztsG6PwL0
         I3DLX9GDT7uepXzhbGEyMrRfkN2Psd3YeJKKyFaNpQS9HsdatJ19MeIblzIiAkeBri1v
         pRJYsApPdWvIH4X1EUZ18KRe7UpBvVjaAd2QviiIPIOZqufyHe+ag0nn74rJby4UGIRe
         fV6w==
X-Forwarded-Encrypted: i=1; AJvYcCVgVpUimA4yluNDXr9qeR+sPj+Yd193/hRFTkI6InIDe9B4uH+naPohL7nQnousT1Ws08OmtKu8JACOxra8YisXlSQZzv6v+5DVTcXnJXw=
X-Gm-Message-State: AOJu0YwQJ5ZJ3BI157TbnKQQSCqIpc5/tYkPUbC9+K9xnjQVEpsTZ4mV
	plLX54KdbrcC4Sf1V/KDJa+T50eNSpg4lPcTaCOgCx1c6EWB8JuTSmWqqg+6gzy0s5nOHrf/Fn8
	LKDNWUNfGkOq0lVb7GAm4PDneZzo=
X-Google-Smtp-Source: AGHT+IFnNsxRD2WxB8PrZcdHmOO7p5dwF3j71uoFD9ah8g4jNP55HWn3xF1m/HjdWah08g4BdlCwpkXqM0Zvjxreomc=
X-Received: by 2002:a05:6870:f144:b0:250:67c4:d73c with SMTP id
 586e51a60fabf-25464ccb42amr12685336fac.28.1718098488919; Tue, 11 Jun 2024
 02:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718038855.git.w1benny@gmail.com> <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
 <8787608f-f3b0-4fb3-95ee-98050cf95182@suse.com> <CAKBKdXiiZdz70nWx7kqp2S5RdbRsku+qtn6z9DBk44LZOgp3Qw@mail.gmail.com>
 <217202e9-608f-4788-b689-8140567e4485@suse.com>
In-Reply-To: <217202e9-608f-4788-b689-8140567e4485@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 11 Jun 2024 11:34:38 +0200
Message-ID: <CAKBKdXhzRZuaiZ+cDYD=ofShgRySbGyZjSZe=G9Rdd0T8wof3A@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v6 3/9] xen: Refactor altp2m options into a
 structured format
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 11:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 11.06.2024 10:00, Petr Bene=C5=A1 wrote:
> > On Tue, Jun 11, 2024 at 8:41=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 10.06.2024 19:10, Petr Bene=C5=A1 wrote:
> >>> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >>>
> >>> Encapsulate the altp2m options within a struct. This change is prepar=
atory
> >>> and sets the groundwork for introducing additional parameter in subse=
quent
> >>> commit.
> >>>
> >>> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> >>> Acked-by: Julien Grall <jgrall@amazon.com> # arm
> >>> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
> >>
> >> Looks like you lost Christian's ack for ...
> >>
> >>> ---
> >>>  tools/libs/light/libxl_create.c     | 6 +++---
> >>>  tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
> >>
> >> ... the adjustment of this file?
> >
> > In the cover email, Christian only acked:
> >
> >> tools/ocaml/libs/xc/xenctrl.ml       |   2 +
> >> tools/ocaml/libs/xc/xenctrl.mli      |   2 +
> >> tools/ocaml/libs/xc/xenctrl_stubs.c  |  40 +++++++---
>
> Right, but above I was talking about the last of these three files.
>
> Jan

Ouch. It didn't occur to me that Ack on cover email acks each of the
files in every separate patch. My thinking was it acks only the
patches where those three are together. Anyway, it makes sense. I'll
resend v7.

P.

