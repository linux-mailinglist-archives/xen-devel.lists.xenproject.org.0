Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3F17E099C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 20:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627330.978320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz082-0003Kn-Qq; Fri, 03 Nov 2023 19:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627330.978320; Fri, 03 Nov 2023 19:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz082-0003IN-MV; Fri, 03 Nov 2023 19:46:50 +0000
Received: by outflank-mailman (input) for mailman id 627330;
 Fri, 03 Nov 2023 19:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qz081-0002vU-Vh
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 19:46:49 +0000
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [2607:f8b0:4864:20::112d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba2d877d-7a81-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 20:46:49 +0100 (CET)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5afa5dbc378so29662657b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 12:46:49 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 ef19-20020a0562140a7300b0063f88855ef2sm1022825qvb.101.2023.11.03.12.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 12:46:47 -0700 (PDT)
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
X-Inumbo-ID: ba2d877d-7a81-11ee-98d8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699040807; x=1699645607; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpl41EZOjbyg7XVTpO/UNcoGu53oa0BiEkeSWfPcuVI=;
        b=itFAp0aZBbuKpmvApoO9fRzHcEnBv9hlza5dqcixBh0Qo2kcnrskRf0hjDuFw0jthg
         ChnCdpcOZYn/BjkcIMhWz/StljThmnr6+sTpTi68R82YH8RUlC7QncQG/b2RKOblOKtA
         tOSAcIkDuLb1TT1j42msPY+Sv95NitnXNX1yU+/JrmkFTJtqQZuxOIN6O6Wh6z5dkRJh
         6Y3VUz8G5hEAjIJE/+Pkf8fUkeXRWZs+kmcZe0pbz5dewMDEE0I6sQWVvqzhyEJzAevC
         uTFZH4ntpTLwhq/r9YL+Xs2LI8sKs4Po7acLSfFnvoiyuTGiacufV53Nf7S9htbaq30x
         aerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699040807; x=1699645607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wpl41EZOjbyg7XVTpO/UNcoGu53oa0BiEkeSWfPcuVI=;
        b=VRL7nABDyjo+iBBftDuGshUdeiCpU92nP55FtVO+06OFFFHjDBnbhc+7tQQFibwpcG
         NL4FOaqusrWm15xowkxZjMYAQ88JB8380aCP9x5Su5ZdtFvMIvX6U0IYRRKZn4pkbKEL
         nC9VybnJoybKUpK0wLq94yHVWtBGaQNAwqrLGTSwHBV4/9sZH3agvoBA1kUBHtBh8ofy
         /H/G5/M4vZIyZXAPYB5SEzUnWyPkaLurM/SiBXZDEn+zQiMaZrkJ3BhC21Oj31aHd7tF
         yqK3mypRkXWRVErjQ/p8h58zd3t+e37j8xknlWd1qnCOwWRn9FILFes/QfLERs5iZqGg
         5wbw==
X-Gm-Message-State: AOJu0YxU+kCpUnapyIkT1znAEHxmk2v67theGff2jsE2MWMuEzJ/yN0l
	ZsyUZslXgXOQ9ewfxR4sWVFHJOboAq8=
X-Google-Smtp-Source: AGHT+IFIsiNTYs6B0gk0IIINbN64zIztMVccIMt2EE26aigghBFgcHmejDrGE4GDsrXT8affct0jcg==
X-Received: by 2002:a0d:ddd3:0:b0:5a7:bb6e:7958 with SMTP id g202-20020a0dddd3000000b005a7bb6e7958mr4385337ywe.7.1699040807516;
        Fri, 03 Nov 2023 12:46:47 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Jason Andryuk <jandryuk@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH for-4.18 2/2] golang: Fix bindings after XSA-443
Date: Fri,  3 Nov 2023 15:45:51 -0400
Message-ID: <20231103194551.64448-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103194551.64448-1-jandryuk@gmail.com>
References: <20231103194551.64448-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new bootloader_restrict and bootloader_user fields in the libxl idl
change the bindings.  Update them.

Fixes: 1f762642d2ca ("libxl: add support for running bootloader in restricted mode")
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/golang/xenlight/helpers.gen.go | 9 +++++++++
 tools/golang/xenlight/types.gen.go   | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 3ecffdf0ef..35e209ff1b 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -1112,6 +1112,10 @@ x.Bootloader = C.GoString(xc.bootloader)
 if err := x.BootloaderArgs.fromC(&xc.bootloader_args);err != nil {
 return fmt.Errorf("converting field BootloaderArgs: %v", err)
 }
+if err := x.BootloaderRestrict.fromC(&xc.bootloader_restrict);err != nil {
+return fmt.Errorf("converting field BootloaderRestrict: %v", err)
+}
+x.BootloaderUser = C.GoString(xc.bootloader_user)
 x.TimerMode = TimerMode(xc.timer_mode)
 if err := x.NestedHvm.fromC(&xc.nested_hvm);err != nil {
 return fmt.Errorf("converting field NestedHvm: %v", err)
@@ -1465,6 +1469,11 @@ xc.bootloader = C.CString(x.Bootloader)}
 if err := x.BootloaderArgs.toC(&xc.bootloader_args); err != nil {
 return fmt.Errorf("converting field BootloaderArgs: %v", err)
 }
+if err := x.BootloaderRestrict.toC(&xc.bootloader_restrict); err != nil {
+return fmt.Errorf("converting field BootloaderRestrict: %v", err)
+}
+if x.BootloaderUser != "" {
+xc.bootloader_user = C.CString(x.BootloaderUser)}
 xc.timer_mode = C.libxl_timer_mode(x.TimerMode)
 if err := x.NestedHvm.toC(&xc.nested_hvm); err != nil {
 return fmt.Errorf("converting field NestedHvm: %v", err)
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index 6a9ebb3fec..7907aa8999 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -577,6 +577,8 @@ DeviceTree string
 Acpi Defbool
 Bootloader string
 BootloaderArgs StringList
+BootloaderRestrict Defbool
+BootloaderUser string
 TimerMode TimerMode
 NestedHvm Defbool
 Apic Defbool
-- 
2.41.0


