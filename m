Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4E9037FF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 11:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738210.1144884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxxc-0004MQ-Ex; Tue, 11 Jun 2024 09:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738210.1144884; Tue, 11 Jun 2024 09:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGxxc-0004Kj-CI; Tue, 11 Jun 2024 09:38:36 +0000
Received: by outflank-mailman (input) for mailman id 738210;
 Tue, 11 Jun 2024 09:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rr1P=NN=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGxxa-0004Kd-FL
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 09:38:34 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d82c309-27d6-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 11:38:32 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2548c80efc6so1430687fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 02:38:32 -0700 (PDT)
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
X-Inumbo-ID: 5d82c309-27d6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718098711; x=1718703511; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqO/jtbOhl0WTM/03VmSyYnKt2ZVAFH87f5BRYJfwJY=;
        b=eW3Q2xiYmDAim9fBk8XbI49L6qHwGQmGsrYID/DvA/u3xz1YYwQy8JGTvn25kTbM0b
         e6B0P1aAGvT8cNnifm0B4tFaSYgnFzOuPQ3iBA3ZHTw3P2Qs8A42l8thgsBfTDadgvtc
         cBgX6qPfE31S3rFYKPEmL0LKmZrplyaJBMikO955v38o7Fk6cjaOcpgOEq9q53f15RhI
         1qlSvJBlw/GeOq7INTkPTA57YVuvjrz/hdC6DdkA8Voe0mqf+hoKDIofnaAL+lGy7alx
         pOdd6s1hnAgEuY9dj8um1jgI7QOzxnjullnXv7uKmWqddIvktvIC8Z8I2cXk/4OKtJLz
         R5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098711; x=1718703511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqO/jtbOhl0WTM/03VmSyYnKt2ZVAFH87f5BRYJfwJY=;
        b=uQLWfzbo4151aclMgbAejomy1beBuQjCmwTkiSkpifaG2/Q3bA39BFBmuziubq9Sk8
         XVduKPFZAY4VrEjofy8JCeCdSYoFLNbUvfpfoIVsM124478pUmm8CfwRa6VkdaCZe840
         bpC5df/PpR0zYKp6aV7v1GlAi5IW6IP8fllwJdtib4mpEzsaACtPKHaHnniuX7PZdHnL
         QYlu/i2EDCaJRPUTXCNV16+4DqARKq26tHmSnjkMOecrmDUA5pI5Lw4/E5qQoGgjfiQN
         wksElyroKgiQo1AFwTj2O9ax2FkP9PnIiu9v3hB6/1c6VcFzgrQgNIhmFVmYXvuXBn0O
         MNAw==
X-Forwarded-Encrypted: i=1; AJvYcCVUpyqwlVNAyZT0E2i/nu8FtfBbylHmD+mgZxv8PDZ67V6EuXz75T3Cpt8lTdlJsfM/cQ7BHY7B9LwkKFgl4P+ppBGr8JAPmBDGuDpge5A=
X-Gm-Message-State: AOJu0YwR5j+Bh0Zr2M05Uj3BEM/HqYULQMxQbLsYfKdSRn1lFx2DI/Ud
	Zj5ThQnK4xRsP5G2PwJfon7dtrOhvSuc9YzrsKksiAcHz4euXoZnm3xxaE0DDH75MdcUuVJwk3Z
	LIVXRBJChFj0pTkptU8sTvzZa3RY=
X-Google-Smtp-Source: AGHT+IFr8puub9immjrdfMVWGjf+tf55lOcsST15FqiIjzPfPuQ0Ef+1AZllU10MIaFk0SoIssPNeeX46MivowhXcjo=
X-Received: by 2002:a05:6870:d182:b0:254:eda1:912c with SMTP id
 586e51a60fabf-254eda19b9emr861418fac.5.1718098711066; Tue, 11 Jun 2024
 02:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718038855.git.w1benny@gmail.com> <dcf08c40e37072e18e5e878df8778ce459897bdc.1718038855.git.w1benny@gmail.com>
 <8787608f-f3b0-4fb3-95ee-98050cf95182@suse.com> <CAKBKdXiiZdz70nWx7kqp2S5RdbRsku+qtn6z9DBk44LZOgp3Qw@mail.gmail.com>
 <217202e9-608f-4788-b689-8140567e4485@suse.com> <CAKBKdXhzRZuaiZ+cDYD=ofShgRySbGyZjSZe=G9Rdd0T8wof3A@mail.gmail.com>
 <6cfeeca8-10dd-4d79-8436-fbe3cf342a54@suse.com>
In-Reply-To: <6cfeeca8-10dd-4d79-8436-fbe3cf342a54@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Tue, 11 Jun 2024 11:38:20 +0200
Message-ID: <CAKBKdXgHGx5_tw5HNjuuHzT__VC_dT7J7rF3KFrJ6htVmeQobA@mail.gmail.com>
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

On Tue, Jun 11, 2024 at 11:36=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 11.06.2024 11:34, Petr Bene=C5=A1 wrote:
> > On Tue, Jun 11, 2024 at 11:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> On 11.06.2024 10:00, Petr Bene=C5=A1 wrote:
> >>> On Tue, Jun 11, 2024 at 8:41=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>> On 10.06.2024 19:10, Petr Bene=C5=A1 wrote:
> >>>>> From: Petr Bene=C5=A1 <w1benny@gmail.com>
> >>>>>
> >>>>> Encapsulate the altp2m options within a struct. This change is prep=
aratory
> >>>>> and sets the groundwork for introducing additional parameter in sub=
sequent
> >>>>> commit.
> >>>>>
> >>>>> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> >>>>> Acked-by: Julien Grall <jgrall@amazon.com> # arm
> >>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com> # hypervisor
> >>>>
> >>>> Looks like you lost Christian's ack for ...
> >>>>
> >>>>> ---
> >>>>>  tools/libs/light/libxl_create.c     | 6 +++---
> >>>>>  tools/ocaml/libs/xc/xenctrl_stubs.c | 4 +++-
> >>>>
> >>>> ... the adjustment of this file?
> >>>
> >>> In the cover email, Christian only acked:
> >>>
> >>>> tools/ocaml/libs/xc/xenctrl.ml       |   2 +
> >>>> tools/ocaml/libs/xc/xenctrl.mli      |   2 +
> >>>> tools/ocaml/libs/xc/xenctrl_stubs.c  |  40 +++++++---
> >>
> >> Right, but above I was talking about the last of these three files.
> >>
> >> Jan
> >
> > Ouch. It didn't occur to me that Ack on cover email acks each of the
> > files in every separate patch. My thinking was it acks only the
> > patches where those three are together. Anyway, it makes sense. I'll
> > resend v7.
>
> Well, no need to just for this. Yet if a v7 turns out necessary, please
> make sure you have the ack recorded.
>
> Jan

Noted.

P.

