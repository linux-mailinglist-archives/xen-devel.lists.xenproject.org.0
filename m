Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DBCA74EB8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 17:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930971.1333474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyD2X-0001Af-Bf; Fri, 28 Mar 2025 16:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930971.1333474; Fri, 28 Mar 2025 16:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyD2X-000162-6X; Fri, 28 Mar 2025 16:58:41 +0000
Received: by outflank-mailman (input) for mailman id 930971;
 Fri, 28 Mar 2025 16:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QVst=WP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tyD2W-00011j-A6
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 16:58:40 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ebf8f6-0bf5-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 17:58:38 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e686d39ba2so61350a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 09:58:38 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc16aae90sm1665004a12.15.2025.03.28.09.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 09:58:37 -0700 (PDT)
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
X-Inumbo-ID: e4ebf8f6-0bf5-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743181118; x=1743785918; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CAhYZhOHWtuWy4tfyt8Ohp6UA9zEMu8kkCq/AbgncY=;
        b=BZPTS1jI5D/rdoCXWYtOpRX9S5O/HZmkeGDwxmbJOohl8NRQXSZbzY8drVi+KebAxA
         skNYVayMMchm/2W5ymGe7TvIFIWwDMgnkWGtiJ/C402tDI8N2P2GwTHJ8NQnXhjgIfrL
         KfnkAj2qyDRoHJ/lJ5eZwSN96IRi4/LorYKPf/oNX7uyymqSmc/w8D2mDNvO8DyKwvsw
         HqeNg7Gc4V6YEofZ/nfMoQTm07gAHbEJyIDJdiTblY5Nsa/BCV5DBOrNJv/KFEG9Gs0k
         hZqWux3+HEUt+gfoQFgCIXPM+u6iDVFwV/rjsW7V2GBZIC3hw3yVLdW/237qytAw75tt
         JkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743181118; x=1743785918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CAhYZhOHWtuWy4tfyt8Ohp6UA9zEMu8kkCq/AbgncY=;
        b=EtXb1ktDWwSCYFbh9bkYO3sTjlrMR02oEJRmITFaci73jLIPf+VSYOhQupYkpa7Dzu
         8SINPMKsKK9CqjJrQcFoMada8VmZ/gFs4PORznmy6bikDbu43gElr5Me3Kdxs5uQtkBr
         5dy5KPn7VhcQuDCpAiqrKTUkZaTb1YHGDlcRdylGNyoGGsvjh5eOyupeDS3zvGfNScbf
         G3RzNriddQWdbQO6B8b1PwLc1p3hLWbHKmq5GZ8l+jOycU2AkxzqEkXcYQPCy/z+XjL0
         MVK2kjANnTrdebbrHKXfBrYzaRLJaoATvilU16E+35esHgxEduMQpaXAAjKEorIvdgmp
         2Wgg==
X-Gm-Message-State: AOJu0YyxoIjbs2vwO1rsr0617+2ohzqew9rf9qxbyABkf0niQr5VOqVy
	++yNawC4iMyOs1zZF8PLfPcifkkYaZNwn0aDZ8IAKQhnk4kWtg8z8jd5gw==
X-Gm-Gg: ASbGncuhDK/CTqy7eoepgQi4fRKkt2ZnTWJttWR1QjJ0Nm5u3G99AUleDxTxR+xqU3s
	WOFnwJUZ1PHXl3F3rOyce/qCf2ycc3pd1ZTRCbIyiIkcpspX7pDyzFn++HmbR0VYUA3EyWAqPXK
	fKbJyPmfEP9jeDE80Rcl2zftR+fvwMLsLvogwItsdMLwn3/rNV6pAqyJRVqjF9bXl2E7RLQgXWk
	N/Yi2/WIF+wYarjJ4RbunPM1vrV5+J1tlHA3hTamrju1kHdqjxitTYHV9pIJzANpdLIeZb6lmqO
	7x+N9x5jHWAripd9ayP8ILziA4A28EBdH3BjctIohcB3Y+J8s6lNoi/GXLJgk3+4Q5eWxOoRA9R
	a4vzyTOFdN6x08PUgjrNXsOl7
X-Google-Smtp-Source: AGHT+IE1JMZb8jOcKsPR6IBjufgEsc/7vBhUd/tnkFR7SWMVKvFqEVCOFe2tzaLDmHDWLTEDzHp1UA==
X-Received: by 2002:a05:6402:13d3:b0:5e6:1a97:7d09 with SMTP id 4fb4d7f45d1cf-5ed8e496922mr8874452a12.16.1743181117356;
        Fri, 28 Mar 2025 09:58:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 2/4] automation: select APLIC and IMSIC to handle both wired interrupts and MSIs
Date: Fri, 28 Mar 2025 17:58:30 +0100
Message-ID: <e1124922c590043c71bb22d8264284439c80b711.1743165791.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
References: <4ddde60347edf6740fbc69b5739d099616f5b5ff.1743165791.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default, the `aia` option is set to "none" which selects the SiFive PLIC for
handling wired interrupts. However, since PLIC is now considered obsolete and
will not be supported by Xen now, APLIC and IMSIC are selected instead to manage
both wired interrupts and MSIs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---

Tests results:
  https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1734636979

Based on the source code of Qemu the support of AIA should be present from 7.0.0:
   28d8c281200f ("hw/riscv: virt: Add optional AIA IMSIC support to virt machine")

```
$ git tag --contains 28d8c281200f20a060c456c81fd1564f3d119fda
staging-mjt-test
trivial-patches-pull-request
v7.0.0
v7.0.0-rc0
v7.0.0-rc1
v7.0.0-rc2
v7.0.0-rc3
v7.0.0-rc4
v7.1.0
...
```

And in Xen's GitLab CI it is used 7.2.11:
```
$ CONTAINER_NO_PULL=1 CONTAINER=bookworm-riscv64 ./automation/scripts/containerize 
*** Launching container ...   
user@6a1d1f0077fe:/build$ qemu-system-riscv64 --version
QEMU emulator version 7.2.11 (Debian 1:7.2+dfsg-7+deb12u6)
Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
```
---
Changes in v3:
 - Nothing changed. Only rebase.
---
Changes in v2:
 - Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 automation/scripts/qemu-smoke-riscv64.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 8f755d0a6a..b2e112c942 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -6,7 +6,7 @@ set -ex -o pipefail
 rm -f smoke.serial
 
 export TEST_CMD="qemu-system-riscv64 \
-    -M virt \
+    -M virt,aia=aplic-imsic \
     -smp 1 \
     -nographic \
     -m 2g \
-- 
2.49.0


