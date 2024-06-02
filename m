Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF2B8D77B4
	for <lists+xen-devel@lfdr.de>; Sun,  2 Jun 2024 22:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734561.1140719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRa-0001Mi-Aq; Sun, 02 Jun 2024 20:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734561.1140719; Sun, 02 Jun 2024 20:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDrRa-0001Ij-4e; Sun, 02 Jun 2024 20:04:42 +0000
Received: by outflank-mailman (input) for mailman id 734561;
 Sun, 02 Jun 2024 20:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nKxc=NE=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sDrRY-0007mz-9Z
 for xen-devel@lists.xenproject.org; Sun, 02 Jun 2024 20:04:40 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 580ba425-211b-11ef-90a1-e314d9c70b13;
 Sun, 02 Jun 2024 22:04:39 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42133f8432aso10412765e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 02 Jun 2024 13:04:39 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd064bb21sm6879280f8f.102.2024.06.02.13.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:04:38 -0700 (PDT)
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
X-Inumbo-ID: 580ba425-211b-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717358679; x=1717963479; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tWBEUL49TAySW16gIvLPk/vey32SSkMkPdHxsZn7CQ=;
        b=d536lnBfkYCeDZ8tKQ1RKRoa+gTQ9riLbc7ml3J2qmS7e66F97Nt8z3CE4O2ykWR5N
         VpWTfgwGWMJnXKIgqpvWfVNoqLUVVrglBaCMQ035MvDL/zFcf3VBRGw2AdI11rVVHLRf
         WDd3R9U/DYCBi+rlNrxfTxnUPcptKq65DenK8ZGzI+aKesRm0SLe4v5Qv1J7Wa0KuWPx
         Ysx+5SSQtWRokxg3Fx13Gb489x4tv8Dsx3kGzHviLcPjCPdUG/FgATsdAhhWXfcEeVC7
         SPia4M3+RHxFDt5eSlPuxnEJ3+aYDPpGwmpnGCMvL3BBrfcqFHwula+DLblMZZIfM/Vm
         aVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717358679; x=1717963479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tWBEUL49TAySW16gIvLPk/vey32SSkMkPdHxsZn7CQ=;
        b=HAldCsgSOweObLxXKHiVOi1YpYtnlPQ6iXz4vkXyn1wTBD6TPC51muSgDlcs2otzfj
         BJjtcZNed/l4QZYZwxZFE70wgPc3EPRRwTdKuUl3Ub9uenccWm9VKvbJrek7gygvrR5U
         BETnixlO5WRWBciA2qRyMe9W7BXM44OlnTHpthzuAoXIBQ+NWTjqDG4AnwOv/kiOVAIb
         afjvExObJoDUqUiWI3+k35KO2X3uX9eWHwk0BlcpzafOzyjI37e/Pp28ivFLmXcdVSHg
         Vn0MAKdiNfwYAbjajwC545ZEBlI9jv2GcK+dbTgUhJgxN5yuLJn+GdjDrWeWQjNHrDiM
         3R2Q==
X-Gm-Message-State: AOJu0YyI1evj8U3RDa3mR0TOVUGu6o/Mw/0vWRlSnFWV9pCKIzH+gVIq
	8OmxNEca7pVIrHzE+uAYXDCjKBqRyQGJ90bmeolpu7/WJ0ieznmVsgPY4g==
X-Google-Smtp-Source: AGHT+IEcZugb1HchUGNH0n8OmUpHLBaLxbPi8w5G8EFFJnI6zPxZpMm0Djp1QyiCnXUS+IGb/ZHrtA==
X-Received: by 2002:a05:600c:1c19:b0:421:2adb:dd4c with SMTP id 5b1f17b1804b1-4212e07009amr63464015e9.22.1717358678880;
        Sun, 02 Jun 2024 13:04:38 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.19? v5 09/10] xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr == 0
Date: Sun,  2 Jun 2024 20:04:22 +0000
Message-Id: <d6fd97b66b5f1a974e317c9d3f72fb139b39118f.1717356829.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717356829.git.w1benny@gmail.com>
References: <cover.1717356829.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Since libxl finally sends the altp2m.nr value, we can remove the previously
introduced temporary workaround.

Creating domain with enabled altp2m while setting altp2m.nr == 0 doesn't
make sense and it's probably not what user wants.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 011cffb07e..52bfeafe3f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -747,8 +747,9 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)

         if ( !config->altp2m.nr )
         {
-            /* Fix the value to the legacy default */
-            config->altp2m.nr = 10;
+            dprintk(XENLOG_INFO,
+                    "altp2m must be requested with altp2m.nr > 0\n");
+            return -EINVAL;
         }

         if ( config->altp2m.nr > MAX_NR_ALTP2M )
--
2.34.1


