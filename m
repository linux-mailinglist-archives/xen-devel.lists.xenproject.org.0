Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B2C99E0F6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 10:26:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819030.1232334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0crz-0003vR-Te; Tue, 15 Oct 2024 08:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819030.1232334; Tue, 15 Oct 2024 08:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0crz-0003t5-QW; Tue, 15 Oct 2024 08:25:31 +0000
Received: by outflank-mailman (input) for mailman id 819030;
 Tue, 15 Oct 2024 08:25:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tju4=RL=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0cry-0003el-B2
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 08:25:30 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06d61194-8acf-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 10:25:25 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so466614266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2024 01:25:25 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29749663sm41590566b.64.2024.10.15.01.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 01:25:24 -0700 (PDT)
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
X-Inumbo-ID: 06d61194-8acf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728980724; x=1729585524; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qkb2FwdmNFA27HJZq+hvWg6nvn+M86auMXi8pWNoFV8=;
        b=C9scrtoGjYCCObYOmvM4EqgpCI9Vg9AJsSBO5Ohtn4J+7kW5Sq6HXHLlglEyxARMO8
         3zLcl5rm+jy/u0dTyal/kFR9O2RttxZfrswPpl6wBXxvruu0A0vmLfBK1MWU2Fqf9X9E
         o0u+zD1uRR1atZBqaSQ+CiWFDOuXMdDb9dVbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980724; x=1729585524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qkb2FwdmNFA27HJZq+hvWg6nvn+M86auMXi8pWNoFV8=;
        b=jEpUxz9XF+LQckA8mLycoC8zh5PCeMlJzSsM+LQYQqUain8BakgSPaKVTGP1WMsGeX
         KAkdAEO+L/vHICB1NxapAKHjWyfp4pKCAZt1JCQQpX7rCRg0ZFQYhsm3wH5RKcBtb/Pr
         9sbv8XuEYXurJQ3GYrJ3/t7ccddI/l8wP7GHWg5GJOd3RxdLr2hNtr55z6nmvtBoU2Hd
         DI+0HdqhK5NqFf7nCOOQgUqtF1ZIwUzmjnUTPn0Qbsb6CJliLtzxaNf+bSgzaij2whNf
         WPG8ibLgpkL5N1bv1v+a1RoLtHbrHW1XvUVpTlfnkMfGg1RaulvVtrUbMj6UIg5CEIV+
         LsSg==
X-Gm-Message-State: AOJu0YwQE1eI1q+JbxHeaYcYH+XjMvtJyNPjJ7gflkSQkul346tDUuR7
	9iOUSvdOkp+3YOi+BsOgPNr6/go/SoYSN0xQ0QFB5CTXKjcS+YzNULBzJlgcOor8LccxCCN0IG2
	f
X-Google-Smtp-Source: AGHT+IGaBW/SgOot01Ss7xVwubLfZCvl/2HPfjfne1MHDIx1jfLcYeB/mLhlDuMsr9Yp8Vw9S07uSg==
X-Received: by 2002:a17:907:97c1:b0:a91:158b:1c23 with SMTP id a640c23a62f3a-a99b87f3669mr1131596166b.9.1728980724515;
        Tue, 15 Oct 2024 01:25:24 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 0/2] x86/boot: Improve MBI2 structure check (was: Reduce assembly code)
Date: Tue, 15 Oct 2024 09:25:11 +0100
Message-Id: <20241015082513.2477806-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series came from part of the work of removing duplications between
boot code and rewriting part of code from assembly to C.

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

Changes since v7:
- removed merged parts;
- add required stack alignment.

Changes since v8:
- added "Fixes:" line;
- typo in commit message: Adler -> Alder;
- add ".init" to mbi2.o;
- reduce difference in Makefile.

Changes since v9:
- minor messages updates.

Frediano Ziglio (2):
  x86/boot: Align mbi2.c stack to 16 bytes
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/efi/Makefile | 4 ++--
 xen/arch/x86/efi/mbi2.c   | 7 +++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.34.1


