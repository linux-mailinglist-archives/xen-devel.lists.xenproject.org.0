Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE8ABAA56C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 20:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133192.1471392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjN-00068K-TC; Mon, 29 Sep 2025 18:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133192.1471392; Mon, 29 Sep 2025 18:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3IjN-00065V-OR; Mon, 29 Sep 2025 18:36:13 +0000
Received: by outflank-mailman (input) for mailman id 1133192;
 Mon, 29 Sep 2025 18:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BPw2=4I=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Igw-0001U2-2d
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 18:33:42 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2798b95-9d62-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 20:33:41 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso44467f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 11:33:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e56f3d754sm23909085e9.4.2025.09.29.11.33.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Sep 2025 11:33:40 -0700 (PDT)
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
X-Inumbo-ID: d2798b95-9d62-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170821; x=1759775621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbEYNZgIU6LqvkF49qge8kIj2C3i6K2S813tsyxbWwg=;
        b=khWgzdBbP1CktaqF/uejPNCx9iCRhNo9MSSZxK/Xm70o/6Z3Q504TsR+Q+f82xg3No
         lK1U+BbVCLyHazyZ3RHTsZgGkEs3R4O/ClKjuCB/Vug4O18JJ8JcNRPvBO5Vwx2cnNSn
         p10n2Y+VczwCc/XT2tRA0WhYr+wnalpUegiS+SfvNkyxBg8IrsJXcFLIY3v7hSbqzIKF
         gjRYuXz8auiqSzdMQGv/Oliz2FmutLPv/8efQrFXhV7XTg3QOwf7Tpl/ZyBY+ZztgVyT
         o1K55RIYDz9+OsXj66PHKLWMwdNTeUL42tnB3FeVsw7Njzqa8g7Yzdurmn1JoLFOun1V
         m7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170821; x=1759775621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbEYNZgIU6LqvkF49qge8kIj2C3i6K2S813tsyxbWwg=;
        b=dDBPxLftd/sA2Jb1f4OdKh9JaqmqIT37EMDZKuppFrRxCzVLs4cBmSGtgU1hh9dDbs
         FtieOMINFkm65fd3mTWNLXB3aZTk2HD21xczFQODa6Xf+eoqwNESi8LDk+Z8wZ0INz4a
         ihmreJJFSURkyH0EqDDPoJX1oZL6vdYqxMRgu5a8jvRgTAAgZoWNpCc2gf9hm2MrfV96
         3CKIwwUwCLxlNNcypdq4RKgI0/hf5OYqNuK5X4l+x4UOC9AtaoPnrZ1lCFzQG/tznqCt
         ECaBgVIu9Nb2RNdqeTqGidUbxSndzkP2RDAgcRdLb89QJ555oIEyUURtaU9R2vAoWQ8K
         umAg==
X-Forwarded-Encrypted: i=1; AJvYcCWblW1NIPTRPdOuWSc23zcXKknGsyeISmNSBDrzf79Tet0Kjeco2R3li+W4DqQwqCllUBKvU50VPAo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWvbZ+fN2yaBg7CHbVm563D+aOsgYhAxLKUMNp58T54vv6yiKi
	vK7mjDbiCW9Qa/zLEXqypaq0KEinF0E5b9ocl/PNM0JdpxbYLpnk4moyqr/laKvSexU=
X-Gm-Gg: ASbGnctjMp6KJdvF/t12TMrzOMU1Qf38zQM6r6FNVSx46lSbLZRqaTlNijpEAyU0mf/
	SGld6HLx+zhhuHawY/W+sw33PLGXcny9xqj3RvFkYS7rWycLrtYKou4419RJ95YHmqDR0cj5j+4
	58438nRPcscbrAS/9KDgnITwm/ojklm4ISlThFudDVQdGMcvUM3FYdk2Yyh3aViApcuSqhrTfpb
	v3zZNHrMn0HZDk+n3KOgQ0nlN2ga0bOdMUMxE53FUmJ/gk+pbo7QPQ5pvBjyWfevv2FNryjL/Jt
	v5m+xEBcFq8eHM/6oLOLRlV/2GYLeh91y+Nv0PtEPxrCUtyat7TQNaBKirPtTc9A9Nt9nt5c3D3
	uEgOW0xlQgk+wVlsmyxNyCPeXTW0gGc8bwCJYpQYieOX37VtXT/dtL+M3ue1lthEH1zPF/S0oMw
	73ekKyECCPVKFGPMxuPQ==
X-Google-Smtp-Source: AGHT+IHaOBKfpBuD9vwP/E//+ppjcdL0t+dVKZj3FJZtAkNcYom3O6PaZLYCHSxxg6LM7gcPXW/sAQ==
X-Received: by 2002:a05:6000:2c0c:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-40e4d0372cbmr15214118f8f.62.1759170820742;
        Mon, 29 Sep 2025 11:33:40 -0700 (PDT)
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
Subject: [PATCH 08/15] target/i386/whpx: Replace legacy cpu_physical_memory_rw() call
Date: Mon, 29 Sep 2025 20:32:47 +0200
Message-ID: <20250929183254.85478-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929183254.85478-1-philmd@linaro.org>
References: <20250929183254.85478-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Get the vCPU address space and convert the legacy
cpu_physical_memory_rw() by address_space_rw().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/whpx/whpx-all.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 2a85168ed51..82ba177c4a5 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -788,8 +788,11 @@ static HRESULT CALLBACK whpx_emu_mmio_callback(
     void *ctx,
     WHV_EMULATOR_MEMORY_ACCESS_INFO *ma)
 {
-    cpu_physical_memory_rw(ma->GpaAddress, ma->Data, ma->AccessSize,
-                           ma->Direction);
+    CPUState *cpu = (CPUState *)ctx;
+    AddressSpace *as = cpu_addressspace(cs, MEMTXATTRS_UNSPECIFIED);
+
+    address_space_rw(as, ma->GpaAddress, MEMTXATTRS_UNSPECIFIED,
+                     ma->Data, ma->AccessSize, ma->Direction);
     return S_OK;
 }
 
-- 
2.51.0


