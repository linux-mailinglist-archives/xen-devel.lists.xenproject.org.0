Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC4A81B347
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658743.1028071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGG32-0008Fq-7r; Thu, 21 Dec 2023 10:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658743.1028071; Thu, 21 Dec 2023 10:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGG32-0008DQ-5A; Thu, 21 Dec 2023 10:13:00 +0000
Received: by outflank-mailman (input) for mailman id 658743;
 Thu, 21 Dec 2023 10:12:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGG30-0008C4-IY
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:12:58 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82b6c410-9fe9-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 11:12:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c29f7b068so6278355e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 02:12:56 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 b6-20020a5d6346000000b0033683574772sm1614863wrw.65.2023.12.21.02.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:12:55 -0800 (PST)
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
X-Inumbo-ID: 82b6c410-9fe9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703153576; x=1703758376; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJqk6Pur9dOADqhhWPpTnn4CtiAiEvc3SjgIBFQKraw=;
        b=oC6IIaRxVQ4lzsxNlvEvNYbNj8W0MTlzWp2SNrUJXhdURwrwb8cPdwWpVvCjzTRGit
         24yg3q2oITEjgyJNfj6UrSZlVXS+JUO+IRIdn12BJbIgMiF8w38LCmDqb3tcWZfunzWi
         UlLsTTnBU5C16NsVaIJlDRKL8BzCxy3wz/enw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153576; x=1703758376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJqk6Pur9dOADqhhWPpTnn4CtiAiEvc3SjgIBFQKraw=;
        b=DZPdlKvEHEvwYtxgwU2TOmNLNj1FKc++POviKu4yUYnY7sSLdS08B4//ZIXy7WreKI
         zlTByabTCuOWMSoo2+WqcVfn06eGBANAfAuGUkeQRK8BgIPK6CNXT7k5qu4vDbFthyBO
         T8C3UmNI3123/oQHsYOAvGif5rsQQEvs7CMuyflqzPfofHM+3+3i+gQkwU5bftsFxMmq
         w4cS98KBX6JtYoaCYEY3tgdjDP2se8bd/QK/Dj3bG5z2kCx3heF6Vr7Pprk3NvMyzEeN
         fkcyEW7C138YUamvVUJnu2Mkct7yl9sJTKcs7Cyyj1g/7UQXqx4GjGKDmn3vx2kPnTOc
         APzQ==
X-Gm-Message-State: AOJu0YyPVYzZ6Qb3rMHlkyC1bVAX+senEb3mJctrfl6eZ0i6gUzdZuLl
	acBj9IbAFP5IAwNKafp9vun1b0287dFmfJpRgKI=
X-Google-Smtp-Source: AGHT+IG9z2zfstjFpXvpIHNBwwSnDwJqoftYl1oFCffwk7ZuleQ/h3y8lZP0YuTuMFamDZ61rLPPdQ==
X-Received: by 2002:a05:600c:4fc7:b0:40b:4476:cd31 with SMTP id o7-20020a05600c4fc700b0040b4476cd31mr561970wmq.13.1703153575885;
        Thu, 21 Dec 2023 02:12:55 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH] x86/iommu: add CHANGELOG entry for hwdom setup time improvements
Date: Thu, 21 Dec 2023 11:12:44 +0100
Message-ID: <20231221101244.25650-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134346.22430-1-roger.pau@citrix.com>
References: <20231220134346.22430-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5ee5d41fc933..52484c047bd1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - Changed flexible array definitions in public I/O interface headers to not
    use "1" as the number of array elements.
+ - On x86:
+   - Reduce IOMMU setup time for hardware domain.
 
 ### Added
  - On x86:
-- 
2.43.0


