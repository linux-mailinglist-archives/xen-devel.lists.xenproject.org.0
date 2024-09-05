Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7F896D9D3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 15:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791092.1200869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCCX-000290-RC; Thu, 05 Sep 2024 13:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791092.1200869; Thu, 05 Sep 2024 13:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smCCX-00025r-O6; Thu, 05 Sep 2024 13:07:05 +0000
Received: by outflank-mailman (input) for mailman id 791092;
 Thu, 05 Sep 2024 13:07:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smCCW-00025l-V1
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 13:07:04 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bec6fc25-6b87-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 15:07:03 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so82158866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 06:07:03 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbb093sm136972766b.11.2024.09.05.06.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 06:07:01 -0700 (PDT)
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
X-Inumbo-ID: bec6fc25-6b87-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725541622; x=1726146422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYHuu3XHvUy7/D/FiHxJJ28U6xLGuMlMmkVe5mEwpxY=;
        b=j4kBloJZA4vh4qvXUguvvAS4FahomYlflxoudjAUz1P0+uaAXSDnB/ejlkigfvMdHq
         gAgcqEP0wBn3qCLQlKJAw8tJKbpWLOLhuNY/XJI09/0jkQiNmCkrPLJqXS9Mm+Xzi3Es
         1wZNENi8hxCizXL+etBlFZUSJ5P8o20/XDric=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541622; x=1726146422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYHuu3XHvUy7/D/FiHxJJ28U6xLGuMlMmkVe5mEwpxY=;
        b=d0wb12lxWS6/2BHwZ2vP2t9PPNLacI8mPFL/tHbibNWy48Ajj62mTzyCZfvNVBeRQb
         DRaKKEMX45Q0M+EUCtahZ5cfloJ9mqvP8SNxrHWSyMpOvObyDHDZ/6Y20GH+spefJdqy
         3qRqaW8Yj2SIwbEVsWAVMSTxvo8Cx03HtHgz8jQ+vvPmGwQFHXJOymy+FcOoN0BLay7L
         oKEkwrHigSXI74ANxEbKvM6aVwgsVyzvMWVhNB3xSQDcE7DLXHOtgzTawokig9MPa+6x
         0YXs6vEr0OzFX3TF3OFWyQkIF5+Vxz9JzOgr40C1US57bCOY3Kbpo0PqbRoAAkQWCNeD
         cSmg==
X-Gm-Message-State: AOJu0YziKK9d95mCl+mbJCcsRMPDX/O429HHAHJXSM+nCXhC86P5psE5
	5V2uBxUUNQE1IVgPupOQzG3Wx7EotDTxuPwgpy1Byq3rOg9eeIlqItgtn2cuOPM1wPcxAvD02Sy
	9
X-Google-Smtp-Source: AGHT+IHV29H6HBnrjCp0EQqVQSUo/SgywRHMRByIfjHwwyk1zpFwN5YPuEOeGntzrrLrWm6tAuLmpQ==
X-Received: by 2002:a17:907:7e98:b0:a7a:97ca:3059 with SMTP id a640c23a62f3a-a89b9568fb7mr1261913966b.34.1725541622025;
        Thu, 05 Sep 2024 06:07:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 0/3] x86/trampoline: Header cleanup
Date: Thu,  5 Sep 2024 14:06:54 +0100
Message-Id: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This started while inspecting a preprossed file for bitops, but it turns out
is relevant for Frediano's 32bit boot code changes too.

Its header file juggling, and documentation with observations relevant to both
the ASI and Host UEFI Secureboot work, hence the extended CC list.

Andrew Cooper (3):
  x86/acpi: Drop acpi_video_flags and use bootsym(video_flags) directly
  x86/trampoline: Move the trampoline declarations out of <asm/config.h>
  x86/trampoline: Collect other scattered trampoline symbols

 xen/arch/x86/acpi/power.c             |   4 +-
 xen/arch/x86/cpu/intel.c              |   2 +
 xen/arch/x86/dmi_scan.c               |  12 ---
 xen/arch/x86/efi/efi-boot.h           |   4 +-
 xen/arch/x86/guest/xen/pvh-boot.c     |   1 +
 xen/arch/x86/include/asm/acpi.h       |   1 -
 xen/arch/x86/include/asm/config.h     |  19 ----
 xen/arch/x86/include/asm/processor.h  |   2 -
 xen/arch/x86/include/asm/setup.h      |   2 -
 xen/arch/x86/include/asm/trampoline.h | 120 ++++++++++++++++++++++++++
 xen/arch/x86/mm.c                     |   1 +
 xen/arch/x86/platform_hypercall.c     |   2 +
 xen/arch/x86/setup.c                  |   1 +
 xen/arch/x86/smpboot.c                |   1 +
 xen/arch/x86/tboot.c                  |   2 +
 xen/arch/x86/x86_64/mm.c              |   2 +
 16 files changed, 136 insertions(+), 40 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/trampoline.h


base-commit: a2de7dc4d845738e734b10fce6550c89c6b1092c
-- 
2.39.2


