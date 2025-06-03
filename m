Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8D8ACC23B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 10:33:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004094.1383747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMN4Y-0005dj-8Y; Tue, 03 Jun 2025 08:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004094.1383747; Tue, 03 Jun 2025 08:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMN4Y-0005c3-5W; Tue, 03 Jun 2025 08:32:38 +0000
Received: by outflank-mailman (input) for mailman id 1004094;
 Tue, 03 Jun 2025 08:32:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=av2r=YS=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uMN4W-0005bx-Sn
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 08:32:36 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cdbacc4-4055-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 10:32:35 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5533302b49bso6661691e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 01:32:35 -0700 (PDT)
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
X-Inumbo-ID: 4cdbacc4-4055-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748939555; x=1749544355; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnXcEifqYLp8SzeSVdXvbuJaHdzVO/1FoQdWjdn6rgE=;
        b=h50ZgwDgqF5YIpxBy9znwC6c8+XCCPxP8ZH+ysrcb8YUlHzkwPYHilLxftJvANQ+C+
         sr1y4mCyYpPaj31DcAvH1j+Gar9K4vTH/Sc0IxqGSLgpnDWsyqkhE0vX5+BEa3W5ighb
         r4fTPSXULSUI2oNaIrsZDkxLIO/mkmlAQb620omSILPwDNx5OE3qIsppspoODFTi4Hyw
         LVNCoWWQ5W1mqEg2ghtM4pn15purjMcSkAnBojWRVo5D7ToK4WRAQteYCVyPCP7ma8T7
         SZFfhEw7KSkiQbFY30rhnIhC4/L7rl0Ri4eHerYx6ZRI+/LJP2GMq4ZoRU7xbWi8Y+Vu
         ZqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748939555; x=1749544355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnXcEifqYLp8SzeSVdXvbuJaHdzVO/1FoQdWjdn6rgE=;
        b=k1KVel7Q081Vk56Oh2gUq9GIvK5MIKR2Lf9VcwoNEXGf48jhnUoTYOJIiy+Gj2bEat
         ntotIjxQ93jo27ms6akNJ/y3ZjF6lY2RLEaHtFZab+fsL8ZuHa1GkEygw7iFpSoOB0Dy
         Wy24dp4vxOy43Ewp3jVSvi1TK9xXWxZ5FDwz/wSQtI6fJq4PxPt9gPgQxhZXXtm06TB+
         ril5JwL51AWN0oPa3tMt6ZFxQQ3wPHCTDCwzNJecLiwQg9yK8VNQTEnq57e7/nP16IgN
         b+nl6lbh+rKMHdylj/NM2PrN8PWWaXrtMZbr4b8PMz8b7I/UruwWoEQOw88oNUZW7nTC
         YIwg==
X-Forwarded-Encrypted: i=1; AJvYcCVhu6r2Bp6NF9BOqcnGos/GsotS/87dHMajz+dt1+Moacnzb4xFQkLddXGX3lQcNU1azRia15SfHe4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxnAl3lbZvanqWYDQdIwJUX0zQcpGdPnqE9lZqgRwIGsmJ5kxnj
	AdE55dBR3PINUMXkIFmdWwRer7hyKesx8EDIoJvil6Xvd+vDKnuBxzcmPUnDaxsCBxnqvA3XhWa
	LLFEeVrIGpbrBYttntmuU8bdksjtc1qA=
X-Gm-Gg: ASbGncuq3qKufMN5crNRdFFmrbd/Oo5LRawqRYYbO9u09FjCCbffKtp8qjdAAyMnvBZ
	4RK/D0SHGGdaO7RdTv7c7dJkjTHmtdNOqEg00k8Ra6lJYvNu37oyMmHkU5VYG+RHfTfo0Kw22Fd
	Dbdg5cKi+r4bm4fS1xzYNVmNBWI/8fku98DdqQY4XI8Q==
X-Google-Smtp-Source: AGHT+IGq4OuBDkzkBUGG3cnE/DRyBz+v3HqNLaONGUENREn5ETw98+pHlc2eDlUL6hg/uwc6TGcAJg38duw8IIN9gxU=
X-Received: by 2002:a05:6512:b1a:b0:553:2812:cefb with SMTP id
 2adb3069b0e04-5533b930b19mr5033143e87.37.1748939554663; Tue, 03 Jun 2025
 01:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748848482.git.mykola_kvach@epam.com> <7bd75ecfff5b0a75ea5abd7cc4934582d7e1250c.1748848482.git.mykola_kvach@epam.com>
 <90048f71-8313-4110-924c-f956a2bec5a0@suse.com>
