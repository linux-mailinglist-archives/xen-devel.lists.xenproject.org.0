Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E9782D9B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 17:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587659.919015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7Fd-00071J-Lw; Mon, 21 Aug 2023 15:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587659.919015; Mon, 21 Aug 2023 15:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY7Fd-0006yO-Hw; Mon, 21 Aug 2023 15:55:33 +0000
Received: by outflank-mailman (input) for mailman id 587659;
 Mon, 21 Aug 2023 15:55:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mH9=EG=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qY7Fb-0006yI-OL
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 15:55:31 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26ef79c6-403b-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 17:55:30 +0200 (CEST)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bddac1b7bfso23465095ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Aug 2023 08:55:30 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 b13-20020a170902d50d00b001b87bedcc6fsm7184127plg.93.2023.08.21.08.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Aug 2023 08:55:28 -0700 (PDT)
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
X-Inumbo-ID: 26ef79c6-403b-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692633329; x=1693238129;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgX30HPBwkajxdCYjchpvUkjDfUAn1RqgjLWM9un3z8=;
        b=O1gx1bMmfDE+q/6LYeXwsjxfF3yQC/dVV6fcwNNDMYns/e9bQWZzFSA9c8rlhaipr5
         UcY9xWWc/nvLb4oll0E5WxzNbv/swoJk4eLluchbFR2s5jwKwOlQnUTy5ZM2b0Tw0VC2
         adHgy0wkoOL5XR7vU1MK6nj7wyVKe4J5vfU7ZHJOybEXpBHWNTq/lJ7CbbBpiboJCcAa
         k4N9uovhHqvLOJIgfVIlulmqpPbxpp3QZp9XsoitSWg2NFa3r9FiRjfOcEnEsDvUIIPR
         tUUT42QHR5NF+i/e3KeUV3uiuPi9/dw+r2bC73HZx0MjAQWR9Lk2q3a13PB0KmF5n2s8
         VMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692633329; x=1693238129;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cgX30HPBwkajxdCYjchpvUkjDfUAn1RqgjLWM9un3z8=;
        b=ABbR5TjP81nwpz88kTWjr8PnMBeqYLusbEnv9RKeyS6epd9QGb41c/LzkVEYE6xfv8
         K71vx42U/usnmTsH6DUIaoXveffVvQFT91TZA/ctlLzGXOovNzKyZZogQABbwi5ArAwN
         P/BE6SODp1lTFz5a68AVYq1EvCygJXvlOlmujvkDP3HpJVzcmWjN7Jy/V1+jRNN+QXTr
         JX0XFjTpUoXaWKol3BCFj9hCsOXjqvnJpjsq0XA3Nu3UeNOg81+gIJGjyurZCe/v98qX
         T4xYerFDXHnh16DdoqDmF3A+MrvSFjyMHrEMwmILpk4smTRbEQ/KDTlhjfPkcmUVRaBD
         aLAQ==
X-Gm-Message-State: AOJu0YwVWF+pP1Tfh6NqoD50q8iUu8Rsg2ScE19bDsOxfs7HkgM0KEw4
	rHTUtVIvZl17gMRLzZ1dF7uNNWWaUkxPdQ==
X-Google-Smtp-Source: AGHT+IHViJ0ZnM1f6vuui1YBKch1ckFECFCcL4hqfwU4L0vevGnGthMaj64SKPQb8WI9qHiM6YFdlQ==
X-Received: by 2002:a17:903:41d1:b0:1bf:193a:70b6 with SMTP id u17-20020a17090341d100b001bf193a70b6mr10831284ple.5.1692633328877;
        Mon, 21 Aug 2023 08:55:28 -0700 (PDT)
Message-ID: <5fa229fc-9514-abc6-5e72-2447a2c637d0@gmail.com>
Date: Tue, 22 Aug 2023 00:55:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 0/5] Fixes to debugging facilities
To: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is a rebased version of Andrew Cooper's debugging facilities patch:
https://lore.kernel.org/xen-devel/1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com/

> So this started as a small fix for the vmentry failure (penultimate patch),
> and has snowballed...
>
> I'm fairly confident that everything involving DEBUGCTL.BTF is broken, and
> there are definitely bugs with configuring DEBUGCTL.RTM (which really isn't
> helped by the fact that the GCC TSX intrinsics render the resulting code
> un-debuggable.)  I'll defer fixing these swamps for now.
>
> The first 4 patches probably want backporting to the stable trees, so I've
> taken care to move them ahead of patch 6 for backport reasons.  While all
> fixes would ideally be backported, I can't find a way of fixing %dr6 merging
> (as it needs to be done precicely once) without a behavioural change in the
> monitor subsystem.
>
> Patch 8 probably breaks introspection, so can't be taken at this point.  See
> that patch for discussion of the problem and my best guess at a solution.

6 out of 11 patches from the 2018 patch series above, including the
vmentry failure fix, have already been committed.  This covers the
remaining 5 patches.

One particular bug that the patch series fixes involves simultaneous
hardware breakpoint exception and single-stepping exception occurring at
the same PC (IP).  Xen blindly sets singlestep (DR6.BS := 1) in this
case, which interferes with userland debugging and allows (otherwise
restricted) usermode programs to detect Xen HVM (or PVH).  The following
Linux x86-64 program demonstrates the bug:

-----------------------------------8<-----------------------------------

#include <stddef.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <signal.h>
#include <sys/ptrace.h>
#include <sys/wait.h>
#include <sys/user.h>
#include <stdio.h>

