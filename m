Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F41AD37FD
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010783.1388991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyff-0004zO-CM; Tue, 10 Jun 2025 13:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010783.1388991; Tue, 10 Jun 2025 13:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyff-0004xp-93; Tue, 10 Jun 2025 13:05:43 +0000
Received: by outflank-mailman (input) for mailman id 1010783;
 Tue, 10 Jun 2025 13:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfe-0004iH-3H
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c9454f3-45fb-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 15:05:41 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad891bb0957so885512666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:41 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:39 -0700 (PDT)
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
X-Inumbo-ID: 9c9454f3-45fb-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560741; x=1750165541; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQZA1jhqfJhA3+R1Io64wtcp1umLfxpBKyDauABhC/w=;
        b=hqsK6wcf3uNnk+qcB8JhRNx37mrZrDxuAx8GEne1YIIhAC4WM9DovmlBiMiKHqkbSY
         CyRIjXHrnwzbIMhahCaFVQiBIXem1v7xwplLRQthOk7saho/8kKC5B6q8yo7koJxXhxl
         wbhmY/0GLJUpklk0eDlUD008py5TF9AI0YinoH/n81PKP/iFn5PRByjbPAcvQ4CK92Es
         KSGAkGzwd8NOAs0tQqzmzCkZOPYahgxaj7/XSJDySgBQCiysWlcrCr7dGWiWEIG12+E3
         9mSFD+h/zFZTm2eBlOyRQUiwprPAqD+E7RA8nUXQ7HqYnv/W4vUAP1i+yV3R+5fxS/oy
         Ph7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560741; x=1750165541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQZA1jhqfJhA3+R1Io64wtcp1umLfxpBKyDauABhC/w=;
        b=hHV0qSGhhD6T34IfYvLgxqxNrrZO901JriMNg7ZRULD33B60EtDJbRxeTqBkaVrudx
         IIiSID/bF7ENoM2xQifBqPoZ7VRFa+WtJ2qqfGLCu+68YY0WoVlNpkyrCflSolqhAkfd
         QOX+p37ZUXFjuo063ptVBEYH/ZzMBAGh5H6qxsLj7ab75yK/H/jqimDCW5PkHkfBWbIC
         yDSNS6A4BlxhLW7EbzZhlA1Iin1Pn18Y0tjSq6uPZJ21PzP0Cmi85C5BMR9T2aSsajkf
         WqOhMEhTxZ3xFkJpbYj0EI5+6iQkosGa3TYuIvFMph1MqV3YCS7Pdg+B5e/Q/SxOm7bI
         OPZA==
X-Gm-Message-State: AOJu0Yzz+mrz9ukwOtJozRu6BMQj3xBuMm2uUmv+4JutnItgrz/pDdTq
	ug7Ri9vMNoplovv90Trnh26my53fKT7JIF49JBqAVAdViL1Kby00+I1nMz8g/A==
X-Gm-Gg: ASbGncs/+XaH6nbxMqYRPqbxzQFys0owwA+SgtSqZKthbErOV/C4D8ybKs1JT8LEHdH
	tJ8sqEHLlW6fN/Uiv5IAFVdeTDbyRPzyZmoqQGp+lf0QnHAAiRBMyLdkd/604uLnFx0CsI18f29
	+SS4mTmNaRNTuIcu58Ar/jCO4rHGj9SKCFClXvAx57tQfGC/WFe6BO6+gsQChQkH9gJyptrbtsC
	i/vrRAeePIUUv05VylNu/EiKDC/LlJdK8mAtqxo2Fwz6cXxB/hXAeYZ4bcLHcDVBAaPNS6GjfIW
	cKhvcxpq4zMgercV97/Z9SWP44AGG+zUFS5Qsv2A+4DAebzjJ3+7BA4t31ZWZ0AL72//D4Y5MA/
	P5SKrGn0dup4OsPs+vGtu4z2lPw3D
X-Google-Smtp-Source: AGHT+IHhI45EB7m1z/pBXSWPkP26t50qUS1diC2USA5GzGIHtA5mdJJ3bH2fCeA/V2zkhHzk3RL+tg==
X-Received: by 2002:a17:907:d24:b0:ad8:9a3b:b274 with SMTP id a640c23a62f3a-ade7ad31b03mr241390966b.52.1749560740226;
        Tue, 10 Jun 2025 06:05:40 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 01/17] xen/riscv: implement sbi_remote_hfence_gvma()
Date: Tue, 10 Jun 2025 15:05:16 +0200
Message-ID: <ea7a15c0ecfd2bae95c11a92e4c0cb71b155140f.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
covering the range of guest physical addresses between start_addr and
start_addr + size for all the guests.

The remote fence operation applies to the entire address space if either:
 - start_addr and size are both 0, or
 - size is equal to 2^XLEN-1.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - New patch.
---
 xen/arch/riscv/include/asm/sbi.h | 21 +++++++++++++++++++++
 xen/arch/riscv/sbi.c             |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
index 527d773277..8e346347af 100644
--- a/xen/arch/riscv/include/asm/sbi.h
+++ b/xen/arch/riscv/include/asm/sbi.h
@@ -89,6 +89,27 @@ bool sbi_has_rfence(void);
 int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                           size_t size);
 
+/*
+ * Instructs the remote harts to execute one or more HFENCE.GVMA
+ * instructions, covering the range of guest physical addresses
+ * between start_addr and start_addr + size for all the guests.
+ * This function call is only valid for harts implementing
+ * hypervisor extension.
+ *
+ * Returns 0 if IPI was sent to all the targeted harts successfully
+ * or negative value if start_addr or size is not valid.
+ *
+ * The remote fence operation applies to the entire address space if either:
+ *  - start_addr and size are both 0, or
+ *  - size is equal to 2^XLEN-1.
+ *
+ * @cpu_mask a cpu mask containing all the target CPUs (in Xen space).
+ * @param start virtual address start
+ * @param size virtual address range size
+ */
+int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
+                           size_t size);
+
 /*
  * Initialize SBI library
  *
diff --git a/xen/arch/riscv/sbi.c b/xen/arch/riscv/sbi.c
index 4209520389..0613ad1cb0 100644
--- a/xen/arch/riscv/sbi.c
+++ b/xen/arch/riscv/sbi.c
@@ -258,6 +258,15 @@ int sbi_remote_sfence_vma(const cpumask_t *cpu_mask, vaddr_t start,
                       cpu_mask, start, size, 0, 0);
 }
 
+int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
+                           size_t size)
+{
+    ASSERT(sbi_rfence);
+
+    return sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
+                      cpu_mask, start, size, 0, 0);
+}
+
 /* This function must always succeed. */
 #define sbi_get_spec_version()  \
     sbi_ext_base_func(SBI_EXT_BASE_GET_SPEC_VERSION)
-- 
2.49.0


