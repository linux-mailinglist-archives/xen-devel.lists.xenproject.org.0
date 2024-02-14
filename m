Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B385489F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 12:42:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680618.1058655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeK-0005wQ-IB; Wed, 14 Feb 2024 11:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680618.1058655; Wed, 14 Feb 2024 11:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raDeK-0005ub-FF; Wed, 14 Feb 2024 11:42:00 +0000
Received: by outflank-mailman (input) for mailman id 680618;
 Wed, 14 Feb 2024 11:41:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raDeI-0005Pc-LU
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 11:41:58 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f56b977-cb2e-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 12:41:58 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5116b540163so8124261e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 03:41:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 qj14-20020a056214320e00b0068caf901c9bsm1083852qvb.17.2024.02.14.03.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:41:56 -0800 (PST)
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
X-Inumbo-ID: 0f56b977-cb2e-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707910917; x=1708515717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73EI9rqYbQp7NZhmMdmjrgOEumsFjhm+bWFGhs3mCc8=;
        b=u5nNhFq49z7LkTqpl0/tr54Y5FMVddD654IQu/VYyV9xtTV8ZQFMeYXlS3nwLhnez8
         cMoTanBtXJnYdaP//rRViKZBzeQVjg5uJ495Z48zx8C24D8Gz0Z6Q1NPdvmhx10R7Zrt
         GDjrPCZtxC9eybwXVArQJxg6VInHzw1U0DK48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707910917; x=1708515717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73EI9rqYbQp7NZhmMdmjrgOEumsFjhm+bWFGhs3mCc8=;
        b=h9B8XvAe3EVSjluAWItPVqFS0CUp3Twxq9DZuSQ2vP2oyz5DCdCI22r2APXBKGfP+Q
         3nYHQJivrr1WgWqAi5VPk8UDmNXe261jiZ6Xnuepw45QMOguNiYXsU2Y3QZBMvs+MGfI
         yC/24Q7YOBVl+SvZldb8retpwMvqAxx4yvOvGz5LNJpfQkPdd13m3ZS/qZck2liqdBPu
         3ds1euWKGMfhRcDWAdfW2U10gbJjKpb0OC0Y+yZKOqgE4tk0sW/scVZPRtiZGos2eFqu
         QLwcXUjIN5zT+pMBYwRv3Ru1z9Am0chWZG7zrbbLdAU2hFlTAf5PQaIJj6vPv+/dDWex
         eonw==
X-Gm-Message-State: AOJu0YzqwTYR2QQf13xYbo/77A7q1jtq9Yudjk688DAajN+RVj0D6N5f
	BSn5Z7baBB4sQpZ6I7+lK26N5JdwjhvJ0DFK2ie8wE3EJwSrDrBuJVS4E/UBjHR27lcrI0dznHA
	C
X-Google-Smtp-Source: AGHT+IG0tJEU3fhJjIJ8NVl/QPwMLbE9iPLosJcRNbPHOIyIxybONmcE5i6MHKjeI9QyOeaQmhEJBg==
X-Received: by 2002:a05:6512:4843:b0:511:7f28:f8e8 with SMTP id ep3-20020a056512484300b005117f28f8e8mr1510839lfb.63.1707910917127;
        Wed, 14 Feb 2024 03:41:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfH3/g35RuDyhvzIfATZTTLIR2rJynU8TdLm5oAGqUbVOCHC9mYTayvxWXVzvpn9gwU/oGC2j9x/ljvXoGP3Z7IqmXEDmRGsK+oixE8XlwVsVqE9OtSiJ38X+XqfSohaj1ZzbBpfu+Re8j
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 2/5] iommu/x86: print RMRR/IVMD ranges using full addresses
Date: Wed, 14 Feb 2024 11:37:38 +0100
Message-ID: <20240214103741.16189-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214103741.16189-1-roger.pau@citrix.com>
References: <20240214103741.16189-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's easier to correlate with the physical memory map if the addresses are
fully printed, instead of using frame numbers.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/x86/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index a3fa0aef7c37..304a2f5480c7 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -801,8 +801,8 @@ bool __init iommu_unity_region_ok(const char *prefix, mfn_t start, mfn_t end)
         return true;
 
     printk(XENLOG_WARNING
-           "%s: [%#" PRI_mfn " ,%#" PRI_mfn "] is not (entirely) in reserved memory\n",
-           prefix, mfn_x(start), mfn_x(end));
+           "%s: [%#lx, %#lx] is not (entirely) in reserved memory\n",
+           prefix, mfn_to_maddr(start), mfn_to_maddr(end));
 
     for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )
     {
-- 
2.43.0


