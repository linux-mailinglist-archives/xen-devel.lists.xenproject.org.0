Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D9890460
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699038.1091555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsC7-0001AV-5Q; Thu, 28 Mar 2024 16:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699038.1091555; Thu, 28 Mar 2024 16:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsC7-00017v-2a; Thu, 28 Mar 2024 16:01:35 +0000
Received: by outflank-mailman (input) for mailman id 699038;
 Thu, 28 Mar 2024 16:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps7O-0001AK-Oe
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:42 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c50d2a0f-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:56:42 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56c36f8f932so3857578a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:42 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 dr3-20020a170907720300b00a4a38d10801sm896023ejc.35.2024.03.28.08.56.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:41 -0700 (PDT)
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
X-Inumbo-ID: c50d2a0f-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641402; x=1712246202; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muQ9YYs1garpvhloVWRUiLPzA6iwq65Rr1SdS4smlFw=;
        b=RWcLFlwpxKOxRVTv6vZ42+0EO6VG+UqgRYg/Yo3diAdm7VfxfYajPuiS/IWOCVx9n4
         gnavJs7860POBYvxnh+h48KI8/oAOCLgxg0TTSdlKVlF/tBxBic+H4q277gRJo0Ttt/5
         tOlM632xJ5ggf6c3ohagfDn4o+Tz6uZ3eMVSVAkrCe7MVVtXjpsXnLAhTSvcin/6TK36
         5j8Kxl7K+FkF+FIbIShxCzT048BX4Gy2hwDeNN45OHLlzIrcqbsLJMFCXBDx6aj8Bn/O
         09/dy7b9LgaS+poSbdkLS+YB5MZ5M2UmayC4VA04XSbN30OqYG6oC16p7pBeRY7SdwPQ
         UaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641402; x=1712246202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muQ9YYs1garpvhloVWRUiLPzA6iwq65Rr1SdS4smlFw=;
        b=L2Sokzu5ITWusGqpR5j2WJ8y0jLddOsJrDXnyfTaxX1Y36mW/XT4Q7SmPE8+kouH47
         sN4DFGt/JXON5fe28/TcM25sKvhPC5wakW2AKpTF95a4UBSM/CoQR7dsjpYIWrnJElye
         f85StrGViMWCN1LJPykCCRQ0Tp8RKCnrBUffMOMaSNLV4rf2r3dv+lJtNx3GYATuiLOL
         YDowCuRF0kk7gObdsRxo/snFtTgMAahQ7AIyCW+s48kGvdnvTO2Ki57fJ/80cQI6DOqy
         WajyDsF+M67g3tW7+QCs4sgyVJyq8N603hRJ3ZTeF6C2/WlUKZOTNZp5huOK5ONH8rtk
         B/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZMbbauBFZmg6AxeTvF30z3sEOlK8XJESSEucBgYW3cUc/Nc6P/okyFi+ur6FBiirenzkquMWv20idlGjLx1O5jMuvOc8N6Oq/WcHG/Oc=
X-Gm-Message-State: AOJu0Yz8RUc58JbX1bPWWHAhSWMuHzSbAaa+XbVqMjDM/cGRFQOgBt6K
	riwPjbXyyIyDaQTYevkrZOXM6MIVFhceYi411fr8e6ibQwa+Y7E1r8ckVb5tH8o=
X-Google-Smtp-Source: AGHT+IFXbYhPHZn5NXBz7Ikr8yC8QHRf+1TONIhT4Hw3waF5CP4z/i4EhLM/5gQv8lw+8vgiP63smA==
X-Received: by 2002:a17:906:714a:b0:a4e:f91:4694 with SMTP id z10-20020a170906714a00b00a4e0f914694mr2568225ejj.27.1711641401851;
        Thu, 28 Mar 2024 08:56:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 19/29] hw/i386/pc: Pass PcPciMachineState argument to CXL helpers
Date: Thu, 28 Mar 2024 16:54:27 +0100
Message-ID: <20240328155439.58719-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since CXL helpers expect a PCI-based machine, we
can directly pass them a PcPciMachineState argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e36d76656b..d8e91d18b8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -705,14 +705,14 @@ static void pc_get_device_memory_range(PCMachineState *pcms,
     *device_mem_size = size;
 }
 
-static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
+static uint64_t pc_get_cxl_range_start(PcPciMachineState *ppms)
 {
+    PCMachineState *pcms = PC_MACHINE(ppms);
     MachineState *ms = MACHINE(pcms);
     hwaddr cxl_base;
     ram_addr_t size;
 
-    if (has_reserved_memory(pcms) &&
-        (ms->ram_size < ms->maxram_size)) {
+    if ((ms->ram_size < ms->maxram_size)) {
         pc_get_device_memory_range(pcms, &cxl_base, &size);
         cxl_base += size;
     } else {
@@ -722,10 +722,9 @@ static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
     return cxl_base;
 }
 
-static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
+static uint64_t pc_get_cxl_range_end(PcPciMachineState *ppms)
 {
-    PcPciMachineState *ppms = PC_PCI_MACHINE(pcms);
-    uint64_t start = pc_get_cxl_range_start(pcms) + MiB;
+    uint64_t start = pc_get_cxl_range_start(ppms) + MiB;
 
     if (ppms->cxl_devices_state.fixed_windows) {
         GList *it;
@@ -937,7 +936,7 @@ void pc_memory_init(PCMachineState *pcms,
         MemoryRegion *mr = &ppms->cxl_devices_state.host_mr;
         hwaddr cxl_size = MiB;
 
-        cxl_base = pc_get_cxl_range_start(pcms);
+        cxl_base = pc_get_cxl_range_start(ppms);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
         cxl_resv_end = cxl_base + cxl_size;
@@ -1027,7 +1026,7 @@ uint64_t pc_pci_hole64_start(void)
     ram_addr_t size = 0;
 
     if (ppms->cxl_devices_state.is_enabled) {
-        hole64_start = pc_get_cxl_range_end(pcms);
+        hole64_start = pc_get_cxl_range_end(ppms);
     } else if (has_reserved_memory(pcms) && (ms->ram_size < ms->maxram_size)) {
         pc_get_device_memory_range(pcms, &hole64_start, &size);
         if (!pcmc->broken_reserved_end) {
-- 
2.41.0


