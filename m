Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1070F73A598
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553740.864503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMrx-0002tY-6n; Thu, 22 Jun 2023 16:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553740.864503; Thu, 22 Jun 2023 16:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMrx-0002r4-3r; Thu, 22 Jun 2023 16:09:13 +0000
Received: by outflank-mailman (input) for mailman id 553740;
 Thu, 22 Jun 2023 16:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMrw-0001Yq-KL
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:09:12 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fb5d7eb-1117-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 18:09:11 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fa71db41b6so9551795e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:09:11 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c294600b003f7e4639aabsm19231418wmd.10.2023.06.22.09.09.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:09:10 -0700 (PDT)
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
X-Inumbo-ID: 1fb5d7eb-1117-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450150; x=1690042150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWWds0uHrElgc22pSSxJ50tOp/lAV9kSI84s7Y2g/GM=;
        b=EbM780AWzavorYGjwE/j3EeJGIDw52NMRbKdS1s1/gZWniGA7sDBRZVP2QyfRqO47I
         7X7B7xFYS297uGD3scmvxOmMiYP9OTll3eGFYcIQd4FpE0WW7V3oKBilIjfQT/k+/GPn
         V5BiCj2bgxxHGiIPvjbPJuQdy4VGi6sUnUZ8JyXtmAJEU6CrcXGXcSuxoa+cZFjfMKPW
         ZWhlpEG7XgwDT27Y537Y1ehWshHrG0ia2ToE68LsnrY1dFG/RpCqknDRqgAY2g/hC1Kd
         jf7UQOxMVQuZzQgTtEe05+aD9m+AbSf0u4R9D8Us4q4EE6ZIvJq/tj+t/EKcZaxvsqzH
         qQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450150; x=1690042150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWWds0uHrElgc22pSSxJ50tOp/lAV9kSI84s7Y2g/GM=;
        b=eMPNnfVaa4IGtZ985Sayzdo8hXR0fbgfu00mlIf26yqT+Tre6hDjhx//nSYfM4cPwd
         IS6v/NnIUkicuQujmYM3qg8012p27O5Umm/j953tfS3EVKxXhhX5S2JabwEyMw+WboNB
         +Ac4TdafIqmTsKe4qZUWPD1SoKjdpchqbwlGJiySa+VHTdkmjj+3n2Ib1REqL+L9DT8+
         bLrv6Hc8BWCyWFoTKrlYWXnw1pn+pbUuiIaiN4w2gB8TPigSUqzvse0i2Eccbqu9s40P
         1uaSu530UNrwZTd1ojZcVM1G/9idgjeldNSdf8LNXu1kzPC51Gk4/8KX8/B6hUlFujah
         KrEg==
X-Gm-Message-State: AC+VfDwprUWPgSm+sMjoy0Ub8W1fddfWnAOssIVwx3hIzvGr0Ww0zye1
	N24xMp8zTAy4RV68eArBDTe3bg==
X-Google-Smtp-Source: ACHHUZ51xfqu7ycVqyxzIHVhQQRD4BRESLxxv3gkwPL1UAb0nB49UkufaCFZkef5SDfT9giEDTGvXg==
X-Received: by 2002:a1c:6a0e:0:b0:3fa:78d1:572 with SMTP id f14-20020a1c6a0e000000b003fa78d10572mr642130wmc.0.1687450150672;
        Thu, 22 Jun 2023 09:09:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alexander Graf <agraf@csgraf.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 04/16] accel: Fix a leak on Windows HAX
Date: Thu, 22 Jun 2023 18:08:11 +0200
Message-Id: <20230622160823.71851-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hThread is only used on the error path in hax_kick_vcpu_thread().

Fixes: b0cb0a66d6 ("Plumb the HAXM-based hardware acceleration support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/hax/hax-all.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 3e5992a63b..a2321a1eff 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -205,6 +205,9 @@ int hax_vcpu_destroy(CPUState *cpu)
      */
     hax_close_fd(vcpu->fd);
     hax_global.vm->vcpus[vcpu->vcpu_id] = NULL;
+#ifdef _WIN32
+    CloseHandle(cpu->hThread);
+#endif
     g_free(vcpu);
     return 0;
 }
-- 
2.38.1


