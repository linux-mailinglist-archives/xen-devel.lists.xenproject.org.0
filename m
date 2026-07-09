Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5rBSGXH9T2pYrgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 21:58:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFEB735397
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 21:58:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm2 header.b=vPYSfr0+;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b="i +5s9K+";
	dmarc=pass (policy=none) header.from=invisiblethingslab.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1358534.1612606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whusk-0007J5-Ml; Thu, 09 Jul 2026 19:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358534.1612606; Thu, 09 Jul 2026 19:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whusk-0007H7-J1; Thu, 09 Jul 2026 19:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1358534;
 Thu, 09 Jul 2026 19:58:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1whusi-0007E9-Qv
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 19:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whusi-003wER-7t
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 21:58:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a4ffd35-bab6-0a2a0a5309dd-0a2a4506875e-28
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 21:58:00 +0200
Received: from [103.168.172.154] (helo=fhigh-a3-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a4ffd47-0835-0a2a45060019-67a8ac9ad2e5-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 21:58:00 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1FCB71400159;
 Thu,  9 Jul 2026 15:57:59 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 09 Jul 2026 15:57:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jul 2026 15:57:57 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1783627079; x=1783713479; bh=vy1JyPNdpv
	bt/+2+Doo/kHhyIk6OgaoYEPg2ppM/fDc=; b=vPYSfr0+wStI9rEEiG5p2H54Wx
	7w1P+h1Uf0L4v6qYcpSfB+2laQ52H96zXVOmaWWXV0+spFr9A0Hpi050nqcY9JoN
	BAqIh/eQRscHHCbR/6tCJW4OQ25Txa3qfYYaGj8xSqknO6S9oYH2k7kwB8rUMGw9
	XbQ+62Bn0vlzw3K/+kZJ/Bl1ceQqhaUTzGHXcYNOLfCBNJiyN2odknGt1vjpjmRD
	CpaQeM0302pKy5nM+OzCegi3jl9ex4wn8GJRQzFbf2gw9wnY58BqihzuZ/w0bwHv
	dLE5f5gnOLcOdZLf6F0OCYeboytEEVHOWJv6fXNbECkO51BBfM9QXaAgmMdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783627079; x=
	1783713479; bh=vy1JyPNdpvbt/+2+Doo/kHhyIk6OgaoYEPg2ppM/fDc=; b=i
	+5s9K+dliHFcpJaKONdm5EWWVW1rBvjHznYv2ejOECaA4kuckUDTf6syNWAd3Wu7
	0bMbZkYQi/CNNfn+Nd/5GowamssKR1P+MZ9cea8C1Uph6yPpbgNlD3eGO2WDbbo6
	6sdJzirSwTKQYhCYfz8SbkUZDtmvIhhNeG4ENOzmcA5Nlyyvgwudw/URG4mNoYAZ
	Zq9D9sxMLjutoXqfuMLDzvlOkb4yuJRFKdWqOK5Ij9zKI+/CooRDuLJIb14fvMud
	AZeoRNJGW49203UFdOW/r8HCplbpkTxX3jeupaSTHG3agOaM1RUKIfc332pq7cW5
	ZVeQPqYGZusxuZtctgIlA==
X-ME-Sender: <xms:R_1PastS-C5sJbLC4jXspax2ffty53F_OVb-UsgIlwIEQ5psAbp1aQ>
    <xme:R_1PagWJbpK-LsIhSizsuOgLOa4sla5zKzgUDkmfpTNAA2n-Hlmox4B33HlSufYjW
    NjuWhDumfMlNwxxktXmIxB9-JconEgPmgPOLdixXRyGrndifQ>
X-ME-Received: <xmr:R_1PagFo2fFQlU17JxKF_w5l2JrEMhey4MiJzzkzTlaG5VVTCAvTbxiGI8CuoTNL5SFye1TaD1joZn7mxM2V-_Ic2xqRXETDiCzrfIfPyCw>
X-ME-Proxy-Cause: dmFkZTFRLSDjVlMWvoMbVx0nM4cDzaIWz0Xhxwyc1yWZYMKXBp0C1psv8rNt+1E0DovHkF
    9gAtJF88udxbJlWMP2X2HBOszwrp9ABj8M/dprFDAGNPKQMDNbrx5XhFi6Yl3Al3P9t/ng
    qNoBIwQx60wYQ+bwWxCizUMGy+P2M3BCxnYEHAantv+iKUtCfay85jGIHyRmlpNee++SAj
    zC38qnmnPFPbwIT3sJhk6G6OAwsaSWmf6BxPuoRuYXuF2YsMqQ8YV58LVlSwCqKwOFmPmv
    p49yLZ1JYyW3DyZEsoLEUiaYxLVhJVflGiAdQ2rLte2jXY4llZ8nal5RLw2E7p+5xm++iS
    LAkKWWtXAkMNXPQNktdRDxKtUvHb9w8IH2xrGrBY7x2WZVkFJa8DQWIgegkBcIikvOMV14
    3MQty5szptbpSRiyCV+fwoeDIFUFsvEwJdsVAdO74WA+oR6jZ3MwNE8uKuGyJphdwC4kYf
    +ojMioWFWsV24DYQVwDJKtEGcLipWokxFLYlRLMGQiBUdEDB3MKIjzoaS7YhzzpSMQCx2x
    kML/a9v4hBbvRve/rvbm90jWx2HiiMLNYqeN1VX+yC7ayQ9bwgF49lQmH676bOE+p6+cDB
    8D45F0dDKU4X4RgBxH5d1BZ3UgVB7oyESiwQJOsS3LchNhC4wCSbWWmDLNYg
X-ME-Proxy: <xmx:R_1Paq1Yj5ECFfRWHK-zk30c8FlOojNd6Ncz9t310k0iGdzea664oQ>
    <xmx:R_1PaqPsRb6vLvZeejtukXtE3MFUfGjHvG1dtQ6O6xqQC-dX2FqdCw>
    <xmx:R_1Pah6NoFpABjfoBoRbC_6LudQmOL1EaZqawYw_rhaPZvXeMNAk8Q>
    <xmx:R_1Pas1RBkfgs9MoTXrH1HvSdq34pnjBL1s5SCKc6Yy-IhS7L0s29Q>
    <xmx:R_1PajRmou28TR6P4m8_UCh6j2XAf4LpFFYmrz_SKuhvQOy4eLuDep_4>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 1/2] CI: add PTL runner
