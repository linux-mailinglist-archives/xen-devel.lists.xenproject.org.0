Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E8550669
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jun 2022 19:45:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351958.578692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2cUO-0003R3-M3; Sat, 18 Jun 2022 17:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351958.578692; Sat, 18 Jun 2022 17:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2cUO-0003PH-Id; Sat, 18 Jun 2022 17:44:04 +0000
Received: by outflank-mailman (input) for mailman id 351958;
 Sat, 18 Jun 2022 17:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ejv/=WZ=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1o2cUN-0003PB-9M
 for xen-devel@lists.xenproject.org; Sat, 18 Jun 2022 17:44:03 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cd79f9a-ef2e-11ec-b725-ed86ccbb4733;
 Sat, 18 Jun 2022 19:44:01 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id eo8so10009663edb.0
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jun 2022 10:44:01 -0700 (PDT)
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
X-Inumbo-ID: 3cd79f9a-ef2e-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yQ5Mt1K3U5MOISQ5+oCw+2BwV/RNzMfHtTPWWuDU2BQ=;
        b=gT3ef+WGvFvLvlb3Xq9/uBAsw9U6YljKL53ZsezVMbyj2ly+jlQtL45faLXLUItIsz
         m+sa/TmaRIby334AQauXdCrD21JVKibbaalZpNG19BkOW1X7aQIa5P+hEGr2Lnu+3IQ2
         TGm59X6KA2geWmSwSjICc3bvf6MkKYi1adVpMKTBLVgCWMHppMzVCXAoWUpsfNBvfo8z
         FDzP0gb7RzqFQSevUsebDvuwOru8yiKM7A+RC7rp2FkvEe+U8OO7lDnPkTolJvtFfkXk
         ZqOpMgr3eVVPDWIqiK7XcMR+Jh7779F3D8i7IuUPY2VDTEg1QFuPyQCOZpjnyNk8t0Uu
         4njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yQ5Mt1K3U5MOISQ5+oCw+2BwV/RNzMfHtTPWWuDU2BQ=;
        b=Wcd090PCxBRPWZSZWBI7gnEy/s0Wx+6+H0TUIEZImsePzIEs3YWNBAQMebchW0OyIw
         xi6FEVA3Ehqps7CIjt3nYIKzvSMV9K00cXQDZHENReP5QYY3h3T+zpZJhyyQOj1j3nzo
         sk7M7++x3Z6I9h98lXlLvlODb5oQe2P+MJ7Xcg9Zkc06JHWk9IKdInQvz8O349ji4A+a
         J9Z+UImjAwFDSHSyynvGc5gFWH80EXK4l9llq4wN1QINrpEiC/OI84MkT3oIatC0cprU
         BOqR4r5WGEvXiLv44txdXVuRBQtXM1MKB2ywCsDuR2JTnHOY1FbBrqPxby1RQmSFMOvl
         tmrg==
X-Gm-Message-State: AJIora/hBoenlnxUwdN6SzB0FBAb+FSPJNXyWgy+/ZNEhfMN+C+gKGbN
	F+x4Knf2o/trGWTMmlChMoqLOXzHXiOMCOnYvak=
X-Google-Smtp-Source: AGRyM1vFf2CerkT2dnmgBUnCctBORIZk+/tho9CGJTBPM+8+Bse2qRZq4bcPK4MSWSO9AlhlamlNRD1QWwhiEhBiKlQ=
X-Received: by 2002:a05:6402:51c7:b0:42d:f4ea:c09 with SMTP id
 r7-20020a05640251c700b0042df4ea0c09mr19078490edd.319.1655574240446; Sat, 18
 Jun 2022 10:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org> <87wndgh2og.fsf@epam.com>
 <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org> <87pmj7hczg.fsf@epam.com> <f260703d-4651-f9e9-3713-9e85a51b1d70@xen.org>
