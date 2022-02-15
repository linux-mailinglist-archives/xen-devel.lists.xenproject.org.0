Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689994B6E6C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273202.468302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyWt-0003Mt-1Z; Tue, 15 Feb 2022 14:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273202.468302; Tue, 15 Feb 2022 14:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJyWs-0003K9-TX; Tue, 15 Feb 2022 14:10:06 +0000
Received: by outflank-mailman (input) for mailman id 273202;
 Tue, 15 Feb 2022 14:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZAEc=S6=linaro.org=vincent.guittot@srs-se1.protection.inumbo.net>)
 id 1nJyWr-00031S-1s
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:10:05 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7d13fe7-8e68-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 15:10:03 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id be32so8403788ljb.7
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 06:10:02 -0800 (PST)
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
X-Inumbo-ID: f7d13fe7-8e68-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IGTljEiet/h8+/EkX92WrZJaQ1iS0XGH8pAVnyiGdDM=;
        b=KY6QVZ7HvRyaQ1QHYuusag+3GfgOGK5EBcnz0eb4wuKfg/8+7o3tXkfMB1DL4K/xCT
         G5E/QnJP9b4RG4K55Hby0N6I8RJJA9rIYbCVZSNZJzjbXdhl6Lv42HOjk1wKbPuawoSJ
         TtnEGaln1n4zHzAFT1QsEf5uIEfPESbAh3Ik6yCrODsPVOgycIKPFMjKJ8fVVpDpvTIF
         kpYaLBp0OWkA3eSaYTEeC2H359etyg4+Dwra8IfMchY4mj+0g+6AXvjgTkO5mfJLrN4e
         qQdoY0jUFgi/ELIMf1R1dpTqyAgZOIRb1VinjO2+zx1i9Inq/uZTpU1b0WmvIwozcrBL
         tQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IGTljEiet/h8+/EkX92WrZJaQ1iS0XGH8pAVnyiGdDM=;
        b=sUM/GMa12Vo7drLHQKNbEVcgf8vnLiUBXMdlvNf+KfWZm2ZS42Tvm4jz2DsyBMaPya
         KniKC2zvCo+9rMVSpmXe5BFxaWu0e+zjDff7iUkcreSCvLLQKLJyIQMPOpwDSuwhNSlx
         nR48s3amh+9aPeYZMHFa4HtUMrnDV3/zkbRpjU7B1MOO97o355wReLU/tf0OOeOPf9sa
         MqXZ8vx86zo7XERUni3DOYf1GR4RUjSy1YMkxm888czx1Snj0M88qsSSChIy3WMIC751
         N/y8EO4CdyqYudfNQHgiARrgq1aBSRpUZW28HIXAVlBGQEr+Q6KChNt80lRPM0yE3p/0
         kTRw==
X-Gm-Message-State: AOAM533M0sR9YiF5FovTF65Uahg/pdJ0vWD2rr5pmMxllWO9uipvjSPl
	2Gd5525xBLm3F/fy/MxTlQJoZx58W5MGVAySmP0XZQ==
X-Google-Smtp-Source: ABdhPJzvPz6sdAiQq4+CkHFSa4QaI/v9q+BS7Iy7k43HlhuMeIrPRBXB/RR/JBRWnWScJdTbEtiKFRx84ckdGy+uAME=
X-Received: by 2002:a2e:6e0c:: with SMTP id j12mr562890ljc.92.1644934202134;
 Tue, 15 Feb 2022 06:10:02 -0800 (PST)
MIME-Version: 1.0
References: <87h79bgd1m.fsf@linaro.org>
In-Reply-To: <87h79bgd1m.fsf@linaro.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Feb 2022 15:09:43 +0100
Message-ID: <CAKfTPtDADbQfe2_mQQObgRL-BnakXvpK2EMDTTbok0V8b1bd-A@mail.gmail.com>
Subject: Re: Metadata and signalling channels for Zephyr virtio-backends on Xen
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, stratos-dev@op-lists.linaro.org, 
	xen-devel@lists.xenproject.org, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Arnd Bergmann <arnd.bergmann@linaro.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, Dmytro Firsov <dmytro_firsov@epam.com>, 
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

Sorry for the late reply but I was off last week. I will go through
the thread and try to answer open point

On Mon, 7 Feb 2022 at 11:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Hi Stefano,
>
> Vincent gave an update on his virtio-scmi work at the last Stratos sync
> call and the discussion moved onto next steps. Currently the demo setup
> is intermediated by a double-ended vhost-user daemon running on the
> devbox acting as a go between a number of QEMU instances representing
> the front and back-ends. You can view the architecture with Vincents
> diagram here:
>
>   https://docs.google.com/drawings/d/1YSuJUSjEdTi2oEUq4oG4A9pBKSEJTAp6hhc=
HKKhmYHs/edit?usp=3Dsharing
>
> The key virtq handling is done over the special carve outs of shared
> memory between the front end and guest. However the signalling is
> currently over a virtio device on the backend. This is useful for the
> PoC but obviously in a real system we don't have a hidden POSIX system
> acting as a go between not to mention the additional latency it causes
> with all those context switches.
>
> I was hoping we could get some more of the Xen experts to the next
> Stratos sync (17th Feb) to go over approaches for a properly hosted on
> Xen approach. From my recollection (Vincent please correct me if I'm
> wrong) of last week the issues that need solving are:
>
>  * How to handle configuration steps as FE guests come up
>
> The SCMI server will be a long running persistent backend because it is
> managing real HW resources. However the guests may be ephemeral (or just
> restarted) so we can't just hard-code everything in a DTB. While the
> virtio-negotiation in the config space covers most things we still need
> information like where in the guests address space the shared memory
> lives and at what offset into that the queues are created. As far as I'm
> aware the canonical source of domain information is XenStore
> (https://wiki.xenproject.org/wiki/XenStore) but this relies on a Dom0
> type approach. Is there an alternative for dom0less systems or do we
> need a dom0-light approach, for example using STR-21 (Ensure Zephyr can
> run cleanly as a Dom0 guest) providing just enough services for FE's to
> register metadata and BE's to read it?
>
>  * How to handle mapping of memory
>
> AIUI the Xen model is the FE guest explicitly makes grant table requests
> to expose portions of it's memory to other domains. Can the BE query the
> hypervisor itself to discover the available grants or does it require
> coordination with Dom0/XenStore for that information to be available to
> the BE domain?

I have noticed that it was possible to share memory between VMs in the
VM config file which seem to be quite similar to what is done with
qemu to share memory object between VMs
>
>  * How to handle signalling
>
> I guess this requires a minimal implementation of the IOREQ calls for
> Zephyr so we can register the handler in the backend? Does the IOREQ API
> allow for a IPI style notifications using the global GIC IRQs?
>
> Forgive the incomplete notes from the Stratos sync, I was trying to type
> while participating in the discussion so hopefully this email captures
> what was missed:
>
>   https://linaro.atlassian.net/wiki/spaces/STR/pages/28682518685/2022-02-=
03+Project+Stratos+Sync+Meeting+Notes
>
> Vincent, anything to add?

I want to use an interface that is not tied to an hypervisor that's
why i have reused the virtio_mmio to emulate the device side where the
backend can get virtqueue description

>
> --
> Alex Benn=C3=A9e

