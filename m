Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EA6A4CF3E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 00:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900665.1308508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpFGI-0001HA-Op; Mon, 03 Mar 2025 23:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900665.1308508; Mon, 03 Mar 2025 23:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpFGI-0001Eo-Lj; Mon, 03 Mar 2025 23:31:50 +0000
Received: by outflank-mailman (input) for mailman id 900665;
 Mon, 03 Mar 2025 23:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpFGH-0001Ed-KY
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 23:31:49 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abeb08eb-f887-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 00:31:46 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43996e95114so34251155e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 15:31:46 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba58713bsm211574785e9.34.2025.03.03.15.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 15:31:45 -0800 (PST)
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
X-Inumbo-ID: abeb08eb-f887-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741044705; x=1741649505; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exnQeKG8hftWWK19Cs5+acw+LLgJuCit5TsCrAyRrzA=;
        b=Y26SqeSCHqc5KAtEn8qfuCjhQ/ET7d0yxUuKMLejb7YxEhwbtYBhkomLDyaEXN9MbY
         N/LJxw0g74cDaTPhe1CXAU/HurMs1vJu5QH9y/MnMQSTW4CEsejDxHb4sqNC69UDSiBq
         l2Wz+WrGGr/HceWuigJ6OO65WXn7bJNXXUb1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741044705; x=1741649505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exnQeKG8hftWWK19Cs5+acw+LLgJuCit5TsCrAyRrzA=;
        b=eiNJ5j3EyGACYja5eU6HL498oCyr5e4rcWcgEsO/oRBzeRlfAWOpDkA8OYkzi9lF9D
         fEi3I4+IcD7uvlTZ+b5Mp3YRhDtUYd5AYeElqHEt47tYt6Zbj4uRNdsJs0QrXvllTyde
         dYVFFISp+faRFXYpGtGqkDWWWbnuU/yT2vOrMKJ2poUQ1Kkdb7laBBrX0HhwHH+rJ76G
         5P1U/iidQmNb40gi0xxGcQkYsItEGZaKDLpTecfZx2E3bH1O6yQ1zlVmUAzJMyBgtKDT
         XR8GSyOztnH6dARuzvEUThyY78CNF5QrrZ1Feq3Nk7fINWCvMnBnLzWidgXgWDYFkUsI
         FIFw==
X-Gm-Message-State: AOJu0YzVL8/XFilr45K4S2aCwNMKTrfsfOESjJAnfsqts6zHUCLB9/0x
	fB7mgq44KL+XdomkkOuS1MUdM5nlgrah/mzJcncy/w7gXLAPBabVBBnYO+2x5NlLH6STi1XwGSG
	R
X-Gm-Gg: ASbGnctLYQUkBKb0VkIz2gaWFQ4+beSvaHJA3QuPWHpEsa3DBRWnLz6NiL5LvVqrgC+
	K1F9LF7LbOgSAzY+M7xIISWucJ02Qonzbhvgso9BDlke3EDjGjPr72UFPmMrhKRN1OKfez2G10N
	YKkFM5DwPyOYyYq8zk4Exill5rVK/3WAZpx/EMFk9xCpGzji8jkgGx/zmzDOVtCcwDLK0KFdyzl
	ohoctbgrPVvE5AE0mxfCQYCz7qedGOlsoY/kg6E66nlnWHFCaohox3Tt/Gy0dLtm53FfPXec1QX
	T2ceiSpjHlc64c63r58UQ8FtvlqwMOVDJ/3UDv2dQif3HeP7nWLFlPeINaVVpX7UyhtpuAisEnA
	QlDKoTTF/+rdAFLOlap4Tv2a6
X-Google-Smtp-Source: AGHT+IHfeNgkjSAd8OLUupox2FnLTgk0jxJpVrMCU8hA9vWJAj8KypfsveYeC6u2z6YW5QNv6LEi8Q==
X-Received: by 2002:a05:6000:401f:b0:38f:451b:653c with SMTP id ffacd0b85a97d-390ec7c8f86mr10710123f8f.7.1741044705463;
        Mon, 03 Mar 2025 15:31:45 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 1/2] xen/domain: Annotate struct domain as page aligned
Date: Mon,  3 Mar 2025 23:29:40 +0000
Message-Id: <20250303232941.2641306-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

struct domain is always a page aligned allocation.  Update it's type to
reflect this, so we can safely reuse the lower bits in the pointer for
auxiliary information.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Juergen Gross <jgross@suse.com>
CC: George Dunlap <gwd@xenproject.org>

v2:
 * New

Interestingly this does cause two changes in the resulting binary, both caused
by GCC electing to use a more complicated addressing mode to save one ADD
instruction.
---
 xen/include/xen/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 037c83fda219..8412b45178ca 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -645,7 +645,7 @@ struct domain
     unsigned int num_llc_colors;
     const unsigned int *llc_colors;
 #endif
-};
+} __aligned(PAGE_SIZE);
 
 static inline struct page_list_head *page_to_list(
     struct domain *d, const struct page_info *pg)
-- 
2.39.5


