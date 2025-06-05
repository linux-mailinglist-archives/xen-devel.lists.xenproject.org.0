Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0A3ACEE5F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006653.1385875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8aU-0001iy-9c; Thu, 05 Jun 2025 11:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006653.1385875; Thu, 05 Jun 2025 11:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8aU-0001gp-60; Thu, 05 Jun 2025 11:16:46 +0000
Received: by outflank-mailman (input) for mailman id 1006653;
 Thu, 05 Jun 2025 11:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fE9Y=YU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uN8aT-0001e1-2R
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:16:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fc205c0-41fe-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 13:16:43 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so10156165e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:16:43 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526f4c808sm2043887f8f.28.2025.06.05.04.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 04:16:42 -0700 (PDT)
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
X-Inumbo-ID: 8fc205c0-41fe-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749122203; x=1749727003; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moO8xlFiAerCznDfAfTky8HoC4xQsYEV2DeeU3FdPhg=;
        b=onuiSKS/0D09FV8xaJ8IZzr4/Wt+HEwXxA38psVQlx9Q8318qdQFOo6AQ9otNHNpna
         n7Uq4XuBN2luhG0dobe/mVVblLVBGOvE7JwkSKTtSG4qr9xA06XLWAqIwYShvdvWw83U
         LtE54n4a+6DWUgA7jXsXpm+Dbq/kUdGRHA1x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749122203; x=1749727003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moO8xlFiAerCznDfAfTky8HoC4xQsYEV2DeeU3FdPhg=;
        b=lFdDTZktUAKLoboaVoisQ5Bz1lWl+W+yLm4SeuHAoj17EPiRHw/wboS3s8Abw/YsKG
         O4ZFJrweT2WWTRcejlz7USzPejMRCdC7PzRQG7EEbVb6agD7aUSwhZ1HUzdEYQMyjbxI
         SuIBc14KvEdjcFauUs9Es3z1SFupggiCjC8l9fCVeh48dENG9wlZiOOake8WgPjcahyy
         ptacXuPgIVOGY6Ja/4kB/NQdOzCLZ212V2B1+WsaPCPMNUsctReH4lIe1bXuIrI0ImhC
         akAzwGqZoV4cU0aflcyqXnWUkfSSGp1MLIOu7/zichnkBY9qfDFt3AMQWdo3qW+zOxBj
         65Jw==
X-Gm-Message-State: AOJu0Yy1c25T3eMiJKqNM/EJr8uNu3KIS/xedD871Hji9HFlLYkdX2V3
	AmRBNzWggk88NKaoXUoszwmhbmF4PtarCf4cUAj6gzQ714yLUpEWnVI80a5a6KeoTCeL7Yr5e1+
	Id5b/
X-Gm-Gg: ASbGncuovaNHsbmqo8QGH08vFTuELt+wnIhBobiIlfRzlGcWisUi3KO6sNst4GG1bY5
	TGTXM2oZeidA7gZk9zl025iPaxrn+NzZw7FHBKqVPwWFMQeZ9kv5FmjWVsowLRNtKOv2IltvW9i
	IvuooF+VE8dfMUDVdp5PiRUmz8ML+R5x+0wGnGkwYwJorgNdngVHB7+uXrGxmV2IRk2UxpVHzZ4
	y86HZ0GvbzqZfUYZXC8aCfEjNIGD5pkrkbQucBqbi/KNKRnsJbp62J3aq3wR2Squ6pEHxOhsQ1K
	rQiWldNXBwsvymDcaHWBEbKWHogVElijVxhK05NzRJXMFcms9ggAAnq3WDkQTvb330kuXL180Hf
	S4bxEfKV06P+6MxWhNE++CDWkYJT9mLAesmI5MSaJdV7fzw==
X-Google-Smtp-Source: AGHT+IH8mOB4XgF/U6YfkV/aYOXYekYBKPq8fbc96Y8Ht/wd2TKdqPhACM6OFgroSNmkOMZhrwxP3Q==
X-Received: by 2002:a05:6000:1ac9:b0:3a4:f439:e715 with SMTP id ffacd0b85a97d-3a51d8f6356mr5352020f8f.9.1749122203120;
        Thu, 05 Jun 2025 04:16:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 2/3] x86/EFI: Explain buildid.ihex
Date: Thu,  5 Jun 2025 12:16:37 +0100
Message-Id: <20250605111638.2869914-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
References: <20250605111638.2869914-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an awful lot of magic to only be explained in a commit message.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/efi/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index c6678652fc98..3e88f552d20b 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -6,6 +6,8 @@ cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
 $(obj)/%.o: $(src)/%.ihex FORCE
 	$(call if_changed,objcopy_o_ihex)
 
+# buildid.ihex is an empty COFF object.  It exists for the side effect it has
+# when linking into xen.efi, causing --build-id to attach a .buildid section.
 $(obj)/boot.init.o: $(obj)/buildid.o
 
 $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-boundary=4)
-- 
2.39.5


