Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25517FFEDD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 23:58:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645186.1007166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8pz3-00071Y-QV; Thu, 30 Nov 2023 22:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645186.1007166; Thu, 30 Nov 2023 22:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8pz3-0006zS-Nr; Thu, 30 Nov 2023 22:58:13 +0000
Received: by outflank-mailman (input) for mailman id 645186;
 Thu, 30 Nov 2023 22:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gUle=HL=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1r8pz2-0006wq-Ql
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 22:58:12 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed5680d7-8fd3-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 23:58:08 +0100 (CET)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5d279bcce64so17450827b3.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 14:58:08 -0800 (PST)
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
X-Inumbo-ID: ed5680d7-8fd3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701385087; x=1701989887; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXiMl/IIXeka1Aj/gUHafQnf9b/q3sVuGXEQoG9QPTg=;
        b=iIaBSOPPIS7xBD/flmKh+oix5oq99FCSi9NkptTYY9OkiQoNDg6OPRdkJ/r0iuYqJ1
         jfEeHRzexHAu8dgomkeudM/K5V7Iod0omsJ6fqYAQ+cIJHW9C9Z8GAPHP08wXoyFgx9i
         P+glz3sBph7GbEWv1B8hgcb6xVzu1kqwXdQs70jtxhIkFQZOFOkxXo+lt+4WbCbFDj7E
         WA1Z2SE/WC6ki4JlMcUf8IUMhVeiH0AGz+hW+nrzhBodYwPLDtARYGyi/deFn3EMuxyI
         EHF0dnjfWMOf5mBHbNXSvTfRtcC3V6SFOId0oqOP5+y3fo6TyP6qlt+VaeOiPXPa1ljl
         qDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701385087; x=1701989887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXiMl/IIXeka1Aj/gUHafQnf9b/q3sVuGXEQoG9QPTg=;
        b=Oe8LR0+ya4Dj89Bc2kUc9k0eob6IK25YWYSKFEkm4JXLwIFSQXTuOPiRbep4vJn/TM
         l6cthybtMK/bQIJFT8KUBgC2/TVJRQSFGZrdkfILENmWQfICSYPkgsxP9ExgHJK0RJrB
         lOlwl7N2pNn8kVVtgL3GR1Db48VrrRYFIEeEzPCC/Gz9ufjOo0CdXVv+GoZprFv1TcXI
         HrFIRdwAO1qHA3wBT9oIG4T76y/mO+UbA7CHaws3CNa7hLBQVfl2QTJ+Y4JCSMpXqK1I
         LC7xCFw4Vtrf3u7ABx+wwsef710zZ1SEhBFUhOEE+SmKZBIGu67yq8OeSpdWsFbNskd/
         k5SQ==
X-Gm-Message-State: AOJu0YyI5M+7emUnvipP4bbI3xRWVtgFQR1yn6ntJipHft/8JuWbSSXv
	pCwOkqrhatIB1w87plhPNsEM7QvY4c4OuUoMHWk=
X-Google-Smtp-Source: AGHT+IHIl9PAfjmhwtsblurkdKohEeMBs29OX7GaWQw3zuwC6lC8olNXE9e3w6etEHka2eXEGY7whcBv3ihBquZuqZk=
X-Received: by 2002:a05:690c:3513:b0:5d0:9a2f:26e7 with SMTP id
 fq19-20020a05690c351300b005d09a2f26e7mr16636549ywb.19.1701385087158; Thu, 30
 Nov 2023 14:58:07 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 30 Nov 2023 17:57:30 -0500
Message-ID: <CABfawhnXtOFuqNgWP=6bdX_+T7X0+T_wxQtJsxMrbtpbempuVA@mail.gmail.com>
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org, 
	committers@xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
I think this form is bad and is not helpful. We ought to be able to
recommend an alternative term beside "broken" and "deprecated". I
would not use the term broken in this context but that also doesn't
mean we shouldn't use it in any context. But also in this context
deprecated is not the right term to use either since deprecated would
require us to actually make the old hypercalls stop working altogether
at some future point, which we won't ever do AFAIU. My vote would be
to use the term superseded in this context, which I can't express
clearly in the form so I'm not going to cast a vote.

Tamas

On Thu, Nov 30, 2023 at 5:28=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Hi all,
>
> This vote is in the context of this thread:
> https://marc.info/?l=3Dxen-devel&m=3D169213351810075
>
>
> On Thu, 30 Nov 2023, Kelly Choi wrote:
> > Hi all,
> > There have been a few discussions about how we use documentation wordin=
g within the community. Whilst there are differences in opinions and
> > perceptions of the definition, it would be helpful to see a wider conse=
nsus of how we feel.
> >
> > Discussion: Should we use the term 'broken' in our documentation, or do=
 you think an alternative wording would be better? If you agree or
> > disagree, please vote as this will impact future discussions.
> >
> > I have purposely made the vote between two options to help us move in a=
 forward direction.
> >
> > PLEASE VOTE HERE. Deadline 15th December 2023.
> > Your name will be required but will be private. If you answer anonymous=
ly, your vote will not count. This is to ensure it is fair and each
> > person gets one vote.
> >
> > As an open-source project, we need to come to a common ground, which so=
metimes means we may not personally agree. To make this fair, please
> > note the final results will be used to determine our future actions wit=
hin the community.
> >
> > If the majority votes for/against, we will respect the majority and imp=
lement this accordingly.
> >
> > Many thanks,
> > Kelly Choi
> >
> > Xen Project Community Manager
> > XenServer, Cloud Software Group
> >
> >

