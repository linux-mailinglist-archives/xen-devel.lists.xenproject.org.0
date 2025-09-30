Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA4BAC061
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 10:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133910.1471996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgU-0004Nz-Si; Tue, 30 Sep 2025 08:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133910.1471996; Tue, 30 Sep 2025 08:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3VgU-0004Ip-Hb; Tue, 30 Sep 2025 08:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1133910;
 Tue, 30 Sep 2025 08:26:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Vcv-0007Nn-U1
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 08:22:25 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97b59117-9dd6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 10:22:24 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e2562e8cbso43193775e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 01:22:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab31e97sm259738545e9.14.2025.09.30.01.22.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 30 Sep 2025 01:22:23 -0700 (PDT)
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
X-Inumbo-ID: 97b59117-9dd6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759220544; x=1759825344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbEYNZgIU6LqvkF49qge8kIj2C3i6K2S813tsyxbWwg=;
        b=K3by3MACOnbj8zhQ0YluEb7+VUlAcWWTRqW6nBXfxKRC92F7V7OHt2beSN4l4McyTA
         DVJg0SN3XsDQ1XwJGbq69mJdjH/5yvkG82rGVcZsUsDiaVqFK9ok5DxK+m6FXhHqIxUP
         jVUcH/gbrAeketQGXgMHklgEYlJNW20KELCLnD9j1/ttTJ83DJcb28/Bjxmu0tpPjpoF
         fmtNLsfCizrPT1pNgp1g3L04Qd9hnQ3a1vERWVQX6OkDMpECnq8I9UhUidNKi8TwjMhV
         OfgcDRYV5wSw68sbsjip+lBVDr0a1U7O7UsDmjs+xUtdsMQtKvxLindrI0UQT1V6BCjv
         dMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759220544; x=1759825344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbEYNZgIU6LqvkF49qge8kIj2C3i6K2S813tsyxbWwg=;
        b=Xd8uFT+zMDIzkgmvuU0pXhb9YIOViiAjXD6Y3ot1kB8x8rb0Ge7p1TTMDn+ff38whw
         yJR9oDcR5QQ2FWrKp+5cYYKAbEmSKeXk7LuVEDz0bWCM2VN4c690M/6jDaYVON6tLlc3
         cuMRCeJJ8NbpzFl8arAPsXl89Cax3AyFfgWbfD5cMqcSZQOVORKzjLHF0GXgQw0hJi3z
         7EYo5fO2WYjkIXqvNucV161PLcJkuifw/6AgNKSkyiQN83MaFtBmrKkisFkypCTalIo0
         KCEy2nCpoWgJnTiStZMyJ6g4uxJgLi9a4tPKrwj87nWoxTkDouReYhkqeVOw4RsTXYtD
         AV8A==
X-Forwarded-Encrypted: i=1; AJvYcCXbXxWn4JQeuenEzz+vTHF6I/YClh7q4R7584SI6TMCrcKO/GD/KZJ5QjskH1cyMnP4uPNHph68dzQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG1+gmIeNhk9k0ly/lnphcLaOH9Tl8XcUVfWlBwC4o39CO8oDI
	h1/JCJhAEcfWsUsXoeOgeaLjyuhsRpamZl19TKIRuq6tKaCwEIwMF3BZF2EAAQMGX4g=
X-Gm-Gg: ASbGncvU8KzlfTFX3CRBMdY6fFtC90sXNkhkhg3hTBny9XS5k4mRi1hqQE6WQkBY8D7
	iBQXEQi83lmNNUpRzzQ9j+hAejiM3BDlqsY3wo7draZnOb/sZWSsGjYdOJBCM8WinDkvpTfganB
	0hNxnQkaehsW4hjfDca93j55ouT/aJNQyXXmcTSoZARBtOV+HUDPBB0ycGJQg7nSI2IYAMQkRSr
	urVJaO/jWPKk8WGeCIyC8ro9OdOI5qorOc3hDm24tJklPYfUGF/8NeE2ydo9MFNp1aNc6B1L2zK
	o4h9WI0K0u3zb1UW586zaPiZW+xeHc25pAM2x57DhfC4QmKpd15u6TCkcIioDLU2BoGrovcmLjU
	FHhazUw+a5VHvaou8U3GLLJ8dyOA6ychstUw0zHJiwZneXJVr7dS4vRWcD7+aX2UYgblpp+/d6n
	/DDMFPoaN8u8S8LlxmimLBuCL3P9MSpl8=
X-Google-Smtp-Source: AGHT+IHMDbDhZ1qtfUqSvwy3OGcigy6OI6LXsB/syBvCuQ6w6sDdxi+R3qorHEXGNas+XOrL9i5DRg==
X-Received: by 2002:a05:600c:4fca:b0:46e:4ac4:b7b8 with SMTP id 5b1f17b1804b1-46e4ac4ba51mr119307915e9.25.1759220543603;
        Tue, 30 Sep 2025 01:22:23 -0700 (PDT)
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
Subject: [PATCH v3 10/18] target/i386/whpx: Replace legacy cpu_physical_memory_rw() call
Date: Tue, 30 Sep 2025 10:21:17 +0200
Message-ID: <20250930082126.28618-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930082126.28618-1-philmd@linaro.org>
References: <20250930082126.28618-1-philmd@linaro.org>
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


