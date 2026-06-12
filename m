Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U67ONDpKLGqSOwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 20:04:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7023E67B859
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 20:04:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=uWHD3Ipn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1336972.1598657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY6EN-000779-DW; Fri, 12 Jun 2026 18:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336972.1598657; Fri, 12 Jun 2026 18:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY6EN-00075e-AI; Fri, 12 Jun 2026 18:03:47 +0000
Received: by outflank-mailman (input) for mailman id 1336972;
 Fri, 12 Jun 2026 18:03:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wY6EL-00075Y-Vp
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 18:03:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY6EK-00Go18-U9
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 20:03:44 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c49b0-5cb7-0a2a0a5109dd-0a2a4502c44a-40
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 20:03:44 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c4a00-af86-0a2a45020019-d155802fb52e-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 20:03:44 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490cf3000f0so13298525e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:03:44 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b1056sm7859230f8f.18.2026.06.12.11.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 11:03:43 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781287424; x=1781892224; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SacTP91qWXXzSz6L+kpcrKqGEHKQAv04pOhjTLw2RQ=;
        b=uWHD3IpnshqAuGABiiQm7sM52FqIaIKsj6X7aRe3j8wdrM4IylP9mX4E/qiBdXz9Gn
         BaHsEy2vgKublndCRtvUII6h6qrbViqFkso345d6DXg56B232vwSdyYvRySTovQBXROK
         PEaOh+uz1TDH07gRf/0zJ9Frjk/oOWFIlI0Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781287424; x=1781892224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SacTP91qWXXzSz6L+kpcrKqGEHKQAv04pOhjTLw2RQ=;
        b=mG7B4KamXNiSQmTg5hwspZHcpxVeOwbpYCqkLBEgaalt0i7VZx6QbysR4QXIExhpty
         E1qtDS52hcjuKsWWzfPxT3mmzPYmLrHz3ck8ah4p6YPuikOpN7r6c+npQrK+psJ1F6mU
         ZsW8XLGPQF8p7yPivEW57i2cwVz+REPYvYYkdFknPB3S0kYRMJLVmUJyprX0v1O2onw4
         6b62qp0Tuxhb/tuohyzduqJTs5RXzGdV1wEozfVvsmgAI+tyQaRReTBD+HDLvfuSPaae
         LgebSgBuzNaHeLQ1dSZImam59TUT9LC4nWWHkbE0OgZgUpbJ7w1VqJPwyzJDAYxNvrQY
         U/zA==
X-Gm-Message-State: AOJu0YzH2JQVLqXuceC5fzBFt+Am8ikgLEkWjpUZvT8u/8dzrpUY3OOZ
	wU974JnPGQNDwzc8Sp7dr+zJ4XUdMa2WyBEVEh4/6N8SO5xnnZweP1leoGzwqp8vYseWzbyj9MU
	K0Vzi
X-Gm-Gg: Acq92OEfSknPliOqcktdG0kAXX85Dscw/qaaM7eFK5lt1AJmbsT7xtQD/aEF760GQkP
	B3fWvg4iYhVEiCu14WeJ0yLT552WwIaPfpHt6+UwhxMU2PlQzw6w2dO49QKNfwudOSkh9Hjrz0f
	yUwB03XU66Lztn78TPWSoccLC+MGpaUAZKmtIyD7H5ADF0l9hcT8+T4pzZQd6VQW6NW0/YBtUSV
	JDKIODMyvb/zgHVnPYXMwlCokeQuyDiYm3H1nKD+mrRzWfKJ4PsfAj9lcG9fXAVKqeqZxOnXFt0
	Enjih11yi+d3jEMd8IRuTEhOiFHh3ssAQuVhcskdJZIeFF3F/tVYA+bOzz3vDcHocztC+StFAFn
	8Qteb6W0WRwJM1FDNl4xJbpRkt+lfXULViMoDIwtkJzpXbG1jFcs5yF76+pGpPV26/ouW+uDli/
	+Ou01LuAlQzjfGBr2DYEp7JJ5oRHTfHuBc4hosCTn+QeBSskYuF/TgSshnRGOTchdG5NbTUJnPo
	xPD
X-Received: by 2002:a05:600c:1591:b0:490:e281:287d with SMTP id 5b1f17b1804b1-490ec4c0ceemr33014185e9.1.1781287424187;
        Fri, 12 Jun 2026 11:03:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Victor Lira <victorm.lira@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22] CI: Use more specific Xilinx runner tags
Date: Fri, 12 Jun 2026 19:03:41 +0100
Message-Id: <20260612180341.3152136-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1781287424-80979161-7454A68C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1529
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,amd.com,vates.tech,kernel.org,cardoe.com,gmail.com];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:victorm.lira@amd.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.com:url,vates.tech:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7023E67B859

In order to avoid serialising the testing on both boards, the runner
configuration is being adjusted.

Have the .xilinx-arm64 and .xilinx-x86_64 templates choose the board directly
using a more specific tag.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Victor Lira <victorm.lira@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.22, and for backport to all branches including security-only.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2597755162
showing all the Xilinx jobs still running fine.
---
 automation/gitlab-ci/test.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 89760b24e63a..c375c9730928 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -119,7 +119,7 @@
           && $CI_COMMIT_REF_PROTECTED == "true"
       when: on_success
   tags:
-    - xilinx
+    - xilinx-zynq-423
 
 .xilinx-x86_64:
   extends: .test-jobs-common
@@ -139,7 +139,7 @@
           && $CI_COMMIT_REF_PROTECTED == "true"
       when: on_success
   tags:
-    - xilinx
+    - xilinx-crater-001
 
 .adl-x86-64:
   extends: .test-jobs-common

base-commit: ffb9c3016be3beb4228e9975bfb5f8ca5b5ccd56
-- 
2.39.5


