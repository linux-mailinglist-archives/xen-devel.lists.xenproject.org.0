Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F93E6A1E00
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501140.772779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZeo-0007DY-Bj; Fri, 24 Feb 2023 15:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501140.772779; Fri, 24 Feb 2023 15:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZeo-0007BI-7E; Fri, 24 Feb 2023 15:06:46 +0000
Received: by outflank-mailman (input) for mailman id 501140;
 Fri, 24 Feb 2023 15:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVZem-0006Ou-Ll
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:06:44 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c83172-b454-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 16:06:44 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id y14so7341641ljq.4
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 07:06:44 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 d23-20020ac25457000000b004d863fa8681sm1492443lfn.173.2023.02.24.07.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 07:06:43 -0800 (PST)
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
X-Inumbo-ID: d9c83172-b454-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWdB+WhVKhbKIc4Ieg60li/sx7jyPhuZ3hOGCvSZofI=;
        b=i3735LWE9VNOsxiDAfi7bdl1+CjDSmrUFuH9jCeC/+mmv5RwMtAr3zp6GiElGraKmr
         C8d8D31tKEujTdEC2XU5xthFrqRktVGEQMw7hMBkk38hsjdzxuyTVlW7+prsoqLAmAdw
         0DbOdlkGvYQgZEWJH7nMwRXm8ZrE5BFvAXAbQ1tZGWzDSNisS1T5NwJbcdRplWGpjBuA
         +9S30q5f2VhqjsWf8zVZt8HZB0OtNE7mJMq79nEs67GvfOS5anmI17B0Z88OtcqHA5Vl
         ZXxy+jYRc2FfnrQRiGQPwtkBXUcCDpCCmN9qI4bQU2vny/LaBA2uHZjSLMpBXD+LHHDE
         YjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWdB+WhVKhbKIc4Ieg60li/sx7jyPhuZ3hOGCvSZofI=;
        b=d/gcpQcuuzmk86aMBd/ssJYLgxIx2h6kcUYywCDfLwYMsZA26qc3EFkpOwz0VkVbr6
         f/f/QZEUoxmMir8HkiiFhPj6GKmxdTBGE/DdLVxQIBpdmHaHR3lAM5qoUjPEK5SzTBRC
         XsWBK8vwbPKu36nQpWIhuVXqK0w9NEMMgNzWkjL4pnldB9Co7JxppQU63+bpn3f7HKhd
         mSIUi3GQd1pSqjtf/ob6KqrHAibd8w/gyTJ6IcIixI88w7bKgYVoYF1kMyQUUwU2yw6P
         AhIZmwBokDGMgNq9ycyx3o1j5+Gq/kELG3mu/95OFMXJ2EwMPgJeiA95w6U6hmBWqHaj
         mFQw==
X-Gm-Message-State: AO0yUKXHI+dQHkoq9CGeyGaO15JqS0twPRG0pM8eJaiJpp+Ybo0qURCi
	j6i8Jo+aIQFXX7PYL0usgQyQ/I7kSMI=
X-Google-Smtp-Source: AK7set8iTORSXQRVgsqy08wdFvBsYysGaVjpQnbN6EJsnRPi7bOszKhjVPpe7vkNSMR1CAiv7PFbag==
X-Received: by 2002:a2e:a4a1:0:b0:294:694f:54 with SMTP id g1-20020a2ea4a1000000b00294694f0054mr5981834ljm.0.1677251203837;
        Fri, 24 Feb 2023 07:06:43 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 3/3] automation: update RISC-V smoke test
Date: Fri, 24 Feb 2023 17:06:35 +0200
Message-Id: <38ddf88eabd9cc36c332d6a27c6ee1242d33df19.1677250203.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677250203.git.oleksii.kurochko@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The smoke test was updated to verify that MMU has been enabled.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/scripts/qemu-smoke-riscv64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 02fc66be03..01cd08e407 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -16,5 +16,5 @@ qemu-system-riscv64 \
     |& tee smoke.serial
 
 set -e
-(grep -q "WARN is most likely working" smoke.serial) || exit 1
+(grep -q "MMU has been enabled" smoke.serial) || exit 1
 exit 0
-- 
2.39.0


