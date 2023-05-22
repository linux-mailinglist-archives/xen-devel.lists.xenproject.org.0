Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779D270BEF0
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 15:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537932.837579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q158X-0001x0-Ox; Mon, 22 May 2023 12:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537932.837579; Mon, 22 May 2023 12:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q158X-0001uC-MB; Mon, 22 May 2023 12:59:41 +0000
Received: by outflank-mailman (input) for mailman id 537932;
 Mon, 22 May 2023 12:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yzf4=BL=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q158V-0001u6-Ob
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:59:39 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81de050c-f8a0-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 14:59:37 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96fd3a658eeso195001466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 05:59:37 -0700 (PDT)
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
X-Inumbo-ID: 81de050c-f8a0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684760377; x=1687352377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StB4zFWv//QCbf5mKx8NNFHrwVR6OSsbD/fj8FJpAmM=;
        b=SaBBhVaBLE1BxgP+p4dwLazoSPVb6rBWjQgLHHAM9Y052NL/d8NuxflMeBLb09Yeyj
         JU1oQefr/xUF30iu7OSvgU2sjJHuDyK3vd8NI0K8nnKjGJt0ED8K6BNXrsYELNmfw3se
         t5q8Rrmf2BiUQXIhJ2Q5g6nWBVGUGj+NEuVaHxD+/CnTNHx+R9m9I9Ml9Mm4izZ3E48v
         ZrVBeA9xw5YDEIvxuDuFfdxxl4iw9uf8Mynf52SrKTY/YVbmzzwY3Wr8fAM8t/m+hYAF
         Bbke+cdijR+CMI9QODwp8SWnFG59OstoiUbtIqIi9Z4OpO+c8QEnHlRo8GtquaIKhkwf
         WPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684760377; x=1687352377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StB4zFWv//QCbf5mKx8NNFHrwVR6OSsbD/fj8FJpAmM=;
        b=AihXRhp3sLwIHKeIdSAHtv9c5Sqnm6l0IYy139tb5wRIn509XqcNt89rADlO7RScCv
         /UiELw1Zj2ai06wpLsFRAEj6LF6+S+SBpvgu96u9dy1GxHTVcm8LlHnNGmhcwd3lWtI1
         xK9NvVKYoyUr5AtGyvZO1D31X3q90UhJP8gUTQEZUbTDUXV19iERf9iDLxs9GLCZ5+hj
         RDfiIUOQNwF5TyiM6XXrQ2aTbTW6ItKEXR440qYRRuNA++s2exQ0ipjeKc3HdCOlox+9
         ZshTrgfwRU9dcGLD9D2O45zPRD5fqPz6jvomBXMoaKlMr8504A43KeaVcnL6YcOT7UF+
         AWEA==
X-Gm-Message-State: AC+VfDwLB+Mll5X/aIMrn1401sGq0uJodRTDOKyVYcijuwI+s2pLWe3b
	Zg6Cxk0uCEvK+s2znpF2pqNZva7xDNXLMokDDd1vd/T1sv4=
X-Google-Smtp-Source: ACHHUZ687i9fD7SribHQqxiwB3OMXDxGUOmQLyj0Qy/aIu1+pmwbvZChZ03VbNOCDRnmol6brxlz7vFVXumza+bMn0w=
X-Received: by 2002:a17:907:3ea9:b0:969:f433:9b54 with SMTP id
 hs41-20020a1709073ea900b00969f4339b54mr10582821ejc.39.1684760376817; Mon, 22
 May 2023 05:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-14-jandryuk@gmail.com>
 <46c46e0b-0fba-2f3f-6289-f68737a3d8d9@suse.com>
In-Reply-To: <46c46e0b-0fba-2f3f-6289-f68737a3d8d9@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 22 May 2023 08:59:24 -0400
Message-ID: <CAKf6xptjgvSsNobYirrF_W1cWUdVVfvX55DFNa=bWy3A24kN5A@mail.gmail.com>
Subject: Re: [PATCH v3 13/14 RESEND] xenpm: Add set-cpufreq-hwp subcommand
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 7:56=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.05.2023 21:30, Jason Andryuk wrote:
> > @@ -67,6 +68,27 @@ void show_help(void)
> >              " set-max-cstate        <num>|'unlimited' [<num2>|'unlimit=
ed']\n"
> >              "                                     set the C-State limi=
tation (<num> >=3D 0) and\n"
> >              "                                     optionally the C-sub=
-state limitation (<num2> >=3D 0)\n"
> > +            " set-cpufreq-hwp       [cpuid] [balance|performance|power=
save] <param:val>*\n"
> > +            "                                     set Hardware P-State=
 (HWP) parameters\n"
> > +            "                                     optionally a preset =
of one of\n"
> > +            "                                       balance|performanc=
e|powersave\n"
> > +            "                                     an optional list of =
param:val arguments\n"
> > +            "                                       minimum:N  lowest =
... highest\n"
> > +            "                                       maximum:N  lowest =
... highest\n"
> > +            "                                       desired:N  lowest =
... highest\n"
>
> Personally I consider these three uses of "lowest ... highest" confusing:
> It's not clear at all whether they're part of the option or merely mean
> to express the allowable range for N (which I think they do). Perhaps ...
>
> > +            "                                           Set explicit p=
erformance target.\n"
> > +            "                                           non-zero disab=
les auto-HWP mode.\n"
> > +            "                                       energy-perf:0-255 =
(or 0-15)\n"
>
> ..., also taking this into account:
>
>             "                                       energy-perf:N (0-255 =
or 0-15)\n"
>
> and then use parentheses as well for the earlier value range explanations
> (and again below)?

