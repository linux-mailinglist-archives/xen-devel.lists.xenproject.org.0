Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3AEB07EAD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 22:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045626.1415786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xl-0004Fc-Ks; Wed, 16 Jul 2025 20:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045626.1415786; Wed, 16 Jul 2025 20:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc8Xl-00049C-FG; Wed, 16 Jul 2025 20:15:57 +0000
Received: by outflank-mailman (input) for mailman id 1045626;
 Wed, 16 Jul 2025 20:15:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2WS3=Z5=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uc8Xj-0003uZ-IS
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 20:15:55 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad226a9e-6281-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 22:15:54 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b60565d5f4so21581f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 13:15:54 -0700 (PDT)
Received: from lab.home
 (dynamic-2a00-1028-83a4-4bca-c0bb-96ff-feed-9d50.ipv6.o2.cz.
 [2a00:1028:83a4:4bca:c0bb:96ff:feed:9d50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f2e8csm30504145e9.5.2025.07.16.13.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 13:15:53 -0700 (PDT)
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
X-Inumbo-ID: ad226a9e-6281-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752696954; x=1753301754; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzTo23Sx/OEupN9XRs7aPIsAXHXRXpmD+YzCJ1BbJWk=;
        b=NzCE/gHXPwHwWx/jHmBvG3sE+XJuQ3cPySRNbByfjElxtpnzqQ4XQh5753nnfTCojw
         67PNDRqqAqCM98gf/ARcRjswsJHtWpgdwZ88zFEyPx0RmASXSl0VifvejGMsxSBr9UTa
         hVSkPmR6LH1PrCZoLtBpzynf6IxR4WYwuLwR16ISs6eEttru8TxXazIWAN3p8ZsWqhf+
         PLo+VwKLCQMK0jsuLLucU8ZUBEo7pCjjf+j2HiBlvPJbKu82kdivX70nTlbOhDW4K1TV
         /cmRtU+caTiauDfNbULVLBbMud8J9+IsNQ3uaSl/n5Tdh2eChRqFPRJNmfolZuFQ2LOG
         okDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696954; x=1753301754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzTo23Sx/OEupN9XRs7aPIsAXHXRXpmD+YzCJ1BbJWk=;
        b=GcfBhx/q1qI1qoP7/ikT5yHh6DdYZrpc0GUmKIUmiSTiZD6YvOP/RE6R1+jsA3hYrP
         iAXuZPdrV4RRxPqzt2Pu4jD4sw9DaNW3JIe2vFaVjsKCJ0FRJBhSJ3+Q3MbxX/DFAt/k
         68UvRdaQxmoeEuprReaxqRr3t6+KDbyYTUtu6daVXFAUS/S3jxFHx8gMEgCx1mXWWPC0
         FQAWVu3/3BvQLqbtWiFIduW5+Rhy1r5lHLjsflqdtDQzVsQdnr3oO3cECYgPMi+AB6+4
         lXyHTUCHCpSuMuEQPJEd/KQJnc+imuEGaB7UKF0zOaHHeb3KI6sAWJJ2NTjK0J85qUPi
         ky6A==
X-Gm-Message-State: AOJu0YxR+gO8mVLgLNnsJEhT9LPBCV4DMVyVc81xI/v01VkGUuJGZ4cX
	WabIyah2tFyOJS7fXW5iEjr7Unsy6kalKBD6VU1/R6rM3Afez8S4WQcmBM9cfg==
X-Gm-Gg: ASbGnctz5nKTZCWVEnFOn3N/0967P2Q7QlW/nrTsrc+ha6FczzKgwjKqjr0GCuw9HiR
	eAPgZOwsOAdiMH9XZKmI/qbsX+YCzLVbq89jdwLF5N/FJgfOWaZ9EVTDlun5yFNfFhmE5VIol02
	B1PMKUltrj0k7jLWAQM4MejnrhYubfKAt58KxMHlVdN6xirSG1mRJL/KFZjIAY7+taGka7P6HRq
	LoGm2WhrfEAtzm/GH7TkxqrkDnLHXg32YLlLTAwD2L2q2a6B4U/v1HWGZ6hVLyj08j2YUyVsBIk
	sNKQtquG/TEVeXXv5etQQKDmwnpaOOsjtJY0YDgXEkIvvgh9JCTcbDDLgpKLptgZd2ax+vX2JTH
	qi1Wzy6sIMgm/GHs4AmH6N1c/VDLVP1TJ4+OOQJiUMRksM3YWV+yQZnhDc4vscPEzaA9ZJg24Gu
	9I/m5hmRLySpeR4NcR//7JTg==
X-Google-Smtp-Source: AGHT+IGUg2sOHjk/UznLZOKAg4XbtujlsyagSGNiX7D3hOlc6Ylmj+FAHvFVmCjIKetKab9fedznRA==
X-Received: by 2002:a05:600c:1c16:b0:453:c08:a1fa with SMTP id 5b1f17b1804b1-4562df5475dmr17455585e9.0.1752696953569;
        Wed, 16 Jul 2025 13:15:53 -0700 (PDT)
From: "=?UTF-8?q?Petr=20Bene=C5=A1?=" <w1benny@gmail.com>
X-Google-Original-From: =?UTF-8?q?Petr=20Bene=C5=A1?= <petr.benes@gendigital.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Petr=20Bene=C5=A1?= <w1benny@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 3/9] x86/p2m: Short-circuit p2m_is_altp2m() when CONFIG_ALTP2M=n
Date: Wed, 16 Jul 2025 20:15:33 +0000
Message-Id: <4da736fc96d0d8ee717156957b3e8aa9aec92797.1752691429.git.w1benny@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1752691429.git.w1benny@gmail.com>
References: <cover.1752691429.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Petr Beneš <w1benny@gmail.com>

Wrap the p2m_is_altp2m() check with IS_ENABLED(CONFIG_ALTP2M) to allow the
compiler to short-circuit the condition at build time when ALTP2M is disabled.

Signed-off-by: Petr Beneš <w1benny@gmail.com>
---
 xen/arch/x86/include/asm/p2m.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 4358cc15a2..58b56e575e 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -437,7 +437,7 @@ static inline bool p2m_is_nestedp2m(const struct p2m_domain *p2m)
 
 static inline bool p2m_is_altp2m(const struct p2m_domain *p2m)
 {
-    return p2m->p2m_class == p2m_alternate;
+    return IS_ENABLED(CONFIG_ALTP2M) && p2m->p2m_class == p2m_alternate;
 }
 
 #ifdef CONFIG_HVM
-- 
2.34.1


