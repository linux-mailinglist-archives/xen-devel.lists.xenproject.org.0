Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4C7A3A2B2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 17:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891995.1301009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQa-0004J0-6I; Tue, 18 Feb 2025 16:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891995.1301009; Tue, 18 Feb 2025 16:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkQQa-0004Gk-2f; Tue, 18 Feb 2025 16:26:32 +0000
Received: by outflank-mailman (input) for mailman id 891995;
 Tue, 18 Feb 2025 16:26:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlVU=VJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tkQQZ-0004Eu-4w
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 16:26:31 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19b4f6dc-ee15-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 17:26:26 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f3913569fso1792704f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 08:26:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7df2sm15426607f8f.84.2025.02.18.08.26.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Feb 2025 08:26:25 -0800 (PST)
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
X-Inumbo-ID: 19b4f6dc-ee15-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739895986; x=1740500786; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LIM0sFFVBkCbyArsjA9gzE/mDTxyAKavFGTWagdWog=;
        b=MNM3C2mRRQlgmw7IeNslgbCmnw++T1QbAKgssmDKig/oOaKEJVToEYVXYA07d82DR0
         OHU2QNKti/s0uCJjkRLJXYZIhankfhF4ukEK7+y3QCqI38j/IQ4TK6lBFf8sPZpD8zvx
         aVSYXDy9xGHzkzNGVxzt2n7zSr1PpuAqsalr9lrzuBWDPwYhSzw7HXWQq9GaE9j30ZiI
         qiQ8Eq/9lXU9MThcRtD4SibZ3ukW5LdUDWRMWJjG0RX9hVErG6DONylD/myF/CdEel+y
         zfQgbMDVfBvC21EqKb63LlsR5WxxA5Xxz3ttsxYwHaMnNUC63hDJSPmNPcn7fmjJucmK
         2Npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739895986; x=1740500786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LIM0sFFVBkCbyArsjA9gzE/mDTxyAKavFGTWagdWog=;
        b=B2SftUxvKT3uNfdx3cRdTcQLM2duY554uG0qzmVIGF/WVTj+gN4WDoHtb2VNu+nzIg
         rPqE+dw33NJESOq20YUReZ/WtfjeSMC24UzK8mPQ/QPnLKfbsPlPKqGQ3DTAoHKjZOF1
         Oscvm22UDgSCQfVbXYv0TTNsJFkcxkrAncBh4FRY4ipQMHlF8a7E80ewnIihVy9qBhbt
         kDWP8rW6EiyJ9FGS8RA8a5dpvyZIDERFS0BlFmYxSOPPGV6gHqFbxme/xvhAnTuQapu7
         M6xV4W31hgRlTIImpobSYlHNlMwn3L+HLMgwixVqTldzyig7maQ26xslZBbZHfjDdFza
         nRLw==
X-Forwarded-Encrypted: i=1; AJvYcCWl7VYIm3Clb//2cG5qRktwgVwBLWuA38T2sXLTWkhIOeTc6bhhcl1jJDtPYujOcYU25/GsPY2TMko=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywx0fY7VK8ayF7B0OQaR+6mNSWZRu9u/i4lkmhy6Cp7aa6jZ4In
	3mads/HjHglTM3oWKCFE/HcGy1jyXHI2KSTfPZDxhx0+dVFYrMgCTRVLr1I1p8M=
X-Gm-Gg: ASbGnctfy4PKJuA+HtiE9KIMXGPLNgCAUr20wJdJcHChhFrE+vmFqZp356zhI5gKeP1
	Xw+ysJmKNueCzL3uLKel2Hf08cVCehb1nis4CFKhG49nOM4wpOY3MeKXdHX0Uj8PNdeTHhQOyVx
	LKb2HWfh6hhPzuzfg8oaUofu+Yr0kp5VCJjW6lAGLd0Y5fg5TqUOxwRlmfKjEs5IFHFa3BbxdvO
	3zH2sUxpmsP6WH/VaFYhUhUTBgMduxIc9EERBavWz7NlvG8Sp3qUQg+Oi00OBTXKjLBBdvCdK5S
	590vRbz/hAHzsX7jBuv9s0qPpQvWceX6hV8erq2pCoHkqVWWv2vMVAkveewQTELETQ==
X-Google-Smtp-Source: AGHT+IGaFoLwpAXJM1RKXJyqOqbFhBQZJoShD8QgSKhjB3EukdihrG9J+ztpEYBn+Bs+2lZBx3sx+g==
X-Received: by 2002:a05:6000:1fa1:b0:38d:c6b8:9fe1 with SMTP id ffacd0b85a97d-38f57ea1cfcmr360586f8f.24.1739895986072;
        Tue, 18 Feb 2025 08:26:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Thomas Huth <thuth@redhat.com>,
	Jan Beulich <jbeulich@suse.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/8] accel/Kconfig: Link XenPVH with GPEX PCIe bridge
Date: Tue, 18 Feb 2025 17:26:11 +0100
Message-ID: <20250218162618.46167-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
References: <20250218162618.46167-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XenPVH requires the PCIe/GPEX device. Add it to Kconfig
to avoid when configuring using --without-default-devices:

  /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-pvh-common.c.o: in function `xenpvh_gpex_init':
  hw/xen/xen-pvh-common.c:174: undefined reference to `gpex_set_irq_num'
  /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in function `pci_dev_bus_num':
  include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: include/hw/pci/pci.h:337: undefined reference to `pci_bus_num'
  /usr/bin/ld: libqemu-aarch64-softmmu.a.p/hw_xen_xen-hvm-common.c.o: in function `cpu_ioreq_config':
  hw/xen/xen-hvm-common.c:412: undefined reference to `pci_host_config_read_common'
  /usr/bin/ld: hw/xen/xen-hvm-common.c:428: undefined reference to `pci_host_config_read_common'
  /usr/bin/ld: hw/xen/xen-hvm-common.c:438: undefined reference to `pci_host_config_write_common'

Fixes: f22e598a72c ("hw/xen: pvh-common: Add support for creating PCIe/GPEX")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/Kconfig b/accel/Kconfig
index 794e0d18d21..4263cab7227 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -16,4 +16,5 @@ config KVM
 config XEN
     bool
     select FSDEV_9P if VIRTFS
+    select PCI_EXPRESS_GENERIC_BRIDGE
     select XEN_BUS
-- 
2.47.1


