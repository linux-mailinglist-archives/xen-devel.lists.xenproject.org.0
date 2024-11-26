Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2999D9B6A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 17:27:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843847.1259430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyOh-0000WL-U6; Tue, 26 Nov 2024 16:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843847.1259430; Tue, 26 Nov 2024 16:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFyOh-0000Tz-Oe; Tue, 26 Nov 2024 16:26:43 +0000
Received: by outflank-mailman (input) for mailman id 843847;
 Tue, 26 Nov 2024 16:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J1p=SV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tFyOg-0000RJ-DZ
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 16:26:42 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35fe1140-ac13-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 17:26:38 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ffb5b131d0so33842991fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 08:26:38 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffaf7c0c9dsm15210421fa.87.2024.11.26.08.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2024 08:26:37 -0800 (PST)
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
X-Inumbo-ID: 35fe1140-ac13-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmUiLCJoZWxvIjoibWFpbC1sajEteDIyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM1ZmUxMTQwLWFjMTMtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjM4Mzk4LjI3NjM3Nywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732638397; x=1733243197; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JNmpMEa1I2HbYgq85XJQ8rPr6DFQn2aF6f8rja9RxU=;
        b=PebG24KqJemuFFP7vO/B90sJWiE/ufFcXlzifRa7BiCkrNqZUqB+3JozpQqnPscjNj
         Aiq8DVLys6wZfqzjR2vPkmuFWsK7khhikqxF8X9U2GY2NrFg7Cg95ttgu+JPf9adQleb
         ymX+H68G4HW8FHu5TYsh5pbJ5b5IlQnEz6LHiMR3BpmqQ1GVn2tzbbdwcEDrtjVJo2HJ
         DV8gjmzrrLgk9ipfRHMU8AucH2pRiLuWu6IeldsPftTNJ6gdHbyIZpi5sZl277vaKapD
         w7kPTAfcuFpxBuOuT3Qm+p1dns8M6IxM3Omov3+sr24h/HTlFNGXcZ551ozmlwKaBdKh
         op+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638397; x=1733243197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JNmpMEa1I2HbYgq85XJQ8rPr6DFQn2aF6f8rja9RxU=;
        b=QQ9AoURz+O5fP//ADAC8B/eeDxXC5B98KlTDWPTT6YU23/QDk8wVs8bCwUf1N8j5Vr
         gzCa1LJix2LYJjojinfyNauWYGIxlzgND3SNCr+y5Onh64dmugZ6RWegsyJK8iKO0ypR
         NUsh6WozsKWZC0d0CLdMuoP6eLqwI3vLnd/3L/xhxUIC4+0GAwhUrdue5NfA5hkyvaP0
         0AdmQgfFB4rvdAJ9pgqA9sTWP8HrSzhjGEWlovjXFo4U5KsnlpUR5YrYYS9+SAfRebL/
         5CTpECnQD/K7D10j5slNUJTaTDqrH04fzLYBdbsSLUyjOMW8leaXy2ueTXVNW+1vrKdW
         pkKQ==
X-Gm-Message-State: AOJu0YyiE3LK7oB3FLaBL01twtqGU9V8NwmUQn5Av2aAhlr0FyJJFIj2
	U+Flc8rutAmR1Zr8pFvFXToMLeRae3EOGwMQahHkIi7+7qgbCczNvcwphg==
X-Gm-Gg: ASbGnctoNNZGVj+hyIv08/kyoQkxiwK+wW5M55ippa9HDAXdpA6KYnhU6yL05tow72f
	whhc52URUpqowp3Dhwb6Vt9h6jcgv676e30BeYooqRxxIujdkNqH5TLr1iXgEIR0RQ9yBAq7+O/
	EJXFJUg+zoWjyPJeKxL4b5/de/lBU9VU5K9W0cvNUGEfhOB4IieDgQXKECQ2bNAC2zB41gEsXdo
	agf5q8Hc4WJl0vr5nBIV/0j4KkkIPCC1X/Q8CNuHdgxVxRl9h4=
X-Google-Smtp-Source: AGHT+IE400j2/zlSatUkiV4YI1YpzTqMZIW3TMOMmcWHon2npWmVjg3Xy1do0E3JDpQ6UoUvZBMApg==
X-Received: by 2002:a2e:a548:0:b0:2ff:ce49:111e with SMTP id 38308e7fff4ca-2ffce491362mr14296241fa.39.1732638397290;
        Tue, 26 Nov 2024 08:26:37 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 3/3] xen/riscv: finalize boot allocator and transition to boot state
Date: Tue, 26 Nov 2024 17:26:32 +0100
Message-ID: <7ba4661fc4a56ce65dbf4e07d1d051f8acbba6b9.1732637041.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732637041.git.oleksii.kurochko@gmail.com>
References: <cover.1732637041.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a call to end_boot_allocator() in start_xen() to finalize the
boot memory allocator, moving free pages to the domain sub-allocator.

After initializing the memory subsystem, update `system_state` from
`SYS_STATE_early_boot` to `SYS_STATE_boot`, signifying the end of the
early boot phase.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change in V2-V7:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/riscv/setup.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 3652cb056d..9680332fee 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -65,6 +65,14 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     vm_init();
 
+    end_boot_allocator();
+
+    /*
+     * The memory subsystem has been initialized, we can now switch from
+     * early_boot -> boot.
+     */
+    system_state = SYS_STATE_boot;
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.47.0