lowest and highest were supposed to reference the values from `xenpm
get-cpufreq-para`.  You removed some later lines that state
"get-cpufreq-para returns lowest/highest".  However, they aren't
enforced limits.  You can program from the range 0-255 and the
hardware is supposed to clip internally, so your idea of
"energy-perf:N (0-255)" seems good to me.

> Also up from here you suddenly start having full stops on the lines. I
> guess you also want to be consistent in your use of capital letters at
> the start of lines (I didn't go check how consistent pre-existing code
> is in this regard).

Looks like the existing code is consistently non-capital letters, but
the full stops are inconsistent.  I'll go with non-capital and full
stop for this addition.

> > @@ -1299,6 +1321,213 @@ void disable_turbo_mode(int argc, char *argv[])
> >                  errno, strerror(errno));
> >  }
> >
> > +/*
> > + * Parse activity_window:NNN{us,ms,s} and validate range.
> > + *
> > + * Activity window is a 7bit mantissa (0-127) with a 3bit exponent (0-=
7) base
> > + * 10 in microseconds.  So the range is 1 microsecond to 1270 seconds.=
  A value
> > + * of 0 lets the hardware autonomously select the window.
> > + *
> > + * Return 0 on success
> > + *       -1 on error
> > + */
> > +static int parse_activity_window(xc_set_hwp_para_t *set_hwp, unsigned =
long u,
> > +                                 const char *suffix)
> > +{
> > +    unsigned int exponent =3D 0;
> > +    unsigned int multiplier =3D 1;
> > +
> > +    if ( suffix && suffix[0] )
> > +    {
> > +        if ( strcasecmp(suffix, "s") =3D=3D 0 )
> > +        {
> > +            multiplier =3D 1000 * 1000;
> > +            exponent =3D 6;
> > +        }
> > +        else if ( strcasecmp(suffix, "ms") =3D=3D 0 )
> > +        {
> > +            multiplier =3D 1000;
> > +            exponent =3D 3;
> > +        }
> > +        else if ( strcasecmp(suffix, "us") =3D=3D 0 )
> > +        {
> > +            multiplier =3D 1;
> > +            exponent =3D 0;
> > +        }
>
> Considering the initializers, this "else if" body isn't really needed,
> and ...
>
> > +        else
>
> ... instead this could become "else if ( strcmp() !=3D 0 )".
>
> Note also that I use strcmp() there - none of s, ms, or us are commonly
> expressed by capital letters.

That sounds fine.

> (I wonder though whether =CE=BCs shouldn't also
> be recognized.)

While that makes sense, I do not plan to change it.  I don't know the
proper way to deal with unicode from C.  (I suppose a memcmp with the
UTF-8 encoding would be possible, but I don't know if there are corner
cases I'm overlooking.)

> > +        {
> > +            fprintf(stderr, "invalid activity window units: \"%s\"\n",=
 suffix);
> > +
> > +            return -1;
> > +        }
> > +    }
> > +
> > +    /* u * multipler > 1270 * 1000 * 1000 transformed to avoid overflo=
w. */
> > +    if ( u > 1270 * 1000 * 1000 / multiplier )
> > +    {
> > +        fprintf(stderr, "activity window is too large\n");
> > +
> > +        return -1;
> > +    }
> > +
> > +    /* looking for 7 bits of mantissa and 3 bits of exponent */
> > +    while ( u > 127 )
> > +    {
> > +        u +=3D 5; /* Round up to mitigate truncation rounding down
> > +                   e.g. 128 -> 120 vs 128 -> 130. */
> > +        u /=3D 10;
> > +        exponent +=3D 1;
> > +    }
> > +
> > +    set_hwp->activity_window =3D (exponent & HWP_ACT_WINDOW_EXPONENT_M=
ASK) <<
> > +                                   HWP_ACT_WINDOW_EXPONENT_SHIFT |
>
> The shift wants parenthesizing against the | and the shift amount wants
> indenting slightly less. (Really this would want to be MASK_INSR().)

I'll use MASK_INSR.

> > +                               (u & HWP_ACT_WINDOW_MANTISSA_MASK);
> > +    set_hwp->set_params |=3D XEN_SYSCTL_HWP_SET_ACT_WINDOW;
> > +
> > +    return 0;
> > +}
> > +
> > +static int parse_hwp_opts(xc_set_hwp_para_t *set_hwp, int *cpuid,
> > +                          int argc, char *argv[])
> > +{
> > +    int i =3D 0;
> > +
> > +    if ( argc < 1 ) {
> > +        fprintf(stderr, "Missing arguments\n");
> > +        return -1;
> > +    }
> > +
> > +    if ( parse_cpuid_non_fatal(argv[i], cpuid) =3D=3D 0 )
> > +    {
> > +        i++;
> > +    }
>
> I don't think you need the earlier patch and the separate helper:
> Whether a CPU number is present can be told by checking
> isdigit(argv[i][0]).

> Hmm, yes, there is "all", but your help text doesn't mention it and
> since you're handling a variable number of arguments anyway, there's
> not need for anyone to say "all" - they can simply omit the optional
> argument.

Most xenpm commands take "all" or a numeric cpuid, so I intended to be
consistent with them.  That was the whole point of
parse_cpuid_non_fatal() - to reuse the existing parsing code for
consistency.

I didn't read the other help text carefully enough to see that the
numeric cpuid and "all" handling was repeated.

For consistency, I would retain parse_cpuid_non_fatal() and expand the
help text.  If you don't want that, I'll switch to isdigit(argv[i][0])
and have the omission of a digit indicate all CPUs as you suggest.
Just let me know what you want.

> Also (nit) note how you're mixing brace placement throughout this
> function.

Will fix.

Regards,
Jason

