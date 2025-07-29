Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E6B15507
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 00:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063173.1428976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsNu-0008NJ-2z; Tue, 29 Jul 2025 22:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063173.1428976; Tue, 29 Jul 2025 22:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsNu-0008LS-0F; Tue, 29 Jul 2025 22:01:22 +0000
Received: by outflank-mailman (input) for mailman id 1063173;
 Tue, 29 Jul 2025 22:01:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqJK=2K=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ugsNt-0008K0-4r
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 22:01:21 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dd0e00a-6cc7-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 00:01:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8CFCCA54783;
 Tue, 29 Jul 2025 22:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF3BC4CEEF;
 Tue, 29 Jul 2025 22:00:51 +0000 (UTC)
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
X-Inumbo-ID: 8dd0e00a-6cc7-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753826477;
	bh=YzY0pZQ5CNB3mUOmFJs4Gb9SLHFXYoOWQkxK9A7ImZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QhHK+C9n9fBYPc7VHil0fdJxFuz1gBRlH9N12GdX1fI6s1JtADDOJ+RmV7McvS9Se
	 WU+NtFYFEfAl0TN7ikLXV9tSzKH9q28c0CuGIKJwafXV75HLm/1Oz02ZsE8DHLMQcT
	 0fhbpqWzucmrcfgyQYqaI6g4zFJQtfSP8WHwqVK1DtMp3HsB726i1PoS4rc5uLPJNw
	 6aQLGdZULd9A6JEovBkNkH3LIRjLKGOxXj2lMlbGgteDSMQS0nrC0/BvaNgh8lhXSR
	 RWelkFNmRXmswp9csecsEGv+WcKhS3oKp12S7OSStKNehFM9uKU+f2OhjReCysY5bt
	 c9a0cT+Z1DxNw==
Date: Tue, 29 Jul 2025 15:00:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, Paul Durrant <paul@xen.org>, 
    Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, 
    George Dunlap <gwd@xenproject.org>, Meng Xu <mengxu@cis.upenn.edu>
