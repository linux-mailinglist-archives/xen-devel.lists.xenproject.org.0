Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D228ACFA50
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 02:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007734.1387003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKe1-0003Oj-4d; Fri, 06 Jun 2025 00:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007734.1387003; Fri, 06 Jun 2025 00:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNKe1-0003MO-0V; Fri, 06 Jun 2025 00:09:13 +0000
Received: by outflank-mailman (input) for mailman id 1007734;
 Fri, 06 Jun 2025 00:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNKe0-0003Ie-8H
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 00:09:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78043bd3-426a-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 02:09:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D6FE85C563C;
 Fri,  6 Jun 2025 00:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D0B6C4CEE7;
 Fri,  6 Jun 2025 00:09:06 +0000 (UTC)
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
X-Inumbo-ID: 78043bd3-426a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749168548;
	bh=V4uGtqs0QvK0S+Uq3jDGTv7De4yMkb77VND9KJjkUfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T1Hhd76ziWeF5BctAc/kRCSfnV8eh/5Bu8rgHlSfdx2VBEqKYwq4idDAAkiyg/kHH
	 0MEW2J7AV99vojNqSSxb2HibPzviN7IbHH1CFmiDhyqaoSQyQN3OxfsV3kLEhdAeRl
	 M+wKtZKk20fNdY/PBjVAImTtWAoK61Fpn4AU96QSBE34hlAcF2T/cV9Qpa6O1qSYc3
	 vaCn8PPOoEVXBhWS6ttZNqKSbkuPA+lwAlptyiWo82QGSgPHNv/TdRlf9XN6GYciuA
	 SfwraKPP8b+UdFGG6+z+T23ka4oJEUXgfmvrrThmYeg0tENu7TpuJflzAjmOrZm77h
	 gKIU9ws6G5zhA==
Date: Thu, 5 Jun 2025 17:09:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, victorm.lira@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=83=C2=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] xen/keyhandler: add missing noreturn attribute
In-Reply-To: <b10f8e18-4009-4168-9946-5a7ae9fcee73@suse.com>
Message-ID: <alpine.DEB.2.22.394.2506051708520.2495561@ubuntu-linux-20-04-desktop>
References: <20250604235034.1595881-1-victorm.lira@amd.com> <9e3a7b1b-7fbe-428b-888a-c18c95d8ee37@suse.com> <b258936e289290321e9a8b2d23723fc2@bugseng.com> <3b24b1df1a0ce4a62b53067b09fe9a02@bugseng.com> <b10f8e18-4009-4168-9946-5a7ae9fcee73@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Jan Beulich wrote:
> On 05.06.2025 14:26, Nicola Vetrini wrote:
> > On 2025-06-05 14:22, Nicola Vetrini wrote:
> >> On 2025-06-05 09:17, Jan Beulich wrote:
> >>> On 05.06.2025 01:49, victorm.lira@amd.com wrote:
> >>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> >>>>
> >>>> Function `reboot_machine' does not return, but lacks the `noreturn' 
> >>>> attribute,
> >>>> therefore causing a violation of MISRA C Rule 2.1: "A project shall 
> >>>> not contain
> >>>> unreachable code".
> >>>
> >>> Is this (uniformly) true? Looking at ...
> >>>
> >>>> --- a/xen/common/keyhandler.c
> >>>> +++ b/xen/common/keyhandler.c
> >>>> @@ -251,7 +251,7 @@ static void cf_check 
> >>>> dump_hwdom_registers(unsigned char key)
> >>>>      }
> >>>>  }
> >>>>
> >>>> -static void cf_check reboot_machine(unsigned char key, bool unused)
> >>>> +static void noreturn cf_check reboot_machine(unsigned char key, bool 
> >>>> unused)
> >>>>  {
> >>>>      printk("'%c' pressed -> rebooting machine\n", key);
> >>>>      machine_restart(0);
> >>>
> >>> ... generated code here, I can see that the compiler is perfectly able 
> >>> to
> >>> leverage the noreturn that machine_restart() has, resulting in no
> >>> unreachable code to be generated. That is - neither in source nor in
> >>> binary there is any unreachable code. Therefore I'm having a hard time
> >>> seeing what the violation is here.
> >>>
> >>> That said, I certainly don't mind the addition of the (seemingly) 
> >>> missing
> >>> attribute. Otoh I wonder whether an attribute the removal of which has 
> >>> no
> >>> effect wouldn't count as "dead code" or alike, violating some other 
> >>> rule.
> >>>
> >>
> >> Inlining does not play a role in this case. Here reboot_machine() is 
> >> marked as a violation because machine_restart() is noreturn and there 
> >> is no other path upon which reboot_machine() may return, hence any 
> >> function calling reboot_machine() could have portions that are 
> >> inadvertently unreachable (as in never executed due to divergence) by 
> >> not having the annotation.
> 
> Just that there's not going to be a 2nd caller, considering the purpose
> of the function.
> 
> >> That said, in such trivial cases compilers 
> >> are typically able to derive the property automatically, but they are 
> >> not obliged to and, more importantly, the behavior may even differ with 
> >> the same compiler using different optimization levels.
> > 
> > Just a note: in later revisions of MISRA C this has become a rule of its 
> > own [1], which helps reduce confusion, but up to MISRA C:2012 Amendment 
> > 2 (currently used by Xen), this is part of Rule 2.1.
> > 
> > [1] Rule 17.11: "A function that never returns should be declared with a 
> > _Noreturn function specifier"
> 
> Oh, that's indeed quite a bit more explicit.

Does it mean you would ack the patch? :-)

