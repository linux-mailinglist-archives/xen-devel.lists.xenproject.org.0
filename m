Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B7BAC07B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133949.1472059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vgh-0006sB-Mv; Tue, 30 Sep 2025 08:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133949.1472059; Tue, 30 Sep 2025 08:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Vgh-0006md-7t; Tue, 30 Sep 2025 08:26:19 +0000
Received: by outflank-mailman (input) for mailman id 1133949;
 Tue, 30 Sep 2025 08:26:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Vcp-0007Nm-41
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:19 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9155b3cd-9dd6-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 10:22:13 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e42deffa8so47193365e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:13 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5c4dd9e4sm7814745e9.10.2025.09.30.01.22.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:12 -0700 (PDT)
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
X-Inumbo-ID: 9155b3cd-9dd6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220533; x=1759825333; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QFdShgwZbpOIuoiHkRuMdwMlUbV145lKXZsf/3KvUE=;
        b=NwL/kfbewah3Lc3tgY1eciku0lX97KGreL8vii1VmWd+3/wr5tbA3vMa3MEEMnaS85
         e0WubKOQd+WLTQJo4FiXgfXrCVMxF8k/H6watxUHGs1hlkvlP0DDDtJfZx0KnNxDgry+
         bB36RWaPNhddA3B/wsmQa24/ZYUgIDBFI9xDMqmCZormiM+N6yXoxbjmvZUoHOdhk7tB
         h5O27zG4WV9zvTYScm/e039cR8mkAbGbdhRxbDBANH8pmBkqPW3MWi1jDFer4b9QbJER
         wNpkVr08A9qGS2npRTMxRT7r/KrUeFvhMJxIiCsM5ojw8xU8IPpoLxv49jSvXOIsMvn3
         yYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220533; x=1759825333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QFdShgwZbpOIuoiHkRuMdwMlUbV145lKXZsf/3KvUE=;
        b=GHXYC6gUFzT7epSqBppbosRcIVcrln4y2mULVqo+32e7FGe23ufOBfnBlgSEPA9tIH
         8wCydvawdmS59kZQURyQ1yrvUTZsLVC51Z7Wxn8cpt6fU6Qh1Qk4AIMPX1f7ffHHXPBk
         2L7aUwDKA3c3neQdbp523MLvvii60QX+8pavRiSNgqO5bgDa4anh3jvGfWfqbZ+FumES
         BKwgNmze56orL++tCGdEEt0Q9v881dScL6InIY/RUCbJK2sOfB+Vt2uDghD+5RKeS2Ld
         EgK2ELpRBM9MF91yaI0maDOCuVAVFVQSeCLskKAgU5TyKeJ4Rth/v871pI6/XI/mUZ5M
         dFrw==
X-Forwarded-Encrypted: i=1; AJvYcCVyXmjfdCCCRFSAn6hE03WBOZ+sAZU5rHi0iIPbChKovpTKyfthzHkF9Q42EL2LM8eU4B/zdfWuntY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgUHDumzU5jVTAJmXOiPR48b8U+HA4r2I1SEIORDlHiCviqhkt
	M/xs4HqNWWygNjQ5ZFX7G8IhwLQC5yaiEsatbf82OaTJMZdT0BhNN7mQYqW//z4RF1Y=
X-Gm-Gg: ASbGncvP8fM8ssERGyOpLQ/mZZEDVq6ZogpV5Q5O3r3b9RHcllAvzeTMMrXyKMWMJhr
	WfEhMEFqZUPeAHBkN7pgGH9odzTSsizA6qkfjTQFVRaXs8/pHCX5LzYfvQS0zezJXwWRTbVk8RM
	6JHAqdf1pF8g9LhMIipDYL6scFrQLp5qXQJd8TE7RsgG70pAFcFeadpCnlWyY8IrIt7OnW6emp7
	Z/878Hiydra80Du+kW9X0OrjDmf9cfnS5SodAoZAc0pximqBIy2IByL3gGfJlcoi7oOobEFCgic
	X7B/3XrfzYACTQZJYy+j8yIydPuQaSNZpSn8eTQ/KzV7REKdHCfbm5wXe/P8X78t1alNqpTSXsK
	RxEbH3xFadtf45o+96DbEWEOAm6CiNFSc992GLpXGntF5wjVzzBGWdB0A1URXC7B/h7HE4MLgGV
	gpvndQeBjDTLi25Le1UwiinNJFlAr7tRCPvDcORFWlFw==
X-Google-Smtp-Source: AGHT+IGBMYpWSXfOX3el6uig3+R7ujcKxPeYiLaNhqcFnuUIbzB/w07fZP+NVrmJYAyBxxupmR40fA==
X-Received: by 2002:a05:600c:1d14:b0:46e:432f:32ab with SMTP id 5b1f17b1804b1-46e432f395cmr126597005e9.33.1759220532938;
        Tue, 30 Sep 2025 01:22:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eric Farman <farman@linux.ibm.com>
Subject: [PATCH v3 08/18] hw/s390x/sclp: Replace [cpu_physical_memory -> address_space]_r/w()
Date: Tue, 30 Sep 2025 10:21:15 +0200
Message-ID: <20250930082126.28618-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_physical_memory_read() and cpu_physical_memory_write() are
legacy (see commit b7ecba0f6f6), replace by address_space_read()
and address_space_write().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/sclp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index f507b36cd91..152c773d1b4 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -319,7 +319,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
     }
 
     /* the header contains the actual length of the sccb */
-    cpu_physical_memory_read(sccb, &header, sizeof(SCCBHeader));
+    address_space_read(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                       &header, sizeof(SCCBHeader));
 
     /* Valid sccb sizes */
     if (be16_to_cpu(header.length) < sizeof(SCCBHeader)) {
@@ -332,7 +333,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
      * the host has checked the values
      */
     work_sccb = g_malloc0(be16_to_cpu(header.length));
-    cpu_physical_memory_read(sccb, work_sccb, be16_to_cpu(header.length));
+    address_space_read(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                       work_sccb, be16_to_cpu(header.length));
 
     if (!sclp_command_code_valid(code)) {
         work_sccb->h.response_code = cpu_to_be16(SCLP_RC_INVALID_SCLP_COMMAND);
@@ -346,8 +348,8 @@ int sclp_service_call(S390CPU *cpu, uint64_t sccb, uint32_t code)
 
     sclp_c->execute(sclp, work_sccb, code);
 out_write:
-    cpu_physical_memory_write(sccb, work_sccb,
-                              be16_to_cpu(work_sccb->h.length));
+    address_space_write(as, sccb, MEMTXATTRS_UNSPECIFIED,
+                        work_sccb, be16_to_cpu(header.length));
 
     sclp_c->service_interrupt(sclp, sccb);
 
-- 
2.51.0


