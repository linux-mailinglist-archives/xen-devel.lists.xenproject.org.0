Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A7E644D4E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 21:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455522.713005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ec3-0002zL-9m; Tue, 06 Dec 2022 20:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455522.713005; Tue, 06 Dec 2022 20:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ec3-0002x8-6x; Tue, 06 Dec 2022 20:32:23 +0000
Received: by outflank-mailman (input) for mailman id 455522;
 Tue, 06 Dec 2022 20:32:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2ec1-0002x2-OG
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 20:32:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2ec0-0001Zx-Ij; Tue, 06 Dec 2022 20:32:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2ec0-0000Ee-CH; Tue, 06 Dec 2022 20:32:20 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=M5saToTnZSTFDjMAb30/BVdrvc0n0AcaM3qD1/EZaII=; b=kmkPUurOF28++ONVNlpPw1b98f
	aXncdTi/iCad2wSKXIrmWk56Xkdy9DsTt5pIDOIm0Iu9YIPdk87YLmUv2aglLlAPsCIQYevUkt1iB
	dxDS3ME/cNunFr5hcq7JCGDDyrLee2YYTujoMHTue0RnhpSj8ore0JD7VO4QIRKrhgT8=;
Message-ID: <1af48fce-b234-1f08-3882-8f071893dc3c@xen.org>
Date: Tue, 6 Dec 2022 20:32:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <cover.1665128335.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 00/19] xen/arm64: Suspend to RAM support for Xen
In-Reply-To: <cover.1665128335.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 14:08, Mykyta Poturai wrote:
> This is a series from Mirela Simonovic. Ported to 4.16 and with
> added changes suggested here
> https://lore.kernel.org/all/CAKPH-NjmaZENb8gT=+FobrAycRF01_--6GuRA2ck9Di5wiudhA@mail.gmail.com
> 
> This series contains support for suspend to RAM (in the following text just
> 'suspend') for Xen on arm64. The implementation is aligned with the design
> specification that has been proposed on xen-devel list:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html
> 
> At a high-level the series contains:
> 1) Support for suspending guests via virtual PSCI SYSTEM_SUSPEND call
> 2) Support for resuming a guest on an interrupt targeted to that guest
> 3) Support for suspending Xen after dom0 finalizes the suspend
> 4) Support for resuming Xen on an interrupt that is targeted to a guest

 From the previous discussion, there were a few dubious code in 
cpu_disable() (e.g. mdelay()). So did you go through the code to confirm 
it is fully Arm compliant?

> 
> 
> --------------------------------------------------------------------------------
> In more details:
> 
> *** About suspending/resuming guests
> 
> The patches included in this series allow PSCI compliant guests that have
> support for suspend to RAM (e.g. echo mem > /sys/power/state in Linux) to
> suspend and resume on top of Xen without any EL1 code changes.

What's the mechanism to tell the guest to suspend?

> 
> During their suspend procedure guests will hot-unplug their secondary CPUs,
> triggering Xen's virtual CPU_OFF PSCI implementation, and then finalize the
> suspend from their boot CPU, triggering Xen's virtual SYSTEM_SUSPEND PSCI.
> Guests will save/restore their own EL1 context on suspend/resume.
> 
> A guest is expected to leave enabled interrupts that are considered to be its
> wake-up sources. Those interrupts will be able to wake up the guest. This holds
> regardless of the state of the underlying software layers, i.e. whether Xen gets
> suspended or not doesn't affect the ability of the guest to wake up.
> 
> First argument of SYSTEM_SUSPEND PSCI call is a resume entry point, from which
> the guest assumes to start on resume. On resume, guests assume to be running in
> an environment whose state matches the CPU state after reset, e.g. with reset
> register values, MMU disabled, etc. To ensure this, Xen has to 'reset' the
> VCPU context and save the resume entry point into program counter before the
> guest's VCPU gets scheduled in on resume. This is done when the guest resumes.
> Xen also needs to take care that the guest's view of GIC and timer gets saved.
> Also, while a guest is suspended its watchdogs are paused, in order to avoid
> watchdog triggered shutdown of a guest that has been asleep for a period of time
> that is longer than the watchdog period.
> 
> After this point, from Xen's point of view a suspended guest has one VCPU
> blocked, waiting for an interrupt. When such an interrupt comes, Xen will
> unblock the VCPU of the suspended domain, which results in the guest
> resuming.
> 
> *** About suspending/resuming Xen
> 
> Xen starts its own suspend procedure once dom0 is suspended. Dom0 is
> considered to be the decision maker for EL1 and EL2.

Can you explain why dom0 is the decision maker here? Also, what about 
cases where there is no dom0?

> On suspend, Xen will first freeze all domains. Then, Xen disables physical
> secondary CPUs, which leads to physical CPU_OFF to be called by each secondary
> CPU. After that Xen finalizes the suspend from the boot CPU.
> 
> This consists of suspending the timer, i.e. suppressing its interrupts (we don't
> want to be woken up by a timer, there is no VCPU ready to be scheduled). Then
> the state of GIC is saved, console is suspended, and CPU context is saved. The
> saved context tells where Xen needs to continue execution on resume.
> Since Xen will resume with MMU disabled, the first thing to do in resume is to
> resume memory management in order to be able to access the context that needs to
> be restored (we know virtual address of the context data). Finally Xen calls
> SYSTEM_SUSPEND PSCI to the EL3.
> 
> When resuming, all the steps done in suspend need to be reverted. This is
> completed by unblocking dom0's VCPU, because we always want the dom0 to
> resume,
> regardless of the target domain whose interrupt woke up Xen.
> 
> *** Handling of unprivileged guests during Xen suspend/resume
> 
> Any domU that is not suspended when dom0 suspends will be frozen,
Wouldn't this mess up with the timers in the guest OS?

> domUs that are
> already suspended remain suspended. On resume the suspended domUs still remain
> suspended (unless their wake interrupt caused Xen to wake) while the
> others will be thawed.
> 
> For more details please refer to patches or the design specification:
> https://lists.xenproject.org/archives/html/xen-devel/2017-12/msg01574.html

This is a 5 years old design and there were some comments on it. So I 
think it would be best if a new version is sent.

Cheers,

-- 
Julien Grall

