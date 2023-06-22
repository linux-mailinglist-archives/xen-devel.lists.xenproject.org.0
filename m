Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A229E73A58F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:08:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553732.864475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMrU-0001ca-Fn; Thu, 22 Jun 2023 16:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553732.864475; Thu, 22 Jun 2023 16:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMrU-0001ZC-C7; Thu, 22 Jun 2023 16:08:44 +0000
Received: by outflank-mailman (input) for mailman id 553732;
 Thu, 22 Jun 2023 16:08:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMrT-0001Yq-CB
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:08:43 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dcbcf17-1117-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 18:08:41 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-311099fac92so8481747f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:08:41 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 k7-20020a5d5187000000b0031128382ed0sm7377909wrv.83.2023.06.22.09.08.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:08:40 -0700 (PDT)
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
X-Inumbo-ID: 0dcbcf17-1117-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450120; x=1690042120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JIxHWMClVl6mvpALDoBK231PZeNGUQgT3foMweSwl8=;
        b=m+sOyJwBwsltlHfQ5plMWKOLIis+OEb+I+kYqnZLv4G8Ud23JDgwJFKc5QbUKlQQoS
         1zKSS1dPuy4yqZPNl6TAEFOkN/4qh6Z7q8wJxnI3w+xUocRyREHjcikLswb/B58iAjAw
         i0Kwl0CU2mChgimY0x1pocirTiLNpGhvP2OOxOZgzVdLhbaNm1KhLhoBCcbuNucTQQ3G
         RtyEsciQU1EctCDZTXKzkq/56Q8BpF4exuWzK5Zi9+g+wdZDHRqUsfqn3qJyaskO1hMN
         ORq6jEFNL0dLVh/Tn8LHeYLlV/JThI4azyQy/GqlByxiQt/VVPM3RXqUH7+Gq+EH6hC4
         YgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450120; x=1690042120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JIxHWMClVl6mvpALDoBK231PZeNGUQgT3foMweSwl8=;
        b=W2LiMCfsjeedFLPHerg9KYvnhmuEtNWC+obRhbmF9q75bICmwn3arUInQnlySrs9W4
         6cMU8EtcLjsszt17zMzitNLNbQ15+yFIFH8Sm1bmjLAggvSKMDBvrVkuMPUwygZvpbL1
         AJxKv5GeiW9NUwrJLKSHcJzihC34LXLv638zWP9RxO9q0O3AmBWo1FJeAxkFVerxGw0Y
         STxU3TGhqClkr1mAy7pHwNpkdY7B+ViH2RZZKbgC0HGFmPJvmsgFu9pKIODyJggllBzd
         +yfzVnv6oB1cHj2UdM1zs9z/hB8PHpBy2CowukM2far/OVMF5h3wC4p5FvsoICCEvRY6
         Ao4g==
X-Gm-Message-State: AC+VfDwQ/T1WRY9dMcV0sVu2L5AlUkmn5MSh9aEYKxE0qOzF2yrYQ+7F
	cKXIg2n5RJvL+RY720Z8RpiDpA==
X-Google-Smtp-Source: ACHHUZ6j9PL4gNb09NvEUjJSuIorrjesDgNKCq1cC1uX5pyBuSA6/zCj91wre6SrtXJc4I0XeTLuqQ==
X-Received: by 2002:a5d:67cd:0:b0:2ef:b052:1296 with SMTP id n13-20020a5d67cd000000b002efb0521296mr16834670wrw.22.1687450120463;
        Thu, 22 Jun 2023 09:08:40 -0700 (PDT)
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
Subject: [PATCH v2 01/16] MAINTAINERS: Update Roman Bolshakov email address
Date: Thu, 22 Jun 2023 18:08:08 +0200
Message-Id: <20230622160823.71851-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

r.bolshakov@yadro.com is bouncing: Update Roman's email address
using one found somewhere on the Internet; this way he can Ack-by.

(Reorder Taylor's line to keep the section sorted alphabetically).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 4 ++--
 .mailmap    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f323cd2eb..1da135b0c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -497,14 +497,14 @@ F: target/arm/hvf/
 
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
-M: Roman Bolshakov <r.bolshakov@yadro.com>
+M: Roman Bolshakov <rbolshakov@ddn.com>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
 
 HVF
 M: Cameron Esfahani <dirty@apple.com>
-M: Roman Bolshakov <r.bolshakov@yadro.com>
+M: Roman Bolshakov <rbolshakov@ddn.com>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
diff --git a/.mailmap b/.mailmap
index b57da4827e..64ef9f4de6 100644
--- a/.mailmap
+++ b/.mailmap
@@ -76,9 +76,10 @@ Paul Burton <paulburton@kernel.org> <pburton@wavecomp.com>
 Philippe Mathieu-Daudé <philmd@linaro.org> <f4bug@amsat.org>
 Philippe Mathieu-Daudé <philmd@linaro.org> <philmd@redhat.com>
 Philippe Mathieu-Daudé <philmd@linaro.org> <philmd@fungible.com>
+Roman Bolshakov <rbolshakov@ddn.com> <r.bolshakov@yadro.com>
 Stefan Brankovic <stefan.brankovic@syrmia.com> <stefan.brankovic@rt-rk.com.com>
-Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 Taylor Simpson <ltaylorsimpson@gmail.com> <tsimpson@quicinc.com>
+Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 
 # Also list preferred name forms where people have changed their
 # git author config, or had utf8/latin1 encoding issues.
-- 
2.38.1


