Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06989E10AD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 02:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847161.1262296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHPZ-0000d3-TZ; Tue, 03 Dec 2024 01:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847161.1262296; Tue, 03 Dec 2024 01:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHPZ-0000WL-OR; Tue, 03 Dec 2024 01:09:09 +0000
Received: by outflank-mailman (input) for mailman id 847161;
 Tue, 03 Dec 2024 01:00:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uh+o=S4=flex--kevinloughlin.bounces.google.com=3FlhOZw0KAEEnhylqorxjkolqjrrjoh.frp@srs-se1.protection.inumbo.net>)
 id 1tIHGt-0004Oy-Iy
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 01:00:11 +0000
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com
 [2607:f8b0:4864:20::d49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f03b51d6-b111-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 02:00:10 +0100 (CET)
Received: by mail-io1-xd49.google.com with SMTP id
 ca18e2360f4ac-84182041b05so500234739f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 17:00:08 -0800 (PST)
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
X-Inumbo-ID: f03b51d6-b111-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733187607; x=1733792407; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gPDpv/chkg5p0fi43rAQfMRL2kKLevnRZ1FyVaa7akc=;
        b=EetRFhKLu1pky9WEgEvoYJFdk9rbiZR7ZggT9pgSmwWd39jow/KeUzDmMcy47+J/En
         fm1hANGMwQaKVmPM4hJaeVLwMlcwes3wIrNz3UzWkKDSO2wNJ89Rv9E3DQrCVsiB0vTY
         BHuLaYusBfRASvoBRgmWrd7eHzbRXxeGkMH+aS+byUiRyqCdm10bhw+DVW213QpP23nv
         IDQ0UQRfsSKTScZeZzVsJGsh45EKU+ThQeomVvKHjv1Rsl+UVXB6CIj+wOniUMyJVy7c
         MTDZMafmnBNyVDqeE2VTx1BCL8ILcnR98uebV520YLd5pkfhmTilTCOZD77xK8Igd64i
         Nqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733187607; x=1733792407;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPDpv/chkg5p0fi43rAQfMRL2kKLevnRZ1FyVaa7akc=;
        b=ol7Udz1Gf0H8sHdfTtJnbwoWti0UrscfqLTWr8JgkU9C0c9y+lAGmVlQ+xO1tSbxbQ
         bsz4D0X3Oj0qY6yLhCq6WW6fUJB2UnKUI2Z+f6LU/E5AlpJoqbRE3ZZgdnXUBAhmRzUn
         mRajgm03Y5HTGZg331Om1NIOhAEoZNRFeLWjJ9/PJTyqNtmcGjciYpLq24q779dLJBLE
         ihOFSzytg92eQuv+ea2EfHkCNp9lT0k+hVoMBbHnrUstIO6wY8sftL1elP3NfbV+qhGw
         /uPR0qWE+Jgs8MjKcjuGFuBM6gI/ge+OE/5YfVrhTEKdSNHuO2UhD9GIcm2eFqdCVoeE
         rCmg==
X-Forwarded-Encrypted: i=1; AJvYcCWiStsms9UmTj7iZTbDxItrcWjYYWpbLuEcA+9OJkkQASQ1eD4XwBkcuFvxPQat7VsQpqHZDv+H3wQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiIqPH8ZgnXO2QTqmAtKIpIW+QNLmuhmB3zUHkgviWafIAMWiw
	+VPenIC5G11c9MAwhX0isVZkLNx2B3QM9xT1XUVWoavsEReqp1YucWGexzG42k+7ckKrEyEfPac
	o0fc+9QPWqrSpxs4cEz4Lv/kmkXBqgA==
X-Google-Smtp-Source: AGHT+IHqJwhD7dDrPHnnwi0nKSyWpAXx88t8MplXy6qAA9f67EUD1JW80naumNLzsou5U5ZEc/gbCz70e8AwEIt7ij7T
X-Received: from ioay19.prod.google.com ([2002:a6b:c413:0:b0:841:802b:8e24])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:1546:b0:82a:2a67:9429 with SMTP id ca18e2360f4ac-8445b554fbbmr110164539f.5.1733187606796;
 Mon, 02 Dec 2024 17:00:06 -0800 (PST)
Date: Tue,  3 Dec 2024 00:59:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203005921.1119116-1-kevinloughlin@google.com>
Subject: [RFC PATCH 0/2] KVM: SEV: Prefer WBNOINVD over WBINVD for cache
 maintenance efficiency
From: Kevin Loughlin <kevinloughlin@google.com>
To: linux-kernel@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kvm@vger.kernel.org, thomas.lendacky@amd.com, 
	pgonda@google.com, sidtelang@google.com, mizhang@google.com, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

AMD CPUs currently execute WBINVD in the host when unregistering SEV
guest memory or when deactivating SEV guests. Such cache maintenance is
performed to prevent data corruption, wherein the encrypted (C=1)
version of a dirty cache line might otherwise only be written back
after the memory is written in a different context (ex: C=0), yielding
corruption. However, WBINVD is performance-costly, especially because
it invalidates processor caches.

Strictly-speaking, unless the SEV ASID is being recycled (meaning all
existing cache lines with the recycled ASID must be flushed), the
cache invalidation triggered by WBINVD is unnecessary; only the
writeback is needed to prevent data corruption in remaining scenarios.

To improve performance in these scenarios, use WBNOINVD when available
instead of WBINVD. WBNOINVD still writes back all dirty lines
(preventing host data corruption by SEV guests) but does *not*
invalidate processor caches.

First, provide helper functions to use WBINVD similar to how WBINVD is
invoked. Second, check for WBNOINVD support and execute WBNOINVD if
possible in lieu of WBINVD to avoid cache invalidations

Kevin Loughlin (2):
  x86, lib, xenpv: Add WBNOINVD helper functions
  KVM: SEV: Prefer WBNOINVD over WBINVD for cache maintenance efficiency

 arch/x86/include/asm/paravirt.h       |  7 ++++++
 arch/x86/include/asm/paravirt_types.h |  1 +
 arch/x86/include/asm/smp.h            |  7 ++++++
 arch/x86/include/asm/special_insns.h  | 12 ++++++++-
 arch/x86/kernel/paravirt.c            |  6 +++++
 arch/x86/kvm/svm/sev.c                | 35 +++++++++++++++++----------
 arch/x86/lib/cache-smp.c              | 12 +++++++++
 arch/x86/xen/enlighten_pv.c           |  1 +
 8 files changed, 67 insertions(+), 14 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


