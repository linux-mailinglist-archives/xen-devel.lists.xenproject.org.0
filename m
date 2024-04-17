Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F78A80A0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707389.1105254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2O2-0002bK-VJ; Wed, 17 Apr 2024 10:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707389.1105254; Wed, 17 Apr 2024 10:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2O2-0002YZ-Rz; Wed, 17 Apr 2024 10:19:30 +0000
Received: by outflank-mailman (input) for mailman id 707389;
 Wed, 17 Apr 2024 10:19:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2Ah-0007lO-3z
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:43 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bfe0068-fca2-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 12:05:41 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-518bad5f598so4310685e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:41 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:28 -0700 (PDT)
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
X-Inumbo-ID: 0bfe0068-fca2-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348341; x=1713953141; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1MRHWaxfyyc3IOUvgCXcME2tukXRadRa1zIKb0dwxo=;
        b=Z/3qkuoReuZ/1JElXlV9SFNKYmaN8TOmzfBnh3kywRI+2sFY92r/zXWXt0czwx7pxF
         tH+XGDQXGsUi4A18vtXKgH3Dj9Kpb4FfOa7By1D5VWfKEiRpAqNwBNFlO/4YK8Nqy2l+
         ud+S/0fQEu2i1ZZmbqmoqG5InQ++YWy27frpCIaIl8OedD5q/4+cLcgHTgX34QaTysPw
         BcxA+1aBaDnygo0qnfTad2tUG53n6ZowGa6jbNtSWnJmNvXD+9OEKN4eYH5rZzUrZHmF
         0V1iFaNHOpPvJAEjfFaS1uQbNh5f4SZ9fsK3wuPotRnPk/VpmsxXjabQTBsz3FT8Gl5H
         HSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348341; x=1713953141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1MRHWaxfyyc3IOUvgCXcME2tukXRadRa1zIKb0dwxo=;
        b=tN/OaWS5mYeahmDpO/hy9D3a7N8jZST9Vn8s1ZUA27PyIIxGyyj5l1zo5KyS3z/SwV
         SNVuqxCBa+qIxez7Rn7viaUZAaVzKIidjWDRUoDuvPxhZBAMITBAxo+iCwUoOAk91Xue
         V8KjnciKb1hWfN3t97vWj7y4Ct6VUzlclaeieq5inpNpARMtL+Ukl2qtChHWFSkgezUD
         MQSly1VtUB3luSFzyOSYPXGI/Iv8ecSShiIR38R+5S1qwgjuHERuOO85HT/OZcPJYhPe
         T8O1OmvbDi+DOt/Y7gLc1WF+VJqVpl0Z0smIhtrhXRjpmHUFMZdErWYLDfg1rBxK74lW
         dBmg==
X-Gm-Message-State: AOJu0YwfsRSLJ+Q9/ofZZXJpqfpNVxmEv7HuCK5caYmmcWuGzRjL266D
	yoaVSlriSK3JSk/hFvAFTm1ad8QM5sF/zXJ1yjFYbI1s60xqWfuGUDXArg==
X-Google-Smtp-Source: AGHT+IHYxUNuLcnj5lnbL+eFh6JkLAxnCR3VtZprkppKkMRKih/MM+e+QJ1vrKUYTB52ld1CJFCzNQ==
X-Received: by 2002:ac2:4c47:0:b0:518:b0fd:bf50 with SMTP id o7-20020ac24c47000000b00518b0fdbf50mr9946612lfk.68.1713348328217;
        Wed, 17 Apr 2024 03:05:28 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 17/17] xen/README: add compiler and binutils versions for RISC-V64
Date: Wed, 17 Apr 2024 12:05:00 +0200
Message-ID: <7d80538976c88fad8005831f7ce85e5a17e49535.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch doesn't represent a strict lower bound for GCC and
GNU Binutils; rather, these versions are specifically employed by
the Xen RISC-V container and are anticipated to undergo continuous
testing. Older GCC and GNU Binutils would work,
but this is not a guarantee.

While it is feasible to utilize Clang, it's important to note that,
currently, there is no Xen RISC-V CI job in place to verify the
seamless functioning of the build with Clang.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5-V8:
 - Nothing changed. Only rebase.
---
 Changes in V6:
  - update the message in README.
---
 Changes in V5:
  - update the commit message and README file with additional explanation about GCC and
    GNU Binutils version. Additionally, it was added information about Clang.
---
 Changes in V4:
  - Update version of GCC (12.2) and GNU Binutils (2.39) to the version
    which are in Xen's contrainter for RISC-V
---
 Changes in V3:
  - new patch
---
 README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README b/README
index c8a108449e..30da5ff9c0 100644
--- a/README
+++ b/README
@@ -48,6 +48,10 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
+          Older GCC and GNU Binutils would work, but this is not a guarantee.
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.44.0


