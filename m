Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40FBAB508
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133505.1471656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmb-000398-Ee; Tue, 30 Sep 2025 04:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133505.1471656; Tue, 30 Sep 2025 04:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rma-00030P-W1; Tue, 30 Sep 2025 04:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1133505;
 Tue, 30 Sep 2025 04:16:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rkn-0006gD-Lk
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:17 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed3c61b7-9db3-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:14:15 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so3186335f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-41f00aebdb7sm8027318f8f.57.2025.09.29.21.14.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:14 -0700 (PDT)
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
X-Inumbo-ID: ed3c61b7-9db3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205655; x=1759810455; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfNLwv+i5cO84zMF6diWkvUfOapkzoMYrwwz0ZMfYgk=;
        b=V0Vm0dmJHbrJsQLbxiIsULltqLBaccvIHkWjB12avgOrsQGJkVPakuzVTMII9JX/gt
         n3i7LHrK5Ph3ultX9jktHyvq7Itn1oq408vljBmvrqOfxbgcFzTwICZX4fiVkwt9Jtwu
         eyi71NSEZz1Vtpk+91kdaM1SefnnmAWczZyh8hcoSQZwUq7AbdmhXR1XmRqPYU5j5GS4
         8ql/HTkL1nO+Zo2PcaARyrpcEoC1ub0T8bin+Nun32ew8Rofrk6yYTXsjXbeX6hLcefl
         G+v+nh6twl1oMszVWn6FezpoWZ46bAZV0Yp3lhVPGFSNhI87VA8KXdNvy33GBK8g4oZr
         Q9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205655; x=1759810455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfNLwv+i5cO84zMF6diWkvUfOapkzoMYrwwz0ZMfYgk=;
        b=SWOC9HgwKgODXZoIr/fEo3KRBkQ1h9rlGMC/CM84nvt81zH49SnY/GnkEY28tnQhim
         QZInCsgMA6bM0Rrw3RAdEVZzx9pdxReCIvzrpnJm0KZ6+BIKqhuCQ+jEY8AokztdNcd5
         rFMEeKPcpZz8GU9NmYNXGtoNXZMFv0JWvvja1ojHDP1OMpxzb2rRNAIcJzzkfUA9SfBo
         gX/2XkdbUQHC6SI2pxQBxMIn4inr9LD//YZrr7cNdFDuOvVXH2+m/cjvq8y5TWNiZWS5
         UOiDQmtHd6wHcjrM5KDIBpEa4RNYlRSSgw2kZ+73lfa63Dzq8OnYI6xxhqkeGNwpuhO0
         Dcvw==
X-Forwarded-Encrypted: i=1; AJvYcCWes5RD/tCZB0DZG24fUymecXUla09ZxirSCWwG4UThUJv1wDTHvWDoremPfvX8CX2V4gP8v0/uk4w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIKQa7jcnGzAfTMG30+1hSClK5WjGtc+y9goe8NFVqIFUMmrms
	rrSRi21Lb7Qw+lpWWkWIVpjKzZoQUfGPiEWdXNt2UqCOBsrMdRI6lHwfOtEnkNo135w=
X-Gm-Gg: ASbGncu5xj+GpcOqaA0SPjKNpyYLP2HOVgBtI5NH+Ma2ix5oG3uPYKzpiDR0hmyZ/dy
	+KzAtPRomOMFyPzGeBXGvKnVYgs5HsXfmCwSyIe/LxFTdihJSEEeQYC7KfJVznlY6ElLNJyXnQw
	M3MSrQ5nBCtss9IJ69VHeSalgi5sycJ+kkeqQcQSU3T0kE49xI8XGjqgZHjsYAUJeEzU1q/aCbc
	Ag90SOL8ySQJtuffUOMQVP4pzswfe7qKYw6vXzGQzHV27Lrgcmm+au/twyhujnVkXjgU7f29DZG
	ZlH7CrD4PZZoMRYzNzDvkrfstaXlImU8i86ppxxrX6jLCaib5dqYlMXg4CnZHItwqxzBwI6vzk9
	z/jL73OkiCRp1itMiTU5bG5+uxE+E2s8P2kfUMDVJDB2gNLVhc11JfHX//zd5BsWmEAqGzCPa/Q
	/pmcMM3Uv6q81TkOOHUs9F
X-Google-Smtp-Source: AGHT+IHP/zG4X6xn4hUDdclB/D1afSsyjXOgC/ThtRrRCj048iTFTeDxSXkrbhWZePrU5zQ+WKtYTA==
X-Received: by 2002:a05:6000:1848:b0:3eb:8395:e2e0 with SMTP id ffacd0b85a97d-40e4b38923emr16718454f8f.51.1759205654828;
        Mon, 29 Sep 2025 21:14:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jason Herne <jjherne@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	Eric Farman <farman@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 08/17] hw/s390x/sclp: Replace [cpu_physical_memory -> address_space]_r/w()
Date: Tue, 30 Sep 2025 06:13:16 +0200
Message-ID: <20250930041326.6448-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cpu_physical_memory_read() and cpu_physical_memory_write() are
legacy (see commit b7ecba0f6f6), replace by address_space_read()
and address_space_write().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


