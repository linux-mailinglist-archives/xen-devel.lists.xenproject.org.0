Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741D8CB99C5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 20:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185681.1507724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NU-0002PI-Py; Fri, 12 Dec 2025 19:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185681.1507724; Fri, 12 Dec 2025 19:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU8NU-0002KP-Kh; Fri, 12 Dec 2025 19:00:32 +0000
Received: by outflank-mailman (input) for mailman id 1185681;
 Fri, 12 Dec 2025 19:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vU8NS-0001RM-Tc
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 19:00:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0a28a71-d78c-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 20:00:24 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47a80d4a065so11245315e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 11:00:24 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f4af065sm16863975e9.6.2025.12.12.11.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 11:00:23 -0800 (PST)
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
X-Inumbo-ID: d0a28a71-d78c-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765566024; x=1766170824; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMX8hclgzHMMe8+a0wYX8Wx4IbGSejxjaqyDoIvWwPA=;
        b=kaZ0ayhnpFJgL8Vaa6OAtDUaM/Yow9rOkofS+C9pZaC6ONQlL8sms5qSwqo12RXhM9
         Sl06VfP/W9AvhYnXVqpCfwCP3cLkulA7hE9WnfDPsk9kK/taFp767mpd4NVRapXor0Nw
         lP0CzTMLsVoO93VWS3byFQGOKFE6PPDJHos9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765566024; x=1766170824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mMX8hclgzHMMe8+a0wYX8Wx4IbGSejxjaqyDoIvWwPA=;
        b=HOt2A+PnyXcwEz3LHvpVZwGSx8muG7uXArhBdLbxWMejypKeCMw0hFQTW3B3a8hNrZ
         QenrObA0mPxJ2xn48yDyY6bFB/XjtMW7qSC7Bj1SIwSfbxKmWePOoDoKgW+UJiclCsX9
         nUt66ZC4MjZiG4SyugnPRH8jEbTr1C35QzGbuHYGFCJRDc2dQvR2NlgTZv1E6zjYbzC/
         p/SNPWN0wk/QUzgEAkyxlZNG8k9JC7hIGz6L/Z6QPNfCwDMdIA2vl2qR/kUU9bmy7hNi
         pUC/AIRgyOl/5b/ugrV6RzakhOdCdLz5v9OW9x7hhACd02MkL036xl+/4mAdXX3ayHzR
         umug==
X-Gm-Message-State: AOJu0YxcGnmN6l39pZHhUGBODRgCj6wqXEGBCqVPohuAnQUPm44BATo0
	J5SAvvvSXDhmCE69P2ndTqQ3m4bxquckEPv48y43bdcLP7Q666LKTGhvAIl9uVRVp34fBjxboU+
	msZn7
X-Gm-Gg: AY/fxX6XwD0vOaQ1miyb+FnY80SyhIwjtHX4RdFqxPNXMQeSP7VCOPg9U9dGOiGjrt5
	bOdmMNRDdzjCRFz4CHaaQe67ypQNviuRidH2ZlOAjHaD7xYM3/Lq5UwrSzQf+GUVkx6YTxvp3co
	Uu0qE6iryYTAk7AiAd3qJD38uKVNNATUmqCnZIZaJawG08w1FDENCal7o3sIVTpTBmrgmvyePIn
	2f68UPrRonJ6ZguBtcO6iQQ/I4eOSesXTN+rn7V2hm6kD0hHoNkkLUL9axLnMUZfqwy0cez0EUI
	pvXSVQimn8GniZALQ08euRwwzThaioWDrzqlbgz/gQK/fOXpcr08JZT3OM7zCWpE9kTDHZLN9bN
	U/6kEvo6oPhOTJIOyBdY7erEnMVqb2I+ult/u1a67R+hI4fDUPZwF9cmyZ5p5G2WmDzbAaiK1XC
	ouI9/jZSAWD8jze0LdYOGOvP793zU8WBTkC4NImDlAwZmrfhYMXw6QAGvFbuLuvg==
X-Google-Smtp-Source: AGHT+IHFvn0wOVqXzITgjJLH/rXW3nvF60trf6a8xKufUBoAf80GilgiecqjjBzI8Ji1FcpYs0vvxw==
X-Received: by 2002:a05:600c:34cd:b0:475:daba:d03c with SMTP id 5b1f17b1804b1-47a8f8c1d1amr32991535e9.13.1765566023636;
        Fri, 12 Dec 2025 11:00:23 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/5] x86/svm: Move asm/hvm/svm/svm.h up one directory
Date: Fri, 12 Dec 2025 19:00:16 +0000
Message-Id: <20251212190020.2570076-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
References: <20251212190020.2570076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in preparation to remove the svm/ directory entirely.

intr.c doesn't need to include svm.h at all.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu-policy.c                    | 2 +-
 xen/arch/x86/domain.c                        | 2 +-
 xen/arch/x86/hvm/svm/asid.c                  | 2 +-
 xen/arch/x86/hvm/svm/emulate.c               | 2 +-
 xen/arch/x86/hvm/svm/intr.c                  | 1 -
 xen/arch/x86/hvm/svm/nestedsvm.c             | 2 +-
 xen/arch/x86/hvm/svm/svm.c                   | 2 +-
 xen/arch/x86/hvm/svm/vmcb.c                  | 2 +-
 xen/arch/x86/include/asm/hvm/{svm => }/svm.h | 0
 xen/arch/x86/spec_ctrl.c                     | 2 +-
 10 files changed, 8 insertions(+), 9 deletions(-)
 rename xen/arch/x86/include/asm/hvm/{svm => }/svm.h (100%)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 0a7ef15f7210..372d11f2ff20 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -9,7 +9,7 @@
 #include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm.h>
 #include <asm/intel-family.h>
 #include <asm/msr-index.h>
 #include <asm/paging.h>
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index b15120180993..7632d5e2d62d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -48,7 +48,7 @@
 #include <asm/guest-msr.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/i387.h>
 #include <asm/idt.h>
diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 0e115243a3af..53aa5d05125f 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -6,7 +6,7 @@
 
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm.h>
 
 #include "svm.h"
 #include "vmcb.h"
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index d8aa45590885..be3a710fa53d 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -11,7 +11,7 @@
 #include <asm/msr.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 
 #include "svm.h"
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 931973a9fad4..702c071e8962 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -17,7 +17,6 @@
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/vlapic.h>
-#include <asm/hvm/svm/svm.h>
 #include <asm/hvm/nestedhvm.h> /* for nestedhvm_vcpu_in_guestmode */
 #include <asm/vm_event.h>
 #include <xen/event.h>
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 63ed6c86b775..5718ca7f7f0f 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -6,7 +6,7 @@
  */
 
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/paging.h> /* paging_mode_hap */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 15d45cbb57c5..86a030b02c27 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -26,7 +26,7 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/i387.h>
 #include <asm/idt.h>
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 7bde6e98ce03..463e527a7d98 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -15,7 +15,7 @@
 #include <xen/softirq.h>
 
 #include <asm/guest-msr.h>
-#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
similarity index 100%
rename from xen/arch/x86/include/asm/hvm/svm/svm.h
rename to xen/arch/x86/include/asm/hvm/svm.h
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index e71f62c60186..dd0413e1fc13 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -11,7 +11,7 @@
 #include <xen/warning.h>
 
 #include <asm/amd.h>
-#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm.h>
 #include <asm/intel-family.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
-- 
2.39.5


