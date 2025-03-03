Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5BA4CE17
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 23:17:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900636.1308488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpE5d-0005p1-C9; Mon, 03 Mar 2025 22:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900636.1308488; Mon, 03 Mar 2025 22:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpE5d-0005mg-8K; Mon, 03 Mar 2025 22:16:45 +0000
Received: by outflank-mailman (input) for mailman id 900636;
 Mon, 03 Mar 2025 22:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpE5c-0005ma-Ah
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 22:16:44 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f6e4bdd-f87d-11ef-9ab3-95dc52dad729;
 Mon, 03 Mar 2025 23:16:42 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-390df0138beso2613392f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 14:16:42 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e485e03asm15961561f8f.95.2025.03.03.14.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 14:16:41 -0800 (PST)
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
X-Inumbo-ID: 2f6e4bdd-f87d-11ef-9ab3-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741040201; x=1741645001; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6pay+cFtFClz4ucC1G7sQqdpWp9AM1ohPgJS2SZBVQ=;
        b=ZMDobjzIHWovDRO8agVEtB/IZNvE83pwieMHYUKvSZOtWYomy55FVVOPTiq28L8yNq
         yHV6N2uFVnf0pdtp1nuldrTSdvAE1oWdKHcuOny50I6yKjRaVLluS3zhjR+J5rXhTUV5
         JmQorSv/MSrygujy1lsu0q8cTm9UshN3UYkD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741040201; x=1741645001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6pay+cFtFClz4ucC1G7sQqdpWp9AM1ohPgJS2SZBVQ=;
        b=RlDM9+Pqoc3HjIQXRxcfnQ0JX8EtEr9BNYhCE3sxkuOkyPLC3Aes23JRGoQX25jRAg
         yiGvzhkzx451Lno71Uqbn9+LWHwn6IPtPj/lzZqlmUcpJRZUOeICbfdnrDoARhrtx+n7
         3/wXYxxxOV740TF+6JT9XU+pNmlaNUp+odS2dzr0UioNNH+LKSKq/2Pgc9zo6kSZ9Lna
         k1GKkN/orXxfY/BYrtLBT9UAUwzk93GbAIDRxF9nvHixOstsSCWGZK5MlwdRo0sCCv6a
         wbkXFneSed7IuktvADd8I+TvjoHxzvfrpQ3bZXG1TlRZOZpLN4i+9loh18lJD5dxTCqm
         I+zA==
X-Gm-Message-State: AOJu0YwEjSNttsHx0Tko+SpSjA4XCw4UrXePf37DJ2tDGTWcftLgCNV7
	kLBk9MlTRFE5J6Hu3KZHz3SY3GPq8Q++LSe5JP9CSBwaUVr2ug0jV6GAoehzAgQsjreAh5vW1FQ
	q
X-Gm-Gg: ASbGnct/JI8hSvr8SSSvRIEqEWZYRzwfK9StIXOeep4H6wDeslGbIU/kVPhUMjvX7Z8
	R40+aDiTdxIdWzWagQyzNCJCok29DvI4hQNfFfGdQLQk0R0pCuVmh1Ydr+to/v1yqFMtu/oocbC
	3uPtNWOxMZ0SLhhJfHRETdperdl+woITevxcccfCHk9Co0nyF4+zAB4HbkDhneNt0+pXHOzeU9q
	Cf6J97DECIcndlplFfoYZMRHcezPKM+GFfE3HgDybipICy2i+gmIpLerzPphzG8cRS3LclLsNcw
	4HsO7Ouy3HG7ZXLD0k6GV7L2zV14ap5XX3Bntgq1dxGZo/emHaM8rpZKv9E6ljJ0pVSYXQGNdeC
	3IdVDWtmQiKRmYY9DlMuqYPEf
X-Google-Smtp-Source: AGHT+IEKJAVBEjIrIhEG9JBoOC4dfuTcJk07042Knc0MM2z1dl3zirq/DK9886l3rRseacA+8vzSBA==
X-Received: by 2002:a05:6000:1563:b0:390:d796:b946 with SMTP id ffacd0b85a97d-390eca414efmr13906971f8f.44.1741040201601;
        Mon, 03 Mar 2025 14:16:41 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] IOMMU/VT-d: Fix comment
Date: Mon,  3 Mar 2025 22:14:38 +0000
Message-Id: <20250303221438.2495688-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"find upstream bridge" is surprisingly jarring in context, considering that's
the name of the function who's return value we're testing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/vtd/intremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 820616a8de93..1aeaeb5ec595 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -475,7 +475,7 @@ static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
             set_ire_sid(ire, SVT_VERIFY_SID_SQ, SQ_ALL_16,
                         PCI_BDF(bus, devfn));
         }
-        else if ( ret == 1 ) /* find upstream bridge */
+        else if ( ret == 1 ) /* found upstream bridge */
         {
             if ( pdev_type(seg, bus, devfn) == DEV_TYPE_PCIe2PCI_BRIDGE )
                 set_ire_sid(ire, SVT_VERIFY_BUS, SQ_ALL_16,

base-commit: e95dc03717b8ae00de2a0b41b88905af6170b210
-- 
2.39.5


