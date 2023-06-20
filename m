Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DADE73747B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 20:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552237.862199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBgIZ-00042Q-MK; Tue, 20 Jun 2023 18:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552237.862199; Tue, 20 Jun 2023 18:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBgIZ-00040D-JN; Tue, 20 Jun 2023 18:41:51 +0000
Received: by outflank-mailman (input) for mailman id 552237;
 Tue, 20 Jun 2023 18:41:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeBQ=CI=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qBgIY-000407-Cj
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 18:41:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cd75a11-0f9a-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 20:41:48 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5147e40bbbbso5315232a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jun 2023 11:41:48 -0700 (PDT)
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
X-Inumbo-ID: 1cd75a11-0f9a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687286507; x=1689878507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XcJUV/tZVqUo1gtYZWsvIKi4zb6TKYlHQGAMgLV6Fw=;
        b=naOIwvgVKO7lFsQdokp8kwk69MuTWfU9BxNn4h8Aoq6JYAmZudb3TDyAnwKUap4hQA
         idMynxYHI2VOd7CaWbBz56bLxDE86mMvKo8XTJKzH6uRObl0y8aFFdTmS27Drz6Mj+tU
         pTdpvl6HEkjzKl58oQvHroQmNH0wicNoEjbhjZJYgedJBcasjPIeZ50/T6E0g8y5sxdD
         35au0TnPeVuM7iCTaMWAaaxv7p4aw3wOMfcCm2y0j7aNBKNUBwqIPC5nZ6u2aA9cgDqC
         ZG0UAVreMbiKsRkb6okh/yA4EN1HFBBuVkPmW7o0QW6V3+xtLPtsTc97cnwsL0BvMEy+
         x5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687286507; x=1689878507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XcJUV/tZVqUo1gtYZWsvIKi4zb6TKYlHQGAMgLV6Fw=;
        b=TrEphAEmn3lh11rLZ2dwW3r+i8PBylbOMuDl+1lFRML/G8GP0X4X1tlTJeP6hnMRMJ
         cO+JcWOi/9fMuYwyj2iBVzpDTHewAmdBhKboHFBf1KMLR4aIIpHV03XW7KmTCJ6t7cHf
         dcGcjMZX3WXOBXPUn8mT4seGE4Ixlzy5ANRtO8td51qzpRNHaDuEJappRa/m2uakOr0P
         3ggY/zZeRZzpA5iySVM0c5uoaN9ute8VLue7CZCRKbAytJxDcxyzIM+T1kOIN4RdFj6V
         HSaqlwS9p04yy2fX3KHWb7gTazi78OYH/T+Enf7T6Uww6TQds7lQhFJ15o9n7VGElZIr
         fjLg==
X-Gm-Message-State: AC+VfDxnoEQQ34WU/SDDngbr6Uh5/rWvo80LlAZ+AbzylH7N9rhHV2kB
	59WANEb7IW4wUTOMTyQckVn5q75AYsskaPyoP4U=
X-Google-Smtp-Source: ACHHUZ4+Biab0J9STP9Kj4Y6sBS5jk9YT2wDBfib/F8LG9a14Z504l3MrMl3+lsTkUi0K9WkaF73ZivxrLJVOrQYIbs=
X-Received: by 2002:aa7:d78d:0:b0:51a:4557:2caf with SMTP id
 s13-20020aa7d78d000000b0051a45572cafmr5561008edq.34.1687286507195; Tue, 20
 Jun 2023 11:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230614180253.89958-1-jandryuk@gmail.com> <20230614180253.89958-10-jandryuk@gmail.com>
 <791bf505-7335-d16d-617d-ec19dc637ea6@suse.com>