In-Reply-To: <f260703d-4651-f9e9-3713-9e85a51b1d70@xen.org>
From: Dmytro Semenets <dmitry.semenets@gmail.com>
Date: Sat, 18 Jun 2022 20:43:47 +0300
Message-ID: <CACM97VUukaWoegmNvF4F+tf2tHCyPcjG41CSjjz72V2+Cte4Ew@mail.gmail.com>
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
To: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Dmytro Semenets <Dmytro_Semenets@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 17 =D0=B8=D1=8E=D0=BD. 2022 =D0=B3. =D0=B2 14:12, Julien Gral=
l <julien@xen.org>:
Hi Julien,
>
> Hi,
>
> On 17/06/2022 10:10, Volodymyr Babchuk wrote:
> > Julien Grall <julien@xen.org> writes:
> >
> >> On 16/06/2022 19:40, Volodymyr Babchuk wrote:
> >>> Hi Julien,
> >>
> >> Hi Volodymyr,
> >>
> >>> Julien Grall <julien@xen.org> writes:
> >>>
> >>>> Hi,
> >>>>
> >>>> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
> >>>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
> >>>>> According to PSCI specification ARM TF can return DENIED on CPU OFF=
.
> >>>>
> >>>> I am confused. The spec is talking about Trusted OS and not
> >>>> firmware. The docummentation is also not specific to ARM Trusted
> >>>> Firmware. So did you mean "Trusted OS"?
> >>> It should be "firmware", I believe.
> >>
> >> Hmmm... I couldn't find a reference in the spec suggesting that
> >> CPU_OFF could return DENIED because of the firmware. Do you have a
> >> pointer to the spec?
> >
> > Ah, looks like we are talking about different things. Indeed, CPU_OFF
> > can return DENIED only because of Trusted OS. But entity that *returns*
> > the error to a caller is a firmware.
>
> Right, the interesting part is *why* DENIED is returned not *who*
> returns it.
ARM TF returns DENIED *only* for the platform I have.
We have a dissonance between spec and xen implementation because
DENIED returned by
ARM TF or Thrusted OS or whatever is not a reason for panic. And we
have issues with this.
If machine_restart() behaviour is more or less correct  (sometimes
reports about panic but restarts the machine)
but machine_halt() doesn't work at all.
Transit execution to CPU0 for my understanding is a workaround and
this approach will fix
machine_restart() function but will not fix machine_halt(). Approach
you suggested (spinning all cpus) will work but
will save less energy.
> >>>>> Refer to "Arm Power State Coordination Interface (DEN0022D.b)"
> >>>>> section 5.5.2
> >>>>
> >>>> Reading both 5.5.2 and 5.9.1 together, DENIED would be returned when
> >>>> the trusted OS can only run on one core.
> >>>>
> >>>> Some of the trusted OS are migratable. So I think we should first
> >>>> attempt to migrate the CPU. Then if it doesn't work, we should preve=
nt
> >>>> the CPU to go offline.
> >>>>
> >>>> That said, upstream doesn't support cpu offlining (I don't know for
> >>>> your use case). In case of shutdown, it is not necessary to offline
> >>>> the CPU, so we could avoid to call CPU_OFF on all CPUs but
> >>>> one. Something like:
> >>>>
> >>> This is even better approach yes. But you mentioned CPU_OFF. Did you
> >>> mean SYSTEM_RESET?
> >>
> >> By CPU_OFF I was referring to the fact that Xen will issue the call
> >> all CPUs but one. The remaining CPU will issue the command to
> >> reset/shutdown the system.
> >>
> >
> > I just want to clarify: change that you suggested removes call to
> > stop_cpu() in halt_this_cpu(). So no CPU_OFF will be sent at all.
>
> I was describing the existing behavior.
>
> >
> > All CPUs except one will spin in
> >
> >      while ( 1 )
> >          wfi();
> >
> > while last cpu will issue SYSTEM_OFF or SYSTEM_RESET.
> >
> > Is this correct?
>
> Yes.
>
> >
> >>>>    void machine_halt(void)
> >>>> @@ -21,10 +23,6 @@ void machine_halt(void)
> >>>>        smp_call_function(halt_this_cpu, NULL, 0);
> >>>>        local_irq_disable();
> >>>>
> >>>> -    /* Wait at most another 10ms for all other CPUs to go offline. =
*/
> >>>> -    while ( (num_online_cpus() > 1) && (timeout-- > 0) )
> >>>> -        mdelay(1);
> >>>> -
> >>>>        /* This is mainly for PSCI-0.2, which does not return if succ=
ess. */
> >>>>        call_psci_system_off();
> >>>>
> >>>>> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
> >>>>> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >>>>
> >>>> I don't recall to see patch on the ML recently for this. So is this =
an
> >>>> internal review?
> >>> Yeah, sorry about that. Dmytro is a new member in our team and he is
> >>> not
> >>> yet familiar with differences in internal reviews and reviews in ML.
> >>
> >> No worries. I usually classify internal review anything that was done
> >> privately. This looks to be a public review, althought not on
> >> xen-devel.
> >>
> >> I understand that not all some of the patches are still in PoC stage
> >> and doing the review on your github is a good idea. But for those are
> >> meant to be for upstream (e.g. bug fixes, small patches), I would
> >> suggest to do the review on xen-devel directly.
> >
> > It not always clear if patch is eligible for upstream. At first we
> > thought that problem is platform-specific and we weren't sure that we
> > will find a proper upstreamable fix.
>
> You can guess but not be sure until you send it to upstrema :). In fact,.=
..
>
> > Probably you saw that PR's name
> > quite differs from final patch. This is because initial solution was
> > completely different from final one.
>
> ... even before looking at your PR, this was the first solution I had in
> mind. I am still pondering whether this could be the best approach
> because I have the suspicion there might be some platform out relying on
> receiving the shutdown request on CPU0.
>
> Anyway, this is so far just theorical, my proposal should solve your
> problem.
>
> On a separate topic, the community is aiming to support a wide range of
> platforms out-of-the-box. I think platform-specific patches are
> acceptable so long they are self-contained (to some extend. I.e if you
> ask to support Xen on RPI3 then I would still probably argue against :))
> or have a limited impact to the rest of the users (this is why we have
> alternative in Xen).
>
> My point here is your initial solution may have been the preferred
> approach for upstream. So if you involve the community early, you are
> reducing the risk to have to backtrack and/or spend extra time in the
> wrong directions.
>
> Cheers,
>
> --
> Julien Grall

