Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F2DCCE125
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 01:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190341.1510829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWOR6-0004H0-2P; Fri, 19 Dec 2025 00:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190341.1510829; Fri, 19 Dec 2025 00:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWOR5-0004EP-VR; Fri, 19 Dec 2025 00:33:35 +0000
Received: by outflank-mailman (input) for mailman id 1190341;
 Fri, 19 Dec 2025 00:33:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U+Ik=6Z=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vWOR5-0004EJ-0W
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 00:33:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589d0c54-dc72-11f0-b15b-2bf370ae4941;
 Fri, 19 Dec 2025 01:33:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 020CA60053;
 Fri, 19 Dec 2025 00:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C86C4AF09;
 Fri, 19 Dec 2025 00:33:29 +0000 (UTC)
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
X-Inumbo-ID: 589d0c54-dc72-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766104410;
	bh=SKpIYYg5LvhEolxzARMhQDVhZlSdet2k9GzqRmxdyIk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kSmFDdMASYkKE4bsTUeLDtf/Oo/Sk+y1ZlsZ7M7GehFhCiNnk8UubTW29jwOvlX47
	 6aE/6g4PE0NMATqCRcIVEOYZhny8Sp7Il+cRTESCjvA33Cis3thRg9SDFNhI33qg1r
	 4FdOp3WC7kE8OpruvAXLkLd7oyA8OUSjh43xF+xM6AzIH/fLLbZ3Vyg4Et4vIAfedV
	 QzLXSsbndVyPRrMQaNugaLDBZhygwaD3i36d7DaM0wB+ejMBmilLK5vQQ0lTu/LYfS
	 i7UOdGrywzYJUJEa+epSxYbt/QMlNCyHamFDspMhxUvIE75umfJJeYZCEvonTDsIpI
	 3t84Eneyg9yrA==
Date: Thu, 18 Dec 2025 16:33:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Grygorii Strashko <grygorii_strashko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN][PATCH v2 0/4] x86: pvh: allow to disable 32-bit (COMPAT)
 interface support
In-Reply-To: <e7e12bee-2b0b-4474-a64e-78f570432a3e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2512181629220.21522@ubuntu-linux-20-04-desktop>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com> <a4646368-2c91-4d57-846f-e7de51395627@epam.com> <e7e12bee-2b0b-4474-a64e-78f570432a3e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 18 Dec 2025, Jan Beulich wrote:
> On 18.12.2025 17:20, Grygorii Strashko wrote:
> > I'm planning to send v3 - so would be appreciated for any other comments.
> 
> Andrew,
> 
> could you please write down the outline of what you described verbally the
> other day, to scope the extent to which we may want to take changes here?

I am not Andrew, but I just wanted to take the opportunity to write down
my recollection, letting Andrew chime in as needed of course.

We would make it possible to remove the compat code itself and compat
hypercall entries. This would be acceptable right away.

When it comes to 32-bit code intermixed with 64-bit code, we would have
to look at it on a case by case basis.


 
> > On 19.11.25 21:30, Grygorii Strashko wrote:
> >> From: Grygorii Strashko <grygorii_strashko@epam.com>
> >>
> >> Hi
> >>
> >> This series introduces possibility to disable 32-bit (COMPAT) interface support
> >> in the following case:
> >>        - Only PVH domains are used
> >>        - Guests (OS) are started by using direct Direct Kernel Boot
> >>        - Guests (OS) are 64-bit and Guest early boot code, which is running not
> >>          in 64-bit mode, does not access Xen interfaces
> >>          (hypercalls, shared_info, ..)
> >>
> >> If above criterias are met the COMPAT HVM interface become unreachable and can be disabled.
> >> Coverage reports analyze and adding guard (debug) exceptions in hvm_hypercall/hvm_do_multicall_call
> >> and hvm_latch_shinfo_size() confirm that COMPAT HVM interface is unused for safety use-case.
> >>
> >> Changes in v2 described in each patch:
> >> - patch "x86: constify has_32bit_shinfo() if !CONFIG_COMPAT" squashed in patch 2.
> >>
> >> v1:
> >>   https://patchwork.kernel.org/project/xen-devel/cover/20251111175413.3540690-1-grygorii_strashko@epam.com/
> >>
> >> Grygorii Strashko (4):
> >>    x86: hvm: dm: factor out compat code under ifdefs
> >>    x86: hvm: compat: introduce is_hcall_compat() helper
> >>    x86: hvm: factor out COMPAT code under ifdefs
> >>    x86: pvh: allow to disable 32-bit interface support
> >>
> >>   xen/arch/x86/hvm/Kconfig          | 19 ++++++++++++++++++-
> >>   xen/arch/x86/hvm/dm.c             |  2 ++
> >>   xen/arch/x86/hvm/hvm.c            | 24 ++++++++++++++++++++----
> >>   xen/arch/x86/hvm/hypercall.c      | 22 +++++++++++++++++-----
> >>   xen/arch/x86/hypercall.c          |  6 +-----
> >>   xen/arch/x86/include/asm/domain.h |  9 +++++++--
> >>   xen/common/kernel.c               |  2 +-
> >>   xen/include/hypercall-defs.c      |  9 +++++++--
> >>   xen/include/xen/sched.h           |  9 +++++++++
> >>   9 files changed, 82 insertions(+), 20 deletions(-)
> >>
> > 
> 

