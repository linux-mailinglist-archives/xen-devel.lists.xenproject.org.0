Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKx2H1Gqd2k6kAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E817E8BC4C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213829.1524273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmh-0004Qq-6Z; Mon, 26 Jan 2026 17:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213829.1524273; Mon, 26 Jan 2026 17:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmh-0004JZ-2I; Mon, 26 Jan 2026 17:53:55 +0000
Received: by outflank-mailman (input) for mailman id 1213829;
 Mon, 26 Jan 2026 17:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQme-0004HX-VD
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:53 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f85dbad8-fadf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 18:53:50 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso36981765e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:50 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:48 -0800 (PST)
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
X-Inumbo-ID: f85dbad8-fadf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450029; x=1770054829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8VDeI6bdSJ/iIx6zRivtSWpVfW+Hibh8P9MaDiN7nc=;
        b=Vso1FJiWysmX9CNsr/3mH5PkZ6ouqE4ttITR90AruxQEsmSMfEuVbIMXhcKvhrex0P
         m9LmMGQ1s2LzxOml885zXwFEVzz03MFZ0ALI97FBftEOIU6uYIkCP5WktA/x/n1TM1j5
         ynVPg3QnZ8sVcU6wlEuAKL5Tlg4txOiKmhYbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450029; x=1770054829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8VDeI6bdSJ/iIx6zRivtSWpVfW+Hibh8P9MaDiN7nc=;
        b=htKnKH14cTpbwLBvrou7RBEHe9G4tDdFVcTe1MlzbuvEmN1LEQ9q1KPPXkKe90EPSg
         3iS5Fhbk8XqZ9VjlLS6we4Z2rENebVIWNGRv4idtOLVYKATXbt6pOJG/y+s9TC6f/D+F
         DUacryNoFXZ+ib2Ox/GZV+awgLUPqVrTDlMKqA4dckdNyd9QMw99GVCr6Nw0A/4q1+Ww
         uRPINZ+PzV9/9dfyZ2pcQlK1jPjGDa+u6qBuzC+jZQ68IMDwttu3uHdF5HPANl6qC0pU
         Rfv89dMQf9yx3ZOFpUNnCksk1r7McBo6TVzkmUz5rNZnbWJJUtKT5Syau9ibrQS4YOoZ
         GWHw==
X-Gm-Message-State: AOJu0YynBsMizj5a/1OB5dXJH78Y88mA0M+FpBVY17ZeKgxKlfE8IWYZ
	pNkCCasx1ITv0yvJ6K5ykL5K1hfusYbeu12QP9VGcb8bpRsMKTdbCmS3c0Y0L1X2pwcHVDAa/Jj
	WtMOK
X-Gm-Gg: AZuq6aJTDun3tVt+89HQ3KQDFbMMEZ944HmX0v4miY8gHWM3VuHy3BozPsd2fF1HO0W
	LBw0Zx599F2NYm4afSgFO5MqhnrDx3KRFAX0PeONUSWyK3LmKtiVyof8AHqwVfiopi0W7Wrlu8z
	+ad9zHk63T6KSfz/O7LQnMIKPKWAeH8wJ1d4b0UpxtnSmDrFIE5ETKYM9cbUvrTIkY97daj2L0c
	pw9e4hWbfFFt8MeNZnk0C0oqfOkWsbHV/PXxBNbjAKPOBbF+kMi7K5jxpDNrELir0icmINFL2/0
	0Is7/XtPq3uhk3QPXpi75p98aVIKq9ZQvkXrPHYXEicdEoth967KyYoIsEvbeeJ/l3wQu9OdkiY
	IqZrrLb6sSG/GsXGJp7RMWfZWITq4b4qa94SvXJQ68gvo9gmGJpGOqtyhLhiZDopdtyJ9QG/vrD
	e/VbkK96FSfTPwBq4yIEozjkZf/Yk1HSWo2wM+O6MnqEZ+3vKuDw7K5525ZuvxzA==
X-Received: by 2002:a05:600c:468f:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-4805cd407d7mr83464515e9.3.1769450029219;
        Mon, 26 Jan 2026 09:53:49 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 00/16] x86/cpu: Cleanup for NX adjustments
Date: Mon, 26 Jan 2026 17:53:29 +0000
Message-Id: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,changelog.md:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E817E8BC4C
X-Rspamd-Action: no action

I was hoping this to be a patch or two, but it got out of hand...

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2287078891
https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/nx

The branch has one extra patch to fake up the firmware settings being set to
Gitlab CI, not included in this series.

Julien: This ought to suitable to rebase your cleanup on to.  In the end, I
did the AMD adjustment mostly because I needed it to test the correctness of
the prior cleanup.

The final 4 patches are tangential cleanup which I've kept out of the prior
work in case we wish to backport it.  Everything prior is relevant to
untangling, and mostly for the benefit of the AMD side.

The early patches are hopefully non-controvertial.  Later patches are a little
more RFC, and in need of further testing.

Andrew Cooper (16):
  x86/cpu: Fix boot time cache flushing
  x86/cpu: Drop cpuid_level adjustment from generic_identify()
  x86/intel: Drop the paddr_bits workaround for P4 Nocona/Prescott CPUs
  x86/cpu: Fold generic_identify() into its single caller
  x86/cpu: Move per-CPU actions out of the vendor early_init() hook
  x86/cpu: Rework the vendor early_init() hooks to be __init
  x86/cpu: Call the vendor early_init() hook in early_cpu_init()
  xen/sysctl: Drop XEN_SYSCTL_get_cpu_levelling_caps
  x86/intel: Always check MSR_MISC_ENABLE on all CPUs
  x86/amd: Always probe and configure the masking MSRs
  x86/amd: Fix re-activation of TopoExt on Fam15h CPUs
  x86/amd: Probe for NX support and re-activate if possible
  x86/cpu: Drop NOISY_CAPS
  x86/cpu: Drop default_init() and default_cpu
  x86/cpu: Clean up use of LCAP_* constants
  x86/cpuid: Drop the include of public/sysctl.h

 CHANGELOG.md                          |   2 +
 tools/flask/policy/modules/dom0.te    |   1 -
 tools/include/xenguest.h              |   1 -
 tools/libs/guest/xg_cpuid_x86.c       |  14 ---
 xen/arch/x86/boot/head.S              |   1 -
 xen/arch/x86/boot/trampoline.S        |  29 +++---
 xen/arch/x86/boot/wakeup.S            |  27 +++---
 xen/arch/x86/cpu/amd.c                | 107 ++++++++++++++------
 xen/arch/x86/cpu/common.c             | 135 +++++++++++++-------------
 xen/arch/x86/cpu/cpu.h                |   7 +-
 xen/arch/x86/cpu/hygon.c              |   2 +
 xen/arch/x86/cpu/intel.c              |  74 ++++----------
 xen/arch/x86/domain.c                 |  10 +-
 xen/arch/x86/flushtlb.c               |  19 ++--
 xen/arch/x86/include/asm/cpuid.h      |  17 ++--
 xen/arch/x86/include/asm/hvm/hvm.h    |   2 +
 xen/arch/x86/include/asm/hvm/vlapic.h |   2 +
 xen/arch/x86/include/asm/hvm/vpt.h    |   2 +
 xen/arch/x86/include/asm/trampoline.h |   7 +-
 xen/arch/x86/sysctl.c                 |   6 --
 xen/include/public/sysctl.h           |  22 +----
 xen/xsm/flask/hooks.c                 |   4 -
 xen/xsm/flask/policy/access_vectors   |   2 -
 23 files changed, 238 insertions(+), 255 deletions(-)

-- 
2.39.5


