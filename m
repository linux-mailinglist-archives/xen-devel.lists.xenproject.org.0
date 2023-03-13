Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECF6B7FC1
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 18:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509364.784980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbmK2-0003ha-QF; Mon, 13 Mar 2023 17:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509364.784980; Mon, 13 Mar 2023 17:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbmK2-0003eh-Mh; Mon, 13 Mar 2023 17:50:58 +0000
Received: by outflank-mailman (input) for mailman id 509364;
 Mon, 13 Mar 2023 17:50:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jvaw=7F=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pbmK0-0003ea-Rw
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 17:50:56 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a7bff38-c1c7-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 18:50:55 +0100 (CET)
Received: by mail-qt1-x834.google.com with SMTP id l13so14093716qtv.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 10:50:55 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 l7-20020ac84cc7000000b003c03b33e6f5sm209300qtv.90.2023.03.13.10.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 10:50:53 -0700 (PDT)
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
X-Inumbo-ID: 9a7bff38-c1c7-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678729854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arBkyp0aqn5V8rFyql7P5HqqiC0UIBGJpNUVdMrSMAs=;
        b=PwJ3flVNwuKHoATPj4GCtQN5WReQNTEThwexPzSZyVXnBpDyIo54bPTMmDE2SU4l1/
         aw3enW5khdoNr8ZkpTXoXitShmr3hJFcnYcusUTHokrfJnX3vQ+2U30NZJ2u5Z7OA6+1
         /aa9ccvbVmOQYZbzLO6o754qQKqUiDq1w1GK1Z23RAMkSnmYW//rvQ5vcU7IOPPRddr7
         G36k/ZGPsFn08e+Rz2GgocCIGpPmWszRA8ozPsNLII/gONDc9rUh8k+xGzLTqiD+LmWc
         gBsvEazjqo5wETahyO/aNl7G4Ti7YEDy7/O6sadM95RNHWoZE/XuXaDItVh/32g0UXM+
         Egsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678729854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arBkyp0aqn5V8rFyql7P5HqqiC0UIBGJpNUVdMrSMAs=;
        b=VieMxlyBkBu9Yjtu2Dam5CK23rFgvFhcbmor3Rh+vKwxtjllkrjIeMVJNi/lCVtMgZ
         lG0ME5dxYHY7kdtN0PRAgGlumPkbeQpCqNvXRKslR9did0Wxy22CK2AEuh0+6meTDjfl
         JhAfif4Y8WyANdDyAoi9qg6jQlQYqtl+VUzyVbYCN3KV38OZukemkdC1ScKhNJONBVSH
         j70kmp3Gk6UtEa6KiSQ50EyYOuaoO0ljU11J9T1r1Gb861AfytfPo5S0VfnoFtHS+t0m
         0i0J0YqPr1KHEZiM4RRhI/8zLXwu1ViLEwv6ytZaJg0wiib5qjDxOQgfh+YFjYZ652aJ
         2OyA==
X-Gm-Message-State: AO0yUKW7zGEuhGLh5VWDphQVv1eJe4u9vgpZmFkgDxsgExhZkUYc+5JF
	N+hkO4wX1nohTTMhT2hx4fW3ikPgnsU=
X-Google-Smtp-Source: AK7set/85gw//6UfHViNsu8WBbrBdOfGSLmBcaENngo5AmyqW3EtK0x00Vq0PQHAl/Zs7VBJ1Tgsqw==
X-Received: by 2002:a05:622a:1ba6:b0:3b8:3a7c:d204 with SMTP id bp38-20020a05622a1ba600b003b83a7cd204mr54264929qtb.58.1678729854351;
        Mon, 13 Mar 2023 10:50:54 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] flask: label-pci: Allow specifying optional irq label
Date: Mon, 13 Mar 2023 13:50:47 -0400
Message-Id: <20230313175047.20719-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IRQs can be shared between devices, so using the same label as the PCI
device can create conflicts where the IRQ is labeled with one of the
device labels preventing assignment of the second device to the second
domain.  Add the ability to specify an irq label distinct from the PCI
device, so a shared irq label can be specified.  The policy would then
be written such that the two domains can each use the shared IRQ type in
addition to their labeled PCI device.  That way we can still label most
of the PCI device resources and assign devices in the face of shared
IRQs.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
v2:
Describe usage in docs/misc/xsm-flask.txt
---
 docs/misc/xsm-flask.txt       | 16 ++++++++++++++++
 tools/flask/utils/label-pci.c | 13 ++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xsm-flask.txt b/docs/misc/xsm-flask.txt
index 2419c5cf29..ba89ebbfd8 100644
--- a/docs/misc/xsm-flask.txt
+++ b/docs/misc/xsm-flask.txt
@@ -205,6 +205,22 @@ parameter, which can also be changed using xl setenforce).  When using the
 default types for domains (domU_t), the example policy shipped with Xen should
 allow the same operations on or between domains as when not using FLASK.
 
+By default, flask-label-pci labels the device, I/O ports, memory and IRQ with
+the provided label.  These are all unique per-device, except for IRQs which
+can be shared between devices.  This leads to assignment problems since vmA_t
+can't access the IRQ devB_t.  To work around this issue, flask-label-pci
+takes an optional 3rd argument to label the IRQ:
+
+    flask-label-pci 0000:03:02.0 system_u:object_r:nic_dev_t \
+        system_u:object_r:shared_irq_t
+
+The IRQ labeling only applies to the PIRQ - MSI/MSI-X interrupts are labeled
+with the main device label.
+
+The policy needs to define the shared_irq_t with:
+    type shared_irq_t, resource_type;
+
+And the policy needs to be updated to allow domains appropriate access.
 
 MLS/MCS policy
 --------------
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
2.39.2


