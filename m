Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F0552D97
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 10:55:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353105.580012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ZfK-0008Dy-H4; Tue, 21 Jun 2022 08:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353105.580012; Tue, 21 Jun 2022 08:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3ZfK-0008B7-EB; Tue, 21 Jun 2022 08:55:18 +0000
Received: by outflank-mailman (input) for mailman id 353105;
 Tue, 21 Jun 2022 08:55:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kiuJ=W4=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1o3ZfI-0008B1-Kc
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 08:55:16 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de298202-f13f-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 10:55:15 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id g25so25964151ejh.9
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jun 2022 01:55:15 -0700 (PDT)
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
X-Inumbo-ID: de298202-f13f-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eOzuKK+tTZIrLrL5q8T8WECZpLq6F+5BgwSjIAXKYcY=;
        b=ar2qyV2hjB+y7/rIEfCgTbTHAoEnZP05QvnVp54XZkOCwK4YZRhipq6ZOqkDcNO9Qj
         /O+iqYrkCCyAPNAsjLLMHjJC2rs5F7YlgzHsB8X3BumGsmvyVfU3gZ3aTYHiiAPkSj7z
         leYR+oNbHFmvITPJFvkZ2iEKGU8RKJOEHkIZglAFGHHIl66T7ropitdfHCYK/7gUPzQf
         5eTDkdpEyEyHVfI7A/EqOOgPPAYV5E89k185t7x5gz+EfkO8use2zw3LRP2j1+H3lot9
         OKWey1daGXt67qNi+svKbpZEJUHEl56b5fOfqC+4qPVeZKTGcc7dtWt002c4N9D37qzp
         287Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eOzuKK+tTZIrLrL5q8T8WECZpLq6F+5BgwSjIAXKYcY=;
        b=F8NZyvNtP00G1p94NdmNlLzefrGyLufJpZKhX13KhDXMvtQkfcj6Fe872nARtoCYAu
         RQjjK0ibTrbNjQ8QAPF08LjlSH0rnPKfsG4CuDkkr0oNZ7l7un/cXBo2dOHTQYSMK8Aw
         pyCYLSuo6M7jRKK2ufQfTDMRtoSo2e3WPZADKDIHsc25phxBnDcc4vaF0jHFEsYyNPOn
         saj90457ju5wKbGx9aUvdThjkcAPhsS+0AIqEeEambpfgY6V91mU6eQw7r7d9haKD5hS
         FE557O292Ut+ADxz/8ffEyWZQmylZEbJwZG1e+tIqwg5lB6H29UX8ZmRmchsLne+160z
         keaw==
X-Gm-Message-State: AJIora9eBhOBSv6gWm9rzCgOLfHx1dzpSihgT4Wn33lT5RoSF5PdPM/k
	PSeLxDPPYChvKYKoNO1LLMjAh9eejDISVD7T7g8=
X-Google-Smtp-Source: AGRyM1tOzwfjL2XPZP3bV66N7ngEnvmg4kOt4lsywRSoPdamcPnI8VsPGNlbp3PLMk8TOP5osx4+PZX9ImsIowYablY=
X-Received: by 2002:a17:906:5352:b0:712:3916:e92 with SMTP id
 j18-20020a170906535200b0071239160e92mr24351770ejo.756.1655801714982; Tue, 21
 Jun 2022 01:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org> <87wndgh2og.fsf@epam.com>
 <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org> <87pmj7hczg.fsf@epam.com>
 <f260703d-4651-f9e9-3713-9e85a51b1d70@xen.org> <CACM97VUukaWoegmNvF4F+tf2tHCyPcjG41CSjjz72V2+Cte4Ew@mail.gmail.com>
 <49ace8c9-8fd6-57a2-e0c8-cfba04c9e151@xen.org>
