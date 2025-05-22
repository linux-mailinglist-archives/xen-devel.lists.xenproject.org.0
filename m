Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76821AC1844
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994749.1377599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiU-0001TN-IU; Thu, 22 May 2025 23:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994749.1377599; Thu, 22 May 2025 23:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiU-0001Oj-Dl; Thu, 22 May 2025 23:52:50 +0000
Received: by outflank-mailman (input) for mailman id 994749;
 Thu, 22 May 2025 23:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ6A=YG=flex--seanjc.bounces.google.com=3zrgvaAYKCUc1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@srs-se1.protection.inumbo.net>)
 id 1uIFiT-0007r7-7e
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:49 +0000
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [2607:f8b0:4864:20::44a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc73a312-3767-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 01:52:47 +0200 (CEST)
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-745e89b0c32so1323987b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:47 -0700 (PDT)
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
X-Inumbo-ID: dc73a312-3767-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957966; x=1748562766; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rhj01gCo8zRE4ihm7mjL7ntGfsdvBwkWydK82rp0ihs=;
        b=KeKegVuRjwnB7wkfg8niwpFF/dEqbqYM7fJ8MhyLQ3m0zFsBP2poa/ch89APCFSsXt
         7WRKQbFdM7MXIFNXsbl8Ehh6dZC6fBAQUJf5rUyrkhvFeIfAYYS5GaWWO/IEC2WoL8mo
         B4GhmEbbWGKapMMsltjH9OdeP0CSRfT1Y/Ap+zkVBVIBpxizBHzTFpKnTdcKqKoSIICB
         TY++uZEpKEffxaS6OAWHjEYYOEpZhnSKfGJie4y7DYqxNEWYlHI2sVgJ0xqNUVdPuERl
         eRuadfMsUdmGvfwTb+m1RlVvajirmZpt0HqtA0KVkE2qY5tMZc1Iqai3OJTzRpo9BM56
         zyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957966; x=1748562766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhj01gCo8zRE4ihm7mjL7ntGfsdvBwkWydK82rp0ihs=;
        b=O5fYeaK0QgrIjtZMAGfFIXKISmLr/VfcVGAJaICItaefjhVIUeaHg5bzXLGKub6uvf
         tTBgOCouYVrdDLIdfkTM0XYcTmUficdhRDx2gH70DdWHSd0eS4/uQbCRQustkkP9i/Kv
         mr2G8lHfl/PUzTbrx5ImBDQDzlVWi3NQtbstPCksj+esujEyrEx8LGUO5Hr0Zz5QWS9H
         Iqda9U0Q6kv6dtOe0UxbU9c6aoSd1W5KaS4k7BaQxfn9LoscTIw1fpKoNu4LHSaB5nMl
         ibZu45YZSFcVydp4XNOv/cQpEvHk7Zm0ikgd/FqawQp1iIi4eqdk2C4aYSbHzOhQkUoY
         qM9w==
X-Forwarded-Encrypted: i=1; AJvYcCWz04Uca2fY7eVfmcA4sG0+r5pASOdaSzETP7Vo6tRn7W69MR8M+NOW8LknSY9rUo7tOYlGhzh3pc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyF05nu+dseOUX1mNCGPjIc3i66Ncswve15f9CI4pw9Y/sZ33R+
	NzoxiNmOv6LYxfRDVYSauBK+r85CkfYcRbfMDkrlBvQWbaRh40vLpGF5/a0e/5xhHPjjyrp5z7I
	kzbK80Q==
X-Google-Smtp-Source: AGHT+IFcXQOzVhyYyYRvvhxCpwMSPB5FWKzf2e+esBNAhvIROXYgtUD8Jyc4OswUVSapVQEWgVgXYmNxl9c=
X-Received: from pfbhd3.prod.google.com ([2002:a05:6a00:6583:b0:742:a60b:3336])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8594:b0:740:9a42:a356
 with SMTP id d2e1a72fcca58-742acce36c5mr31613679b3a.11.1747957966116; Thu, 22
 May 2025 16:52:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:17 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-8-seanjc@google.com>
Subject: [PATCH v3 07/13] xen: privcmd: Don't mark eventfd waiter as EXCLUSIVE
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't set WQ_FLAG_EXCLUSIVE when adding an irqfd to a wait queue, as
irqfd_wakeup() unconditionally returns '0', i.e. doesn't actually operate
in exclusive mode.

Note, the use of WQ_FLAG_PRIORITY is also dubious, but that's a problem
for another day.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/xen/privcmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index c08ec8a7d27c..13a10f3294a8 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -957,7 +957,6 @@ irqfd_poll_func(struct file *file, wait_queue_head_t *wqh, poll_table *pt)
 	struct privcmd_kernel_irqfd *kirqfd =
 		container_of(pt, struct privcmd_kernel_irqfd, pt);
 
-	kirqfd->wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &kirqfd->wait);
 }
 
-- 
2.49.0.1151.ga128411c76-goog


