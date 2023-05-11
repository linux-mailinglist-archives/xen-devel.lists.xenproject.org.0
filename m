Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546FE6FFB35
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 22:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533596.830414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxCol-0001D1-9m; Thu, 11 May 2023 20:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533596.830414; Thu, 11 May 2023 20:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxCol-0001Ao-5Q; Thu, 11 May 2023 20:23:15 +0000
Received: by outflank-mailman (input) for mailman id 533596;
 Thu, 11 May 2023 20:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1K6=BA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pxCoj-0001Ai-QF
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 20:23:13 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a65c936c-f039-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 22:23:11 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-956ff2399c9so1748501766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 13:23:11 -0700 (PDT)
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
X-Inumbo-ID: a65c936c-f039-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683836591; x=1686428591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZFTuu27TWBz+rQB7H9iD5+gOGvCMbVa69FBH6J8ydc=;
        b=K6lG5bVIF7lTvl75uKXWNeYLa+L2CdDvwczbtmNV+I7srel/4AJ9M0fNy02414cmGX
         GdNLppTrKltvcHa3en+BM70atbZfqYGmCOFbPBp8qOoCKOD7SoDN6IYIpwXPN9ZPwft9
         XWEQSdPsq5/uSdJM1nsv6mltT8dHxlmCfuNgNsMxNEHOsSSol6oFCC5hRF+3joH6gmv/
         btRA4D3snaWhMZ4VrDnCYGfw2LNJMDXfBFgp1Ikn6JFKWbJasE2k6+g8iRX+Nr9CSs9S
         uwftHLveBGZ8JwOgoK5c8J3hl2juPyUJ+HLhzc/MiL33PZ/nzd+q82tPM5SP+8cxNAwz
         aAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683836591; x=1686428591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZFTuu27TWBz+rQB7H9iD5+gOGvCMbVa69FBH6J8ydc=;
        b=iO/DhtYAZWuLvSDtBXM+mBe6VNlulcWZpVmJr10QS/gQ0m07RnqeLXbB8PgITlEbxh
         DKzBV5PoM2OWzTt5erlf1jU0GcXjnmMZGs6TxvxCcTFOwzGx6lQ2yHEPRA/Z/iQOEw7q
         6wQUVZrB7F8vF8k4cMQtLnEYBnYDycy2QVEsn6SSwQNW6TfG6N+nDBhvsF1uu/QywxX0
         4owSdjlDuxu6r9Fvtqy3sGFsERCGc0OkGBIYhXMv8RN1M5oBJon+1FYwCWDsOMbZ1FX3
         p6J0wqmNL/Y0xrutUDB7DiSu7DSUdLDQHXOgcKNSnN4uNv3Unx0M2ZF6L95Hk6brgx4t
         uqDg==
X-Gm-Message-State: AC+VfDxC16WNZokn8Mn04mOeus7NhG8vg015FR1SZtqhzfjk2Lhgp7UQ
	mVdQTDiZ4sOSFKaR8coClEFZ2llNLlusIA0q5NY=
X-Google-Smtp-Source: ACHHUZ49EdpcBrqeTCP2iuMZaZ33hrIx865LuA7k1/T0GoUUgo9sxv+OgAFyiujV4RFhqcof758VZuE1dBXrwVCtCIk=
X-Received: by 2002:a17:907:7d9f:b0:94f:7d45:4312 with SMTP id
 oz31-20020a1709077d9f00b0094f7d454312mr21590799ejc.29.1683836590763; Thu, 11
 May 2023 13:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-8-jandryuk@gmail.com>
 <7db38688-1233-bc16-03f3-7afdc3394054@suse.com> <9cf71407-6209-296a-489a-9732b1928246@suse.com>
 <CAKf6xptOf7eSzstzjfbbSU0tMBpNjtPEwt2uNzj=2TucrgFRiA@mail.gmail.com>
 <80ccf9c7-5d22-b368-dac6-01fe6cec7add@suse.com> <CAKf6xptLpj_L_G3Qk+KA-yaTcaMHLJLL9soFP9HD6Ro+8Lk7CA@mail.gmail.com>
 <559c7f4f-113e-8e58-d4d0-3c0c36f27960@suse.com>
