Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2846FE37C
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 19:51:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532987.829341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwnx0-0002fj-DQ; Wed, 10 May 2023 17:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532987.829341; Wed, 10 May 2023 17:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwnx0-0002dC-AU; Wed, 10 May 2023 17:50:06 +0000
Received: by outflank-mailman (input) for mailman id 532987;
 Wed, 10 May 2023 17:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e4GJ=A7=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pwnwz-0002YO-64
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 17:50:05 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17440444-ef5b-11ed-8611-37d641c3527e;
 Wed, 10 May 2023 19:50:03 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so71378593a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 May 2023 10:50:03 -0700 (PDT)
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
X-Inumbo-ID: 17440444-ef5b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683741002; x=1686333002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlhCSp4HvAjawplHt1DQMmD8fJoyJaQJKiGyjRIHpzk=;
        b=bJiMPeZdTjx/2JTkVvVTJQCgz6PT5hL+swcSBTmAbcARup4+nQ/YQvXhsZWgHjOVEi
         Ogb3UpGkW8fGgOBP9tgEEdjhzY4l4MQrhNLCRm2g+ifjfIbkgr7Xh1btUb3rc9eFvCeS
         qRMQTZQM0DkglOGMSR4aQuVInZCyJNDKhJ/bm0BEG1cWOdX4Kn+Z9wk2ODn9peCr23qK
         ip0wz8ZuUhCvKX9iOjCYyl++R2RAdTUpWIdvuEQXO2sBa5AyHJbeZmB278kpbaagAKZI
         PFmZX0SnL4W5wjuY+iXtn0u8VFEPyNj2XBIDdEfmUA9agC3fdVPoQS10rXm5lpSvqpVJ
         PdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683741002; x=1686333002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlhCSp4HvAjawplHt1DQMmD8fJoyJaQJKiGyjRIHpzk=;
        b=ZKHHsC4w2e21fOr3mjIxUYiFqegcYQJdTC5cBT7HwPHmAaKoRsPZoupQnNF1e9UytP
         QLe2JACvRFCswpnmYkZiV5J3ylq8IE8kqoyCEiQeAhYlfNmA0RyVTrIFxG/BWXeUbLJ1
         TvD2vqQLEvtzmv5Yb14qemzWrooxa1xLm4y4eBQKCTYZwFihFy7SpnGnO4UimaSneRbh
         GUBlNN0VUV8gO9znwBOjBxctLxvvUosI4Zi2ybAvFmmI+Gu1VsDbMypsaMgkQscf8SME
         eZ1I/BNliPCnozH3kOsXOn1V9bXZnTqL85FQ4cl8QnwsjIBcd7XGc/94MD6kjnC5NOv9
         ud5w==
X-Gm-Message-State: AC+VfDxZX/XhFoDUQvIH8vCx1gduYLkN8d+zFqvJvFxyfYjUnwrkJXcT
	2RNrY6Q37Pefe4fwyt2ChnnZ7ri2i6coHUPJhYk=
X-Google-Smtp-Source: ACHHUZ5MgXLjWye+NCjf+WfmtC/BVN76xVRxSKQHQ/FSXFstIs8dYL1frcMRmk/PKSW+cJb/dk9DovAHWE288vTowis=
X-Received: by 2002:a17:907:3e2a:b0:966:4973:b35 with SMTP id
 hp42-20020a1709073e2a00b0096649730b35mr11320928ejc.22.1683741002253; Wed, 10
 May 2023 10:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-8-jandryuk@gmail.com>
 <7db38688-1233-bc16-03f3-7afdc3394054@suse.com> <9cf71407-6209-296a-489a-9732b1928246@suse.com>
