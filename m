Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1602398DF4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 17:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136077.252492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSUV-0002AM-B6; Wed, 02 Jun 2021 15:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136077.252492; Wed, 02 Jun 2021 15:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSUV-00028G-7E; Wed, 02 Jun 2021 15:09:07 +0000
Received: by outflank-mailman (input) for mailman id 136077;
 Wed, 02 Jun 2021 15:09:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNUT=K4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loSUT-0001oH-MZ
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 15:09:05 +0000
Received: from mail-ot1-x329.google.com (unknown [2607:f8b0:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02ad2af5-521b-4054-bc34-f33394e27e80;
 Wed, 02 Jun 2021 15:09:02 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so1642238otu.6
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 08:09:02 -0700 (PDT)
Received: from localhost.localdomain (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id e29sm25287oiy.53.2021.06.02.08.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:09:01 -0700 (PDT)
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
X-Inumbo-ID: 02ad2af5-521b-4054-bc34-f33394e27e80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UpOeaMEF9ZtjJDEC63CsaCASXXXpK+CjdZ0eTjBgKHU=;
        b=WluB/sS6QKDAdVmEC8aMbwfgJHfOnvp+lHftJ84SREIvF8lL4iu030ifMdB4f/lEoE
         dJ/8KHPWiTnVJTk7oPqFzRTXlrqhp9zJ0SPtkuzxSdOj4/2dOOkXqsCRlfzaftoVR+BL
         4Wn7ifq6m1d+hldFgMHMvmlHO3Ph01sc+CF11TqYqCicxsK6OqlMk3G0IrbZFAGsun7y
         CchjplKJYLefzisuOlJFb4eWTBAsWssxC+/jdJurq8c2gv+wH54pIOg/TBoDlu+cG5Zn
         N1tj9NBdSDlMvDPO3ImJpb2FlABGSJl/jd2/59in3SO3kmtVT168x/PIHpRBAfsV36qh
         aYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UpOeaMEF9ZtjJDEC63CsaCASXXXpK+CjdZ0eTjBgKHU=;
        b=ip36EpCn4S1T/V4CZ4KSa0ItvhgSPYg51Uq4x3dVjovPHAOnAyBkvFUwV385emAnNN
         PvBL6k/bN0TDtb+haAr1EUfS6rRqZ06YpmG6UviZEtwj20e4E475h6ZaDzV//TCIE4yP
         vlb2oNb2WuZh+RsAEraCPNKRxCEBEHHwrf5LCeQxdnNeotS5gy3vhLBHZFjpO35erNyq
         scqwa+yb5hLXQnhBxRUSi//rICLwDs4uyq9K0P4TMyiEF057BvLzOgBkQGaLrk5ug4dB
         TdAzpk7tDq3mrD/jLowQbXmaBfHnnRcXRVkswwMSrC/sTnPwdihFFk+LXcAgx2DFROS3
         JcLg==
X-Gm-Message-State: AOAM530sp/23NekOeYykU7bnfixRiTV/tlzaEfc78M1Jk9U+I5xoLHcq
	9u2ODmcl3e5X73P0PCMX+HhC2ExtDjaHxA==
X-Google-Smtp-Source: ABdhPJwQ+WXaQFw7ZYh1xXrbG0Cfz68tGyEPXixc1hcXDRbGyg+YPQFZpit6zSv+QZpYBNL16XrjhQ==
X-Received: by 2002:a05:6830:192:: with SMTP id q18mr27810801ota.79.1622646541846;
        Wed, 02 Jun 2021 08:09:01 -0700 (PDT)
From: Connor Davis <connojdavis@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair23@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/2] xen/char: Default HAS_NS16550 to y only for X86 and ARM
Date: Wed,  2 Jun 2021 09:08:27 -0600
Message-Id: <2c24cadace47e51e9e3fce6614e0f5e83db6c3af.1622645816.git.connojdavis@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622645816.git.connojdavis@gmail.com>
References: <cover.1622645816.git.connojdavis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Defaulting to yes only for X86 and ARM reduces the requirements
for a minimal build when porting new architectures.

Signed-off-by: Connor Davis <connojdavis@gmail.com>
---
 xen/drivers/char/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index b572305657..2ff5b288e2 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -1,5 +1,6 @@
 config HAS_NS16550
 	bool "NS16550 UART driver" if ARM
+	default n if RISCV
 	default y
 	help
 	  This selects the 16550-series UART support. For most systems, say Y.
-- 
2.31.1


