Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF8TME1QsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760BF255484
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250388.1547894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a7-0002ZU-4v; Tue, 10 Mar 2026 17:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250388.1547894; Tue, 10 Mar 2026 17:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00a7-0002Wi-1K; Tue, 10 Mar 2026 17:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1250388;
 Tue, 10 Mar 2026 17:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00a5-0001QA-DA
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:17 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de296016-1ca3-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 18:09:15 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4852e9ca034so34282465e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:15 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:14 -0700 (PDT)
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
X-Inumbo-ID: de296016-1ca3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162555; x=1773767355; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F37HFkhRbnNKMwdsdySIIUyxwC6WRGnT9uYuIwl9b5U=;
        b=BQC/eGi62ImYEG6jyp1sk7rfyLMl1c+jlrrDijPte6RZOeiV6ty0CH5C67cGie0P7v
         hcW/eYDNFWtSZBxZBecbt75gRfF6PnQlgJRSGzN7a5leJFNrMvs1GxMZv8+eqIJjY+4w
         ck0H8s5UguQTmw32G49tEJGiaQ6/il7alxiANHrZ+duSh6l8lMLQ5Vq9jMdjm8+9djiI
         Q6kSx6AfgnGQXtQAVV7iWMMxSRJgkgY9PXh9ZFXdtvm4MhzCZqI05SP1M9le+QRJdpk7
         US2iaCdzuVxDEKfLzsMI6+4P7O053U0fV6pHeFflsmRsH/FVUohVsfBLDc+l9suu2/gC
         Cyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162555; x=1773767355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F37HFkhRbnNKMwdsdySIIUyxwC6WRGnT9uYuIwl9b5U=;
        b=L+sCK/pY7zBWrFeULSBsucdxRnZyuBaVLnB9Ic2gzd4RlInBeNKEhAwPqNj3VUQe7A
         r9LM6U/ykaVSqqQwSnqZLCVfoT9P80Sb/91vyR3cCX/CtwCMZXxIcvDC70P1Cfqg8G52
         jDuVR49tPXQK5uri0WFXEm3n2kbiDOt43n+FawI1qCs0tTJrD2oTh9NOXe0t2+CsKasV
         ZR5InQkGwNaeBlkP/NvMPzvLGaYOZu5+OMv+xW6mriL+j4QSO2yAvWkfsuKqvI2qIu/X
         3KHeAfio5IRG8LqGuXBB+dWQOTnAJwAfTdTK0fEdCGkINdHwtJU5i2lit5mgeMYqCqhS
         YbtQ==
X-Gm-Message-State: AOJu0YwRY+qy9MTyF3loIENSdUS5f4vhnvXqvB/iMt5l0vcfGHZ4kNPl
	25oN52dwENnsQyHFoBFRADclJUKCQT3gY1cPSCFV7LJeSqE1DWzUqh7i/qyKcV33
X-Gm-Gg: ATEYQzzY16nUmn1/Lv3Eg/mMC4mzsxYjKB2AW6zijlaBghD36yUR7mLZa2gLxKS7z/J
	P0IF+0mOPj96oSoPMdnkbbUEohf0CE8XNLLXDitk1X5TYozZvfJ1y8pkq2nvAcz7ipY0F0dUxR0
	1PkCdVVc6ZpVDbPZ0P+brQQ4dxtlHeHb4gyhZjF8LV5y9T1gBpLzggMoR+AdZArfCYF5Ap2Tb/8
	Kbp9HQ91aQXJGicoxK5Ciifn4J67T6y3dpYni7QB7dDyVRcD9n0RWg9TAVxIVVCxfaILtGiE4Hw
	qdB/sdZdbKM2na2I3YVLeiDAYv9uqsE+rovg5TXZooFQ95HQUjZg771UKr3xqKxCsaUQNFRvVra
	MlWMOYnshwB4PFGgdvhOAecKre3YNKOzlsetLeh7PEBvSvj3DJQmHoviV+zbFmOSpljN/MToAIe
	cd+6zQCo+JPuu6K8lZPEChenesoMylSeDIIH7qhZEd325mPfdW7jqkbbxCs4NJ/RM7lQ==
X-Received: by 2002:a05:600c:3b83:b0:485:35d3:ce57 with SMTP id 5b1f17b1804b1-48535d3cf0cmr190710405e9.34.1773162554952;
        Tue, 10 Mar 2026 10:09:14 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 05/27] xen/riscv: introduce guest riscv,isa string
