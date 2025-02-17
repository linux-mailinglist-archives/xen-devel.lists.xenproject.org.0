Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7881A38CA2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 20:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890813.1299954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk72d-0005oJ-Iw; Mon, 17 Feb 2025 19:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890813.1299954; Mon, 17 Feb 2025 19:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk72d-0005lJ-GB; Mon, 17 Feb 2025 19:44:31 +0000
Received: by outflank-mailman (input) for mailman id 890813;
 Mon, 17 Feb 2025 19:44:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk72b-0005X7-Nx
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 19:44:29 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 994766b6-ed67-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 20:44:28 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43937cf2131so31539725e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 11:44:28 -0800 (PST)
Received: from andrewcoop.. (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06d22csm161547025e9.22.2025.02.17.11.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:44:27 -0800 (PST)
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
X-Inumbo-ID: 994766b6-ed67-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739821467; x=1740426267; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YzESArRGDEbanW7NDpWp+57rIKx6rZ39D0RVCP0EuY=;
        b=cwJKryvjPFA1DszRqyUSOE8v0/SHb6sbz3/7ttoogZEfkXhxEpln/+efg3I+Mymzu7
         sStIpW2JQA7zn6+ZdLvrb2l0s1rUKcyp37adwcUoakxArqbOng/odO9fPVrcbi5TI2SU
         KpjZXR2QZ4/rFf53dNoxwHX1Ns4z2EZG4dEPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821467; x=1740426267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YzESArRGDEbanW7NDpWp+57rIKx6rZ39D0RVCP0EuY=;
        b=fwIY4Pj5NPdkf2teiCliaa9SGTAc6cdAby/CPb3Y6Yhtb4M/pZnLJ0Q0YUB93cAmXO
         PciAyvYQeWNE0n8YU7p+EguTaDLHnoHcYouITLdbPJC5R+mQuOrysmtBAES4Rv/qVRe/
         BhrY1bzwczcISLS7I2acS6g6LaoEGLWlX0gqxlakHOSoCGM+ybRBC+1pvCs/bTk4rdGK
         wZRfhdN8Ih/jlon18oCgoBVLcdo5EG5CDUGTDCO/iBe7iehnajeLGWPoxnZmowID8WZv
         BR4lDPtQ9Hat0ieK9J5QfL5q/gDLp9HNkMC+Fe/1fTthcGpiqQE3CYQqxDwir579ai3s
         /cww==
X-Gm-Message-State: AOJu0Yw+xk/kQuu8bGfQZDXEnybPlOJeeBRs3rhkA5g3oGjPCsGQP2/6
	ZfR37SR32QwMDU8TTIWmbBg1xRCJT/lK/xncrrKye+L83bNg1evqn0kZgv4IzTUPyw2/kcXF2rv
	X
X-Gm-Gg: ASbGncvJEMPr+I5Nd8J4V7MeV3apVZxufxt8w+2RXhntZOk4Xxt2E8F/IIBX3bVBL44
	KCMfeChPII4FJLcbqLmemwdkT6S7ikdgKduXwsPu5LVYZy19k15xpd5W0k/6Ul5HsQNo1lwdXPR
	llnGqoWgg1gXEf2ZQn0Ai/4uPDf2Tagx78Bcb8hcrEaQsPj1B6bBGFEIysz0XaRR34ww7aCX5bb
	bYOX0CTe3cZJHWWe4Zynws/bm02SpoK/T5Iqb3dqb5ed6qmv/pSLtGk6vooeBgBbaqEAbruRhod
	/1NcwuQoWHem+4JGgi15uC+36ujw8OoHb8C6vKeWAfAqcu/iESsl
X-Google-Smtp-Source: AGHT+IE99dFPsW0YkAvMyNqRAy9mwU7uFHCF7uYyOWMGkzmRGb2OORq8+KprPLet8O8BIX+shANhqA==
X-Received: by 2002:a05:600c:1c84:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-4398c806deemr23873485e9.19.1739821467385;
        Mon, 17 Feb 2025 11:44:27 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21 3/3] xen/ACPI: Drop local acpi_os_{v,}printf() and use plain {v,}printk()
Date: Mon, 17 Feb 2025 19:44:21 +0000
Message-Id: <20250217194421.601813-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217194421.601813-1-andrew.cooper3@citrix.com>
References: <20250217194421.601813-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that Xen has a real vprintk(), there's no need to opencode it locally with
vsnprintf().  Redirect the debug routines to the real {v,}printk() and drop
the local acpi_os_{v,}printf() implementations.

Amongst other things, this removes one arbitrary limit on message size, as
well as removing a 512 byte static buffer that ought to have been in
__initdata given that is private to an __init function.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/drivers/acpi/osl.c      | 17 -----------------
 xen/include/acpi/acpiosxf.h |  5 ++---
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
index ab80d6b2a92a..7f233bab4269 100644
--- a/xen/drivers/acpi/osl.c
+++ b/xen/drivers/acpi/osl.c
@@ -45,23 +45,6 @@ ACPI_MODULE_NAME("osl")
 #include CONFIG_ACPI_CUSTOM_DSDT_FILE
 #endif
 
-void __init acpi_os_printf(const char *fmt, ...)
-{
-	va_list args;
-	va_start(args, fmt);
-	acpi_os_vprintf(fmt, args);
-	va_end(args);
-}
-
-void __init acpi_os_vprintf(const char *fmt, va_list args)
-{
-	static char buffer[512];
-
-	vsnprintf(buffer, sizeof(buffer), fmt, args);
-
-	printk("%s", buffer);
-}
-
 acpi_physical_address __initdata rsdp_hint;
 
 acpi_physical_address __init acpi_os_get_root_pointer(void)
diff --git a/xen/include/acpi/acpiosxf.h b/xen/include/acpi/acpiosxf.h
index de83ea38c40f..2da318962f0d 100644
--- a/xen/include/acpi/acpiosxf.h
+++ b/xen/include/acpi/acpiosxf.h
@@ -82,8 +82,7 @@ acpi_os_write_memory(acpi_physical_address address, u32 value, u32 width);
 /*
  * Debug print routines
  */
-void ACPI_INTERNAL_VAR_XFACE acpi_os_printf(const char *format, ...);
-
-void acpi_os_vprintf(const char *format, va_list args);
+#define acpi_os_printf printk
+#define acpi_os_vprintf vprintk
 
 #endif				/* __ACPIOSXF_H__ */
-- 
2.39.5


