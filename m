Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83748B37622
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 02:34:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095392.1450437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur46k-00015N-K5; Wed, 27 Aug 2025 00:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095392.1450437; Wed, 27 Aug 2025 00:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur46k-00013p-H1; Wed, 27 Aug 2025 00:33:46 +0000
Received: by outflank-mailman (input) for mailman id 1095392;
 Wed, 27 Aug 2025 00:33:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=73cR=3H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ur46j-00013j-0O
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 00:33:45 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72b011db-82dd-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 02:33:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 73FB16022A;
 Wed, 27 Aug 2025 00:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9CFC4CEF1;
 Wed, 27 Aug 2025 00:33:24 +0000 (UTC)
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
X-Inumbo-ID: 72b011db-82dd-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756254806;
	bh=ZYkeGKuhBRVor5ZT4kK9Jcwi/kBO+3P+cB3LbYg9NVo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HWdcB+YDi09/G6sQEbwfzy7oc4mHlmhJFZZJ+96qQ3N7ywySmUK4gjtbUn47mR9T9
	 DV0ilXqHqW04jcvE0FPVGlXnCUhNhcnDVxx4eD0H+9N7K7DWm+mQLrN+O5ekPX7L5G
	 Fe1/leBfZE5k/KPgQ2e1wVr2/PiN3BCdGLuqJQybZ+zr13SZIpdc95y5I1tb1WVhfL
	 4VpZt+6wXvSoS5AojL5AX1WMGnLKfaIak8v6LtUyiLgQ14xbvi0Ow28WmSWme9O6WJ
	 WWhrcgxuLzr+K2zTJWjfRJtdn41MDXY5jirM56jAQn0SqvQAbC2a9g58CThjyqS+3N
	 KTMcZQDRPvfhw==
Date: Tue, 26 Aug 2025 17:33:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com
cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, Penny Zheng <Penny.Zheng@amd.com>, 
    sstabellini@kernel.org
Subject: Re: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
In-Reply-To: <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2508261728250.3391208@ubuntu-linux-20-04-desktop>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com> <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com> <d6046b53-9317-43d6-bfda-e30d42c09320@gmail.com> <2035b14e-3836-4e80-9dad-8a49ca90864a@suse.com> <alpine.DEB.2.22.394.2508181646220.923618@ubuntu-linux-20-04-desktop>
 <49416df6-83c8-4fa3-bf81-2d1e504ef31b@suse.com> <alpine.DEB.2.22.394.2508251934200.3391208@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

So I ran a test and the appended change, which is based on [1] and
renaming CONFIG_DOMCTL to CONFIG_SYSCTL, is sufficient to resolve the
build issue.

For 4.21, I suggest we go with two patches:
1) global rename of CONFIG_SYSCTL to CONFIG_MGMT_HYPERCALLS
2) stub domctl_lock_acquire/release based on CONFIG_MGMT_HYPERCALLS

Jan, are you OK with this?

Cheers,

Stefano

[1] https://marc.info/?l=xen-devel&m=175421457323598

diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..dedc73412f 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -148,8 +148,17 @@ void arch_dump_domain_info(struct domain *d);
 
 int arch_vcpu_reset(struct vcpu *v);
 
+#ifdef CONFIG_SYSCTL
 bool domctl_lock_acquire(void);
 void domctl_lock_release(void);
+#else
+static inline bool domctl_lock_acquire(void)
+{
+    return false;
+}
+
+static inline void domctl_lock_release(void) {}
+#endif /* CONFIG_DOMCTL */
 
 /*
  * Continue the current hypercall via func(data) on specified cpu.

