Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDBB0C0AF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 11:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051312.1419638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnAe-0001gq-N6; Mon, 21 Jul 2025 09:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051312.1419638; Mon, 21 Jul 2025 09:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udnAe-0001dm-Jf; Mon, 21 Jul 2025 09:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1051312;
 Mon, 21 Jul 2025 09:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipwj=2C=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1udnAc-0001aA-Ui
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 09:50:54 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e50598a-6618-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 11:50:49 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ae0bc7aa21bso808906866b.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 02:50:49 -0700 (PDT)
Received: from MinisforumBD795m.citrite.net ([185.68.248.203])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d68a1sm644918866b.46.2025.07.21.02.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 02:50:47 -0700 (PDT)
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
X-Inumbo-ID: 2e50598a-6618-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753091448; x=1753696248; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JupB7wQUeaRIgl+FtGwuSXAc9701c3guvXgiVNpfwsA=;
        b=hFM82t9WzEbmL5KtgH7KO0CWfhY0cL78cSbwTZtzVijZ5f7U78TRNyt95H2hvrTizB
         znyeWg5j68hx4r08FWvZyjHPZlJdiuiZJnSTCBZrM4mMA3RHp4RJwklNGVW3QaTgzdm4
         DQ3MMtaO9npYYld6bIMy4hOJ6rQ6E7KqO9p0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753091448; x=1753696248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JupB7wQUeaRIgl+FtGwuSXAc9701c3guvXgiVNpfwsA=;
        b=aZcQJ1C4k2J+yZf3RUypCQQvlb4RtN3k1IDQH9/1c+ykoWb6Ivpc2ib5jFhk+nH20N
         pTOFlpBFA9se8HXnVgvqS8eYnSy9XWCXi0Lqq4nwmagvo8lIcxgXAnH25EH7gGG6wlMi
         nkELKsvZc0sfF4wYqzAUjSTJzuxPrzCSadDfldFp9EpJPbGn50suKQhlAfhZDibkmexn
         8F8dUOISnyrcEkMlu8RYQbS4dyV7mQL0f8azOt8FmQDP1yHva3n0NXhWfWr8xUrTjwJK
         XcISu7nYurbFk/rQahAe2itHDOgoLwgTFZJmtbA3q2zDLAOXeEtxTLwJG6jb7HHLrwKN
         Z8fA==
X-Gm-Message-State: AOJu0Yxc33N09Em8A2vzr62BrW8RVnPIeEkJ+pBEPaCFL6grQrLZ9qNP
	R9cww3quJp/qL7I14NBOeTMiCVczApYq62eFTpxbuhwPPaqy1CYYlMSjL+Rvk222bFSGidYUT+v
	ceRwQxPsbxg==
X-Gm-Gg: ASbGnct0DnRyUntwLT5NlG0nvhn6VVH/5YtbW7usEWE+14CsuXamxGEum/3v+k43ufU
	IkgMWWzF6eslVq5Icm/Wksm6AgdpNkyM983GsHacTaSHsvoGQEEuNUlUb0OZ8qA1ncpLllWSjvo
	NhNF3kwq8vN3SKYVurScoPdZ8QT3PsxFj5uCsh1K3RuFCFHwaFOFEJUtRr/T5GoHjEo8HJRBrJM
	NPHlo0BX3Jm1JRSrwf6iZ1nFRs8RsQWUq8y6WIxmiwABFT2jmXpI9U29o+5nBHdXsW531dN1or8
	FdmpHT4HE53/+mRBETT3rhGen1fw4J5XBsiiB6WUFip3jBMx2WjiWdazerrWlhKX1uUvzRXNx4V
	bII6reod+U2rBKDqip6KKRDiAC0+VAvwIbnlSOkKqsXualRkbRT+l06uWM+/01KE=
X-Google-Smtp-Source: AGHT+IGyVNODHzPjds2ar0kbWHTHrhj5/yBIjDqVq1VEytlDhy4c4yw87Cgq3ebGPb8cpPooWkno+w==
X-Received: by 2002:a17:907:a588:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae9ce1c2d25mr2067386166b.57.1753091448252;
        Mon, 21 Jul 2025 02:50:48 -0700 (PDT)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] sched/core: For a new metric, add vcpu->nonaffine_time
Date: Mon, 21 Jul 2025 11:49:49 +0200
Message-ID: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To monitor the effectiveness of vCPU soft-affinity on NUMA hosts,
we'd like to create a vCPU metric that accumulates the amount of
vCPU time running outside of the soft affinity mask of the sched-unit:

- Add a new time counter, nonaffine_time to struct vcpu.

- Accumulate the nonaffine_time on vcpu_runstate_change():
  Account the time spent in the RUNSTATE_running state outside
  of unit->cpu_soft_affinity: It is always initialized and defaults
  to cpumask_all (bits for all NR_CPUS set), so we only accumulate
  nonaffine time when the vCPU runs on an unset CPU (non-affine).

In the next patch, this field can be used to retrieve the accumulated
nonaffine running time e.g. using vcpu_runstate_get().

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 xen/common/sched/core.c | 20 ++++++++++++++++++++
 xen/include/xen/sched.h | 11 +++++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 13fdf57e57..489255b9c6 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -260,6 +260,23 @@ static inline void vcpu_urgent_count_update(struct vcpu *v)
     }
 }
 
+/*
+ * For accounting non-affine running time of a vCPU, return true if
+ * the vCPU is running in RUNSTATE_running state while not on a CPU
+ * in unit->cpu_soft_affinity.
+ */
+static inline bool nonaffine(const struct vcpu *v,
+                             const struct sched_unit *unit)
+{
+    /*
+     * unit->cpu_soft_affinity is always initialized and defaults to
+     * cpumask_all (bits for all NR_CPUS set), so we only accumulate
+     * nonaffine time when the vCPU runs on an unset CPU (non-affine).
+     */
+    return v->runstate.state == RUNSTATE_running &&
+           !cpumask_test_cpu(v->processor, unit->cpu_soft_affinity);
+}
+
 static inline void vcpu_runstate_change(
     struct vcpu *v, int new_state, s_time_t new_entry_time)
 {
@@ -285,6 +302,9 @@ static inline void vcpu_runstate_change(
     {
         v->runstate.time[v->runstate.state] += delta;
         v->runstate.state_entry_time = new_entry_time;
+
+        if ( nonaffine(v, unit) ) /* When running nonaffine, add delta */
+            v->nonaffine_time += delta;
     }
 
     v->runstate.state = new_state;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7..aba60afd4f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -198,7 +198,18 @@ struct vcpu
 
     struct sched_unit *sched_unit;
 
+    /*
+     * The struct vcpu_runstate_info contains the vCPU time spent
+     * in each runstate and the entry time of the current runstate.
+     *
+     * Note: This field is used for the guest runstate shared memory area.
+     * Therefore, it is part of the frozen guest API and cannot be changed.
+     */
     struct vcpu_runstate_info runstate;
+
+    /* vCPU time running outside the scheduling unit's soft_affinity mask */
+    uint64_t         nonaffine_time;
+
 #ifndef CONFIG_COMPAT
 # define runstate_guest(v) ((v)->runstate_guest)
     XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest address */
-- 
2.43.0


