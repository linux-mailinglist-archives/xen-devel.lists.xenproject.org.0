Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC446BB3491
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 10:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135472.1472630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex0-0005Is-Mu; Thu, 02 Oct 2025 08:46:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135472.1472630; Thu, 02 Oct 2025 08:46:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4Ex0-0005HP-GQ; Thu, 02 Oct 2025 08:46:10 +0000
Received: by outflank-mailman (input) for mailman id 1135472;
 Thu, 02 Oct 2025 08:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9sj0=4L=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v4Eu6-00006C-K9
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 08:43:10 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1ece652-9f6b-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 10:43:08 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so10957495e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 01:43:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e693c2ea5sm24632555e9.16.2025.10.02.01.43.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Oct 2025 01:43:07 -0700 (PDT)
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
X-Inumbo-ID: d1ece652-9f6b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759394588; x=1759999388; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaFs+E7RwXKG3PK6PiXPvBWe0XSzQsXZvT65+7chMhk=;
        b=GL6H5j6nRlzqEnM9KDsdaKSJDSOxBVoM5KsUeF9gUAJogQg+6CrOXbzmtuQSk2FXwu
         fITtUQqqJqBZsrd5Ntc7wfThXTUv/jM4XfZELInRnxrGdUXROLx8J6O8LO5blVBdIGpw
         vkLRJoNhmwp3WhJ140BXYBGmG2wm/51m6sjfSYDJd9hvts+u5XQdWPniH+hxTCow/nb0
         S4iFaBOPAtjm2Ei8zJitNflF40t8Ih4a9pv+PMbukhCdlqzhJpAgLOPglNdHebqq+dNj
         lJ5zFPwMUlX+MNvrFYEoCSchpiMIHum1WFvgVfZw7vsA3Ba1WkjvSn3WYxK50sh3UA0d
         yP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759394588; x=1759999388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VaFs+E7RwXKG3PK6PiXPvBWe0XSzQsXZvT65+7chMhk=;
        b=XsIW0c14xZrM2la6jeR154zsKOw/tyJ7ENhl9tpGbFhq+MmoDrTHKxfJ8XgKMWw16Z
         0cRNWPXB0+XaVqCLvWB3tGCNjUTKHHppp4hR3sZe2WB7NYs8CfaWjWQiQzqWz+Uel/9o
         fbtHKjY6oDCx2ikXvG1UGI/vd/o9a+GJuQOaqQWdcJo7AhZ4YtLYoilxAgKmAQK5Bs7i
         FebDNWcFymFWTB78yryX6dAIhAi53xE8UTZq5C0Jw7dwrmqq+Knc760D+qTkLqhAybUx
         CVL4L60nYw8WEmOSnf3hQ1md0d2MK2263hnwVH1Vdm8CLQh6yTvI8veLRhVp0pLSJg9G
         d7Og==
X-Forwarded-Encrypted: i=1; AJvYcCUJH0JQW74WR7nda2ai1J5PV2HzY6VGnIlG/NqkonVbxVMlMG0WkFL3BZrVn8ZXLF94vDucvSOfBWk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2Gj/DZ7hXAGtXol3URd5Kcc74oLB4+gMU5HfALryb8ECx0ML1
	jkuYxDrtcuUNloUPuhLH70ePDg8Lazt56KI5wNZHgyO3Ndt0lQkhN8yi1V4/C2DlLxI=
X-Gm-Gg: ASbGncswXibypx51BXvM0CmMd6WWfQbq101ytW+7E6sPWKeS/qdKBGZuhdfdzQrNmji
	yz3FzUyCwJj32Omo6xYfGjEzf5W++Rxnouza2ZHv6XfPIpvfq33HOHKJnH3IKmw849jkKJqhtk/
	bFhR3i7lB4UA1LOYNESc+XvSUKHst+PJB/WUHuIg2xA85P215k1ZcnndmDfr1oAVDURjTP0gmS1
	K2STkruTxVSCmtWHnfPFdurFsVfdz24raaKkYR7HByvRIuSmcwNsuhuQB4BQ1QNgF2gCpl4sXWR
	6E8low7m4x52dl/gm3fo6mNh61NgIosiQN/4Gmrt1HabGhsMACql5nHybjU4TQ9V0DiJJKwCTet
	eMFVK7IkzmqdWF68P8jp3NwqHauyuKs7kyifhdMHbQNdbh/ZVVYxSzPo7gbkHsCLDo+LtVpJV8c
	7hvpnp7aettpN22I3QO+RZ9AYtQPd9MQ==
X-Google-Smtp-Source: AGHT+IH3oBDcFkCrZW4zdMmmdzvura7CGJv+T+de06uu1CRKlNDCaUMsAj1fOdp2bPK62ElNJTRC7Q==
X-Received: by 2002:a05:600c:408a:b0:46d:38c4:1ac9 with SMTP id 5b1f17b1804b1-46e68ba134bmr12450485e9.2.1759394587659;
        Thu, 02 Oct 2025 01:43:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v4 13/17] system/physmem: Un-inline cpu_physical_memory_read/write()
Date: Thu,  2 Oct 2025 10:41:58 +0200
Message-ID: <20251002084203.63899-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002084203.63899-1-philmd@linaro.org>
References: <20251002084203.63899-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to remove cpu_physical_memory_rw() in a pair of commits,
and due to a cyclic dependency between "exec/cpu-common.h" and
"system/memory.h", un-inline cpu_physical_memory_read() and
cpu_physical_memory_write() as a prerequired step.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 29ac80af887..d5d320c8070 100644
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


