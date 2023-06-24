Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140B73CC1F
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554646.865970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7Gn-0001Tf-6b; Sat, 24 Jun 2023 17:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554646.865970; Sat, 24 Jun 2023 17:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7Gn-0001Qz-2X; Sat, 24 Jun 2023 17:41:57 +0000
Received: by outflank-mailman (input) for mailman id 554646;
 Sat, 24 Jun 2023 17:41:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7Gl-0000wd-Tg
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:41:55 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 687594aa-12b6-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 19:41:54 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-313e714342cso444875f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:41:54 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 i11-20020adfefcb000000b0030ae3a6be5bsm2589165wrp.78.2023.06.24.10.41.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:41:53 -0700 (PDT)
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
X-Inumbo-ID: 687594aa-12b6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628514; x=1690220514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWWds0uHrElgc22pSSxJ50tOp/lAV9kSI84s7Y2g/GM=;
        b=JjwltddD/cnNRwVGBpMlwyJ7wVl1Dd+vLMYIA1ed2CA1z7xOvX3DxVnc8gtCpAefSE
         xo5g1CiCqTPXpIH4UJy5+rsZYpuKE81Z7be0dQTZ7JzdeX9j5u9Mx8Z5FVXetI2JfTyn
         47UG4xbVI3FVQad68NuGZMbwNXEiWjQIy56FIAywQDCoHP3eiLzbyyHqhhjC+Qo5u3Cg
         4ws7FQYnR+gqZpuWyo+1mj6A2Kgebxl4XbhZ5VUeZWE7itV80GK8EINXxv01Dffpjd6L
         xbEKH2Df7yWf84jA7YjCpGFhq4pv94jz889H0Vtin/e3lUxP++i7igvK6CJ6NiiQ/q9Z
         ZPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628514; x=1690220514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWWds0uHrElgc22pSSxJ50tOp/lAV9kSI84s7Y2g/GM=;
        b=JbfNmFC+ZW97D6kyq7EyO9PkvjxMOhYQUOkgxf59xCqXhMOvbRa3ev0uFUqSBX11M9
         tqjcHWbYKLr7Q3GNhdnzXMBKYQAYtsErX8V44Y/H7QhQb67D99Vb4AlSMEra8l6zAm4W
         ZN7djHAaT55SUipirWq2BkTHmZLMqeCMRLUZz31MxKNkgiDU5VVO/R0LZ8h1+wYBvuQd
         lZqZXHZLU6tjk/ZitiI24eoFWs0cadC7qf5mvXv5gCLBbnaRMKcj2NxKohqLGRgvPKXi
         dOf/ba9KnCyMo44hIvpNl6BiYLCl3bgLlLvnCFomRiNZb0kUyQsz6GGRcOEQiBQP5unz
         YaAg==
X-Gm-Message-State: AC+VfDxhm+KC10g8knWL6XNj4WdM0WrHYOM5DuDR3JJd3N+NDbqWK9P8
	nH83VaK3qHoZ9Zor+UjR+zA4Yw==
X-Google-Smtp-Source: ACHHUZ4nAed12yC0ATc4y4T6ov4JNqGmFeW1j5VBFhJ02T6YV9zBXbm//g8zhdDQtOShKB4zz31FCw==
X-Received: by 2002:a5d:5541:0:b0:311:abb:e377 with SMTP id g1-20020a5d5541000000b003110abbe377mr6323739wrw.39.1687628513811;
        Sat, 24 Jun 2023 10:41:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	xen-devel@lists.xenproject.org,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 04/16] accel: Fix a leak on Windows HAX
Date: Sat, 24 Jun 2023 19:41:09 +0200
Message-Id: <20230624174121.11508-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
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


