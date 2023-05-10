Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9116FE3AD
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 20:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532995.829351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwoI3-0005NA-8F; Wed, 10 May 2023 18:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532995.829351; Wed, 10 May 2023 18:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwoI3-0005LL-5P; Wed, 10 May 2023 18:11:51 +0000
Received: by outflank-mailman (input) for mailman id 532995;
 Wed, 10 May 2023 18:11:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e4GJ=A7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pwoI1-0005LD-EN
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 18:11:49 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20b971cd-ef5e-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 20:11:47 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so11371986a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 11:11:47 -0700 (PDT)
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
X-Inumbo-ID: 20b971cd-ef5e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683742307; x=1686334307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhillotERfDC11pI/SjbWszv+x7ZdZYj7Ka2Ky8L5ZI=;
        b=gCqsC0iOF1MAHnPS+2arCcorZ6UW1WZ7SW4zXFghfDXU/xtopNcxXMkZW4+1rN7TsP
         TLksRHEk/xV+P61+rjZZvBQOPn4EkFYqVxCK0DCI14Hq0jM7w1E5s7jIqw4YjAMffC+5
         ClOju4FTNUytPo+7YuZkAbGdNZKBAL7H3K7CT2H6WqUw40ihaOct32INNPcouw04DNTU
         rjFWzrmqGcnlm+bbyX8V6mvdvxtaUBDhP5nxWLfAc+cCRpm3PqXwkcv+9500jG9qnzt2
         l/fXlNyeOUib5gMj7FBoEp95or604hnQ5joItKy8vevxfjn9f3oU3uBiqCTg4CJjnFwp
         VTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683742307; x=1686334307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhillotERfDC11pI/SjbWszv+x7ZdZYj7Ka2Ky8L5ZI=;
        b=OzpFPlPd3O9Ss9JShseYZg+bVswVqJlOR80FNDo7UkBODDwLs7gHYKW/9oBK3Khngg
         Q91prNCu5IiXyIQtd1y8E6cp6JS358HYzoV5mYMywUVRJC6RQwlytms7rzUFcn7IzCeP
         X2/FH6eAJXJynq0XB7FLhpeJkMVBJG9v7qXkbkJAF4ZhCUFIgve8Mz7oxo+14dyH20he
         RhRvvVpuATTjBCZ9RWjJycOUrZD55FdH8bH2aE40yJHTqltQRgDnx83p/Fz4X9sQLVL9
         ISIrojvOzozs/QPJ7W6F/HcJjLaHyfd3PN5owL60IV5LSamTkHpUi2lzm5HLvfim+U8l
         ZGWA==
X-Gm-Message-State: AC+VfDxWpc/6bCa8Z52vCt18m4LZIywi+NDpZe9aRqOk7SDNT13o45Ct
	oexgl73ISZY+I8Bd+eqTqxTJj+BQ0C55g1x9qy+h5bwXkmE=
X-Google-Smtp-Source: ACHHUZ5sff9gdoF+tagHOWQt7z7g7hkn4GCWMfGXusRwqibUsKH2ln6NBtzX9BXarP483iqXd/+O8nh4hpw5PsGVVlo=
X-Received: by 2002:a17:906:da8e:b0:94f:7c4e:24ea with SMTP id
 xh14-20020a170906da8e00b0094f7c4e24eamr14918920ejb.38.1683742306719; Wed, 10
 May 2023 11:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-10-jandryuk@gmail.com>
 <256fc66c-066f-3f0c-b34b-a237e9268f22@suse.com>
