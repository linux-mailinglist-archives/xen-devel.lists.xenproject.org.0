Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CDF8AD20F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 18:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710126.1109184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rywgl-0003BA-PK; Mon, 22 Apr 2024 16:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710126.1109184; Mon, 22 Apr 2024 16:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rywgl-00038Z-Ky; Mon, 22 Apr 2024 16:38:43 +0000
Received: by outflank-mailman (input) for mailman id 710126;
 Mon, 22 Apr 2024 16:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A9Lx=L3=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rywgk-00038T-16
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 16:38:42 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c45bf72d-00c6-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 18:38:38 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1e651a9f3ffso25760405ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 09:38:38 -0700 (PDT)
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
X-Inumbo-ID: c45bf72d-00c6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713803916; x=1714408716; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJufQzB+C/HNVK1+XZWa5/QFTo8CT2cALbFKx6y+YS4=;
        b=E+b3+7hXAdFOSXiC95A5xPXHiyylhTjfrRMHT6amY+7eAlLT18F19PzLOmcsQczHK9
         jdV7RUA9nV22eWtvXtPBrH/0NPG4IguiE3F7fLBqz97B2Sr7e+EeoVzQ18jASOqvtkWo
         tQpRbMAGYNmzTJMfR4VuzwPY0KP73+avU2+7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713803916; x=1714408716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJufQzB+C/HNVK1+XZWa5/QFTo8CT2cALbFKx6y+YS4=;
        b=Wr0WRBCZQJN49UV/Uyn9Lm6AbLt6u51QzEV0z3UE62cZPzmoiV9uAXV6ZUV57tPdiR
         VCa8u/r8dgar9Tc1zrg9rPMIE+XmDtt3qMOOZ6MITZN6do9fsrsDX4fMw/LJlWe2OUz5
         xrCQVV98nF+3wWDqHd7VdkNoYhy+8r+6/FRLw7CAJxHtcVvMXPUteJRiJv/lm+g7ttrB
         3VOsYrQ/tp1H4wlaFz9VyEiOqt13vjBbLk2SZi5fMHFHkQqViX8eLYxV+xMJWvEB2kkr
         +xm9f7ZpEq5KUqMcu2ngliyFWbFdTH2t5nRTk9AxapyF36+r6h0B8+KwT07WxGvrLJYW
         L0VA==
X-Forwarded-Encrypted: i=1; AJvYcCVTmMNFo9tDWainUT39eW1nBjE3wjgZy+YVkx2mvMMmBIMYoXPwT9XrG/7SdLqlfEVn3PCKMF7xPlgTzn0tkWsPYfnHWUN/0E/JdkDn7NQ=
X-Gm-Message-State: AOJu0YzIRSJ3mvgh3LnMRandkpCM6mA6uOFfBBu5mVDfneVgw++WkB3v
	kdAbtJmipXTk5o3jqPScF0cEc5OFpilDM3rtm6GKUi7Phea+HWtQwpo2TmctXycVfn2IXH6ZXJk
	dGjfVBaWZ9YJUMb8qDNU0a2obuFRNUYuoLJJfq6f4ydijfRh3zg==
X-Google-Smtp-Source: AGHT+IE7Fk7vHU+QQVQI1FTOqRkAn5Geh1UEEjjGrP9SfynMSLwgMXjm5SIoBCEEhXI7HS5K4/whg14L0R34ptic3aU=
X-Received: by 2002:a17:903:428f:b0:1e4:8eb3:26f5 with SMTP id
 ju15-20020a170903428f00b001e48eb326f5mr9425892plb.38.1713803916259; Mon, 22
 Apr 2024 09:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240408162620.1633551-1-ross.lagerwall@citrix.com> <9b94935f-b84c-4ede-ac17-4e1c6d032b74@suse.com>
