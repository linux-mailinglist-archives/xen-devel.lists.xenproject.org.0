Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89F808718
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 12:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649809.1014747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCxU-0003vu-U9; Thu, 07 Dec 2023 11:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649809.1014747; Thu, 07 Dec 2023 11:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCxU-0003tr-RY; Thu, 07 Dec 2023 11:54:24 +0000
Received: by outflank-mailman (input) for mailman id 649809;
 Thu, 07 Dec 2023 11:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ri6x=HS=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rBCxT-0003tl-Sm
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 11:54:23 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c089bb8-94f7-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 12:54:21 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bfd7be487so686488e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 03:54:21 -0800 (PST)
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
X-Inumbo-ID: 5c089bb8-94f7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701950061; x=1702554861; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE2bjhCnhfZLEuqnh3gBqaZciXLlZtz0F4kZulcUIqQ=;
        b=egKmj9QAF+HtebRGlE3MWldH/UOLS6xpxTF2Laf1N7Y059iZ4cgIDd9vTA65ImIbrb
         s6dDuX5gtzFJc0dNQh+0NrbPRrv7YNWHnfqlJze3/eFIGneq/Ir21ZGr0kUJ49VYOmqb
         GlBqbpe1wNQ+WEtAETcQeyBC7XMM0+MO45iuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701950061; x=1702554861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE2bjhCnhfZLEuqnh3gBqaZciXLlZtz0F4kZulcUIqQ=;
        b=qQykR7HbEn8/Z3A+z4tHwTSBO3uL8TNLtzbdWaXVsn0MG6uFmWjBShz1Caxr/hDamd
         IUVQogsuiT5PBuYcFGpYxVKinQPyajjG0giA+hepkB9UbfZEJQ+CP8WouhHGO4rpUUix
         JMZ7ZY8nmeNSS7QMLCejXB+lfAiYWQ+sERjyiwJrkvm8yAeRI+Sx4vK06lRGbDggefKx
         KtKHs2+G4ixbT5oeo+8Rq0UgHAhe6Ye+M+yaDdXYKLDl78zTTOkNncPTzyPdIyFoZin2
         DT6ZM7jAVijkB3Zzqanko3lOHOHZvdMODZNRxmYdyiIEngSDGra1VfS09DnLKNyct7Io
         pEmA==
X-Gm-Message-State: AOJu0Yy9EihLTEUDI6JRUqfgZMpCz2r46/7WJOLI37jbTtfrhrmD9Taf
	tcHV2MMNM1vugkfdGTp+8T4mwJDU8byIPQX0NUEL5w==
X-Google-Smtp-Source: AGHT+IG+KutWLwdT6oneOFW/NYWylKKLBtx97wiDzkHMlGDJdovG/RsRfpmI5SUIn7OzbxYQnqOzk5BTdgVswOydjpY=
X-Received: by 2002:a2e:9004:0:b0:2ca:f17:dd5f with SMTP id
 h4-20020a2e9004000000b002ca0f17dd5fmr1287305ljg.103.1701950061258; Thu, 07
 Dec 2023 03:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20231204152321.16520-1-jgross@suse.com> <20231204152321.16520-2-jgross@suse.com>
 <34f5d241-54ad-40c6-abd2-46d2c65514af@suse.com>
In-Reply-To: <34f5d241-54ad-40c6-abd2-46d2c65514af@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 7 Dec 2023 11:54:10 +0000
Message-ID: <CA+zSX=Y0LjyBa5coqoy+REj85Q-EimXqKW6grCB4Mt5K1jiZ=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] xen/sched: fix adding offline cpu to cpupool
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, 
	=?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 4:55=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 04.12.2023 16:23, Juergen Gross wrote:
> > Trying to add an offline cpu to a cpupool can crash the hypervisor,
> > as the probably non-existing percpu area of the cpu is accessed before
> > the availability of the cpu is being tested. This can happen in case
> > the cpupool's granularity is "core" or "socket".
> >
> > Fix that by testing the cpu to be online.
> >
> > Fixes: cb563d7665f2 ("xen/sched: support core scheduling for moving cpu=
s to/from cpupools")
> > Reported-by: Ren=C3=A9 Winther H=C3=B8jgaard <renewin@proton.me>
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I feel like there should be a more robust way to protect against this
sort of thing; but I don't see anything obvious, and this does fix a
bug, so:

Acked-by: George Dunlap <george.dunlap@cloud.com>

