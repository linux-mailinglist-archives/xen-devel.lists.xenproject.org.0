Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BA348C91
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101338.193755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPM6k-0007hN-Bo; Thu, 25 Mar 2021 09:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101338.193755; Thu, 25 Mar 2021 09:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPM6k-0007h1-84; Thu, 25 Mar 2021 09:16:50 +0000
Received: by outflank-mailman (input) for mailman id 101338;
 Thu, 25 Mar 2021 09:16:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q7uR=IX=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1lPM6i-0007gw-NQ
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:16:49 +0000
Received: from mail-oi1-x233.google.com (unknown [2607:f8b0:4864:20::233])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d63cdfe5-05d0-4860-acd6-30860c1277a9;
 Thu, 25 Mar 2021 09:16:47 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id x207so1463195oif.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Mar 2021 02:16:47 -0700 (PDT)
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
X-Inumbo-ID: d63cdfe5-05d0-4860-acd6-30860c1277a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WXOKWywYABw9gNC/Cfe6LcUrbMnuPsaMy+ZmXW6+jwk=;
        b=VS0a8U0oOPLleG0c1Q1cJZCd6WJNc/wWetmbvouXkWTxkiwqSGZAbHnfyNDbPbXQAz
         jIQtk4leA6dx9wSun9/f0ZbtMH3ncHZ5EQJ3dw552SkTe6WXmaEoJWQR6G+eIsfOx4TS
         Qj00SO7qND7yhQto43yY/IJkGAudEz33CQXuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WXOKWywYABw9gNC/Cfe6LcUrbMnuPsaMy+ZmXW6+jwk=;
        b=kPbIc9OrRrx2ooDKKnoqD9n8ISZAZkcsK9aApwkXrpCg2ZZO/v8VyFjZOaQFssaK7r
         724piCefpoTAOis8KCvmNAB6qo8Md6hfkeDDmRljVHyY7uROxLJHScnn4T/iJ1JsTGHP
         V7sLaa14AClrO+a1axqck9ohcAqsU673JxKU4PybRrmoop95wgYUaH9j6gSgPGkmJ/J3
         WX5x66Vz5N0Eebiv8vFlMGWd25Ds9E0Df8l2thdPfwOIX50vJ8Yne4SGOgB0XoSKSv2O
         Df1H9tMQoKhyEChYzjtvRLdUOM21jtW6gswwT4Bye+AV6pe0Rq9NebgQ+kdmBwZxgSWY
         girA==
X-Gm-Message-State: AOAM5319ht0xWH+arSEaqZtq58GFyxyBBCLWJQ9U1yEX7qvZMe1Iw3ce
	BC+7XsPo8i3iEbGGZTKi2ZrQ2WwM0J4tz2v3vrS5Sw==
X-Google-Smtp-Source: ABdhPJytsJjbKqMJCBkhVZVEz6znKYYwTbAL/6ddw6ajhG9nL40C06B20SHXzBy9ZL4KSWKD22wiqaFfQ7AsZO8Z0Es=
X-Received: by 2002:aca:4188:: with SMTP id o130mr5286825oia.101.1616663806913;
 Thu, 25 Mar 2021 02:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210325061901.851273-1-wanjiabing@vivo.com> <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
In-Reply-To: <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Mar 2021 10:16:35 +0100
Message-ID: <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared twice
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kael_w@yeah.net" <kael_w@yeah.net>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 25, 2021 at 7:53 AM Oleksandr Andrushchenko
<Oleksandr_Andrushchenko@epam.com> wrote:
>
> Hi,
>
> On 3/25/21 8:19 AM, Wan Jiabing wrote:
> > struct xen_drm_front_drm_info has been declared.
> > Remove the duplicate.
> >
> > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
>
> Thank you for the patch,
>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> Will apply to drm-misc-next-fixes

drm-misc-next-fixes is the wrong tree, bugfixes outside of the merge
window belong into drm-misc-fixes. Please consult

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch

We need to hard-reset drm-misc-next-fixes back, please re-apply the
patches (both of them) to drm-misc-fixes. Also adding drm-misc
maintainers.
-Daniel

>
> Thank you,
>
> Oleksandr
>
> > ---
> >   drivers/gpu/drm/xen/xen_drm_front_conn.h | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.h b/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > index 3adacba9a23b..e5f4314899ee 100644
> > --- a/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > +++ b/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > @@ -16,7 +16,6 @@
> >   struct drm_connector;
> >   struct xen_drm_front_drm_info;
> >
> > -struct xen_drm_front_drm_info;
> >
> >   int xen_drm_front_conn_init(struct xen_drm_front_drm_info *drm_info,
> >                           struct drm_connector *connector);



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