Date: Thu,  9 Jul 2026 21:57:04 +0200
Message-ID: <3a541b59a711fbf8d9ec3d262cfeeacd2db25113.1783626895.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
References: <cover.2e3d53e8679d3686e3f6579df0c7acb781c92701.1783626895.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1783627080-F9548617-B62568C2/0/0
X-purgate-type: clean
X-purgate-size: 3215
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:from_mime,invisiblethingslab.com:email,invisiblethingslab.com:mid,invisiblethingslab.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AFEB735397

For now run similar set of tests as ADL.

Exclude suspend test for now. While firmware claims S3 is supported,
suspend attempt fails (power LED blinks for a few seconds, and
then system reboots). With no messages on the serial console, even with
`sync_console`.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/test.yaml | 81 +++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 20db71b1c947..7cc52146304e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -170,6 +170,17 @@
   tags:
     - qubes-hw3
 
+.ptl-x86_64:
+  # it's really similar to the ADL one
+  extends: .adl-x86_64
+  variables:
+    PCIDEV: "56:00.0"
+    PCIDEV_INTR: "MSI-X"
+    CONSOLE_OPTS: "console=com1 com1=115200,8n1"
+    SUT_ADDR: test-22.testnet
+  tags:
+    - qubes-hw22
+
 .zen2-x86_64:
   # it's really similar to the above
   extends: .adl-x86_64
@@ -405,6 +416,76 @@ kbl-tools-tests-pvh-x86_64-gcc-debug:
     - *x86_64-test-needs
     - alpine-3.24-x86_64-gcc-debug
 
+ptl-smoke-x86_64-gcc-debug:
+  extends: .ptl-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh dom0pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+ptl-smoke-x86_64-dom0pvh-gcc-debug:
+  extends: .ptl-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+ptl-smoke-x86_64-dom0pvh-hvm-gcc-debug:
+  extends: .ptl-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+ptl-pci-pv-x86_64-gcc-debug:
+  extends: .ptl-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh pci-pv 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+ptl-pci-hvm-x86_64-gcc-debug:
+  extends: .ptl-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh pci-hvm 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+ptl-pvshim-x86_64-gcc-debug:
+  extends: .ptl-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh pvshim 2>&1 | tee ${LOGFILE}
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+ptl-tools-tests-pv-x86_64-gcc-debug:
+  extends: .ptl-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
+ptl-tools-tests-pvh-x86_64-gcc-debug:
+  extends: .ptl-x86_64
+  script:
+    - ./automation/scripts/qubes-x86_64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
+  artifacts:
+    reports:
+      junit: tests-junit.xml
+  needs:
+    - *x86_64-test-needs
+    - alpine-3.24-x86_64-gcc-debug
+
 zen2-smoke-x86_64-gcc-debug:
   extends: .zen2-x86_64
   script:
-- 
git-series 0.9.1

