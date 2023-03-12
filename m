Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA35B6B6A9A
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 20:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509069.784223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbREa-0006vk-Rd; Sun, 12 Mar 2023 19:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509069.784223; Sun, 12 Mar 2023 19:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbREa-0006ss-Ox; Sun, 12 Mar 2023 19:19:56 +0000
Received: by outflank-mailman (input) for mailman id 509069;
 Sun, 12 Mar 2023 19:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mwuj=7E=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pbREY-0006sm-Fz
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 19:19:54 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ddb1e23c-c10a-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 20:19:53 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id fd5so6620270edb.7
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 12:19:53 -0700 (PDT)
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
X-Inumbo-ID: ddb1e23c-c10a-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678648793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJEKeSIYKyykgRw4CZfpY5eGfPgAxkplhj2E6WMVV1Q=;
        b=d3UMIqu1gFdqkpcOaL0CtJ0IDQKL6YVoOMuAvAEA1b/gx2Zo38CpJ10edy5k2VgrXC
         HDLefI5ZKI0xvZVUrY8QnKsDY+UMcuw7u7A/G4PfqSgY8fChHfRQj+AlcNY0+fydAfDW
         ckw1cgdP5ToLZ4g3GAL4OYMt3ff6IlwJUiePRBVIAX3076BdgkPYEcpI4pu/cNvNk0zT
         reBMzAuaWaRKwmKJ9kgzqFwEtZoaUOS8F2Jlsp5jIWzziOZpEY7aTVvuUO+8Zc46YPMM
         +dL0aZq6amEqLmxZ5iG25PSwqO3jSdnPKZcGARBy16LQ2JgHKa8pan6XPzjacsS/mFRX
         9Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678648793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJEKeSIYKyykgRw4CZfpY5eGfPgAxkplhj2E6WMVV1Q=;
        b=ToGurF+GgtzYZnULs7jyLV9u5NyX0d8i9vKtRlUJgA4tjMxrThQzxawjKIC9EhY+40
         bby9pyyxAPv0dmlwPQrfzA5UTY36KgLab/R7548R9Pl260eZbvw/GoXYendNmb3qnoh6
         ioI6W14JJ82XTe5KtjJyJn1w9CFTVfkYOLDmH1/rco0OeP5zPY3X2+FGdJtWHs6XdBcv
         GNF8QZPWL7v1ByFPolw5ZqxMTwDPmWStk7pVAfSQFcebX9cV02HufYugx9WYcu6NwsZv
         HCrDW6+mE0AsU2XgZUcvbuVLIki9okd6px9qkbCh0w6c2K3LwsaNQ5kZO3TSaQaLMKs+
         d+kw==
X-Gm-Message-State: AO0yUKX98W3qMPuogh0zs9oNskNdvmt18/nFR/CYLFcMjs/IOQ7mGeoq
	35gB8UO2fg9B72La08O2Dxjsq8ky9GaJB+llr7c=
X-Google-Smtp-Source: AK7set8dnmTVNz6T7mJo/7smv9W9vr9SjD9KAt4fOB0jOB2d9b/ik2li4mdhw5IicbhGqZimXp4sSIqX2BoYZivmNKs=
X-Received: by 2002:a50:baa7:0:b0:4ac:b832:856c with SMTP id
 x36-20020a50baa7000000b004acb832856cmr17640466ede.1.1678648792731; Sun, 12
 Mar 2023 12:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230307182707.2298618-1-dwmw2@infradead.org> <20230307182707.2298618-14-dwmw2@infradead.org>
In-Reply-To: <20230307182707.2298618-14-dwmw2@infradead.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 12 Mar 2023 15:19:40 -0400
Message-ID: <CAKf6xpuH2E=16s1jFvgL9J723wv0dhBD5aYWP2NBNj5rZio2jg@mail.gmail.com>
Subject: Re: [PULL 13/27] hw/xen: Add xenstore operations to allow redirection
 to internal emulation
To: David Woodhouse <dwmw2@infradead.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, 
	Joao Martins <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Juan Quintela <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 1:29=E2=80=AFPM David Woodhouse <dwmw2@infradead.org=
> wrote:
>
> From: Paul Durrant <pdurrant@amazon.com>
>
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>  accel/xen/xen-all.c                 |  11 +-
>  hw/char/xen_console.c               |   2 +-
>  hw/i386/kvm/xen_xenstore.c          |   3 -
>  hw/i386/kvm/xenstore_impl.h         |   8 +-
>  hw/xen/xen-bus-helper.c             |  62 +++----
>  hw/xen/xen-bus.c                    | 261 ++++------------------------
>  hw/xen/xen-legacy-backend.c         | 119 +++++++------
>  hw/xen/xen-operations.c             | 198 +++++++++++++++++++++
>  hw/xen/xen_devconfig.c              |   4 +-
>  hw/xen/xen_pt_graphics.c            |   1 -
>  hw/xen/xen_pvdev.c                  |  49 +-----
>  include/hw/xen/xen-bus-helper.h     |  26 +--
>  include/hw/xen/xen-bus.h            |  17 +-
>  include/hw/xen/xen-legacy-backend.h |   6 +-
>  include/hw/xen/xen_backend_ops.h    | 163 +++++++++++++++++
>  include/hw/xen/xen_common.h         |   1 -
>  include/hw/xen/xen_pvdev.h          |   2 +-
>  softmmu/globals.c                   |   1 +
>  18 files changed, 525 insertions(+), 409 deletions(-)
>
> diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
> index e85e4aeba5..425216230f 100644
> --- a/accel/xen/xen-all.c
> +++ b/accel/xen/xen-all.c
> @@ -90,12 +90,15 @@ void xenstore_store_pv_console_info(int i, Chardev *c=
hr)
>  }
>
>
> -static void xenstore_record_dm_state(struct xs_handle *xs, const char *s=
tate)
> +static void xenstore_record_dm_state(const char *state)
>  {
> +    struct xs_handle *xs;
>      char path[50];
>
> +    /* We now have everything we need to set the xenstore entry. */
> +    xs =3D xs_open(0);
>      if (xs =3D=3D NULL) {
> -        error_report("xenstore connection not initialized");
> +        fprintf(stderr, "Could not contact XenStore\n");
>          exit(1);
>      }

This breaks dm_restrict=3D1 since the xs_open is not allowed by the time
this is called.  There are other evtchn errors before this as well:
# cat /var/log/xen/qemu-dm-debian.log
char device redirected to /dev/pts/8 (label serial0)
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
xen be core: can't open evtchn device
Could not contact XenStore

Ok, those "xen be core: can't open evtchn device" were there before
the recent changes and seem to be non-fatal.

Regards,
Jason

