Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A6DBAA578
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133202.1471413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjQ-0006lx-Hj; Mon, 29 Sep 2025 18:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133202.1471413; Mon, 29 Sep 2025 18:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjQ-0006jK-B1; Mon, 29 Sep 2025 18:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1133202;
 Mon, 29 Sep 2025 18:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3IhK-0000iD-0W
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:34:06 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df8a541f-9d62-11f0-9809-7dc792cee155;
 Mon, 29 Sep 2025 20:34:03 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so50766285e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:34:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e46de67e1sm103906645e9.6.2025.09.29.11.34.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:34:02 -0700 (PDT)
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
X-Inumbo-ID: df8a541f-9d62-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170843; x=1759775643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuYVzxDYsV8q8g9d3IDIaYEYUyrQfEG5rj8P4oQ0OGY=;
        b=A76Kp6l0IsB4Z8L+4DQh8WUL3f8eI4biLcjqDiHIpTu39xNSfouWCVLq8JKHvozjaQ
         /tkqas50rbx43U/UJNgEMkZ6URBLO88lI3AMK6xd14SphocnE8bLOGd7ir0zxtnxTykv
         zaq8OwSHzWikMOif+IK5xo0EsDmn6HuHuv5ejb/ueH8X8jJ2x1ZQ10mjHa+SsKm9frH1
         T04grTuEyglJ53/qC3MfhBZHo8CJsutBvw+qZvHv1zskOxtyyAfll66RNuoN1//MQw7r
         w1Hd0611WI5FzQtTrOBiQHQz573Ti/IYmkADF80nCxOyjtTqFtb9q7xRYcp5lvQSWBZh
         FSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170843; x=1759775643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuYVzxDYsV8q8g9d3IDIaYEYUyrQfEG5rj8P4oQ0OGY=;
        b=O0B76h4XRGqSbhzWbM5c/HAYSs119r6aZWMT7fjTEWn8E21T28aeBbGUSqISg+jUUq
         aksy5E2oJbxabS3XngD3pOf+AnC8tnccgf7b7v/xnNVOilG6ZUaG9WTDOfTDXfhcwwBw
         t8JHDMFNVGppp9Fe17ZDtx1mB0xKW3G0uRfOI+24Qk58g3s2rN7AZ2kHOJxv/mBGMUui
         kZdkldriWZDjeM9Hvs70OZJAMj7yTe2HvOCXSXqjYuEht8iSd/kqRga3FpNcY+DGfnjU
         5TrV8A7jSd5P5rz0doD8IBo07UGrQ9rNcSCQhurbLJzTOAmPb2nxzNeRcK6wBHTm4lPi
         aLXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe3i8gHOAitrtAEw9ph8MWamSoIseAjQMkcuak1qrHhlFI5uNguvvM8C2u4xK/ujh1D3Y0jaIlmtI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywjzg3daSNqsgKf1nwmusbRDBuCUxcKH+VGna7r2t0EbCgOE0su
	VbsZ3079Vn7uYfoO1W2q6SlE2xLSx2yy3DBbA0jM63gAem46oaZ47mr+8Zy3gc0/E1A=
X-Gm-Gg: ASbGncsn3g02bK7JEbOOsa8UhPPTvppxYVlnCrT06I+2sd4UjgeiDPipOgpDoUTbOH+
	xctanpi/bcKYp/8X00QXlE30LSbMPTBYsPn/DnMZxf4UBPuibC8pBx0B8CgDxEGAF1Ydupw963R
	jdG5kaSTe6BOY7jVPO59DStavKGvugXmGSAcyAuXwo1HKAX367FJjomzxfLhh78nit2BnYeJrE4
	waNu1CQAgsEAv3Kpk/7vruIrir9prBsyPadhYNqaNBjo0i83I9kXpW+QVckkV/tJeMVwB8PqpL7
	cDAYIDp5++58r1aow0qbZBaClmj3EE42AViTC5q+zboZVeoK3B2d0Rz9Ax1Av8XnPd/Owg1j2hf
	1ru/P7GOXRjXD6YvZEkKIm1sNM28zctuP8ihkYggDlM/zOi5npJNo7J49oJySF0plx9/nf2SvAi
	Y/j17OXHDFerpvi9hE4w==
X-Google-Smtp-Source: AGHT+IHxkSBKZz9UIKJGJ2MuyS+JOGfRYnVKVs7Y+XK907wXLr+RITSG6kYiNQobFw2cPjU7tACI6g==
X-Received: by 2002:a05:600c:a47:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-46e32a32b56mr143974255e9.34.1759170842607;
        Mon, 29 Sep 2025 11:34:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	Eric Farman <farman@linux.ibm.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	qemu-s390x@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 12/15] system/physmem: Un-inline cpu_physical_memory_read/write()
Date: Mon, 29 Sep 2025 20:32:51 +0200
Message-ID: <20250929183254.85478-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
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
index dc458cedc3f..5a0ee3b8e58 100644
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


