Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96791837E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749015.1157047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA5-0002nV-Q3; Wed, 26 Jun 2024 13:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749015.1157047; Wed, 26 Jun 2024 13:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA5-0002jz-JC; Wed, 26 Jun 2024 13:58:13 +0000
Received: by outflank-mailman (input) for mailman id 749015;
 Wed, 26 Jun 2024 13:58:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA3-0000af-Ci
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:11 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ea343a8-33c4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:58:09 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-79c2c05638cso72828185a.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:09 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:08 -0700 (PDT)
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
X-Inumbo-ID: 1ea343a8-33c4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410288; x=1720015088; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9e+XtFKCBF6+ISNOtkiCTkrjeCZCly6CC4Zvn3nhKU4=;
        b=TYbm68MLDysmVqRx672iicKjQp8G3c+5YQzWh+s0hsAVvQ1RsgslTBnR8QpExkxWFS
         WpdNilK/Y/NYMyBx9sY68ozVvXPMmztYShMdPB43rKtFIJfVvaR/esYhFDLcDs/q9pml
         ToyH91t0W4PX4edbCEsakLtWq9c6VwaGJprXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410288; x=1720015088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9e+XtFKCBF6+ISNOtkiCTkrjeCZCly6CC4Zvn3nhKU4=;
        b=Zsv76ReI6uFyM41hmwcBNW8Etmo0jUlBcM+dhb9L2A02t49eubjxTF/3gT6Qiwhp/D
         j5b5YJJYs7ULeekEbvDgpujxSyNFhk77uNfVKk8hkVw/YMoUWm9zoeWgjRnIGsXzllYG
         ilh/JBAaVevcV83oEMy6sh51rln+mW66jX623uC5oeZFLG4cGQM1dBA/x7dJtWabRHCo
         i1JgdwQhnp+AWIuikZ4ctmfD6lhxJkpxiv0N/Rd65sWPcap7b+P377nAH52HIOtrxR90
         H8FStoBp9/wzv2xtRC2xLhoPSqoFJpNxO90GlPn2l2oYL2spo6XMiMEWf7dBgmfN3Icq
         EY7Q==
X-Gm-Message-State: AOJu0YyiKdmHY0dllCUb2mRw8qnadD3z3VyVEmsx/s2PVDh+Upr9cAn1
	53ox5cQL0Otb4DvkZmu4j1jsl3CTSgR1pg3+cBID0rH9moz1liraL/B0yniwv4rQX41/RI2tWle
	XdlQ=
X-Google-Smtp-Source: AGHT+IFibB7T4hWFxDlipIyL2aXKLogeYDFxykKHCycOIPIolO9DIPzvurs40uQc14FSUfQEpPfE/Q==
X-Received: by 2002:a05:620a:1a8c:b0:795:533f:452c with SMTP id af79cd13be357-79be701cf0fmr1278984585a.73.1719410288627;
        Wed, 26 Jun 2024 06:58:08 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>,
	George Dunlap <georg.dunlap@cloud.com>
Subject: [PATCH WIP 08/14] svm: Do NPF trace before calling hvm_hap_nested_page_fault
Date: Wed, 26 Jun 2024 14:38:47 +0100
Message-Id: <20240626133853.4150731-9-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unfortunately I've forgotten exactly why I made this change.  I
suspect that there were other traces (like MMIO traces) which were
being put before the NPF trace; but to understand the trace record
you'd want to have the NPF information first.

Signed-off-by: George Dunlap <georg.dunlap@cloud.com>
---
 xen/arch/x86/hvm/svm/svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index abe665ee43..240401dc77 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1614,8 +1614,6 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     else if ( pfec & NPT_PFEC_in_gpt )
         npfec.kind = npfec_kind_in_gpt;
 
-    ret = hvm_hap_nested_page_fault(gpa, ~0UL, npfec);
-
     if ( tb_init_done )
     {
         struct {
@@ -1636,6 +1634,8 @@ static void svm_do_nested_pgfault(struct vcpu *v,
         trace(TRC_HVM_NPF, sizeof(_d), &_d);
     }
 
+    ret = hvm_hap_nested_page_fault(gpa, ~0UL, npfec);
+
     switch ( ret )
     {
     case 1:
-- 
2.25.1


