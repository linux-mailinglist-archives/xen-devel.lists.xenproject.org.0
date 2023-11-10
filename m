Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845227E7DCB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630613.983673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPM-0006g9-AP; Fri, 10 Nov 2023 16:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630613.983673; Fri, 10 Nov 2023 16:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPM-0006cg-5w; Fri, 10 Nov 2023 16:31:00 +0000
Received: by outflank-mailman (input) for mailman id 630613;
 Fri, 10 Nov 2023 16:30:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPK-0005EV-Hm
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:30:58 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8704a76a-7fe6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:30:58 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso3607992a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:58 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:56 -0800 (PST)
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
X-Inumbo-ID: 8704a76a-7fe6-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633857; x=1700238657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNlgHH2+ktCzJe/U/s44e1F9wORkNaJQ+ejM+24ZT2k=;
        b=BbnGrakVKILBjh/mOwz4qPmtfkG8ficEXeOtDADmN7WTc1Zs+om04HjmBe2PqFc5e6
         yoxzOWevwCE6avUX2cbv7qGvmWxiI2vZHGMvCj1W6pNUlzVItzQp4pxEfdfyBlLz0h6e
         qhre0BwMrc8HEXkgZ31MwRyq00SuZJ1PCJx90sejmM/azcQTanRuqoSNmY6QeVH6IEXz
         8GqRfW7L+CCTu41lFJ/CIt7ATTf6sSNdjCeLKGbpd3fZ5Nb4BGgQi+zqNuGp3YRbAyK5
         x+XG5GbRzqI3FiUDKplF0MnS8oiTqyuWZyNhuD+alT/3TVDCpTQu6zMmvsmNybmXiMF1
         hhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633857; x=1700238657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNlgHH2+ktCzJe/U/s44e1F9wORkNaJQ+ejM+24ZT2k=;
        b=jkWzxr27Gco+jw0ub0Wvx4sAGWUGnB+hiUs270jn3+xmJ0fXV7e3Z1IwL0nWJztym/
         5JAae/80uVYPNPFVN0m1vh4PJQPiHfohsYJ3nDkzCQbowUymG3ghQk+AZB7VJs1avIXF
         w7SgoSpp0MCxnUYJF3DVWnHzSHilI+pN++wokvjY1zdwLJKXFpdPDsLjxsWUPpQP55Ar
         EnI5xI49x87uXqMqr1KGXFrZhynyOTjnaq8Ag/+tRWEZ27KPVJuMqMlYligKMx8/k5BH
         FUvo0tRYY4BFUSvlEuu0hljM6u9EMKNn5T+mehKwAQB47BQ3gprjyAs0ziRCaczHeiw9
         vatw==
X-Gm-Message-State: AOJu0YxwjvSUXs6GQUjMdJI9bnWKWXkm+1G4I+62+0rC6okD1uXjD4CG
	k9CQPskmzT7Yt8cZ/DJ2HRtRA0hSZKM=
X-Google-Smtp-Source: AGHT+IF+CIKmdcaZQJXwuwaB94ORORfT3+rJCuHr5biDpK6t9A50jLiARFhufiMmCQL42I426ZSNUg==
X-Received: by 2002:a17:907:3606:b0:9b2:982e:339a with SMTP id bk6-20020a170907360600b009b2982e339amr6597509ejc.22.1699633857302;
        Fri, 10 Nov 2023 08:30:57 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 06/15] xen/asm-generic: ifdef inclusion of <asm/mem_access.h>
Date: Fri, 10 Nov 2023 18:30:32 +0200
Message-ID: <7ab8ce9ca633a5a7e5212d0acc62d6e1d4688ca0.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ifdefing inclusion of <asm/mem_access.h> in <xen/mem_access.h>
allows to avoid generation of empty <asm/mem_access.h> header
for the case when !CONFIG_MEM_ACCESS.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- add Suggested-by: Jan Beulich <jbeulich@suse.com>
	- update the commit message
	- remove <asm-generic/mem_access.h>
---
 xen/include/xen/mem_access.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/mem_access.h b/xen/include/xen/mem_access.h
index 4e4811680d..87d93b31f6 100644
--- a/xen/include/xen/mem_access.h
+++ b/xen/include/xen/mem_access.h
@@ -33,7 +33,9 @@
  */
 struct vm_event_st;
 
+#ifdef CONFIG_MEM_ACCESS
 #include <asm/mem_access.h>
+#endif
 
 /*
  * Additional access types, which are used to further restrict
-- 
2.41.0


