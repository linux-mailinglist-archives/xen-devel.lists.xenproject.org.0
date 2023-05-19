Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D870941C
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536921.835650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwmL-0002G3-NP; Fri, 19 May 2023 09:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536921.835650; Fri, 19 May 2023 09:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwmL-0002DW-Kp; Fri, 19 May 2023 09:52:05 +0000
Received: by outflank-mailman (input) for mailman id 536921;
 Fri, 19 May 2023 09:52:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oBaS=BI=gmail.com=andy.shevchenko@srs-se1.protection.inumbo.net>)
 id 1pzwmK-00029R-Ps
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:52:04 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce2ca888-f62a-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 11:52:03 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-62388997422so12307466d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 May 2023 02:52:03 -0700 (PDT)
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
X-Inumbo-ID: ce2ca888-f62a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684489922; x=1687081922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYlFoKtA5IkPlUC08PPhE1HRAZ9SjNGPuMwfpP8csYw=;
        b=nYxSjSYcaXL9wBLYYxr18nPzFhoS6t/XMYh9wWv4olQ5Ajdh0ltDPhpnV6tMT0kw2L
         7PVzfD8g+760Xthp7t3msGPUjuZ59gQw4rwzaEmCtQ8hyGpsue8N+xUoLitFBMGgdB9W
         jVGc5vSq1XyykVvXwliYjJhs52PRT3SjBYJ7iwE5d7/KP6vVYRumAVbxhCiJ5soKreN4
         brAcrHDbctTGfUlLlmhxftAZM3pPIDGyFEnEQC4iY77FwsJnKWjlVhqa4CFYiyr2O4Qf
         7YR2QIMjUYV5AhK5aiXR9mtSexGX2S4hbthpMwYW3yJ58fFaMoJ96fz6odyG79IA5mY6
         tJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684489922; x=1687081922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYlFoKtA5IkPlUC08PPhE1HRAZ9SjNGPuMwfpP8csYw=;
        b=inIYRxKo9jYgXzMHUioK984EqLXOJ9fFsVjWzvdy1DV9FHLaO8RkxJ63QvEikp7VR3
         LA4X6+T+Yimob94fAM7cN+L51CMhmA0KjVPguV/ZnPCw83hay3s9CBLZLunG3OGuOqxg
         7L+wu5GsF29rhVpx6wsJ3ZQRHsjp1f/v7C8gWSMm8p9jgNdgF7mclDArJWI7lDXZr3Y1
         hRYutDsXXJo+R6S3fA35WhJ648Gcsbr6bw7SW6L7I5f9f8fVtXZBU9Rq+SQMf6lq8lrg
         y/wOTyYyDB+2iuDd22QwvJEEggF0UFnh4qjdjHQeP4VbXb8Eyvsu2AJOmIaJ6mWSIcgN
         G+vw==
X-Gm-Message-State: AC+VfDypLrMYCjEqEZ6tW6Bzo5r89bFCf/aXcnlemqmV1/JKnegd7h1e
	2nxoayiIo1Bf8DSaJ/7316qkmN0cuPNaxjEbG4g=
X-Google-Smtp-Source: ACHHUZ5LXB2GGpTth50QwGaF1r9ATLp3VHmm5/m7EW57RPp9upvSN9LQS14BGDeYC2Kr+/Vi0wX8BeWxerm5Q629S9k=
X-Received: by 2002:a05:6214:5183:b0:61a:fe65:4481 with SMTP id
 kl3-20020a056214518300b0061afe654481mr2595650qvb.51.1684489921968; Fri, 19
 May 2023 02:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230516193549.544673-1-arnd@kernel.org> <a78d9dcd-0bc1-7e98-a8f1-e5d6cd0c09a3@intel.com>
In-Reply-To: <a78d9dcd-0bc1-7e98-a8f1-e5d6cd0c09a3@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 May 2023 12:51:25 +0300
Message-ID: <CAHp75VeX9=1+apLMZsidudUziO_s4WUb=HOd0mraRHL17DN+cw@mail.gmail.com>
Subject: Re: [PATCH 00/20] x86: address -Wmissing-prototype warnings
To: Dave Hansen <dave.hansen@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Juergen Gross <jgross@suse.com>, "Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>, 
	Alexey Makhalov <amakhalov@vmware.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-pm@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 12:56=E2=80=AFAM Dave Hansen <dave.hansen@intel.com=
> wrote:
> On 5/16/23 12:35, Arnd Bergmann wrote:

> I picked up the ones that were blatantly obvious, but left out 03, 04,
> 10, 12 and 19 for the moment.

Btw, there is series that went unnoticed

https://lore.kernel.org/all/20211119110017.48510-1-andriy.shevchenko@linux.=
intel.com/

I dunno why.

--=20
With Best Regards,
Andy Shevchenko

