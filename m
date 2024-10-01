Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC8A98B97E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807971.1219739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sva1t-0001lV-6v; Tue, 01 Oct 2024 10:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807971.1219739; Tue, 01 Oct 2024 10:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sva1t-0001jz-3w; Tue, 01 Oct 2024 10:22:53 +0000
Received: by outflank-mailman (input) for mailman id 807971;
 Tue, 01 Oct 2024 10:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i7H1=Q5=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sva1s-0001jj-1R
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:22:52 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c156599-7fdf-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 12:22:49 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so805995666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:22:49 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bceesm681772966b.187.2024.10.01.03.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 03:22:48 -0700 (PDT)
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
X-Inumbo-ID: 1c156599-7fdf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727778169; x=1728382969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUcmc6Mu2acDS7R5soe8iHrJBA3YNhBJnOk4lBLiwKQ=;
        b=e+OmQVaW2cIYrLy0PipAxTlyWAlqzQ8EhA/scXyFprl9581hKDW7py6cMa5lOeOB1G
         T7Wu5r6mxfSRHIGT1YfWiv+rCsfujxZd2Qwvy/llPkL90+iJ71bP2+jcelOZ7fJJYfO4
         ZbqKI7Z5l5T4HkwBP8VSY2GVVa1L9DbmvFgyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727778169; x=1728382969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUcmc6Mu2acDS7R5soe8iHrJBA3YNhBJnOk4lBLiwKQ=;
        b=uF5/ngHfynOyFKCvuzRjI8ijXlKDj59SonkscFC8KqJgZKs5CBKkVKpJ+Xwh/E2REh
         LH6mP/fkqI13qUSQ+j9HSaYCFoArGm+9crq7moF1COQgyNvhZNsFz7OsQu25B1wR+iMg
         87JSXM1174f8n4ffOsmimrn/ea0jt5RqS9ReVhMVbog52z7dfs0Cmk40pGt/3ucA8gPp
         aavWfZ3X/nbYaYXkScvJeh6RPo8QYnnjeio3Xk/HbrfPv5fPRBCmVCs6fNL7ZskkMqk5
         r0bv0aYGgsaOA0e171Ol+DK+L1aon2il7ESXss9qnjc9GJcqi3K2+WN6APrzNWOjcnhF
         oxmA==
X-Gm-Message-State: AOJu0YxFLQMBHxJdT4jFjKlaW3LFpiIDv/0X7w9isQ/kGChAoIoEAesa
	voJQLo2RGGsHi9/teS/8ecKQT9btmU3TRRl7zMHhv1+ac1kF4mkanrInVoQCpBuHYR/gpQrxvh9
	m
X-Google-Smtp-Source: AGHT+IGM3oiRAZWP3Yh57gYLyxG8rdQf6QI0EzQ9bvtGLBsIczXlvBfUScpmjgXArtV0xbnlLLbI5A==
X-Received: by 2002:a17:907:7f8a:b0:a86:82e2:8c64 with SMTP id a640c23a62f3a-a93c492a76amr1688049766b.35.1727778169071;
        Tue, 01 Oct 2024 03:22:49 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v7 0/2] x86/boot: Reduce assembly code
Date: Tue,  1 Oct 2024 11:22:37 +0100
Message-Id: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications between
boot code and rewriting part of code from assembly to C.
Rewrites EFI code in pure C.

Changes since v1, more details in specific commits:
- style updates;
- comments and descriptions improvements;
- other improvements.

Changes since v2:
- rebased on master, resolved conflicts;
- add comment on trampoline section.

Changes since v3:
- changed new function name;
- declare efi_multiboot2 in a separate header;
- distinguish entry point from using magic number;
- other minor changes (see commens in commits).

Changes since v4:
- rebase on staging;
- set %fs and %gs as other segment registers;
- style and other changes.

Changes since v5:
- fixed a typo.

Changes since v6:
- remove merged patch;
- comment and style;
- change some pointer checks to avoid overflows;
- rename parse-mbi2.c to mbi2.c.

Frediano Ziglio (2):
  x86/boot: Rewrite EFI/MBI2 code partly in C
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/boot/head.S       | 146 +++++++--------------------------
 xen/arch/x86/efi/Makefile      |   1 +
 xen/arch/x86/efi/efi-boot.h    |   7 +-
 xen/arch/x86/efi/mbi2.c        |  66 +++++++++++++++
 xen/arch/x86/efi/stub.c        |  10 +--
 xen/arch/x86/include/asm/efi.h |  18 ++++
 6 files changed, 123 insertions(+), 125 deletions(-)
 create mode 100644 xen/arch/x86/efi/mbi2.c
 create mode 100644 xen/arch/x86/include/asm/efi.h

-- 
2.34.1


