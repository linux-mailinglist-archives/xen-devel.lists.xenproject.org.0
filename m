Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CE2B3B3C2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100651.1453997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urt9l-0005QZ-CD; Fri, 29 Aug 2025 07:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100651.1453997; Fri, 29 Aug 2025 07:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urt9l-0005MS-8Z; Fri, 29 Aug 2025 07:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1100651;
 Fri, 29 Aug 2025 07:04:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7tV=3J=redhat.com=lbulwahn@srs-se1.protection.inumbo.net>)
 id 1urt9k-0005Gk-IJ
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:04:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e0923e0-84a6-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 09:04:13 +0200 (CEST)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-wP3vbYb7NEeGYo8yDtEh7A-1; Fri, 29 Aug 2025 03:04:09 -0400
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70de0bdb600so33687356d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 00:04:09 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70e57e4b20bsm10805846d6.33.2025.08.29.00.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:04:08 -0700 (PDT)
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
X-Inumbo-ID: 5e0923e0-84a6-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756451052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HSxQ5uHqTcAFdl8TpMUsBZcieGblejZiliIfARmISnM=;
	b=Ev1j8SiYODL1fq6VR/VIZeR6mUpmbEcE/c6EjHgGTdjFFhyK4fg3jwFJWjb+etdhTivgQh
	28deOGN5F+bng+LWOb9bduy9MUz8ppnXVREk8/RBedmubECoHRmcYQJmp3jFtsKfujf9NG
	IlGMXP/qttiyR+ov1MvYdgLLqKd9VtA=
X-MC-Unique: wP3vbYb7NEeGYo8yDtEh7A-1
X-Mimecast-MFC-AGG-ID: wP3vbYb7NEeGYo8yDtEh7A_1756451049
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756451049; x=1757055849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSxQ5uHqTcAFdl8TpMUsBZcieGblejZiliIfARmISnM=;
        b=aU5yWs9W+3Sfxq5hO/rDfa/QrSRhPSm8GorHxuOOXp0QcJ1y2gDiMOeYjgps069XJb
         +oxfY025BG/Q95vfkssNAkFu5BzlEntAiExqhbJUw5y++//Z/LSCDTvklCiBz8QEAqjI
         Rq2wRAcU3m+6USQ8srCSDZPqxlnYckh+iWyWbZzANxsDCpteZ73qq9i0JhFoaSD9f72w
         sDl2Trmz2ziTe22dxY/2RpL+OFhRD+6EbIniMjtCoBmXjn5FtBQkAFTZQivCr+Gcpl5Q
         O5tBhHmKH58JCSorYBjIq7j6edBO78IcRcCY40n3kY7LHIzPnvI0HgoWSYVU1VhvPBz+
         cAuA==
X-Forwarded-Encrypted: i=1; AJvYcCUyU1meveosfhHmvcPjlrvMTowgyaPbXgwxYmje8XrfPgEGjfOA975m9YKR7joMZseZKnjI3hcAWSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAMRqRUUpkVDrdxwELEDbWCCdBQfWD2GN+qTeLSRK5Rk/trrbP
	39c3T2Esj+eUKq57Ao+XoU8twnZZnx2VPooc8RYap09VjlLUh7E1DyniXen2nEP/nPcDpcbOmCc
	ovFfiwY4Gv3oPxpBJGgo2G1JA9qfZFXNmgKAwxrXz+vsh6RmPPadJM4HT9bFnEFhzymtr
X-Gm-Gg: ASbGncvOeeWR45KN128QZoHiX4Ly9YEcska6jpCrNckLG3Mxn4OrqSWKCwGWMkz2AiK
	LwZbJ4trjwXFXvB3PUxc9smATTLBPVZjeyfnfr+SZ/ObQCKosjYD/7scYemTkZjWvnBHhhQowaB
	XZ+BXo2J0KfQYQIAk0WR/cYychnHn+nFOPG4UlivNhO4riEzbzuI7ZCMzoCMhbiL8+FRBDutFaD
	OwXLbgqBUFtICnrTvmVXP1+YBt1puZxPacMuxqlp5hUYy1PzPqSozBtKdTVI9/8gHcRGwy52d5D
	fyde7iQl0ZblAjUNQbw6+W9pMMmkrRxuhZT/yw1uH5TnDOpYwliwFuPWkFYg8v/2/z9msrIhsGG
	2WZj2JF6tzw==
X-Received: by 2002:a05:6214:2623:b0:70d:bffa:21fe with SMTP id 6a1803df08f44-70dbffa249fmr190374756d6.32.1756451048966;
        Fri, 29 Aug 2025 00:04:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvNCGAKglGCoAmY/c1Jkq2J7bhpvWeJJJNXZT684KY70w9wlcGMPpA0aV6SmC50M6VwQDWXg==
X-Received: by 2002:a05:6214:2623:b0:70d:bffa:21fe with SMTP id 6a1803df08f44-70dbffa249fmr190374536d6.32.1756451048411;
        Fri, 29 Aug 2025 00:04:08 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] x86/xen: select HIBERNATE_CALLBACKS more directly
Date: Fri, 29 Aug 2025 09:04:02 +0200
Message-ID: <20250829070402.159390-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E4XeIf_xXuj9EDPtHAiI37nZruB6vhcsETLQCSFAHYU_1756451049
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config XEN_SAVE_RESTORE's only purpose is to select
HIBERNATE_CALLBACKS, when config XEN is set. The XEN config definition can
simply select HIBERNATE_CALLBACKS, though, and the definition of
XEN_SAVE_RESTORE can be dropped.

So, remove this indirection through XEN_SAVE_RESTORE and select
HIBERNATE_CALLBACKS directly. Also, drop the XEN_SAVE_RESTORE from the x86
xen config fragment.

No functional change intended with this clean-up.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/configs/xen.config | 1 -
 arch/x86/xen/Kconfig        | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
index d5d091e03bd3..98b6952ba9d2 100644
--- a/arch/x86/configs/xen.config
+++ b/arch/x86/configs/xen.config
@@ -12,7 +12,6 @@ CONFIG_CPU_FREQ=y
 
 # x86 xen specific config options
 CONFIG_XEN_PVH=y
-CONFIG_XEN_SAVE_RESTORE=y
 # CONFIG_XEN_DEBUG_FS is not set
 CONFIG_XEN_MCE_LOG=y
 CONFIG_XEN_ACPI_PROCESSOR=m
diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 98d8a50d2aed..aa4040fd9215 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -8,6 +8,7 @@ config XEN
 	depends on PARAVIRT
 	select PARAVIRT_CLOCK
 	select X86_HV_CALLBACK_VECTOR
+	select HIBERNATE_CALLBACKS
 	depends on X86_64 || (X86_32 && X86_PAE)
 	depends on X86_64 || (X86_GENERIC || MPENTIUM4 || MATOM)
 	depends on X86_LOCAL_APIC && X86_TSC
@@ -64,12 +65,6 @@ config XEN_PVHVM_GUEST
 	help
 	  Support running as a Xen PVHVM guest.
 
-config XEN_SAVE_RESTORE
-	bool
-	depends on XEN
-	select HIBERNATE_CALLBACKS
-	default y
-
 config XEN_DEBUG_FS
 	bool "Enable Xen debug and tuning parameters in debugfs"
 	depends on XEN && DEBUG_FS
-- 
2.50.1


