Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8999709F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:09:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814889.1228610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFS-0005Bu-5t; Wed, 09 Oct 2024 16:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814889.1228610; Wed, 09 Oct 2024 16:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZFS-00058w-2p; Wed, 09 Oct 2024 16:09:14 +0000
Received: by outflank-mailman (input) for mailman id 814889;
 Wed, 09 Oct 2024 16:09:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VGrO=RF=flex--ardb.bounces.google.com=3pqoGZwgKCVUxE0y+35G3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@srs-se1.protection.inumbo.net>)
 id 1syZFQ-0004OJ-Cm
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:09:12 +0000
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [2607:f8b0:4864:20::114a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2196a80-8658-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 18:09:11 +0200 (CEST)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6e2acec0109so232117b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:09:11 -0700 (PDT)
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
X-Inumbo-ID: d2196a80-8658-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728490150; x=1729094950; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J4+JRDfPTu3i9TGQoGrO88TmpFKth6/64PHl7TNFJEg=;
        b=krK6VjALPBBPhvit/RNtUFSPAIbU+i2L4Q5mT6N5+18rs95hsRWvOsBFSuZYOFuVgy
         SgpV7Q/QxPbBWNKA3+j1WmUjRGZcrinxb5cteIXrSTUL30EeOBB9zr6O4hGfEBmUI6Qt
         urXxmrV3QMRxE1QxOPWY2y8ft/e1jMkLCs1F7tzbSeKZ7qnND7hrIcpNbnk1e183RIP3
         wbyvV1KWCWQoURzxWVOuUdzLpxkOYcyp0Ix70rX+/gOYVStEB2lTBReh1luVi9akUspD
         5fiB/dZ+/ayx76/AvIirO/N3R7/+ivf3aJxrs5l0cwviQrveohffgf3cyUUFYN/1uQ6/
         629Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490150; x=1729094950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4+JRDfPTu3i9TGQoGrO88TmpFKth6/64PHl7TNFJEg=;
        b=KxczNzekl/niyvUXnAYfHcWPfONi3h6rFM0XAbDQA/athSFgJBAY32CiLliR7ZBoL2
         cRHpV5a3cnIR5kxVrqnlwuZBCGXDxbTtTrMcKCxs8fmOjkJmeKTlzo/pUCy5LHbd6YNU
         u12WT1V1KBUHBOrf40ZQVif6zPftfX0OVxL1XfunLfo3T5v3j9Q/Bp17hyotRUgIkqrx
         LpdK0RmH2i3i9ltVAI1F5/jZa8IPvDDzXMUg1f/EU8QrlJ0ZOBneRXentpXcqZ6FSYpH
         feYY7ckVnJBE/1H1miR6yQ/BdszZhJioxVbovxF5a1dqM0eauNWVnMIgzIw5rL3kGv4Y
         O6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCW16LYUShDNHOzqtlGFuxli45POor3gcYrgajVjehWcHmc7UiitPj796fC9pxBVDyubwzQdosSnCTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7lu0hNDKVawW69jNVCy8bnBPhGGAJuXgOGdb3tCusK8/jtXG6
	MkRnuBPxB3X78FGD0mqRTUiMBXrFihMx6afIldjZyBN5GNFxODK42BIsenBbDzE7jW/ZEA==
X-Google-Smtp-Source: AGHT+IHh/v1gqKUGM1BBNWYUx+HRB+/b48NbVa7MzzwrUC5bvv7YGG3nH+h3kZviumtVaikoqrrnQUYJ
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:6206:b0:6dd:fda3:6568 with SMTP id
 00721157ae682-6e322466d9cmr656517b3.3.1728490150649; Wed, 09 Oct 2024
 09:09:10 -0700 (PDT)
Date: Wed,  9 Oct 2024 18:04:42 +0200
In-Reply-To: <20241009160438.3884381-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20241009160438.3884381-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=ardb@kernel.org;
 h=from:subject; bh=+Q7W1GiOJkPeWPDKOBo9uqagjD9LHIgeoC2Mxh5XnwY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ1t5Wzjs1ffPY46eO1bpusehTCZdacXZnoeNXOLyWxmX
 DlH7szhjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRbdaMDEdb5ytZOn3ZKLTX
 pfp7dSXXttVy8e9+vy+Nfj5V1CyCNYrhv6uByoSdnzjS98bXX9fpSBD+LWc9+VSxb4XCOdMJ2zc 7cQAA
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009160438.3884381-10-ardb+git@google.com>
Subject: [PATCH v3 3/5] x86/pvh: Omit needless clearing of phys_base
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Since commit

  d9ec1158056b ("x86/boot/64: Use RIP_REL_REF() to assign 'phys_base'")

phys_base is assigned directly rather than added to, so it is no longer
necessary to clear it after use.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Tested-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/platform/pvh/head.S | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 5a196fb3ebd8..7ca51a4da217 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -180,13 +180,6 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	ANNOTATE_RETPOLINE_SAFE
 	call *%rax
 
-	/*
-	 * Clear phys_base.  __startup_64 will *add* to its value,
-	 * so reset to 0.
-	 */
-	xor  %rbx, %rbx
-	movq %rbx, phys_base(%rip)
-
 	/* startup_64 expects boot_params in %rsi. */
 	lea pvh_bootparams(%rip), %rsi
 	jmp startup_64
-- 
2.47.0.rc0.187.ge670bccf7e-goog


