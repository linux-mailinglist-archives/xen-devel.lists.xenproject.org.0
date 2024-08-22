Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33CA95BF8A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 22:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781978.1191453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shEQk-00050V-Mt; Thu, 22 Aug 2024 20:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781978.1191453; Thu, 22 Aug 2024 20:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shEQk-0004xy-J6; Thu, 22 Aug 2024 20:29:14 +0000
Received: by outflank-mailman (input) for mailman id 781978;
 Thu, 22 Aug 2024 20:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z8t6=PV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1shEQi-0004wZ-G7
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 20:29:12 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30163e7d-60c5-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 22:29:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0E7E6A41C9A;
 Thu, 22 Aug 2024 20:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91718C32782;
 Thu, 22 Aug 2024 20:29:08 +0000 (UTC)
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
X-Inumbo-ID: 30163e7d-60c5-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724358549;
	bh=ydtin9HkoF6QTW34g+HZHLPPVH2Wjjm2tpLx112Xjj8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NtAmKdUGM3MlU4x/LM77B9dYyd6wdlDt7ukJCjKpqe5UAbiBeQDSLO0djJ0VJsDSS
	 66BrlxWkbhra8XQkwC2hbX4Mp3Eo8CkxAJbT6KoS4P2+G3y1Gefxa38ncDySbdySa+
	 6EVlyEL/hBKyr5MSmu1h1E4R92C+1/TxMB8SRITxSvkAV7dKt+IJxkFax5HG88e/3t
	 P83JqSZJH1zR5EqnRdjtdW/32I17rFfjmTxaVK/OrV6ej2Xw3UfPQgQk5rguZCu3O1
	 eEFvy6MMmgNgG/ac5ZPiNH3v9AFhw3ifHEItBUfvWwSYlSq+c9b53kMHoDq+81dO3l
	 uM/9/rZSTmxsA==
