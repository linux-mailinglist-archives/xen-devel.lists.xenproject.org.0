Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F25E8D327E
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731690.1137355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCW-0007JO-BS; Wed, 29 May 2024 09:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731690.1137355; Wed, 29 May 2024 09:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCW-0007GK-8Y; Wed, 29 May 2024 09:02:28 +0000
Received: by outflank-mailman (input) for mailman id 731690;
 Wed, 29 May 2024 09:02:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCV-0006nV-3E
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:27 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b3c2558-1d9a-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 11:02:26 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-43f87ba7d3eso8992531cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:26 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43fb16b9770sm52129441cf.6.2024.05.29.02.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:24 -0700 (PDT)
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
X-Inumbo-ID: 2b3c2558-1d9a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973345; x=1717578145; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBJNMx2S48pD7GARHNMhhe8qb1w3vAy8ioD3DvtxaK0=;
        b=h9HQD/CtQY7JTRR314/fx5bxpAqhS/rmFY2phrwXtUnOMsOcrbt+FI+IeRb29Zd+nd
         P6LN6vcwDq5/L9m+8t508co5xltNbfdxtPNykzdw71RBxWCh8dgSKqQE9k9t1ugjGlCn
         Z7VFnCxAYQhA24rpL0USKvu7EBJGXAu2TVVQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973345; x=1717578145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBJNMx2S48pD7GARHNMhhe8qb1w3vAy8ioD3DvtxaK0=;
        b=dsfrday04ntS/rA0twvR5OYLlEGyC4JZKqS+hrnom1JQ5vPCPrhw+cgTSEynRypMtq
         JUXUHMnYh+jb1e5+kkrpw3h4r7p4YNRyjyYHfWvPqepvucM/zZWSV9R4hGK4W46VyBlF
         CzOeTMgJVtaPXltXlOcALuBX30zjVOCMKk+jpkGyR3YRzWsjavLH0vQzJT2ARq4TSMbu
         jEKMGSjSRI0F3VPf3IP6R4ntK/MVoESrM2qio6uSMhvXuQcWz+53roXB3Ti9pq+gG8yQ
         Ed+WDjdaD6v4q6rI7TNS6vZqDqLerTlge+4O2Hf3U3kHuhFllzylmD1hlcwKEyZxvPyk
         9eVw==
X-Gm-Message-State: AOJu0YzltI1JhO+aSzNLo56x7goXzBDzmPNqUJjW52t0hD8YWVAiuqAC
	fXycsdrS5g5W859QY9uCUDQgNqgqtHrV6bNMX/0hYACgjhiNkLxaHi2PK2rdSDLhLkS9HZrZwUw
	7
X-Google-Smtp-Source: AGHT+IFHrl3J3xvu8cJrUJptqFsfoUxoTDgqwa6ABiAHIEPBty/+m2iD8CgPpr1TfF9sKgBxFQzAoQ==
X-Received: by 2002:a05:622a:1811:b0:43e:e6e:21df with SMTP id d75a77b69052e-43fb0e8584emr144478991cf.15.1716973345017;
        Wed, 29 May 2024 02:02:25 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.19 3/9] xen/cpu: ensure get_cpu_maps() returns false if CPU operations are underway
Date: Wed, 29 May 2024 11:01:25 +0200
Message-ID: <20240529090132.59434-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
a cpu_hotplug_{begin,done}() region the function will still return success,
because a CPU taking the rwlock in read mode after having taken it in write
mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
as it should always return false when called with a CPU hot{,un}plug operation
is in progress.  Otherwise the logic in send_IPI_mask() for example is wrong,
as it could decide to use the shorthand even when a CPU operation is in
progress.

Adjust the logic in get_cpu_maps() to return false when the CPUs lock is
already hold in write mode by the current CPU, as read_trylock() would
otherwise return true.

Fixes: 868a01021c6f ('rwlock: allow recursive read locking when already locked in write mode')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/cpu.c         | 3 ++-
 xen/include/xen/rwlock.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index 6173220e771b..d76f80fe2e99 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -49,7 +49,8 @@ static DEFINE_RWLOCK(cpu_add_remove_lock);
 
 bool get_cpu_maps(void)
 {
-    return read_trylock(&cpu_add_remove_lock);
+    return !rw_is_write_locked_by_me(&cpu_add_remove_lock) &&
+           read_trylock(&cpu_add_remove_lock);
 }
 
 void put_cpu_maps(void)
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index a2e98cad343e..4e7802821859 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -316,6 +316,8 @@ static always_inline void write_lock_irq(rwlock_t *l)
 
 #define rw_is_locked(l)               _rw_is_locked(l)
 #define rw_is_write_locked(l)         _rw_is_write_locked(l)
+#define rw_is_write_locked_by_me(l) \
+    lock_evaluate_nospec(_is_write_locked_by_me(atomic_read(&(l)->cnts)))
 
 
 typedef struct percpu_rwlock percpu_rwlock_t;
-- 
2.44.0


