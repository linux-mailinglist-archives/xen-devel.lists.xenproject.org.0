Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C326D7976
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518393.804900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Ds-00038r-Kh; Wed, 05 Apr 2023 10:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518393.804900; Wed, 05 Apr 2023 10:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Ds-000365-H4; Wed, 05 Apr 2023 10:18:36 +0000
Received: by outflank-mailman (input) for mailman id 518393;
 Wed, 05 Apr 2023 10:18:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0Dr-0002Na-Sm
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:18:35 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3893df93-d39b-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 12:18:34 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id y14so35677419wrq.4
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:18:34 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adff849000000b002c56af32e8csm14637033wrq.35.2023.04.05.03.18.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:18:33 -0700 (PDT)
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
X-Inumbo-ID: 3893df93-d39b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6NW9VhhS5fLeVwZeTyWWyTbAHfvPOC/r0zI8X/AYhw=;
        b=FrtFKE2hFxCwSIOxwL7fJNJgclFtRZYFCKSwPQeumlgt6bklL8ZJLOhaxRanBaGmBN
         sSSdwoBuo0PWQIPC5aVYpH3V4lrlZrxSnF6ec08aPzNngc+4NCJth/v+YEXjEI5hAYZ7
         deplHkaFXLIdswcAyfQjoGU7HHGPGzJHJzztDL7n6LAkZeMYnyvPoi+3fXYTgBgP5XWs
         cPr7wmMyCDh4HsAHrXF/xlBABJq7EFQwNi0Rj4haWnYMHlXIAYY+Lsa8OGwO4Mt6ZR/d
         e7uyZyaesG4XjKKufoRM2SpXpgdAnFrSp25xtnMkjXzs/M6Ow7DNjd1C6Ovjn8q1Umho
         74DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6NW9VhhS5fLeVwZeTyWWyTbAHfvPOC/r0zI8X/AYhw=;
        b=QlO71eGYcc4/A839ZcUOtT1xhGgo6p6sBc0/SoL0yHAzIMQ2534YlBNBp/v1Tr4fai
         s3vVURIQcv4z0XHckrG+VVXXPGJ3guwo0ZYGtzdlP/F9OslCrk7a6uBWuLwPH3IFiRca
         Qmq3DXvB57qGFi/61LUjorru7kUl/50Y/OMz8j8tOf4MJIk8el54lkBT8Rv+aCPNuNu/
         sXErcQeE+Chm3WRn/e1NHkM6aGfufph5Ci7HvR1BFJAEIp+ApEOifPcEB52ZxOt7NFjP
         O5KaYAgTE8DzLW/6tkpvcuiZ41x4EPYz59oomc7JclN1ipEOlpkpR83VtMQfuRIHYnGn
         3O2g==
X-Gm-Message-State: AAQBX9fEhyJijfAKsl7+kEZRdXE2m0VA9xBYCVwsI0j8AW0RQfIUgtT9
	OxitiO7hgJWadZg4vPhur9TgRQ==
X-Google-Smtp-Source: AKy350YkinPPwbt/c64vUzk9lM4SXacH8xjrAIzv8V1BeCK80tQHniLUzIE+5w/+4XbN335yprpGWw==
X-Received: by 2002:a5d:4d11:0:b0:2ce:9819:1c1e with SMTP id z17-20020a5d4d11000000b002ce98191c1emr3913343wrt.30.1680689913858;
        Wed, 05 Apr 2023 03:18:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 03/14] accel: Fix a leak on Windows HAX
Date: Wed,  5 Apr 2023 12:18:00 +0200
Message-Id: <20230405101811.76663-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hThread is only used on the error path in hax_kick_vcpu_thread().

Fixes: b0cb0a66d6 ("Plumb the HAXM-based hardware acceleration support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


