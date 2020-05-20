Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDCD1DB824
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 17:28:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbQdE-0005b5-8e; Wed, 20 May 2020 15:27:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdaM=7C=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jbQdC-0005b0-ME
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 15:27:42 +0000
X-Inumbo-ID: 720c3044-9aae-11ea-b9cf-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 720c3044-9aae-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 15:27:42 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s19so3453106edt.12
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1IQTSrcX8iPeYBi+ixiL6DxQngvP7b5n2Cxfe27WGoo=;
 b=lifyw1BM2ARewwsMdMMhdLz9ReEGuBTtb0NAcRNPUim6TBx+hUFUOSV5Iwm0u0vL0J
 k5EfwFq8+ED8Ru3zMjwcSM+POferALpD6JRYYXrRRz2DW94KZzsmlDjhBql2OCaKWsUp
 XOS5C+1NcBT24Wce5I9jynpHY9aCq8maP0nG2ayQVHNv7H5zotmUSfaVHNnlRY+/QQIj
 1hDfnoNpgJgFekZQneqwFSPZaPBmGGFPqkBBvYZxF7vlHeia2a3sWZmd2/cZwmHoDSAK
 lBayiJHE4cwTjhEFBkVMT5ux6WsWXlUhMvTQolMuo2doRf6KX+yyIK/G4PvHGRGsMIEP
 yYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1IQTSrcX8iPeYBi+ixiL6DxQngvP7b5n2Cxfe27WGoo=;
 b=R7v/3LroEKrY0urOk9sVdZyZZm/Eq+dcgCRl2kueT8jPD8SbolZVI/dq5se8xou5s7
 CSFAK8shFHcG7tA7+LISMVCFFCJepmRu94wjqEiAjjxvibEbeKf3kg8mOc+3CnHefAjc
 +6UkKGVR4G6E0CFGrK2K7eqxRYU+jvc76Gzx1b+Sn37gU6MXNpOpuI8C4wzjNpG/TSgS
 zKk0C1c/742QZLub6z7HZU9Uo0FeDr2OKGfJRpFFivB64S87V/f8yEJbgOfN52z1YFOs
 VZsGMxvFrH8xa26TYlZd+696MlN0bsKLb8XaEVCKMiKUV9vY3hSqbxDrZXAFkIwOQDbD
 YjQQ==
X-Gm-Message-State: AOAM53173Jy4wWlZQSParfZ1zJ2Y6h/EwEtXDjWGv5fJtNJRQOHWeU1Q
 +GiSyKSj41PgZa0b/vYssT9rlk08OCk=
X-Google-Smtp-Source: ABdhPJxGzGyQ0AbBoyFbmjOkA2WpCIcHHmBTM6D1FGvrLSYRg2v7E38jZGg9fBm+ZU2RtWf5su+Ydw==
X-Received: by 2002:a50:a7e3:: with SMTP id i90mr4059419edc.6.1589988460676;
 Wed, 20 May 2020 08:27:40 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id a15sm2131427ejr.90.2020.05.20.08.27.39
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 08:27:39 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id k13so3609387wrx.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 08:27:39 -0700 (PDT)
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr4991755wro.301.1589988459356; 
 Wed, 20 May 2020 08:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589561218.git.tamas@tklengyel.com>
 <1168bacc61f655f559c236cdf63a6b2beccd4d6b.1589561218.git.tamas@tklengyel.com>
 <28e50e15-410e-096d-51f1-e304c9ef8cdb@suse.com>
In-Reply-To: <28e50e15-410e-096d-51f1-e304c9ef8cdb@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 20 May 2020 09:27:02 -0600
X-Gmail-Original-Message-ID: <CABfawhmsbJJ4-TwCgeVhA7yw+v_YstR3RyyjYJfV17KwYm4=Bg@mail.gmail.com>
Message-ID: <CABfawhmsbJJ4-TwCgeVhA7yw+v_YstR3RyyjYJfV17KwYm4=Bg@mail.gmail.com>
Subject: Re: [PATCH 3/3] xen/vm_event: Add safe to disable vm_event
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 7:45 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.05.2020 18:53, Tamas K Lengyel wrote:
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -563,15 +563,41 @@ void hvm_do_resume(struct vcpu *v)
> >          v->arch.hvm.inject_event.vector = HVM_EVENT_VECTOR_UNSET;
> >      }
> >
> > -    if ( unlikely(v->arch.vm_event) && v->arch.monitor.next_interrupt_enabled )
> > +    if ( unlikely(v->arch.vm_event) )
> >      {
> > -        struct x86_event info;
> > +        struct domain *d = v->domain;
>
> const
>
> > +        if ( v->arch.monitor.next_interrupt_enabled )
> > +        {
> > +            struct x86_event info;
> > +
> > +            if ( hvm_get_pending_event(v, &info) )
> > +            {
> > +                hvm_monitor_interrupt(info.vector, info.type, info.error_code,
> > +                                      info.cr2);
> > +                v->arch.monitor.next_interrupt_enabled = false;
> > +            }
> > +        }
> >
> > -        if ( hvm_get_pending_event(v, &info) )
> > +        if ( d->arch.monitor.safe_to_disable )
> >          {
> > -            hvm_monitor_interrupt(info.vector, info.type, info.error_code,
> > -                                  info.cr2);
> > -            v->arch.monitor.next_interrupt_enabled = false;
> > +            struct vcpu *check_vcpu;
>
> const again, requiring a respective adjustment to patch 2.
>
> > +            bool pending_op = false;
> > +
> > +            for_each_vcpu ( d, check_vcpu )
> > +            {
> > +                if ( vm_event_check_pending_op(check_vcpu) )
> > +                {
> > +                    pending_op = true;
> > +                    break;
> > +                }
> > +            }
> > +
> > +            if ( !pending_op )
> > +            {
> > +                hvm_monitor_safe_to_disable();
>
> This new function returns bool without the caller caring about the
> return value.

Yea, there is actually nothing to be done if the event can't be sent
for whatever reason, I guess I'll just turn it to void.

Tamas

