Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86591A0310D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865900.1277196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJg-0002um-G1; Mon, 06 Jan 2025 20:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865900.1277196; Mon, 06 Jan 2025 20:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtJg-0002sg-CU; Mon, 06 Jan 2025 20:03:12 +0000
Received: by outflank-mailman (input) for mailman id 865900;
 Mon, 06 Jan 2025 20:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH3c=T6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tUtJe-0002s4-VR
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:03:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40584bf3-cc69-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 21:03:09 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so9136527f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:03:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43665cd9c29sm559552815e9.14.2025.01.06.12.03.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Jan 2025 12:03:08 -0800 (PST)
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
X-Inumbo-ID: 40584bf3-cc69-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736193789; x=1736798589; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw/8miEe/PnaBFePSWTnOg3qI2ZvVUjrjdrVrAxgzBI=;
        b=GpJJjrGhEDpawdBPjjACmpCUFkHH8FrwXHA1FDOcG1DfCYoQvJ7sd7OsxDyLC/NOCK
         3i0AtcqPDWHQffFFaTDxmmcMhaTVQfarHruEW5tZAtVGovP6qy9tHMnFWTvgmgiJlSND
         F82UOzjdOC3Ugdj+m13ayr5SG2HkwEmkXyk8e24A8umZBLfFWIQ0ZDermyxMet+HuAhV
         cqc7sWecdDJ5SSkt5njszm8OMzvRR+fbajtxA1Ehi54RCG27B9IZ2EeRR5vq7K9ndoeR
         F+yQaD2DEpSFLbv+fa8Mb5RVhZeWEmrW+LeIVbRwceig6c8CzdxsJMScDsW+plcNcHuZ
         /lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193789; x=1736798589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gw/8miEe/PnaBFePSWTnOg3qI2ZvVUjrjdrVrAxgzBI=;
        b=rmE8ZhVvPQgif4MkjHcddxr5N26o/JNL6PP0fiGKtyMjQujAUM8n2asEI00EmOwU4m
         d6V/8JG/2BYagCp2Ze99ix0FOOmZKAOjJp2sOkb+evhMTrCpyVZvwK9Z2doC33Q+1Esm
         Dqc4yoYSlpU4j6W950SbDRf7lGUhQv2FdazkgkDXuC2TFM2TRavcFMa+/9ID2mO6p3WH
         zgQaMdNuDL7nLOH9pOwICpb+GrzLBqT56BOSx5PJTFMdT+Q2LKxmKbO3Jur7cKd3QAor
         6OaNo2pCQ9EujXWn7AWPnoVmq03IonUFNXuwV0bWUort1my9wTaEMFJSdfMI1d93K9PH
         m4Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVdD9R58Aaq0lgng7AFlXgOKVr6U6nQgqmx9OUd4nHzo49RrrqzAqgdl2wjCwufutH6bwlJ9sYQ+Ow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvaU9FywNO88ub3tWHClZIxecD9wKJYoZIRizxOINaOz1BiDko
	0wkOFaW76dqtiK6unDEwfA4gvsVVfsTjj96nqsQKLvt8zv2mU3wNs2Stct7CCkc=
X-Gm-Gg: ASbGncvUgxOsbFNz4qUnfRVLXqMiH2ja6u7aEFSnYpAMk797Au2U2Xo7gBCQIeXOsLy
	D9iorM633cnwXMqGO9Q7QgOGmPLBOlf2AzPGGlpqxJ2xuLLzTDUagwYTa0OgxEclf0EUfyDxvkv
	LXm+sRwoNK8OkCRw7DH5qi6iytixU19htgn08D6I61xwuluo0UpYzUtEgKuEIwsX0Z899fQJv36
	n2nHXH8TaFxaXx6niqSbkvdcogNNK7SMR72MJ4HCnYsby11oI36YDbL6hAA9weX+9/NEHU4Nx4V
	LUVz3w4Onj5B/hsxRoPmRgptkbNbUoU=
X-Google-Smtp-Source: AGHT+IE81N1RplBD8FCsdoj95sqyVSqitqWpe38bLlQuumoNL1lLDdZMOpwBwgd43Npz//MFxfo/tw==
X-Received: by 2002:a5d:64ac:0:b0:38a:4df5:a08 with SMTP id ffacd0b85a97d-38a7923b959mr440924f8f.22.1736193788891;
        Mon, 06 Jan 2025 12:03:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Alexander Graf <agraf@csgraf.de>,
	Paul Durrant <paul@xen.org>,
	David Hildenbrand <david@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-s390x@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Anthony PERARD <anthony@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anton Johansson <anjo@rev.ng>
Subject: [RFC PATCH 1/7] cpus: Restrict CPU_FOREACH_SAFE() to user emulation
Date: Mon,  6 Jan 2025 21:02:52 +0100
Message-ID: <20250106200258.37008-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106200258.37008-1-philmd@linaro.org>
References: <20250106200258.37008-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c3ca0babcb3..48d90f50a71 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,8 +594,11 @@ extern CPUTailQ cpus_queue;
 #define first_cpu        QTAILQ_FIRST_RCU(&cpus_queue)
 #define CPU_NEXT(cpu)    QTAILQ_NEXT_RCU(cpu, node)
 #define CPU_FOREACH(cpu) QTAILQ_FOREACH_RCU(cpu, &cpus_queue, node)
+
+#if defined(CONFIG_USER_ONLY)
 #define CPU_FOREACH_SAFE(cpu, next_cpu) \
     QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus_queue, node, next_cpu)
+#endif
 
 extern __thread CPUState *current_cpu;
 
-- 
2.47.1


