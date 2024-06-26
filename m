Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CFC91837A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749013.1157025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA1-0001yS-UE; Wed, 26 Jun 2024 13:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749013.1157025; Wed, 26 Jun 2024 13:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMTA1-0001si-K1; Wed, 26 Jun 2024 13:58:09 +0000
Received: by outflank-mailman (input) for mailman id 749013;
 Wed, 26 Jun 2024 13:58:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e1Ku=N4=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1sMTA0-0000aq-Gt
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:58:08 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d600963-33c4-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 15:58:07 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-795a4fde8bfso396636985a.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 06:58:07 -0700 (PDT)
Received: from georged-x-u.xenrt.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce9318f6sm499371185a.101.2024.06.26.06.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 06:58:05 -0700 (PDT)
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
X-Inumbo-ID: 1d600963-33c4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1719410286; x=1720015086; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQPpBZ6HUrKlZc92OfyG7VzBOtY27D4cEzdSY9vU/Hg=;
        b=h2vjbbUd/ocY5uNF/tmZ6w9P50ZQ6dAV1H9J6EM4hxaR4FGFgk6qXhPDtc6MRFPgPN
         GGAqx9kImj2WbhL6/YeXXpKkbtyRHUisJYLAEbP7dznu7f3bqkQZwK5POmb6xnKxr0bU
         0JJcwHA2J4kOw0RLi4tKXzLeOMLVpyhGQoKXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410286; x=1720015086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQPpBZ6HUrKlZc92OfyG7VzBOtY27D4cEzdSY9vU/Hg=;
        b=m5FXvgzq0xCkHat9bJziWLFcZJfr9cCM5aaTNid4ngKkFMS/EzEI9SG5SCXoG8LJeg
         hngOLISnBxat8b1ldn7Ly/XfFBYPtsQ5mVXm6Y9Hpu84bY3EGNvRKqAEBCxERV8s0Oo4
         CrrF1kzGirdFlevEnretDJZAiN9ZGw5Ip4auZsY54MEMVY0uY2SD00lBDd1uz1qsPuyV
         ls0Z3NpIZohZOTaKadw/pBQ74rRhlEzRGM0i76FSrAk/QbcvYGhYzm3RtuOfLWEqQbTV
         /ULj6XyT0YNWM5ih8qtXFRsMVXkNdCrN8vC0QLJsh7hYp82EYa/6yU9NuO2o//o5JM2e
         a6NQ==
X-Gm-Message-State: AOJu0Yx/XIKVzERbyrKdkuat8shuvD+nfvgVdjHa2HCigNxOr8vGcUNq
	753E/moGIUX1hiwEhRq7yzeTawDqyHapN4QZkmAgOkGzO1MNXA+NwQeSzTm2fe8aMikoeeC8duK
	iM1g=
X-Google-Smtp-Source: AGHT+IHYOMfst4jjFAWDaoBPQd4epq0sodwQ8Lc9GhHBIHXeDf1jkpgCheuuVvuRECqN+bBlRsuDqg==
X-Received: by 2002:a05:620a:414b:b0:797:de98:1420 with SMTP id af79cd13be357-79be6e9f513mr1244126985a.45.1719410285511;
        Wed, 26 Jun 2024 06:58:05 -0700 (PDT)
From: George Dunlap <george.dunlap@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>
Subject: [PATCH WIP 06/14] xen/svm: Remove redundant HVM_HANDLER trace for EXCEPTION_AC
Date: Wed, 26 Jun 2024 14:38:45 +0100
Message-Id: <20240626133853.4150731-7-george.dunlap@cloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240626133853.4150731-1-george.dunlap@cloud.com>
References: <20240626133853.4150731-1-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding an HVM_TRAP trace record is redundant for EXCEPTION_AC: it adds
trace volume without adding any information, and xenalyze already
knows not to expect it.  Remove it.

Signed-off-by: George Dunlap <george.dunlap@cloud.com>
---
 xen/arch/x86/hvm/svm/svm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 988250dbc1..abe665ee43 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2779,7 +2779,6 @@ void asmlinkage svm_vmexit_handler(void)
     }
 
     case VMEXIT_EXCEPTION_AC:
-        TRACE(TRC_HVM_TRAP, X86_EXC_AC);
         hvm_inject_hw_exception(X86_EXC_AC, vmcb->ei.exc.ec);
         break;
 
-- 
2.25.1