In-Reply-To: <9cf71407-6209-296a-489a-9732b1928246@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 10 May 2023 13:49:50 -0400
Message-ID: <CAKf6xptOf7eSzstzjfbbSU0tMBpNjtPEwt2uNzj=2TucrgFRiA@mail.gmail.com>
Subject: Re: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to userspace
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 6:26=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.05.2023 21:30, Jason Andryuk wrote:
> > Extend xen_get_cpufreq_para to return hwp parameters.  These match the
> > hardware rather closely.
> >
> > We need the features bitmask to indicated fields supported by the actua=
l
> > hardware.
> >
> > The use of uint8_t parameters matches the hardware size.  uint32_t
> > entries grows the sysctl_t past the build assertion in setup.c.  The
> > uint8_t ranges are supported across multiple generations, so hopefully
> > they won't change.
>
> Still it feels a little odd for values to be this narrow. Aiui the
> scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
> used by HWP. So you could widen the union in struct
> xen_get_cpufreq_para (in a binary but not necessarily source compatible
> manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddly
> placed scaling_cur_freq could be included as well ...

The values are narrow, but they match the hardware.  It works for HWP,
so there is no need to change at this time AFAICT.

Do you want me to make this change?

> > --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> > +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> > @@ -506,6 +506,31 @@ static const struct cpufreq_driver __initconstrel =
hwp_cpufreq_driver =3D
> >      .update =3D hwp_cpufreq_update,
> >  };
> >
> > +int get_hwp_para(const struct cpufreq_policy *policy,
>
> While I don't really mind a policy being passed into here, ...
>
> > +                 struct xen_hwp_para *hwp_para)
> > +{
> > +    unsigned int cpu =3D policy->cpu;
>
> ... this is its only use afaics, and hence the caller could as well pass
> in just a CPU number?

Sounds good.

> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -292,6 +292,31 @@ struct xen_ondemand {
> >      uint32_t up_threshold;
> >  };
> >
> > +struct xen_hwp_para {
> > +    /*
> > +     * bits 6:0   - 7bit mantissa
> > +     * bits 9:7   - 3bit base-10 exponent
> > +     * btis 15:10 - Unused - must be 0
> > +     */
> > +#define HWP_ACT_WINDOW_MANTISSA_MASK  0x7f
> > +#define HWP_ACT_WINDOW_EXPONENT_MASK  0x7
> > +#define HWP_ACT_WINDOW_EXPONENT_SHIFT 7
> > +    uint16_t activity_window;
> > +    /* energy_perf range 0-255 if 1. Otherwise 0-15 */
> > +#define XEN_SYSCTL_HWP_FEAT_ENERGY_PERF (1 << 0)
> > +    /* activity_window supported if 1 */
> > +#define XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  (1 << 1)
> > +    uint8_t features; /* bit flags for features */
> > +    uint8_t lowest;
> > +    uint8_t most_efficient;
> > +    uint8_t guaranteed;
> > +    uint8_t highest;
> > +    uint8_t minimum;
> > +    uint8_t maximum;
> > +    uint8_t desired;
> > +    uint8_t energy_perf;
>
> These fields could do with some more commentary. To be honest I had
> trouble figuring (from the SDM) what exact meaning specific numeric
> values have. Readers of this header should at the very least be told
> where they can turn to in order to understand what these fields
> communicate. (FTAOD this could be section names, but please not
> section numbers. The latter are fine to use in a discussion, but
> they're changing too frequently to make them useful in code
> comments.)

Sounds good.  I'll add some description.

> > +};
>
> Also, if you decide to stick to uint8_t, then the trailing padding
> field (another uint8_t) wants making explicit. I'm on the edge
> whether to ask to also check the field: Right here the struct is
> "get only", and peeking ahead you look to be introducing a separate
> sub-op for "set". Perhaps if you added /* OUT */ at the top of the
> new struct? (But if you don't check the field for being zero, then
> you'll want to set it to zero for forward compatibility.)

Thanks for catching.  I'll add the padding field and zero it.

On Mon, May 8, 2023 at 6:47=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.05.2023 12:25, Jan Beulich wrote:
> > On 01.05.2023 21:30, Jason Andryuk wrote:
> >> Extend xen_get_cpufreq_para to return hwp parameters.  These match the
> >> hardware rather closely.
> >>
> >> We need the features bitmask to indicated fields supported by the actu=
al
> >> hardware.
> >>
> >> The use of uint8_t parameters matches the hardware size.  uint32_t
> >> entries grows the sysctl_t past the build assertion in setup.c.  The
> >> uint8_t ranges are supported across multiple generations, so hopefully
> >> they won't change.
> >
> > Still it feels a little odd for values to be this narrow. Aiui the
> > scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
> > used by HWP. So you could widen the union in struct
> > xen_get_cpufreq_para (in a binary but not necessarily source compatible
> > manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddly
> > placed scaling_cur_freq could be included as well ...
>
> Having seen patch 9 now as well, I wonder whether here (or in a separate
> patch) you don't want to limit providing inapplicable data (for example
> not filling *scaling_available_governors would even avoid an allocation,
> thus removing a possible reason for failure), while there (or again in a
> separate patch) you'd also limit what the tool reports (inapplicable
> output causes confusion / questions at best).

The xenpm output only shows relevant information:

# xenpm get-cpufreq-para 11
cpu id               : 11
affected_cpus        : 11
cpuinfo frequency    : base [1600000] max [4900000]
scaling_driver       : hwp-cpufreq
scaling_avail_gov    : hwp
current_governor     : hwp
hwp variables        :
  hardware limits    : lowest [1] most_efficient [11]
                     : guaranteed [11] highest [49]
  configured limits  : min [1] max [255] energy_perf [128]
                     : activity_window [0 hardware selected]
                     : desired [0 hw autonomous]
turbo mode           : enabled

The scaling_*_freq values, policy->{min,max,cur} are filled in with
base, max and 0 in hwp_get_cpu_speeds(), so it's not totally invalid
values being returned.  The governor registration restricting to only
internal governors when HWP is active means it only has the single
governor.  I think it's okay as-is, but let me know if you want
something changed.

Regards,
Jason

