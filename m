Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34714A20EA9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 17:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878660.1288875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoXU-0007ck-C2; Tue, 28 Jan 2025 16:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878660.1288875; Tue, 28 Jan 2025 16:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcoXU-0007XY-6P; Tue, 28 Jan 2025 16:34:12 +0000
Received: by outflank-mailman (input) for mailman id 878660;
 Tue, 28 Jan 2025 16:34:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C4cq=UU=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tcoXS-00070Z-Rh
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 16:34:10 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b337f96f-dd95-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 17:34:10 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so1272337166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 08:34:10 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6973090d0sm534810966b.18.2025.01.28.08.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 08:34:08 -0800 (PST)
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
X-Inumbo-ID: b337f96f-dd95-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738082049; x=1738686849; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+utsPfRRtrSY+xEHr/3Olh5IQcbAme2skyUQu+gyGyU=;
        b=lUV2gTfZ4av3fC7ESoExMVIt7cXCnz3uh5zaRe7SNudIqD8kZbYbFJDSU533rt/MLv
         9XZ4/8fFTSpvAZAu+MbHUr4AY+Z9+I9MUdKyHkFqQtRS/zCFf+X9zoC+mr8f5JcaFmEG
         G3iMOQCTz0Y5CxuTGa05eznRL7rIwjSf5kVtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738082049; x=1738686849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utsPfRRtrSY+xEHr/3Olh5IQcbAme2skyUQu+gyGyU=;
        b=TmfkB30Y8hwAZaiIamgJ4zPxMYteYCYw77zWaE0VdylaGyBQfSmLByDfsJfLF2x+2E
         wzh2DPIF/8Pmd4H33y2r4Eh9r/7BQdjnWg+IPMy5v40W+3onM9xCkX2OMKcpH3vq055c
         SDqXct+HXxI28e9+L8/Aq5FkFQkCiXK2uN+cNn8FlkwlyEtOnK9PZO4fNRwgMdvk1c5y
         SElNfvfo64Tp/movoR8KdYdl1pc2uc566pP81Hk7HDP1KhL9Ii9v0DU/PGnNv8sjGwvi
         bPJjQrqnNzIgX4x0oS3hFLTEtviszOtPvzklXIkCoCDKYl/kZJ0yU1C+Wflh+Se9l+eT
         XfhQ==
X-Gm-Message-State: AOJu0YzvmpcP2sl8b2E11mgIXDxo9i/WvpNtapjOmEO8YfUOv+KUXqq2
	HH+CkH9sK24udjfX4WI9LFkxHKhrMJF6PuIkDCfqGcyt2dJWvXDn8rqtOzmxRPNqhcRtfE7R/1v
	v4KU=
X-Gm-Gg: ASbGnct2IWZ36H0b6msadiCOTW/97Kt+zpH+2CTijTpbGRPQnOl+g1SWMxFYw7UeIm/
	HScrduon7uG8G3o+kZyiuFUK9qa74l01yus4VbNe/ggtdN0SfMvEIGK3Ke2S7xo7ZuO338ktpDr
	7xHLNPF7g+f084MNqZUHumsK/z6Tojc5uAqH+qWT9IfUTvXKSqYMKGNzn6nuNUnhXikZPc1I+L8
	c3CD4QiW9bi6PZvRMHeZj8skiq6TiZSS+x+xvFlVxzYDJe9LmlrMRL/ZnSg6QBpKTo4fehpPisq
	WmIaDKumTQ8dQPRzEdtarqlMCRNpiF20/CLf5IY5
X-Google-Smtp-Source: AGHT+IGxoRvFXq/AMeIRrnMzVWApvagPN96I0pk458DBuIzbtfqHOiMu1ezo4GIdaBfzCaIuXSTNJQ==
X-Received: by 2002:a17:906:f5a3:b0:ab6:8435:20e7 with SMTP id a640c23a62f3a-ab684352150mr1403056366b.15.1738082049108;
        Tue, 28 Jan 2025 08:34:09 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/3] tools/hvmloader: Skip writing MP tables if any CPU has an APIC ID >= 255
Date: Tue, 28 Jan 2025 16:33:42 +0000
Message-ID: <20250128163342.1491-4-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
References: <20250128163342.1491-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MP Tables have no means of representing APIC IDs wider than 255. At the
moment the effect is wrapping around which would give a corrupted table
with duplicate APIC IDs (some of them possibly the broadcast 255).

Skip writing it altogether. While it would be possible to restrict the
APs shown it's just not worth the work. Any OS that needs such
adjustments should not have been booted with that many vCPUs to begin
with.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
Changes with respect to v7 in the longer topology series:
  * This patch replaces the previous assert in hvmloader/mp_tables.c
---
 tools/firmware/hvmloader/config.h    | 1 +
 tools/firmware/hvmloader/hvmloader.c | 6 +++++-
 tools/firmware/hvmloader/smp.c       | 4 ++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index 6e1da137d779..53be34e48a02 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -49,6 +49,7 @@ extern uint8_t ioapic_version;
 #define IOAPIC_ID           0x01
 
 extern uint32_t *cpu_to_apicid;
+extern uint32_t max_apicid;
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
 
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index 4e330fc1e241..54299e27364d 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -389,7 +389,11 @@ int main(void)
 
     if ( (hvm_info->nr_vcpus > 1) || hvm_info->apic_mode )
     {
-        if ( bios->create_mp_tables )
+        /*
+         * Legacy MP tables hold strictly xAPIC IDs. Skip writing
+         * the tables altogether if we have IDs wider than 8bits.
+         */
+        if ( max_apicid < 0xFF && bios->create_mp_tables )
             bios->create_mp_tables();
         if ( bios->create_pir_tables )
             bios->create_pir_tables();
diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index c61ed524f947..0a01cdc18caa 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -34,6 +34,9 @@ static int ap_callin;
 /** True if x2apic support is exposed to the guest. */
 static bool has_x2apic;
 
+/** Highest entry in `cpu_to_apicid`. */
+uint32_t max_apicid;
+
 /**
  * Lookup table of (x2)APIC IDs.
  *
@@ -61,6 +64,7 @@ static uint32_t read_apic_id(void)
 static void cpu_setup(unsigned int cpu)
 {
     uint32_t apicid = cpu_to_apicid[cpu] = read_apic_id();
+    max_apicid = max(max_apicid, apicid);
 
     printf(" - CPU%u[%u] ... ", cpu, apicid);
     cacheattr_init();
-- 
2.48.1


