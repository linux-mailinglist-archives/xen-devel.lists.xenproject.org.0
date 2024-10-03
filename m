Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A533298EF08
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809332.1221646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnt-0005u0-Ca; Thu, 03 Oct 2024 12:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809332.1221646; Thu, 03 Oct 2024 12:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swKnt-0005kS-11; Thu, 03 Oct 2024 12:19:33 +0000
Received: by outflank-mailman (input) for mailman id 809332;
 Thu, 03 Oct 2024 12:19:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swKnq-00043u-Tn
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:19:30 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcf780dd-8181-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 14:19:29 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so164154566b.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:19:29 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a991047319asm77328366b.184.2024.10.03.05.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:19:28 -0700 (PDT)
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
X-Inumbo-ID: bcf780dd-8181-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727957968; x=1728562768; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bKKGq4cESxZkZMDW1uobM0TYcCXOg89PEXrmDcph/U=;
        b=Z/9T1A3jBJ9vvehfD0k2j41FYiT3BQZQFaA6oqswKNfpefjv+sjVHGhrzB/BI9OJrs
         TyZybE3bKE3gAi/Jcdd7UigPFk3TLYJJi7SLHKmz5UdIW4R4C9bK8hgxzKGp2MywfzGf
         vnhAZptSogFQqoP9Hgq6QcrdMHSvXB+qBTeGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727957968; x=1728562768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bKKGq4cESxZkZMDW1uobM0TYcCXOg89PEXrmDcph/U=;
        b=Gq6zvxx2Al1gwp04uhafA0OkIPCnrC8VGuUiVqnW+mlAhs9ntCuJyFzWh711tP+uWF
         Q5nNN7yaKC6w8/7RQZt1jnKIloKjtxOIurjH7tpqGdgl7zU0/yYmT3dtcKAmxK/Pil60
         MxqUtNPNKvxBJEf83ykGN/46vuVWioP+OrRGb6R02fWHLMLy+bNfLoCBoTCKuHkrAIQZ
         A2eHaUJgUQ4aoW+OOByvdXLjlQcYlbipJlVXWyaHWxDxqbZ849FV1ugZTLDObIAPvRxq
         eMyo5FvDHXumqq98q8lRCOC2aFcHydWdeq6qPGWCQFZ2JObH8UmHj/cyLmXoL6UW0Fpm
         Nzsw==
X-Gm-Message-State: AOJu0YxRSdLdHBLA7moxo2o5se+CMusSR4GcTrHj5j/KAJbapvt5xju2
	3eAQDSzS1j07Jeea690pp4+QK900bKppOImlQ6kISqu+gXCiMhRqj+qX+PtDGJSZYF8UOeKXheZ
	9
X-Google-Smtp-Source: AGHT+IHHaTwalJidEjy9sxmssDWoYVWJsub5dbnx49ZvuVUZNAG8AZEO8T+6RfeLO3j2ch+tUzHKxA==
X-Received: by 2002:a17:907:7fab:b0:a90:b646:8e4a with SMTP id a640c23a62f3a-a98f840793fmr525611066b.65.1727957968641;
        Thu, 03 Oct 2024 05:19:28 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 09/20] xen: Update header guards - Intel TXT
Date: Thu,  3 Oct 2024 13:18:57 +0100
Message-Id: <20241003121908.362888-10-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003121908.362888-1-frediano.ziglio@cloud.com>
References: <20241003121908.362888-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to Intel trusted execution technology.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/include/asm/tboot.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/tboot.h b/xen/arch/x86/include/asm/tboot.h
index 818d5fa451..15479fe80e 100644
--- a/xen/arch/x86/include/asm/tboot.h
+++ b/xen/arch/x86/include/asm/tboot.h
@@ -34,8 +34,8 @@
  *
  */
 
-#ifndef __TBOOT_H__
-#define __TBOOT_H__
+#ifndef ASM__X86__TBOOT_H
+#define ASM__X86__TBOOT_H
 
 #include <xen/acpi.h>
 
@@ -147,7 +147,7 @@ static inline int tboot_wake_ap(int apicid, unsigned long sipi_vec)
 }
 #endif /* CONFIG_TBOOT */
 
-#endif /* __TBOOT_H__ */
+#endif /* ASM__X86__TBOOT_H */
 
 /*
  * Local variables:
-- 
2.34.1