#define ABORT_ON_ERR(x) if ((x) == -1) abort();

int main(void)
{
    unsigned long cur_rip, cur_eflags, cur_dr6;
    int wstatus, exit_code;
    pid_t pid;

    ABORT_ON_ERR(pid = fork());
    if (pid == 0) {
        ABORT_ON_ERR(ptrace(PTRACE_TRACEME, 0, NULL, NULL));
        ABORT_ON_ERR(raise(SIGSTOP));
        _exit(0);
    }

    /* Wait for first ptrace event */
    if (waitpid(pid, &wstatus, 0) != pid) abort();
    if (!WIFSTOPPED(wstatus)) abort();

    /* Obtain current RIP value and perform sanity check */
    cur_rip = ptrace(PTRACE_PEEKUSER, pid, (void *)offsetof(struct user, regs.rip), &cur_rip);
    cur_dr6 = ptrace(PTRACE_PEEKUSER, pid, (void *)offsetof(struct user, u_debugreg[6]), &cur_dr6);
    assert(cur_dr6 == 0xffff0ff0UL);

    /* Set up debug registers and set EFLAGS.TF */
    cur_eflags = ptrace(PTRACE_PEEKUSER, pid, (void *)offsetof(struct user, regs.eflags), &cur_eflags);
    ABORT_ON_ERR(ptrace(PTRACE_POKEUSER, pid, (void *)offsetof(struct user, regs.eflags), (void *)(cur_eflags | 0x100UL)));
    ABORT_ON_ERR(ptrace(PTRACE_POKEUSER, pid, (void *)offsetof(struct user, u_debugreg[0]), (void *)cur_rip));
    ABORT_ON_ERR(ptrace(PTRACE_POKEUSER, pid, (void *)offsetof(struct user, u_debugreg[7]), (void *)1L));

    /* Continue execution to trigger hardware breakpoint */
    ABORT_ON_ERR(ptrace(PTRACE_CONT, pid, NULL, (unsigned long)0));
    if (waitpid(pid, &wstatus, 0) != pid) abort();
    if (!(WIFSTOPPED(wstatus) && WSTOPSIG(wstatus) == SIGTRAP)) abort();

    /* Detect if Xen has tampered with DR6 */
    cur_dr6 = ptrace(PTRACE_PEEKUSER, pid, (void *)offsetof(struct user, u_debugreg[6]), &cur_dr6);
    fprintf(stderr, "DR6 = 0x%08lx\n", cur_dr6);
    if (cur_dr6 == 0xffff0ff1UL)
    {
        fputs("Running on bare-metal, Xen PV, or non-Xen VMM\n", stdout);
        exit_code = EXIT_FAILURE;
    }
    else
    {
        fputs("Running on Xen HVM\n", stdout);
        exit_code = EXIT_SUCCESS;
    }

    /* Tear down debug registers and unset EFLAGS.TF */
    cur_eflags = ptrace(PTRACE_PEEKUSER, pid, (void *)offsetof(struct user, regs.eflags), &cur_eflags);
    ABORT_ON_ERR(ptrace(PTRACE_POKEUSER, pid, (void *)offsetof(struct user, regs.eflags), (void *)(cur_eflags & ~0x100UL)));
    ABORT_ON_ERR(ptrace(PTRACE_POKEUSER, pid, (void *)offsetof(struct user, u_debugreg[7]), (void *)0L));

    /* Continue execution to let child process exit */
    ABORT_ON_ERR(ptrace(PTRACE_CONT, pid, NULL, (unsigned long)0));
    if (waitpid(pid, &wstatus, 0) != pid) abort();
    if (!(WIFEXITED(wstatus) && WEXITSTATUS(wstatus) == 0)) abort();

    return exit_code;
}

-----------------------------------8<-----------------------------------

Andrew Cooper (5):
  x86: Fix calculation of %dr6/7 reserved bits
  x86/emul: Add pending_dbg field to x86_event
  x86/hvm: RFC - PROBABLY BROKEN - Defer all debugging/monitor actions
    to {svm,vmx}_inject_event()
  x86: Fix merging of new status bits into %dr6
  x86/dbg: Cleanup of legacy dr6 constants

 xen/arch/x86/domain.c                  |   7 +-
 xen/arch/x86/hvm/emulate.c             |   3 +-
 xen/arch/x86/hvm/hvm.c                 |   8 +-
 xen/arch/x86/hvm/svm/svm.c             | 126 ++++++++++++++-----------
 xen/arch/x86/hvm/vmx/vmx.c             | 112 ++++++++++------------
 xen/arch/x86/include/asm/debugreg.h    |  94 +++++++++++++-----
 xen/arch/x86/include/asm/domain.h      |  12 +++
 xen/arch/x86/include/asm/hvm/hvm.h     |  15 ++-
 xen/arch/x86/include/asm/x86-defns.h   |  10 --
 xen/arch/x86/mm/shadow/multi.c         |   5 +-
 xen/arch/x86/pv/emul-priv-op.c         |  13 ++-
 xen/arch/x86/pv/emulate.c              |   6 +-
 xen/arch/x86/pv/misc-hypercalls.c      |  16 +---
 xen/arch/x86/pv/ro-page-fault.c        |   3 +-
 xen/arch/x86/pv/traps.c                |  17 +++-
 xen/arch/x86/traps.c                   |   8 +-
 xen/arch/x86/x86_emulate/x86_emulate.h |   5 +-
 17 files changed, 262 insertions(+), 198 deletions(-)

-- 
2.41.0


