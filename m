Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E726C91696A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747737.1155258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6ae-0008CD-1t; Tue, 25 Jun 2024 13:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747737.1155258; Tue, 25 Jun 2024 13:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6ad-00089i-UW; Tue, 25 Jun 2024 13:52:07 +0000
Received: by outflank-mailman (input) for mailman id 747737;
 Tue, 25 Jun 2024 13:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6ad-0006cc-4d
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:52:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c0d25c5-32fa-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 15:52:06 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d1782679fso6741315a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:52:06 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm521042666b.148.2024.06.25.06.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 06:52:05 -0700 (PDT)
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
X-Inumbo-ID: 1c0d25c5-32fa-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719323526; x=1719928326; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EblDpIRqRIu3BssT9RZ6RoIeDsTXprjPCYVIxMbl8gI=;
        b=EozEWgb0+wOnZ2mDjIiM4cZZGiLvuwVpGFKAn3SmGtOIRHEndWdw9qS9Y2NDYDwQ4Y
         UwyecA4SxwD0tZEqcf7EGjh3wfQ+IluhcJRwKXoVJ3z1jUzpao5YbqrkEH+2X2QzfdKU
         JQOiqfhW1tq0hN2dt3VaKJfiISR818+80rxf3h6dGuoLZFjHqVhitC2sCnViwgQmRYcz
         qV9Uc0pzIJNtfIksBs/Yw/olg4lc1vc5map/D5J1eiwSvaaGrDMdYksxMczuOXZNbE2x
         0vnaGjPjnyj49PyCIA6B/+1GojKD3Bq117wLt/JpUqewif+VS3PsZVZYeIWVokLv3tVJ
         AqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323526; x=1719928326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EblDpIRqRIu3BssT9RZ6RoIeDsTXprjPCYVIxMbl8gI=;
        b=QLhGAzblM1ZPkZ7pqonTrtgayB3U1pStm2Ic2iCxxxUO5/FH3lwmeS0cwshLqvXxX1
         gugZqNEV/kYEt+CtsFMW6fNPsMDqkcq0eNCascvOHClfhn8Z8BvfEUI9fLFM568euiwd
         MYSc/3JX5LjCeaK6hb+CxZvsxEkSAZ532G/iaTfIhgHNT4270mq9gW1dXDITnPoy4sZ8
         9Ru7jx+whv7jkPbWYawCMnFaVsmQTMjosEumcKCm+D2FKt/VKGDQ5nvIt1Bl4I3Yzya1
         fKlXIrY6t7och2AT47UGNChflsXKWqRVctD66HdeBRlgiHcLU29DoWeBxZ8jGWaoFWTo
         iprA==
X-Gm-Message-State: AOJu0Ywa1t2JLZC1takviX1l2WxGzMFVf97Tk3xqWHZ45idRuITCDYWI
	p5+QYtCyz5kXd6F3260OcWfHOB84e3XKRO8PIAYYLw9yaQWAdHcH1ggRQgFx
X-Google-Smtp-Source: AGHT+IFQTMqbBSaOKEkbk9WjjORj/cTDkO5SVUJaZVfMFzNjweNugVIyDCceDNj3AhdImrkJdPGWCw==
X-Received: by 2002:a17:907:c78e:b0:a72:4b31:13b5 with SMTP id a640c23a62f3a-a727f855270mr42506766b.54.1719323525897;
        Tue, 25 Jun 2024 06:52:05 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v13 08/10] xen/riscv: change .insn to .byte in cpu_relax()
Date: Tue, 25 Jun 2024 15:51:50 +0200
Message-ID: <b5ccb3850cbfc0c84d2feea35a971351395fa974.1719319093.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719319093.git.oleksii.kurochko@gmail.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The .insn directive appears to check that the byte pattern is a known
extension, where .4byte doesn't.

The following compilation error occurs:
  ./arch/riscv/include/asm/processor.h: Assembler messages:
  ./arch/riscv/include/asm/processor.h:70: Error: unrecognized opcode `0x0100000F'
In case of the following Binutils:
  $ riscv64-linux-gnu-as --version
  GNU assembler (GNU Binutils for Debian) 2.35.2

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V13:
  - new patch
---
 xen/arch/riscv/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 6846151717..0e75122efb 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -67,7 +67,7 @@ static inline void cpu_relax(void)
     __asm__ __volatile__ ( "pause" );
 #else
     /* Encoding of the pause instruction */
-    __asm__ __volatile__ ( ".insn 0x0100000F" );
+    __asm__ __volatile__ ( ".byte 0x0100000F" );
 #endif
 
     barrier();
-- 
2.45.2


