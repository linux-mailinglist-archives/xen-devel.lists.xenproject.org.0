Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D434A90E87E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 12:40:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743622.1150540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJsjx-00075h-Co; Wed, 19 Jun 2024 10:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743622.1150540; Wed, 19 Jun 2024 10:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJsjx-00073C-AA; Wed, 19 Jun 2024 10:40:33 +0000
Received: by outflank-mailman (input) for mailman id 743622;
 Wed, 19 Jun 2024 10:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jAuG=NV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sJsjv-000736-US
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 10:40:32 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59371bf3-2e28-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 12:40:31 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-795ca45c54cso346103085a.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 03:40:30 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798abc06e93sm595417985a.82.2024.06.19.03.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 03:40:29 -0700 (PDT)
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
X-Inumbo-ID: 59371bf3-2e28-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718793629; x=1719398429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p95lb1ctHFp3T74sDBuumFZbHTUwbXXyA3hdbJYiDoU=;
        b=QYHNfRWa77VHvGYm48mqjXTC+/3MyjD2TJ4DBvXkCeAqZQuXyF047/hr7UxCV0Lxdt
         mnu6jqzFETvHdfpTcy0xBgIP70Ehr48V1reJLNtHI1Cvkp92WAiWAoNsdEoD/UsX4i/G
         gd4hz1jS7KAfMvDELctwAB2bY5yF8SdfWug0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718793629; x=1719398429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p95lb1ctHFp3T74sDBuumFZbHTUwbXXyA3hdbJYiDoU=;
        b=vOCqn1g1OPaTvxiDkyq8vEMKulmvBlbvgX0O+K8ROmJwsfRB1m5yNXVG9my0gvV189
         6c+oxhi8BppG8UEEP0Y58TQdKfiBB/D4vyh5YFSPtAuwxGsmWwzV58RCPmjEUFL65fKy
         u95xLaNF6QmameHOROxnngj3SQCUDjFysOejpJhPFP+qCfzSYLDo7e4okkzdSBk/9RUe
         KXEZag+RXBOYxyJwo9Qi4zcIbiOMHzxxnD0+7s1ncxMQVFxvp4k9cO+MWjM2ukgg3jnC
         vfFHA/p2l1v52Fz0DclleRSKO6dZbt8OE+aCG7UBQbEC+kwSeGNW+5+ELZDlEXhhY+7g
         Qwhw==
X-Gm-Message-State: AOJu0YxDlbV1ylKCXVMN6x0fmS4xrFbZXmP0I5qFMeDjmbOe5NezY0UZ
	jhrr8kjdeOXgVVh+kML2EWJRItapzxCX+V96b6o/C9HssmwQPDPOOY8eQk8Yvs4gFOIgOCYgaJB
	RYFhEeA==
X-Google-Smtp-Source: AGHT+IHxMvPNCyIKkLf/mcijHPuzQSLiYwyl/idVDNGL3pZUbs0K2RBLMulv8SBRXWBQPgj1vIs+sQ==
X-Received: by 2002:a05:620a:4510:b0:795:5120:97ac with SMTP id af79cd13be357-79bb3ebd69fmr203624885a.53.1718793629451;
        Wed, 19 Jun 2024 03:40:29 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH v2] x86/xen/time: Reduce Xen timer tick
Date: Wed, 19 Jun 2024 11:40:15 +0100
Message-ID: <20240619104015.30477-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current timer tick is causing some deadline to fail.
The current high value constant was probably due to an old
bug in the Xen timer implementation causing errors if the
deadline was in the future.

This was fixed in Xen commit:
19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future

Usage of VCPU_SSHOTTMR_future in Linux kernel was removed by:
c06b6d70feb3 xen/x86: don't lose event interrupts

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 arch/x86/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes since v1:
- Update commit message;
- reduce delay.

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 52fa5609b7f6..96521b1874ac 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -30,7 +30,7 @@
 #include "xen-ops.h"
 
 /* Minimum amount of time until next clock event fires */
-#define TIMER_SLOP	100000
+#define TIMER_SLOP	1
 
 static u64 xen_sched_clock_offset __read_mostly;
 
-- 
2.45.1


