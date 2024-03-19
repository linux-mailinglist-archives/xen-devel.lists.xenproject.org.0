Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46787FCD0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 12:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695330.1084990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmXfn-00056O-S7; Tue, 19 Mar 2024 11:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695330.1084990; Tue, 19 Mar 2024 11:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmXfn-00053t-Pa; Tue, 19 Mar 2024 11:30:27 +0000
Received: by outflank-mailman (input) for mailman id 695330;
 Tue, 19 Mar 2024 11:30:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmXfm-00053n-KF
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 11:30:26 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 137f0bab-e5e4-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 12:30:23 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-568a53d2ce0so6496996a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 04:30:23 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n6-20020a509346000000b0056b924663ecsm863967eda.59.2024.03.19.04.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 04:30:22 -0700 (PDT)
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
X-Inumbo-ID: 137f0bab-e5e4-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710847822; x=1711452622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NDEnUgv4i8PUN86IfXiq7G6DNci7ZGUA6BUwFHP5UwI=;
        b=gdBhxiM4jPGBg6YgJQCKqRAzMCjNz2MsQVeIBm9+bDnqFmS8zete8QrFxHEt+tbpN5
         3CCBIItiYXXs0tRNmy2Z9/9TX2lPw6DavZmF5R/EZotCVLYxI8/gSHtM1KausICzzyR9
         WdRrnj8DX+GB6g7TLmZ1KLlQtcMIGZgo/NATg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710847822; x=1711452622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDEnUgv4i8PUN86IfXiq7G6DNci7ZGUA6BUwFHP5UwI=;
        b=CQwRxwzD07k65BST4GTJ8LvaUb+Kh/WZ02PyquD0+R4Bzyh0SX40QRClcSdobnSIGP
         F5fpGzBDaE85iO5oTtdA0YtAU+aI4WwnNvYWnwRvU3e614+7u/ZjxF/2GrtRRtSWXHj6
         ryNUt5RUq8cTnDENIWKSzUVNzQQo3qiOiOwxcWomXB8/FZx6wP4o7hMy8mYjhk0qs+z6
         idzhGsH1KFqqeZmg0cj8NnJLrzA74Lj0YKPoVFKNz2i3XAHB5h7b+vHLxfNxgAB0urp6
         vd9YXIMhYHjSZZzjeGesPZBzpOE3MbkS38RD/1Yx6r3eguH/Kj4lFn+PbS9CfS4Q/AOA
         25UQ==
X-Gm-Message-State: AOJu0Yx2uBBCduNJDKPF6ogq7qjGZTcy4iddNemy7F2OCN/3mrKYKPzV
	jw17cm2OCVSieNiN6H0jrR6JGYy8Q5RPbAojJpJIt0sYHUJtw0ZsJJOQr445w8bixVO+DEjTlkb
	q
X-Google-Smtp-Source: AGHT+IFOLEG7tXMTSlla+4BWCx2CFF3aIwAB4cQ95y05YV40BijCXcLCePcbQRBfdCfy9rqghEoOAw==
X-Received: by 2002:a05:6402:2b87:b0:568:9ba8:8f1a with SMTP id fj7-20020a0564022b8700b005689ba88f1amr11555422edb.7.1710847822529;
        Tue, 19 Mar 2024 04:30:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen/rwlock: Don't perpeuatite broken API in new logic
Date: Tue, 19 Mar 2024 11:30:20 +0000
Message-Id: <20240319113020.3843309-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The single user wants this the sane way around.  Write it as a normal static
inline just like rspin_lock().

Fixes: cc3e8df542ed ("xen/spinlock: add rspin_[un]lock_irq[save|restore]()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
---
 xen/drivers/char/console.c |  6 +-----
 xen/include/xen/spinlock.h | 14 ++++++++------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ccd5f8cc149f..349ce2a50d96 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1159,11 +1159,7 @@ void console_end_log_everything(void)
 
 unsigned long console_lock_recursive_irqsave(void)
 {
-    unsigned long flags;
-
-    rspin_lock_irqsave(&console_lock, flags);
-
-    return flags;
+    return rspin_lock_irqsave(&console_lock);
 }
 
 void console_unlock_recursive_irqrestore(unsigned long flags)
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 593cba640ee6..f210aa77f581 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -278,12 +278,6 @@ static always_inline void spin_lock_if(bool condition, spinlock_t *l)
  */
 bool _rspin_trylock(rspinlock_t *lock);
 void _rspin_lock(rspinlock_t *lock);
-#define rspin_lock_irqsave(l, f)                                \
-    ({                                                          \
-        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
-        (f) = _rspin_lock_irqsave(l);                           \
-        block_lock_speculation();                               \
-    })
 unsigned long _rspin_lock_irqsave(rspinlock_t *lock);
 void _rspin_unlock(rspinlock_t *lock);
 void _rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
@@ -294,6 +288,14 @@ static always_inline void rspin_lock(rspinlock_t *lock)
     block_lock_speculation();
 }
 
+static always_inline unsigned long rspin_lock_irqsave(rspinlock_t *lock)
+{
+    unsigned long flags = _rspin_lock_irqsave(lock);
+
+    block_lock_speculation();
+    return flags;
+}
+
 #define rspin_trylock(l)              lock_evaluate_nospec(_rspin_trylock(l))
 #define rspin_unlock(l)               _rspin_unlock(l)
 #define rspin_unlock_irqrestore(l, f) _rspin_unlock_irqrestore(l, f)

base-commit: d2276b86e5eb8dd2617d917f7b49cdd1f29ac299
-- 
2.30.2


