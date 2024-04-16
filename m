Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B13C88A66DA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 11:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706797.1104193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevB-00013A-0l; Tue, 16 Apr 2024 09:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706797.1104193; Tue, 16 Apr 2024 09:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevA-000104-SA; Tue, 16 Apr 2024 09:16:08 +0000
Received: by outflank-mailman (input) for mailman id 706797;
 Tue, 16 Apr 2024 09:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+g=LV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rwev9-0000mP-QT
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 09:16:07 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f37d09b9-fbd1-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 11:16:04 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so5970587a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 02:16:04 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a17090657c200b00a524476aac9sm4654723ejr.108.2024.04.16.02.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 02:16:03 -0700 (PDT)
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
X-Inumbo-ID: f37d09b9-fbd1-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713258963; x=1713863763; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltubGLefEDolxtp8ox5INf6GbOLV1KLVErR1cmTeOMk=;
        b=KyQ7jHEC8IrY9g1pjTtqr41KDYGutyotZu7/E2VS998/FAv6CEolGlspOixpJ7PrkX
         Sqz+ik0JSprlwId/gpkbzT1ybOjj0ZbA/5N1Sb2Ejpg5H9JiLLYm+a0ryQLWWV5LQPgY
         d5vZoZUUVZj8NcLjp1eE9UiBt1HfIHn2hiFT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713258963; x=1713863763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltubGLefEDolxtp8ox5INf6GbOLV1KLVErR1cmTeOMk=;
        b=OmqhuqPY4RsgthObnStgKxdJ75e0SkNf2JX9h+svyRCd8aHA4kU6o0CLMnwg8RYeW6
         SXlS89j9NKlcm9nfP3sHONazy809p+RG19boqXEcHhCLd4upe1HKlKo832DecNILqSr+
         iWCFvb775pZndHyxrqDHmtxUzKYKA7+sMj9UtBE2ATbX1U0ZkIpaFnF1kR9xUspqmC5V
         vWU7on/veaqZ41bjDBHnbt+czfti9Y8N9UAX93Rub8RXSouZD/6UDWDhL1smJwAxq/mz
         s1aoluyllNyeao42wFe9ExqHqU382hBHoeCNrw5a1yUHidEHuHKR0YXvHJMbCifzxlSj
         OhGA==
X-Gm-Message-State: AOJu0YzTCjsFE7np3DWYerbbCOPxVEwL5Frv6wolSTRmje5K8PZDi+Jx
	Ckaobz/WyrWOiazqXXSOVevDDseS17S9nADvNOrCNCnIuXE6wVCy/Zf5kdyEwdrnuG2zrehAP1G
	2MWM=
X-Google-Smtp-Source: AGHT+IGSUftes4roGfXCGierUGaj8rcboY5VBtaY0FJucGwosyJlPdAOEwgQ0FZslzNrd+zrdN4wxA==
X-Received: by 2002:a17:907:7283:b0:a52:320a:632f with SMTP id dt3-20020a170907728300b00a52320a632fmr9265665ejc.27.1713258963638;
        Tue, 16 Apr 2024 02:16:03 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/5] x86/xen-ucode: Introduce --force option
Date: Tue, 16 Apr 2024 10:15:41 +0100
Message-ID: <20240416091546.11622-1-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor and introduce --force option to xen-ucode, which skips microcode
version check when updating x86 CPU micocode. A new hypercall introduced
with flags field to facilitate the new option and allow for future flags
as needed.

Fouad Hilly (5):
  x86: Update x86 low level version check of microcode
  x86: Refactor microcode_update() hypercall with flags
  x86: Add usage() to print out usage message
  x86: Use getopt to handle command line args
  x86: Add --force option to xen-ucode to override microcode version
    check

 tools/include/xenctrl.h              |  3 +-
 tools/libs/ctrl/xc_misc.c            | 13 +++++-
 tools/misc/xen-ucode.c               | 62 ++++++++++++++++++++++------
 xen/arch/x86/cpu/microcode/amd.c     |  8 +---
 xen/arch/x86/cpu/microcode/core.c    | 14 +++++--
 xen/arch/x86/cpu/microcode/intel.c   | 11 ++---
 xen/arch/x86/include/asm/microcode.h |  3 +-
 xen/arch/x86/platform_hypercall.c    | 12 +++++-
 xen/include/public/platform.h        |  6 +++
 9 files changed, 97 insertions(+), 35 deletions(-)

-- 
2.42.0