In-Reply-To: <49ace8c9-8fd6-57a2-e0c8-cfba04c9e151@xen.org>
From: Dmytro Semenets <dmitry.semenets@gmail.com>
Date: Tue, 21 Jun 2022 11:55:02 +0300
Message-ID: <CACM97VV5MO0vmqG01pR7dXg1xU3jptOvjt4S+KS27zD+E66fPw@mail.gmail.com>
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
To: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Dmytro Semenets <Dmytro_Semenets@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,
> >>
> >> Hi,
> >>
> >> On 17/06/2022 10:10, Volodymyr Babchuk wrote:
> >>> Julien Grall <julien@xen.org> writes:
> >>>
> >>>> On 16/06/2022 19:40, Volodymyr Babchuk wrote:
> >>>>> Hi Julien,
> >>>>
> >>>> Hi Volodymyr,
> >>>>
> >>>>> Julien Grall <julien@xen.org> writes:
> >>>>>
> >>>>>> Hi,
> >>>>>>
> >>>>>> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
> >>>>>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
> >>>>>>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
> >>>>>>
> >>>>>> I am confused. The spec is talking about Trusted OS and not
> >>>>>> firmware. The docummentation is also not specific to ARM Trusted
> >>>>>> Firmware. So did you mean "Trusted OS"?
> >>>>> It should be "firmware", I believe.
> >>>>
> >>>> Hmmm... I couldn't find a reference in the spec suggesting that
> >>>> CPU_OFF could return DENIED because of the firmware. Do you have a
> >>>> pointer to the spec?
> >>>
> >>> Ah, looks like we are talking about different things. Indeed, CPU_OFF
> >>> can return DENIED only because of Trusted OS. But entity that *returns*
> >>> the error to a caller is a firmware.
> >>
> >> Right, the interesting part is *why* DENIED is returned not *who*
> >> returns it.
> > ARM TF returns DENIED *only* for the platform I have.
> > We have a dissonance between spec and xen implementation because
> > DENIED returned by
> > ARM TF or Thrusted OS or whatever is not a reason for panic.
>
> I agree that's not a reason for panic. However, knowing the reason does
> help to figure out the correct approach.
>
> For instance, one could have suggest to migrate the trusted OS to
> another pCPU. But this would not have worked for you because the DENIED
> is not about that.
>
> > And we
> > have issues with this.
> > If machine_restart() behaviour is more or less correct  (sometimes
> > reports about panic but restarts the machine)
>
> Right...
>
> > but machine_halt() doesn't work at al
> ... this should also be the case here because machine_halt() could also
> be called from cpu0. So I am a bit confused why you are saying it never
> works.
If machine_halt() called on a CPU other than CPU0 it caused panic and reboot.
If it called on a CPU0 it also caused panic but after system power off
and reboot
is not issued. In this state you can still call the xen console. But
you can't reboot the system.
>
> > Transit execution to CPU0 for my understanding is a workaround and
> > this approach will fix
> > machine_restart() function but will not fix machine_halt().
>
> I would say it is a more specific case of what the spec suggests (see
> below). But it should fix both machine_restart() and machine_halt()
> because the last CPU running will be CPU0. So Xen would call SYSTEM_*
> rather than CPU_OF. So I don't understand why you think it will fix one
> but not the other.
Looks like this is specific for my HW case. SYSTEM_OFF doesn't stop
the whole system.
>
> In fact, the idea to always run the request from a given CPU is quite
> similar to what the specification suggests (5.10.3 DEN0022D.b):
>
> "
> One way in which cores can be placed into a known state is to use calls
> to CPU_OFF on all online cores
> except for the last one, which instead uses SYSTEM_OFF. If a UP Trusted
> OS is present, this method
> only works if the core that calls SYSTEM_OFF is the one where the
> Trusted OS is resident, as calls to
> CPU_OFF on this core return a DENIED error. Any core can call SYSTEM_OFF.
> "
>
> For Xen, we would need to detect if the trusted OS is UP and where it is
> running. Then we could always restart/halt from that CPU or CPU0.
>
> > Approach
> > you suggested (spinning all cpus) will work but
> > will save less energy.
>
> I am not sure to understand what's the concern about the energy here.
>  From my understanding of the specification, SYSTEM_OFF will take care
> of switching off the power for all the cores. So at worse, the CPUs will
> spin for a few ms. This would like be more efficient than a call to PSCI
> CPU off.
>
> This is different compare just turning off one CPU (i.e. CPU hot-unplug)
> because the CPU will end up to spin for a very long time. And this is
> why I wasn't OK with conditionally avoiding the panic.
>
> Cheers,
>
> --
> Julien Grall

