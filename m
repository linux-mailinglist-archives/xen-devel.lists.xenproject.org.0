Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691F373CC18
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554640.865939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7GR-0000A3-Dn; Sat, 24 Jun 2023 17:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554640.865939; Sat, 24 Jun 2023 17:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7GR-00007o-AX; Sat, 24 Jun 2023 17:41:35 +0000
Received: by outflank-mailman (input) for mailman id 554640;
 Sat, 24 Jun 2023 17:41:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7GQ-0008Gp-3v
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:41:34 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c12750f-12b6-11ee-b237-6b7b168915f2;
 Sat, 24 Jun 2023 19:41:33 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3129c55e1d1so2107431f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:41:33 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d6407000000b0030fcf3d75c4sm2609804wru.45.2023.06.24.10.41.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:41:32 -0700 (PDT)
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
X-Inumbo-ID: 5c12750f-12b6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628493; x=1690220493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JIxHWMClVl6mvpALDoBK231PZeNGUQgT3foMweSwl8=;
        b=d9EPiTdMBS6ezt21TafvsYW1DcHw6rx3bSyGYk02qijZjSVC1xbJv7hrNc8Bln/+KY
         da9/C7KLlpChs5ekpkEMTLt+8/tTn69sMDTvOr77GosenaKuMVoIqanEcBIaB+x8/IYa
         sMX5xiZvQgUwCoIYnw0wLy0I8qTh5UNWS2TKXn7vV66wpwVU6Arg9AwvuzGbtx5f2Fr1
         NS187HJhnsPP5z7lKj2H5zJ9WFDNB74ee+CLe5qo2TrqCpMy25BW2hi6t3sBgrl2wrMY
         3O1uqpNOR6dT7+pTrezI8H96sgMZeN+qygKbA8KQdg//j8BnqU62WE8Pxxa1LGwOWpQ1
         C2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628493; x=1690220493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JIxHWMClVl6mvpALDoBK231PZeNGUQgT3foMweSwl8=;
        b=CP0azyf6B9uqDnDA4j8gXrYWU2Sr0tIzI2ieSMROGiGcdTMRuqC/7znKZwf/nUP4mo
         s5K2+vHVtz1ADVbPa3BihRFE1lnVjh+bUUM0Dg/7e2BkxtnLIrbdzbbQLJI9HT84jWUV
         uAJUsjqhBzLIDdM4vin9ux68oF10PHE6bzcSSPXsS2tmQF5BlBz61lARPSTw3pX0UrXe
         4szB9hwUJBZn3DZEVqBumVoF7zhF2KGgDPMFF3yeff0n5d8IKy5ctu2aiRe05s6muwSW
         9iwLJ/z9cAdbaCplrJx8hp1/GxwxvToxmZ+ZJDL1Ibu//cDIvQl91tDEQUb3gnQj4ZEc
         ccPA==
X-Gm-Message-State: AC+VfDxm9FletFeRAEwjclEbiWIICdGxOFu0JmoCjxatR8VMb3eDH2H4
	YRNL4XoJoEifSkfmgqGVqb9sEQ==
X-Google-Smtp-Source: ACHHUZ4gIjgAKb4rVFXLZjiJdVzXvPynrHKyrgCEdSr0allCKh8ZZswCbWqoo+JLTWwg5/zBqsSxag==
X-Received: by 2002:a5d:5344:0:b0:313:df09:ad04 with SMTP id t4-20020a5d5344000000b00313df09ad04mr2110290wrv.57.1687628493050;
        Sat, 24 Jun 2023 10:41:33 -0700 (PDT)
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
Subject: [PATCH v3 01/16] MAINTAINERS: Update Roman Bolshakov email address
Date: Sat, 24 Jun 2023 19:41:06 +0200
Message-Id: <20230624174121.11508-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
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


