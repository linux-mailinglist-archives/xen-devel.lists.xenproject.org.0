Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143BDBAC06D
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133908.1471990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgU-0004It-DT; Tue, 30 Sep 2025 08:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133908.1471990; Tue, 30 Sep 2025 08:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgU-0004FM-7v; Tue, 30 Sep 2025 08:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1133908;
 Tue, 30 Sep 2025 08:26:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3VdG-0007Nn-OR
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:46 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4c5f684-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:22:46 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so444382f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc7e2bf35sm21817486f8f.53.2025.09.30.01.22.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:45 -0700 (PDT)
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
X-Inumbo-ID: a4c5f684-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220565; x=1759825365; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWuKL8TfgkuOIExpLDHpPzfjXl06+qaviUFlhAaNsvY=;
        b=ZfJeGKkHj97EFIMEfRaAn/oip33tclmZINqzMONSMtAxocjkes8yfJMf7vVlRtL3Mw
         oFaZCR6Svt74yNWxtHvLhWbK3sRawOaLBuneJv0Czpi4SZ6JxdvuhiNSA2Qe0tlQJRWc
         dgWQRYDBf/96MJncZzDYumRFnSc4USDlUMPv2NiGD0zq84JlzGLucwxCiW2diXScf/y+
         ObwKV3XkVE1GTjjkfh/h62f7CiaCLgOb1CWSX+6cXMgJrBGE6JZF7HV8+EXCX2Q6VPQ9
         q1yKtp9YLGex3kDtKVyfFin9MqGV5FnJeoU0eWVX3xMz2I3R1a9ZDConwuGfkPRSr4CM
         JJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220565; x=1759825365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWuKL8TfgkuOIExpLDHpPzfjXl06+qaviUFlhAaNsvY=;
        b=b+fOSP+c19MnW8/zpb5CLi7GvGUtDzr1ndIhnw/GskI0XekLaUsdG0D2Il9f/wak+y
         6dax1V7BLvETZACOaLSzOcnfcaYFWMbgDNUoC5PMloCKGI5aLMjCk+NHM197Gzv5+iRT
         rpYOxeSJtJJlXCKRTENKvf5PPEwQcTo/SRHqKRf10AEjZIhTXC9MYcHFSbXLR9y6nOgn
         aYc6Wgqi+TxWPF67KYcVZNc8ovD2kk2zr4oFSg+v3wGkiEJV9mLaGtk8rOQ+xCVY4x60
         kKPmNA+qGogBsZGWdZ22S0SSu1HUaQxu01vqUCxZhDFm7PIScsystxt/xGmvTbA4NuAk
         GP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvMeBvWEo7ZW3QGG2hs2jdqmyWf/zylpBgANey/WNqafuOX06RON6P+cU3BJUzM6aMA6FvJp1kqKc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx90sqH0D8U4VF2cnvkh/MimV4L9/N6oK9tKIJj+o6j7faHf61z
	P+S+rVqiDgotJQ/iduZMjRXif18S8YxfUNPe02ZFd/eXFeG9aNluOIpIC9DKSGdfcT8=
X-Gm-Gg: ASbGnctiB6Rl+VAbz3K8Ww2kPIluIZvBnj/C0GHj9JhEVGZ3Mjg04spRmQ5s1oGNyce
	PY521XtBTnrGefdiUvd9sv0UCQYNV6FBvOsiP6qSXWKWaH49wkdhesQ1ZymIr0VzgJV4qlEsSoB
	jCyS+TSfCDbBrUhaTyNfLAkfudJqlxdFpMhVA+T63MKcPneWNzLYn2VKOA9ooE9NQ/rVzAC9htj
	0Ulu4MzafisV3hxCb9dwKGzVnPz9CNzfVF+I6xQ11Kajrl+LCBYEQPtwqEsCZlAROHlWuX06djR
	4+a8KRLsEIDCFgfsNqzEm4s80vfwmVxxqhEWP+dmJg12OPxmNIZT/GyIEej6mKtXcH5QK5sORKP
	qHIqswSBHGo3Nt6+N82FGpyTIDNuAplU+FvbCERYLfLKPWr1BHRkvBZDwuAATt8lOpzTfpIGsQ3
	us/K3M4QeCbovaTfMGm4Zy
X-Google-Smtp-Source: AGHT+IHE0WytwIozDLwCH/1E/tGTnOI9D8efEv7Y9aQk+zHE6qo+2lNsAzNshhN1K4J4d9d9Usou1Q==
X-Received: by 2002:a05:6000:240c:b0:3dc:1473:18bd with SMTP id ffacd0b85a97d-40e497c348dmr17529188f8f.3.1759220565490;
        Tue, 30 Sep 2025 01:22:45 -0700 (PDT)
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
Subject: [PATCH v3 14/18] system/physmem: Un-inline cpu_physical_memory_read/write()
Date: Tue, 30 Sep 2025 10:21:21 +0200
Message-ID: <20250930082126.28618-15-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to remove cpu_physical_memory_rw() in a pair of commits,
and due to a cyclic dependency between "exec/cpu-common.h" and
"system/memory.h", un-inline cpu_physical_memory_read() and
cpu_physical_memory_write() as a prerequired step.

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
index e0c2962251a..033285fe812 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3189,6 +3189,16 @@ void cpu_physical_memory_rw(hwaddr addr, void *buf,
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


