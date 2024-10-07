Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1B2992E9B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 16:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812033.1224706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWn-0003Ph-Bm; Mon, 07 Oct 2024 14:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812033.1224706; Mon, 07 Oct 2024 14:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxoWn-0003M9-6f; Mon, 07 Oct 2024 14:16:01 +0000
Received: by outflank-mailman (input) for mailman id 812033;
 Mon, 07 Oct 2024 14:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxoWm-0002yM-0e
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 14:16:00 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad1e8014-84b6-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 16:15:59 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so43340481fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 07:15:59 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05c119esm3386204a12.55.2024.10.07.07.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 07:15:58 -0700 (PDT)
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
X-Inumbo-ID: ad1e8014-84b6-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728310559; x=1728915359; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIJLH+pNn+xqq0KYYUmnx97/J/kG6GN6HUy92X5OMa0=;
        b=Cenvume+/1eXLkAOGI8TFA2+yxll8HKGlSohKjhNQ3JHfXXSZu1OCLKXxSKHbCbg3k
         UN3aCk1GO5kNfJdER1uW4zC66qlb43gr+adpGXfmI9DFbezXuSMKWAqz/5szn0fpJfhz
         H31wkAuMnRLshRQP8Oc3K/oa5pgq5nxnBeuAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310559; x=1728915359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIJLH+pNn+xqq0KYYUmnx97/J/kG6GN6HUy92X5OMa0=;
        b=BKefQE2d4hv5YSqvUzH480/kp1eLrQOwkcsZpuAyMsxjDIusN5444kU6nXFKJlI6rQ
         ReZV0hDNW+NiD2lkibeXGb1nkZcz+plWWa12zC7CNhDFUSFi6gQGYMmfpUw0ec21I2wj
         KddRwrkjSyAGFw9y2g3Eh7Ve3DIta9g1tz0qx15WA/BKIyJIun3XAMBePCAYz9dcVdst
         aBSiSZC52Gg2QXMGJy4MRKET2nKPCiPvFuukii/N1+uZbu93017m/bQ0AZ02arJLhbTT
         EassB7GRF9Nm28zmkIvt3q1XCgIj4GQozMwfzIDbSem88oFfNtl46lCWyvCsZ2OlCwgp
         m8Ww==
X-Gm-Message-State: AOJu0YzAGhjiWZ1aTnRQoIycO7Wlw7jMUXRrmWTp5cuLq1ovnLda+AAp
	2Do/rePpkx6b0m8RRSXv2Iagx7QDyXFS9ImPRVKrkV89DjhczAhvmX/wHDQi1PCVFVhGGjVKKMR
	j
X-Google-Smtp-Source: AGHT+IFNbTQpUUEqggAFsPrlPpU+tdz/i1iNVix2p3NCtxBXowfuW1xn2FiwJJO1fIXkltbQdVMzQw==
X-Received: by 2002:a05:651c:210e:b0:2f9:cf64:aaf6 with SMTP id 38308e7fff4ca-2faf3c30324mr51177771fa.17.1728310558686;
        Mon, 07 Oct 2024 07:15:58 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/6] x86/boot: Rationalise .gitignore
Date: Mon,  7 Oct 2024 15:15:35 +0100
Message-Id: <20241007141539.1899350-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
References: <20241007141539.1899350-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Strip all related content out of the root .gitignore, and provide a
more local .gitignore's with up-to-date patterns.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 .gitignore                   | 3 ---
 xen/arch/x86/boot/.gitignore | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/x86/boot/.gitignore

diff --git a/.gitignore b/.gitignore
index 5a75b204f7..dae97ebfd7 100644
--- a/.gitignore
+++ b/.gitignore
@@ -247,9 +247,6 @@ xen/.config
 xen/.config.old
 xen/.xen.elf32
 xen/System.map
-xen/arch/x86/boot/mkelf32
-xen/arch/x86/boot/*.bin
-xen/arch/x86/boot/*.lnk
 xen/arch/x86/efi.lds
 xen/arch/x86/efi/check.efi
 xen/arch/x86/efi/mkreloc
diff --git a/xen/arch/x86/boot/.gitignore b/xen/arch/x86/boot/.gitignore
new file mode 100644
index 0000000000..a379db7988
--- /dev/null
+++ b/xen/arch/x86/boot/.gitignore
@@ -0,0 +1,3 @@
+/mkelf32
+/*.bin
+/*.lnk
-- 
2.34.1


