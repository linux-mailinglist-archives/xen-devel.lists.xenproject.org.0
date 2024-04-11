Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAC28A0F66
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 12:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703829.1099719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruraY-0000gG-Oz; Thu, 11 Apr 2024 10:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703829.1099719; Thu, 11 Apr 2024 10:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruraY-0000dg-Li; Thu, 11 Apr 2024 10:23:26 +0000
Received: by outflank-mailman (input) for mailman id 703829;
 Thu, 11 Apr 2024 10:23:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVMu=LQ=linaro.org=manos.pitsidianakis@srs-se1.protection.inumbo.net>)
 id 1ruraX-0000da-Cn
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 10:23:25 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b939ef-f7ed-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 12:23:24 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a522715519bso34765266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 03:23:23 -0700 (PDT)
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
X-Inumbo-ID: 86b939ef-f7ed-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712831003; x=1713435803; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygIGmYwRz8hhzE0Eyn9WW/twVMRy7GWhBN5DIae5z5g=;
        b=eHk4NMBJ4Vv1BNGPxO2f4UhC7/Xb2AivvQnWLRE0qrdrRf0H2Pxi4PLsp1WTQ0pOgZ
         AlYEoJaQ0HmYnJYWip2S7KKRInQtk3nto5QzRQfr9yUpFOCqpDWW9Os7zbVkBtDYQ8B9
         2UXlzglPcD37XkWwZ+h9lp3muMJUiC7/2RV5uh7AgqjTzQvbGD8QOiouqOfaYc7WkNkC
         nr1eikVTs7pIOGfcG6sz64GwmSQMY5wTaB9AxP+2rtlHBZXdb8JE9mamDlp14X5E78TV
         rwHqUd3JrGYJDmnucs8mO/YHxjE4YSpFrb+2wxljh1XbL0NwTyS1xAvAdwgS2pYphq/6
         8+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712831003; x=1713435803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygIGmYwRz8hhzE0Eyn9WW/twVMRy7GWhBN5DIae5z5g=;
        b=asRL35zl8CJRJt8MyMjk+dmBS/uVIP1rtrqiWuWPO1+/EW9nVcJGAldHWybJSj9xC7
         31Ywx5VXLNJjaYmrauYmu02N5GlxA+h5OGCoM8gtSl55MnRsKX6CioelhReeoNvlK2kn
         mTzAQ40fhTgMzPFwZCb7rFf1GvRhQ4AYDNIjRSUP3delJUUsUGaeqfLJIX63QSgB3/Oi
         oghiyYoeTZoBgk4U4LLwpxIngFkqmRSlOiQwjwQzsEpVKlZ4NKEO8400Wx4anBExxIKN
         5Jys9/9nz3x0gHMqf3q6TYoPpT0SK0DxVD+SEZ5JdG5kcPUhetqwo7cpVclk53oCpwOP
         t/Rg==
X-Gm-Message-State: AOJu0YxWtRN4GBtRMCyBf83fUrFfBR3Sck8OIYEG6q2WdHHqpsgcaDhs
	IvAy35xh4jpvEEXljxJC09tLgEh3TNbs4oGLQvetFJveiOs9Xf1ZR6JDSwuBR8nUvYYogAy6gYy
	ji15fuhK8KWnFhFMTT72HJXZxpJav4Uqu3wK5qg==
X-Google-Smtp-Source: AGHT+IFYo2NhRc1jCIhq6usz7cX1NBd0FwmNfFMi6LXNNUgde+85kZjsxcNx4x9uXJDLZlUkPdApJhsuJl3WJPRWmQ4=
X-Received: by 2002:a17:907:9302:b0:a52:1466:4d1b with SMTP id
 bu2-20020a170907930200b00a5214664d1bmr3283563ejc.17.1712831003079; Thu, 11
 Apr 2024 03:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712748711.git.manos.pitsidianakis@linaro.org> <c00304a2-f990-4fb3-9276-7f4907b583ea@perard>
In-Reply-To: <c00304a2-f990-4fb3-9276-7f4907b583ea@perard>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 11 Apr 2024 13:23:07 +0300
Message-ID: <CAAjaMXbhjQT-PFJmYBOyXWbOwMKsUEa964+svR8XkJ-tYQ4a+g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/2] convert LIBXL_DEVICE_MODEL_START_TIMEOUT to
 env var
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Apr 2024 at 18:53, Anthony PERARD <anthony.perard@citrix.com> wr=
ote:
>
> On Wed, Apr 10, 2024 at 02:43:13PM +0300, Manos Pitsidianakis wrote:
> > This patch series proposes converting the compile-time define
> > LIBXL_DEVICE_MODEL_START_TIMEOUT value to an optionally overridden by
> > environment variable value, just like the current behavior for
> > LIBXL_BOOTLOADER_TIMEOUT is.
> >
> > Manos Pitsidianakis (2):
> >   libs/light: add device model start timeout env var
> >   libs/light: expand device model start timeout use
> >
> >  docs/man/xl.1.pod.in                 | 11 +++++++++++
> >  tools/libs/light/libxl_9pfs.c        |  2 +-
> >  tools/libs/light/libxl_device.c      |  2 +-
> >  tools/libs/light/libxl_dm.c          | 10 +++++-----
> >  tools/libs/light/libxl_dom_suspend.c |  2 +-
> >  tools/libs/light/libxl_domain.c      |  5 +++--
> >  tools/libs/light/libxl_internal.h    |  6 ++++++
> >  tools/libs/light/libxl_pci.c         | 10 +++++-----
> >  tools/libs/light/libxl_usb.c         |  8 ++++----
> >  9 files changed, 37 insertions(+), 19 deletions(-)
> >
> >
> > base-commit: f48299cad5c3c69fdc2c101517a6dab9c9827ea5
> > --
> > =CE=B3=CE=B1=E1=BF=96=CE=B1 =CF=80=CF=85=CF=81=CE=AF =CE=BC=CE=B9=CF=87=
=CE=B8=CE=AE=CF=84=CF=89
> >
> >
>
> Hi Manos,
>
> Did you know that you could run something like
>     `git send-email --cc-cmd=3D"scripts/get_maintainer.pl --no-l" ...`
> and git would CC the maintainers of the code?
>
> I've configure my xen repo to have that been automatic, with
>     git config sendemail.cccmd 'cd `git rev-parse --show-toplevel` && scr=
ipts/get_maintainer.pl --no-l'
>
> There's other way to send patch, like using
> "scripts/add_maintainers.pl" described on this page:
> https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Sending_a=
_Patch_Series
> Not sure which one is better.
>
> Anyway, I've added the series to my list of patch to look at. But I
> might miss it next time if I'm not CCed.
>
> Cheers,
>
> --
> Anthony PERARD

Hello Anthony,

I do know about that, in fact I used it and it did not output your
email. Here's what the `get_maintainer.pl` outputs: (same output for
all patches):

$ ./scripts/get_maintainer.pl --no-l
../../patches/libxl-dm-timeout-v1/v1-0001-libs-light-add-device-model-start=
-timeout-env-var.patch
Andrew Cooper <andrew.cooper3@citrix.com>
George Dunlap <george.dunlap@citrix.com>
Jan Beulich <jbeulich@suse.com>
Julien Grall <julien@xen.org>
Stefano Stabellini <sstabellini@kernel.org>

Thanks,

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd

