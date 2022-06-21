Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5C4552F68
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 12:06:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353149.580056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3alK-0000Cf-FW; Tue, 21 Jun 2022 10:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353149.580056; Tue, 21 Jun 2022 10:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3alK-0000AZ-CM; Tue, 21 Jun 2022 10:05:34 +0000
Received: by outflank-mailman (input) for mailman id 353149;
 Tue, 21 Jun 2022 10:05:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kiuJ=W4=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1o3alI-0000AR-FX
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 10:05:32 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aee7d78f-f149-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 12:05:31 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id cf14so8871405edb.8
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jun 2022 03:05:31 -0700 (PDT)
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
X-Inumbo-ID: aee7d78f-f149-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJC2Yr++Ft5B3thwtCw9JLqY/FSgfHiF5Q1iuBYB6EM=;
        b=ma+c6YIug7mb0eXLsx8RXJmc498OwQG3Z3SP5PIGNzNg9pkTlQICnleBczwiPtRYaU
         6sT4J51xDP2Mdkek9hl4pyPq8TXgQJ2g8KsrQGmVGQXvUDKecXHpp7vfVfL0JbDGZeLk
         4wqGqasD3RzduGUmopyujo2qlF8Z8dyzjSC4smyHIQFSHE1UIkzf3Zpa9quYR8n5ov21
         Ex9e4O2BEdqB1zrxBuH3BJXqI2xVfk3vsLFvfHPWNBBDA7nx0+5vO54hN3hc8CqD4NXO
         G4Id8iwKCC303IXmNQA3r8UIKiTc0ZLulFar60ywwjJiwYSG9QKfJIa/B1S5yeK948CQ
         FZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJC2Yr++Ft5B3thwtCw9JLqY/FSgfHiF5Q1iuBYB6EM=;
        b=Q+kJ5wi1KTAzcCLXuKFLcOI2e7u8f9uqdL8JRwSh0GGrSFD1pqzYavNVeVfd2HPXY7
         NOeZmWcVfKVUSSu5iWQFjqUx0wLZA9JeajG8KbgOh4UeG+vRg4opsXqqi/peTCZbaCfE
         7dwHIFs5Q2LX0jIsLH5CXd4Z152DZz8PwlfVUbf+Mpy3/eSmAsG0xFeIm7C4Z2gdi2gO
         bthiqwonaXT/GbLJqp2/eDERtx8O/LNeJC1LfrM1YAVU2DB5XHN05rSqTiRJVfP61xfY
         hTMnsBsZ2/Brk7DfUrE1FhoPYMuEwsRltrW985V0F+ez5EVlRCCCfMIcpJf0Tj+ZHJlg
         yRFQ==
X-Gm-Message-State: AJIora9cmbHYmE3EElV2ATIXBjCP8o10s1AXMmywGw0kYPvcfkeOiiU7
	AzoGcnyz3mZ+e7S9cy4SftbWfAtZKvO1scTKw+0/yg6l4mg8Ag==
X-Google-Smtp-Source: AGRyM1vnyxFLLD2h9Ib9OArObxWsnOWoY4y2KpmSBUyPXcla/92yTcopS6T0gzfDpDaflG3+yewJFdSRuj8/Q46pT3M=
X-Received: by 2002:a05:6402:2687:b0:430:328f:e46b with SMTP id
 w7-20020a056402268700b00430328fe46bmr34467662edd.33.1655805930661; Tue, 21
 Jun 2022 03:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
 <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org> <87wndgh2og.fsf@epam.com>
 <67f56cdd-531b-72fc-1257-214d078f6bb6@xen.org> <87pmj7hczg.fsf@epam.com>
 <f260703d-4651-f9e9-3713-9e85a51b1d70@xen.org> <CACM97VUukaWoegmNvF4F+tf2tHCyPcjG41CSjjz72V2+Cte4Ew@mail.gmail.com>
 <49ace8c9-8fd6-57a2-e0c8-cfba04c9e151@xen.org> <CACM97VV5MO0vmqG01pR7dXg1xU3jptOvjt4S+KS27zD+E66fPw@mail.gmail.com>
 <371f195b-291e-e5e0-9e1d-1b2d2fa55a7d@xen.org>
In-Reply-To: <371f195b-291e-e5e0-9e1d-1b2d2fa55a7d@xen.org>
From: Dmytro Semenets <dmitry.semenets@gmail.com>
Date: Tue, 21 Jun 2022 13:05:19 +0300
Message-ID: <CACM97VXqAh4ApnkC_1wuDx38njbNxRwGrrfJhHqKV2x3R1svmA@mail.gmail.com>
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
To: Julien Grall <julien@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Dmytro Semenets <Dmytro_Semenets@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,
>
> Hi Dmytro,
>
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 17/06/2022 10:10, Volodymyr Babchuk wrote:
> >>>>> Julien Grall <julien@xen.org> writes:
> >>>>>
> >>>>>> On 16/06/2022 19:40, Volodymyr Babchuk wrote:
> >>>>>>> Hi Julien,
> >>>>>>
> >>>>>> Hi Volodymyr,
> >>>>>>
> >>>>>>> Julien Grall <julien@xen.org> writes:
> >>>>>>>
> >>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>> On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
> >>>>>>>>> From: Dmytro Semenets <dmytro_semenets@epam.com>
> >>>>>>>>> According to PSCI specification ARM TF can return DENIED on CPU OFF.
> >>>>>>>>
> >>>>>>>> I am confused. The spec is talking about Trusted OS and not
> >>>>>>>> firmware. The docummentation is also not specific to ARM Trusted
> >>>>>>>> Firmware. So did you mean "Trusted OS"?
> >>>>>>> It should be "firmware", I believe.
> >>>>>>
> >>>>>> Hmmm... I couldn't find a reference in the spec suggesting that
> >>>>>> CPU_OFF could return DENIED because of the firmware. Do you have a
> >>>>>> pointer to the spec?
> >>>>>
> >>>>> Ah, looks like we are talking about different things. Indeed, CPU_OFF
> >>>>> can return DENIED only because of Trusted OS. But entity that *returns*
> >>>>> the error to a caller is a firmware.
> >>>>
> >>>> Right, the interesting part is *why* DENIED is returned not *who*
> >>>> returns it.
> >>> ARM TF returns DENIED *only* for the platform I have.
> >>> We have a dissonance between spec and xen implementation because
> >>> DENIED returned by
> >>> ARM TF or Thrusted OS or whatever is not a reason for panic.
> >>
> >> I agree that's not a reason for panic. However, knowing the reason does
> >> help to figure out the correct approach.
> >>
> >> For instance, one could have suggest to migrate the trusted OS to
> >> another pCPU. But this would not have worked for you because the DENIED
> >> is not about that.
> >>
> >>> And we
> >>> have issues with this.
> >>> If machine_restart() behaviour is more or less correct  (sometimes
> >>> reports about panic but restarts the machine)
> >>
> >> Right...
> >>
> >>> but machine_halt() doesn't work at al
> >> ... this should also be the case here because machine_halt() could also
> >> be called from cpu0. So I am a bit confused why you are saying it never
> >> works.
> > If machine_halt() called on a CPU other than CPU0 it caused panic and reboot.
> > If it called on a CPU0 it also caused panic but after system power off
> > and reboot
> > is not issued. In this state you can still call the xen console. But
> > you can't reboot the system.
>
> I am lost. In a previous e-mail you said that PSCI CPU_OFF would return
> DENIED on CPU0. IOW, I understood that for other CPUs, it would succeed.
I'm sorry I confused You.
Yes it causes panic and prints it will be rebooted but actual reboot
doesn't happen.

>
> But here, you are tell me the opposite:
>
> "If it called on a CPU0 it also caused panic but after system power off
>   and reboot".
>
> If machine_halt() is called from CPU0, then CPU_OFF should not be called
> on CPU0. So where is that panic coming from?
>
> >>
> >>> Transit execution to CPU0 for my understanding is a workaround and
> >>> this approach will fix
> >>> machine_restart() function but will not fix machine_halt().
> >>
> >> I would say it is a more specific case of what the spec suggests (see
> >> below). But it should fix both machine_restart() and machine_halt()
> >> because the last CPU running will be CPU0. So Xen would call SYSTEM_*
> >> rather than CPU_OF. So I don't understand why you think it will fix one
> >> but not the other.
> > Looks like this is specific for my HW case. SYSTEM_OFF doesn't stop
> > the whole system.
>
> Hmmm... All the other CPUs should be off (or spinning with interrupt
> disabled), so are you saying that SYSTEM_OFF return?
Yes. SYSTEM_OFF returns on my HW. This is reason when CPU_OFF for CPU0 happens.
>
> Cheers,
>
> --
> Julien Grall

