Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FDC46D1A7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 12:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242159.418906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuou-00010U-7C; Wed, 08 Dec 2021 11:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242159.418906; Wed, 08 Dec 2021 11:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muuou-0000wu-3R; Wed, 08 Dec 2021 11:09:08 +0000
Received: by outflank-mailman (input) for mailman id 242159;
 Wed, 08 Dec 2021 11:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNkV=QZ=gmail.com=jiangshanlai@srs-se1.protection.inumbo.net>)
 id 1muuos-0007Ud-QC
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 11:09:06 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41c645b6-5817-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 12:09:06 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id v23so1664666pjr.5
 for <xen-devel@lists.xenproject.org>; Wed, 08 Dec 2021 03:09:06 -0800 (PST)
Received: from localhost ([47.251.3.230])
 by smtp.gmail.com with ESMTPSA id b18sm2455866pjo.31.2021.12.08.03.09.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Dec 2021 03:09:04 -0800 (PST)
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
X-Inumbo-ID: 41c645b6-5817-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8qfk8rEd7OE7FkctKlJZZ9kD8w0vOU1vAluUq/sa8Oc=;
        b=l7nygggwydXZUAu4zkqtbtTRWY39vFf8FLQk4PTAPrhXI+tzr6CLSDOcbjAIFholoR
         ZflKnIP1dr60YP3ogLki0mS5fzvW2s2sJ5JJjEOnEcnqaWFXcDIqGKfbpVG5umYF7IuV
         XbGokOAZ7qo1h+G1Bfk0/lmfvpWFvQF3DWBtRJl8/CnxVy53GK6huw6txhzHw8osD5Bs
         OMUKn0L37dEZLYVTT7lapANuDqunPxOpcQlA+VF0ffqg433s/FhOPxw6l+uZTJK2URXY
         u7aPuRJNHxAhjbmWX/mle+316jDesbf0dAlNAH5fyU9efV13TpPnGDNyw76aFmOqi4by
         5IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8qfk8rEd7OE7FkctKlJZZ9kD8w0vOU1vAluUq/sa8Oc=;
        b=ka+2mO4WD88MS0SWkqc+1akBJgM5vI4yVuTSBn8xAc0mW2HapwnLhPbCgYx/QHxEA3
         sBfXugyl0zl5/FHNQRgnOoYbPwMIOcZkSCpLrHQkw2p3lTfQ4TnHz8bg2IVFHc/FdYr/
         NZQpIx/JDBEdX8i16uG/MkkNQ3AsPyGF68uvOljklHWnSLd61ADthMS8z83jHCwfP+2x
         zBKORXoGBZp6kcH5/T2akQ4EAK7F+jfUoeK71HhxckUES4gUBTb6CMmHP91Srxoy/7A5
         lJ3FvY7/wF9JofwFeYloiS3duKlt9hYBTnrIKIvOBSGLn7pyRmwUHnNGN2QXbS4L/XKb
         Q6yA==
X-Gm-Message-State: AOAM531CPy2KKRI8Y5xjakU+VynmAkQ1tpLT2ixeW8rtHsscp9i3QHk+
	7AdaeeiVGD3gUPsuz5tuTWk=
X-Google-Smtp-Source: ABdhPJyX9L5YCir717yBDgGNa36Bhmc2dDItA2/uZBarVsl66m2fKt+O9ZG0+5iKAc//bNxdDvNjmA==
X-Received: by 2002:a17:90b:612:: with SMTP id gb18mr6498365pjb.0.1638961744681;
        Wed, 08 Dec 2021 03:09:04 -0800 (PST)
From: Lai Jiangshan <jiangshanlai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	Lai Jiangshan <laijs@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 07/11] x86/entry: Convert SWAPGS to swapgs in error_entry()
Date: Wed,  8 Dec 2021 19:08:29 +0800
Message-Id: <20211208110833.65366-8-jiangshanlai@gmail.com>
X-Mailer: git-send-email 2.19.1.6.gb485710b
In-Reply-To: <20211208110833.65366-1-jiangshanlai@gmail.com>
References: <20211208110833.65366-1-jiangshanlai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lai Jiangshan <laijs@linux.alibaba.com>

XENPV doesn't use error_entry() anymore, so the pv-aware SWAPGS can be
changed to native swapgs.

Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
---
 arch/x86/entry/entry_64.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index 383070aa9272..6100007fd03f 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -990,7 +990,7 @@ SYM_CODE_START_LOCAL(error_entry)
 	 * We entered from user mode or we're pretending to have entered
 	 * from user mode due to an IRET fault.
 	 */
-	SWAPGS
+	swapgs
 	FENCE_SWAPGS_USER_ENTRY
 	/* We have user CR3.  Change to kernel CR3. */
 	SWITCH_TO_KERNEL_CR3 scratch_reg=%rax
@@ -1022,7 +1022,7 @@ SYM_CODE_START_LOCAL(error_entry)
 	 * gsbase and proceed.  We'll fix up the exception and land in
 	 * .Lgs_change's error handler with kernel gsbase.
 	 */
-	SWAPGS
+	swapgs
 
 	/*
 	 * Issue an LFENCE to prevent GS speculation, regardless of whether it is a
@@ -1043,7 +1043,7 @@ SYM_CODE_START_LOCAL(error_entry)
 	 * We came from an IRET to user mode, so we have user
 	 * gsbase and CR3.  Switch to kernel gsbase and CR3:
 	 */
-	SWAPGS
+	swapgs
 	FENCE_SWAPGS_USER_ENTRY
 	SWITCH_TO_KERNEL_CR3 scratch_reg=%rax
 
-- 
2.19.1.6.gb485710b


