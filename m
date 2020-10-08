Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10618287540
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 15:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4489.11707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQW14-0008Bb-Va; Thu, 08 Oct 2020 13:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4489.11707; Thu, 08 Oct 2020 13:31:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQW14-0008BC-SB; Thu, 08 Oct 2020 13:31:30 +0000
Received: by outflank-mailman (input) for mailman id 4489;
 Thu, 08 Oct 2020 13:31:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PeKH=DP=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kQW13-0008B7-Dr
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 13:31:29 +0000
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fea143d-6cc2-4203-a0d7-760aa7ba69fa;
 Thu, 08 Oct 2020 13:31:28 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f21so5745153ljh.7
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 06:31:28 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PeKH=DP=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kQW13-0008B7-Dr
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 13:31:29 +0000
X-Inumbo-ID: 3fea143d-6cc2-4203-a0d7-760aa7ba69fa
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3fea143d-6cc2-4203-a0d7-760aa7ba69fa;
	Thu, 08 Oct 2020 13:31:28 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f21so5745153ljh.7
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XxY5tVysIH111MlcFgaa6XJyUOWdKj60fn8nTmIS7ZU=;
        b=mIgvKrOmlpbB1xCsEQvYeD/mp2F1awXVZ2UzVEA5Jeo1lnrVxQp2WbQianhfyV/O+F
         3gKpsSX1pQv/7uh4XaCjor5ly0+GCSqflxMTpCOr11N5YODh5+0C9c5sSi+0nrKxABxK
         4aFz/LhFlJDj4uMM3+QJ1lAHmLYUVmke7JNFz6gKhTe08EAUufAEfxNrhVwf6lniC16v
         7sTgv22XD5yjpqmTTlacaygt1bUDN6FR5fSxOpIFhximwv7KmYY1iL36B6rmPozgzMW0
         cHF9GtDJfHezcUBnKcZUG8uKBKRzAma3FO/Uj1yjrVwxpENJZJPNtHvNn3XCCpE0VJ4G
         exkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XxY5tVysIH111MlcFgaa6XJyUOWdKj60fn8nTmIS7ZU=;
        b=LX2awGLVI5mrmiA6JwDFg1y9B3NlBdyj4hv8bvP8aYxESYRLnKRjrOXLtOaEE/WGIO
         O/IKjFiklbe1jnkveRRo7ZTt22Otpbm3xtg4nlNOkEZ9XB1sNUZzKwDXMFMuFi1AHmht
         UPrVbVNwRtxidEYQsGV6TZsFskbpMHym4hYknpL3thkTIE6wpiY0314FK9BXe14FtAso
         cmgNYHcoXuqmvUSNF38BabpBuo1Nt620r6sQM6AFRRm9wBpOz1Ck05NtNoJp5h8S9RpD
         ZSGSeb8YTsgWxHe1YP32F2gEf5ar8KNbJPjiXGeYTUpafhNEGExxt9vDh2RVpDktjfd6
         Pnvg==
X-Gm-Message-State: AOAM53068bABCmmbSbJJea20yBNqSKuZTYDiSHxtHh1nuSQeBLJuKIOJ
	91U56aHy5IRqyyek9oHsJb2CqyXMfinOaujIxtMQBLWPj60=
X-Google-Smtp-Source: ABdhPJz/GdflQ9RyPbOMn6d1xEV/b/a0AE0+Ss5B2q0bN9u9JdRB3vyvf9OhoqxN0dZbD/u8J79fYfkI1XnXGVhgwLA=
X-Received: by 2002:a2e:8782:: with SMTP id n2mr3503919lji.262.1602163887265;
 Thu, 08 Oct 2020 06:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201001235337.83948-1-jandryuk@gmail.com> <20201007105049.vfpunr4g62fqvijr@liuwe-devbox-debian-v2>
In-Reply-To: <20201007105049.vfpunr4g62fqvijr@liuwe-devbox-debian-v2>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 8 Oct 2020 09:31:15 -0400
Message-ID: <CAKf6xptt_r6_VuRSwRXQRUR4Q39c_619e4iNxi8uVxV7YOHDBw@mail.gmail.com>
Subject: Re: [PATCH] libxl: only query VNC when enabled
To: Wei Liu <wl@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 7, 2020 at 6:50 AM Wei Liu <wl@xen.org> wrote:
>
> On Thu, Oct 01, 2020 at 07:53:37PM -0400, Jason Andryuk wrote:
> > QEMU without VNC support (configure --disable-vnc) will return an error
> > when VNC is queried over QMP since it does not recognize the QMP
> > command.  This will cause libxl to fail starting the domain even if VNC
> > is not enabled.  Therefore only query QEMU for VNC support when using
> > VNC, so a VNC-less QEMU will function in this configuration.
> >
> > 'goto out' jumps to the call to device_model_postconfig_done(), the
> > final callback after the chain of vnc queries.  This bypasses all the
> > QMP VNC queries.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  tools/libs/light/libxl_dm.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> > index a944181781..d1ff35dda3 100644
> > --- a/tools/libs/light/libxl_dm.c
> > +++ b/tools/libs/light/libxl_dm.c
> > @@ -3140,6 +3140,7 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
> >  {
> >      EGC_GC;
> >      libxl__dm_spawn_state *dmss = CONTAINER_OF(qmp, *dmss, qmp);
> > +    const libxl_vnc_info *vnc = libxl__dm_vnc(dmss->guest_config);
> >      const libxl__json_object *item = NULL;
> >      const libxl__json_object *o = NULL;
> >      int i = 0;
> > @@ -3197,6 +3198,9 @@ static void device_model_postconfig_chardev(libxl__egc *egc,
> >          if (rc) goto out;
> >      }
> >
> > +    if (!vnc)
> > +        goto out;
> > +
>
> I would rather this check be done in device_model_postconfig_vnc.
>
> Does the following work for you?

I like your version, but it doesn't work:
libxl: debug: libxl_qmp.c:1883:libxl__ev_qmp_send: Domain 1: ev
0x55aa58417d88, cmd 'query-vnc'
libxl: error: libxl_qmp.c:1836:qmp_ev_parse_error_messages: Domain
1:The command query-vnc has not been found
libxl: error: libxl_dm.c:3321:device_model_postconfig_done: Domain
1:Post DM startup configs failed, rc=-29

When QEMU has vnc disabled, it doesn't recognize query-vnc.  I looked
at modifying qemu to support query-vnc even with --disable-vnc, but it
was messy to untangle the QMP definitions.  Since we are telling libxl
not to use VNC, it makes sense not to query about it.

Regards,
Jason

> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index a944181781bb..c5db755a65d7 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -3222,6 +3222,8 @@ static void device_model_postconfig_vnc(libxl__egc *egc,
>
>      if (rc) goto out;
>
> +    if (!vnc) goto out;
> +
>      /*
>       * query-vnc response:
>       * { 'enabled': 'bool', '*host': 'str', '*service': 'str' }
> @@ -3255,7 +3257,8 @@ static void device_model_postconfig_vnc(libxl__egc *egc,
>          if (rc) goto out;
>      }
>
> -    if (vnc && vnc->passwd && vnc->passwd[0]) {
> +    assert(vnc);
> +    if (vnc->passwd && vnc->passwd[0]) {
>          qmp->callback = device_model_postconfig_vnc_passwd;
>          libxl__qmp_param_add_string(gc, &args, "password", vnc->passwd);
>          rc = libxl__ev_qmp_send(egc, qmp, "change-vnc-password", args);
>