In-Reply-To: <90048f71-8313-4110-924c-f956a2bec5a0@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 3 Jun 2025 11:32:23 +0300
X-Gm-Features: AX0GCFuVFdVu1xHzYOsnMpohxKgntT5H8FlPFbMOdd-ACYwLPju4vgtAokNlUDg
Message-ID: <CAGeoDV-zpjbeuyJCcztkqjc5kJoOAhmw3wFGXdEZmCgC3ASQoQ@mail.gmail.com>
Subject: Re: [PATCH v4][PART 2 07/10] xen/arm: Add support for system suspend
 triggered by hardware domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, @Jan Beulich

On Mon, Jun 2, 2025 at 12:26=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 02.06.2025 11:04, Mykola Kvach wrote:
> > @@ -857,8 +860,24 @@ void arch_domain_destroy(struct domain *d)
> >      domain_io_free(d);
> >  }
> >
> > -void arch_domain_shutdown(struct domain *d)
> > +int arch_domain_shutdown(struct domain *d)
> >  {
> > +    switch ( d->shutdown_code )
> > +    {
> > +    case SHUTDOWN_suspend:
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +        if ( !is_hardware_domain(d) )
> > +            break;
> > +
> > +        return host_system_suspend();
> > +#else
> > +        break;
> > +#endif
> > +    default:
> > +        break;
> > +    }
> > +
> > +    return 0;
> >  }
>
> What's wrong with
>
> int arch_domain_shutdown(struct domain *d)
> {
>     switch ( d->shutdown_code )
>     {
> #ifdef CONFIG_SYSTEM_SUSPEND
>     case SHUTDOWN_suspend:
>         if ( !is_hardware_domain(d) )
>             break;
>
>         return host_system_suspend();
> #endif
>
>     default:
>         break;
>     }
>
>     return 0;
> }
>
> ?

You're right =E2=80=94 your version is cleaner and avoids unnecessary
preprocessor spaghetti.

My original intention was to keep the SHUTDOWN_suspend case visible
even when CONFIG_SYSTEM_SUSPEND is disabled, so future changes
wouldn't require reintroducing the case label. But thinking about it
again, if future support is needed, the code can be easily adjusted at
that time.

I'll switch to your suggested version =E2=80=94 it's simpler and more reada=
ble.

>
> > @@ -1311,13 +1316,13 @@ int domain_shutdown(struct domain *d, u8 reason=
)
> >          v->paused_for_shutdown =3D 1;
> >      }
> >
> > -    arch_domain_shutdown(d);
> > +    ret =3D arch_domain_shutdown(d);
>
> If non-zero comes back here, is ...
>
> >      __domain_finalise_shutdown(d);
>
> ... this still appropriate to call?

Thank you for catching that =E2=80=94 you=E2=80=99re absolutely right, that=
 was my oversight.

If arch_domain_shutdown returns a non-zero value, we need to undo
any previous actions performed before the call to properly restore the
domain=E2=80=99s state. Calling __domain_finalise_shutdown unconditionally
in that case could lead to an inconsistent state.

I will update the code accordingly to ensure proper cleanup and state
restoration.

>
> >      spin_unlock(&d->shutdown_lock);
> >
> > -    return 0;
> > +    return ret;
> >  }
>
> Most callers don't care about the return value of this function. That lik=
ely
> needs to change, even if _for now_ you only alter the SHUTDOWN_suspend ca=
se
> (and hence some of the callers aren't immediately impacted)?

Thanks for pointing this out. You=E2=80=99re right that most callers curren=
tly
ignore the return value of domain_shutdown(). This will need to be
updated to properly handle non-zero returns, at least for the
SHUTDOWN_suspend case where it matters.

Even if some callers aren=E2=80=99t immediately impacted, I agree it=E2=80=
=99s better
to fix this proactively to avoid silent failures or inconsistent states.

I=E2=80=99ll start reviewing the callers and update them accordingly.

>
> Jan

Thank you for reviewing this patch series.

Best regards,
Mykola

