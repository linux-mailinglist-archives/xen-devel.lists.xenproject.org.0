Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3EA2AC1F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:06:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882924.1293037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3SW-0003gO-HY; Thu, 06 Feb 2025 15:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882924.1293037; Thu, 06 Feb 2025 15:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3SW-0003bh-Bi; Thu, 06 Feb 2025 15:06:28 +0000
Received: by outflank-mailman (input) for mailman id 882924;
 Thu, 06 Feb 2025 15:06:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEyC=U5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tg3SU-0002qU-Mm
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:06:26 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef3b4ef6-e49b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 16:06:25 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ab34a170526so158449566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 07:06:26 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f48882sm112961666b.19.2025.02.06.07.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 07:06:24 -0800 (PST)
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
X-Inumbo-ID: ef3b4ef6-e49b-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738854385; x=1739459185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUB7j5PU81lCMl9pOkDJYuRzTQOkr6wGbhRdfM2H+aQ=;
        b=QP5hv4Dkr4v+E0E4oH93YA26iWgbymMz+SxINrM6iMzUYqja4G2oQHZdCFz0njJ8TM
         1vXRiqnJh1x8h/txoVDePVbH0eBgEkaohh70jjsH4u0nGncP8aqCPMCAs6jMkppZKyn6
         H0Smy8rMRHpd238SOJ3JbJyrBEgynGVXk/4LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854385; x=1739459185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUB7j5PU81lCMl9pOkDJYuRzTQOkr6wGbhRdfM2H+aQ=;
        b=LlD6FLT7YN661rU5XdSPJCKeuZvahvylA2EKsfHJYm2is7dqpvZqg6Is0jh4Fh/Wrp
         lPAg8uOe6K3w+el2XvrPO5QwPKyVBzekN2bKMPck0Vu9uiBab85r3hhbq7N3g4RAoq0T
         c4dBclyJrQnPaaadgGoHhcTC0JpaPAiR1TTuRktvnXA8keOA43iLMznBUtnC6W6lVBkd
         ZKz+4fYVqbmO0WafC+aNm7hNge9J4+aNKk4fgPB1xwkANXYx3fNtTQyqFxp01rw/c5JD
         s2ssLePpsfC8/SUSfjVWZQ7+T2xLLwtjwXgqQAScX/DTE9urgtg/tHPbm0ZXZpvq7OEP
         TwsQ==
X-Gm-Message-State: AOJu0YyVW8p/e90osBihx9YSWV8xxKBZmCbh0OGU4xI0BhON+0/KkpXt
	2eyqLxNnFIQ0DAj5oVJCtueQMokCqNrFuMGUVvoprHBgxmusdOQ8irpZ0fq48tZGA8Yfb3uXnsj
	n
X-Gm-Gg: ASbGnctjFDpqreI0bUdZcwyDhnUWaEJIF9Ujnj3KnrpPaDKcHGLcwaENfKx4tLS/lAq
	MAZec9DgDbxcOqwjaELN9wOpglDvXaxCUYT2mWhy0PsLNEpqko6NeTNbbG6nuu0fotl8J+ROvHx
	5JAtbS0laPPDOrCBFmZGWUJ0mFX02EXmbF8nrIK8rsJ1/SrStiyRbByWSWGz02gtEkmCjpCcw08
	3ODFJOjzk/rCdZ0BeaHPdqV/s9JzJLOu6J6EWMSQL4v/vgh+0uUdfTXJJQVSBY0J07bcuqBqg75
	UQoM6Hr4WGE/ihfXLZJU
X-Google-Smtp-Source: AGHT+IHRcsWg/VLQDNL8qF0DeBnu7pa0bFWGB0fuxa9uaVmD76F8lAZOmrSiV6xDOUzUv866b59uRQ==
X-Received: by 2002:a17:906:39cb:b0:ab7:6c50:5f19 with SMTP id a640c23a62f3a-ab76c505f30mr442729566b.31.1738854385294;
        Thu, 06 Feb 2025 07:06:25 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 3/5] x86/smp: perform disabling on interrupts ahead of AP shutdown
Date: Thu,  6 Feb 2025 16:06:13 +0100
Message-ID: <20250206150615.52052-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250206150615.52052-1-roger.pau@citrix.com>
References: <20250206150615.52052-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the disabling of interrupt sources so it's done ahead of the offlining
of APs.  This is to prevent AMD systems triggering "Receive accept error"
when interrupts target CPUs that are no longer online.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 074baae2cc3b..f931db0d71c6 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -374,6 +374,8 @@ void smp_send_stop(void)
         smp_call_function(stop_this_cpu, &stop_aps, 0);
 
     local_irq_disable();
+    disable_IO_APIC();
+    hpet_disable();
 
     if ( num_online_cpus() > 1 )
     {
@@ -389,8 +391,6 @@ void smp_send_stop(void)
 
     if ( cpu_online(cpu) )
     {
-        disable_IO_APIC();
-        hpet_disable();
         __stop_this_cpu();
         x2apic_enabled = (current_local_apic_mode() == APIC_MODE_X2APIC);
     }
-- 
2.46.0