In-Reply-To: <559c7f4f-113e-8e58-d4d0-3c0c36f27960@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 11 May 2023 16:22:58 -0400
Message-ID: <CAKf6xpvXsiac7WqEuj_e9GnuNMMEi-DZ-P0i1Hr79s2unGQZGQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to userspace
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 10:10=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 11.05.2023 15:49, Jason Andryuk wrote:
> > On Thu, May 11, 2023 at 2:21=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 10.05.2023 19:49, Jason Andryuk wrote:
> >>> On Mon, May 8, 2023 at 6:26=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>>
> >>>> On 01.05.2023 21:30, Jason Andryuk wrote:
> >>>>> Extend xen_get_cpufreq_para to return hwp parameters.  These match =
the
> >>>>> hardware rather closely.
> >>>>>
> >>>>> We need the features bitmask to indicated fields supported by the a=
ctual
> >>>>> hardware.
> >>>>>
> >>>>> The use of uint8_t parameters matches the hardware size.  uint32_t
> >>>>> entries grows the sysctl_t past the build assertion in setup.c.  Th=
e
> >>>>> uint8_t ranges are supported across multiple generations, so hopefu=
lly
> >>>>> they won't change.
> >>>>
> >>>> Still it feels a little odd for values to be this narrow. Aiui the
> >>>> scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
> >>>> used by HWP. So you could widen the union in struct
> >>>> xen_get_cpufreq_para (in a binary but not necessarily source compati=
ble
> >>>> manner), gaining you 6 more uint32_t slots. Possibly the somewhat od=
dly
> >>>> placed scaling_cur_freq could be included as well ...
> >>>
> >>> The values are narrow, but they match the hardware.  It works for HWP=
,
> >>> so there is no need to change at this time AFAICT.
> >>>
> >>> Do you want me to make this change?
> >>
> >> Well, much depends on what these 8-bit values actually express (I did
> >> raise this question in one of the replies to your patches, as I wasn't
> >> able to find anything in the SDM). That'll then hopefully allow to
> >> make some educated prediction on on how likely it is that a future
> >> variant of hwp would want to widen them.
> >
> > Sorry for not providing a reference earlier.  In the SDM,
> > HARDWARE-CONTROLLED PERFORMANCE STATES (HWP) section, there is this
> > second paragraph:
> > """
> > In contrast, HWP is an implementation of the ACPI-defined
> > Collaborative Processor Performance Control (CPPC), which specifies
> > that the platform enumerates a continuous, abstract unit-less,
> > performance value scale that is not tied to a specific performance
> > state / frequency by definition. While the enumerated scale is roughly
> > linear in terms of a delivered integer workload performance result,
> > the OS is required to characterize the performance value range to
> > comprehend the delivered performance for an applied workload.
> > """
> >
> > The numbers are "continuous, abstract unit-less, performance value."
> > So there isn't much to go on there, but generally, smaller numbers
> > mean slower and bigger numbers mean faster.
> >
> > Cross referencing the ACPI spec here:
> > https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.=
html#collaborative-processor-performance-control
> >
> > Scrolling down you can find the register entries such as
> >
> > Highest Performance
> > Register or DWORD Attribute:  Read
> > Size:                         8-32 bits
> >
> > AMD has its own pstate implementation that is similar to HWP.  Looking
> > at the Linux support, the AMD hardware also use 8 bit values for the
> > comparable fields:
> > https://elixir.bootlin.com/linux/latest/source/arch/x86/include/asm/msr=
-index.h#L612
> >
> > So Intel and AMD are 8bit for now at least.  Something could do 32bits
> > according to the ACPI spec.
> >
> > 8 bits of granularity for slow to fast seems like plenty to me.  I'm
> > not sure what one would gain from 16 or 32 bits, but I'm not designing
> > the hardware.  From the earlier xenpm output, "highest" was 49, so
> > still a decent amount of room in an 8 bit range.
>
> Hmm, thanks for the pointers. I'm still somewhat undecided. I guess I'm
> okay with you keeping things as you have them. If and when needed we can
> still rework the structure - it is possible to change it as it's (for
> the time being at least) still an unstable interface.

With an anonymous union and anonymous struct, struct
xen_get_cpufreq_para can be re-arranged and compile without any
changes to other cpufreq code.  struct xen_hwp_para becomes 10
uint32_t's.  The old scaling is 3 * uint32_t + 16 bytes
CPUFREQ_NAME_LEN + 4 * uint32_t for xen_ondemand =3D 11 uint32_t.  So
int32_t turbo_enabled doesn't move and it's binary compatible.

Anonymous unions and structs aren't allowed in the public header
though, right?  So that would need to change, though it doesn't seem
too bad.  There isn't too much churn.

I have no plans to tackle AMD pstate.  But having glanced at it this
morning, maybe these hwp sysctls should be renamed cppc?  AMD pstate
and HWP are both implementations of CPPC, so that could be more future
proof?  But, again, I only glanced at the AMD stuff, so there may be
other changes needed.

Regards,
Jason

