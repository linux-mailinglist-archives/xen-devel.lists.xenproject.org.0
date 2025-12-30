Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82761CEA1AF
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 16:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194338.1512756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vabzU-00029w-Vq; Tue, 30 Dec 2025 15:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194338.1512756; Tue, 30 Dec 2025 15:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vabzU-00027R-S3; Tue, 30 Dec 2025 15:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1194338;
 Tue, 30 Dec 2025 15:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hKsM=7E=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vabzT-00026k-F9
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 15:50:31 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 407b754f-e597-11f0-b15c-2bf370ae4941;
 Tue, 30 Dec 2025 16:50:23 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64c893f3a94so11523800a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 07:50:23 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037de0de1sm3695413366b.40.2025.12.30.07.50.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 07:50:21 -0800 (PST)
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
X-Inumbo-ID: 407b754f-e597-11f0-b15c-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109822; x=1767714622; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yIG0sywHzPD2YdTunP/Jm/AGGTirviuhfinchXZhN1Q=;
        b=ZXFUMKMsQfFn9DnXWUVroUrfl4gSP4SHZ4VpRFYpxGX3JkJiA2rqaShSXjxdCw5Osn
         l6npQK45KKmscqn8IGtTXco4GosSkxSP+y3QZE2J55mXALenBsK1WLh59/M3K//OqG41
         aqBwSP9Ins7K2pq7T9SIirXlT/dQuCrInGi7eRn7w+i99Nq5ReE9GjBGUnBX1rZ4ExkN
         kD1WmLRrB9OwYyTnoLntPIRcvLXyy7T01TyDnAawm+s3Ej3E0j0eGxNt1UQ2Z/vvCxxj
         ArY+vFXorsuPIbIXzyJpdMse18Gt26KD7J+I8PFelaD1DuncT/TJSsRn1k4204wQpui7
         Mxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109822; x=1767714622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIG0sywHzPD2YdTunP/Jm/AGGTirviuhfinchXZhN1Q=;
        b=TEJTOl8oSjrxdLx8D18YdNDaGDPq6nSFNSZYvLDfdrVlS5uHwAdaguGxZrvKBJIig9
         NSsmnT9AbIKI/vBN+27GKDfcnUeb+R88CgM5q7wnQ1AedCJWVMKv26EQENbPMyJhEsrx
         e6T9aiNY1IAjsBFYlF5J9Jw6uaHSlFlb9zKyx+R0UdxBTI+PivjREDErttEjmsn6C6aN
         FRRy0oLMECVtNhDuf5AXNvaMQnxAuM4t4RFFuiu5I0ScQKekPEl2YbMIPjvbEIbsB3Xc
         5BHjdJDTHv3gjK7wC10dhbJM7bC1+xLMu62TELesvA4jZrGhtLSffURQFqyCKuE1r94z
         dbGQ==
X-Gm-Message-State: AOJu0Yxvs9euHKazqUJ7+R9rhz1Lz9qxHoXieRr2QSJ50X+BWlIEn7yK
	MSYP2hoduuVo5k92ZWaqP/I23THN9m8P7QMQiZpOmFCU75cZP4yC4WGLSgX4Lg==
X-Gm-Gg: AY/fxX7a4OhSCwHDCiBppHqkPkxcFwKveDbdpkSF/dFHneUV8AKCgeZMDXNfro72eWr
	9zdoLUFWbov7wBxXZrOgxH7P5J14AzjofmWG0hzzJU/KCeYLKQywM8dRZ+sUS0H61cu3t+MWccd
	ALA/RNpkmRoyyGniuUtuiGHQ1UvVdyZdQG1ep5+vN95lfbjERtJ4FyB1+jv5ZDAhcrANdBPEY9y
	CB5QNYdWjDGd5FPAPCS0xics+3qGabkld0gT/aOZGWpxO1pgyvUugOFx+iDCmiRJIsdKnM0KTO2
	zwLpGFHlZici5dJ0rtR5WajwVsKzeGbT5YHeWRfCZku3g2hFt1kvpTroReDtqaSVPGcQCJWvI7y
	sD4Y9pUiEAkDYwvgaFeVpJ/LItODs2IEm+mpo0L1Aeb6RzfAHOwX819wAB0xza+Y42ekUlXIXgD
	fWGMqfE/+NGhGdceMAxPjR0LCcH5Xy5WzQyE93ktnsyGwDMMjSUSE5kA==
X-Google-Smtp-Source: AGHT+IHs8CfExgzyYCDC078hUfShkbz1D6L4tU2JNLJdY7rvD2AqtKX1689fDE/TcYE2Qi2je+pWpA==
X-Received: by 2002:a17:907:3f9f:b0:b76:3d56:f666 with SMTP id a640c23a62f3a-b80205ed2bdmr3754182866b.26.1767109822391;
        Tue, 30 Dec 2025 07:50:22 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/1] RISC-V: Introduce vSBI framework
Date: Tue, 30 Dec 2025 16:50:10 +0100
Message-ID: <cover.1767108625.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the vSBI framework to handle extension ecall instruction calls
from a guest.

In this patch series, support is added for only a few extensions and FIDs,
just enough to boot the first guest domains and obtain logs from them. This
keeps the patch series independent from other ongoing work.

It was decided to start with support for the Legacy Extension, as it is still
supported by Linux (so we may need it anyway), and because some of its FIDs
require less functionality to implement at this stage compared to the more
modern extensions.

CI tests: https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2238071752

---
Changes in v4:
 - First to patches were merged to staging.
 - Address comments for the last patch.
---
Changes in v3:
 - Address a comments from v2.
---
Changes in v2:
 - Address a comments from v1.
---

Oleksii Kurochko (1):
  xen/riscv: add RISC-V virtual SBI base extension support for guests

 xen/arch/riscv/include/asm/sbi.h     |  6 ++
 xen/arch/riscv/vsbi/Makefile         |  1 +
 xen/arch/riscv/vsbi/base-extension.c | 82 ++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 xen/arch/riscv/vsbi/base-extension.c

-- 
2.52.0