Date: Tue, 10 Mar 2026 18:08:38 +0100
Message-ID: <007c0a0243ac7ff1d1ab3faa4ebcdd6fcd14e485.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 760BF255484
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Introduce generation of the riscv,isa string passed to the guest via the
Device Tree riscv,isa property.

The following changes are introduced:

- According to the RISC-V privileged specification, M-mode software controls
  the XLEN value used by S-mode and U-mode. For RV64 harts, the SXL and UXL
  fields of the mstatus register are WARL fields that define the XLEN for
  S-mode and U-mode.

  The XLEN value is provided by M-mode software (OpenSBI in the case of Xen)
  via the riscv,isa DT property. Introduce and initialize an xlen variable
  when parsing the host riscv,isa string in riscv_isa_parse_string().

- Introduce the guest_isa_str variable to store the riscv,isa string
  generated for a guest domain during riscv,isa property parsing. Update
  match_isa_ext() to populate guest_isa_str accordingly.

- Introduce guest_unsupp_bmp and guest_unsupp_exts[] to filter out ISA
  extensions that should not be exposed to guests. For example, FPU-related
  extensions are currently not supported for guests (at the moment) and are
  therefore removed from the guest riscv,isa string.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/cpufeature.c             | 33 +++++++++++++++++++++++++
 xen/arch/riscv/include/asm/cpufeature.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 987d36dc7eee..d7e483603dbe 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -38,6 +38,8 @@ struct riscv_isa_ext_data {
 /* Host ISA bitmap */
 static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
 
+static __ro_after_init unsigned int xlen;
+
 static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
                                          unsigned long *dt_cpuid)
 {
@@ -160,6 +162,19 @@ static const struct riscv_isa_ext_data __initconst required_extensions[] = {
     RISCV_ISA_EXT_DATA(svpbmt),
 };
 
+static const unsigned int __initconst guest_unsupp_exts[] = {
+    RISCV_ISA_EXT_f,
+    RISCV_ISA_EXT_d,
+    RISCV_ISA_EXT_h,
+    RISCV_ISA_EXT_q,
+    RISCV_ISA_EXT_v,
+};
+
+static __ro_after_init DECLARE_BITMAP(guest_unsupp_bmp, RISCV_ISA_EXT_MAX);
+
+#define MAX_GUEST_ISA_STR_LEN 256
+char guest_isa_str[MAX_GUEST_ISA_STR_LEN];
+
 static bool __init is_lowercase_extension_name(const char *str)
 {
     /*
@@ -193,6 +208,15 @@ static void __init match_isa_ext(const char *name, const char *name_end,
              !memcmp(name, ext->name, name_end - name) )
         {
             __set_bit(ext->id, bitmap);
+
+            if ( riscv_isa_extension_available(guest_unsupp_bmp, ext->id) )
+                break;
+
+            if ( ext->id >= RISCV_ISA_EXT_BASE )
+                safe_strcat(guest_isa_str, "_");
+
+            safe_strcat(guest_isa_str, ext->name);
+
             break;
         }
     }
@@ -207,13 +231,17 @@ static int __init riscv_isa_parse_string(const char *isa,
 #if defined(CONFIG_RISCV_32)
     if ( isa[2] != '3' && isa[3] != '2' )
         return -EINVAL;
+    xlen = 32;
 #elif defined(CONFIG_RISCV_64)
     if ( isa[2] != '6' && isa[3] != '4' )
         return -EINVAL;
+    xlen = 64;
 #else
 # error "unsupported RISC-V bitness"
 #endif
 
+    snprintf(guest_isa_str, sizeof(guest_isa_str), "rv%d", xlen);
+
     /*
      * In unpriv. specification (*_20240411) is mentioned the following:
      * (1) A RISC-V ISA is defined as a base integer ISA, which must be
@@ -487,6 +515,11 @@ void __init riscv_fill_hwcap(void)
     bool all_extns_available = true;
     struct trap_info trap;
 
+    for ( i = 0; i < ARRAY_SIZE(guest_unsupp_exts); i++ )
+    {
+        __set_bit(guest_unsupp_exts[i], guest_unsupp_bmp);
+    }
+
     riscv_fill_hwcap_from_isa_string();
 
     if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
index ef02a3e26d2c..aabbbf0c2cc3 100644
--- a/xen/arch/riscv/include/asm/cpufeature.h
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -43,6 +43,8 @@ enum riscv_isa_ext_id {
     RISCV_ISA_EXT_MAX
 };
 
+extern char guest_isa_str[];
+
 void riscv_fill_hwcap(void);
 
 bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
-- 
2.53.0


