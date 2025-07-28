Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ED1B13AC6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 14:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061449.1427038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNJa-0006tl-Km; Mon, 28 Jul 2025 12:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061449.1427038; Mon, 28 Jul 2025 12:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugNJa-0006rF-HV; Mon, 28 Jul 2025 12:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1061449;
 Mon, 28 Jul 2025 12:50:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRgz=2J=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ugNJY-0006pv-Dn
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 12:50:48 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78a0743d-6bb1-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 14:50:42 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso4122735f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 05:50:42 -0700 (PDT)
Received: from localhost.localdomain ([87.114.69.104])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b78b78f530sm1187200f8f.26.2025.07.28.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 05:50:41 -0700 (PDT)
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
X-Inumbo-ID: 78a0743d-6bb1-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753707042; x=1754311842; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdFkqV+mUGxQ3CUuu9YwkRaq0ZYAx7ZeWIu3SIrxQ3s=;
        b=NsA5KLKUbsRyyUkdYI/qjGvzeuU7LDrlunFRavL8mGjbzb25PshTsjDrCQYqFav9CW
         rBhLsWRgWLuxRk5X/VZzepgCE1e+Tddc/68wgEIIolvvfpLr/hQM1eJ9TlMjIBrGYPWo
         gm1I2CfFSZWTxA/m54ZiZkCEyfvpbRw4MJ2XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753707042; x=1754311842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdFkqV+mUGxQ3CUuu9YwkRaq0ZYAx7ZeWIu3SIrxQ3s=;
        b=MYA5V06NGcMsuxXAwCMOXcd42TwzRpFDCW3cn5OoJL3oRk1+2UV2dcSsUJgpJszOjf
         ucykRHBlJHfu34/WHbPQMqTDEGlUypCHsHydgGKS0MWLvkIzfRsSJaPoy1JsSFiuV7sm
         P3Lwu0JFfdeIdJmyQWl3URZyOmT3MP2HTnMbDA3avbSiRrJzY5Gvgzv8088Zmvza6IZP
         Ie/vWQ1skRlJ1//FvQMOzAJiWhkeSqZUM2wPtkMiFuu1XEf3en/ofLeJHYGJtzeIiGHG
         jGxfQ9tW4mmIqJ/hb99CI+KCzh3rU5PXr0HAlok190P/HcioRufv3cu+UJHHNhoWU7+j
         v4Kg==
X-Gm-Message-State: AOJu0Yx8Bje6z/7es0O0xkvaDEwJasKGKUCZg3e8Gwv5hpmAjAOLFgic
	m8Ixt3kjdfRI9B2HLIqsUenL+zK6WMFxgZVUSEtTV2l+wzUAQPQEvVvQWjzmFrYsstO146MUs99
	amAeFccw=
X-Gm-Gg: ASbGnctVPDyWRZlEvp3csQqAki1RHnI/DhLxvG/iEaFiox6HiXl87EWgrArBJLe55bM
	vMvPuieYnOriNiHKrqUZRCAlPsbTrRm0Qz6paFECMAa06GuXgu15ja8FtCyRnIsZShHDVEkzpeM
	OuzaN3WtmMTUcOAlpjLt7LEfsUAzH56W90l7KoTL0GNdAyjjKvQM3IgaZXXwUL7ZAruGZ7l7VC6
	I3FUi6ni/Gl5aZyzJkt43SCNI1X30ME5Ds0V4PBlQWuQfx8MdpGhaQF8lDgsf6zgCHH2MMf4KBo
	wGmhM0c/UoGxnwls5U8Ic7j9KKtNIhicG+zm90zozDKk7ICX1Rxnwtti2jFRpKLdpRr48OnYE6f
	CJsf7RlHcd+v//gYgksWXB6cElV72Ito8bBrQsHd69bDB44fhJvlJ
X-Google-Smtp-Source: AGHT+IHSju7ccViAfNkBasAWfkUL58LNk85MViV5fn5H1bAcaRYlQQSOQCIjfyytt6wzJNHv4D21uw==
X-Received: by 2002:a05:6000:2d83:b0:3b7:83c0:a9e1 with SMTP id ffacd0b85a97d-3b783c0aee0mr2903715f8f.53.1753707041773;
        Mon, 28 Jul 2025 05:50:41 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/rangeset: fix typo in comment
Date: Mon, 28 Jul 2025 13:50:33 +0100
Message-ID: <20250728125036.41305-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: fc41b5c1fdbe ("Extend the range abstraction"...)
Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/common/rangeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index b9e8912fb1..0e3b9acd35 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -38,7 +38,7 @@ struct rangeset {
 };
 
 /*****************************
- * Private range functions hide the underlying linked-list implemnetation.
+ * Private range functions hide the underlying linked-list implementation.
  */
 
 /* Find highest range lower than or containing s. NULL if no such range. */
-- 
2.43.0


