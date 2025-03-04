Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E322BA4D146
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 02:54:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900725.1308634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpHT7-0007x3-60; Tue, 04 Mar 2025 01:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900725.1308634; Tue, 04 Mar 2025 01:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpHT7-0007u7-1P; Tue, 04 Mar 2025 01:53:13 +0000
Received: by outflank-mailman (input) for mailman id 900725;
 Tue, 04 Mar 2025 01:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vBJn=VX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpHT5-0007u1-5c
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 01:53:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69154c7e-f89b-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 02:53:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 522795C4CF9;
 Tue,  4 Mar 2025 01:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96969C4CEE4;
 Tue,  4 Mar 2025 01:53:01 +0000 (UTC)
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
X-Inumbo-ID: 69154c7e-f89b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741053182;
	bh=TPNISjWfM+zvJh24Y6bFuVDa/IeBXCH3lhoI9DrOC/I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oEY6cswVuADv661s+4T/Gp/w/mBShdF71QP+ZNRiX1SamLvni9a/7IGvSrmWuEKo9
	 CcKuWrF2M23xIrp23rfy79FdrWxCAUD7IcVpW3RgNfCxoKkC7MFy4Q9qut3IX+nGy7
	 N4LsSbpwAs9bpU+orY9hpZ0T2hMCMqhxgC2pf9DPWrC1Wjn3UU23PkCSLT+lg9e3Hw
	 PBfXt4gsd+VqzZ3ba9L3fnr8T1b4nTU6+PMPwaoKstlVePZzSmLBn3+ughhQ2QofuC
	 MgcTjVZB4coPexqVi/N0zA8wHRmUcpd4W46BjPFl25SnwIpXAvHslfKVPQuhfCIFMC
	 74Rk5nTr7hirg==
Date: Mon, 3 Mar 2025 17:53:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: Don't cast away const-ness in
 vcpu_show_registers()
In-Reply-To: <f62841d3-b0e4-4007-a056-a807a19fc988@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503031747400.1303386@ubuntu-linux-20-04-desktop>
References: <20250225230213.1248136-1-andrew.cooper3@citrix.com> <7e77dceb-489b-4022-a665-2a008ddfe844@suse.com> <f62841d3-b0e4-4007-a056-a807a19fc988@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-928564290-1741052916=:1303386"
Content-ID: <alpine.DEB.2.22.394.2503031748410.1303386@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-928564290-1741052916=:1303386
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2503031748411.1303386@ubuntu-linux-20-04-desktop>

On Mon, 3 Mar 2025, Andrew Cooper wrote:
> On 26/02/2025 7:33 am, Jan Beulich wrote:
> > On 26.02.2025 00:02, Andrew Cooper wrote:
> >> The final hunk is `(struct vcpu *)v` in disguise, expressed using a runtime
> >> pointer chase through memory and a technicality of the C type system to work
> >> around the fact that get_hvm_registers() strictly requires a mutable pointer.
> >>
> >> For anyone interested, this is one reason why C cannot optimise any reads
> >> across sequence points, even for a function purporting to take a const object.
> >>
> >> Anyway, have the function correctly state that it needs a mutable vcpu.  All
> >> callers have a mutable vCPU to hand, and it removes the runtime pointer chase
> >> in x86.
> >>
> >> Make one style adjustment in ARM while adjusting the parameter type.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Anthony PERARD <anthony.perard@vates.tech>
> >> CC: Michal Orzel <michal.orzel@amd.com>
> >> CC: Jan Beulich <jbeulich@suse.com>
> >> CC: Julien Grall <julien@xen.org>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> >> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> >>
> >> RISC-V and PPC don't have this helper yet, not even in stub form.
> >>
> >> I expect there will be one objection to this patch.  Since the last time we
> >> fought over this, speculative vulnerabilities have demonstrated how dangerous
> >> pointer chases are, and this is a violation of Misra Rule 11.8, even if it's
> >> not reasonable for Eclair to be able to spot and reject it.
> > On these grounds
> > Acked-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Thanks.
> 
> > irrespective of the fact that a function of this name and purpose really, really
> > should be taking a pointer-to-const.
> 
> No - this is a perfect example of why most functions should *not* take
> pointer-to-const for complex objects.
> 
> There is no such thing as an actually-const vcpu or domain; they are all
> mutable.  The reason why x86 needs a strictly-mutable pointer is because
> it needs to take a spinlock to negotiate for access to a hardware
> resource to read some of the registers it needs.
> 
> This is where there is a semantic gap between "logically doesn't modify"
> and what the C keyword means.
> 
> Anything except the-most-trivial trivial predates may reasonably need to
> take a spinlock or some other safety primitive, even just to read
> information.
> 
> 
> Because this was gratuitously const in the first place, bad code was put
> in place of making the prototype match reality.
> 
> This demonstrates a bigger failing in how code is reviewed and
> maintained.  It is far too frequent that requests to const things don't
> even compile.  It is also far too frequent that requests to const things
> haven't read the full patch series to realise why not.  Both of these
> are a source of friction during review.
> 
> But more than that, even if something could technically be const right
> now, the request to do so forces churn into a future patch to de-const
> it in order to make a clean change.  And for contributors who aren't
> comfortable saying a firm no to a maintainer, this turns into a bad hack
> instead.
> 
> i.e. requests to const accessors for complexity objects are making Xen
> worse, not better, and we should stop doing it.
 
In general, functions like vcpu_show_registers, which have a clear
usage pattern, would seem to be ideal candidates for using const
parameters. However, as Andrew explained, when a function takes a
struct vcpu as a parameter, complexities often arise. This example with
the spinlock is a good way to explain the underlying risks.  

I don't know whether any general conclusions can be drawn from this
example, but in this case Andrew's reasoning is correct.
--8323329-928564290-1741052916=:1303386--

