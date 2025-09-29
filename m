Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B844BAA4EA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:33:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133130.1471333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Igi-0002Vz-UJ; Mon, 29 Sep 2025 18:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133130.1471333; Mon, 29 Sep 2025 18:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Igi-0002Sq-Q5; Mon, 29 Sep 2025 18:33:28 +0000
Received: by outflank-mailman (input) for mailman id 1133130;
 Mon, 29 Sep 2025 18:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Igg-0001U2-F5
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:26 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8bb11f0-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:33:25 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e3cdc1a6aso27634205e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:25 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e59ac769asm2811925e9.4.2025.09.29.11.33.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:23 -0700 (PDT)
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
X-Inumbo-ID: c8bb11f0-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170804; x=1759775604; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjyCCW7HHI1dG8y1m+qgvriOV7CMEgsHNpX6hQdnX2g=;
        b=n2Lr4ocEkBUzchZUMThYeYkfUdbjxEdsy8/JhkIga8BAF0WvSOm1WN/3/E3K7RkAXL
         qm+88qfTxRMSCz1bOyfcfBf9+mZh2AW0yOxcWVA9o3AD3w62UNFUmcy8d6k3e+CVUQm6
         KRSZCdIwidwvTZUw3wXDKTjcHadYbsERN90GC2x7dlKVn/WHUDYV0FWQEbimx4w6TD6w
         eDEbxpcRd2XOkPOwsxqgnLYoihyE64tXpIYg7zjnpf+X7xd2iiwf4BMbxzRul9ogglYX
         fCelFeKvbj2WiuqjsqUmQ6UCHXkX96L3T27nktQDbNm/7Pg10Bid3OTm7A8IVM+udb6c
         5rzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170804; x=1759775604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjyCCW7HHI1dG8y1m+qgvriOV7CMEgsHNpX6hQdnX2g=;
        b=RfCzbWt9lyeQMNvp5Aq2BbbAnE5EieG0Cmu/P6nRrfpui6nnz2w6H2Zo5MStk6YSSl
         nFA/lpIvv+yCPnwCvtnyR0sOYQbZLE3flCUH3taj4jiFxT4jysfHNRzfj+F0EjgeqVHT
         wPUZg9HwVuSkovc4PAv6xfHdxDs14Lh18kh6eNByHFk2Y9C+094KaIeBVp/lCZg4vQfv
         BpHkhhJ9XIYFJue82mhoHH202UbYOOWb08bxtWaGFVvcSacEgKTrkKx40HCEELzFMvY5
         RjEC1w+R+eRdHkHzeKBT/5LaJoiV8ootTd9vfa0/gW5iNhuxwaxpLRlRPNiYb3378b7T
         dTXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLBYaxtz22fRI+u/Xl9Xc2LmkXHYJze9zdRSTJpNqugwNK4gVPo3umCMFCddcf2TYyTYZYtT+54l8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcQw45Jw6wcGVGBw1rQIFFMBrs2JlhWTy7H0NTMltXRv8JiCUA
	MrNH4DiSlmNUQL6hSZkXreGp0c8PZt+FA+5a7myxidoadyIEFprCWHufhntYBKm8yO8=
X-Gm-Gg: ASbGncu5gD6OfdH8lfQ9RZGiKoTCvEXlyQnT+KVfDQ77oJCdSCrn3fizNg3/9YgWRJn
	on1V7LHQyRq+rb7R9DCKAL8iv4lITcEMmuRy1XEFrbzdyidMBAkL4UL8sUFD9IAwzrIxPelvTga
	WFXdtITVOkHICOzihQNT6UYP2aonTeyQ8P4F1G3loPx5BG7nht9reS3zbjtpVExxv1y2t/hzaw1
	swPXOkx8HerWiaWEd5kmiGKQ8BuK1oLI20sykNhsL4x1zR2d731T+Zo8XDf1SQ+37CO8E/Ha3Te
	IW/GacUBAd2dDQf0rTm9CTirYrVZtA6zPFQiT32ZlrULlawr5rU7OO7knWGtUQpiGYP+mwCVo1I
	aikEcgy8ghe0sl0wo5pXVvYtEAUdMPOLVXg6PqD07nRtTSALjCV/hnTKEt9kUCjHcgFS0JAc7
X-Google-Smtp-Source: AGHT+IHQ2XCQX3HS0p3adUQdcJQXlpyRbo0k/r6XrZhzUXT4d+zZkT16mDlxSIQ19wUJoBTgikwi5g==
X-Received: by 2002:a05:600c:c10b:b0:46e:33ed:bca4 with SMTP id 5b1f17b1804b1-46e58cea408mr12664365e9.15.1759170804364;
        Mon, 29 Sep 2025 11:33:24 -0700 (PDT)
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
Subject: [PATCH 05/15] system/physmem: Remove cpu_physical_memory_is_io()
Date: Mon, 29 Sep 2025 20:32:44 +0200
Message-ID: <20250929183254.85478-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no more uses of the legacy cpu_physical_memory_is_io()
method. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-common.h | 2 --
 system/physmem.c          | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index e413d8b3079..a73463a7038 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -149,8 +149,6 @@ void *cpu_physical_memory_map(hwaddr addr,
 void cpu_physical_memory_unmap(void *buffer, hwaddr len,
                                bool is_write, hwaddr access_len);
 
-bool cpu_physical_memory_is_io(hwaddr phys_addr);
-
 /* Coalesced MMIO regions are areas where write operations can be reordered.
  * This usually implies that write operations are side-effect free.  This allows
  * batching which can make a major impact on performance when using
diff --git a/system/physmem.c b/system/physmem.c
index 18b3d38dc0c..fd2331c8d01 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -3763,11 +3763,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
     return 0;
 }
 
-bool cpu_physical_memory_is_io(hwaddr phys_addr)
-{
-    return address_space_memory_is_io(&address_space_memory, phys_addr, 1);
-}
-
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
 {
     RAMBlock *block;
-- 
2.51.0


