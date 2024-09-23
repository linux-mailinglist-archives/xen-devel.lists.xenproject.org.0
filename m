Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1297E7FC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 10:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801734.1211723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssesP-0007Pd-Hg; Mon, 23 Sep 2024 08:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801734.1211723; Mon, 23 Sep 2024 08:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssesP-0007NK-F6; Mon, 23 Sep 2024 08:57:01 +0000
Received: by outflank-mailman (input) for mailman id 801734;
 Mon, 23 Sep 2024 08:57:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MtUH=QV=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1ssesO-0007NE-FO
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 08:57:00 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caa270b8-7989-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 10:56:59 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7a9acc6f22dso428781885a.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 01:56:59 -0700 (PDT)
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
X-Inumbo-ID: caa270b8-7989-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727081818; x=1727686618; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXCEox1KgGN3mu8FYRVt4eADy3kYzAmCel25yYGDVGY=;
        b=DJ0OXNFnpbATP4Qd5W2aygBKOEt7bBq1t3hHLnxNu5F8UgVFHlo2znO0o1h8L9PMps
         oT5dVseRMubduRFJiS+NCkTSq590kuDUI8/vsJ7NcM6zJA3fZNjRqwjapm4gbFrY9F4+
         tA43bsVfiFgav04T5JeQI9vEHEGjWHZV+TYLxGlBEjXooIpuozMh7GLDRs1e4hoAWaa5
         FNGG9NuweKnpyZHeTptpoI2aISPvrheW8z0zMV6Fe+0Eh4QEsATj1wHzzUi6kT3lHtow
         6NU8+njxYCxHm0eek3oAYSiiHlI/AQArzowWWSbgPurOCbPpN1m2Buj8tvtJwNukGVLF
         ekTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727081818; x=1727686618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXCEox1KgGN3mu8FYRVt4eADy3kYzAmCel25yYGDVGY=;
        b=CszDPJ75kPNzY1AFsIbiuy0VGnxDOs4Ha+vgesOmIL4hQK3Qbi5HGKsZGrr5/6r+MH
         lwLtNOA95k4qaYq/OESSC+jqHhchBYippwPeqZH9mK+IyLnacezZdQket1aJzOkW1nuZ
         v2HWhh9vLBuPCSmzOlpz+6DlOtRJ0fQ/R+Wl35Dx17PfMMLuO/Xmhv4x9GKdOP87Kkwu
         frWVluW9gCozZDLFbQcCZlosuCdrV0A4tAwe5sBfb2v6F6837dQfrr45mobwZmKLfjJs
         DpWNI63xAOO1fmBaoaoNwNTigVKkozkdJxZSR9kuRErF+Wxwcr1A60NdT1qZFuoeGf8G
         z9oA==
X-Gm-Message-State: AOJu0YwLismzTnVw6qNEk8omwgobTaa77tmKdiAwV4/yrRr5X6SjhLq2
	Zqb8cqjYd3JNFrPAVhUPRq1msAKeSg6YYgEtZvD/74D9wsig5sNjFMMkPM0pXLtru0Vh5CTT1Hu
	l7myIijjeplLX3Qb/bTG8qNLbO4o=
X-Google-Smtp-Source: AGHT+IE0YLWiUczMPk1PBD/F5DQMOOCCRZnGtuOp0q6MTqB3YwMkumGQ5+7UOwQXCj+AuCr3iMlvZcAsKOmQAqVDCgQ=
X-Received: by 2002:a05:6214:4a8e:b0:6c3:6d8c:b293 with SMTP id
 6a1803df08f44-6c7bc65b4damr229578156d6.7.1727081818348; Mon, 23 Sep 2024
 01:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <6cf2799ced7dcee515ad8a6b6657522cdc7cec61.1724699546.git.milan.djokic@verisure.com>
 <367c5d95fb89e7dd3b4260f136d194a4cd0b854a.1724765763.git.milandjokic1995@gmail.com>
 <CAKp59VFp8gNA6ndeK2DeE9EaRZJSup0ptYYPz4FwN4_Shx9SjA@mail.gmail.com> <CACHz=Zh7FB0h26zJDZnzkVRatwhTb=vWMA0TM+fpqZ=RtULTJA@mail.gmail.com>
In-Reply-To: <CACHz=Zh7FB0h26zJDZnzkVRatwhTb=vWMA0TM+fpqZ=RtULTJA@mail.gmail.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Mon, 23 Sep 2024 10:56:47 +0200
Message-ID: <CAKp59VEDE=9o4r_=n_bf_W=VOMvCpz5d_oBCDqkPSruO9ZUr=g@mail.gmail.com>
Subject: Re: [PATCH v2] x86/efi: Use generic PE/COFF structures
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com, 
	Nikola Jelic <nikola.jelic@rt-rk.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Milan Djokic <milan.djokic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Frediano,
Thank you for your feedback
>
> On Thu, Sep 19, 2024 at 11:42=E2=80=AFAM Milan =C4=90oki=C4=87 <milandjok=
ic1995@gmail.com> wrote:
> >
> > Hello everyone,
> >
> > Any comments on v2 patch?
> > Just checking if you missed this email or didn't have time for review.
> >
> > BR,
> > Milan
> >
>
> Hi,
>   it does look good to me.
> I don't like the "#include "../../../include/efi/pe.h"" line, but I
> don't exactly know how to add a -I option.
>
Yes, this does look bad. Although, I don't see that we have other
options with the current build setup. mkreloc is built as a separate
binary and it's added to the hostprogs list, for which we are not able
to add additional flags. Relative paths are also used for other
hostprogs when some local xen file needs to be included. Only solution
which I see here is to have a separate makefile for mkreloc, but I
would say that this is also not a good option, since we will separate
mkreloc from other hostprogs in build config. If someone has some
better idea here we shall be happy to apply it.
> There are some spurious space changes that could be removed but okay
> for the rest.
>
Space changes are caused by our formatter which aligned this file
according to coding guidelines. We can revert those if formatting
needs to be done separately.

Best regards,
Milan

