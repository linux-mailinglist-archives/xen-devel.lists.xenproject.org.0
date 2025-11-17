Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED1C666D7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 23:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164262.1491268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL7bF-0002dP-B3; Mon, 17 Nov 2025 22:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164262.1491268; Mon, 17 Nov 2025 22:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL7bF-0002bM-7i; Mon, 17 Nov 2025 22:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1164262;
 Mon, 17 Nov 2025 22:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FLbM=5Z=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vL7bD-0002Nh-BI
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 22:21:27 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1f41323-c403-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 23:21:26 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-477632d9326so33051505e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 14:21:26 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42c9628ebacsm15223789f8f.30.2025.11.17.14.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 14:21:25 -0800 (PST)
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
X-Inumbo-ID: c1f41323-c403-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1763418086; x=1764022886; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EH5GucMwXGqWhJcPk1xUrIEMbDP0L0S0sWt+dj5pD8=;
        b=KLsytlqYBD4WA88bUHDYY/MmPNYHKi9ztastV9P6lF+bMAqMOyDmbx16QJeHi0WKTs
         h2gPEnixUshGtlXuC8ptETduFikZCZBN6oetTC9YJpxH7SKRRriNktr2QruR4j9iPsVT
         Bwe1eaGvog1gf5iHQPK2F0gbV8JllhwBhsV50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763418086; x=1764022886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0EH5GucMwXGqWhJcPk1xUrIEMbDP0L0S0sWt+dj5pD8=;
        b=tSPmWDtIbUhVZnUVTAwm1E34q1RXY5mnGFrHtTWKiEz1ljwrAx2+NPf3R2F8Dl2Lee
         kKqksHxfuWXWZTJCGXAQ4opQqFNajXweyMnGVinX0HoYjCqpij6AaHhhkjseu9347lvH
         a72jHqfokYFFW3mh6bCNrVV1TKU9O0Ghl2f3yGmPgdkumxUM3MFpMrtCu8yYksg1zuQ+
         NWTFzgf0adTo9nDR0QbMNo6F6ZQBzGn29yFRXynb4hQhtvDDaRdwfEPNTWyeKM+A+ics
         dT1mJKYhte/SznS30jD1YAMVb3CxQFkJdR6eIwy8S4VO8h21XcU6HrdOp98Qhrk6AV7s
         0HUA==
X-Gm-Message-State: AOJu0YwSfiooF7YQ+qQJQ5nJ3vi7hPIzgLfycCVWynxHZeWNgR7wyoXf
	bqQh0c4nUeR9j1hefOIKrbFogpxyu1Px4GIsMZYmOR7fZh6SOVn+YmXeSnNQmrFCNX2Er2QU/BQ
	NHmxdUeA=
X-Gm-Gg: ASbGncsKoKb/wAro0/mtpmzMK0JRL06h1Y5ZnDuVMK3W63SbsodfybF1MGDPahq1gyD
	EqpuJPVm1LX4iFpanaG43a5IiDUMXMHyuzE/mGRPakN3JZLqVs/JlP0Re648WJgI6F6yBO2CJvR
	vgT962yWDs0sPhlvZriV1xTC6X5y4rhuA9SJYq6wiyFv2buI7M5balZtM/de3SF6cQRwAEGnlme
	SVPdXqpMcP4p7nplcsv/yAEG3SD/lalMC88yCJ78/z/XYE1q+XAjgvWj+QzRJ0jzW9TQlP3JpBf
	Cpa9/Vecx9m+luKeEcj0To8fiAA9x/ZnHKbLR8FMfEDnB5B6GR0nOx6FcwqjXvOEJ5+7BvrDD6G
	XjiuvojehM9Ak45MSZ2OS0wMhid5tzCh4BQaMZp+nlmKeLDHO0jviP+VxtF8wFKrgqf5EuD7qp8
	FMbqy2yHMacxapzdZs6WdElFEn0cAD7EAbCM/Ke82wI8cJabeRqT0=
X-Google-Smtp-Source: AGHT+IFMby+nD02SNTcy7GT8KlTdwfb6ZYI/udhxHT1ifds0MnlO/6g25QzPN4r7zPtISkr+ekvslA==
X-Received: by 2002:a05:600c:4744:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4778fe5ebb8mr142554435e9.9.1763418086033;
        Mon, 17 Nov 2025 14:21:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/ucode: Create a real type for loading_state
Date: Mon, 17 Nov 2025 22:21:20 +0000
Message-Id: <20251117222120.473451-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251117222120.473451-1-andrew.cooper3@citrix.com>
References: <20251117222120.473451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Using typeof() in wait_for_state()/set_state() unnecesserily cryptic, and more
verbose than using a proper type.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 7aaf62839f56..fe47c3a6c18d 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -70,12 +70,13 @@ static unsigned int nr_cores;
  *  - LOADING_ENTER: all CPUs have called in. Initiate ucode loading.
  *  - LOADING_EXIT: ucode loading is done or aborted.
  */
-static enum {
+typedef enum {
     LOADING_PREPARE,
     LOADING_CALLIN,
     LOADING_ENTER,
     LOADING_EXIT,
-} loading_state;
+} loading_state_t;
+static loading_state_t loading_state;
 
 struct patch_with_flags {
     unsigned int flags;
@@ -237,9 +238,9 @@ static bool cf_check wait_cpu_callout(unsigned int nr)
     return atomic_read(&cpu_out) >= nr;
 }
 
-static bool wait_for_state(typeof(loading_state) state)
+static bool wait_for_state(loading_state_t state)
 {
-    typeof(loading_state) cur_state;
+    loading_state_t cur_state;
 
     while ( (cur_state = ACCESS_ONCE(loading_state)) != state )
     {
@@ -251,7 +252,7 @@ static bool wait_for_state(typeof(loading_state) state)
     return true;
 }
 
-static void set_state(typeof(loading_state) state)
+static void set_state(loading_state_t state)
 {
     ACCESS_ONCE(loading_state) = state;
 }
-- 
2.39.5


