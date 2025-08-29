Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E2B3B4BC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100803.1454109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urttx-0001Mp-Pz; Fri, 29 Aug 2025 07:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100803.1454109; Fri, 29 Aug 2025 07:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urttx-0001KY-NS; Fri, 29 Aug 2025 07:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1100803;
 Fri, 29 Aug 2025 07:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urttw-0001KP-On
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:52:00 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b082a31-84ad-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 09:52:00 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3c380aa1ad0so910631f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 00:51:59 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d1052db1f0sm434638f8f.23.2025.08.29.00.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:51:58 -0700 (PDT)
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
X-Inumbo-ID: 0b082a31-84ad-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756453919; x=1757058719; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=38d4rZaLR2nKxik/b4Zebk+B0WHyMTDWVQk0KLCvpMQ=;
        b=X/Me1dE/twwhlJpWkxlk2YIIJAG1HhuJesvXqkeJg634phrwMvOaeHJWiSmdWkz3WE
         R5E1s4fuLPM/jXMMlf15c60mvY2jHCwlkZG+eVNbLmFrHYeZhy6c8EmMcwN/vqU+XK0r
         v05fdZAcH/WDl2NXOnUXziql1I7CNO2jE/k5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756453919; x=1757058719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38d4rZaLR2nKxik/b4Zebk+B0WHyMTDWVQk0KLCvpMQ=;
        b=NGQ/qsydMKtQTxiffVOGwi7eVQ4kEXcMEZBGM9HNovNauky9AeOTTebtRP2/Sh14gj
         IgiP5CZ54UnsndZetI9/IN+W0WqlKqX2T06gFmCnkRPCNRswWrUN9/krBb+sgJCqWLfx
         HsytdbDdMglO6JlSVYWjBsU4yySuEqJcNXjMN66+k14nZ0Pd7lTz9KYa0pH0W+zhrkF1
         j4koNyGYYUIV4hN2ChWhbCs6L3NfCcNoIz+gCQKkvvOJqFW2vi2URNAjrBsy3CYFHbv4
         +lGglKSr65hSfDtZ6IegLrWGzZcmWjrILKxGNjd6pO+IFz0Gf3IOCtYS/0WRsGXhX4B3
         TbTg==
X-Gm-Message-State: AOJu0YyyCb6BV9Rno4n/TlmU78TZRInvrP8JPK0V9pvPZo5LA41c/TVs
	+v6jb/PalGQinaFNobF6Pv9+VmGbyfmf9KfIMYG2abt6Wt198ntvxRZ+NyPeTSbJKN+NyNOc9l1
	N6dQj
X-Gm-Gg: ASbGncsmWr2g77aMQbK24nY862ZzxZvLyQIQNYSiuKtfuWWt9Srq/vGptDvoyPDM/3M
	1PO0jNY/DBkl7pn1/wqUf+52/vTH7f0EeSk2y8yuz8lnE41G7PsF8UNwGKgjd2OKa2H2kH+WUuQ
	7uoPcBZ3IeHromCPFE5gLQ9O6ekJxHUI/2nN5GhOVRwgz8wIeSYwWib1GLSEJstA9i2SLf9Anq+
	EeqRNATS1J4FwCZ6K1eS9gt32JX5nD5sDIMKWJHtmnzNdoHHV3oAXWN04gkpjihG7EzLnqY+gds
	/UkOWJC7dooxgFM2ZdADBBglyltC5jVV5zbA8ilLeB8t4qSgGA23dkJBclyLAbQU+Tt7eAGdzJE
	NEvUmdMRnlll1Q19ovy/vX2z6biUTXqvTo0NFN9TUPVsP+N6CAaNf1NOXPr6W5TgHfA==
X-Google-Smtp-Source: AGHT+IH76RoW2TQwDKkKpPzynJPFNXyh/+lygZzxdRUao7nA0W8NyxXW03yTfr3gG28PSkzbFuLV2Q==
X-Received: by 2002:a05:6000:2891:b0:3cd:96bb:b948 with SMTP id ffacd0b85a97d-3cd96bbc28fmr4991561f8f.47.1756453918681;
        Fri, 29 Aug 2025 00:51:58 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/pvshim: disable PDX compression in PV shim defconfig
Date: Fri, 29 Aug 2025 09:51:54 +0200
Message-ID: <20250829075154.48787-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no need for PDX compression given the memory map provided by Xen
to guests is contiguous, turn off the feature by default in the PV shim
defconfig.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: c5c45bcbd6a1 ('pdx: introduce a new compression algorithm based on region offsets')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/configs/pvshim_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index c58c29adb0bf..24f4e4857dde 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -7,6 +7,7 @@ CONFIG_PV_SHIM_EXCLUSIVE=y
 CONFIG_NR_CPUS=32
 CONFIG_EXPERT=y
 # Disable features not used by the PV shim
+CONFIG_PDX_NONE=y
 # CONFIG_XEN_SHSTK is not set
 # CONFIG_XEN_IBT is not set
 # CONFIG_GRANT_TABLE is not set
-- 
2.51.0


