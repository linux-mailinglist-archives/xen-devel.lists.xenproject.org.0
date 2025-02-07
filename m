Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF61A2D039
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 23:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884032.1293841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWPk-0003U5-LE; Fri, 07 Feb 2025 22:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884032.1293841; Fri, 07 Feb 2025 22:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgWPk-0003Rk-GK; Fri, 07 Feb 2025 22:01:32 +0000
Received: by outflank-mailman (input) for mailman id 884032;
 Fri, 07 Feb 2025 22:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iVmI=U6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgWPi-0002Xy-Rx
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 22:01:30 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15ad43ed-e59f-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 23:01:30 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso1325572f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 14:01:30 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb4410e6sm2636035f8f.8.2025.02.07.14.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 14:01:28 -0800 (PST)
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
X-Inumbo-ID: 15ad43ed-e59f-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738965689; x=1739570489; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnR0HvkJY/eJqC43vEosp5uMlAJboHQ7zF6VK9BRj7w=;
        b=bDx8sgPQb6paoVJDbN9JEFp4FN4WXM/qwMXTn5F61cctY4+WnjHIcudfu9itbF+xPz
         bm1Hu/hK/fXHCh8zzpQC3WiDsgaG3ymrz2FJ7R/xUJQvcrUatwQ4hYXycp9nyUimH0xX
         zmn3ZfvqXox9lP2zQbO9WNAsB2PsFJ9C4yRfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738965689; x=1739570489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnR0HvkJY/eJqC43vEosp5uMlAJboHQ7zF6VK9BRj7w=;
        b=WUTKhfVeOstQWhS9w6fTfeeO20++o3ynTptHnbL/Xyjw93G6BX0woexKBnd604Grlk
         N6d632lbTNJwc5K0tEVG6Gz3nUEjSuZLtDQLuIu67l1+TG9ZEh0cPrT+9ji51qEUUyoD
         TL+DYfGo57sKEn8tasF8PkeehyLefinfa2vQVvPu4VPjZUQEoWd7adWqXOUvaMGZJd52
         3UCzJVyYwx0kTUW3wjChaaJcPcXRa3uJDxSkjPtsHvDdabORoLYPa9C5PEMjzY1XOymh
         zFyKOaYWbGzJ+kgicr1R6Thjeb2sFFkQw36ZDXsbENln13cOAByL4syZHs6thJZkn/Ne
         2SiA==
X-Gm-Message-State: AOJu0YzHX5LN4EkPLWppybLVeo5QHquZlK6WJbnVyr27JWAgyjJ2+hqR
	mnKjE+Fc6EmdJWTgai3VMSH2esX14h09N3HdJElCkBf83JewpcdGvLaplqizEERD9J0duKh5VLq
	4nu/ENA==
X-Gm-Gg: ASbGncsDTCzKvq15BTRnCZWy9SSAVea6r7suBnkwj7fu8/4UfN2f/JyZi5euauLBsak
	zwJgeASP9K0xgYnhMkskUHxKjAzKQz8LzSb/AAfOPYy+kGvFqf9K/EZ3GsUp85oiLmXPV13HLnT
	9DhzJ9B1ozypVRL25439eViCleaQGO1YO6zHRBBunOIeJ2/bsZuv+86go2YBas78N3R7I+iXAUP
	cTeYQZK5S92t2c4YPUa44Ts42gneuo4O5s4GQDnx645iMs83mDZfftn1IajPL3dHLoHDDDIFlzW
	JTpXRzOgCISI2BCE62e5Cb+LU3556FTY7helmMLUKlqWZpd9VEt6z4tr7CGZr3U/MtwQk+g=
X-Google-Smtp-Source: AGHT+IGWJmkhy/rD13TuXN52kL9e4wCnNOAkpBtgsdKirkLsXx5VzIY2hCVRx1eStSc2Eb5OO/jguA==
X-Received: by 2002:a05:6000:1447:b0:38d:b547:6650 with SMTP id ffacd0b85a97d-38dc8fe575emr3520008f8f.27.1738965688993;
        Fri, 07 Feb 2025 14:01:28 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20 1/3] RISCV/boot: Run constructors during setup
Date: Fri,  7 Feb 2025 22:01:20 +0000
Message-Id: <20250207220122.380214-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207220122.380214-1-andrew.cooper3@citrix.com>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without this, RISC-V isn't running boot time selftests when they're compiled
in.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1660821676

For-4.20.  Boot selftests are new in 4.20, and work in each other
archtiecture.
---
 xen/arch/riscv/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 38ca4f3baa1b..f2b6e684ac69 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -109,6 +109,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
      */
     system_state = SYS_STATE_boot;
 
+    init_constructors();
+
     if ( acpi_disabled )
     {
         printk("Booting using Device Tree\n");
-- 
2.39.5


