Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19D26A9618
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 12:25:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505891.778884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3X5-0001sy-L1; Fri, 03 Mar 2023 11:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505891.778884; Fri, 03 Mar 2023 11:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY3X5-0001rN-H2; Fri, 03 Mar 2023 11:25:03 +0000
Received: by outflank-mailman (input) for mailman id 505891;
 Fri, 03 Mar 2023 11:25:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3OdA=63=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1pY3X3-0001rF-Ne
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 11:25:01 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07ee9370-b9b6-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 12:24:59 +0100 (CET)
Received: by mail-pf1-x42a.google.com with SMTP id y10so1313898pfi.8
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 03:24:59 -0800 (PST)
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
X-Inumbo-ID: 07ee9370-b9b6-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677842698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aT5E5FQuhkYZHN7xCNC3IujwXcdIeJdZVQgTLRWi92M=;
        b=JdlLeBN9mZJKEzV2VH1S1A56dOCzQMFoF3EFCCzNeJhuZ0/DcQj0FSt6e+TAwbQ8a/
         9sFQyrtfC3y9X0+7Ge7TFkFeBBu/HfLMyCr0TD5vmRswBGNsMR0KuPPcC/t+0Nxkyg94
         akiDWvTZlsZ6o+AnhgnxbxN5VJXTOyAXd8wiBQ9bH4agHMMI1JenET0Q5kr13rdOXADZ
         G0bd5vBN/KVFmaFe7hiFRlnnaJ3W1II1jZJrGujsdTk4ORgorIXvETWuDQmhj5fNAi6M
         LPDGI+bWQc7wCa2g+Sz+/eaGH3DArOygO9P4pmwO7LKLsiOARMLG0eSFMnIF41229i2A
         HYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677842698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aT5E5FQuhkYZHN7xCNC3IujwXcdIeJdZVQgTLRWi92M=;
        b=WluXadXJJAy7XIovcyD2hh7x1860ax4I8MK5As5fY4nNR/XmclI389JBeZdlAuDEb4
         0QTM/D+utWpiS2BHkBdnGq0NzaU8d0n/jwsQkBiHtwpQq8GYBum9OJB3+2ITOWTGqtFC
         aOji+qii4QlxJlTpCQnxpgr0hRdGE7d+IXrrgbTZeqoOkkK3mSpUC8G/OV6fV1lZe90u
         Ok66RcDPKoKT8F03Q9nXbvXe1a3qzLRStyap3whb7gBwreKil7u1L8x4Pf6OsLeJ/IAb
         qKmqfAAu0q8JnMIW4ucZeq6+UjD6oebLYdruPZ1S3P/oxNN8CwdoP4yMTz6EcJeVPoKM
         2qPQ==
X-Gm-Message-State: AO0yUKV2HvJdhbOeIfLpdE3FjOEYXZT9xceHCCayiK364pdXkjj9AuEi
	39CSp8Zq+zlAEAHncA65CW8B/kPPnh8GEoS/3k6ODw==
X-Google-Smtp-Source: AK7set9TFhgmzEYff5a5Y/FhcSMZ3q7NzK7FxjJZYmiBpcpZypyz3OwZzAn3/jSFaGTGPE0QrSfYtgRzKg7q/DB7Eps=
X-Received: by 2002:a62:ce4e:0:b0:606:6380:98da with SMTP id
 y75-20020a62ce4e000000b00606638098damr729699pfg.5.1677842698016; Fri, 03 Mar
 2023 03:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20230302163106.465559-1-thuth@redhat.com> <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com> <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
In-Reply-To: <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:24:46 +0000
Message-ID: <CAFEAcA9cE087cowTodqAb2mkzGxxnAcBGZsMNu6uj_Nsa2v-dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, Daniel Berrange <berrange@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com, 
	Richard Henderson <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, 
	Reinoud Zandijk <reinoud@netbsd.org>, Michael Tokarev <mjt@tls.msk.ru>, Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Mar 2023 at 11:09, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hello!
>
> On Fri, 2023-03-03 at 10:48 +0100, Thomas Huth wrote:
> > x86 ==> deprecate both, user and system emulation support on
> >          32-bit hosts
> > arm ==> deprecate only system emulation on 32-bit hosts.
>
> I would recommend against dropping support for 32-bit hosts for qemu-user
> as there are some cases where the emulation of 32-bit user code on 64-bit
> hosts does not work properly [1].
>
> Adrian
>
> > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=23960

I failed entirely to get any traction with persuading the
kernel folks to provide an API to let QEMU work in that
"32-bit guest wants a 32-bit dirent but the kernel is
providing a 64-bit hash value as a dirent" case. Somebody kindly
wrote some kernel patches but they went absolutely nowhere.

It seems to only happen for certain kinds of 32-bit guest, where
the guest libc is not also using 64-bit dirents. So at least as
far as Arm guests are concerned the effective result was "the
older arm binaries that were built to need a 32-bit dirent are
just not around any more, so very few people run into the problem".
You can also work around it by using a different host filesystem
type, I think.

thanks
-- PMM

