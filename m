Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C4772E2F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578805.906559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5L1-0008DE-Ng; Mon, 07 Aug 2023 18:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578805.906559; Mon, 07 Aug 2023 18:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5L1-0008Ae-Io; Mon, 07 Aug 2023 18:52:19 +0000
Received: by outflank-mailman (input) for mailman id 578805;
 Mon, 07 Aug 2023 18:52:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5L0-0004GT-Pg
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:18 +0000
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [2607:f8b0:4864:20::f31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 873a5ef7-3553-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:52:16 +0200 (CEST)
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-63d2b7d77bfso33900716d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:16 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:14 -0700 (PDT)
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
X-Inumbo-ID: 873a5ef7-3553-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434335; x=1692039135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DT7oP40QgonifT7RMQUN+ralNpmx0+TMvzxcNwj95c=;
        b=o79SYks5IRvTS4g7YFj3Lu/26R982JYey+le3GNqqQ9vr75f+fceIelAaAy0n1d36i
         rK/yTGhB7hJSpPR3VQxG/o3k9fFPuc1wQmpjhXNnZ09CsNsAPu7VpGvhoT96iPlhvZ3z
         FMX9BATYxLRLpjtHVyRSkl9cGWiaitofv5EyDzOpSC/1XjZUDlG9kRDl/TGJK150lJA0
         7OEvIYAwZAvLXkOFMxd/6vtr6UP9lcwzqCbqo3YoeD3EFRswCQYfnock849n2/+dgVb9
         7N51deTZQNkjCEV62PwG5owEBvj/y6aXb/ExKR7SMkvYFGQ4YpDXMFtnOhejB0+ne+Pr
         3PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434335; x=1692039135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8DT7oP40QgonifT7RMQUN+ralNpmx0+TMvzxcNwj95c=;
        b=fYANuRHKG/ZBSL1w6D3EZxupuKJl4Vo9Oq1ppvBb6X8cwplzHvdvZW7eyXdUCfdhES
         eFJc976KPP01dsFzE4YINs27jMEkU497VfDzI0hCC0VWPpzEQ1t/IwfpSHpO7rgOCsg1
         ap5as4p3XJpe9uDkf2lEFHPJ5x8G3+74ZRsVBo1c10DhobLgPbvWNwYzz4aJNPzLTjOk
         roZA+4EYG83V2Ld35ejyvzgZoY//Ugfk6VDF1+dF9TEvDcJtYtTXUoc7R8ngsBFrMnEh
         j7WC6RQPwEHSucX1Uk9SGbiqtqi2Z32JD7bE4Eno9gRwqQt/LcDdkJ5787JYlcyltmZu
         jTTw==
X-Gm-Message-State: AOJu0YyVQojfsuuT/oCOQyAA91swqX84y9I2RHIbHYAttyzcmZcwgHau
	U6RQKWzcVCw3kDYljYUD0/XyhGVIcJM=
X-Google-Smtp-Source: AGHT+IH6T9fI4HBdZOk6EGgyAMl2tDC+osINgoctgIjiNWPu28mxxHWGK9Mo3xSHhjGMkqPBMVY6yw==
X-Received: by 2002:a0c:e549:0:b0:63d:4a9b:b29f with SMTP id n9-20020a0ce549000000b0063d4a9bb29fmr10472878qvm.65.1691434335348;
        Mon, 07 Aug 2023 11:52:15 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v8 10/15] libxc: Include cppc_para in definitions
Date: Mon,  7 Aug 2023 14:51:14 -0400
Message-ID: <20230807185119.98333-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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
index de03cfb117..5824394125 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1909,6 +1909,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
+typedef struct xen_cppc_para xc_cppc_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
@@ -1940,6 +1941,7 @@ struct xc_get_cpufreq_para {
                 xc_ondemand_t ondemand;
             } u;
         } s;
+        xc_cppc_para_t cppc_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.41.0


