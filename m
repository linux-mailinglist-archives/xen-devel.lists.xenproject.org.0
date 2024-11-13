Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5AC9C6B81
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835155.1251003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9iP-0008LT-CI; Wed, 13 Nov 2024 09:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835155.1251003; Wed, 13 Nov 2024 09:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9iP-0008Ip-5n; Wed, 13 Nov 2024 09:31:09 +0000
Received: by outflank-mailman (input) for mailman id 835155;
 Wed, 13 Nov 2024 09:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tB9iN-00089l-IG
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:31:07 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff85a9c4-a1a1-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 10:31:02 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9404c0d50so7911532a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 01:31:02 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03bb7530sm6929630a12.43.2024.11.13.01.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 01:31:00 -0800 (PST)
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
X-Inumbo-ID: ff85a9c4-a1a1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImZmODVhOWM0LWExYTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDkwMjYyLjIyMTEyNiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731490261; x=1732095061; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V45cRxalXAMwikIF0CGAp2DsYKYu9U1aXYD5gxcRrBE=;
        b=XVXBj9Hv8CVTD2yfCX+PD1Mj8zpu0xP7fNjwwiMmaLMCT+DBqJBgGAxZPmeyKSqrvU
         NKmlzsnHvpYH1r7EVpoHKWKe6XSLUXDSpCxW9gQe+cMoDz60IwRFXff2UJcUs777KirR
         Rc5m9bNsRNJnRG/+wsFdbP97vaWMqI3mzaVFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731490261; x=1732095061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V45cRxalXAMwikIF0CGAp2DsYKYu9U1aXYD5gxcRrBE=;
        b=uisetVhjyB5Wk6f/5y+EHxVGXTfKnWj//TJpn2t1wZbWHljpS9zG+YUbaJb+d8adPr
         Trz/FDIMXpqgoA610CJ921PygUEu5Onoa57R1Gyt9sBcUuL6YKCeqcHWQvcl96XILmHG
         UGhdeKeW8GWl4D31pSuEXY+x0aaKYwI66I528iHd/qrqv1VZcmzVWHE9vLG+fzzm8/Tr
         B+nEEyrdveOXcc6T/JhDUZ/7BD37HazU6MjkEOhI/6Sh1rnYYUPZXQm3kLJlv/T2cJoY
         VX1ue45+4p2zKfjLS6oCBV94fGl1GVy4V5djougHHkFEQdWRH6dd9M67pb+krJCocekG
         Wz8Q==
X-Gm-Message-State: AOJu0YwNyfVIbwBbweey/2VXuy2UjbUw7Trszb+T8oQzrx5FbSmVAj+Q
	8dWmiC0DvRWZxneZ7Z1+7sUK2TS8LyzooUUYJwhxqAPTEZimG7xK/Xgx/o/UHA9713pJzfCKJOa
	g
X-Google-Smtp-Source: AGHT+IFbxmZML3aeWKdPy4HmXwfgZpUVIaGBcAQ001zrAxCj2PwJE3M8z3nIa4RSko11y+ZEiV1v2A==
X-Received: by 2002:a05:6402:2550:b0:5cf:466f:d474 with SMTP id 4fb4d7f45d1cf-5cf4670c998mr7462379a12.16.1731490261216;
        Wed, 13 Nov 2024 01:31:01 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 0/2] x86/trampoline: Layout description improvements.
Date: Wed, 13 Nov 2024 09:30:56 +0000
Message-Id: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Andrew Cooper (2):
  x86/trampoline: Document how the trampoline is laid out
  x86/trampoline: Rationalise the constants to describe the size

 xen/arch/x86/boot/head.S              | 21 +---------
 xen/arch/x86/boot/reloc.c             |  5 +--
 xen/arch/x86/efi/efi-boot.h           |  2 +-
 xen/arch/x86/include/asm/config.h     |  5 ++-
 xen/arch/x86/include/asm/trampoline.h | 55 ++++++++++++++++++++++++++-
 xen/arch/x86/xen.lds.S                |  2 +-
 6 files changed, 62 insertions(+), 28 deletions(-)


base-commit: 38febce5b35a7a4391906499b2046f01ec0129ca
-- 
2.39.5


