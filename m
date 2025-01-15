Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B95A12582
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 14:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872575.1283546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3uD-0003YA-BF; Wed, 15 Jan 2025 13:58:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872575.1283546; Wed, 15 Jan 2025 13:58:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY3uD-0003Vm-7i; Wed, 15 Jan 2025 13:58:01 +0000
Received: by outflank-mailman (input) for mailman id 872575;
 Wed, 15 Jan 2025 13:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4o+i=UH=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tY3uC-0003Vg-LJ
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 13:58:00 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9f61f37-d348-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 14:57:58 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso69939195e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 05:57:58 -0800 (PST)
Received: from localhost ([185.68.248.203]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c755004dsm24744045e9.40.2025.01.15.05.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 05:57:57 -0800 (PST)
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
X-Inumbo-ID: b9f61f37-d348-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736949478; x=1737554278; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVYFuC6PVZUV0deiVHJWehXQseTiVDXXhyBaRkG7Lt4=;
        b=XTAvJ/JwljL7gMkMMxBPbqU80oWaKadjhWrw/XgipGYNXwDxOTiM3Mxvw9g32WzcMI
         1HvRc0uuQ3cNNiWpuIEY4GwSVa09a8GzjT625+Ocx/21/mYusFZ/2SNIkteOJCL101l4
         ioEnWhKKWEzsb8AeyaC2pUeLecT42AYn5EjC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736949478; x=1737554278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVYFuC6PVZUV0deiVHJWehXQseTiVDXXhyBaRkG7Lt4=;
        b=jaJxLnScsCdsdINzcDoI2gKNbi+KAz4C7g+knGP2Nvteir8Xn459ymDJ7qZb12ZqcG
         GlJwRFU5s8Fi/Q5WQWndQ2nspVe+dWv7RZ+HMUruwA5ESccjU1W5EGI0ClImIEbT3oG7
         ytFZ4nDr3BnQKUS/o3Ug/ZSuCY+kxQNLdS5xRy69sTU/lHu39QdliNuHlxO+viK3BVQq
         qaqD+QEY9yrYghaXoUu7KPRcwNabiUdIaKYpFQK/A24+7TB7VPqi5CZMSJJXyqddpUpI
         4MtIpe9g09RtnS6I5Tk3n2eOatsxljB0Cqp6IJqhY/+TplsIMq1npJWP6vR1KHx5wGt2
         wt+A==
X-Gm-Message-State: AOJu0YxqUro4jisfdJZsJFT5Mwcg14HrWwQ8LlSHQm5VXuHDUnP9rSGu
	+5DfoTAsrPPbUd3+ezchAgLLmZhO9ytIOTezo6H+HzWahAFXiA3gOP+SnXi5IHFOZzWz6UWWsTy
	dt7JBBQ==
X-Gm-Gg: ASbGncsVWd/fbIzvVJRZNqZrSjxiBTgWEvCY7HaY0YSKzM6HEW9Wk8Qz6bXpqTAVdQf
	/F8dSDYNZBi7OWCrQWlw7kK1cw5U/I6turkvLlsEmecQSBLPVu/jj9CMH//qlfMUFHrRIXJsKy4
	1oXbKUaM3M9JiyHLNrcmVePSdn+tYkQizVNWrTXKLI2nk759gfQ1dhOSuQ2bAsEHDTr+HN7E/Pz
	khNCfHwEyLklDqcD3kyvfc7JRfQw1F9uOLq/Stph/DDkhEp1dF0I4RMtlYd8Q==
X-Google-Smtp-Source: AGHT+IFP7zeDNGf9Z5t4SqMLgfP9iINqrDeVFQCSEK1fNRUxn7VhctDM7Kwl+EJdlZgdJCB47mhTwg==
X-Received: by 2002:a05:600c:1e09:b0:436:e751:e445 with SMTP id 5b1f17b1804b1-436e751e61fmr280515055e9.5.1736949477597;
        Wed, 15 Jan 2025 05:57:57 -0800 (PST)
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] Manual pages: Fix a few typos
Date: Wed, 15 Jan 2025 14:57:54 +0100
Message-ID: <3093091e43220a0e6f698f7b3f5dafc5eba2d021.1736949423.git.bernhard.kaindl@cloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While skimming through the manual pages, I spotted a few typos.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>
---
 docs/man/xen-vtpmmgr.7.pod       | 2 +-
 docs/man/xl-numa-placement.7.pod | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
index 3286954568..95854adb08 100644
--- a/docs/man/xen-vtpmmgr.7.pod
+++ b/docs/man/xen-vtpmmgr.7.pod
@@ -297,7 +297,7 @@ extra option to launch vtpmmgr-stubdom domain on TPM 2.0, and ignore it on TPM
     |   Primary Seed   |
     +------------------+
 
-Now the secrets for the vTPMs are only being bound to the presence of thephysical
+Now the secrets for the vTPMs are only being bound to the presence of the physical
 TPM 2.0. Since using PCRs to seal the data can be an important security feature
 that users of the vtpmmgr rely on. I will replace TPM2_Bind/TPM2_Unbind with
 TPM2_Seal/TPM2_Unseal to provide as much security as it did for TPM 1.2 in later
diff --git a/docs/man/xl-numa-placement.7.pod b/docs/man/xl-numa-placement.7.pod
index 802f33060b..4d83f26d41 100644
--- a/docs/man/xl-numa-placement.7.pod
+++ b/docs/man/xl-numa-placement.7.pod
@@ -45,7 +45,7 @@ user, via the proper libxl calls or xl config item, it will be computed
 basing on the vCPUs' scheduling affinity.
 
 Notice that, even if the node affinity of a domain may change on-line,
-it is very important to "place" the domain correctly when it is fist
+it is very important to "place" the domain correctly when it is first
 created, as the most of its memory is allocated at that time and can
 not (for now) be moved easily.
 
@@ -94,7 +94,7 @@ this reason, NUMA aware scheduling has the potential of bringing
 substantial performances benefits, although this will depend on the
 workload.
 
-Notice that, for each vCPU, the following three scenarios are possbile:
+Notice that, for each vCPU, the following three scenarios are possible:
 
 =over
 
@@ -102,7 +102,7 @@ Notice that, for each vCPU, the following three scenarios are possbile:
 
 a vCPU I<is pinned> to some pCPUs and I<does not have> any soft affinity
 In this case, the vCPU is always scheduled on one of the pCPUs to which
-it is pinned, without any specific peference among them.
+it is pinned, without any specific preference among them.
 
 
 =item *
-- 
2.43.0


