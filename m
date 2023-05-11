Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8696FF365
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 15:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533390.830024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px6gG-00031Z-B7; Thu, 11 May 2023 13:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533390.830024; Thu, 11 May 2023 13:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px6gG-0002xG-7O; Thu, 11 May 2023 13:50:04 +0000
Received: by outflank-mailman (input) for mailman id 533390;
 Thu, 11 May 2023 13:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1K6=BA=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1px6gF-0002gS-Fv
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 13:50:03 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9d8c7d0-f002-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 15:50:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-966400ee79aso1103821066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 May 2023 06:50:01 -0700 (PDT)
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
X-Inumbo-ID: b9d8c7d0-f002-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683813001; x=1686405001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGpfGoxRzpaDiwFkADeVm0ofYJWAggtMDA6nm4FBXQo=;
        b=Ry0EGM6GP/o3Q15VSm0+WICH9Dy7UnRXhPCN8dbMkMKBhtm/AG5DljFjSepkgjl9kV
         mZR+YYIqBR6UYhunf58a2R3Vn2ve5R2Ph6xT1PvV1e03wfTCmanhF//V/FqA8GY0x5HB
         Bh25KQOfctsqlZoMSK09O8s0l0CBPeAmFoOY+PieevoYeF0C3/+MzbxlaUBMNx5dbYjP
         AwOhfwmi2h6GqFGijPOPKi17hmFR78i9R4fvBs/MHgycw8546sH4RuuzYUDQs/Ya+/yK
         As9b6w/ewT58RmaNqCPtPz6e8O435ERtnzbWF++NX2P+LwtNS7OQbf6nc6pErSRvCh/1
         CPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683813001; x=1686405001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGpfGoxRzpaDiwFkADeVm0ofYJWAggtMDA6nm4FBXQo=;
        b=O2cE0HacfNE1zHHGMFulgdIE+76EiNcPr6jBFZrpMllYlfJUyVskZuyTvuX83uQAlO
         YyUDdQd+Vhs/lSgHIrsSuPnYZ+NpneJlNjUC1IgHMJOX/G+6v/qMy+3MGOenrJ0uBrtB
         iMmtVG374jRP/1jwCVYSFD3XJhBga2oAwIb9vWGahF9joSk3KNv6sZ0eFNuQ/iPVMeV0
         4s50xv015JExNmoCkyDLBjqAXPPDuCX0Qg64MkVRH/h1YzxoriHCCscmG24S2P2aKDsU
         IlgtuUhNmd9+dqCT4W/A4rdA4+edXVEfuBHOph3XhVHeeyE1R3pqzBmSWpiLrtp8KWPX
         IUgQ==
X-Gm-Message-State: AC+VfDz2i5tJJwiNHzxl53MvuTyfIvtHQ6t4yEXKx6g6qmfMu37fL+r7
	OQczdo+tBFPebU8H5fwO4BxQZQlWDmLCu1gZArw=
X-Google-Smtp-Source: ACHHUZ7lnR79NCl/1Gp/0Wok1qwa6ajrGAlB4xFOe2wQQHe9UA5rNdZPvn9EhpBqbtfL3PaS5qAr7ZehP1PC8VWmUcI=
X-Received: by 2002:a17:907:3e1b:b0:967:3963:dab8 with SMTP id
 hp27-20020a1709073e1b00b009673963dab8mr13547819ejc.7.1683813001044; Thu, 11
 May 2023 06:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230501193034.88575-1-jandryuk@gmail.com> <20230501193034.88575-8-jandryuk@gmail.com>
 <7db38688-1233-bc16-03f3-7afdc3394054@suse.com> <9cf71407-6209-296a-489a-9732b1928246@suse.com>
 <CAKf6xptOf7eSzstzjfbbSU0tMBpNjtPEwt2uNzj=2TucrgFRiA@mail.gmail.com> <80ccf9c7-5d22-b368-dac6-01fe6cec7add@suse.com>