Date: Thu, 22 Aug 2024 13:29:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for generic timer
In-Reply-To: <D3358591-F9E2-44A6-A22A-FC2AA8857C68@arm.com>
Message-ID: <alpine.DEB.2.22.394.2408221327400.3871186@ubuntu-linux-20-04-desktop>
References: <20240820103816.1661102-1-ayan.kumar.halder@amd.com> <5F0AF572-3437-4372-96EB-42F46B3A3155@arm.com> <101a7105-5638-4c69-a5b0-29c252284aea@amd.com> <D3358591-F9E2-44A6-A22A-FC2AA8857C68@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Aug 2024, Bertrand Marquis wrote:
> > On 22 Aug 2024, at 11:00, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > Hi Bertrand,
> > 
> > I agree with all your comments with a few exceptions, as stated below.
> > 
> > On 21/08/2024 17:06, Bertrand Marquis wrote:
> >> 
> >> 
> >> Hi Ayan,
> >> 
> >>> On 20 Aug 2024, at 12:38, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
> >>> 
> >>> From: Michal Orzel <michal.orzel@amd.com>
> >>> 
> >>> Add the requirements for the use of generic timer by a domain
> >>> 
> >>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> >>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> >>> ---
> >>> .../reqs/design-reqs/arm64/generic-timer.rst  | 139 ++++++++++++++++++
> >>> docs/fusa/reqs/index.rst                      |   3 +
> >>> docs/fusa/reqs/intro.rst                      |   3 +-
> >>> docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
> >>> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  24 +++
> >>> 5 files changed, 202 insertions(+), 1 deletion(-)
> >>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> >>> create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
> >>> create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst
> >>> 
> >>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> >>> new file mode 100644
> >>> index 0000000000..bdd4fbf696
> >>> --- /dev/null
> >>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
> >>> @@ -0,0 +1,139 @@
> >>> +.. SPDX-License-Identifier: CC-BY-4.0
> >>> +
> >>> +Generic Timer
> >>> +=============
> >>> +
> >>> +The following are the requirements related to ARM Generic Timer [1] interface
> >>> +exposed by Xen to Arm64 domains.
> >>> +
> >>> +Probe the Generic Timer device tree node from a domain
> >>> +------------------------------------------------------
> >>> +
> >>> +`XenSwdgn~arm64_generic_timer_probe_dt~1`
> >>> +
> >>> +Description:
> >>> +Xen shall generate a device tree node for the Generic Timer (in accordance to
> >>> +ARM architected timer device tree binding [2]).
> >> 
> >> You might want to say where here. The domain device tree ?
> >> 
> >>> +
> >>> +Rationale:
> >>> +
> >>> +Comments:
> >>> +Domains shall probe the Generic Timer device tree node.
> >> 
> >> Please prevent the use of "shall" here. I would use "can".
> >> Also detect the presence of might be better than probe.
> >> 
> >>> +
> >>> +Covers:
> >>> + - `XenProd~emulated_timer~1`
> >>> +
> >>> +Read system counter frequency
> >>> +-----------------------------
> >>> +
> >>> +`XenSwdgn~arm64_generic_timer_read_freq~1`
> >>> +
> >>> +Description:
> >>> +Xen shall expose the frequency of the system counter to the domains.
> >> 
> >> The requirement would need to say in CNTFRQ_EL0 and in the domain device tree xxx entry.
> >> 
> >>> +
> >>> +Rationale:
> >>> +
> >>> +Comments:
> >>> +Domains shall read it via CNTFRQ_EL0 register or "clock-frequency" device tree
> >>> +property.
> >> 
> >> I do not think this comment is needed.
> >> 
> >>> +
> >>> +Covers:
> >>> + - `XenProd~emulated_timer~1`
> >>> +
> >>> +Access CNTKCTL_EL1 system register from a domain
> >>> +------------------------------------------------
> >>> +
> >>> +`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
> >>> +
> >>> +Description:
> >>> +Xen shall expose counter-timer kernel control register to the domains.
> >> 
> >> "counter-timer kernel" is a bit odd here, is it the name from arm arm ?
> >> Generic Timer control registers ? or directly the register name.
> > This is the name from Arm ARM. See e.g.:
> > https://developer.arm.com/documentation/ddi0601/2023-12/AArch64-Registers/CNTKCTL-EL1--Counter-timer-Kernel-Control-Register?lang=en
> 
> Right then i would use the same upper cases: Counter-timer Kernel Control
> register and still mention CNTKCTL_EL1 as it would be clearer.
> 
> > 
> >> 
> >>> +
> >>> +Rationale:
> >>> +
> >>> +Comments:
> >>> +Domains shall access the counter-timer kernel control register to allow
> >>> +controlling the access to the timer from userspace (EL0).
> >> 
> >> This is documented in the arm arm, this comment is not needed.
> >> 
> >>> +
> >>> +Covers:
> >>> + - `XenProd~emulated_timer~1`
> >>> +
> >>> +Access virtual timer from a domain
> >>> +----------------------------------
> >>> +
> >>> +`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
> >>> +
> >>> +Description:
> >>> +Xen shall expose the virtual timer registers to the domains.
> >>> +
> >>> +Rationale:
> >>> +
> >>> +Comments:
> >>> +Domains shall access and make use of the virtual timer by accessing the
> >>> +following system registers:
> >>> +CNTVCT_EL0,
> >>> +CNTV_CTL_EL0,
> >>> +CNTV_CVAL_EL0,
> >>> +CNTV_TVAL_EL0.
> >> 
> >> The requirement to be complete should give this list, not the comment.
> >> 
> >>> +
> >>> +Covers:
> >>> + - `XenProd~emulated_timer~1`
> >>> +
> >>> +Access physical timer from a domain
> >>> +-----------------------------------
> >>> +
> >>> +`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
> >>> +
> >>> +Description:
> >>> +Xen shall expose physical timer registers to the domains.
> >>> +
> >>> +Rationale:
> >>> +
> >>> +Comments:
> >>> +Domains shall access and make use of the physical timer by accessing the
> >>> +following system registers:
> >>> +CNTPCT_EL0,
> >>> +CNTP_CTL_EL0,
> >>> +CNTP_CVAL_EL0,
> >>> +CNTP_TVAL_EL0.
> >> 
> >> same as upper
> >> 
> >>> +
> >>> +Covers:
> >>> + - `XenProd~emulated_timer~1`
> >>> +
> >>> +Trigger the virtual timer interrupt from a domain
> >>> +-------------------------------------------------
> >>> +
> >>> +`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
> >>> +
> >>> +Description:
> >>> +Xen shall enable the domains to program the virtual timer to generate the
> >>> +interrupt.
> >> 
> >> I am not sure this is right here.
> >> You gave access to the registers upper so Xen responsibility is not really to
> >> enable anything but rather make sure that it generates an interrupt according to
> >> how the registers have been programmed.
> > I'm in two minds about it. On one hand you're right and the IRQ trigger is a side-effect
> > of programming the registers correctly. On the other, these are design requirements which
> > according to "fusa/reqs/intro.rst" describe what SW implementation is doing. Our way of injecting
> > timer IRQs into guests is a bit different (phys timer is fully emulated and we use internal timers
> > and for virt timer we first route IRQ to Xen, mask the IRQ and inject to guest). If I were to write
> > tests to cover Generic Timer requirements I'd expect to cover whether r.g. masking/unmasking IRQ works,
> > whether IRQ was received, etc.
> 
> This is true but i think it would be more logic in non design requirements to
> phrase things to explain the domain point of view rather than how it is implemented.
> 
> Here the point is to have a timer fully functional from guest point of view, including
> getting interrupts when the timer should generate one.
> 
> Maybe something like: Xen shall generate timer interrupts to domains when the timer condition asserts.

Both statements are correct.

Michal's original statement "Xen shall enable the domains to program the
virtual timer to generate the interrupt" is correct. The timer interrupt
will be generated by the hardware to Xen, if the guest programs the
registers correctly. If Xen does nothing, the interrupt is still
generated and received by Xen.

Bertrand's statement is also correct. Xen needs to generate a virtual
timer interrupt equivalent to the physical timer interrupt, after
receiving the physical interrupt.

I think the best statement would be a mix of the two, something like:

Xen shall enable the domain to program the virtual timer to generate
the interrupt, which Xen shall inject as virtual interrupt into the
domain.


That said, I also think that any one of these three statements is good
enough.