In-Reply-To: <9b94935f-b84c-4ede-ac17-4e1c6d032b74@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Mon, 22 Apr 2024 17:38:28 +0100
Message-ID: <CAG7k0EqNJsdoZkTPkSZAm1rwCBZMrd5qHSYkRi6y48tu==B_GA@mail.gmail.com>
Subject: Re: [PATCH] x86/rtc: Avoid UIP flag being set for longer than expected
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 2:24=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 08.04.2024 18:26, Ross Lagerwall wrote:
> > In a test, OVMF reported an error initializing the RTC without
> > indicating the precise nature of the error. The only plausible
> > explanation I can find is as follows:
> >
> > As part of the initialization, OVMF reads register C and then reads
> > register A repatedly until the UIP flag is not set. If this takes longe=
r
> > than 100 ms, OVMF fails and reports an error. This may happen with the
> > following sequence of events:
> >
> > At guest time=3D0s, rtc_init() calls check_update_timer() which schedul=
es
> > update_timer for t=3D(1 - 244us).
> >
> > At t=3D1s, the update_timer function happens to have been called >=3D 2=
44us
> > late.
>
> Any theory on why this timer runs so late? (It needs dealing with anyway,
> but I'm still curious.)

I don't know specifically why our testcase spotted it. I reproduced the
issue by repeatedly running "xl debug-key h" so that a lot of time was
spent writing to the serial console. That caused timer interrupts to
run late but I suppose there could be a lot of reasons why timer
interrupts occasionally run late (e.g. a live patch critical region).

>
> > In the timer callback, it sets the UIP flag and schedules
> > update_timer2 for t=3D1s.
> >
> > Before update_timer2 runs, the guest reads register C which calls
> > check_update_timer(). check_update_timer() stops the scheduled
> > update_timer2 and since the guest time is now outside of the update
> > cycle, it schedules update_timer for t=3D(2 - 244us).
> >
> > The UIP flag will therefore be set for a whole second from t=3D1 to t=
=3D2
> > while the guest repeatedly reads register A waiting for the UIP flag to
> > clear. Fix it by clearing the UIP flag when scheduling update_timer.
>
> I can accept this as a workaround (perhaps with a tweak, see below), but
> I wonder whether we couldn't do this in a less ad hoc way. If stop_timer(=
)
> returned whether the timer was actually stopped, couldn't the clearing of
> UIP be made conditional upon that?

I think that would work though I'd need to spend some time convincing
myself that it doesn't introduce any other race conditions. I'm not
convinced it is really any better than just unconditionally clearing
the flag though.

>
> > --- a/xen/arch/x86/hvm/rtc.c
> > +++ b/xen/arch/x86/hvm/rtc.c
> > @@ -202,6 +202,7 @@ static void check_update_timer(RTCState *s)
> >          }
> >          else
> >          {
> > +            s->hw.cmos_data[RTC_REG_A] &=3D ~RTC_UIP;
> >              next_update_time =3D (USEC_PER_SEC - guest_usec - 244) * N=
S_PER_USEC;
> >              expire_time =3D NOW() + next_update_time;
> >              s->next_update_time =3D expire_time;
>
> Is rtc_update_timer2() clearing UIP then still necessary, ahead of callin=
g
> here? Hmm, yes, it is; the question is rather why the function calls
> check_update_timer() when all that'll do (due to UF now being set) is sto=
p
> the other timer (in case it's also running) and clear ->use_timer.
>

Are you suggesting something like this?

diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 4bb1c7505534..eb4901bf129a 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -240,7 +240,8 @@ static void cf_check rtc_update_timer2(void *opaque)
         s->hw.cmos_data[RTC_REG_C] |=3D RTC_UF;
         s->hw.cmos_data[RTC_REG_A] &=3D ~RTC_UIP;
         rtc_update_irq(s);
-        check_update_timer(s);
+        stop_timer(&s->update_timer);
+        s->use_timer =3D 0;
     }
     spin_unlock(&s->lock);
 }

That may indeed be an improvement but I'm not sure it is really related
to this patch?

Thanks,
Ross

