Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F466B9092
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509542.785479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc2E1-00019H-RT; Tue, 14 Mar 2023 10:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509542.785479; Tue, 14 Mar 2023 10:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc2E1-00017S-Ob; Tue, 14 Mar 2023 10:49:49 +0000
Received: by outflank-mailman (input) for mailman id 509542;
 Tue, 14 Mar 2023 10:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfqj=7G=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pc2Dz-00017M-US
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:49:47 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efadd250-c255-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 11:49:46 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id j11so60146700edq.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 03:49:46 -0700 (PDT)
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
X-Inumbo-ID: efadd250-c255-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678790986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRBbBOWk1CpW4YavqPLU53k3pPPWV1hrJi5FHoOOsSU=;
        b=MMgFbNGFIboxqbqujbMKbgh+IljKo1zGnHEcSjeF7Z8pgVYoFNBjzB2W5zM0/GW7jn
         dNNU2+LENsrwTZg4W6CZMi0AtEfgpAIblOyTxhw1WnXgtSRYv7i0ugGabcOSkrDU2n1a
         KTUP/Pe28lcapAul3atW+yTDpU6tKF4LorVipm8weCUorpM1JpWm6mnx7yPWotxHgoda
         n99k48lrHwEXK8cIJ5+EhvWhNLfc47ePAzxf7Nisgs/MxibA94AylxCsRh8kjvcyyIZc
         vd8e3ky8u7HsMKVdIAX76TmbMUruza0L3VAPZ7xWXGhsxykn0leIatlPn3J0xfFSzC2v
         OKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678790986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRBbBOWk1CpW4YavqPLU53k3pPPWV1hrJi5FHoOOsSU=;
        b=aMF4QiPbmn8LUeLro45SFZP4tIYChfZBIxc7GXwXAp24TGEUNONoa6pOui+YYyUZR3
         Davzt/os3v4LPvwtvNuu10T8PqcXaO5wzK+xVsGY3LhkoIvqvhAlydY93DtRaIWr7EZC
         3MUQcyNwzYscgOBqQ84ZSebdPLuqy83tDhtzj7QFichZIjIueQzWpOlKg+Rpkc4lM4Jy
         H+MFQ32m3GsOippUwO2JjouadUvUWROwWsvLdguY0LAgb+QXoA6PLbGnmpkU0EY9MBWy
         FZXzZ2F+DnCFe5tZDgQKLcv/S8qRQ6nC/funEB0hqgs0i0YG/WKPWvpiXlvhPzXoneRX
         +m6A==
X-Gm-Message-State: AO0yUKUsgKtXkUGvEt0gZFLOQY6pseT9FuiyUDHc+A7abEqQJEbvwSwc
	JNifl5IByZATdX7qfyj1/9l0+N4O2WqrRwLpBu4=
X-Google-Smtp-Source: AK7set+3pnDt7nYNxNIUIPOVZamzW/NGW2HTLgooCb4fJACiQ6quFcl4j2TJEuzwttUnQjPgo0wQZsoPSCV06uzUPzM=
X-Received: by 2002:a17:906:8552:b0:8ae:9f1e:a1c5 with SMTP id
 h18-20020a170906855200b008ae9f1ea1c5mr909195ejy.3.1678790986189; Tue, 14 Mar
 2023 03:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-14-dwmw2@infradead.org>
 <CAKf6xpuH2E=16s1jFvgL9J723wv0dhBD5aYWP2NBNj5rZio2jg@mail.gmail.com>
 <5062bef5b5cfd3e2d7f313de9af306f5e4f841f5.camel@infradead.org>
 <CAKf6xptRmeVmH3xmF8QffQA=aYeXxCWUw9ta2HaYx1xQngzjTA@mail.gmail.com> <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
In-Reply-To: <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Mar 2023 06:49:34 -0400
Message-ID: <CAKf6xptFp=g1yxD4vt3bpbcsLLjpLSc14u8DOHAmahjo25vuOA@mail.gmail.com>
Subject: Re: [PATCH] accel/xen: Fix DM state change notification in
 dm_restrict mode
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 4:35=E2=80=AFAM David Woodhouse <dwmw2@infradead.or=
g> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> When dm_restrict is set, QEMU isn't permitted to update the XenStore node
> to indicate its running status. Previously, the xs_write() call would fai=
l
> but the failure was ignored.
>
> However, in refactoring to allow for emulated XenStore operations, a new
> call to xs_open() was added. That one didn't fail gracefully, causing a
> fatal error when running in dm_restrict mode.
>
> Partially revert the offending patch, removing the additional call to
> xs_open() because the global 'xenstore' variable is still available; it
> just needs to be used with qemu_xen_xs_write() now instead of directly
> with the xs_write() libxenstore function.
>
> Also make the whole thing conditional on !xen_domid_restrict. There's no
> point even registering the state change handler to attempt to update the
> XenStore node when we know it's destined to fail.
>
> Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirectio=
n to internal emulation")
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Co-developed-by: Jason Andryuk <jandryuk@gmail.com>
> Not-Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Will-be-Tested-by: Jason Andryuk <jandryuk@gmail.com>

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks, David.

-Jason

