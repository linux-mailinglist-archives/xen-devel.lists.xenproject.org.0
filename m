Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC7B763D57
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570650.892694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi2Q-0001sV-Fg; Wed, 26 Jul 2023 17:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570650.892694; Wed, 26 Jul 2023 17:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi2Q-0001o2-By; Wed, 26 Jul 2023 17:11:02 +0000
Received: by outflank-mailman (input) for mailman id 570650;
 Wed, 26 Jul 2023 17:11:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi2O-0005nP-KU
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:11:00 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 632e1871-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:10:58 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a5ad44dc5aso59885b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:59 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:56 -0700 (PDT)
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
X-Inumbo-ID: 632e1871-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391457; x=1690996257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g90NEIr2gEQRrKv4KW4CuJMuwsS8xE3NxELsPnfYWs=;
        b=ieIvb0nsEqn45EN9wBUG7zCS0ysQE3YMY/JPe3LBe5YSqZVCLms2wsrlKDh6wggile
         LjQT8tcD2aEifnw6oE7EsHtLIDhmp7BWcvmsdMDuO/aSvt/vaDLeG2TBTyZR37+paTRQ
         sMWBeoc2Z0OfMWHSnCHY4mUyv/VUEQcEEQ+MdT8n7g2XexZwKdoH62D7quutmw7KtcOD
         XjRSWq+4DFXTkz9Koj9b38WyPMtm8ZNYs4ZcUyGCCYC5n+gDehy+ctS8caP7/hNv/gFW
         unVctgbgLcORrCrEbED9R9Smopv+SNuog6F0XqCzAAL/vmiDz9eGHl+W8cNcwPwZb6fX
         gELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391457; x=1690996257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g90NEIr2gEQRrKv4KW4CuJMuwsS8xE3NxELsPnfYWs=;
        b=KSTiZew5Gsriszzvf4ff8HO1W8ceTcq+YMeKoVYeJ1aB16HkNRxHMMz9v9Mc/X3P1V
         tTqObSMl0R71JCWevdaE1B1fyttvN4BGNqgqREC7PCGB3W4JK+VFh5xEY6STwqV9O9Nw
         OFqEVNFwrOuUjKPMBAcvQXoSHrRrVRezmUaV1AcyyX/zPYVKSM+pwmlLSm4ORV3+MMfp
         vsemXZ5FisEAXdcgHv0zrPs6xF1feiuPDBASoLVzXTVpPzxVP9m62Sicq9TPPse8XBqH
         PF7tXz8s8Gl78Rbo5kSOGvVdaI+g+ytEF6LySjHSEFoBLQoiV1LOpGpjt7Af/p4TNpcQ
         954Q==
X-Gm-Message-State: ABy/qLas6AIG8varAeUWoYueVYmeskk/eLKGQU0rg/gH3ka4UWBc5nxk
	KsG1/Ux3EgCaJcvcRL0xnXPYnqTwREE=
X-Google-Smtp-Source: APBJJlEupFohQgvxB5P2BCuegnEvzZJOKE+6E6RhSIp0mlGObHvccrBu5ABGhPxiXxPdStE3Xh90nQ==
X-Received: by 2002:a05:6808:bc7:b0:3a3:eab8:8c40 with SMTP id o7-20020a0568080bc700b003a3eab88c40mr135683oik.54.1690391457086;
        Wed, 26 Jul 2023 10:10:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 10/15] libxc: Include cppc_para in definitions
Date: Wed, 26 Jul 2023 13:09:40 -0400
Message-ID: <20230726170945.34961-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
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
2.41.0


