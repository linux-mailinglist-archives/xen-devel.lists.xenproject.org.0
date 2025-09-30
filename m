Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427C6BAB4FF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133499.1471631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RmY-0002bG-Tj; Tue, 30 Sep 2025 04:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133499.1471631; Tue, 30 Sep 2025 04:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3RmY-0002Y4-NQ; Tue, 30 Sep 2025 04:16:06 +0000
Received: by outflank-mailman (input) for mailman id 1133499;
 Tue, 30 Sep 2025 04:16:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3RlN-0006tq-Mx
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:14:53 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03e2d382-9db4-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:14:53 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso4203838f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:14:53 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-41855fc661esm13064710f8f.45.2025.09.29.21.14.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 21:14:51 -0700 (PDT)
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
X-Inumbo-ID: 03e2d382-9db4-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205693; x=1759810493; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDZrJ5n4JJlGtTIDZGasXxs/GbyDfsVnrlhryX3chWg=;
        b=J6pxTyPCIja4+jlJxWtpeDTXBaD/YcUHXHs+PrKTrT3xLGasL8EKv9EIug8OKlGnsX
         L0NX+vEXqTEvHC6OP2FlyqY+QgzkF6sFgvBd1n5G1ElVQEGpxyFN9nzmkGATCaDJgY9b
         euN2z1y25yekC03eJqdBOHGKhzFX5jgsos703ndW3dCMIIceDyikBZlO05nl2c2Xtv9t
         8AUAy0UCA5bhjSofvznNpJwIhdSHmTTaz5ycNPIXv8h/y2j4JI88GV/mOx5V6bUaRdOd
         JjN6Z9fIBGwANfoyZ78FF0Tp1JwE0t8ZDVIEH4S7roYu3IuEpLyZfIHwTizA4yYYSPQJ
         ED2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205693; x=1759810493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDZrJ5n4JJlGtTIDZGasXxs/GbyDfsVnrlhryX3chWg=;
        b=rZjZ/sQhXEN4nj1/xRMPI3lTew4mj7EeDeQSaxOMCwtgi+bn4LhY6hFrxPA/5aUCk+
         atAwEuLlyXRD8MQEQSWehBG9YsraPMkecbTov8iFolsDtjgUi+Ded+IV+CMa2uKUp9EN
         qVZzViTqC5VdUZNeHBB3C7J2KvuOGpsiZq65FnAVBpxom5I/vf1pehLpiOJnkhYAjXvp
         RT6a6PoIq+/XPqGMkkcewgCRz8zCLpjr+FsADLWlUf4SbEMlHgBtbjCmOSedx2m1l1p6
         RLVoYioTP1ugwyKjc/NWyjwreGwKR8yL0TsPylEHrfLLvmJ+oLcBl3nXTdzCWuUbH8U7
         SVxg==
X-Forwarded-Encrypted: i=1; AJvYcCV+6QxUvfcCi4y4W1CiluedSjNmFuyjYvW+H7JFgY90MJeJyCXgEvaTDAe/1tqDFcRrBbWdvgka8d8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzl64eaDeSaPUuX+2IaaTRzg7w437NGCW9hmtBlbASFdLirVuSF
	+TlXjymvi+dVKTBWo1lsBBRZTAmziJq5EZ4MmuSEZVC5C82GiBKoeFx1fCTb9FJsiPo=
X-Gm-Gg: ASbGnct0DLr1y0JNd45ZEmaj4pmLdgCzSypJhnbsG1nSvj8Q+IwjKa49gowWHLQSDB1
	OoVMIKLleebKVoSNsX5yAnVLwlRRUE3kNBodaqhuhtYDHSFSyURgiE7cIO8WPp2UK4Dtsm38dZK
	Am3wJYrIQ3fBzHfqHRfmVClY1T8gghvkkJMMiRACuG70HrR/qifzD4XMgJ7PGpaFwQdrj3nBQ9j
	glrrRKbE7r5avsKnIFmJW/eozgxmao78+1+f4lMqu9tMs1/9BM2RXnqBT9PpTdvq0h1kk32nSMa
	M5sewNH2lI0S88ulw7Zsf3cVy+O9VwBcuUVvyUskldHSCHJ1/ja65Bi2In9uQ7YPFPWYK2IeQBC
	neauBQTW7eEjgffDTQsX4wfHooshI5z+bWWL/yqxYt9oeS8wOLt2YMn2RPq++gRv4qRo/WBJ01w
	JYwV7d40elvsgNzyY627rk
X-Google-Smtp-Source: AGHT+IGTcuGp6K4U+VzNJFqsWFt5qmyyMICY36EpMMpwA/c/CYvK54pPvXL/H3Oj0HTHDk8uqyOMBA==
X-Received: by 2002:a05:6000:2901:b0:3e7:617f:8458 with SMTP id ffacd0b85a97d-424116eaebcmr2419836f8f.24.1759205692755;
        Mon, 29 Sep 2025 21:14:52 -0700 (PDT)
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
Subject: [PATCH v2 14/17] system/physmem: Un-inline cpu_physical_memory_read/write()
Date: Tue, 30 Sep 2025 06:13:22 +0200
Message-ID: <20250930041326.6448-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930041326.6448-1-philmd@linaro.org>
References: <20250930041326.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Un-inline cpu_physical_memory_read() and cpu_physical_memory_write().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-common.h | 12 ++----------
 system/physmem.c          | 10 ++++++++++
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 6c7d84aacb4..6e8cb530f6e 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -133,16 +133,8 @@ void cpu_address_space_destroy(CPUState *cpu, int asidx);
 
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write);
-static inline void cpu_physical_memory_read(hwaddr addr,
-                                            void *buf, hwaddr len)
-{
-    cpu_physical_memory_rw(addr, buf, len, false);
-}
-static inline void cpu_physical_memory_write(hwaddr addr,
-                                             const void *buf, hwaddr len)
-{
-    cpu_physical_memory_rw(addr, (void *)buf, len, true);
-}
+void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len);
+void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len);
 void *cpu_physical_memory_map(hwaddr addr,
                               hwaddr *plen,
                               bool is_write);
diff --git a/system/physmem.c b/system/physmem.c
index 70b02675b93..6d6bc449376 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3188,6 +3188,16 @@ void cpu_physical_memory_rw(hwaddr addr, void *buf,
                      buf, len, is_write);
 }
 
+void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len)
+{
+    cpu_physical_memory_rw(addr, buf, len, false);
+}
+
+void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len)
+{
+    cpu_physical_memory_rw(addr, (void *)buf, len, true);
+}
+
 /* used for ROM loading : can write in RAM and ROM */
 MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
                                     MemTxAttrs attrs,
-- 
2.51.0


