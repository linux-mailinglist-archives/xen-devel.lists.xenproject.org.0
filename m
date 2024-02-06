Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB584AB7A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 02:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676581.1052779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8y-0008D8-0R; Tue, 06 Feb 2024 01:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676581.1052779; Tue, 06 Feb 2024 01:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXA8x-0008Ae-Sk; Tue, 06 Feb 2024 01:20:59 +0000
Received: by outflank-mailman (input) for mailman id 676581;
 Tue, 06 Feb 2024 01:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4KK=JP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rXA8x-0007Lc-70
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 01:20:59 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb987c98-c48d-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 02:20:58 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so724843966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 17:20:58 -0800 (PST)
Received: from georged-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a3726a5e5fdsm486803ejd.95.2024.02.05.17.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 17:20:56 -0800 (PST)
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
X-Inumbo-ID: fb987c98-c48d-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1707182457; x=1707787257; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdeAbZaD683kMJ6A0ydqo1sa61D2UtSXLjxCScOD/n8=;
        b=IDsQqPYuYB86ldYJXs5m1Xro5/xh67OKgg3LzqNjFKhNpfpo5bqwCY77cei6PsJz1x
         3v0pX9w4Wl7Vib0JumZocoDkegrPtx7E7DBLrwprHFOFQcoAqY7ofdTr+NWjrwANyke6
         EpjArEG+dWZyQAOUyBcP8W7+jThdB18o5uhqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707182457; x=1707787257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdeAbZaD683kMJ6A0ydqo1sa61D2UtSXLjxCScOD/n8=;
        b=Q5Jhl0TGblFQgLZi12quN6QfYaJrh37f9f2VYqIK3jMdyiL79Jz9Qd+QRrX6VJyYyu
         EoD+NDvKGCcDSoLH9IyB4R7RLITq2dp9fta8WK6MC2xa4c1Rwd2wQbi5TLV07j6bbvSb
         J8ZuhqzfL24/8ODWHLl0PNn9gM+uQlkAqa8nIB7+RZHOcryl/dI1PaYduYzT1MJlbr/i
         TuIzv/g42WF1aW0c7weOgwJDtKsQWD88Bs0nMfkhR/0Cov8Eu/pN7MneCd2rpdUM7/4y
         dLqpnkLBezFYuk4OcdRql7YS4Qn2gqt6lc6iZ3X5tHNJoN58TlYwM7O5Zom5bLbVlQ90
         4izA==
X-Gm-Message-State: AOJu0YzKGUXbYLc7zzguyha3LFFqXBvMF5T4zY9HLk/XuBgFiWtC+W6E
	cAI7jgPOYlKlQWAs14qV5qL42vYqvBdYExp8QKnUPJwT6PVlkflWCGvixGura9cDzjyalgU0IYF
	xejk=
X-Google-Smtp-Source: AGHT+IGzy0Am05FrIfvfRq++RKAyzFHRmhuYgfQ+0JosP6aof8bSAW7/VRp8UboTAEikVUvAz8njIw==
X-Received: by 2002:a17:906:882:b0:a37:1dee:a16f with SMTP id n2-20020a170906088200b00a371deea16fmr757939eje.71.1707182457128;
        Mon, 05 Feb 2024 17:20:57 -0800 (PST)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH 5/6] nestedsvm: Remove bogus debug message from nestedsvm_check_intercepts
Date: Tue,  6 Feb 2024 01:20:50 +0000
Message-Id: <20240206012051.3564035-6-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240206012051.3564035-1-george.dunlap@cloud.com>
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changeset ef3e8db8068 ("x86/hvm: Corrections and improvements to
unhandled vmexit logging") introduced a printk to the default path of
the switch statement in nestedsvm_check_intercepts(), complaining of
an unknown exit reason.

Unfortunately, the "core" switch statement which is meant to handle
all vmexit reasons is in nsvm_vmcb_guest_intercepts_exitcode(); the
switch statement in nestedsvm_check_intercepts() is only meant to
superimpose on top of that some special-casing for how to interaction
between L1 and L0 vmexits.

Remove the printk, and add a comment to prevent future confusion.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index d02a59f184..a5319ab729 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1292,6 +1292,10 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
     ASSERT(vcpu_nestedhvm(v).nv_vmexit_pending == 0);
     is_intercepted = nsvm_vmcb_guest_intercepts_exitcode(v, regs, exitcode);
 
+    /* 
+     * Handle specific interactions between things the guest and host
+     * may both want to intercept
+     */
     switch ( exitcode )
     {
     case VMEXIT_INVALID:
@@ -1347,8 +1351,6 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
         /* Always let the guest handle VMMCALL/VMCALL */
         return NESTEDHVM_VMEXIT_INJECT;
     default:
-        gprintk(XENLOG_ERR, "Unexpected nested vmexit: reason %#"PRIx64"\n",
-                exitcode);
         break;
     }
 
-- 
2.25.1


