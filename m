Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81888D3280
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731694.1137396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCg-000054-EA; Wed, 29 May 2024 09:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731694.1137396; Wed, 29 May 2024 09:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCg-0008UO-AT; Wed, 29 May 2024 09:02:38 +0000
Received: by outflank-mailman (input) for mailman id 731694;
 Wed, 29 May 2024 09:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCf-0006nV-Gh
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:37 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31767148-1d9a-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 11:02:37 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-6ad74e5afeaso3776796d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:37 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ac17a0a904sm51825196d6.140.2024.05.29.02.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:33 -0700 (PDT)
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
X-Inumbo-ID: 31767148-1d9a-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973355; x=1717578155; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBMxjkuwWl1wII73dXqlBR3D5ru/taoCebE2CrhXMFU=;
        b=VTybKQemf7cHSxbVVTJb3uNNKfTB+KGbuRp3klWjuRwfIe82OLN6JIRMJXv0SElzp8
         wIwFR02fAgDdW6iqa5fcnRnLID6CtQR7aFYMCZD3l8gvufitWms4uSj3/mLbe+Wlh4+s
         gYohS9eJ/KfQW+CH/iOdW3g0sRss1B3kc6F8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973355; x=1717578155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UBMxjkuwWl1wII73dXqlBR3D5ru/taoCebE2CrhXMFU=;
        b=U8Fsfvxy5r79F0JT0BsngRaDB9+JIZKUckwqOtxXIDCXi3CRrLmaBJ0+ixF6GZa+Zg
         pu6CWEz0fnm2EMneghYp78h83+hHJt0FzJ0FcFsib1s4O7pmQsHOPl0NMv3RhI8vd8gE
         Cv4GBbhM1YUmnLv2OyDAvwcd0B6APRInWzbZGYncG1z59ciVtcP9k0qOwr8v6TVkOJcg
         Vjbf0D6seRq282k0YVpX6UGo1d1ZCX7JKy3cQ8A48sKy4zN/LPpF5DqLa8vr7vleKcfh
         s1B+ABcGCVsJvxV/VFnnVCPSKp5c3VOg16mFC0uHTstlFohYi+5fexvzzf1wk+UltOKA
         21yg==
X-Gm-Message-State: AOJu0YygypSdB1HgIyriMq0+60CICpOaAd7HIez4Ej/WT7e/GH3G0U4j
	YXxf0I4b/a/ZFdsCXJf7HvTzLesQHe1HbtIIgCQjJjaQKIqtJFgRTF/NCPS08eKbyEOQmMFD+2M
	d
X-Google-Smtp-Source: AGHT+IGDSyevI0ED2KfpIKZoqT7Y+oUaLl05GYOTvdKaWQqSzqfErWgaoruVthSi4UMNX+Z5fAaxJQ==
X-Received: by 2002:a05:6214:20a6:b0:6ad:5cb2:b6c with SMTP id 6a1803df08f44-6ad9f9596e6mr24131236d6.9.1716973354286;
        Wed, 29 May 2024 02:02:34 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 7/9] x86/irq: deal with old_cpu_mask for interrupts in movement in fixup_irqs()
Date: Wed, 29 May 2024 11:01:29 +0200
Message-ID: <20240529090132.59434-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Given the current logic it's possible for ->arch.old_cpu_mask to get out of
sync: if a CPU set in old_cpu_mask is offlined and then onlined
again without old_cpu_mask having been updated the data in the mask will no
longer be accurate, as when brought back online the CPU will no longer have
old_vector configured to handle the old interrupt source.

If there's an interrupt movement in progress, and the to be offlined CPU (which
is the call context) is in the old_cpu_mask clear it and update the mask, so it
doesn't contain stale data.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index ae8fa574d4e7..8822f382bfe4 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2602,6 +2602,28 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
                             &cpu_online_map);
         }
 
+        if ( desc->arch.move_in_progress &&
+             !cpumask_test_cpu(cpu, &cpu_online_map) &&
+             cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )
+        {
+            /*
+             * This CPU is going offline, remove it from ->arch.old_cpu_mask
+             * and possibly release the old vector if the old mask becomes
+             * empty.
+             *
+             * Note cleaning ->arch.old_cpu_mask is required if the CPU is
+             * brought offline and then online again, as when re-onlined the
+             * per-cpu vector table will no longer have ->arch.old_vector
+             * setup, and hence ->arch.old_cpu_mask would be stale.
+             */
+            cpumask_clear_cpu(cpu, desc->arch.old_cpu_mask);
+            if ( cpumask_empty(desc->arch.old_cpu_mask) )
+            {
+                desc->arch.move_in_progress = 0;
+                release_old_vec(desc);
+            }
+        }
+
         /*
          * Avoid shuffling the interrupt around as long as current target CPUs
          * are a subset of the input mask.  What fixup_irqs() cares about is
-- 
2.44.0


