Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3BF6B95FA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 14:21:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509594.785635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc4aW-0001DN-RW; Tue, 14 Mar 2023 13:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509594.785635; Tue, 14 Mar 2023 13:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc4aW-0001AN-O2; Tue, 14 Mar 2023 13:21:12 +0000
Received: by outflank-mailman (input) for mailman id 509594;
 Tue, 14 Mar 2023 13:21:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfqj=7G=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pc4aV-0001AH-8Q
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 13:21:11 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 154bd254-c26b-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 14:21:09 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id cy23so61831419edb.12
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 06:21:09 -0700 (PDT)
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
X-Inumbo-ID: 154bd254-c26b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678800069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nok1tUyiv0qyZZPdc9hqlwYoA/efOqe+4qolfrtnnws=;
        b=VDYtSL1FqFvJUqnWouqmbaLviy3xq/5zS3213EB+a1n4JNN5VBkUDBG8AEXneXLqHu
         c7XRbW11a+QwoiaGXGCnd9gu0qowyvqpl7pTOZHGJYo72RDAtL7MOilJLsMCtte+NiLB
         Db6NxMrjRrZIqX8T2svrazQ6lbrk9yjkp6TVDCOdi4Wm6N8RoXyaQ6EvNlkmjG/tBfyV
         fTKqpUCNMNgYZU8tNo466fdpmSi+qAnzt4ihu3C6imJmDwuU7oKbydYWtxzcbUbY/pbL
         Kk5xPs+40StdDuX6ZCpBJ9CuNwSF53Dxa10fG43rypBtnvGWoPiZsuXCQMMcLKuq5Saa
         pvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678800069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nok1tUyiv0qyZZPdc9hqlwYoA/efOqe+4qolfrtnnws=;
        b=QrAgcOrvx8OGb60Ecn0j3MhlQq1DcAQql0eAiWHXbQbbF993VLJ9tlhtAqWfEYsdZF
         GM4vYj6QxRS4pr3ExY50OuCtqdv3b67RV2E6GkFTOeo3Lf3+z7OlnMInmr4zl8cAn7I6
         xhGHHyXCnvVX4oqghQ0/8umc2Q3hLbAqPoVQWpITLuJRRaAMqFyySdyAnPQPUcz76QZS
         +BXWpVSB4yh1twJKObxPc9lKX4BVmeMabKeQWeyQoi9VRgQFcu0TBT1pZSvdx12salsb
         0bMMKpqoGzvLU1DQxaITAzXZITvPyyCcF0EmCOOAB3oTIJ9XjcZRf8tab2pgCGAUcDqx
         QqHw==
X-Gm-Message-State: AO0yUKVeLNyV/3JbgyyEMNaSeHTlo6BFkuhOfVHGBI2ArUQ29q3PKBnH
	tIKtLilprvhKZpta4Y/XeOlp7D2weqFjoQfirSs=
X-Google-Smtp-Source: AK7set+AKACa24e8QIBLjUW65VLcR5Y6PylrsE9hpGf/o2fiyFkkthz2bknwnR2bpwVksMT0MwihTMhxGCIbh3BNJRE=
X-Received: by 2002:a50:bae1:0:b0:4ad:7439:cec7 with SMTP id
 x88-20020a50bae1000000b004ad7439cec7mr20257942ede.7.1678800068808; Tue, 14
 Mar 2023 06:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230313175047.20719-1-jandryuk@gmail.com> <a990fe77-6132-c5df-c149-6255fb13d845@apertussolutions.com>
 <CAKf6xpt02aK7SWNb=xB3kKZB3Dt9UC8mMKMVz5kq96uNJvdzbQ@mail.gmail.com>
 <d17d7b39-28ce-55a6-8d2b-fe2dfd10c38d@gmail.com> <52c04d0b-2b30-ffc5-fe5f-72a182abfee7@suse.com>
In-Reply-To: <52c04d0b-2b30-ffc5-fe5f-72a182abfee7@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Mar 2023 09:20:56 -0400
Message-ID: <CAKf6xpv7AGqWOcv2hFYzcJLq0c3EyhUiBxvmHeSui661M6HFcQ@mail.gmail.com>
Subject: Re: [PATCH] flask: label-pci: Allow specifying optional irq label
To: Jan Beulich <jbeulich@suse.com>
Cc: "dpsmith.dev" <dpsmith.dev@gmail.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 2:42=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 13.03.2023 22:11, dpsmith.dev wrote:
> > On 3/13/23 15:14, Jason Andryuk wrote:
> >> On Mon, Mar 13, 2023 at 2:49=E2=80=AFPM Daniel P. Smith
> >> <dpsmith@apertussolutions.com> wrote:
> >>> On 3/13/23 13:50, Jason Andryuk wrote:
> >>>>                usage(argCnt, argv);
> >>>>
> >>>> +     if (argCnt =3D=3D 4) {
> >>>> +         pirq_label =3D argv[3];
> >>>> +     } else {
> >>>> +         pirq_label =3D argv[2];
> >>>> +     }
> >>>> +
> >>>
> >>> style nit: space inside parens and curly brackets could be dropped or
> >>> should be moved to their own lines.
> >>
> >> This file doesn't follow Xen style.  I think dropping the curly braces
> >> is fine, but the lack of spaces 'if (argCnt =3D=3D 4)' should stay for
> >> consistency.  Does that sound okay?
> >>
> >
> > Hmm, I thought there was interest in getting everything in tree consist=
ent, maybe I am mistaken. I am not hard pressed to enforce the style. Unles=
s someone else objects, I am good with your proposal.
>
> The rule of thumb is that if a file is (largely) consistent in itself,
> then that style is preferred over introducing a mix. (I haven't checked
> this specific file, though.) The same may or may not apply to individual
> functions within a file; there it's more likely to be considered one way
> or the other on a case by case basis.

Thanks, Jan.  The file has 2 functions.  There are two instances of
spaces within parens, and all the other cases, the majority, omit
spaces.  The next version will drop curly braces and continue omitting
spaces.

This patch should have had v2 in the subject (it has a v2 change log).
The next one will have v3.

Regards,
Jason