In-Reply-To: <256fc66c-066f-3f0c-b34b-a237e9268f22@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 May 2023 14:11:34 -0400
Message-ID: <CAKf6xpu=KiSkjGpyRYBCpYh67XhdtmjvwLjthkpTbE+HoNQm7g@mail.gmail.com>
Subject: Re: [PATCH v3 09/14 RESEND] xenpm: Print HWP parameters
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 6:43=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.05.2023 21:30, Jason Andryuk wrote:
> > Print HWP-specific parameters.  Some are always present, but others
> > depend on hardware support.
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > v2:
> > Style fixes
> > Declare i outside loop
> > Replace repearted hardware/configured limits with spaces
> > Fixup for hw_ removal
> > Use XEN_HWP_GOVERNOR
> > Use HWP_ACT_WINDOW_EXPONENT_*
> > Remove energy_perf hw autonomous - 0 doesn't mean autonomous
> > ---
> >  tools/misc/xenpm.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >
> > diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
> > index ce8d7644d0..b2defde0d4 100644
> > --- a/tools/misc/xenpm.c
> > +++ b/tools/misc/xenpm.c
> > @@ -708,6 +708,44 @@ void start_gather_func(int argc, char *argv[])
> >      pause();
> >  }
> >
> > +static void calculate_hwp_activity_window(const xc_hwp_para_t *hwp,
> > +                                          unsigned int *activity_windo=
w,
> > +                                          const char **units)
>
> The function's return value would be nice to use for one of the two
> values that are being returned.

Ok, I'll return activity_window.

> > +{
> > +    unsigned int mantissa =3D hwp->activity_window & HWP_ACT_WINDOW_MA=
NTISSA_MASK;
> > +    unsigned int exponent =3D
> > +        (hwp->activity_window >> HWP_ACT_WINDOW_EXPONENT_SHIFT) &
> > +            HWP_ACT_WINDOW_EXPONENT_MASK;
>
> I wish we had MASK_EXTR() in common-macros.h. While really a comment on
> patch 7 - HWP_ACT_WINDOW_EXPONENT_SHIFT is redundant information and
> should imo be omitted from the public interface, in favor of just a
> (suitably shifted) mask value. Also note how those constants all lack
> proper XEN_ prefixes.

I'll add a patch adding MASK_EXTR() & MASK_INSR() to common-macros.h
and use those - is there any reason not to do that?

I'll also add XEN_ prefixes.

> > +    unsigned int multiplier =3D 1;
> > +    unsigned int i;
> > +
> > +    if ( hwp->activity_window =3D=3D 0 )
> > +    {
> > +        *units =3D "hardware selected";
> > +        *activity_window =3D 0;
> > +
> > +        return;
> > +    }
>
> While in line with documentation, any mantissa of 0 results in a 0us
> window, which I assume would then also mean "hardware selected".

I hadn't considered that.  The hardware seems to allow you to write a
0 mantissa, non-0 exponent.  From the SDM, it's unclear what that
would mean.  The code as written would display "0 us", "0 ms", or "0
s" - not "0 hardware selected".  Do you want more explicity printing
for those cases?  I think it's fine to have a distinction between the
output.  "0 hardware selected" is the known valid value that is
working as expected.  The other ones being something different seems
good to me since we don't really know what they mean.

> > @@ -773,6 +811,33 @@ static void print_cpufreq_para(int cpuid, struct x=
c_get_cpufreq_para *p_cpufreq)
> >                 p_cpufreq->scaling_cur_freq);
> >      }
> >
> > +    if ( strcmp(p_cpufreq->scaling_governor, XEN_HWP_GOVERNOR) =3D=3D =
0 )
> > +    {
> > +        const xc_hwp_para_t *hwp =3D &p_cpufreq->u.hwp_para;
> > +
> > +        printf("hwp variables        :\n");
> > +        printf("  hardware limits    : lowest [%u] most_efficient [%u]=
\n",
>
> Here and ...
>
> > +               hwp->lowest, hwp->most_efficient);
> > +        printf("                     : guaranteed [%u] highest [%u]\n"=
,
> > +               hwp->guaranteed, hwp->highest);
> > +        printf("  configured limits  : min [%u] max [%u] energy_perf [=
%u]\n",
>
> ... here I wonder what use the underscores are in produced output. I'd
> use blanks. If you really want a separator there, then please use
> dashes.

I'll use blanks.

Regards,
Jason

