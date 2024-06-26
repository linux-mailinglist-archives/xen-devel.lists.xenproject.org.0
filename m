Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6A918385
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749021.1157100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTAC-0004Kh-F6; Wed, 26 Jun 2024 13:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749021.1157100; Wed, 26 Jun 2024 13:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTAC-00049P-0o; Wed, 26 Jun 2024 13:58:20 +0000
Received: by outflank-mailman (input) for mailman id 749021;
 Wed, 26 Jun 2024 13:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA9-0000af-HC
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:17 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 224d103b-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:16 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-79c06169e9cso118414785a.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:15 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:14 -0700 (PDT)
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
X-Inumbo-ID: 224d103b-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410294; x=1720015094; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTGn0K1/CfHD8ie03BFgIyvIbG3pkRzclg3QaK3twgk=;
        b=GOrzi10VMjCDzkCGUc9Bbhjg5PhJY2r6Bo3rq900pIuJbbpnNSZqPB58tNGW2tyARU
         6d7QPtUcNFglGP9FjcfC+n9m27SrRH01IGe/0JVLjTo4DRNfYIjkkvLUJo1nd/sAlhrP
         5X8Oh2YQ9R4a3IEDmPAytfjniHt4LUzB2/WyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410294; x=1720015094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTGn0K1/CfHD8ie03BFgIyvIbG3pkRzclg3QaK3twgk=;
        b=iHi0w8Ynic1QmrOUkqcgpJ4cLZ1NIFgiFHqhWd8Bn9jKbWucrYsIYJIfOVFzK/JE6Y
         6aZwQ2cR9j3d2A5dZeOF6Whei0Be7ZHNy+TTSVLKhVnijP4ayKf5JHiUSFa+vSuzK6M/
         AfmlOInZ5NLFOGaP4m0lviNxdJZ1sZnDycZZkCF+S+MbdZhm6XXap4pTdAE56L3dCRT4
         l6xS3cm46bu0Ih5WWjpmbQuD7TF0MVhUXPTVjNrdhSVHP6mSLEVqcosyVZT2rqPet1w7
         YDDHUE4v/Ax6jKIi6RZInCbrNFJsIpN3rDzNmWCa8zr8ys3XO9uSjF/MOkA7FyckPRZZ
         bv4Q==
X-Gm-Message-State: AOJu0YziF7q4ficrPcUgkRP9CPYtzSWc5Mjko2rkB1jnXYG+KEm3lS7h
	UlsV4qnnFmHbekRNOmR+lZmjIbSbjtyrQGP/Z2cWjrHu/vkCNwRiJcvL+A9wH8c5eEk/+1UuC6Q
	YsCU=
X-Google-Smtp-Source: AGHT+IEdIn4jHdr7DjURLQkv1U3KWYIzU9lQCj249iwKA5u/sbddkQCWiKMo/H6Z+aKLg9OtApUkww==
X-Received: by 2002:a05:620a:4150:b0:795:52e7:a49a with SMTP id af79cd13be357-79be701fef5mr1199488085a.75.1719410294659;
        Wed, 26 Jun 2024 06:58:14 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 14/14] x86/nestedsvm: Note some places for improvement
Date: Wed, 26 Jun 2024 14:38:53 +0100
Message-Id: <20240626133853.4150731-15-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 35a2cbfd7d..dca06f2a6c 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1349,8 +1349,21 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
         return NESTEDHVM_VMEXIT_INJECT;
     case VMEXIT_VMMCALL:
         /* Always let the guest handle VMMCALL/VMCALL */
+        /*
+         * FIXME: This is wrong; if the L1 hasn't set the VMMCALL
+         * intercept and the L2 executes a VMMACALL, it should result
+         * in a #UD, not a VMMCALL exception.
+         */
         return NESTEDHVM_VMEXIT_INJECT;
     default:
+        /*
+         * FIXME: It's not true that any VMEXIT not intercepted by L1
+         * can safely be handled "safely" by L0; VMCALL above is one
+         * such example, but there may be more.  We either need to
+         * combine this switch statement into the one in
+         * nsvm_vmcb_guest_intercepts_exitcode(), or explicitly list
+         * known-safe exits here.
+         */
         break;
     }
 
-- 
2.25.1


