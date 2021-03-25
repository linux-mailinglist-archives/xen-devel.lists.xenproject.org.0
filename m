Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D2348CA2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101345.193768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPM8v-00081x-S1; Thu, 25 Mar 2021 09:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101345.193768; Thu, 25 Mar 2021 09:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPM8v-00081Y-Ob; Thu, 25 Mar 2021 09:19:05 +0000
Received: by outflank-mailman (input) for mailman id 101345;
 Thu, 25 Mar 2021 09:19:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q7uR=IX=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1lPM8u-00081T-1h
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:19:04 +0000
Received: from mail-ot1-x32c.google.com (unknown [2607:f8b0:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87f3a48a-baa9-490b-98d6-41d575b13615;
 Thu, 25 Mar 2021 09:19:02 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so1322298otn.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Mar 2021 02:19:02 -0700 (PDT)
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
X-Inumbo-ID: 87f3a48a-baa9-490b-98d6-41d575b13615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s8gaLzfKO51sv2EAdyYwOBAav4JswI+vzWWUFTJdNYY=;
        b=ZkxfOIKsj2q9i0xgCpJIWPTGgfJnpexFD69S2YCMtm7qz9+Vz3iFYeeL/zq8cW43eJ
         ZxJ0JznpvlRjP0MCLr3dVA6OrS5dUJtNyIVuvegpRL22m1fimwU5A2IkRinyZfD/MOg9
         pdBoeBEUs7bsM2BitRB3evCfcTP2TuuWcIMoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s8gaLzfKO51sv2EAdyYwOBAav4JswI+vzWWUFTJdNYY=;
        b=qyPYfSrPT/TtVrV3O5a+Xc/amrIWVR3rerZnrRO8ZGeW0zUVT+SZL+RBLstnMjdkDm
         GlHrVwQyZ00tz1KcVhN4PF7vPr67pefWBrmZLsNNYdRiMr882eSM5GFvStRIebKklKcb
         yAoGxU7t6pTdOAVR+2d1LJndPq/IT6yRB8G9f12J9bem/pRSnF2/VbVUFAap5YmzB1Lg
         /0AvIEEvNBfQsqwtDVc7Zna7epeJQrHuDckpkIAaLv7vwirJpY2h3vsbCcrkfnTFsZNn
         xElZMskdrYhkC6JtWNvqnp/UJkd9WbMNjyRMW4reDqRJkAPG5LIpIlNsmr0BknQke0N/
         NJWw==
X-Gm-Message-State: AOAM532ieHjNwwncZsiLFIPK5/1GxpVKhohVtO4dML1W6meJeDAlv7wT
	YT48Q5WLNNvlz7pnaQacoRtIFKcQUzrKUj9hTrcLgw==
X-Google-Smtp-Source: ABdhPJwuRBoHhQ1X/QBIV1XedaouhUZsXyPMY5vgD/AZosvW57FTBULFoCWN1cliFURZtu4WwmxByGgjBHWXJVPUY/M=
X-Received: by 2002:a9d:845:: with SMTP id 63mr4608787oty.303.1616663942428;
 Thu, 25 Mar 2021 02:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210325061901.851273-1-wanjiabing@vivo.com> <e45d6b24-5e74-17f6-eb18-c6e51fed923a@epam.com>
 <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
In-Reply-To: <CAKMK7uEpNexmDYar36ZEX0hbHoxH3Y+_D42NqjRwAqxpiCXHRA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Mar 2021 10:18:51 +0100
Message-ID: <CAKMK7uGsjv5S8eKGwmM1ErQPnx+UdxgF5c8YXewEDEyMakpEig@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: xen_drm_front_drm_info is declared twice
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kael_w@yeah.net" <kael_w@yeah.net>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 25, 2021 at 10:16 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Mar 25, 2021 at 7:53 AM Oleksandr Andrushchenko
> <Oleksandr_Andrushchenko@epam.com> wrote:
> >
> > Hi,
> >
> > On 3/25/21 8:19 AM, Wan Jiabing wrote:
> > > struct xen_drm_front_drm_info has been declared.
> > > Remove the duplicate.
> > >
> > > Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> >
> > Thank you for the patch,
> >
> > Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >
> > Will apply to drm-misc-next-fixes
>
> drm-misc-next-fixes is the wrong tree, bugfixes outside of the merge
> window belong into drm-misc-fixes. Please consult
>
> https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch
>
> We need to hard-reset drm-misc-next-fixes back, please re-apply the
> patches (both of them) to drm-misc-fixes. Also adding drm-misc
> maintainers.

Also simple cleanup like this should be pushed to drm-misc-next, not
any of the -fixes branches.
-Daniel

> -Daniel
>
> >
> > Thank you,
> >
> > Oleksandr
> >
> > > ---
> > >   drivers/gpu/drm/xen/xen_drm_front_conn.h | 1 -
> > >   1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xen/xen_drm_front_conn.h b/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > > index 3adacba9a23b..e5f4314899ee 100644
> > > --- a/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > > +++ b/drivers/gpu/drm/xen/xen_drm_front_conn.h
> > > @@ -16,7 +16,6 @@
> > >   struct drm_connector;
> > >   struct xen_drm_front_drm_info;
> > >
> > > -struct xen_drm_front_drm_info;
> > >
> > >   int xen_drm_front_conn_init(struct xen_drm_front_drm_info *drm_info,
> > >                           struct drm_connector *connector);
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

