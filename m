Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF94ABF2D9B
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 20:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146819.1479181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAuCC-0007mG-CY; Mon, 20 Oct 2025 18:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146819.1479181; Mon, 20 Oct 2025 18:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAuCC-0007kX-9P; Mon, 20 Oct 2025 18:01:24 +0000
Received: by outflank-mailman (input) for mailman id 1146819;
 Mon, 20 Oct 2025 18:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lz8M=45=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vAuCB-0007kR-As
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 18:01:23 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8c96d14-adde-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 20:01:21 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-57ea78e0618so5386170e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 11:01:21 -0700 (PDT)
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
X-Inumbo-ID: c8c96d14-adde-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983280; x=1761588080; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1YLNFjRs0TA+0dHt8vGa7mAWHo1dEa27OGdap+OqmY=;
        b=mFWj3QYhg2251/+xqsfuxKra2BhMrb52ebdn1mozwA5tqxb8iJOxnrgGR/Dhhs1q0z
         mDu9terB0IiJEcM2fH17RFk2xhNzGFar8ntAtXmyVnMktnpdblmVvFCwmwuYawG3u1+y
         wpglki8QrWSOrd0k0fSVE2rLtEfof3S5J3v443IAKWKEbLBEuezU2Zx0ruLZdjKt9tl7
         ekCQ11pIJnWYipVdnT2yTMtcO6Cv9Qx5ykUfPUhjSyf1Uo3h6z0a0TID8aeBbq8BXj3B
         c1VuGoplkM0ip5CIuEOpq5q8q4UfAS9ZwOABVQ7gjJnOIDy5nfakV0Cm8z9iruDPPw+s
         Bd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983280; x=1761588080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1YLNFjRs0TA+0dHt8vGa7mAWHo1dEa27OGdap+OqmY=;
        b=rVFaBAL+fEVzhlfkhwsUhig07TbKNkbByC1/2Vp8+BSX9z9HC2wSWupuJw+pGuEMJ+
         ODyp28juVrEeqWXqIVJFY0UdgJWkXiKUtSTT/KrrALnVvsSe9tk1D+pTgsqbUXMnrNIU
         9hB11MOkgfuv5oXuKCYgFrft5sfLfaZGV1dYF3aneP8JJ5Mta0o+OEqRuxpVK4SAxNu3
         RGNiAOX4dRtx76sn+YVOHpJhnYFjQz069HLdGSy22ACmvVuTerBTiPzFRqgmq/j1xIFo
         aEr779zJuxs7d0oVmtVdoO+EBFFgUz60gOTt7OyR2eRBYdbNfGrCOz5rUnKbk8HE+/u9
         TGNg==
X-Gm-Message-State: AOJu0YwL1zX1v8mZ+ZmceqTRK7sWCXRezY54/W1IPVpb9k/a3ovAq9TS
	ZydPz8SJmyzir0UQLPbN4z4X7dEM3jH+ag+LcPrb9BGVi/2UX1DscFvQZVtqMzyo/4EbByx6Wfk
	VpMaVP5kAeQ9BUhRkJlE8S6Vlu3E7kec=
X-Gm-Gg: ASbGncvWPDY5rI/JkNA+6dqcqcpw2jCt/6Z1Iqn+nPWp8yIvWAB6TaCK+lI3Hc/K4pi
	+yj/+lCKENAMPScn71myMN12wRczBxgl97kMmUVT2zq/CUAYqIG8kumeofyQsYFOHbQWZdloVjM
	rQoaoS7jcLKLjfTctIVfsjNm7m7F0Jir+Eh21b0jgQTcZHZxrbxmkRxWg00uX5Ol91TkoGe0Z7z
	JS5O6gu9pmtiDhEvs8WAj6QIYSaPW5UQbBEQG0MTfkwgbMdbzPysEOu0IvL88u3As9Y/uQOaUM8
	ssJGYA==
