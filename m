Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE9589045F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 17:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699037.1091546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsC3-0000t4-TN; Thu, 28 Mar 2024 16:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699037.1091546; Thu, 28 Mar 2024 16:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpsC3-0000pS-QY; Thu, 28 Mar 2024 16:01:31 +0000
Received: by outflank-mailman (input) for mailman id 699037;
 Thu, 28 Mar 2024 16:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yxy0=LC=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rps7b-0001AK-C2
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:56:55 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc8680f1-ed1b-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:56:54 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a2f22bfb4e6so155203766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:56:54 -0700 (PDT)
Received: from m1x-phil.lan (pas38-h02-176-184-5-52.dsl.sta.abo.bbox.fr.
 [176.184.5.52]) by smtp.gmail.com with ESMTPSA id
 x16-20020a170906135000b00a46ee3c31afsm884227ejb.154.2024.03.28.08.56.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Mar 2024 08:56:54 -0700 (PDT)
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
X-Inumbo-ID: cc8680f1-ed1b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711641414; x=1712246214; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAY/yw6dYKkUP/WFLvpvljjwD9mQwkPWyyzr0cq0w+A=;
        b=LziBG55fXFnBOAAR2+719XgGwzr5DV3/+fBODODb6hO9Eqwt59sGLE2eVqc9w1zjhL
         yHxQA5QZ93utZHTv/qoUa5Hh7DZEOGH5mN4ZYM7uRdoYL+i7vtLgUYKajhwA5uveDHLt
         RTaBq45tlyDnhc5daWAUKFQ0EDF9L0S060a4rEJch0joV9X0ko5slrAPj4ZiSAmr2kpU
         J0z5btOCOfdZCmSKwMK3zJHidw7nqq2xv2PtU0OqVyAkGqiPQKXC2sRWZpAkG3oY7+4k
         Tin+oVDeyRVHUg7CcR6YBPEE3hVTUCOLPYkIzglSWLsStg8Pikfl6A+oHagG0QZrIp+Z
         a0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641414; x=1712246214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAY/yw6dYKkUP/WFLvpvljjwD9mQwkPWyyzr0cq0w+A=;
        b=jCWfIN+DDrCKAxkbYAmq5pHwC7zlBl7mZuubXuozji4ynpdjhTEHHXQuS/T6KVsmIk
         IrFs7NXfigxaIv11kGPVlxOfMgYOmCxD3i5lXtTDx3bbiWBEvzXy8cBSh/zYpCAwg5A/
         KJYqdF5a8sP73JD+cSTWTwK7z3Qxh4ZWlGl+N6K9ZJXFGruX/Cks+uU/vVtibXEDWy+a
         eTfAuGlxlJfcJ3nNhFX7pw1rBtjDTQLuj73M35EQxfbkEB1XnsS94ahee0QilzmiCDLM
         +40jEuDbdbg6Z4NPS06mPVJu30va3nkVpEsGNtOH0lhwLp0Iw2Frq7CG9ASJBU3i7HVa
         Q47Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIGXQ/h8JlvSSZbn31WP/cKSE8Ps6IfpkP3wbBI1yrgBv0wJrqYavHW7+Pc9cPgzyjtcJz7gkUy31dPzVDHYcTwYls8J4ND2DSqQ+U2rg=
X-Gm-Message-State: AOJu0Yy0xJGlM2KKXEPrGX4AxIXBlX2Zyx5lQiEv+NAfQ4TP7thzZxpL
	9dVcpvrVZKJewHuft/KoFYp9gf6AB0ItDg2guNbCq4nh8zUEoMRhe1sebQlbXfI=
X-Google-Smtp-Source: AGHT+IHHCjINc+B1WA7YTf9CDPOy43wJYCQL0voBiUNztEKWZkyjgtHiZiJjx/du9sQyScNWeJj6tg==
X-Received: by 2002:a17:906:35d0:b0:a47:11a9:9038 with SMTP id p16-20020a17090635d000b00a4711a99038mr2127429ejb.58.1711641414401;
        Thu, 28 Mar 2024 08:56:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-9.1 21/29] hw/i386/fw_cfg: Include missing 'qapi-types-machine.h' header
Date: Thu, 28 Mar 2024 16:54:29 +0100
Message-ID: <20240328155439.58719-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240328155439.58719-1-philmd@linaro.org>
References: <20240328155439.58719-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"fw_cfg.h" declares fw_cfg_build_smbios() which use
SmbiosEntryPointType, itself declared in "qapi-types-machine.h".

  void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
                           SmbiosEntryPointType ep_type);
                           ^^^^^^^^^^^^^^^^^^^^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/fw_cfg.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
index 92e310f5fd..7a426119f8 100644
--- a/hw/i386/fw_cfg.h
+++ b/hw/i386/fw_cfg.h
@@ -12,6 +12,7 @@
 #include "hw/boards.h"
 #include "hw/i386/pc.h"
 #include "hw/nvram/fw_cfg.h"
+#include "qapi/qapi-types-machine.h"
 
 #define FW_CFG_IO_BASE     0x510
 
-- 
2.41.0