In-Reply-To: <80ccf9c7-5d22-b368-dac6-01fe6cec7add@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 11 May 2023 09:49:48 -0400
Message-ID: <CAKf6xptLpj_L_G3Qk+KA-yaTcaMHLJLL9soFP9HD6Ro+8Lk7CA@mail.gmail.com>
Subject: Re: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to userspace
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 2:21=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.05.2023 19:49, Jason Andryuk wrote:
> > On Mon, May 8, 2023 at 6:26=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 01.05.2023 21:30, Jason Andryuk wrote:
> >>> Extend xen_get_cpufreq_para to return hwp parameters.  These match th=
e
> >>> hardware rather closely.
> >>>
> >>> We need the features bitmask to indicated fields supported by the act=
ual
> >>> hardware.
> >>>
> >>> The use of uint8_t parameters matches the hardware size.  uint32_t
> >>> entries grows the sysctl_t past the build assertion in setup.c.  The
> >>> uint8_t ranges are supported across multiple generations, so hopefull=
y
> >>> they won't change.
> >>
> >> Still it feels a little odd for values to be this narrow. Aiui the
> >> scaling_governor[] and scaling_{max,min}_freq fields aren't (really)
> >> used by HWP. So you could widen the union in struct
> >> xen_get_cpufreq_para (in a binary but not necessarily source compatibl=
e
> >> manner), gaining you 6 more uint32_t slots. Possibly the somewhat oddl=
y
> >> placed scaling_cur_freq could be included as well ...
> >
> > The values are narrow, but they match the hardware.  It works for HWP,
> > so there is no need to change at this time AFAICT.
> >
> > Do you want me to make this change?
>
> Well, much depends on what these 8-bit values actually express (I did
> raise this question in one of the replies to your patches, as I wasn't
> able to find anything in the SDM). That'll then hopefully allow to
> make some educated prediction on on how likely it is that a future
> variant of hwp would want to widen them.

Sorry for not providing a reference earlier.  In the SDM,
HARDWARE-CONTROLLED PERFORMANCE STATES (HWP) section, there is this
second paragraph:
"""
In contrast, HWP is an implementation of the ACPI-defined
Collaborative Processor Performance Control (CPPC), which specifies
that the platform enumerates a continuous, abstract unit-less,
performance value scale that is not tied to a specific performance
state / frequency by definition. While the enumerated scale is roughly
linear in terms of a delivered integer workload performance result,
the OS is required to characterize the performance value range to
comprehend the delivered performance for an applied workload.
"""

The numbers are "continuous, abstract unit-less, performance value."
So there isn't much to go on there, but generally, smaller numbers
mean slower and bigger numbers mean faster.

Cross referencing the ACPI spec here:
https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html=
#collaborative-processor-performance-control

Scrolling down you can find the register entries such as

Highest Performance
Register or DWORD Attribute:  Read
Size:                         8-32 bits

AMD has its own pstate implementation that is similar to HWP.  Looking
at the Linux support, the AMD hardware also use 8 bit values for the
comparable fields:
https://elixir.bootlin.com/linux/latest/source/arch/x86/include/asm/msr-ind=
ex.h#L612

So Intel and AMD are 8bit for now at least.  Something could do 32bits
according to the ACPI spec.

8 bits of granularity for slow to fast seems like plenty to me.  I'm
not sure what one would gain from 16 or 32 bits, but I'm not designing
the hardware.  From the earlier xenpm output, "highest" was 49, so
still a decent amount of room in an 8 bit range.

> (Was it energy_perf that went
> from 4 to 8 bits at some point, which you even comment upon in the
> public header?)

energy_perf (Energy_Performanc_Preference) had a fallback: "If
CPUID.06H:EAX[bit 10] indicates that this field is not supported, HWP
uses the value of the IA32_ENERGY_PERF_BIAS MSR to determine the
energy efficiency / performance preference."  So it had a different
range, but that was because it was being put into an older register.

However, I've removed that fallback code in v4.

Regards,
Jason

