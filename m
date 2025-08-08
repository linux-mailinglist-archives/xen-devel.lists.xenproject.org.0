Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC11B1EF76
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075028.1437549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTci-0007wE-9q; Fri, 08 Aug 2025 20:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075028.1437549; Fri, 08 Aug 2025 20:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTch-0007nc-Mf; Fri, 08 Aug 2025 20:23:31 +0000
Received: by outflank-mailman (input) for mailman id 1075028;
 Fri, 08 Aug 2025 20:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcg-0005tW-3i
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c001588-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:29 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-459e20ec1d9so24524555e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:29 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:28 -0700 (PDT)
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
X-Inumbo-ID: 8c001588-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684609; x=1755289409; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQy5F9doSNclJVLZkjhL80Mb6WmdBvuJ0DVpDy8dHq4=;
        b=FSki63DBNfcQkQCdvzrAgcUYcAbHQifdz3T8HUpCPRa2ne/dn7650uNJUfAUkRE6li
         yS4oQXSoOVnzOy4a/0GU8UnbSHjSYcnFWF01RCADBXmF/cJHXyXLD4SJP24ws5l0hmgA
         w+Kh7yR2rOs7vg6CW6VNXZGGke1IQl4bf56/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684609; x=1755289409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQy5F9doSNclJVLZkjhL80Mb6WmdBvuJ0DVpDy8dHq4=;
        b=BNOx/DSrdWd/IB66K5SzsmlvNS6yUAcgf00Qxc/vpgbmmCi5JMWAJTDQO6L49cuG5u
         EzY2U4jLTXBl9SIP7voPfYWHqPirhztKUotArw3LER8bs9Vpu0XyT4oyn4H4JfgbZOm9
         vN6buHl5OZW5IEZhCI9odLrbYTkhzR94Vct4xzA05WGoTSf/G2rJ4qe4w/Tfn8BjdCbX
         Eh/Sixfbeeg1l3xyKECOo/J6l1M2IXhfKkU35Dz/JvFrZnRKZ+DbBIpWoaS3dmBPxid5
         R18ZnRk1RrZhpvtJdipFBCwU2rC3ek/qnTEZbb2Fwwxw+Nq7GrtlE4CZgPzaCcGy9kxq
         7q5g==
X-Gm-Message-State: AOJu0YziYc6Jgz4DJwhRPFelOCFW/gGbTBbddc4YVT+l0ChCbIHiUB+7
	aTF7XQHOt5WpLz9joRoRtXBXeecQU8wOoHIvGJ05aLqJG9vUdtvBZ9kkSOsqWLk1EiywwCIbGJ5
	GbZcctuU=
X-Gm-Gg: ASbGnctIgkNoEBSgOf/JlLLCx2rdorDAIROBgtvp30eLYebpNTOUKfJKdC41zknc0g+
	bcMANN6QK1ktSqCUDh7Kmugsehs0CiMpRYU28O9srngIlTDmi2Iqz5B83rhm/2/wVwu99295hau
	8rB/OL9QrBFu3anMdrIjURsmOgeupxSWjn2s6EAKXsOKKejmme+ekN4OCJZmCl2Qjg7xqByBzFW
	USYNAZ55Kc9oEHjL81Rzm5FP8nzr0uoi0wflJax6wq8fzoNv8kxStyXdSBeywcYkVu15qmKi9Cc
	pdCAKXRf3RT0AiKJyT5IfGU3OIHd3rQgLl12HLKUDY/ecU8wA4dlVsoAEfsLmwYlW7+1M/3EsMR
	3/bfw+7JVZgeP8ZViJzJQ/9JmSNi8TwXZr5lUmwQrP9A+q31egnmBofX7pvcvjelpIOkBCzAVgI
	+g
X-Google-Smtp-Source: AGHT+IH/9GpSQOFtDlOQA9hsHRhGb/JyXgWKb8FMm/mo0y68SuwtQWXBgWJ7uHB6Gv04SCO7jpCHbA==
X-Received: by 2002:a05:600c:4f4a:b0:459:dc92:b95f with SMTP id 5b1f17b1804b1-459f4f3df4bmr39680335e9.5.1754684608927;
        Fri, 08 Aug 2025 13:23:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 12/22] x86/traps: Unexport show_code() and show_stack_overflow()
Date: Fri,  8 Aug 2025 21:23:04 +0100
Message-Id: <20250808202314.1045968-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These can become static now the two traps.c have been merged.

No fucntional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/processor.h | 2 --
 xen/arch/x86/traps.c                 | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 2799d59e385a..1342241742ac 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -333,8 +333,6 @@ extern void write_ptbase(struct vcpu *v);
 /* PAUSE (encoding: REP NOP) is a good thing to insert into busy-wait loops. */
 #define cpu_relax() asm volatile ( "pause" ::: "memory" )
 
-void show_code(const struct cpu_user_regs *regs);
-void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
 #define dump_execution_state() run_in_exception_handler(show_execution_state)
 void show_page_walk(unsigned long addr);
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index ab8ff36acfe6..270b93ed623e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -354,7 +354,7 @@ void show_page_walk(unsigned long addr)
            l1_table_offset(addr), l1e_get_intpte(l1e), pfn);
 }
 
-void show_code(const struct cpu_user_regs *regs)
+static void show_code(const struct cpu_user_regs *regs)
 {
     unsigned char insns_before[8] = {}, insns_after[16] = {};
     unsigned int i, tmp, missing_before, missing_after;
@@ -838,7 +838,7 @@ static void show_stack(const struct cpu_user_regs *regs)
     show_trace(regs);
 }
 
-void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
+static void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
 {
     unsigned long esp = regs->rsp;
     unsigned long curr_stack_base = esp & ~(STACK_SIZE - 1);
-- 
2.39.5


