Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6C4871EA9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 13:12:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688770.1073342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTdq-0007qx-T2; Tue, 05 Mar 2024 12:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688770.1073342; Tue, 05 Mar 2024 12:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhTdq-0007o8-Pz; Tue, 05 Mar 2024 12:11:30 +0000
Received: by outflank-mailman (input) for mailman id 688770;
 Tue, 05 Mar 2024 12:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mb5t=KL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rhTdo-0007Lm-SV
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 12:11:28 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e1e1807-dae9-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 13:11:27 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-564372fb762so7173760a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 04:11:27 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gg4-20020a170906e28400b00a45b1194dacsm11429ejb.126.2024.03.05.04.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 04:11:25 -0800 (PST)
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
X-Inumbo-ID: 7e1e1807-dae9-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709640686; x=1710245486; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlpNxqFoSSL8NwQwwcPUu6ZlDVgEwc5H6nYzlIRPqfQ=;
        b=Cz7201utjqDyr5WU93gcP0Tsqi5T5JHC4DvXtJIcVtnweOj1aRX3Kzsj5RjuzUGI1o
         PwLEvzUCmCdo/OjjsuuunhQQG3DZr1MHX7fIfh+3L0rWYrLWBA2Fl+ZFNM/PNHt/tx4Y
         GX3li/q9A6a115XguLgmoY0kOyVQWS4nmmTZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709640686; x=1710245486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlpNxqFoSSL8NwQwwcPUu6ZlDVgEwc5H6nYzlIRPqfQ=;
        b=AVdmAmO6z4j4dgNco1hUamWwa0sU5WoX1knf1bpwkLsUi7gHMnsbJ4Xq3PPAS4ekak
         PvfYAVvnoNNrpBxHZtjlw0Rb7KZsQKkNKH6Iwfq7XWwuThbILFlCZrI8i0+PF1bM8Jpu
         uzxAewSLVTGSEJUISiqh8pAqNtBloDCGRhajTFSemr/CNDACpVr4BN95UaHISCRt4aTm
         cwI8lDUMzdXsn7XsQ/IQ/Y7R8Vuzx5YbNgamQTIX4wgnGH2nB/PvCkzdVSvCvwFtdNQP
         xe/eCrlAB2HVui3dMUXzL9NQxF/lM1aDsciagXGz6nKDbLNauQuOaqxO9/n4PMyev9yk
         /IkQ==
X-Gm-Message-State: AOJu0YzkBtt/UcHzZEvsFp91a2+1moQ37UzIN7edjhsrxRtgsKkBNxmm
	ALR3BVfS4KhmLVDNQ3IzTjo15zr2U4jpJnE2Hhv53+tHpS3oQSRBB/hktqDUyVqN1X2BCuzv+dV
	E
X-Google-Smtp-Source: AGHT+IGKF7MVptTJX8bpq+u++FqTm0yMW4c9pc8bxMUAAdOp88S7xT4NB26ZY7rr8aWOTnoRyXfkKA==
X-Received: by 2002:a17:906:408d:b0:a45:69f5:c3c9 with SMTP id u13-20020a170906408d00b00a4569f5c3c9mr3304715ejj.6.1709640686294;
        Tue, 05 Mar 2024 04:11:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] xen/virtual-region: Include rodata pointers
Date: Tue,  5 Mar 2024 12:11:20 +0000
Message-Id: <20240305121121.3527944-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These are optional.  .init doesn't distinguish types of data like this, and
livepatches don't necesserily have any .rodata either.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/livepatch.c           | 6 ++++++
 xen/common/virtual_region.c      | 2 ++
 xen/include/xen/virtual_region.h | 3 +++
 3 files changed, 11 insertions(+)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 888beb273244..cabfb6391117 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -788,6 +788,12 @@ static int prepare_payload(struct payload *payload,
     region->text_start = payload->text_addr;
     region->text_end = payload->text_addr + payload->text_size;
 
+    if ( payload->ro_size )
+    {
+        region->rodata_start = payload->ro_addr;
+        region->rodata_end = payload->ro_addr + payload->ro_size;
+    }
+
     /* Optional sections. */
     for ( i = 0; i < BUGFRAME_NR; i++ )
     {
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index b74030d70065..d2efe9e11492 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -13,6 +13,8 @@ static struct virtual_region core = {
     .list = LIST_HEAD_INIT(core.list),
     .text_start = _stext,
     .text_end = _etext,
+    .rodata_start = _srodata,
+    .rodata_end = _erodata,
 };
 
 /* Becomes irrelevant when __init sections are cleared. */
diff --git a/xen/include/xen/virtual_region.h b/xen/include/xen/virtual_region.h
index c76e7d7932ff..7712f6ad3632 100644
--- a/xen/include/xen/virtual_region.h
+++ b/xen/include/xen/virtual_region.h
@@ -16,6 +16,9 @@ struct virtual_region
     const void *text_start;                /* .text virtual address start. */
     const void *text_end;                  /* .text virtual address end. */
 
+    const void *rodata_start;              /* .rodata virtual address start (optional). */
+    const void *rodata_end;                /* .rodata virtual address end. */
+
     /* If this is NULL the default lookup mechanism is used. */
     symbols_lookup_t *symbols_lookup;
 
-- 
2.30.2


