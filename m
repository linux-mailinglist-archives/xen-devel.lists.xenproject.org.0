Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DB7A4501F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895995.1304668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3SJ-0007jx-6O; Tue, 25 Feb 2025 22:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895995.1304668; Tue, 25 Feb 2025 22:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3SJ-0007iV-3d; Tue, 25 Feb 2025 22:31:11 +0000
Received: by outflank-mailman (input) for mailman id 895995;
 Tue, 25 Feb 2025 22:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tn3SH-0007iP-Qc
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:31:09 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 353d83f8-f3c8-11ef-9aae-95dc52dad729;
 Tue, 25 Feb 2025 23:31:08 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38f3ee8a119so3052044f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 14:31:08 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba532d33sm1561315e9.15.2025.02.25.14.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:31:07 -0800 (PST)
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
X-Inumbo-ID: 353d83f8-f3c8-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740522668; x=1741127468; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuY4PdT0lHKzMCO5Prv5GwHdImEWrRlGnfQTWuwn7Pw=;
        b=TBs7XVUqOuDKzFKpiCD4mcBOztnj7Av2N4qrFIOmktrj2kfOwtD9C47+J/F0opLB7k
         aCO5V9Qj+wTTFag0jIx3HvQiuAKVLj2DyElKba7NZzrhISWPg1gS0t2uw7/cNHrDatKH
         J/MiaY+96QSoyMzjM90cLX1mF8HrQKPnGSyi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522668; x=1741127468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuY4PdT0lHKzMCO5Prv5GwHdImEWrRlGnfQTWuwn7Pw=;
        b=YvwTxZTGZfNd5t4LSE4JNqkKCaXKqhM2E2lTu7jmcRrL9NyUf9L7crp6THHiXJSyAi
         kO7e02HrHROEk4AcJ3GOyFICQV1FUPH0/ZGiUOKLBdhRA9jL7UGTtUt5XKWS798TuJX8
         Mw9ujmbat4fJuRR6Ce5HCw5Y5CNw2yLZ7wLhz08qYGkInFdIKV/KQYG/xKNblAbIKFC3
         xBuuVV4P/FfyDFDJWl8aM0vVOMG1o8ZdJ+WPoUGtCKGX8Dsoxq2guCTDMkaX1bt/tQgU
         xPSfHABEHP0ZQIlN8KYC6gPPH+IEFk6AHwwDDr3+ATZ+JgqWFToZ/xgNfvM7dkAzDr6U
         DZ4A==
X-Gm-Message-State: AOJu0YxG8Ii7SKJD4vWAkKQnuqksq9ruoJ6FLsa3fftvm44chAa7uGKq
	k1cdKG4lQeaHw7CLuWxqVqja3ERVEsqYbT1F+2KrfEcRrllnvrM8HVFTHW4Od6saWYQL/8VRhZE
	z
X-Gm-Gg: ASbGnctGn3SG7ZUpjs5bxUp03SKbnNqQnkNsaHUk0ee0+LryjKJ6sbk1NXE+5XnQ0uQ
	7qKS52ASuuWcEgrfrhw7EB1J6lyM85gvinYzGS1JSzYjIZ5nmEvtOHG5l3xFZJEYBbZAR0NMPV5
	zlvNXKN+tcX96IpPpkraZJDq6DJ8VMDxkA3lXybDpvjUhg1VQJbyPgtV1I0y4jYkkMmzL3AzXYC
	ahvkMnDt586Ir1XovCw5fIoMYFHh9g2B8mKhF1rnN8ublRDz7RoH3SBpe8P8+JlRt81oTx6WouC
	zNtfq3ODX9UqdbYDqIkoOgXTcBqvSnlkcY7Ww7gxnG0ez6FTpRgqZGI5nkHedl54s4d99ME2kFh
	ZQ1Yw5g==
X-Google-Smtp-Source: AGHT+IFduDy0NSjgB7bjeGYJnjZpA3IeIDycNKtNKo7RbAJyzHbLXeLUNLKaOp4URSHAL48r3sMQqA==
X-Received: by 2002:a5d:64a4:0:b0:38d:ddf2:afe9 with SMTP id ffacd0b85a97d-38f70772a59mr12519739f8f.1.1740522667775;
        Tue, 25 Feb 2025 14:31:07 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/ucode: Cmdline fixes/improvements
Date: Tue, 25 Feb 2025 22:29:03 +0000
Message-Id: <20250225222905.1182374-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Yet more fixes from the overhaul.  This fixes cmdline parsing, rewrites the
cmdline docs for clarity, then drops a cmdline option which is of dubious
value.

No practical change.

Andrew Cooper (2):
  x86/ucode: Adjust parse_ucode() to match other list handling
  x86/ucode: Drop the ucode=nmi option

 docs/misc/xen-command-line.pandoc | 64 ++++++++++++++++---------------
 xen/arch/x86/cpu/microcode/core.c | 58 +++++++++++++---------------
 2 files changed, 61 insertions(+), 61 deletions(-)

-- 
2.39.5


