Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34172B3B9A7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 13:05:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101147.1454331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwuV-00041A-Td; Fri, 29 Aug 2025 11:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101147.1454331; Fri, 29 Aug 2025 11:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urwuV-0003yT-Qo; Fri, 29 Aug 2025 11:04:47 +0000
Received: by outflank-mailman (input) for mailman id 1101147;
 Fri, 29 Aug 2025 11:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KOV5=3J=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1urwuU-0003yM-AM
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 11:04:46 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f80a6118-84c7-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 13:04:44 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55f6bb0a364so267032e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 04:04:44 -0700 (PDT)
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
X-Inumbo-ID: f80a6118-84c7-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756465484; x=1757070284; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmrKHFuXUHrXn6eMcd/8iIVPBWBFay1HmzkMDB6h11g=;
        b=W9Pbgb3R2ScOgjWBOi1Q/zuXo0pj34uyO+ub8SO6pON0JAP9mXOkyOQdRvhM/WfL0q
         5pl1byv35//INOOVk5wiAYYldij6maQdmsnUNOMFrag5jb0dQ63CWYB8N/TEFluVZaA/
         ooPgUvTe7QNqmSfOPAZPlGZ/evrHJImerPgHxIme9aQYtDYuqFgtVVcyk2qYFERWdI3c
         GEf8LuKgVj7HN0pQlkTXRh2+mS4ZsKx6dxJUwUr2sVvhv+TQMenVQNKJHBPLW0IwsAG6
         yRV3LTeVb+cCNDbJVQkm5DeZXKgPzj2kEYMkUwDWJ266CfUPXyOM9p0jkoN1RfSHlqkq
         xtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756465484; x=1757070284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmrKHFuXUHrXn6eMcd/8iIVPBWBFay1HmzkMDB6h11g=;
        b=Ch74E18le6OrYgf7fiS7pTKIlFQFn00HohwZa0GK26NBVP0L9TCvqQyT4MJVgROe2J
         iUfT1wumX2JkCVwnZwqQLWCq213yVybgEhBtycOw0LQ9d1TXZYuMhQQptSgL3Ekec27U
         6wgHMC7npojuTmasGxzlhmr/PXreoHXenDJ6Gw+AXZFp44XvMtIDUaRYXNJhfxHGSz6C
         FO1zJfmwUwb6etcgh5vhW9oxZqRUvU9UlgSPcGxrktB2zM1v9IDMzAnjUl5vze9FlKK3
         djT0dLL8hNqyWe5DMlSwg+U542A6TQoiNrbzvdsShAdT1ILCDB0pL5O20pw9/AmPTB3b
         QSMg==
X-Forwarded-Encrypted: i=1; AJvYcCX3pnaPm9lHjOAdHKOam2LPraBYtUXULefW/33KSUnwgv4+j3wYpwvZiQmnwG/kp5iXL99Ac2B9r9c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvYSA5BBL0maXswXenmxBQgxSlqAALR6fQz2YHLU2h1ER07rBd
	/aIHW6G9NyqRTcHyFNESflNT3PtBCr9A/+ni6mYUlLRC+EFhtcoJrE2XDY4LPeFJdtvC+YnmMYT
	3EGvIYfaS9atyqpcScG9JSn6r7YybnaE=
X-Gm-Gg: ASbGncuqstzGXKbXXCD3jd/hOnTeGaAQ3Wwv6M2mbGCOzzoTFq4RXkvlsF+GEnBFxNO
	1CFRDJ+zexSa1v8U4rKStRjs9X4GRkxAPDSUgmdg/Qt8ZSaZ6zc0NBJSo0ivHn+XQHiIyefOdEM
	RQuU1Yszw5Ofp3P12wvy+f/RVrWAaBNm6Aj8hd1Lqh3ilmEOGCq7ui/szo6DAVXMNh22otU6DOw
	rEOYQVGbDjGIKkj
X-Google-Smtp-Source: AGHT+IHrEGSheasBxSt4opdNQGrb7AmGzHLDA5dyw+a2+Qi16tW5Azo3tsedTJ7OCo2d0avT+p23VHjhUfZ+UuM4GGU=
X-Received: by 2002:a05:6512:400b:b0:55f:4f39:3584 with SMTP id
 2adb3069b0e04-55f4f39377bmr3737132e87.50.1756465483393; Fri, 29 Aug 2025
 04:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756392094.git.mykola_kvach@epam.com> <bb53d9911b00879c7b25f5258d0e3e48005671f9.1756392094.git.mykola_kvach@epam.com>
 <87ecsvz9sx.fsf@epam.com> <a64cff9f-df5f-467b-a944-74e803c64ab9@suse.com>
In-Reply-To: <a64cff9f-df5f-467b-a944-74e803c64ab9@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 29 Aug 2025 14:04:32 +0300
X-Gm-Features: Ac12FXwtlYWHFA-h73bt4nn9uJBhN8C2_ZlCFQPjSAIzvqWkzIg9mPXxEEQPlqc
Message-ID: <CAGeoDV8Jz6gEh-uHuWb0sM_XNTOayAxqRW=Z4GajpP-eMRA4kw@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola Kvach <Mykola_Kvach@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Fri, Aug 29, 2025 at 10:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 28.08.2025 18:32, Volodymyr Babchuk wrote:
> > Mykola Kvach <xakep.amatop@gmail.com> writes:
> >> @@ -880,6 +883,25 @@ void arch_domain_creation_finished(struct domain =
*d)
> >>      p2m_domain_creation_finished(d);
> >>  }
> >>
> >> +int arch_domain_resume(struct domain *d)
> >> +{
> >> +    int rc;
> >> +    typeof(d->arch.resume_ctx) *ctx =3D &d->arch.resume_ctx;
> >> +
> >> +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspe=
nd )
> >> +    {
> >> +        dprintk(XENLOG_WARNING,
> >> +                "%pd: Invalid domain state for resume: is_shutting_do=
wn=3D%d, shutdown_code=3D%d\n",
> >> +                d, d->is_shutting_down, d->shutdown_code);
> >> +        return -EINVAL;
> >> +    }
> >
> > This check probably can go into common domain_resume() function, as
> > there is nothing arch-specific in here. Probably this can be done durin=
g
> > commit, to save us from v12? If commiters are okay with this.
>
> Seeing this, I'm learning that ->is_shutting_down can actually go from
> true to false. Which I think is a problem (not of this series, but a pre-
> existing one, see [1]). Code elsewhere assumes this to not be possible,
> see e.g. __domain_crash(), but I'm also unconvinced that e.g. the shutdow=
n
> deferral logic is prepared to deal with such a case.

Should I add an extra patch to this series just for fixing this issue,
or can I do it within the scope of this one?

>
> Jan
>
> [1] e105919b0120 ("Add resumedomain domctl to resume a domain after check=
point")

Best regards,
Mykola

