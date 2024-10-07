Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D58D992897
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811829.1224502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkXJ-0003UD-Cz; Mon, 07 Oct 2024 10:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811829.1224502; Mon, 07 Oct 2024 10:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxkXJ-0003SA-AI; Mon, 07 Oct 2024 10:00:17 +0000
Received: by outflank-mailman (input) for mailman id 811829;
 Mon, 07 Oct 2024 10:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxkXH-0003S4-Rg
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:00:15 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1db3756-8492-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 12:00:13 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-287ac3fe2a8so2150215fac.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 03:00:13 -0700 (PDT)
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
X-Inumbo-ID: f1db3756-8492-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728295212; x=1728900012; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeL/Pn/uSEOqUDSwyWeFTtP/drxeO1XBWoOpYmC58g4=;
        b=NxOIp1rJBaGubccAm/wqB2fnswFFJslK50wR+fHUWD/DLFtID1ulOEKxn4pL0eYoR5
         DbWuh6IJQX0rQG8AkSujoGz1I4QS6VLstq1RE6wKSEWkviGFqqVGDwT7xRM94tdWmQpw
         vw2N9eve+KLcIK9IoXj12caZbEf9Om5SS9b4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728295212; x=1728900012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AeL/Pn/uSEOqUDSwyWeFTtP/drxeO1XBWoOpYmC58g4=;
        b=rxu5WlxX6afG2Y3/hCL2yBGNRnPkN+EtcozvIzCxYtBNYIs2+57p1dkizf30Tpm1wD
         FqBxamunxmxN3fnri9jBe1U1X1u0EsYLnwM1vHCLuSb+vjsmDdWyUaUzTJUUEeuqWbt0
         bPd43+RJT2U5fYywdcw8gp8YjCUGYzyu9kHUe4D+98NNlJC8JAlzyZcwJtBlGXLQVKXI
         kAStUG9hK1DyGjB/K3gS8Z1z7zDrFvGi9wishWjYsd9GafQU8RFWkQZVJrbFeibcLotd
         Xew1my9LLvq2G1a4QmmPjAsRtFsD+3P+dhIP0QiMh7kToCvl+4GBdUPQZQ5se689yPm8
         mtfg==
X-Forwarded-Encrypted: i=1; AJvYcCU5k+sPiaYPUnxP7cFBiStGje+DXbcOpMQDsU9ZILvFAPO+UQMZlOx+vLgHvbcN+vMqVfDQ3JkwVbA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6hNd8qGRsDk2upUzSoAnFuAKq9Ti0kOVV4fme+zyBL72lI79M
	/d6MF6c17w2ijPOnRAV1nIRzWlXaiEFSwL9u9Mu8AlQtxJl2+kZnZFzQBV6Vrx0ZTHIHxD/fjO2
	8g1TJ5JMAwG8WEaYupe0LZZltVUZNKHIfRWKjnw==
X-Google-Smtp-Source: AGHT+IGlepucfrnXRcWQ0qPQQTS5lK/pHJLXSdDvFSDlQAir2By7fhYdU+tJmn46Crm1BHz8018ySGizqm/lOOizdsg=
X-Received: by 2002:a05:6871:5296:b0:25e:fb:af8c with SMTP id
 586e51a60fabf-287c1e7be27mr7678720fac.18.1728295212419; Mon, 07 Oct 2024
 03:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-3-frediano.ziglio@cloud.com> <e7e5200e-4577-4f67-bb3e-6f71086fc663@citrix.com>
 <0bfcd06d-cc3a-4048-bab4-0d5cd794fa1a@suse.com> <CACHz=Zg3R4Ybr0GwhSaYsOo72mWtapnpQ7w-Wb=wjrf-or1J_g@mail.gmail.com>
 <CACHz=ZjCAEE2kiWdce0ApQqtA-3urSMFJYRdKv8Qa_-BrZZ8bw@mail.gmail.com>
 <0439f313-1360-47b0-ae7e-a2a74ee4d51e@suse.com> <c3599934-8ea6-44d3-95da-9a307f952f2d@citrix.com>
In-Reply-To: <c3599934-8ea6-44d3-95da-9a307f952f2d@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 7 Oct 2024 11:00:01 +0100
Message-ID: <CACHz=ZgAfQP3ChV=CqNxKDWGHQ-DVreTCJ_svGEuyqfnzuzRXQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] x86/boot: Reuse code to relocate trampoline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 10:47=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 07/10/2024 10:04 am, Jan Beulich wrote:
> > On 07.10.2024 10:15, Frediano Ziglio wrote:
> >> On Mon, Oct 7, 2024 at 9:07=E2=80=AFAM Frediano Ziglio
> >> <frediano.ziglio@cloud.com> wrote:
> >>> On Mon, Oct 7, 2024 at 8:03=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>> On 05.10.2024 15:21, Andrew Cooper wrote:
> >>>>> On 05/10/2024 9:02 am, Frediano Ziglio wrote:
> >>>>>> --- a/xen/arch/x86/boot/Makefile
> >>>>>> +++ b/xen/arch/x86/boot/Makefile
> >>>>>> @@ -1,6 +1,6 @@
> >>>>>> -obj-bin-y +=3D head.o cbundle.o
> >>>>>> +obj-bin-y +=3D head.o cbundle.o reloc-trampoline.x64.o
> >>>>> Ah.  I think the $(obj)/%.x64.o rule you had in the previous patch =
wants
> >>>>> introducing here.
> >>>>>
> >>>>> That said, x64 is the one name for 64bit that we reliably don't use=
.
> >>>>> Also...
> >>>>>
> >>>>>> -head-bin-objs :=3D cmdline.o reloc.o
> >>>>>> +head-bin-objs :=3D cmdline.o reloc.o reloc-trampoline.o
> >>>>> ... head-bin-objs isn't really correct now seeing as they're not
> >>>>> binaries in head.S.  Also ...
> >>>>>
> >>>>>>  nocov-y   +=3D $(head-bin-objs)
> >>>>>>  noubsan-y +=3D $(head-bin-objs)
> >>>>> The no$(foo)'s needs extending to the 64bit objects too.  They're a=
lso
> >>>>> used early enough to explode.
> >>>>>
> >>>>> In Xen, 64bit objects are the norm, and it's 32bit ones which are t=
he
> >>>>> exception, so how about we special case *.i386.o instead.  Then
> >>>>>
> >>>>> obj32 :=3D cmdline.i386.o
> >>>>> obj32 +=3D reloc.i386.o
> >>>>> obj32 +=3D reloc-trampoline.i386.o
> >>>> I'd like to advocate for ix86 or i686. i386 gives a wrong impression=
 imo.
> >>> Why not simply x86 ? We already use it.
> >>>
> >> Looking at current files, we also use (to distinguish more clearly 32
> >> and 64 bit) x86_32.
> > Either would be fine with me; as to x86 I took it that Andrew wanted to
> > express the 32-bit-ness, which x86 alone doesn't unambiguously do.
>
> On further thought, why not just foo.32.o ?
>
> That should be clear enough.
>
> ~Andrew

At this point, it starts to be more of a personal preference.
I slightly prefer x86_32 looking at file names and Makefile's macros.
Pick one.

Frediano

