Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989F4787407
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 17:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590142.922250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCBo-00033F-Gg; Thu, 24 Aug 2023 15:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590142.922250; Thu, 24 Aug 2023 15:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZCBo-0002zu-DN; Thu, 24 Aug 2023 15:24:04 +0000
Received: by outflank-mailman (input) for mailman id 590142;
 Thu, 24 Aug 2023 15:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hMLV=EJ=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qZCBm-0002zo-Dn
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 15:24:02 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e6c8252-4292-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 17:23:58 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1bf7a6509deso22995ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 08:23:59 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 iy3-20020a170903130300b001b9de39905asm12935117plb.59.2023.08.24.08.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Aug 2023 08:23:56 -0700 (PDT)
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
X-Inumbo-ID: 3e6c8252-4292-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692890637; x=1693495437;
        h=content-transfer-encoding:content-language:cc:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mz1s/83A9NHhjWyAB0rXNoLLdbJwNpIgWAiufMj/7H8=;
        b=j7DGzFnnxP21St4nvMwb5EQgQCdgmQ+LWBaTU9cddWjKTBc1Ex93WokufanOdlvsHL
         nHjUH1mijC2Xb2nRvQkhGUM8CQFO60Xt8j7dDg9ehWCx0Sl72On+KEL4mZCrWDzRA2FT
         zyDTQATidkQMTrS9iIuAf9THEbr/K3tOf8Mp3Y4/YYlilwPZwFSz6ya1DtcbzvwlXKDj
         LqkOlONAx+J42j/O0qCUqVnaQzd65TMI3EHWFTZ9symbWNLmTJug3WApQfPJe4EzvAxL
         7FPOlNGBfiSkJgUEib74O76gF/KEuLtZhEnef6+QeQZuLJ8eeunKO6QdFWDUCMlsDmbn
         yDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692890637; x=1693495437;
        h=content-transfer-encoding:content-language:cc:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mz1s/83A9NHhjWyAB0rXNoLLdbJwNpIgWAiufMj/7H8=;
        b=Mb8mkv119o3MaMyq7EYcaOKFna32nrIlmO1k9f+C+DqASrFyHeMxedwxAKQNNz/Frc
         pL/cPFpWVjbc1k/teTI+ndwa05vzyzP1lOraMiK9cEna55IoqvlxkhCSaoRZ35Ao+bK4
         et93MQzoST49SOtlaWqHElkzOkBJ0t0YbSD4+rTqEvuWWJiOjQSBl6HMSQbS2gTK8o1k
         nDBnu+9cj2Lq32BiO0gazhFTzpPRec4cTcxhOAJI39eXWIY1Nv+9gr0WnrB6GGZmT+x8
         uwoWt05GkQ9ddnMK5CrGKYDorihd7sjkXaRcu5GU4cz9P2/OHeky7IuOCh/vTXr2DPLK
         MqKQ==
X-Gm-Message-State: AOJu0Yx3CQ2OcxNxs5DSwCNOshjCpki6L+4i1FH0aFtG+3v6P/JYeDk+
	L3vj/qrct3VrtLnklfX2/FM=
X-Google-Smtp-Source: AGHT+IGtDB++Etp3oA2ZODO/IcjFrl3pPOBTces2X/+rPZ2pST0tJi5aIbzaOWbndTPSv9nQjvyxfg==
X-Received: by 2002:a17:902:e882:b0:1c0:8044:750b with SMTP id w2-20020a170902e88200b001c08044750bmr11899800plg.47.1692890637432;
        Thu, 24 Aug 2023 08:23:57 -0700 (PDT)
Message-ID: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
Date: Fri, 25 Aug 2023 00:23:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH v2 0/8] Fixes to debugging facilities
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
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
remaining 5 patches--except the aforementioned patch 8, which is
replaced with a more conservative approach with (hopefully) minimal
impact on introspection.

(Re dropped defer-monitor-to-injection patch: I think this could be
 fixed independently of DR6 handling in a separate patchset, since IIUC
 the introspection/monitor events are already in a broken state anyway.)

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

Changelog:

v1 -> v2:

- S-o-b fixes (sorry)
- Drop RFC patch entirely, replace with a more conservative approach
- Add *_get_pending_event fixes (for hvm_monitor_interrupt)
- Fix must-be-zero constant in adjust_dr7_rsvd: 0xffff23ff -> 0xffff2fff
- Define X86_DR{6,7}_* constants in x86-defns.h instead of open-coding
  naked numbers (thanks Jan)
- Update DR6 for gdbsx when trapped in PV guest kernel mode
- Commit message fixes

Andrew Cooper (5):
  x86: Fix calculation of %dr6/7 reserved bits
  x86/emul: Add pending_dbg field to x86_event
  x86/hvm: Add comments about #DB exception behavior to
    {svm,vmx}_inject_event()
  x86: Fix merging of new status bits into %dr6
  x86/dbg: Cleanup of legacy dr6 constants

Jinoh Kang (3):
  x86/hvm: Only populate info->cr2 for #PF in hvm_get_pending_event()
  x86/emul: Populate pending_dbg field of x86_event from
    {svm,vmx}_get_pending_event()
  x86: Don't assume #DB is always caused by singlestep if EFLAGS.TF is
    set

 xen/arch/x86/domain.c                  |  7 +--
 xen/arch/x86/hvm/emulate.c             |  3 +-
 xen/arch/x86/hvm/hvm.c                 | 17 +++++--
 xen/arch/x86/hvm/svm/svm.c             | 35 ++++++++++----
 xen/arch/x86/hvm/vmx/vmx.c             | 45 +++++++++++-------
 xen/arch/x86/include/asm/debugreg.h    | 63 ++++++++++++++++----------
 xen/arch/x86/include/asm/domain.h      | 12 +++++
 xen/arch/x86/include/asm/hvm/hvm.h     | 15 +++++-
 xen/arch/x86/include/asm/x86-defns.h   | 47 +++++++++++++++++++
 xen/arch/x86/mm/shadow/multi.c         |  5 +-
 xen/arch/x86/pv/emul-priv-op.c         | 13 +++---
 xen/arch/x86/pv/emulate.c              |  6 +--
 xen/arch/x86/pv/misc-hypercalls.c      | 16 ++-----
 xen/arch/x86/pv/ro-page-fault.c        |  3 +-
 xen/arch/x86/pv/traps.c                | 17 +++++--
 xen/arch/x86/traps.c                   | 12 ++---
 xen/arch/x86/x86_emulate/x86_emulate.h |  5 +-
 17 files changed, 225 insertions(+), 96 deletions(-)

-- 
2.41.0