In-Reply-To: <791bf505-7335-d16d-617d-ec19dc637ea6@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 20 Jun 2023 14:41:35 -0400
Message-ID: <CAKf6xpvQD+6D76kfFvACkZ7H7=NbY-khxJeTEAGU3dDPwoji-Q@mail.gmail.com>
Subject: Re: [PATCH v4 09/15] cpufreq: Export HWP parameters to userspace as CPPC
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 10:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 14.06.2023 20:02, Jason Andryuk wrote:
> > --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> > +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> > @@ -537,6 +537,29 @@ static const struct cpufreq_driver __initconstrel =
hwp_cpufreq_driver =3D
> >      .update =3D hwp_cpufreq_update,
> >  };
> >
> > +int get_hwp_para(const unsigned int cpu,
> > +                 struct xen_cppc_para *cppc_para)
> > +{
> > +    const struct hwp_drv_data *data =3D per_cpu(hwp_drv_data, cpu);
> > +
> > +    if ( data =3D=3D NULL )
> > +        return -EINVAL;
>
> Maybe better -ENODATA in this case?

Sounds good.

> > --- a/xen/drivers/acpi/pmstat.c
> > +++ b/xen/drivers/acpi/pmstat.c
> > @@ -251,48 +251,54 @@ static int get_cpufreq_para(struct xen_sysctl_pm_=
op *op)
> >      else
> >          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME=
_LEN);
> >
> > -    if ( !(scaling_available_governors =3D
> > -           xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> > -        return -ENOMEM;
> > -    if ( (ret =3D read_scaling_available_governors(
> > -                    scaling_available_governors,
> > -                    gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
> > +    if ( !strncasecmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER,
> > +                      CPUFREQ_NAME_LEN) )
>
> Mind me asking why you think case-insensitive compare is appropriate here=
?

I'll change to strncmp().  All the other string comparisons on
pmstat.c are strncasecmp, so I followed that pattern.

> > +        ret =3D get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para)=
;
> > +    else
> >      {
> > +        if ( !(scaling_available_governors =3D
> > +               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
> > +            return -ENOMEM;
> > +        if ( (ret =3D read_scaling_available_governors(
> > +                        scaling_available_governors,
> > +                        gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
>
> I realize you only re-indent this, but since you need to touch it anyway,
> may I suggest to also switch to siezof(*scaling_available_governors)?

How about dropping sizeof(*scaling_available_governors)?  This length ...

> > +        {
> > +            xfree(scaling_available_governors);
> > +            return ret;
> > +        }
> > +        ret =3D copy_to_guest(op->u.get_para.scaling_available_governo=
rs,
> > +                    scaling_available_governors, gov_num * CPUFREQ_NAM=
E_LEN);
>
> Similarly here: Please adjust indentation while you touch this code.

... should match here, but this second one lacks the "* sizeof($foo)".
They are strings, so multiplying by sizeof() is unusual.

FTAOD, you want the indenting as:
        ret =3D copy_to_guest(op->u.get_para.scaling_available_governors,
                            scaling_available_governors,
                            gov_num * CPUFREQ_NAME_LEN);
?

> >          xfree(scaling_available_governors);
> > -        return ret;
> > -    }
> > -    ret =3D copy_to_guest(op->u.get_para.scaling_available_governors,
> > -                scaling_available_governors, gov_num * CPUFREQ_NAME_LE=
N);
> > -    xfree(scaling_available_governors);
> > -    if ( ret )
> > -        return ret;
> > +        if ( ret )
> > +            return ret;
> >
> > -    op->u.get_para.u.s.scaling_cur_freq =3D policy->cur;
> > -    op->u.get_para.u.s.scaling_max_freq =3D policy->max;
> > -    op->u.get_para.u.s.scaling_min_freq =3D policy->min;
> > +        op->u.get_para.u.s.scaling_cur_freq =3D policy->cur;
> > +        op->u.get_para.u.s.scaling_max_freq =3D policy->max;
> > +        op->u.get_para.u.s.scaling_min_freq =3D policy->min;
> >
> > -    if ( policy->governor->name[0] )
> > -        strlcpy(op->u.get_para.u.s.scaling_governor,
> > -            policy->governor->name, CPUFREQ_NAME_LEN);
> > -    else
> > -        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> > -                CPUFREQ_NAME_LEN);
> > +        if ( policy->governor->name[0] )
> > +            strlcpy(op->u.get_para.u.s.scaling_governor,
> > +                policy->governor->name, CPUFREQ_NAME_LEN);
> > +        else
> > +            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
> > +                    CPUFREQ_NAME_LEN);
> >
> > -    /* governor specific para */
> > -    if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> > -                      "userspace", CPUFREQ_NAME_LEN) )
> > -    {
> > -        op->u.get_para.u.s.u.userspace.scaling_setspeed =3D policy->cu=
r;
> > -    }
> > +        /* governor specific para */
> > +        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
> > +                          "userspace", CPUFREQ_NAME_LEN) )
> > +        {
> > +            op->u.get_para.u.s.u.userspace.scaling_setspeed =3D policy=
->cur;
> > +        }
>
> Would also be nice if you could get rid of the unnecessary braces here
> at this occasion.

Sure

> > --- a/xen/include/acpi/cpufreq/cpufreq.h
> > +++ b/xen/include/acpi/cpufreq/cpufreq.h
> > @@ -248,5 +248,7 @@ void intel_feature_detect(struct cpufreq_policy *po=
licy);
> >
> >  extern bool __initdata opt_cpufreq_hwp;
> >  int hwp_cmdline_parse(const char *s);
> > +int get_hwp_para(const unsigned int cpu,
>
> I think we generally avoid const when it's not a pointed-to type. It's
> not useful at all in a declaration.

Ok

> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -296,6 +296,61 @@ struct xen_ondemand {
> >      uint32_t up_threshold;
> >  };
> >
> > +struct xen_cppc_para {
> > +    /* OUT */
> > +    /* activity_window supported if 1 */
> > +#define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
>
> I think 1 isn't very helpful, looking forward. Perhaps better "set" or
> "flag set"?

"set" works for me.

> > +    uint32_t features; /* bit flags for features */
> > +    /*
> > +     * See Intel SDM: HWP Performance Range and Dynamic Capabilities
> > +     *
> > +     * These four are 0-255 hardware-provided values.  They "continuou=
s,
> > +     * abstract unit-less, performance" values.  smaller numbers are s=
lower
> > +     * and larger ones are faster.
> > +     */
> > +    uint32_t lowest;
> > +    uint32_t lowest_nonlinear; /* most_efficient */
>
> Why non_linear in the external interface when internally you use
> most_efficient (merely put in the comment here)?
>
> > +    uint32_t nominal; /* guaranteed */
>
> Similar question for the name choice here.

There is a naming mismatch between the HWP fields and the CPPC fields.
The commit message includes:
The HWP most_efficient is mapped to CPPC lowest_nonlinear, and guaranteed i=
s
mapped to nominal.  CPPC has a guaranteed that is optional while nominal
is required.  ACPI spec says "If this register is not implemented, OSPM
assumes guaranteed performance is always equal to nominal performance."

So the comments were to help with the mapping.  Should I prefix the
comments like "HWP: most_efficient"?

> > +    uint32_t highest;
> > +    /*
> > +     * See Intel SDM: IA32_HWP_REQUEST MSR (Address: 774H Logical Proc=
essor
> > +     * Scope)
> > +     *
> > +     * These are all hints, and the processor may deviate outside of t=
hem.
> > +     * Values below are 0-255.
> > +     *
> > +     * minimum and maximum can be set to the above hardware values to =
constrain
> > +     * operation.  The full range 0-255 is accepted and will be clippe=
d by
> > +     * hardware.
> > +     */
> > +    uint32_t minimum;
> > +    uint32_t maximum;
> > +    /*
> > +     * Set an explicit performance hint, disabling hardware selection.
> > +     * 0 lets the hardware decide.
> > +     */
> > +    uint32_t desired;
>
> "Set" kind of conflicts with all fields being marked as OUT above. I thin=
k
> the word can simply be dropped?

Sounds good.

Thanks,
Jason