X-Google-Smtp-Source: AGHT+IEKMNZm+sfa9Ln5Pe7VvNXiRBWsTRIFeil/C1huChu9kT/JEI7aJYKcqgpWni9Nfx1cSjdaaYvz9OxSpZ0P9Dw=
X-Received: by 2002:ac2:4e0c:0:b0:590:7b29:77c8 with SMTP id
 2adb3069b0e04-591d854a485mr5190959e87.17.1760983280274; Mon, 20 Oct 2025
 11:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760083684.git.mykyta_poturai@epam.com> <CAGeoDV-=ON+WSvCQnjaa9zU_74RuFHXrqa5+p8dAjM9fxpomxw@mail.gmail.com>
 <2728d969-06fa-4f35-95a1-a79dd441242f@epam.com>
In-Reply-To: <2728d969-06fa-4f35-95a1-a79dd441242f@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 20 Oct 2025 21:00:00 +0300
X-Gm-Features: AS18NWAWedoCY2fOqxC0274T6O3iVZAsv7fgmMCKHw7WVys9SirOjd30rbAg84E
Message-ID: <CAGeoDV-0VVDzR-+OkK0y+_=xs-dzZnc2ZcQSs7DTUVOJn72QLA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Implement CPU hotplug on Arm
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mykyta,

Thank you for your answers

On Mon, Oct 20, 2025 at 5:15=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam=
.com> wrote:
>
> On 15.10.25 20:30, Mykola Kvach wrote:
> > Hi Mykyta,
> >
> > Thanks for the series.
> >
> > It seems there might be issues here -- please take a look and let me
> > know if my concerns are valid:
> >
> > 1. FF-A notification IRQ: after a CPU down->up cycle the IRQ
> > configuration may be lost.
>
> OPTEE and FFA are marked as unsupported.

Understood, thanks. Would it be worth documenting this?

>
> > 2. GICv3 LPIs: a CPU may fail to come back up unless its LPI pending
> > table exists (is allocated) on bring-up. See
> > gicv3_lpi_allocate_pendtable() and its call chain.
>
> ITS is marked as unsupported. I have a plan to deal with this, but it is
> out of scope of this series.

Thanks for the clarification. Should we document this somewhere?

>
> > 3. IRQ migration on CPU down: if an IRQ targets a CPU being offlined,
> > its affinity should be moved to an online CPU before completing the
> > offlining.
>
> All guest tied IRQ migration is handled by the scheduler. Regarding the
> irqs used by Xen, I didn't find any with affinity to other CPUs than CPU
> 0, which can't be disabled. I think theoretically it is possible for
> them to have different affinity, but it seems unlikely considering that
> x86 hotplug code also doesn't seem to do any Xen irq migration AFAIU.

What about arm_smmu_init_domain_context and its related call chains?
As far as I can see, some of these paths touch XEN_DOMCTL_* hypercalls,
and my understanding is they can be issued on any CPU. Should we add a
check that no enabled (e)SPIs owned by Xen are pinned to the offlining
CPU?

>
> > 4. Race between the new hypercalls and disable/enable_nonboot_cpus():
> > disable_nonboot_cpus is called, enable_nonboot_cpus() reads
> > frozen_cpus, and before it calls cpu_up() a hypercall onlines the CPU.
> > cpu_up() then fails as "already online", but the CPU_RESUME_FAILED
> > path may still run for an already-online CPU, risking use-after-free
> > of per-CPU state (e.g. via free_percpu_area()) and other issues
> > related to CPU_RESUME_FAILED notification.
> >
>
> There don't seem to be any calls to disable/enable_nonboot_cpus() on
> Arm. If we take x86 as an example, then they are called with all domains
> already paused, and I don't see how paused domains can issue hypercalls.

Agreed; this looks even less likely given that disable_* runs on CPU0 and
your new hypercalls execute on CPU0. The only plausible issue would be a
contrived case where code disables non-boot CPUs from CPU0 but enables them
from another CPU woken by a hypercall. That seems unrealistic.

>
> >
> > Best regards,
> > Mykola
>
> --
> Mykyta

Best regards,
Mykola

