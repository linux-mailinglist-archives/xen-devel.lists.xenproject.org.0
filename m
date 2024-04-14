Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE368A4497
	for <lists+xen-devel@lfdr.de>; Sun, 14 Apr 2024 20:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.705686.1102511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rw4Tz-0007KN-Ou; Sun, 14 Apr 2024 18:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 705686.1102511; Sun, 14 Apr 2024 18:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rw4Tz-0007I6-MJ; Sun, 14 Apr 2024 18:21:39 +0000
Received: by outflank-mailman (input) for mailman id 705686;
 Sun, 14 Apr 2024 18:21:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tqaP=LT=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1rw4Ty-0007Hz-MM
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2024 18:21:38 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4fa71f3-fa8b-11ee-b908-491648fe20b8;
 Sun, 14 Apr 2024 20:21:37 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-518c59b41ccso784879e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 14 Apr 2024 11:21:37 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 cw21-20020a170906479500b00a52182471a2sm4509634ejc.13.2024.04.14.11.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 11:21:36 -0700 (PDT)
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
X-Inumbo-ID: d4fa71f3-fa8b-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713118897; x=1713723697; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZA8gV0BBs2cpErMwaLb8X15x2R7+Izkch+dcq6waB4=;
        b=CLHn5+qxaP9ZxJmM2U2LKNrc8dosw5tdgvVwmuPpyoBcu8XEovbVg2sdqY7kwDzjIr
         6m49KQwmEm7Wkvpe9+p8h/4X+ZYuL9WYVbJkuIOI0+m6/vgnI1NNSYAHYtrPavr7sVO8
         HPX9vWmfFMLfra/UTKvWgS8KIaF+ACEwJ7eBNiRqcm9jgNDzD9agEtQ4qvIs6DE1sr/0
         7vJuPEjBQeMkv8IAHNKaSgrLwOZgcWBffelz+R9Xnlnw/S+02DiEAd3YZ+xLZwIN9n3T
         bOFSZE7a/v6Y+30qanx9JHN0ubO3J943/kBDCUOf13gzJMBY8D7a6kzTnJQ8m/QW0ni5
         5a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713118897; x=1713723697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZA8gV0BBs2cpErMwaLb8X15x2R7+Izkch+dcq6waB4=;
        b=QZKQlDE0DSA17VAfVho+ik2qB3k92iClq9IW/rxptXzk8vrb39ONVJSE747wWl5XNf
         xUuBPKutt4qgLgI1WoMyc8tVK1Spg9cAAw3PBgdU0T7MlIs+YckT/50WgTcHcGBYldMm
         1Ra9N7cTqLex94McjXGMFa9hJQMJMgdXPpTyBkbS7TAXmIUFcfv4G4cmylxKlLHQgigZ
         rKb/FXKdrZ1pveQ2PAjQ6VXzaabk9BFAvipA2YlizGttKM/3+SgM4pcX5ep7QtEgVtIo
         OSGCjqaLxwcaDF5qIbuvn6HhztMoDchwa3dGlhKsxxZyrn2ngK15qQuqa/wOr1ZZxjU5
         QcIA==
X-Gm-Message-State: AOJu0YyQzwSWVpxNO66A7WAQREKaPgYjkieTWzihCChhz0+moAxDm5id
	oXqI/JnpPTNWZmQKZ2/ZCp7XfPRXSHMa9A9Sfu89wgQ1/eHu6+7keFZQkqMH
X-Google-Smtp-Source: AGHT+IFK9OXHMFYtHhakU/lLByCUOH+K/meWAJ/WJbxxgxn69rPlS5theOGe8+c82Hdg+jKoWWxLsg==
X-Received: by 2002:ac2:5b43:0:b0:517:b2b:6ca7 with SMTP id i3-20020ac25b43000000b005170b2b6ca7mr4655372lfp.59.1713118896495;
        Sun, 14 Apr 2024 11:21:36 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/monitor: allow fast-singlestepping without enabling singlestep monitor
Date: Sun, 14 Apr 2024 18:21:14 +0000
Message-Id: <4dfbc4c3cfdd36601e0b9b100fa6cd02682be3c6.1713118660.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Reorder the condition checks within the HVM_MONITOR_SINGLESTEP_BREAKPOINT
case to enable fast singlestepping independently of the singlestep monitor
being enabled. Previously, fast singlestepping required the singlestep
monitor to be explicitly enabled through xc_monitor_singlestep, even though
it operates entirely within Xen and does not generate external events.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/hvm/monitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
index 4f500beaf5..2a8ff07ec9 100644
--- a/xen/arch/x86/hvm/monitor.c
+++ b/xen/arch/x86/hvm/monitor.c
@@ -178,8 +178,6 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monitor_debug_type type,
         break;
 
     case HVM_MONITOR_SINGLESTEP_BREAKPOINT:
-        if ( !ad->monitor.singlestep_enabled )
-            return 0;
         if ( curr->arch.hvm.fast_single_step.enabled )
         {
             p2m_altp2m_check(curr, curr->arch.hvm.fast_single_step.p2midx);
@@ -188,6 +186,8 @@ int hvm_monitor_debug(unsigned long rip, enum hvm_monitor_debug_type type,
             curr->arch.hvm.fast_single_step.p2midx = 0;
             return 0;
         }
+        if ( !ad->monitor.singlestep_enabled )
+            return 0;
         req.reason = VM_EVENT_REASON_SINGLESTEP;
         req.u.singlestep.gfn = gfn_of_rip(rip);
         sync = true;
-- 
2.34.1


