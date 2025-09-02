Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F37B3F8D7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 10:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105811.1456642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMav-0004Yn-Bx; Tue, 02 Sep 2025 08:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105811.1456642; Tue, 02 Sep 2025 08:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMav-0004XC-89; Tue, 02 Sep 2025 08:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1105811;
 Tue, 02 Sep 2025 08:42:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utMat-0004X4-HE
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 08:42:23 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be6b6dc5-87d8-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 10:42:22 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55f7ab2a84eso1907197e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 01:42:22 -0700 (PDT)
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
X-Inumbo-ID: be6b6dc5-87d8-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756802542; x=1757407342; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg9WP+fM1lar770abagnLMdH/kaSBMg/qmi/2PLdEN8=;
        b=gWRDIl7GPm1CZaonIuryyVhsrBqhBMiDySMwUwPYktwuifpnOzBXadZ5aUodEiEjJ4
         0Q7XcyWh5Ds4l/MauH0fAWN6P/3WA//YVx4iNRjwath6WWyVWYxcsBHI6+i+cEnjAITv
         /cRxcfql79F9nDujOqJdOIvZzW84tozJpv+8n+8+hKfbJDNyzrHRzZin3fUwJcGOZr5B
         byd+0KxChJ8sf9T34FVhIMZ01IcARbxM5qawo71e1hUhMCbt9Fu5cyQ1DsXfv9vC4aoK
         FPpQATy7Rk4fbQKWq9GZY19YzV11UpMvPbNEXS45ZbGqYo41mnb7XfnjkFTL0HQGeizm
         tmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756802542; x=1757407342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qg9WP+fM1lar770abagnLMdH/kaSBMg/qmi/2PLdEN8=;
        b=YBVao1eZdRw0ezzcFbFt+WY3Ty2tjG4AAuK1tb53QzUnfjOniP7aFiQ8GXLdS/lUYf
         gryW9OXDlP4ec5krwduBqWfrdz/VuavCyf2p7FXJgYWefD4DMqHQcRSVlzpVR/d2Z2Qd
         REqda6jxWoirfnh+0GtIBIACys9SVC9o2yMC7mJqv3M7q91rV3vT63MikL6bwS6UbLc3
         HeNzfiltGjCvUsXlcYxLkQUtqEYg/L8HyoKt29R65zGXJq1jhVVjkccIZ0tu7VtGJ/7E
         pkQShGT3dw3AQa/53ff3wzjp7YP895BLzuoocmolI1o2v9vOXHLub93OSsm5QXTCDWlp
         ztjw==
X-Forwarded-Encrypted: i=1; AJvYcCVPUuCgrEOVr+OtjClZwTiGRSu/MEJYq/A7azDzk15hXLkOgMh1iXjbc5K68VF19wKHlk4fUop8lY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7PD6YJ48A9fMAzWdzlpo0WyON+TOpFRVFNo4yg5dOGXQ59Vd2
	bXqWjBOXJDGs6AIbMuFamMx70XQho+j0jWKly/DTgLS7gbXswAdYQWyZTZdLQ0Qnf83J7x+LoF1
	81div7OCGjkVlw9wedtyFFngk21z+wXI=
X-Gm-Gg: ASbGncs5bN6ESUU+uwxFNpZOY9xNBQfDj4+HOsz+j4ZJjA6lXjY66ydIxyd92HMsV+r
	dXXM1lJ4Wom/cTs44We2G5yNaINKMbanfW2qz0WM6FNrTLRDDPdrpes71NkN4Pm7UDM2Qzw2fck
	ZENI1a1Gs2cORrwja1AEDeZzDb8C60Skqw5/6SL34eSMTqk+cqRUAB7/iXM0Fj6U7mLptlNqGJq
	+z/fn3E6YuNZZ7v
X-Google-Smtp-Source: AGHT+IH/8lI0ropq8hF8ALw0uZ4FMop5nU5b+/jnhramUtA+Zz62gS9bcB3qR+yk7106SGYfrvXEOUInNXUr19eknVk=
X-Received: by 2002:a05:6512:689:b0:55b:574c:6bf9 with SMTP id
 2adb3069b0e04-55f708ec420mr3351379e87.29.1756802541507; Tue, 02 Sep 2025
 01:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756586648.git.mykola_kvach@epam.com> <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
 <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com> <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
 <CAGeoDV_5856nbOA6_H00yxGvBD=+YG3XOAObw6dCMesb00ZiTg@mail.gmail.com> <b1f195a0-6471-43e1-8973-ceabcb6ce9bf@suse.com>
