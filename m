Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0825525268
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 18:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327875.550761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npBZH-0005yx-5h; Thu, 12 May 2022 16:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327875.550761; Thu, 12 May 2022 16:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npBZH-0005w4-2F; Thu, 12 May 2022 16:21:35 +0000
Received: by outflank-mailman (input) for mailman id 327875;
 Thu, 12 May 2022 16:21:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FVjp=VU=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1npBZF-0005vw-Hs
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 16:21:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94c34276-d20f-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 18:21:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90DA161F76;
 Thu, 12 May 2022 16:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73140C385B8;
 Thu, 12 May 2022 16:21:28 +0000 (UTC)
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
X-Inumbo-ID: 94c34276-d20f-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652372489;
	bh=NDeYtJoOTyZCZ7rH4NHOQS1V70YxoweEBSxhUWIM/zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEZzmykw70nosMdq2UT7qg8LKHXmRTyvKi2MNKMtZZ2CwyO6035MToY/A+CtoWVMY
	 oeSXpYZuUcqissIoGJ61njBawHIw+QDkKvnMrIZZylSUEPuDQKvY08371yKuyZbajk
	 RIXLkYKVZRAfckK8MXp2I3O8tCFEYOIRx+Ti6yrs=
Date: Thu, 12 May 2022 18:21:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Maximilian Heyne <mheyne@amazon.de>
Cc: stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH 0/4] x86: decode Xen/KVM emulate prefixes
Message-ID: <Yn00BsSx060gS94o@kroah.com>
References: <20220512135654.119791-1-mheyne@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512135654.119791-1-mheyne@amazon.de>

On Thu, May 12, 2022 at 01:56:47PM +0000, Maximilian Heyne wrote:
> This is a backport of a patch series for 5.4.x.
> 
> The patch series allows the x86 decoder to decode the Xen and KVM emulate
> prefixes.
> 
> In particular this solves the following issue that appeared when commit
> db6c6a0df840 ("objtool: Fix noreturn detection for ignored functions") was
> backported to 5.4.69:
> 
>   arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c
> 
> Also now that this decoding is possible, also backport the commit which prevents
> kprobes on probing such prefixed instructions. This was also part of the
> original series.
> 
> The series applied mostly cleanly on 5.4.192 except for a contextual problem in
> the 3rd patch ("x86: xen: insn: Decode Xen and KVM emulate-prefix signature").
> 
> Masami Hiramatsu (4):
>   x86/asm: Allow to pass macros to __ASM_FORM()
>   x86: xen: kvm: Gather the definition of emulate prefixes
>   x86: xen: insn: Decode Xen and KVM emulate-prefix signature
>   x86: kprobes: Prohibit probing on instruction which has emulate prefix
> 
>  arch/x86/include/asm/asm.h                  |  8 +++--
>  arch/x86/include/asm/emulate_prefix.h       | 14 +++++++++
>  arch/x86/include/asm/insn.h                 |  6 ++++
>  arch/x86/include/asm/xen/interface.h        | 11 +++----
>  arch/x86/kernel/kprobes/core.c              |  4 +++
>  arch/x86/kvm/x86.c                          |  4 ++-
>  arch/x86/lib/insn.c                         | 34 +++++++++++++++++++++
>  tools/arch/x86/include/asm/emulate_prefix.h | 14 +++++++++
>  tools/arch/x86/include/asm/insn.h           |  6 ++++
>  tools/arch/x86/lib/insn.c                   | 34 +++++++++++++++++++++
>  tools/objtool/sync-check.sh                 |  3 +-
>  tools/perf/check-headers.sh                 |  3 +-
>  12 files changed, 128 insertions(+), 13 deletions(-)
>  create mode 100644 arch/x86/include/asm/emulate_prefix.h
>  create mode 100644 tools/arch/x86/include/asm/emulate_prefix.h
> 
> 
> base-commit: 1d72b776f6dc973211f5d153453cf8955fb3d70a
> -- 
> 2.32.0
> 
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 
> 

All now queued up, thanks.

greg k-h

