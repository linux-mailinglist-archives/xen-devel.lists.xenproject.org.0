Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DAEBAB51D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133524.1471719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rml-0005Li-Gh; Tue, 30 Sep 2025 04:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133524.1471719; Tue, 30 Sep 2025 04:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmk-0005Ef-UI; Tue, 30 Sep 2025 04:16:18 +0000
Received: by outflank-mailman (input) for mailman id 1133524;
 Tue, 30 Sep 2025 04:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3RlC-0006tq-FG
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:42 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd2839b9-9db3-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:14:42 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e30ef74b0so37706015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:42 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e4ab0bf62sm98607665e9.9.2025.09.29.21.14.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:40 -0700 (PDT)
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
X-Inumbo-ID: fd2839b9-9db3-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205681; x=1759810481; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtU1C0M8U0OTbHcI2E95ZD2Zrsmz5/OESKETD6NudSM=;
        b=RoKdLh6ipvmHaQwd4kHXnJHj2+nO4HEKbbbM911eR6EDlVh+5b/0U3MNy2AHcHE9j8
         y3FgXKvGSS28bL7lybM0dTsKJgqs7oJrNtb3BXW46aQjYho6sZOpKFIxAS89O10av6Fa
         xtGYHk3c23IITr94wESZHN8v1e9sxiUKAhGktUHtqGZQAfKeiPmLBmgloIIphSvhUexl
         HUxSk1LM9NUo3c5qKhQYFeZl/BOQF44qdZwJsyP2ces4J9+NjuftDZ4K7Io7OJnsrteS
         0MW5+phjmfB1ouDmT1TllD2msTq0X+BdtazLBeyBeEW8O3SktBTBsXS4GsJZC4gP4XmL
         XzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205681; x=1759810481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtU1C0M8U0OTbHcI2E95ZD2Zrsmz5/OESKETD6NudSM=;
        b=FV26vjIi4j8fUS8eMWnEE6RW2x9d0Hvh5nWhc6CvzykMr8aJ9F2BCikiETjuNqPWVC
         ujhV8Q1XpP9G4rYSaM/z84fdAUM/IUTo2HMKHUDB8SQJvlYu9ilZj4pGyijM8N7pI75l
         SrPcgTAV6V4/1WITdbQlD1PwObTM2TufjayR8xA5OWnvuhBvLGFe05E9nhsxVWz1bEyj
         /jRGtrMsIud9yZWwOIPgsyTcHjbRI1UG8do2wMxkb14D2uC0N+MNoQkuTfOw+stgMvxE
         fl9s89ZeATrsj825fLm2cXV/kxFUaPhqZIxQ8Vy47XNCuYZU1oAjId6DdgMR77PAaiyQ
         Cv1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBH+9dkElga6eKuQKG12glYs0I5eqG8PTdlT7wMBsP2Gf1BLXhwxjWtriuCT4jc4mbeCa1DjasO3A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+Nh2rPdXRArWRlPyfK+Irvc+qlyg1JYON9o9rFMSs+T3Iw54q
	EFmWCezA6KWLr2HXxTu3BOkos+3MlAU3/YA4A8Pwf1/0HOrnt5jHWrEqeZErp4IIuq4=
X-Gm-Gg: ASbGnctQBT1vwIRek5RYCHqxN7/1txaJ6WYNfd+Rw+3gsurKc+SpdxcDwMmYDOsTvjN
	ydWbC7F7+Yh/kJhUpku+gxqDZ9VVhSkSgnl0hwNp6meoLxkTPw7Mb2BopjfzAIGRIYVnLZWaxrv
	LbLWBB6EzHn5YHW1KUuTWOAxaQdRr975NzU0JDXNFbrisS5sOan8GouTEPLUbpB0/JJkuPNwy8S
	HwkXlS3qKYf/YkBy24ekE+ZvDz85CWDjU6yCzZDTIuNv6cMamsniTTrpAqHuO9QWBp3FE8ZMU3C
	dLzWpKaSBYp5P2jhMJpgDyRnj82xekilp+NfHYxsc4JizXLWxFsazqccZqweUB1aGIFgmDNJ0m/
	R3efAfWhFfB9EyfBRMG5s/Z4vEX2aDdmLBpykuvkUkdPnAYyrVU5U/ZPSGWr83YBYBOMpb9zDFl
	mvMRtMexaY3ncJbrN5I++O
X-Google-Smtp-Source: AGHT+IGUG79kearmVn7+9qugGuIF+Iaatq5RHrgppUdDi9qlZIXdMZGH9YdXisC+M3CCPhGM+TJyoQ==
X-Received: by 2002:a05:600c:a00c:b0:46e:41b0:f0cb with SMTP id 5b1f17b1804b1-46e41b0f464mr152474875e9.25.1759205681405;
        Mon, 29 Sep 2025 21:14:41 -0700 (PDT)
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
Subject: [PATCH v2 12/17] target/i386/nvmm: Inline cpu_physical_memory_rw() in nvmm_mem_callback
Date: Tue, 30 Sep 2025 06:13:20 +0200
Message-ID: <20250930041326.6448-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index ed424251673..2e442baf4b7 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -15,6 +15,7 @@
 #include "accel/accel-ops.h"
 #include "system/nvmm.h"
 #include "system/cpus.h"
+#include "system/memory.h"
 #include "system/runstate.h"
 #include "qemu/main-loop.h"
 #include "qemu/error-report.h"
@@ -516,7 +517,9 @@ nvmm_io_callback(struct nvmm_io *io)
 static void
 nvmm_mem_callback(struct nvmm_mem *mem)
 {
-    cpu_physical_memory_rw(mem->gpa, mem->data, mem->size, mem->write);
+    /* TODO: Get CPUState via mem->vcpu? */
+    address_space_rw(&address_space_memory, mem->gpa, MEMTXATTRS_UNSPECIFIED,
+                     mem->data, mem->size, mem->write);
 
     /* Needed, otherwise infinite loop. */
     current_cpu->vcpu_dirty = false;
-- 
2.51.0


