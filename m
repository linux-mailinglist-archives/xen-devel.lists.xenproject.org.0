Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC78194224
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:56:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTsx-0003jS-Qp; Thu, 26 Mar 2020 14:53:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MmV=5L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jHTsw-0003jB-JY
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:53:30 +0000
X-Inumbo-ID: 8e369632-6f71-11ea-92cf-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e369632-6f71-11ea-92cf-bc764e2007e4;
 Thu, 26 Mar 2020 14:53:30 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a43so7134273edf.6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=accm1HEz9y1QW9zDFwYKrDr3WTDEmQrq+2lsT0mkagA=;
 b=QlfNFBsuWla04dWzn/4pzsWsjkEfAoSoA6lwL9tvm70LfCUss1uklND3UeQQRywjBQ
 5kCywZAeJbsVVSPP6T1nCPr9/dCbM7Hen0R76Av0aQXofNGvhfdaST/bK26VZ4WXkw85
 97ki5/gjrdYtevbNpTLalOCcE7NAnJmjaGkPyWBZyrwoAsnbdTg85pChVJ79IBb+jYla
 dvtKN2vw5/uTaLK43/oGMDPIGDX2mddy/xsULpd9YZouqROvRVi9jRg/nyU1hAE2yPm3
 NpNCGfkII+HMsIpwQQULtQElWmOLqZfSJO85ZBAkXSpXiAt+50R97nG8QkrGm3CDggDS
 U37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=accm1HEz9y1QW9zDFwYKrDr3WTDEmQrq+2lsT0mkagA=;
 b=TCCpTIa8KJWNM5cwJ/Cl997o1wbIRs/jWHOYExOgk7K2EqpWH8mWgBm7hnunyKDG65
 XHV0XrusQiwQ+7IxpImctUAPJxUPG3/HIlFgTTEX5D0JXJcvuxNpzkPCaseHVh/FAqPM
 1aOUKaAPTWjFuzoxPW6UVCJtnSgSPCoy0Qw13vrBsuKGS6H3nskwgP5BldLKnNPCJpgl
 1/gvR/D+JAucWOwhgRCriXNa2vcFGLTV0kR7mvinEBtYCrN5rVG7CzhQD4q1xyBdkh5b
 iADi8HFB6E564cLJOGkyeX89NfcTNvbRxymfZC/SMPMZaumjjeSTipqyigpoKkb/90b7
 k7jw==
X-Gm-Message-State: ANhLgQ2qMGTmsp7ykhNAfcLx3heglfJXQozb+Fti3KNaRdcR4gqamhJu
 aedVXqd3uxg4JYPT3tBWTQmvqehGvKI=
X-Google-Smtp-Source: ADFU+vvvu8hu8LG0Kk4t8FdZQkaJpA9h0jffqityLgY+YhOb5f8wG03AmqFosPJ1dQLtAh+f65tC2w==
X-Received: by 2002:a05:6402:1cb6:: with SMTP id
 cz22mr8105577edb.169.1585234409024; 
 Thu, 26 Mar 2020 07:53:29 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id yc5sm305963ejb.66.2020.03.26.07.53.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 07:53:28 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id s1so8172439wrv.5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 07:53:27 -0700 (PDT)
X-Received: by 2002:a5d:4401:: with SMTP id z1mr9601047wrq.259.1585234407239; 
 Thu, 26 Mar 2020 07:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <a8cf8742054d04760f2f5060cfeef5bef1edbd6f.1584981438.git.tamas.lengyel@intel.com>
 <d22bf48d-0f58-3a1e-f5d2-794f0dc846dd@suse.com>
In-Reply-To: <d22bf48d-0f58-3a1e-f5d2-794f0dc846dd@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Mar 2020 08:52:50 -0600
X-Gmail-Original-Message-ID: <CABfawhnMPpJJNCj3ttBurt_FcqyK=v=twJ3RVRMAPBQ15g48LA@mail.gmail.com>
Message-ID: <CABfawhnMPpJJNCj3ttBurt_FcqyK=v=twJ3RVRMAPBQ15g48LA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Xen-devel] [PATCH v12 1/3] xen/mem_sharing: VM forking
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 6:33 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.03.2020 18:04, Tamas K Lengyel wrote:
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -2202,6 +2202,17 @@ int domain_relinquish_resources(struct domain *d)
> >              ret = relinquish_shared_pages(d);
> >              if ( ret )
> >                  return ret;
> > +
> > +            /*
> > +             * If the domain is forked, decrement the parent's pause count
> > +             * and release the domain.
> > +             */
> > +            if ( mem_sharing_is_fork(d) )
> > +            {
> > +                domain_unpause(d->parent);
> > +                put_domain(d->parent);
> > +                d->parent = NULL;
>
> I think you want to clear the field before putting the reference,
> to make sure possible readers of it won't see it non-NULL when
> the domain is already being cleaned up, or even gone.

Sure.

>
> With this, applicable parts of the change
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> I'll try to keep an eye on when you and Roger have settled on the
> remaining aspects, to determine when this (probably v13) can be
> committed.

Thanks!

>
> > --- a/xen/include/asm-x86/mem_sharing.h
> > +++ b/xen/include/asm-x86/mem_sharing.h
> > @@ -77,6 +77,14 @@ static inline int mem_sharing_unshare_page(struct domain *d,
> >      return rc;
> >  }
> >
> > +static inline bool mem_sharing_is_fork(struct domain *d)
>
> const? (then also in the stub further down)

Sure.

Tamas

