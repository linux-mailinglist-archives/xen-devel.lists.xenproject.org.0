Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035375F7A3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568925.889106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvAA-0006w0-EJ; Mon, 24 Jul 2023 12:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568925.889106; Mon, 24 Jul 2023 12:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvAA-0006tM-AK; Mon, 24 Jul 2023 12:59:46 +0000
Received: by outflank-mailman (input) for mailman id 568925;
 Mon, 24 Jul 2023 12:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNvA9-0005PS-Cd
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:45 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5daa102-2a21-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 14:59:44 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-403b07cf5d0so38989371cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:44 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:42 -0700 (PDT)
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
X-Inumbo-ID: f5daa102-2a21-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203583; x=1690808383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5g90NEIr2gEQRrKv4KW4CuJMuwsS8xE3NxELsPnfYWs=;
        b=q40Zru82L/2BKRKKtOnL14Tu9aKQ+W6CSWGiQnn8n5AOg/Lkg3DCC8wOOKUjH+TV+8
         t25Wn7qxIk9Xh0xZA1nOmFZInBUF4FL12mrtIW/nNwnvMp+92hgQAxDss2ehA2QdT0s3
         FAAHILtXwK2MFnNO+CbCdVLUjIc5dIq+452QycZbAzJRHzOuLPDvXZGhGwlAXuC4znF5
         chxGlJQ8E+wsjBKA7D/SezbQI6tj/03ND910bYOYoaOfpKXCyRd5SJBr6SNEgajg5Wxu
         Wla7MKsh6xDBsf3tB0GH2wwmHqljAH9oK9YU8KpLUvy6UMZuofY8p5daiNlm+YhwONsP
         BhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203583; x=1690808383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5g90NEIr2gEQRrKv4KW4CuJMuwsS8xE3NxELsPnfYWs=;
        b=VwsmRD715TdbSOwK8r328St4TU5jdwrvvj6pZ8sciuKdlZTSR8FwLx2uT1P9Ocq/DD
         U975kbfg3oMlIrD9PKKeG1msAeMGA9dkGnSIgdSq6GDM9j0RqnOjT2uHw77576eXyEP6
         Mq+DkRWrrtpGap3MVCCf9Tt/+lBlC/fPq2rNCZaiTNMzn3F+ZGT1cZntFdu6ApbeIyeA
         QfW7aGhCB+pn7PecUElzYhppL71yWRLPks2NLhs36o3b536VF/C2y2IRBwoUda08y8P4
         YlLmT/6R71ivmUF2BKIi+02a0SRN49KFEshWse9kAV9c072IV+VPIUwRGVaNXd5roYkC
         3NLA==
X-Gm-Message-State: ABy/qLahrYn1wVtWV9PTJp+7hR8A0EwJ+AiRG4da0fpgedxL68fEnxD1
	4B681aag9Zm/kBwXwUDcsUeybxLI1GI=
X-Google-Smtp-Source: APBJJlEU18y5Q5FQMKok9iXRYDlpczsp//w+ubp7MNlQrMmfrhMCI04OoyLe36HFmJM8e3+Y7KIkXA==
X-Received: by 2002:a05:622a:1a1c:b0:403:edd0:8ada with SMTP id f28-20020a05622a1a1c00b00403edd08adamr11556056qtb.61.1690203583244;
        Mon, 24 Jul 2023 05:59:43 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 10/15] libxc: Include cppc_para in definitions
Date: Mon, 24 Jul 2023 08:58:52 -0400
Message-ID: <20230724125857.11133-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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


