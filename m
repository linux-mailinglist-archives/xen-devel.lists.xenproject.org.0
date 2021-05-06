Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F4375549
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123548.233075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeYK-0008Ju-7T; Thu, 06 May 2021 14:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123548.233075; Thu, 06 May 2021 14:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeYK-0008Hv-3P; Thu, 06 May 2021 14:00:32 +0000
Received: by outflank-mailman (input) for mailman id 123548;
 Thu, 06 May 2021 14:00:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeYI-0003iB-O2
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:30 +0000
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d772169a-d0f4-4cdc-a684-7476d154bdc6;
 Thu, 06 May 2021 14:00:03 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 197so4935247qkl.12
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:00:03 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.07.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 07:00:01 -0700 (PDT)
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
X-Inumbo-ID: d772169a-d0f4-4cdc-a684-7476d154bdc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ybgo2iqpAthKznwUf2rKB8sj2C1FVcmokKqjDDD9c5k=;
        b=QEMn2z8Au1zTcK9KWNUAWf4/pwLJGCha5xCHPbaVcHvwTs/0WGeDRi+dSSLkj+PFGd
         4DPTDrPpCoBGdEGFejSupnuB+2ecOeU06MvzCQFF4Z4YIc0V09aZGj5Jea66cvYjABzy
         upkTZ1/LVmbDH46CpQSVtDMmhaQRMlMJ50/DPtppaq76ByrVqcXk7PZVdjbnqRBYfrK6
         o5uIPQNEnoCso1VhvhvrN8PTVvJsleyC5gE2wrCqOomdQP6iHpSBulGhGXC4/z5+jybO
         zE41gDLiMQffA77a8KAFAyKdaMoJhCp5S+VEkXRu+IFYewK60CD6hvfCjuscdjXREmzS
         D3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ybgo2iqpAthKznwUf2rKB8sj2C1FVcmokKqjDDD9c5k=;
        b=X4L74DWmgglI3gIgXV84TsVIHfaiZc2Gz1qwQINdvk7hQ7E0p7DTwxqTI1MKJE2HJS
         Kwr5wVqtXaxTq0wOAznR/zocitG/C7yM917IfYU2U3+hGr23mhUEseBPznzMMRzH0h5M
         YWWz/zq0Y/d9Hl1mPu9Ox4RzNniqIqKTZkivb42Y4MkHF+5pa38sUNzDK4hjUbHbbJjO
         3VgQUBD9pksXMeEM8LeFLJyn19l0kP6Ch/hZ6HxPCUS1ohDuww3wm1UM3feahMsem/tf
         g4y21C6oHM3y9jeLUS7sCxghL1drxPVZbVT/+taHqXYBbzo3eWQSH5NdQpA++zLNMOSA
         7JqA==
X-Gm-Message-State: AOAM530+lpr04dCiaNyEpN1GVx9HBD8mvQQlYG8MPnW3cKRUXJCfSIeM
	V9dvm/FR/NTogq689ZgKD2VmLqa5aWA=
X-Google-Smtp-Source: ABdhPJwYESUQtl/XOHs0n5w17jqWUNLlZiVMYKCuK2J/fCzM3i3lA5rxNuBIThjTw2IEM0dxq30QDw==
X-Received: by 2002:a37:45d3:: with SMTP id s202mr4141671qka.424.1620309602421;
        Thu, 06 May 2021 07:00:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Samuel Thibault <samuel.thibaut@ens-lyon.org>
Subject: [PATCH v2 08/13] vtpmmgr: Shutdown more gracefully
Date: Thu,  6 May 2021 09:59:18 -0400
Message-Id: <20210506135923.161427-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vtpmmgr uses the default, weak app_shutdown, which immediately calls the
shutdown hypercall.  This short circuits the vtpmmgr clean up logic.  We
need to perform the clean up to actually Flush our key out of the tpm.

Setting do_shutdown is one step in that direction, but vtpmmgr will most
likely be waiting in tpmback_req_any.  We need to call shutdown_tpmback
to cancel the wait inside tpmback and perform the shutdown.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Samuel Thibault <samuel.thibaut@ens-lyon.org>
---
 stubdom/vtpmmgr/vtpmmgr.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/stubdom/vtpmmgr/vtpmmgr.c b/stubdom/vtpmmgr/vtpmmgr.c
index 9fddaa24f8..46ea018921 100644
--- a/stubdom/vtpmmgr/vtpmmgr.c
+++ b/stubdom/vtpmmgr/vtpmmgr.c
@@ -67,11 +67,21 @@ int hw_is_tpm2(void)
     return (hardware_version.hw_version == TPM2_HARDWARE) ? 1 : 0;
 }
 
+static int do_shutdown;
+
+void app_shutdown(unsigned int reason)
+{
+    printk("Shutdown requested: %d\n", reason);
+    do_shutdown = 1;
+
+    shutdown_tpmback();
+}
+
 void main_loop(void) {
    tpmcmd_t* tpmcmd;
    uint8_t respbuf[TCPA_MAX_BUFFER_LENGTH];
 
-   while(1) {
+   while (!do_shutdown) {
       /* Wait for requests from a vtpm */
       vtpmloginfo(VTPM_LOG_VTPM, "Waiting for commands from vTPM's:\n");
       if((tpmcmd = tpmback_req_any()) == NULL) {
-- 
2.30.2


