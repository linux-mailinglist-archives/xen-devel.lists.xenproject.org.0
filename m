Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F415EAE6FE0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 21:42:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024049.1400101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU9WM-00013J-1u; Tue, 24 Jun 2025 19:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024049.1400101; Tue, 24 Jun 2025 19:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU9WL-00011n-Ub; Tue, 24 Jun 2025 19:41:29 +0000
Received: by outflank-mailman (input) for mailman id 1024049;
 Tue, 24 Jun 2025 19:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCq+=ZH=flex--seanjc.bounces.google.com=3Zf9aaAYKCRoI40D926EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@srs-se1.protection.inumbo.net>)
 id 1uU9WK-00011g-9o
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 19:41:28 +0000
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [2607:f8b0:4864:20::44a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3722823b-5133-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 21:41:26 +0200 (CEST)
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-748f3d4c7e7so4354377b3a.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 12:41:27 -0700 (PDT)
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
X-Inumbo-ID: 3722823b-5133-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794085; x=1751398885; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FUFFiUTwDIQTjkS/XGuKJUupkz/Ptibx0+U0nupMqZk=;
        b=3KEomNLlbp5ascgkiZTtrC7tjL6J3wSr67ezADtNkChrDPgALXnWf8U/YIBlTbTcAC
         fRxmOOgcNf6Qyy1T9JkZVKZXy+eamhMSUCm4elizyw3rpX6G1WiL3igQbpbBQ/U+Pk/Q
         N7xQEKOjnT1D7kgxdnXA77RhpDR50DtqVRc3JPYvupHOxWPvckSfZaG4KxF9ee2Xct4k
         J8vALAchaMoyhQI6njZaylQt7OcfWxDR9dySdEX3Ej5QlpEFiCkINbdwvyb9IT+xLYbY
         3hoP/7Ij3CnZw2dBbFTRVDU5Fsq5Piw86niamcaJqqVwAMs4kSqTiXLFnzgI6Wpwj0lx
         38bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794085; x=1751398885;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FUFFiUTwDIQTjkS/XGuKJUupkz/Ptibx0+U0nupMqZk=;
        b=qYWu7RN3W+uZj5KLXaA7OGiqYL6xrGA7Eo52Ii2QVOhIq8pwltS4s2dbDbUXrrVgyb
         EIhiQCz8z05ulDo/sLPXOjiUvkPBmomMwSvoF+oh0c2D7Clsiwkd2v4EghkWD1uva1IR
         wQs6+ekPC5XZptH4Nmy+wMdv7h2xe6lCQNoWg0PmMZ2StKZf70GghR2ejRRRZ4+qJTbH
         c94pO61jXAnVCDsaO4VWQ8plg+pEFZLGxRwwxme6IdeG84rIZWF/RGPNe5cIpVCYqqGa
         m8D07lCO1hHh+BitFfgwo2EK4EtXhVMcVqhM587KUs2S2l+bw33pW9aN/GArUafaIsqo
         xdwg==
X-Forwarded-Encrypted: i=1; AJvYcCXzpyTh886GDaS5zUIhWQsn7KpP8nKW2vO62CW8m+8q2Y4mcmLKXAGBu1LJDM/Vgj+1MdJn9p1bsx4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwyWgv7Rm8pIOsTdem+NuvfkGHIlzJTmpxcScJidPz6IzGig/4
	sofc/1A4b1zR8QXgbL0zM0UlxlKpGB1saljtaYTgbDePEaMYkwUDM5zNpNwPfL5ouNCMHRLYlYZ
	OmIGUYA==
X-Google-Smtp-Source: AGHT+IHYexPIgCTXbHegrNWRwV9PAsICfBY+CW50dlQj/EuWE5JzEYSKqjcY5P3xX5xOKDb9+UElHwxg8eM=
X-Received: from pfrb8.prod.google.com ([2002:aa7:8ec8:0:b0:746:32ae:99d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:170d:b0:748:1bac:ad5f
 with SMTP id d2e1a72fcca58-74ad455d619mr461113b3a.12.1750794085384; Tue, 24
 Jun 2025 12:41:25 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:26 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079267460.517177.7949210108988821172.b4-ty@google.com>
Subject: Re: [PATCH v3 00/13] KVM: Make irqfd registration globally unique
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 May 2025 16:52:10 -0700, Sean Christopherson wrote:
> Non-KVM folks,
> 
> I am hoping to route this through the KVM tree (6.17 or later), as the non-KVM
> changes should be glorified nops.  Please holler if you object to that idea.
> 
> Hyper-V folks in particular, let me know if you want a stable topic branch/tag,
> e.g. on the off chance you want to make similar changes to the Hyper-V code,
> and I'll make sure that happens.
> 
> [...]

Applied to kvm-x86 irqs, thanks!

[01/13] KVM: Use a local struct to do the initial vfs_poll() on an irqfd
        https://github.com/kvm-x86/linux/commit/283ed5001d68
[02/13] KVM: Acquire SCRU lock outside of irqfds.lock during assignment
        https://github.com/kvm-x86/linux/commit/140768a7bf03
[03/13] KVM: Initialize irqfd waitqueue callback when adding to the queue
        https://github.com/kvm-x86/linux/commit/b5c543518ae9
[04/13] KVM: Add irqfd to KVM's list via the vfs_poll() callback
        https://github.com/kvm-x86/linux/commit/5f8ca05ea991
[05/13] KVM: Add irqfd to eventfd's waitqueue while holding irqfds.lock
        https://github.com/kvm-x86/linux/commit/86e00cd162a7
[06/13] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
        https://github.com/kvm-x86/linux/commit/867347bb21e1
[07/13] xen: privcmd: Don't mark eventfd waiter as EXCLUSIVE
        https://github.com/kvm-x86/linux/commit/a52664134a24
[08/13] sched/wait: Add a waitqueue helper for fully exclusive priority waiters
        https://github.com/kvm-x86/linux/commit/0d09582b3a60
[09/13] KVM: Disallow binding multiple irqfds to an eventfd with a priority waiter
        https://github.com/kvm-x86/linux/commit/2cdd64cbf990
[10/13] KVM: Drop sanity check that per-VM list of irqfds is unique
        https://github.com/kvm-x86/linux/commit/b599d44a71f1
[11/13] KVM: selftests: Assert that eventfd() succeeds in Xen shinfo test
        https://github.com/kvm-x86/linux/commit/033b76bc7f06
[12/13] KVM: selftests: Add utilities to create eventfds and do KVM_IRQFD
        https://github.com/kvm-x86/linux/commit/74e5e3fb0dd7
[13/13] KVM: selftests: Add a KVM_IRQFD test to verify uniqueness requirements
        https://github.com/kvm-x86/linux/commit/7e9b231c402a

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next

