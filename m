Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5573917B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 23:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553162.863561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC5MA-0000lL-4Z; Wed, 21 Jun 2023 21:27:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553162.863561; Wed, 21 Jun 2023 21:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC5MA-0000jV-1c; Wed, 21 Jun 2023 21:27:14 +0000
Received: by outflank-mailman (input) for mailman id 553162;
 Wed, 21 Jun 2023 21:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ+K=CJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qC5M8-0000jP-Kx
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 21:27:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6109a4fd-107a-11ee-b237-6b7b168915f2;
 Wed, 21 Jun 2023 23:27:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0397C616DC;
 Wed, 21 Jun 2023 21:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDB2C433C8;
 Wed, 21 Jun 2023 21:27:06 +0000 (UTC)
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
X-Inumbo-ID: 6109a4fd-107a-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687382828;
	bh=LTwcw+kn3NeCOrzQob9a6YR0XhphElCW+HUWW+2QnIs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dhnAmRq5MWeBtQm3HUNWWDJ0PRdYJEA2mCYPP+DQRCj7J291arrTicSFDjdplN5YT
	 7M4288FPgF/JkMICzb4v1W37tngnhPGilKaKgH+kK9KCntUEGIDJ1G50lZiXPoZPS4
	 ornX+lfRws5qAmk951QVRLgt/1kxLck9HSnVLgTic7JRSKZ7PfwUZAlIZ87PwWmvej
	 bHLxFZP600eyVC6onF/xy9ACRx54uDHaNNvzAOSCdQ8gtzLYVvkUdElKN712uWoyK7
	 TDcQlzFwwN2PUDY+0yEON+izSyHWq7aZcJWs16QA+W65ZWiRGT87N38weIdU/1uzol
	 HuvvfY/lUj6xw==
Date: Wed, 21 Jun 2023 14:27:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [XEN PATCH 12/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
In-Reply-To: <e1f20861-fea1-068e-06c1-83558f7885cf@suse.com>
Message-ID: <alpine.DEB.2.22.394.2306211423300.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <27690fdf9658339f12061f1bd171ebe5f969eb1b.1687250177.git.gianluca.luparini@bugseng.com> <alpine.DEB.2.22.394.2306201422230.897208@ubuntu-linux-20-04-desktop>
 <e1f20861-fea1-068e-06c1-83558f7885cf@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Jun 2023, Jan Beulich wrote:
> First of all - please trim replies.
> 
> On 20.06.2023 23:23, Stefano Stabellini wrote:
> > On Tue, 20 Jun 2023, Simone Ballarin wrote:
> >> --- a/xen/arch/x86/percpu.c
> >> +++ b/xen/arch/x86/percpu.c
> >> @@ -12,7 +12,7 @@ unsigned long __per_cpu_offset[NR_CPUS];
> >>   * possible #PF at (NULL + a little) which has security implications in the
> >>   * context of PV guests.
> >>   */
> >> -#define INVALID_PERCPU_AREA (0x8000000000000000L - (long)__per_cpu_start)
> >> +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (long)__per_cpu_start)
> >>  #define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
> > 
> > Hi Jan, should this be ULL?
> 
> Not really, no - we're 64-bit only. Furthermore the expression is
> about addresses, which correspond to "unsigned long" in our world.

[...]

> >> --- a/xen/include/public/arch-x86/xen-x86_64.h
> >> +++ b/xen/include/public/arch-x86/xen-x86_64.h
> >> @@ -53,10 +53,10 @@
> >>  #define FLAT_USER_SS32 FLAT_RING3_SS32
> >>  #define FLAT_USER_SS   FLAT_USER_SS64
> >>  
> >> -#define __HYPERVISOR_VIRT_START 0xFFFF800000000000
> >> -#define __HYPERVISOR_VIRT_END   0xFFFF880000000000
> >> -#define __MACH2PHYS_VIRT_START  0xFFFF800000000000
> >> -#define __MACH2PHYS_VIRT_END    0xFFFF804000000000
> >> +#define __HYPERVISOR_VIRT_START 0xFFFF800000000000U
> >> +#define __HYPERVISOR_VIRT_END   0xFFFF880000000000U
> >> +#define __MACH2PHYS_VIRT_START  0xFFFF800000000000U
> >> +#define __MACH2PHYS_VIRT_END    0xFFFF804000000000U
> > 
> > Also here ULL?
> 
> UL yes, but as above I don't think ULL is good to use for addresses.
> That said, things are a little less clear in the public headers: In
> principle it could be a goal for them to be usable on foreign
> architectures (say e.g. a 32-bit tool stack, or an analysis tool
> which can be run without being on the original host architecture) as
> well.
> 
> Furthermore, open-coded use of ULL would make this no-longer-C89.
> If anything, it would then need to be UINT64_C(), yet even that would
> grow our public header dependencies on C99-like infrastructure being
> available (right now we only require certain stdint.h-like types;
> Arm alone, interestingly, also uses PRIx64 and PRIu64, which may be
> kind of unavoidable there).

UL seems to be the best option then.

