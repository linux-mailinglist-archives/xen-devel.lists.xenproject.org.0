Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6BD5851D7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 16:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377562.610813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHRLy-0002fT-6h; Fri, 29 Jul 2022 14:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377562.610813; Fri, 29 Jul 2022 14:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHRLy-0002dE-3g; Fri, 29 Jul 2022 14:52:38 +0000
Received: by outflank-mailman (input) for mailman id 377562;
 Fri, 29 Jul 2022 14:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHRLw-0002d8-HB
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 14:52:36 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14b0b332-0f4e-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 16:52:35 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id a89so6126143edf.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 07:52:35 -0700 (PDT)
Received: from uni.router.wind (adsl-93.176.58.224.tellas.gr. [176.58.224.93])
 by smtp.googlemail.com with ESMTPSA id
 b1-20020a05640202c100b0043cf2e0ce1csm2415545edx.48.2022.07.29.07.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 07:52:33 -0700 (PDT)
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
X-Inumbo-ID: 14b0b332-0f4e-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mw3lSZrwTnD8kRfOGcmflqxZ0jFgEK1pjAXWOmS6BIE=;
        b=lOsdwhHGF1zirvCyHKDmQWQHMbGWjxlntdqf6DSZRMlpXkaN+yVx+uBtCmPxrX2zH7
         lhEfpSx67RJ5bh5GQlC2zUxmz+s6BeXqmIkanaf9etCabEbvqGEOVpyudhH/tpZ8I+06
         bkqUKKPiCv3FpbzJKgLx4pI8TYAURDxzLp1ZSBB/Cw5YAoOvWfOLrgd/x+Yyx72EHeJW
         XXm5MUku7aer4lqIww4XINxXhCRcTymuP8RFMYo2Ibra5jWFJkE+LEg2UMH+Q/CEXkFm
         GQtrTbBfb4/JbbQGpOiacnyvAMIv/QtgfDEMuz8ptka5J7XKSrkWfwDCRB1FXL1ZUIUt
         Jy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mw3lSZrwTnD8kRfOGcmflqxZ0jFgEK1pjAXWOmS6BIE=;
        b=teUSKEhaimc0IclyA0qbzZMf/4OebghxNwLFL1GYmtur2eEN7hXSoCJxzvEulzYPG/
         IEM6hVO/AQ1Ho7Zy3/GgiY/b9Tnqce+rAlV4tIRQ6EFmxjK0XaAlrrMB2nEgn4D0tEPY
         5efMTAGPgz0oQQ5ox8ckN+pbkh+WSz2k3WV56Y3u2LGZz3PktmQxUJ5722lTbnnur51G
         E5yIenNtsK7kn8bStvB+/JAPWTUB/TIcpOmgnq3rBoMblkPbtEGpps6XqR35FeSfCZTZ
         P6PBgMUAkd1pabd0K807NyYuK56QlHy7eX3APJrYpgLp8k96fdt9J2NWBRzPM6+dR0d7
         l8ng==
X-Gm-Message-State: AJIora8FJEYJEwDBcUluhKEvmwIkD1f4MH6fMO+zOGd9zpxSV6v9pVdP
	ZAVS0PjLYG+TgdmYUlLFwjUxVsiRK4lQFA==
X-Google-Smtp-Source: AGRyM1s5uaaYCXNtBaa3ofMbcdeWNl0Mi0imn5TCPwW9WIwX27hUvCZGU+Q0KL9eMY6jbo0xwfWS/w==
X-Received: by 2002:a05:6402:518d:b0:43c:32b2:a0a with SMTP id q13-20020a056402518d00b0043c32b20a0amr3991963edd.388.1659106354233;
        Fri, 29 Jul 2022 07:52:34 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/3] automation: qemu-smoke-arm64.sh: Minor fixes to prevent confusion
Date: Fri, 29 Jul 2022 17:52:26 +0300
Message-Id: <20220729145229.1250221-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series performs some minor cleanups in qemu-smoke-arm64.sh to
prevent confusion that may arise to somebody reading the test.
More specifically, this patch series
- cleanups some stale comments
- fixes the name used for the device tree
- fixes the number of cpus in the dt to reflect the number of cpus used
in qemu

Xenia Ragiadakou (3):
  automation: qemu-smoke-arm64.sh: Remove some stale comments
  automation: qemu-smoke-arm64.sh: Rename the device tree to avoid
    confusion
  automation: qemu-smoke-arm64.sh: Fix the number of cpus in the device
    tree

 automation/scripts/qemu-smoke-arm64.sh | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
2.34.1


