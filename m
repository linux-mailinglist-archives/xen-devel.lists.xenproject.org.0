Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA543372A5A
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 14:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122296.230672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUn-0006Ld-Ck; Tue, 04 May 2021 12:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122296.230672; Tue, 04 May 2021 12:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lduUn-0006Kv-8q; Tue, 04 May 2021 12:49:49 +0000
Received: by outflank-mailman (input) for mailman id 122296;
 Tue, 04 May 2021 12:49:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMRT=J7=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lduUl-0005hX-Rw
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 12:49:47 +0000
Received: from mail-qk1-x72f.google.com (unknown [2607:f8b0:4864:20::72f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e116294-23d2-48e3-bd0e-8ded2f2daf19;
 Tue, 04 May 2021 12:49:19 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id i67so5189471qkc.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 May 2021 05:49:19 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:92e5:6d58:b544:4daa])
 by smtp.gmail.com with ESMTPSA id
 i11sm2355001qtv.8.2021.05.04.05.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 05:49:18 -0700 (PDT)
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
X-Inumbo-ID: 8e116294-23d2-48e3-bd0e-8ded2f2daf19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0DdizkBoM7pfPhbNOdVIyMYXA8hmL6MF3OIfF/uZavE=;
        b=kF+VGY1G0vz1TpF0CPNN+SmSe6Y8SqQTFCN3JoDULv2uIpxig3DWNaiRYODW+uCzCi
         IdeK8d3SmjNxsWKShWgMc2NBX+g4ciSEG2pXKM4KDqUi+ZbZ0/3c0B1r3Zv6ORT/1E7/
         /riXqDqO8aZfOUCpBiOsoCLbuWLdWVXkdu7q5NppT1/gDSeFEM5vBrEhwEu2td1IjGyh
         HbiZQXtI5nmVyyVM/Pd/+mDABFMgWYmiBQJe8gb4gzXxtFyL1u+7vS8R5L9xn76ZSj/U
         uSLKIOmlaLW2jJ51vHx0S8kWVnvpBk+GqPHcJXt+6O7VPJCjbRTkynx9H9ev7W+yyDjW
         G17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0DdizkBoM7pfPhbNOdVIyMYXA8hmL6MF3OIfF/uZavE=;
        b=hpF4bUkiF2G+Kn4dsFIGCKs5t/2dqtfC3y9kzOm70W3br38vNkt7z1Hp9MCffbrqXG
         JvoCkmyNXiFQ9gJL4iWpMpT41GLpqzCIjbdFOGdKM33bAVZWwLwHIpJuK0bPF8DWivKn
         foMIM4KzPk7IQ7y2AF3ON67BSVz2/ftca3xLWw7hIqJEsnxKn8hGMZxwSCYT5xBaXJRZ
         ML2Mhm2zqq99aOKVabQH7aB0GjlqG1lFXGWf80nx4fz9qO6KclgZVTG4Vh15j7oLAXWO
         6Zh/2Rr2ll3pvkQAD3hze4rIiuDcRZZYJdlu8evOHdRtdZ9OWt1j+xELXRqfl9ypDu3r
         6Dcw==
X-Gm-Message-State: AOAM532rN0zKs1R4Dkceho9tE4ZSQLjhBoASBkOSgrhiHO+6a5kZ3oRa
	mLI9H2i3eGtSUBvoI7GrMeeXrirknU4=
X-Google-Smtp-Source: ABdhPJz4nGrzzdi22sWorVw6Psa6zTWQYJGfOf+8+5iLbGs1LACC/jy+Xj5P4ntNBDR5nYeuxHN1SQ==
X-Received: by 2002:a05:620a:918:: with SMTP id v24mr24268993qkv.54.1620132558949;
        Tue, 04 May 2021 05:49:18 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 8/9] vtpmmgr: Shutdown more gracefully
Date: Tue,  4 May 2021 08:48:41 -0400
Message-Id: <20210504124842.220445-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504124842.220445-1-jandryuk@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vtpmmgr uses the default, weak app_shutdown, which immediately calls the
shutdown hypercall.  This short circuits the vtpmmgr clean up logic.  We
need to perform the clean up to actually Flush our key out of the tpm.

Setting do_shutdown is one step in that direction, but vtpmmgr will most
likely be waiting in tpmback_req_any.  We need to call shutdown_tpmback
to cancel the wait inside tpmback and perform the shutdown.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
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


