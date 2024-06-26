Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEBD918380
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749016.1157053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA6-0002ve-Do; Wed, 26 Jun 2024 13:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749016.1157053; Wed, 26 Jun 2024 13:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA6-0002nS-7T; Wed, 26 Jun 2024 13:58:14 +0000
Received: by outflank-mailman (input) for mailman id 749016;
 Wed, 26 Jun 2024 13:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA4-0000af-SP
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:12 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f79cb05-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:11 +0200 (CEST)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6fa0d077694so3120525a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:11 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:09 -0700 (PDT)
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
X-Inumbo-ID: 1f79cb05-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410290; x=1720015090; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoUNb50e5mp4r/rfJxIl3Pgj6LDhk8b0bQb4gVKsKhE=;
        b=PpoQCUpAqOGNwjGr6KtIYp/S0oIJDezuV6wy9FjvADuo6SsB1tLo3xG3Qk1uqBv7zB
         J371uYBpYTEZ7miQSCHixN81YnO5oJnCJiPxk9sNeVQAtM1BdLfOMtsiO1mml3+S+BRw
         LHHt7tUtPSeSLNkzapQ3ZJECJlbzGH5CJQ3dU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410290; x=1720015090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoUNb50e5mp4r/rfJxIl3Pgj6LDhk8b0bQb4gVKsKhE=;
        b=QWIFzWp6s57N/fqzLdRR615b1ZE3A+8/QBYKrHnoGL1YPm+yEyI9CY7Pyl4p7NF5uD
         1FGK3Rok2veat1hLoL2IOUGpXQwuY5HIMRF4BCDwiJQVFxxmDDoGfl5NBLwu82Q+QNJf
         FZPJfUxXMdMyXI8sqWOUt4cQz6mzNJ9bvM0rg0dJPmKMXonc/9UPHW2pxuzZQv7JrXys
         ixUWRpPg8iG/4GmceHJVeMiR0XTHA84i5soit69F4NI5jln35CyunXupeX2Kls/QEFOQ
         Ybo11JrC/Bz0n76j95Bb92cpAe3a8SZ/4hr/JoLcrm8O8QLrzyI30KvsQOZ0QXbXH7+l
         64aQ==
X-Gm-Message-State: AOJu0YxnAnpLuTVSuGeGuuhF4UUvSfw6EiaDBNMUcEd7GKD+yzvd1x6J
	It+Pp0y0DkxbaSEpwpYK4ZeYrcFu2q5hQSIRaB5XcXrt29ID+rToFn49s1W6Ai1/ck42N5er+Ex
	ujX4=
X-Google-Smtp-Source: AGHT+IGZ+U34IqEAjwOGmI73wgJjK4aN/mscCA7HeKeH+LcTuTCPz+Z7Ougl3kzzmNIG9S+yzLeCNg==
X-Received: by 2002:a9d:3e49:0:b0:700:d3eb:c554 with SMTP id 46e09a7af769-700d3ebc59fmr1552872a34.1.1719410289917;
        Wed, 26 Jun 2024 06:58:09 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 09/14] x86/emulate: Don't trace cr reads during emulation
Date: Wed, 26 Jun 2024 14:38:48 +0100
Message-Id: <20240626133853.4150731-10-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hvmemul_read_cr ends up being called fairly freqently during
emulation; these are generally not necessary for understanding a
trace, and make processing more complicated (because they show up as
extra trace records within a vmexit/entry "arc" that must be
classified).

Leave the trace in write_cr, as any hypothetical writes to CRs *will*
be necessary to understand traces.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 xen/arch/x86/hvm/emulate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 02e378365b..e78f06cf3f 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2180,7 +2180,6 @@ static int cf_check hvmemul_read_cr(
     case 3:
     case 4:
         *val = current->arch.hvm.guest_cr[reg];
-        TRACE(TRC_HVM_CR_READ64, reg, *val, *val >> 32);
         return X86EMUL_OKAY;
     default:
         break;
-- 
2.25.1