In-Reply-To: <b1f195a0-6471-43e1-8973-ceabcb6ce9bf@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 2 Sep 2025 11:42:10 +0300
X-Gm-Features: Ac12FXx1gcMZiKd4rQYg1f3QaZNUn-jPMNNGUUVL45rumnZsXBOzaRLqbZb64q4
Message-ID: <CAGeoDV9XVHHpUxDr1McXP8gk5mbH-SeSk+TwCCiy1A24FcqScg@mail.gmail.com>
Subject: Re: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 10:13=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 01.09.2025 19:17, Mykola Kvach wrote:
> > On Mon, Sep 1, 2025 at 8:02=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail=
.com> wrote:
> >> On Mon, Sep 1, 2025 at 5:29=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>> On 31.08.2025 00:10, Mykola Kvach wrote:
> >>>> --- a/xen/arch/ppc/stubs.c
> >>>> +++ b/xen/arch/ppc/stubs.c
> >>>> @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domai=
n *d)
> >>>>      BUG_ON("unimplemented");
> >>>>  }
> >>>>
> >>>> +int arch_domain_resume(struct domain *d)
> >>>> +{
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> >>>>  {
> >>>>      BUG_ON("unimplemented");
> >>>> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> >>>> index 1a8c86cd8d..52532ae14d 100644
> >>>> --- a/xen/arch/riscv/stubs.c
> >>>> +++ b/xen/arch/riscv/stubs.c
> >>>> @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domai=
n *d)
> >>>>      BUG_ON("unimplemented");
> >>>>  }
> >>>>
> >>>> +int arch_domain_resume(struct domain *d)
> >>>> +{
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> >>>>  {
> >>>>      BUG_ON("unimplemented");
> >>>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> >>>> index 19fd86ce88..94a06bc697 100644
> >>>> --- a/xen/arch/x86/domain.c
> >>>> +++ b/xen/arch/x86/domain.c
> >>>> @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct dom=
ain *d)
> >>>>          hvm_domain_creation_finished(d);
> >>>>  }
> >>>>
> >>>> +int arch_domain_resume(struct domain *d)
> >>>> +{
> >>>> +    return 0;
> >>>> +}
> >>>> +
> >>>>  #ifdef CONFIG_COMPAT
> >>>>  #define xen_vcpu_guest_context vcpu_guest_context
> >>>>  #define fpu_ctxt fpu_ctxt.x
> >>>
> >>> I definitely don't like this redundancy, and even less so that you in=
troduce out-
> >>> of-line calls.
> >>
> >> Thank you for your feedback.
> >> I followed the existing pattern used in other architecture stubs.
> >
> > ... while I understand your concern about redundancy and out-of-line
> > calls, I would appreciate more specific technical reasoning for why
> > this approach is undesirable.
>
> Out of line functions, even if as simple as the example above, have a
> code size and performance effect; effectively empty inline functions
> can typically be eliminated altogether by the compiler, including the
> checking of their "return" values. While the impact may be low, any
> such instance can later be used as motivation / justification to
> introduce further instances (much like you did in to your earlier
> reply, still in context above). And the sum of them then may not be
> "low impact" anymore.

Thank you for your detailed explanation. As I mentioned earlier,
I understand why it=E2=80=99s preferable to avoid out-of-line implementatio=
ns,
and I appreciate your technical reasoning...

>
> Furthermore we're already moving towards wider use of has_include().
>
> > Code review is most effective when it is based on objective criteria
> > and project guidelines, rather than personal preferences.
>
> And what did you derive from that my comment was purely based on a
> personal preference? Plus even if it were (often I would indicate so),
> that's imo still okay, as in many case maintainer preferences also
> matter (e.g. if only for a more consistent overall code base).
>
> > This helps contributors understand the rationale and make improvements
> > that benefit the whole project.
>
> While content-wise I agree, considering the amount of work I put into
> doing reviews, I still view this sort of "education" as pretty close
> to an offense. Plus did you consider how well it would scale if in
> every review all sorts of extra justification would need giving? I
> don't really like to put things this way, but I would really recommend
> you first start doing perhaps dozens of reviews a week before judging
> on whether any particular review gave you enough background info.

... I want to emphasize that I respect your work and the significant effort
you put into reviews. My intention is not to question your expertise,
but to highlight the importance of consistency for contributors.

Since the current codebase already uses this approach in multiple places,
contributors may get mixed signals when similar patterns are sometimes
accepted and sometimes discouraged. Clearer project-wide guidance, or even
small clarifications in coding style, would make it easier for contributors
to align with maintainers=E2=80=99 expectations.

I will adjust my patch accordingly and use has_include as you suggested.

Thanks again for your guidance and for the effort you put into reviews.

>
> Jan

Best regards,
Mykola

