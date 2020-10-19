Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AC292F16
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 22:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8830.23750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUbNN-0000K6-LK; Mon, 19 Oct 2020 20:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8830.23750; Mon, 19 Oct 2020 20:03:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUbNN-0000Jg-Hr; Mon, 19 Oct 2020 20:03:25 +0000
Received: by outflank-mailman (input) for mailman id 8830;
 Mon, 19 Oct 2020 20:03:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=85l8=D2=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kUbNL-0000JZ-Tj
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 20:03:23 +0000
Received: from mail-il1-x144.google.com (unknown [2607:f8b0:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 425876ac-93aa-4309-857f-533d156cbb83;
 Mon, 19 Oct 2020 20:03:23 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id j13so1605774ilc.4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 13:03:23 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s17sm796805ioa.38.2020.10.19.13.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:03:21 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=85l8=D2=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kUbNL-0000JZ-Tj
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 20:03:23 +0000
X-Inumbo-ID: 425876ac-93aa-4309-857f-533d156cbb83
Received: from mail-il1-x144.google.com (unknown [2607:f8b0:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 425876ac-93aa-4309-857f-533d156cbb83;
	Mon, 19 Oct 2020 20:03:23 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id j13so1605774ilc.4
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 13:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F+TtsE/7V779qs9kiKK93Q96YivNooCbDhHQNdsZbls=;
        b=hlQ76gZyAKCrqHEeCaUzSMvlCFHBpOudrJ3lwG4Lgsef9BJpwhHTUWQdeQIGJBNBNO
         hWeAkHuBx3KPKIASzvOp4BcNrGZ988CmJOn7BKZ8onQYcGosz0bx9J1rJ3gSAsEz7/lm
         /1+g2MWvbkQI6jJV3G1V0FxJn0UazPX0IYwWHsciWTGWbwURmk0oo81oE7H5HWITXoh3
         yYI2womHos0kAlyT8T+tOOJp2miDnsr6DxzyVS6cY0dw4fJeZtpGzzDTNnkPh96c/gGf
         slIpkB3z3MfOk6nh9bgdskIyQH++b07kTw+vt5cdOs2pjcdkdFOgZMlTm1bvKB8hFJgT
         6HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F+TtsE/7V779qs9kiKK93Q96YivNooCbDhHQNdsZbls=;
        b=OrdbzFtRpbqxM8rnJy4GwyFT5hWratpawK0PGGq6rTJBsyt6vwoJYcvR9o5XtQjjAn
         JcyCRq7DKmrpeoaxGKp20Oq3uexCC5shL0W6aB6ZwR5rC2z48IIIfrIvHPJWyasThlJO
         ooCxOxyO+g4sM9ni3LIBLSt5wTFOzrt4pvJzkAtmpkpV0Yv73IbMsgcJ5BkWbcga7MKg
         4LyU0oocOk+tsyxE2AXXYSbwhaRn9ZzNwdEzeD1PI2y5MxQ1TMnFCGO++Q25u+7C86Ti
         XzcboEEMPYVV+tV6oe1DTWqjd1ne1os1y8iKMJHX4MDFfVglYvJOB4mSRPyxVbyBUbMN
         MMjw==
X-Gm-Message-State: AOAM5333WS9DicWU0zbEEtqBYusmvmxzOiPt4jabFH7XJ7RPMJV1W14S
	8QDYxlzxh210KqYzLHSuzr5XhCG6rtQ=
X-Google-Smtp-Source: ABdhPJzTPJh0vmNmmjYWc6FOA26Dq1fObmGyJ5ws7awxheE/44q2fAUUmXRGdU2/Auvsj7iO2xPMxA==
X-Received: by 2002:a92:d6cc:: with SMTP id z12mr1453737ilp.172.1603137802463;
        Mon, 19 Oct 2020 13:03:22 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
        by smtp.gmail.com with ESMTPSA id s17sm796805ioa.38.2020.10.19.13.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:03:21 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] flask: label-pci: Allow specifying irq label
Date: Mon, 19 Oct 2020 16:03:18 -0400
Message-Id: <20201019200318.103781-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IRQs can be shared, so uniquely labeling doesn't always work.  You run
into issues if you have domA_t allowed access to device_A_t and domB_t
to device_B_t.  The shared IRQ can only be labeled one of
device_A_t or device_B_t, and assignment of the second device fails
since domA_t doesn't have permission for device_B_t and vice versa.

Add the ability to specify an irq label to flask-label-pci.  A
shared_irq_t can then be used to for the PIRQ.  The default remains to
use the device label if an IRQ label isn't specified.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/flask/utils/label-pci.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/flask/utils/label-pci.c b/tools/flask/utils/label-pci.c
index 9ddb713cf4..897b772804 100644
--- a/tools/flask/utils/label-pci.c
+++ b/tools/flask/utils/label-pci.c
@@ -28,7 +28,7 @@
 
 static void usage (int argCnt, char *argv[])
 {
-	fprintf(stderr, "Usage: %s SBDF label\n", argv[0]);
+	fprintf(stderr, "Usage: %s SBDF label <irq_label>\n", argv[0]);
 	exit(1);
 }
 
@@ -39,12 +39,19 @@ int main (int argCnt, char *argv[])
 	int seg, bus, dev, fn;
 	uint32_t sbdf;
 	uint64_t start, end, flags;
+	char *pirq_label;
 	char buf[1024];
 	FILE *f;
 
-	if (argCnt != 3)
+	if (argCnt < 3 || argCnt > 4)
 		usage(argCnt, argv);
 
+	if (argCnt == 4) {
+	    pirq_label = argv[3];
+	} else {
+	    pirq_label = argv[2];
+	}
+
 	xch = xc_interface_open(0,0,0);
 	if ( !xch )
 	{
@@ -107,7 +114,7 @@ int main (int argCnt, char *argv[])
 	if (fscanf(f, "%" SCNu64, &start) != 1)
 		start = 0;
 	if (start) {
-		ret = xc_flask_add_pirq(xch, start, argv[2]);
+		ret = xc_flask_add_pirq(xch, start, pirq_label);
 		if (ret) {
 			fprintf(stderr, "xc_flask_add_pirq %"PRIu64" failed: %d\n",
 					start, ret);
-- 
2.26.2


