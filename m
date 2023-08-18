Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF5F780F82
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 17:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586404.917635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1fk-0004el-KW; Fri, 18 Aug 2023 15:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586404.917635; Fri, 18 Aug 2023 15:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX1fk-0004bb-HW; Fri, 18 Aug 2023 15:46:00 +0000
Received: by outflank-mailman (input) for mailman id 586404;
 Fri, 18 Aug 2023 15:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9btj=ED=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qX1eK-0004U2-0j
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 15:44:32 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dab217b-3dde-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 17:44:29 +0200 (CEST)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-565dc391be3so1570730a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 08:44:29 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 23-20020a17090a199700b0025023726fc4sm3699654pji.26.2023.08.18.08.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 08:44:18 -0700 (PDT)
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
X-Inumbo-ID: 1dab217b-3dde-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692373468; x=1692978268;
        h=content-transfer-encoding:content-language:cc:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yoKPQt7SzhQrSiLbmNTYbyhlm9v0/RXwYbxS/KR/BjA=;
        b=lKWegdzWzxEbBId8prkrk/0PUJx0J6UngAykt80jZFwssJf9MrUefegyfJwdU/AaSx
         vG5e/RjATfFyioMQvl4oYiQHTSGeAsJ9hKde9Mzk6PnMAFfs8JAjbrAwo7n8MUymsUfA
         tl7L7ko91Cpmqj7m2udMfhFVkRpBayaOG765RwJ6yRWpKx8RydCbLbfYDsIs6Ej00QRw
         geqg6RXTTCkrQIrcVbmVdU3bFG0J1OBCvVDkIqmeh2j429y/EDHGXTsGYxnrO2tIFhwJ
         1Kwt+t3PcbP/LfpHUxorcBqZfpjhsJIhA14R3BV4J/BhargNxbr1W6ht9UBJKS+Jqbx7
         QH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692373468; x=1692978268;
        h=content-transfer-encoding:content-language:cc:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yoKPQt7SzhQrSiLbmNTYbyhlm9v0/RXwYbxS/KR/BjA=;
        b=lXN84kQh++VN6sYddMus/3pAG6yp6jkloVYTQe4wc11EbTkZ5Ub4f/5Ip4nVODLTZK
         m7poRLnNuVqe0Bhtj27hHoZDQT0cwjkvNKBkjNgSXDQ4cd3cDYSelkvDBEUh6u/NN8iL
         ShRYTkMBlpfn2Z/qHUKx8b/AMngZQmKYVmc7EaFjQRaqtc0H3LUyJp5PSRYFEOAaDwN5
         jyL8cDK6uNwpaVfXLsEMzHehPt2DDgx+oGlbO4OPKknbNH4IwNzih4uPYzCm6qvNTK3M
         PRoTOaz7pcR02iOCXWip5e80MyRGSxta8FvXStsdAb0v0ZUrZh5Ohc9LtE8elkF8J4T5
         +7PQ==
X-Gm-Message-State: AOJu0YyG/fHLaoCPHL9IXxvOYQFRfjd2Cm8CdwzoOokvXaZXp5/cvVOK
	paizPdZEd+A2jCGEXdWOswE=
X-Google-Smtp-Source: AGHT+IE4RPrW+yW83ETBhM2j6t3nZOc4KOuenAjU4AyqfSV5gx3ZE6qT6Xzizxfyxv1htBXoEFkEVw==
X-Received: by 2002:a17:90a:c38b:b0:26b:69c1:9a6a with SMTP id h11-20020a17090ac38b00b0026b69c19a6amr7779380pjt.20.1692373467688;
        Fri, 18 Aug 2023 08:44:27 -0700 (PDT)
Message-ID: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
Date: Sat, 19 Aug 2023 00:44:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: [PATCH 0/6] x86/debug: fix guest dr6 value for single stepping and HW
 breakpoints
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Xen has a bug where hardware breakpoint exceptions (DR_TRAP<n>) are
erroneously recognized as single-stepping exceptions (DR_STEP).  This
interferes with userland debugging and allows (otherwise restricted)
usermode programs to detect Xen HVM (or PVH).  This patch series aim to
fix this.

The last patch is optional and finishes incomplete plumbing work
initiated by commit 21867648033d (x86/debug: Plumb pending_dbg through
the monitor and devicemodel interfaces, 2018-05-31).

The following Linux x86-64 program demonstrates the bug:

--- (snip) ---

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

--- (snip) ---

Jinoh Kang (6):
  x86/hvm: only populate info->cr2 for #PF in hvm_get_pending_event()
  x86emul: rename field 'cr2' of struct x86_event to 'extra'
  x86: don't assume #DB is always caused by singlestep if EFLAGS.TF is
    set
  x86/pv: set DR_STEP if single-stepping after ro page fault emulation
  x86/pv: factor out single-step debug trap injection
  x86/debug: actually plumb pending_dbg through the monitor and
    devicemodel interfaces

 xen/arch/x86/hvm/dm.c                  |  2 +-
 xen/arch/x86/hvm/emulate.c             |  3 +-
 xen/arch/x86/hvm/hvm.c                 | 11 ++++--
 xen/arch/x86/hvm/svm/nestedsvm.c       |  2 +-
 xen/arch/x86/hvm/svm/svm.c             | 48 ++++++++++++++++++++------
 xen/arch/x86/hvm/vmx/vmx.c             | 40 ++++++++++++++-------
 xen/arch/x86/include/asm/domain.h      | 14 +++++++-
 xen/arch/x86/include/asm/hvm/hvm.h     | 14 +++++++-
 xen/arch/x86/mm/shadow/multi.c         |  5 +--
 xen/arch/x86/pv/emulate.c              |  5 +--
 xen/arch/x86/pv/ro-page-fault.c        |  3 +-
 xen/arch/x86/pv/traps.c                | 18 +++++++---
 xen/arch/x86/x86_emulate/x86_emulate.h |  6 ++--
 13 files changed, 128 insertions(+), 43 deletions(-)

-- 
2.41.0


