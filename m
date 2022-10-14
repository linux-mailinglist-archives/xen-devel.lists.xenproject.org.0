Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEC55FEEA5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 15:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422881.669215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojKm9-0004WV-RU; Fri, 14 Oct 2022 13:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422881.669215; Fri, 14 Oct 2022 13:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojKm9-0004U1-Oo; Fri, 14 Oct 2022 13:30:57 +0000
Received: by outflank-mailman (input) for mailman id 422881;
 Fri, 14 Oct 2022 13:30:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OdXR=2P=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ojKm8-0004Tv-Nh
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 13:30:56 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e657b16-4bc4-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 15:30:55 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id a67so6807383edf.12
 for <xen-devel@lists.xenproject.org>; Fri, 14 Oct 2022 06:30:55 -0700 (PDT)
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
X-Inumbo-ID: 6e657b16-4bc4-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fCFJXDLeiHDdW21MT0i61+McsH45sDgzEF/fG3LGrfs=;
        b=lZfE/j1sUplFb2uwpGf9l2Ts7qs8NBF80rd96B8ykdF67+AUT4ynJOYpQYm0Q5TD4C
         GMrbkNzNhVnWAGoeN0qCX9pPpQ2xU9HaVLwCzxzaXQOPtNpP+aRGv/lKpeisFi9yulIt
         cejnHfgpK5JdXUw9heD0QH9C+fDOkT/tbQTuX/5/l0eWq1aZODtyi5ScJXqdGju5TKZM
         OnD55RwwjWw6m2C5vKr3JbnS4CeUESU1EGyiVBTboMrH9AtkHCd5De7xtj99Td3FTtOs
         GGsN49gfB3g3diTZcPJp4eG7mnzqsoLbaKYuy/eD1IMg6KNkJo1QHpnxRj8VpzwJCM6J
         ooBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCFJXDLeiHDdW21MT0i61+McsH45sDgzEF/fG3LGrfs=;
        b=44w0O0IAxLnlw2PDcam19N+yM52latJJfJ9JZucj/5ntUp9sPOR7YgasEJ4+xxaLU9
         ++zkG3dcZ9ev6k9lcSMkknwVlK20dn2oWHWH9b4CGBHfUqBULuygYOt36ZJmHLOJ5q0N
         Q1Vqpngvm5Svg/dfgN2629knnC5B7M8In/QmIgaRm8jyq4STkbn+NtUhOh2tsTNybyTE
         BWhv1RGnbUcY9cn4G/0XfZk+0E6ZB+ZZLNrlWDWLnHyzc1Ml0sWP+pKXWUPwFmv640UW
         /gndQRDcBKqCNN6eNcm4tnRGs2pPG9N+tWWmn8gVbHSNvwzZbaUOC9ZhDibbtgPCKHN0
         +Uow==
X-Gm-Message-State: ACrzQf3jynmcYz5I0akRUcpHiMzmpEH/fK8HAi82hKJxByM+3HW4xxnW
	RzzwQa5P7J4d97hkYTgMyxLoqWwgL8uSEb3M7CE=
X-Google-Smtp-Source: AMsMyM6KjgMhqNOUtX9PIbyKY44l3FpupTIIyQStxef4h2Dkojb3mlEo3qveS7QcbmECt8jpsFJgzshBQPS5GMP7H8s=
X-Received: by 2002:a05:6402:524d:b0:459:3619:9cfa with SMTP id
 t13-20020a056402524d00b0045936199cfamr4370961edd.227.1665754255190; Fri, 14
 Oct 2022 06:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221007193124.20322-1-jandryuk@gmail.com> <d12f3e75-db44-c7a5-958d-06ea99f881f0@citrix.com>
In-Reply-To: <d12f3e75-db44-c7a5-958d-06ea99f881f0@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 14 Oct 2022 09:30:43 -0400
Message-ID: <CAKf6xpuz4C3KzR-RR_KdSn7z0sR6swbh-pNdG0QgPpQt0fW1pw@mail.gmail.com>
Subject: Re: [PATCH] argo: Remove reachable ASSERT_UNREACHABLE
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022 at 9:22 AM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> On 07/10/2022 20:31, Jason Andryuk wrote:
> > I observed this ASSERT_UNREACHABLE in partner_rings_remove consistently
> > trip.  It was in OpenXT with the viptables patch applied.
> >
> > dom10 shuts down.
> > dom7 is REJECTED sending to dom10.
> > dom7 shuts down and this ASSERT trips for dom10.
> >
> > The argo_send_info has a domid, but there is no refcount taken on
> > the domain.  Therefore it's not appropriate to ASSERT that the domain
> > can be looked up via domid.  Replace with a debug message.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> >  xen/common/argo.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/common/argo.c b/xen/common/argo.c
> > index 748b8714d6..973e1e9956 100644
> > --- a/xen/common/argo.c
> > +++ b/xen/common/argo.c
> > @@ -1298,7 +1298,8 @@ partner_rings_remove(struct domain *src_d)
> >                      ASSERT_UNREACHABLE();
> >              }
> >              else
> > -                ASSERT_UNREACHABLE();
> > +                argo_dprintk("%pd has entry for stale partner domid %d\n",
> > +                             src_d, send_info->id.domain_id);
>
> I was just about to commit this, but it ought to be
>
> "%pd has entry for stale partner d%u\n"
>
> so the two domains are rendered alike in the message.
>
> Can fix on your behalf if you agree.

Yes, that sounds better.

Thank you.

-Jason

