Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E697B83DCC7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 15:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672074.1045726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTNbD-00080c-GP; Fri, 26 Jan 2024 14:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672074.1045726; Fri, 26 Jan 2024 14:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTNbD-0007yu-Ca; Fri, 26 Jan 2024 14:54:31 +0000
Received: by outflank-mailman (input) for mailman id 672074;
 Fri, 26 Jan 2024 14:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fFt0=JE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rTNbC-0007ym-Hh
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 14:54:30 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce731290-bc5a-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 15:54:29 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3392b15ca41so317278f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 06:54:29 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bs8-20020a056000070800b003392ded41c7sm1443176wrb.39.2024.01.26.06.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 06:54:28 -0800 (PST)
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
X-Inumbo-ID: ce731290-bc5a-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706280868; x=1706885668; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KuYHgPjRBSumtIQFHphC5j4fRNERZSq58LYLW0abvxU=;
        b=vGWF70YxKT9hwj5G1YjCmfb2lFLeN+83T7qg7cltkav1ApFBQuDw9zZhXe6a+ikmmm
         UPwoNNFN020d8wdTFmFU7yPIXIjw34BplEgbNgGavCQ9ennhbW8FVZu3oHnXvJjcFzjx
         u5niDeLBO6BN1fnRSxVcjKBEyYuM+1Jq0+51M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280868; x=1706885668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KuYHgPjRBSumtIQFHphC5j4fRNERZSq58LYLW0abvxU=;
        b=OtWGU0cKEhI6ZGmc6KoDoIrgxkU8QstQ6g9QoIfbEdDbpE93wqEXURn+mYJeWcjhjW
         cGmH8REqZbKoL+BeZ5e2BGMRDMXcx8Jr6xjj47SAXS62cMnUA+ebSCIftzAptz+LrH3E
         DAfnIwqj0KgbVXBMCbhFY7Ucua6WAxGLPNN410lT/j5ZggrdhaN9EdfeLlinBM0Xm93B
         7WVfDoJ0kw4vXLlwsdwIiKedv7ExT61vLa8la2xtzMBxveZtDSExQdSvpmyrMGa+hJxF
         7/hrqCJ6Lt7JzgxXf5D6ALxHA5OMj3kWtNaReobq/DK2WwKw2iiMr0ROUmYz05S4m4eE
         Zl+A==
X-Gm-Message-State: AOJu0Ywdox9PkIWaH77WaIeDDVORK0Y6Sc5K3g17MBJkslEfyB7NKAiq
	P99ZlO/AOt10craP2MaXo922F3I8xVLRtaKiWAEgmO2yIWUbyU2txlOcdOOzWMk63hFPDeUAj/t
	Q
X-Google-Smtp-Source: AGHT+IH3+znAItiJ9LfzBEsgiyn7JE0q7utpHrGwcSiaYn0+UWMb5jD2aupcqHsdtaLeO9jI8ncccg==
X-Received: by 2002:a5d:5f91:0:b0:337:caa9:4a16 with SMTP id dr17-20020a5d5f91000000b00337caa94a16mr742377wrb.45.1706280868525;
        Fri, 26 Jan 2024 06:54:28 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Edwin Torok <edwin.torok@cloud.com>
Subject: [PATCH] x86/entry: fix jump into restore_all_guest without %rbx correctly set
Date: Fri, 26 Jan 2024 15:54:18 +0100
Message-ID: <20240126145418.39520-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

e047b8d0fa05 went too far when limiting obtaining the vCPU pointer.  While the
code in ist_dispatch_done does indeed only need the vCPU pointer when PV32 is
enabled, the !PV32 path will end up jumping into restore_all_guest which does
require rbx == vCPU pointer.

Fix by moving the fetching of the vCPU pointer to be done outside of the PV32
code block.

Reported-by: Edwin Torok <edwin.torok@cloud.com>
Fixes: e047b8d0fa05 ('x86/entry: replace two GET_CURRENT() uses')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/x86_64/entry.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 44f25def86bc..ecdd6e5b47a5 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1139,8 +1139,9 @@ FUNC(handle_ist_exception)
         movl  $EVENT_CHECK_VECTOR,%edi
         call  send_IPI_self
 1:
-#ifdef CONFIG_PV32
+        /* For restore_all_guest. */
         mov   STACK_CPUINFO_FIELD(current_vcpu)(%r14), %rbx
+#ifdef CONFIG_PV32
         movq  VCPU_domain(%rbx),%rax
         cmpb  $0,DOMAIN_is_32bit_pv(%rax)
         je    restore_all_guest
-- 
2.43.0


