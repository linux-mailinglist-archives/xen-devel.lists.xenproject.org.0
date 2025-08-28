Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07CB3A3C7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099224.1453228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureI8-0006AE-E9; Thu, 28 Aug 2025 15:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099224.1453228; Thu, 28 Aug 2025 15:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureI8-000674-8K; Thu, 28 Aug 2025 15:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1099224;
 Thu, 28 Aug 2025 15:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCk-0003MD-5B
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eb3cfff-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:06:21 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b7d497abaso3186235e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:21 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:16 -0700 (PDT)
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
X-Inumbo-ID: 8eb3cfff-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393581; x=1756998381; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmwgODjPN6nPKRNPSq/p+SO1nUaITBGwAJt/YgiqGwc=;
        b=jwy1oQwNYRcL62irk0oR2Em6Gx2HkHqaK27NB6pxQB2Wm68MKZdXofT6zzjcVEPboS
         SRZU89Fhtx1IHMIpEheMplS18BgRFuWz4ZSYiLnXaQK44qGOPWF3SvSNg8qBWXcumnIw
         cm2AZuStNKm/x6SrDJK/4QUrrOC6lra9GgHxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393581; x=1756998381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmwgODjPN6nPKRNPSq/p+SO1nUaITBGwAJt/YgiqGwc=;
        b=CqvQL7L/qG6ugpGBRy7CtanRwRLLYpmRSA+lrg2qUH7BmwV+r7VDlrWRMXwn45tZSE
         KpT6JrEcqDXYGw9SwM3WSmOittxCeEeQi9jJ9OlIrx3Qi4VD9hiWMKY0+woEHCcsulRX
         SQ7qb+pIR7HbOL5AFR8rrv3Wn/KrKoUGfMAqW4mHO15WYB+GqHfcq9s3h8LF3CoYCfky
         9Uat/5oXBSaFANz3uxBuOvxj23pasx689djOGfBqGIEku+HbM7kZ5EBm3t73SEqydAmf
         CC2JcKytS8jzZpQ0vFiYWVc7+Vym6DVqvUc/waVF2R0TfgB4Ed3WBFdDMN9XuQRYNoXb
         02oQ==
X-Gm-Message-State: AOJu0YwIu7MpxttmshVmejfxO8UM7Ex3CarW/sQVK0HH9UNPoDO+m2Rs
	0FPWiYPiMU9do/wsMZtHeeCbGJs21Mo6WT9br8GSoMHXVOY7RkKkyfr/H6HXfekXmXFZosP+1U9
	e2mbb
X-Gm-Gg: ASbGncuQXoUhgTkljWyIjUWJy+YycaU94OR3IvUlDTOBNpe1FQCPTHtiyVz7+KNuL7Y
	IM+Qaj3XMcrDcxPGlrIrJN80FRrkF00dPUfNvqjb4wXHseqNgfWT/OCnVIxlQuLslIIqGMMdsUp
	0BqVmNtCEt8NIQhO7CdYHclRoeibY1bAOG4S6iOU87F5APWR5vq+gvBoJOSNVYutRKw1Wg/UxLQ
	tlcw4xFW0l+qi+0hjGK+jV0uLygj6WqTMnYEl06CQ/aS2tTZMbqWTSNFVUV9Q4kmFLAuYfEG6iW
	qHk0Bx+DEQlYbGaMADh9dnfXgL5JC96WmtWmqHWmqzAtCD0Jh5DB74xZRVIzXXFLF9vjwQn7yUT
	6Wd4JB8FuGLruLHRP9AxZCx7NHitWTWbWF74teFsnD7HNxkKdX6nac6pjB1dUJDYIBGWf1kE9fM
	XM+GA3XSgZ+8ZdSE82XCixQw==
X-Google-Smtp-Source: AGHT+IGYh6/Uc8RXOHSJi5GjnOH/Z0GuayX2Ml2I360nZld1z/zCtY4UfPV1EvgM6x+1eGb0VNNZvg==
X-Received: by 2002:a05:600c:3544:b0:45b:7c4c:cfbf with SMTP id 5b1f17b1804b1-45b7c4cd1e7mr19748025e9.23.1756393580707;
        Thu, 28 Aug 2025 08:06:20 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 18/23] x86/entry: Rework the comment about SYSCALL and DF
Date: Thu, 28 Aug 2025 16:04:04 +0100
Message-Id: <20250828150409.901315-19-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's soon going to be needed in a second location.

Right now it's misleading saying that nothing else would be cleared.  It's
missing the more important point that SYSCALLs are treated like all other
interrupts and exceptions, and undergo normal flags handling there.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/x86_64/entry.S | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 01b431793b7b..ca446c6ff0ce 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -39,10 +39,9 @@ FUNC_LOCAL(switch_to_kernel)
         leal  (,%rcx,TBF_INTERRUPT),%ecx
 
         /*
-         * The PV ABI hardcodes the (guest-inaccessible and virtual)
-         * SYSCALL_MASK MSR such that DF (and nothing else) would be cleared.
-         * Note that the equivalent of IF (VGCF_syscall_disables_events) is
-         * dealt with separately above.
+         * The PV ABI, given no virtual SYSCALL_MASK, hardcodes that DF is
+         * cleared.  Other flags are handled in the same way as interrupts and
+         * exceptions in create_bounce_frame().
          */
         mov   $~X86_EFLAGS_DF, %esi
 
-- 
2.39.5