Subject: Re: [RFC PATCH 3/3] misra: address rule 5.5 bitops
In-Reply-To: <c641e58c-96e8-4fce-8bd9-5d00bf93157a@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2507291500260.468590@ubuntu-linux-20-04-desktop>
References: <cover.1753822074.git.dmytro_prokopchuk1@epam.com> <a9e8d00533d6707a7649a487dc8696c2302634f6.1753822074.git.dmytro_prokopchuk1@epam.com> <c641e58c-96e8-4fce-8bd9-5d00bf93157a@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1017223861-1753826476=:468590"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1017223861-1753826476=:468590
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 29 Jul 2025, Andrew Cooper wrote:
> On 29/07/2025 10:24 pm, Dmytro Prokopchuk1 wrote:
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> > ---
> >  xen/arch/arm/dm.c                          |  2 +-
> >  xen/arch/arm/domctl.c                      |  2 +-
> >  xen/arch/arm/gic-vgic.c                    | 26 +++++++++++-----------
> >  xen/arch/arm/gic.c                         |  8 +++----
> >  xen/arch/arm/include/asm/cpufeature.h      |  2 +-
> >  xen/arch/arm/include/asm/gic.h             |  2 +-
> >  xen/arch/arm/include/asm/guest_atomics.h   |  4 ++--
> >  xen/arch/arm/irq.c                         | 16 ++++++-------
> >  xen/arch/arm/tee/ffa_partinfo.c            |  2 +-
> >  xen/arch/arm/tee/ffa_private.h             |  2 +-
> >  xen/arch/arm/traps.c                       |  2 +-
> >  xen/arch/arm/vgic-v3-its.c                 |  6 ++---
> >  xen/arch/arm/vgic.c                        | 10 ++++-----
> >  xen/arch/arm/vgic/vgic-mmio.c              |  2 +-
> >  xen/arch/arm/vgic/vgic.c                   |  2 +-
> >  xen/arch/arm/vpsci.c                       |  4 ++--
> >  xen/arch/riscv/cpufeature.c                |  2 +-
> >  xen/arch/riscv/include/asm/guest_atomics.h |  2 +-
> >  xen/arch/x86/cpu-policy.c                  | 14 ++++++------
> >  xen/arch/x86/cpu/amd.c                     |  2 +-
> >  xen/arch/x86/cpu/common.c                  | 14 ++++++------
> >  xen/arch/x86/cpu/mcheck/x86_mca.h          |  2 +-
> >  xen/arch/x86/domain.c                      |  2 +-
> >  xen/arch/x86/e820.c                        |  4 ++--
> >  xen/arch/x86/guest/xen/xen.c               |  2 +-
> >  xen/arch/x86/hvm/emulate.c                 |  2 +-
> >  xen/arch/x86/hvm/hpet.c                    |  6 ++---
> >  xen/arch/x86/hvm/irq.c                     | 12 +++++-----
> >  xen/arch/x86/hvm/svm/nestedsvm.c           | 10 ++++-----
> >  xen/arch/x86/hvm/svm/svm.c                 |  2 +-
> >  xen/arch/x86/hvm/viridian/time.c           |  4 ++--
> >  xen/arch/x86/hvm/vlapic.c                  |  2 +-
> >  xen/arch/x86/hvm/vmx/vmcs.c                |  8 +++----
> >  xen/arch/x86/hvm/vmx/vmx.c                 |  4 ++--
> >  xen/arch/x86/include/asm/guest_atomics.h   |  2 +-
> >  xen/arch/x86/include/asm/hvm/vlapic.h      |  2 +-
> >  xen/arch/x86/include/asm/hvm/vmx/vmx.h     |  2 +-
> >  xen/arch/x86/include/asm/mpspec.h          |  2 +-
> >  xen/arch/x86/irq.c                         | 26 +++++++++++-----------
> >  xen/arch/x86/mm.c                          |  8 +++----
> >  xen/arch/x86/mm/hap/hap.c                  |  2 +-
> >  xen/arch/x86/mm/paging.c                   |  4 ++--
> >  xen/arch/x86/mm/shadow/common.c            |  2 +-
> >  xen/arch/x86/mm/shadow/hvm.c               |  4 ++--
> >  xen/arch/x86/monitor.c                     |  4 ++--
> >  xen/arch/x86/msi.c                         |  2 +-
> >  xen/arch/x86/psr.c                         |  2 +-
> >  xen/arch/x86/pv/dom0_build.c               |  4 ++--
> >  xen/arch/x86/pv/emul-priv-op.c             |  2 +-
> >  xen/arch/x86/pv/shim.c                     |  2 +-
> >  xen/arch/x86/traps.c                       |  2 +-
> >  xen/arch/x86/x86_64/mm.c                   |  2 +-
> >  xen/arch/x86/x86_64/mmconfig_64.c          |  2 +-
> >  xen/arch/x86/xstate.c                      |  4 ++--
> >  xen/common/domain.c                        |  4 ++--
> >  xen/common/efi/runtime.c                   |  2 +-
> >  xen/common/event_2l.c                      |  2 +-
> >  xen/common/kexec.c                         | 16 ++++++-------
> >  xen/common/keyhandler.c                    |  2 +-
> >  xen/common/multicall.c                     |  2 +-
> >  xen/common/numa.c                          |  4 ++--
> >  xen/common/page_alloc.c                    |  4 ++--
> >  xen/common/pdx.c                           |  2 +-
> >  xen/common/sched/core.c                    | 12 +++++-----
> >  xen/common/sched/credit.c                  | 12 +++++-----
> >  xen/common/sched/credit2.c                 |  6 ++---
> >  xen/common/sched/rt.c                      |  4 ++--
> >  xen/common/vmap.c                          | 12 +++++-----
> >  xen/drivers/passthrough/iommu.c            |  2 +-
> >  xen/drivers/passthrough/vtd/dmar.c         |  4 ++--
> >  xen/drivers/passthrough/vtd/iommu.c        |  4 ++--
> >  xen/drivers/passthrough/x86/hvm.c          |  2 +-
> >  xen/drivers/passthrough/x86/iommu.c        |  2 +-
> >  xen/drivers/vpci/vpci.c                    |  4 ++--
> >  xen/include/xen/bitops.h                   |  8 +++----
> >  xen/include/xen/cpumask.h                  |  6 ++---
> >  xen/include/xen/nodemask.h                 |  2 +-
> >  xen/include/xen/sched.h                    |  4 ++--
> >  78 files changed, 194 insertions(+), 194 deletions(-)
> 
> I'm sorry, but as Jan indicated, this is a non-starter.  Not least
> because it's an API we've inherited from Linux, and want to keep for
> familiarity.
> 
> Do whatever is necessary in the Eclair config to placate the check, and
> at some point in the future I'll make the problem go away and delete the
> deviation.
 
I think at least bitops should be deviated.
--8323329-1017223861-1753826476=:468590--

