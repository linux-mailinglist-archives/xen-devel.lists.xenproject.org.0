Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BB69F6618
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 13:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860351.1272371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNtKG-0000f2-4z; Wed, 18 Dec 2024 12:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860351.1272371; Wed, 18 Dec 2024 12:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNtKG-0000cu-1n; Wed, 18 Dec 2024 12:38:52 +0000
Received: by outflank-mailman (input) for mailman id 860351;
 Wed, 18 Dec 2024 12:38:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNtKE-0000cm-Ke
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 12:38:50 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06fb9003-bd3d-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 13:38:48 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so3057121a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 04:38:48 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d652ab4ff2sm5382268a12.9.2024.12.18.04.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 04:38:46 -0800 (PST)
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
X-Inumbo-ID: 06fb9003-bd3d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734525527; x=1735130327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gl2sBU/KJugrx1gSriiA8QfWThH3/Rj0B4iEbbxvC7I=;
        b=svdXKCbp/REiL/UM5Mcsn84+sXD82/5upUjEPLuOHMGyAGXdZbcbVvV0wZWS0LHrb/
         RFN9U+hSLSrQr1wssMHjYuVhv1UlxqcsvbREfAbhV2Q8yrl61HjYJLpRuQuHphLZbXyF
         SQkFQ2JuJwJNZJEQy02tpeE2BXSRsIG79Npno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734525527; x=1735130327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl2sBU/KJugrx1gSriiA8QfWThH3/Rj0B4iEbbxvC7I=;
        b=KSRYSoISOc2RumOmRFECi6Z1KtwmBa8vyJINo1EGInFG3lhJ8lW7CzHvEil0l7Qm8s
         mjcadgX+38y61CePQsiXy+93TMAADumTBqhPkrQINNMfCzP0r00WfL+hvdZOfUWtSiqU
         DsjrqXvcKWCwNua+pcNC3JYCkxoAMsuBjY1UW/Exau40oDhkPftdImh5Tjjun6pJiu4d
         LPX6tjAuHlZlR/NoaaevIdkqKCerO8blZhu9l2vL0Y/cMOuFIKuu63h+PwqT3GaHT3b6
         ZsvPmhlJyrYF6YEoUfwdSxQNcfSdMO94b/nK8TvJJ0HeQcTrVd4II4C8hONyzlxsr6aN
         rUDw==
X-Gm-Message-State: AOJu0Yxvpxiv6PgrFbhiBXttnAv91nhHr8ulpUs/kRpbj3aISZMQbkr6
	IpGT27wl5k+W+b+GZNH0lWzC6imyFk0auhJwGewJjMjsNMQMzp4jHmk8CSH3bingXxHL871d/eI
	RHso=
X-Gm-Gg: ASbGncuxztqWeslkXHLJ1Tb+IC7G2VHof9BMKF4kkL8eZsp6in4LsygCwIJc1j0/V8y
	zn0d+cdvvsV/5/CDtwKa+vWA3+timeQASgQHL8RbbIe7GLgqO2+O99nuD6QWLzmoTFhA6P/ymix
	ABXFaxbHVBtKHL8CQY6CMIU2QZ//Z8TtWDZvntKBJMKDmrccrz6nQV3phgVEMSpPjiGj6Lvesmd
	nC+b4QV+RRn6kcnLUaPcdFnsKSZTIlDumPzJvQNXwM4/VvPI/+ZtPqj9hUUMbXagXT/bBLYpJXD
	vzUvsY94tXku0vuEI+MzKMN/LQpltnuwRs0m
X-Google-Smtp-Source: AGHT+IErdKWogH55PesY4lV95oEJT+pWLqP53Dt1q/63JRuFYM0enAhXlhdxLeOYxX4FoWCllF4Wzg==
X-Received: by 2002:a05:6402:5418:b0:5d3:c4a8:d259 with SMTP id 4fb4d7f45d1cf-5d7ee3cc788mr2356673a12.19.1734525527242;
        Wed, 18 Dec 2024 04:38:47 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Use printk_once() instead of opencoding it
Date: Wed, 18 Dec 2024 12:38:45 +0000
Message-Id: <20241218123845.58850-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adjust the message for brevity.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/setup.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 0a748e2c1412..decb566939dd 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1060,7 +1060,7 @@ void asmlinkage __init noreturn __start_xen(void)
     unsigned int initrdidx, num_parked = 0;
     struct boot_info *bi;
     unsigned long nr_pages, raw_max_page;
-    int i, j, e820_warn = 0, bytes = 0;
+    int i, j, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
     bool vm_init_done = false;
@@ -1297,12 +1297,8 @@ void asmlinkage __init noreturn __start_xen(void)
              */
             if ( (map->base_addr_high == 0) && (map->length_high != 0) )
             {
-                if ( !e820_warn )
-                {
-                    printk("WARNING: Buggy e820 map detected and fixed "
-                           "(truncated length fields).\n");
-                    e820_warn = 1;
-                }
+                printk_once(XENLOG_WARNING
+                            "WARNING: Buggy e820 map detected; truncated length\n");
                 map->length_high = 0;
             }
 

base-commit: 171cb318deaa0be786cc3af3599c72e8909e60f9
-- 
2.39.5


