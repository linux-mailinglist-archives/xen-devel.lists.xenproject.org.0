Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D92A39BB8
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 13:05:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891373.1300422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkMM4-0004Ab-5v; Tue, 18 Feb 2025 12:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891373.1300422; Tue, 18 Feb 2025 12:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkMM4-00047T-2K; Tue, 18 Feb 2025 12:05:36 +0000
Received: by outflank-mailman (input) for mailman id 891373;
 Tue, 18 Feb 2025 12:05:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rpw0=VJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tkMM2-00047L-Ic
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 12:05:34 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6ce5083-edf0-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 13:05:32 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2b3680e548aso3444379fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 04:05:32 -0800 (PST)
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
X-Inumbo-ID: a6ce5083-edf0-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1739880331; x=1740485131; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxZSccEHSKg5fQzqfBbsfBoO4Xal5zZxU+8KEqottG8=;
        b=XeqX0guqItkwfszcaeHG8LEXkFv0x3GYleCfI9voIC9PPtgXv2A5kAo/jWFvQeOkN8
         ealrpBMrEZ7tVVtgZJDpgVcBOKLJmNVUv0O5bUG249FPePZi/MHY1bh3MDqb+ZvLYhDp
         vzDtjnM5ppYMWGpZ3g6rZJpx0GlJ/64xytCJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739880331; x=1740485131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxZSccEHSKg5fQzqfBbsfBoO4Xal5zZxU+8KEqottG8=;
        b=F4YLAcvJi1M3RhoSIyCU86VM2QbFHAXw+CXzhGajU/1c9lRIgHKkC9Ok2GMUDMrUaf
         ba//TWA58tuYK2qFHsDr0Hb0BK2mk+S/UGH7/WFv35Pe9ElJHGnJe2/01ioLeYNKpbWe
         ysarzXOr8u3Lr/aUBJsJ0J/z2puNrKnSYGZpaKlyeqnzEh0Pqy0IDBiXHy2Gr75lS3A+
         RQfF40xgIrhQ0S54wpO8a8KrFSqsvWoV1m26uLge0G6IaaXBhIOQP/NWjCzjI4vbL59P
         v5+WakqDmukMJewGN/G2vm25f1KHVqH6QBfHbMUFeR/XDf2jkBsoPh97zz3O2pL9SE3w
         2wrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZxKQ4wTT/Ju8lqIDNuDVkeeKAO8rx9HHOcHuFUZ8batHCeDKz+6w+bVvFz5C27pZuPV+w37BYwO4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznEQ/u3KE+c2rNr/5XRIbOAxstLda1GVzHCZN4szBTy+LaeH6f
	EsVl0WsuVWF6+0txIrJmD4OFDoAl7idk4wo9iE/RC4f/AJtFk/mV+XCoyOXp/8NU+IDvRh0/R8M
	+Cn38dLaEFCL2OAlR2+9hguVtv/MNpsAfOO2QKw==
X-Gm-Gg: ASbGncs6vXtlPcB3/jIveteIRK5Beb2QR4ggRW84SWVM6k032o++SOgZ2/gZOttPQ45
	iQoJUOn0BScKxHGshTor4/mN6Jn6ZMV3YyXxZDwrer5uCehnjGh6MCPFGAgXc1yWb3KCqlyru
X-Google-Smtp-Source: AGHT+IGcBJ9rrgjqBWDNTQKf6VLwYl+TfgaTnHKYLSYv0jmthIeNgyNrVHTu4Wmitjq7ChoCAFWqzq+8SGbIYAGYWQ0=
X-Received: by 2002:a05:6871:3a2c:b0:2b8:b76f:1196 with SMTP id
 586e51a60fabf-2bc99071d98mr8390928fac.19.1739880331225; Tue, 18 Feb 2025
 04:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <77eb149c-bb1e-4f77-85ba-c44b173a5c1e@suse.com> <ddfee078-409e-4253-9d51-b2f512b41e63@citrix.com>
 <CACHz=ZhuOL3Le=+y0zFRaWBDEdLO_faLKZ83072Z0e88wZMpPw@mail.gmail.com> <1923357b-c303-4900-9e2a-be4328ae4dc3@suse.com>
In-Reply-To: <1923357b-c303-4900-9e2a-be4328ae4dc3@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 18 Feb 2025 12:05:20 +0000
X-Gm-Features: AWEUYZk9xLvHfT3dJU371pjOd7smEpHvyGJiMfs-YyPPVKmtjvTWZiG1rRQCISc
Message-ID: <CACHz=ZijmMPntXjA-Zu3VTnWqH-1fR8SVRVB4d4Cqyg0f1Ce5w@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 4:56=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 17.02.2025 17:52, Frediano Ziglio wrote:
> > On Mon, Feb 17, 2025 at 4:41=E2=80=AFPM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> >>
> >> On 17/02/2025 4:31 pm, Jan Beulich wrote:
> >>> On 17.02.2025 17:26, Frediano Ziglio wrote:
> >>>> --- a/xen/common/efi/efi-common.mk
> >>>> +++ b/xen/common/efi/efi-common.mk
> >>>> @@ -2,6 +2,7 @@ EFIOBJ-y :=3D boot.init.o pe.init.o ebmalloc.o runti=
me.o
> >>>>  EFIOBJ-$(CONFIG_COMPAT) +=3D compat.o
> >>>>
> >>>>  CFLAGS-y +=3D -fshort-wchar
> >>>> +CFLAGS-y +=3D -fno-jump-tables
> >>>>  CFLAGS-y +=3D -iquote $(srctree)/common/efi
> >>>>  CFLAGS-y +=3D -iquote $(srcdir)
> >>> Do source files other than boot.c really need this? Do any other file=
s outside
> >>> of efi/ maybe also need this (iirc this point was made along with the=
 v5 comment
> >>> you got)?
> >>
> >> Every TU reachable from efi_multiboot2() needs this, because all of
> >> those have logic executed at an incorrect virtual address.
> >>
> >> ~Andrew
> >
> > I assume all the files in efi directory will deal with EFI boot so
> > it's good to have the option enabled for the files inside the
> > directory. The only exception seems runtime.c file.
>
> And compat.c, being a wrapper around runtime.c.
>
> > About external dependencies not sure how to detect them (beside
> > looking at all symbols).
>
> Which raises the question whether we don't need to turn on that option
> globally, without (as we have it now) any condition.
>
> Jan

Are you saying enabling that option for all Xen? That potentially
would decrease performances, we have a lot of switches in the code.

Frediano

