Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917BE997FFB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 10:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815785.1229993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syod5-00017o-Oo; Thu, 10 Oct 2024 08:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815785.1229993; Thu, 10 Oct 2024 08:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syod5-00015E-Ln; Thu, 10 Oct 2024 08:34:39 +0000
Received: by outflank-mailman (input) for mailman id 815785;
 Thu, 10 Oct 2024 08:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5QbA=RG=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syod4-000158-9i
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 08:34:38 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7afe346a-86e2-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 10:34:36 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-287ca01c15fso404287fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 01:34:36 -0700 (PDT)
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
X-Inumbo-ID: 7afe346a-86e2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728549275; x=1729154075; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6uS8U3J1yzwx+w34jnqJxBHjQ0EIjkDS8buUDj2hoQ=;
        b=BLbeg0V5fX5BoeCz1czMZTgvdSnaaX+TkqeBOBef8e2Q/8ibBbct4rACIlluN3MZhz
         iNLBaTHaNuzkHLJS/VHiht1REbCBqdPapYkG2yMXnNaVrnBI2gGQStaqwjHAczAtWCbP
         iCqStZd8P8SqGV3rvJR65KXHp176jU9eYIZHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728549275; x=1729154075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6uS8U3J1yzwx+w34jnqJxBHjQ0EIjkDS8buUDj2hoQ=;
        b=o7sOCFIX2O6cOgCztWIgg4QSukrmUCSpdNdbaJapuFTRhLNbG+MpUSyLHAMgMItMQs
         AY0ZH0juOdhsaGvubswJJxmIg/rTev8TDpmqCT9ikhorLwInHJ1V0Gu93VfkSfHvpqXu
         J0hhRNMRLliYx7OcnhL+dfB0XxPJ4JqBsm7ZjfYFwZqc7XXUMlMlBkePp09/4+FAJijF
         B/09UPSJmIGHCSw0HWkAsSf69YMlPgv0Q7uxcix7d2MQOJR3MIYczPJrH/tV5DHmpZ+b
         5P4cd4nfrWUUh+0U5ni+LBmF/GRvVX/dwMsz7PtP+Sm+CI6cwAShZyLMZxaDmPk6KD32
         3few==
X-Forwarded-Encrypted: i=1; AJvYcCUilM6Q8mF7/Bo47k98wLTn3vWSey6SSDI/yMEbxuUm83+6HdzF8TXSkqnvBruTjyQinoBVu7zPtco=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiSn3gYPJr9Vpz9E07d3rYjYIE2UlNC/lZOgWUs2R5zfDByjbc
	7M7WNxfr6gOoqrmeyeDxc26fwewCzlv6kEHrsMzcqSbaXt43sA9C8wXV+KvkPubBi25LfsvaOr0
	tR0GSumnBX9CTAgxKR+b+2UYmnIECPzNUdlMmoQ==
X-Google-Smtp-Source: AGHT+IGBhRuQ+YEHa4yPWdbb6k4w2MbwapJVUotIDL1W+m8H7gvS39XymlLzhZvKFmxUdtnNJNF/Ja4pxrrFDHPxCgk=
X-Received: by 2002:a05:6870:d18a:b0:260:f6c4:df1 with SMTP id
 586e51a60fabf-288342d1cb0mr3884773fac.17.1728549275017; Thu, 10 Oct 2024
 01:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
 <20241009080439.2411730-2-frediano.ziglio@cloud.com> <f54d8f4b-e088-4ebe-a72f-ec4a540f9b33@suse.com>
 <CACHz=ZjLDv11OiMdtDmTLDOEmgDiqMoP9cppdKg3qcsXK+wpgA@mail.gmail.com> <49d1ff38-dff7-4db0-aec8-15ca82339e54@suse.com>
In-Reply-To: <49d1ff38-dff7-4db0-aec8-15ca82339e54@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 10 Oct 2024 09:34:24 +0100
Message-ID: <CACHz=Zgxv=_T7=krmrajJ8kF0K995733jsZh8WS0kWw_pW9+zA@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] x86/boot: Align mbi2.c stack to 16 bytes
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:13=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 09.10.2024 12:15, Frediano Ziglio wrote:
> > On Wed, Oct 9, 2024 at 9:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 09.10.2024 10:04, Frediano Ziglio wrote:
> >>> --- a/xen/arch/x86/efi/Makefile
> >>> +++ b/xen/arch/x86/efi/Makefile
> >>> @@ -11,6 +11,8 @@ $(obj)/boot.init.o: $(obj)/buildid.o
> >>>  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boun=
dary=3D4)
> >>>  $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary :=3D $(cflag=
s-stack-boundary)
> >>>
> >>> +$(obj)/mbi2.o: CFLAGS_stack_boundary :=3D $(cflags-stack-boundary)
> >>> +
> >>>  obj-y :=3D common-stub.o stub.o
> >>>  obj-$(XEN_BUILD_EFI) :=3D $(filter-out %.init.o,$(EFIOBJ-y))
> >>>  obj-bin-$(XEN_BUILD_EFI) :=3D $(filter %.init.o,$(EFIOBJ-y))
> >>
> >> You're duplicating code, which is better to avoid when possible. Is th=
ere
> >> a reason the earlier commit didn't simply add mbi2.o to $(EFIOBJ-y)? T=
hat
> >> way the existing logic would have covered that file as well. And reall=
y I
> >> think it should have been mbi2.init.o (or else adding it into $(obj-bi=
n-y)
> >> is wrong), which probably wants correcting at the same time (ISTR actu=
ally
> >> having requested that during an earlier review round).
> >
> > This was my first attempt, but it fails poorly, as EFIOBJ-y comes with
> > the addition of creating some file links that causes mbi2.c to be
> > overridden.
>
> I can't see $(EFIOBJ-y) affecting symlink creation. What I can see is tha=
t
> the variable is used in the setting of clean-files, which indeed is a pro=
blem.
> Still imo the solution then is to introduce another variable to substitut=
e the
> uses of $(EFIOBJ-y) in arch/x86/efi/Makefile. E.g.
>
> EFIOBJ-all :=3D $(EFIOBJ-y) mbi2.init.o
>

what about simply

diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 7e2b5c07de..f2ce739f57 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -9,7 +9,7 @@ $(obj)/%.o: $(src)/%.ihex FORCE
$(obj)/boot.init.o: $(obj)/buildid.o

$(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=3D=
4)
-$(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary :=3D
$(cflags-stack-boundary)
+$(addprefix $(obj)/,$(EFIOBJ-y) mbi2.o): CFLAGS_stack_boundary :=3D
$(cflags-stack-boundary)

obj-y :=3D common-stub.o stub.o
obj-$(XEN_BUILD_EFI) :=3D $(filter-out %.init.o,$(EFIOBJ-y))


> > If I remember, you suggested changing to obj-bin-y. Still, maybe is
> > not the best place. It was added to obj-bin-y because it should be
> > included either if XEN_BUILD_EFI is "y" or not.
>
> No, that doesn't explain the addition to obj-bin-y; this would equally be
> achieved by adding to obj-y. The difference between the two variables is
> whether objects are to be subject to LTO. And the typical case then is th=
at
> init-only objects aren't worth that extra build overhead. Hence the commo=
n
> pattern is (besides files with assembly sources) for *.init.o to be added=
 to
> obj-bin-*.
>

Then I would stick to obj-bin-y.

Frediano

