Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BEE798B4C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 19:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598109.932633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qef1D-0006fr-Fq; Fri, 08 Sep 2023 17:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598109.932633; Fri, 08 Sep 2023 17:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qef1D-0006dH-C3; Fri, 08 Sep 2023 17:11:43 +0000
Received: by outflank-mailman (input) for mailman id 598109;
 Fri, 08 Sep 2023 17:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lHtp=EY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qef1B-0006d8-NN
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 17:11:41 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6683943-4e6a-11ee-9b0d-b553b5be7939;
 Fri, 08 Sep 2023 19:11:39 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so3046729a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Sep 2023 10:11:39 -0700 (PDT)
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
X-Inumbo-ID: c6683943-4e6a-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694193099; x=1694797899; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRZZtDSDbQ7ziD6U8enIVKCW6fBD3XLhOHURnTZwm+I=;
        b=JcGDaA2YkvYBq+O+1ycHNk2BpTgiyYwFXfZ0RB8wKboROqAnYO1qeTfDNHCwo8jVJG
         MVjQ8ZP2bBp2/jtysrhS5WhE9bnsyk3X9udUiS/6u9iz2FwuAouw00+jrRiR2c7Uwl1r
         G4NwKCc6ARRxQKxUE+2zmFlI6xmuEYJzTvcCAdETzRCDi+O3d8nGkgg6RetwbkcAjRWf
         tVea/T0X2dObL/fUbiWc5PKGWzdPblcJJ5EfmzZ2xN6aENAqi3bWIEl0/zZ/H1ZMV5Wx
         qIYeDyFwzOimi+wmvr71ZJS5Xb0akVPww6sUygSHbL3a7lEE4qmD4bVGj4DSW9+M3uOj
         WQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694193099; x=1694797899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRZZtDSDbQ7ziD6U8enIVKCW6fBD3XLhOHURnTZwm+I=;
        b=afKWI0pYZgYY4O4bcVZ9Q4JC1tmAdKwHrVwL2P1g0gaLQVSrTDC91J0DqX1GaOdaNB
         0XUeUiilYLHychLvq+uuN1zBRuKuhlKiG1smuk778I+2PqUsA8G3SHwXX5rO6uTM62O3
         85y27pHxdbrmg15u6Pnakmp9NDUmebVEqf4Db0tmgAKaJ1qTWYyK8LYn+F8ezHgsIBwT
         dJqo67u9JbiI83w3HcoaZuZgClrrG4J9iwzuwbWY2LTWy9wci2F/OCFjs9++1qFIFOPO
         Xc1cJVgbAey9gUqNFumJKuSikCHTVpdYEGf5scIOXRiFzdPe+XLCYzwR6hwbe64olaPs
         Kaaw==
X-Gm-Message-State: AOJu0Yx00O2+6GVovPGUAGN0cRlH89rzpbBGT7wm0r5xsm+qrYKTl+qT
	HQjX3aPMH+e4kNcomxJFSXLwoOJeqaCInyYSqAs=
X-Google-Smtp-Source: AGHT+IE81vOXgV+267Me6pgBsx7NyiALIoCgSFaF5/bhivgWOBvhVj01wJZJAyOS8B2FCfiqobx9r2YWGa9o39w+McA=
X-Received: by 2002:a05:6402:1219:b0:523:102f:3ce1 with SMTP id
 c25-20020a056402121900b00523102f3ce1mr2572978edw.10.1694193099037; Fri, 08
 Sep 2023 10:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230906182125.48642-1-jandryuk@gmail.com> <24a741a4-b305-c817-e8c3-34b213ad0ee5@intel.com>
In-Reply-To: <24a741a4-b305-c817-e8c3-34b213ad0ee5@intel.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 8 Sep 2023 13:11:27 -0400
Message-ID: <CAKf6xpvOG5kunrfQEoDBvrrY+UVUn3+9ovKmqXZo88nh05tt6Q@mail.gmail.com>
Subject: Re: [PATCH v2] acpi/processor: sanitize _PDC buffer bits when running
 as Xen dom0
To: "Wilczynski, Michal" <michal.wilczynski@intel.com>
Cc: Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Roger Pau Monne <roger.pau@citrix.com>, stable@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 7, 2023 at 9:20=E2=80=AFAM Wilczynski, Michal
<michal.wilczynski@intel.com> wrote:
>
>
> Hi,
>
> On 9/6/2023 8:21 PM, Jason Andryuk wrote:
> > From: Roger Pau Monne <roger.pau@citrix.com>
> >
> > The Processor _PDC buffer bits notify ACPI of the OS capabilities, and
> > so ACPI can adjust the return of other Processor methods taking the OS
> > capabilities into account.
>
> _PDC method is deprecated for this purpose, since 2018, and is dropped fr=
om
> spec since 6.5
>
> We made the switch in linux since 6.6:
> 95272641338a ("ACPI: processor: Use _OSC to convey OSPM processor support=
 information")

Thanks for the heads up, Michal.  The patch pre-dated 6.6 and I based
this one off of 6.5.

> >
> > When Linux is running as a Xen dom0, it's the hypervisor the entity
> > in charge of processor power management, and hence Xen needs to make
> > sure the capabilities reported in the _PDC buffer match the
> > capabilities of the driver in Xen.
>
> So I guess you would need to sanitize buffer passed to _OSC method instea=
d ?

I think I'll modify the capabilities in arch_acpi_set_proc_cap_bits()
and that will handle both _OSC and the _PDC fallback.

Regards,
Jason

