Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D40730717
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549177.857600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uvv-0004jJ-T7; Wed, 14 Jun 2023 18:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549177.857600; Wed, 14 Jun 2023 18:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uvv-0004hJ-QH; Wed, 14 Jun 2023 18:09:27 +0000
Received: by outflank-mailman (input) for mailman id 549177;
 Wed, 14 Jun 2023 18:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9Uqb-0005LA-IL
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:57 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d478b45e-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:03:57 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-62df5fbb186so16921436d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:57 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:54 -0700 (PDT)
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
X-Inumbo-ID: d478b45e-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765835; x=1689357835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAh4UqPFdXosdcswDrRJWUQizeR7RUgorIbVDVeVJRs=;
        b=X+HlpS06rAtgVCWY0crtm+qx5JIids4vI3b6kS1cielwi9+1KHwe8ZAW7NtcW1Z4dJ
         xunVSd5e+wrLJ/PVIloMK9NEOtmpqgQc7Tpd4RZMRndpZo71t1uPhD5gECa5aNILl8td
         8DwsZ3wa6NMUFTKC1DbUoyU5VXRLm7uIRTBu0feXqtgmXe1pn4bKJDXe8tBjm5opRq6p
         ifZV5Ljavi/jaXHW47l9Y8PBDtLroLi24LXzi5VUoirojILRHnBli8L3Xryafz7Y6mYl
         BeTK84ZRr9521JAOZ2i6l4vS01DiBYRXdrkRY2ynvtg9r5tTKgIwM7izEjDbOKRywIAs
         kd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765835; x=1689357835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAh4UqPFdXosdcswDrRJWUQizeR7RUgorIbVDVeVJRs=;
        b=QTgQ6viuMpTnmCp7J3TQCmu1V4TE2QV6pphYnj7RnIeIDXHh4V4qmpPrvObAMeEOEH
         xddo5J376fpznFIlnuGLCLDb0OWALJ2AHPUrofxHw9dH3iKElKDJqoddfgxSS01kQIkA
         EtsqFjME21uSrxXeYf8fzyoW6hXdEEyn+NQboy4vYNEk+k3KDpgOc4RJHcJMFdRQsUWn
         rc7zZH8/cYX8kvHV15JiywbK0X2Ey/A4T0OqdhQxG0AFgh1XY/eM0f0taoTfwPBJtN9I
         bkzL8O6xCHJhlfsRiZ6sct221L1Q4yXxKdslCDMhVO8BlauSreS1b5WR+AuHvVLM2vEJ
         syrA==
X-Gm-Message-State: AC+VfDwjLIwbieqYXjbGKslUdsyMMb66jRP2IAxmzrnLoba2VZ6G1jip
	nFDL/uwkdUcTQEsrW5RQYtn1BjQTK3k=
X-Google-Smtp-Source: ACHHUZ4u4u7yyWfrVT40b45uaJ1E5n895mmSlLtzhbqTU3eM3yEL4zsg9xAWfESP7KfaFvF61oAkvA==
X-Received: by 2002:a05:6214:daa:b0:62d:f8e7:3047 with SMTP id h10-20020a0562140daa00b0062df8e73047mr6018004qvh.55.1686765835302;
        Wed, 14 Jun 2023 11:03:55 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 10/15] libxc: Include cppc_para in definitions
Date: Wed, 14 Jun 2023 14:02:48 -0400
Message-Id: <20230614180253.89958-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose the cppc_para fields through libxc.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
v4:
Rename hwp to cppc
Add Anthony's Ack
---
 tools/include/xenctrl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 8aedb952a0..2092632296 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1892,6 +1892,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
+typedef struct xen_cppc_para xc_cppc_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
@@ -1923,6 +1924,7 @@ struct xc_get_cpufreq_para {
                 xc_ondemand_t ondemand;
             } u;
         } s;
+        xc_cppc_para_t cppc_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.40.1


