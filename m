Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D7DACAD2E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 13:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003215.1382708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3Fs-00037I-NM; Mon, 02 Jun 2025 11:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003215.1382708; Mon, 02 Jun 2025 11:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3Fs-000357-KX; Mon, 02 Jun 2025 11:23:00 +0000
Received: by outflank-mailman (input) for mailman id 1003215;
 Mon, 02 Jun 2025 11:22:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QKOU=YR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uM3Fq-000351-Ou
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 11:22:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eea5c81a-3fa3-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 13:22:56 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-450df5d7b9fso14049365e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 04:22:56 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009fd9bsm14337323f8f.82.2025.06.02.04.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 04:22:55 -0700 (PDT)
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
X-Inumbo-ID: eea5c81a-3fa3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748863376; x=1749468176; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpdHezQyE2ZIbO+VDv3N/uXlwAOtaGdLVWN250tzBuo=;
        b=cezhu61R8DK4In5e5p35UHdHaED8gFOrphq1XSf8/euYTSPzmqF/ArCMfwls6O8Cw3
         8S/Q/ES0OYTuyhTgkWjT1mbDbJparYB1t+CqETJJGHxdJCFy0McNQYPqBAzyWdyHI3A6
         asbqKy56aAb4PXCIvrJloQ2fGkKmcOL/exP00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748863376; x=1749468176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpdHezQyE2ZIbO+VDv3N/uXlwAOtaGdLVWN250tzBuo=;
        b=Xpd3068fSbe0Et/KXSUQ0xxKqxgmLbW+7gUwPcyxlKDgPmfIgiQKPIvLvMxJjnNFTe
         7Goi4kKrpm/xBqGj4LKp8vvoiwWsiyzL7WXwTuL/apNRF31FKyHiZVjrJF33pFI1lFvn
         mhMcUS+3f6uWxK+9I34PZ3sj1bzc3/iqEh3rUeOY/662/AkkvPaYBr5tI0ZIhUBcwNMY
         IDr7NaAG1+xp7ckmC7m3Ia+ukaj2CsaFXW20NCiGVXKvQABMDk8wNt3tywkCXuj5TXk7
         5M7kODw1R+1OE9OFO7kAZEiCinhfApIxKUDVktq8flLCCgyQylEut/xu2MT55q25GZ04
         129w==
X-Gm-Message-State: AOJu0YzSXjNsofmqWh/IvZm0LwaaatSxaqup9CBMWICWLSYWK5ZkJHp5
	J0k15fKWPJsjCiXN4Qki9bOqjqNfcUZcshg6dx8ft6i/NQwe9r/E2hFzSN0PonMUy72VcXGnJpF
	8AEGN
X-Gm-Gg: ASbGncu7kwB/T9DiItu1yBvUkmkco0DP9H4jS8OFB6rY+PfqKU9PS3HCGndG2rXSTEE
	qIbgTMmGVT2+OU1fD4qqa/JVi8sP6a9Q2pvv0lKHlVhrPOmxo+dVdZaW7+2jGoMtXiaqNudevwI
	K2HiUriSjXeZXBk/7J2vCtNs0Tv5t/Ey9/Ouj2TW7dsbhhr9JUtFKHXyuTvhRJkqIO09nX+VMXT
	i0voyeT5+48jhAL7ylr51troNGXb1Kjy1Zv+MUXTXudL8zGpPcdowl3RDjVpv5RU9gNNm8PSfB0
	rqCnKwbpry61pKknfNNiPO78RCrTAo4kqstXN18kHNJrsj7fFgryLqJwlsZhN/iLRyIZX2sNTaw
	sfkd4HnS+Z2e8m+0OjKB8+8lX
X-Google-Smtp-Source: AGHT+IF3dstQd6ejemmU3LxccASUB4+LyXvQHeSiQLueIELdt4Eej5WFOl8EB9cX6Bn4F1GdI6MBwQ==
X-Received: by 2002:a05:600c:8b51:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-450d6b3ecf3mr116877425e9.5.1748863375781;
        Mon, 02 Jun 2025 04:22:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Revert tools/python part of "tools: remove support for running a guest with qemu-traditional"
Date: Mon,  2 Jun 2025 12:22:53 +0100
Message-Id: <20250602112253.2628571-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The migration stream is a stable ABI.  What this does is break the ability to
inspection and operate on pre-Xen-4.21 streams.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
---
 tools/python/xen/migration/libxl.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/python/xen/migration/libxl.py b/tools/python/xen/migration/libxl.py
index dc5c7ac3550c..5dcb50fe0207 100644
--- a/tools/python/xen/migration/libxl.py
+++ b/tools/python/xen/migration/libxl.py
@@ -51,10 +51,12 @@ rec_type_to_str = {
 EMULATOR_HEADER_FORMAT = "II"
 
 EMULATOR_ID_unknown       = 0x00000000
+EMULATOR_ID_qemu_trad     = 0x00000001
 EMULATOR_ID_qemu_upstream = 0x00000002
 
 emulator_id_to_str = {
     EMULATOR_ID_unknown       : "Unknown",
+    EMULATOR_ID_qemu_trad     : "Qemu Traditional",
     EMULATOR_ID_qemu_upstream : "Qemu Upstream",
 }
 

base-commit: 286c4cc267005f73aba831d22d65abe6874ceaea
-- 
2.39.5


