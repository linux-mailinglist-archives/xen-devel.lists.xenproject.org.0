Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A6C7C53DA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 14:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615466.956701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYHc-0000dN-Ly; Wed, 11 Oct 2023 12:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615466.956701; Wed, 11 Oct 2023 12:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqYHc-0000ab-IS; Wed, 11 Oct 2023 12:25:48 +0000
Received: by outflank-mailman (input) for mailman id 615466;
 Wed, 11 Oct 2023 12:25:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6si3=FZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qqYHa-0000a2-NX
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 12:25:46 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c3d659c-6831-11ee-9b0d-b553b5be7939;
 Wed, 11 Oct 2023 14:25:43 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3247cefa13aso6150593f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Oct 2023 05:25:43 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 m15-20020adfe94f000000b0031984b370f2sm15346400wrn.47.2023.10.11.05.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 05:25:42 -0700 (PDT)
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
X-Inumbo-ID: 4c3d659c-6831-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697027143; x=1697631943; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GP3SHDxG32NUcbGPIwJuxNha0yXtAXfsBO5VDAb7fXE=;
        b=hxnx7rRnheEYyg/O1uvIeeq+Z5VlKhuwYv4RckbmiiyqcvRLoC19u4lAmRqm7zf/Pw
         xEoHMs6uUxfW0cjBInCeIhyPUws/R8kjmmTilh9BAhPtL1lml9vOvw5ilnlnqdSPmmrh
         SH9Wsxm/9PWK3eatjr1WyF9GnkVRuXtEYgpv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697027143; x=1697631943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GP3SHDxG32NUcbGPIwJuxNha0yXtAXfsBO5VDAb7fXE=;
        b=fSQo9LApPcFn1tHr7THDiShxktrCC2BQBLxBNkjETQ6iIrdsD8rljXK5LuqhhjxqWU
         yRdUjCGxLHzOfOjE1uGVesz7vDPIMlYiAmH7nO/5RCxm9Zr7UqqIy627y14AVtwwouw0
         WA9sd4DJldLtbDNCgIVBgiu5Y3UGj5Z7c0GrGO6vpwk6J7/d2V7Tb4So05uO6Wp0ubYe
         LTYNoM8M43Zr8dG8hPiquQRd9c5KJJKUSZt+PMegQwmvQ3EymtmZYx0i5JetlN0+JC9E
         pgkUC4YdzNmG80YTczuMNZzafWR5AafKZfomLQoi9YT4qJfJN4anFVufSTZ2lgBMhMeN
         YZZw==
X-Gm-Message-State: AOJu0YxNBQFp70FLj8BPHd0ksgXJeINVOf2Y+iRlmoWGuy6y9MP3RW0U
	DsZt7KKtijrfLfJTMcLFaMZKoOQOgnTnBYq2xBQ=
X-Google-Smtp-Source: AGHT+IFFv7S0SNFFTbZOS99pcL5n9UBnSJV6Q8VKAXEEfdoCyH888FhZrJTyXke8fL88B+hL13jn4A==
X-Received: by 2002:adf:a4da:0:b0:32d:7615:372b with SMTP id h26-20020adfa4da000000b0032d7615372bmr2804384wrb.12.1697027142918;
        Wed, 11 Oct 2023 05:25:42 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/pygrub: Fix pygrub's --entry flag for python3
Date: Wed, 11 Oct 2023 13:25:20 +0100
Message-Id: <20231011122520.1826-1-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

string.atoi() has been deprecated since Python 2.0, has a big scary warning
in the python2.7 docs and is absent from python3 altogether. int() does the
same thing and is compatible with both.

See https://docs.python.org/2/library/string.html#string.atoi:

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/pygrub/src/pygrub | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index dcdfc04ff0..541e562327 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -731,7 +731,7 @@ class Grub:
 def get_entry_idx(cf, entry):
     # first, see if the given entry is numeric
     try:
-        idx = string.atoi(entry)
+        idx = int(entry)
         return idx
     except ValueError:
         pass
-- 
2.34.1


