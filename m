Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 977B39966C9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 12:15:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814244.1227707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTix-0000U1-M7; Wed, 09 Oct 2024 10:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814244.1227707; Wed, 09 Oct 2024 10:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syTix-0000SP-Im; Wed, 09 Oct 2024 10:15:19 +0000
Received: by outflank-mailman (input) for mailman id 814244;
 Wed, 09 Oct 2024 10:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLvJ=RF=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syTiv-0000Rx-Ir
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 10:15:17 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60327fb8-8627-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 12:15:15 +0200 (CEST)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-28832b71ebdso195402fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 03:15:15 -0700 (PDT)
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
X-Inumbo-ID: 60327fb8-8627-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728468914; x=1729073714; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRmRijDtZLtX/e6fDXBz4qs5y4AuLrRoT6IwTIzhAwY=;
        b=IA/L+sQCpQZzuhPpcHL71Cwa7XUdTsJryKKRJ1lA5SI/h8T8jVOxegjzzLLRfJtzmh
         qR9ALr/+9h5OuM8YzqtSgeAgiLzDXSM4hz89EGyklunfP3VHxTw52M+KZKk34crMmidd
         URrJvc2ICzO+yIv6vRxI5fWfPjLnITmFITuxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728468914; x=1729073714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRmRijDtZLtX/e6fDXBz4qs5y4AuLrRoT6IwTIzhAwY=;
        b=gnsPqjtfbQXtAkBGUwTzgTcSBYBNCkg2SiTFcWBQPucltfhyWm2qP2SrUEXR3xGsj2
         5bggUBjyb62Rqn/KTrRM8JvKXr5DIF5aAZpspQX9oR7tf9FEJyKhaMLLNhbU+z5YCZtl
         S4t8YNysor43E1biamvbt8eCds0qbNNJ70k38oOkHTgEnLH6RnIJQxc2TEsO8xazsjdi
         KfbIbGQ+a9gCn62BlvsUEdkEBLjzVoTP3rdAS205wo6xFb1zzUs4s8cSw3rWK75xcSGp
         9l5DRGR4zqgA/1X7FIe1tJRMLEV3JSIdoY+ORIzPzK6A0RFLuSteJgS5mrWo9tvOHAXd
         v+ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW6pCTy0O+dZnHkOOHp+6OK3JLE10CibxUwLLaJbYSNSP8A5V8FQspMWD1MbM9wO5avwoVhVpzooQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFs0pJ1JbhtAGQO4TXcsVMsqJyQZ+hBvICDTWR3tUnYh7m2h6E
	fuhyVl2DL1YLyXGjLjzBx4FvBgffggSkWl1Z+qZNA6bsCNFmMt5oXxXqxEIgRRQsmiQtX9lYZv9
	TJ55O0Ro9qV67PEPGgM603nPUlqt4zl6gBTxyww==
X-Google-Smtp-Source: AGHT+IHFM+9XDbwI5q5WkiRdrzrUVTc+YbFwld6auK1Lp3q8SuHeTL93AIRmfLOM3nSB3HfFUv9w/jtWnlI/6xJ8Mgg=
X-Received: by 2002:a05:6870:c1c3:b0:277:c027:1960 with SMTP id
 586e51a60fabf-2883434b155mr1084509fac.25.1728468914119; Wed, 09 Oct 2024
 03:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
 <20241009080439.2411730-2-frediano.ziglio@cloud.com> <f54d8f4b-e088-4ebe-a72f-ec4a540f9b33@suse.com>
In-Reply-To: <f54d8f4b-e088-4ebe-a72f-ec4a540f9b33@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 9 Oct 2024 11:15:03 +0100
Message-ID: <CACHz=ZjLDv11OiMdtDmTLDOEmgDiqMoP9cppdKg3qcsXK+wpgA@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] x86/boot: Align mbi2.c stack to 16 bytes
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 09.10.2024 10:04, Frediano Ziglio wrote:
> > Doing previous testing with an Adler Lake Intel machine the following
> > patch (improving MBI structure checking) started to fail.
>
> In patch descriptions please don't refer to "this patch" or "the followin=
g
> patch"; describe a commit in a self-contained way, with references to
> what's already committed mentioning commit hash and title, whereas
> references to what hasn't been committed using merely the title (and mayb=
e
> a link to its most recent posting). I'm not sure though that the other
> patch really matters here beyond having exposed an issue that was there
> (latently) anyway.
>

In this case it's referring to a not merged commit, so I cannot put
the hash, but I changed to state the subject.

> > Excluding it makes the tests succeed however there was not apparent
> > reason (looking at the code) for the failure.
> > So I instrumented code to output the structure and tested code with
> > this extracted data with and without the following patch and results
> > were the same.
> > Compiled assembly code from lab was also fine beside not keeping
> > the 16-byte alignment for the stack.
> > Turning on stack alignment solve the problem on Adler Lake machine.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> This really wants a Fixes: tag then.
>

Done.

> > --- a/xen/arch/x86/efi/Makefile
> > +++ b/xen/arch/x86/efi/Makefile
> > @@ -11,6 +11,8 @@ $(obj)/boot.init.o: $(obj)/buildid.o
> >  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-bounda=
ry=3D4)
> >  $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary :=3D $(cflags-=
stack-boundary)
> >
> > +$(obj)/mbi2.o: CFLAGS_stack_boundary :=3D $(cflags-stack-boundary)
> > +
> >  obj-y :=3D common-stub.o stub.o
> >  obj-$(XEN_BUILD_EFI) :=3D $(filter-out %.init.o,$(EFIOBJ-y))
> >  obj-bin-$(XEN_BUILD_EFI) :=3D $(filter %.init.o,$(EFIOBJ-y))
>
> You're duplicating code, which is better to avoid when possible. Is there
> a reason the earlier commit didn't simply add mbi2.o to $(EFIOBJ-y)? That
> way the existing logic would have covered that file as well. And really I
> think it should have been mbi2.init.o (or else adding it into $(obj-bin-y=
)
> is wrong), which probably wants correcting at the same time (ISTR actuall=
y
> having requested that during an earlier review round).
 >
> Jan

This was my first attempt, but it fails poorly, as EFIOBJ-y comes with
the addition of creating some file links that causes mbi2.c to be
overridden.
If I remember, you suggested changing to obj-bin-y. Still, maybe is
not the best place. It was added to obj-bin-y because it should be
included either if XEN_BUILD_EFI is "y" or not.

Frediano

