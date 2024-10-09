Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1436E9961CB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 10:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813816.1226858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRgm-0004F4-RF; Wed, 09 Oct 2024 08:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813816.1226858; Wed, 09 Oct 2024 08:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syRgm-0004CM-N7; Wed, 09 Oct 2024 08:04:56 +0000
Received: by outflank-mailman (input) for mailman id 813816;
 Wed, 09 Oct 2024 08:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLvJ=RF=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syRgl-0004CB-8o
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 08:04:55 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a473e56-8615-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 10:04:53 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9957588566so381304366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 01:04:53 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e7856bfsm624370366b.138.2024.10.09.01.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:04:51 -0700 (PDT)
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
X-Inumbo-ID: 2a473e56-8615-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728461093; x=1729065893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rJIohxYS8sXhXvG0bNZdOREui8BEAzrVfJEVGX/hu0=;
        b=hSPhNwqgUxlChHCdVlMvVFYkFLRAYP4FM3nCEUDFG11AsstjSjJHMgvCsoPPaEVv8h
         i7neuEzResQu9ZlfKBQRX+nFRpiqclTE1MgajKWhEWoAWqxrQ9Hy0wzWh9dEaxyp79RP
         bzP8ZP5GB/V3TdlT90J1LYEDF+o1QtcZM+JJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728461093; x=1729065893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rJIohxYS8sXhXvG0bNZdOREui8BEAzrVfJEVGX/hu0=;
        b=t8F/U+tY53UEhuErDq2dbJODPgOfd9K3QdWOMJh8i8Kpbs/bURg08ky7e9XAqb2Mc7
         G0XuSbLxyqeolfhGhTt52NMuOoRakA+p8jpemqBGFjN0UcZvH6bJZWZcG/7S1GlA+oMW
         OMrGGpHIwfXmM3l0C/eVLI3VkR+ZdUayvAqXPwXIO/5LayzjS61Dvan12k/boqMcFV14
         TkVPgqa30t5o9A7b2xkhz+aswOR/J7aa/s5UXfqm8jqtyAD7TDZiDqHWe9N4TLDat9uB
         ukxV19CFgeEz86FM38s8oWLqdEXKp/J7zbWobxLzAs4ljiwrHHZo6h0mI1ZWho30zNO/
         0+4w==
X-Gm-Message-State: AOJu0YwU9z256YkOhJ40nAZQQg17YDIqASnuTu3bIDsfQ574Rj9xaPaO
	WlNywRydcX6BRHRiwz0/YPXSL6rQRONJ4rZNy3Pr561iRUxSFdy6h+bzlIZY+CEriGhsj1y/yHq
	n
X-Google-Smtp-Source: AGHT+IEM2OhbG4lwAUaKyLhPx30Dxltnu0DXJm4fQi+KtfmezXjhjaLQBhS841JUrzi7GUR3zrLDPw==
X-Received: by 2002:a17:907:6e8f:b0:a99:7539:2458 with SMTP id a640c23a62f3a-a998d3a24e4mr158540366b.65.1728461092593;
        Wed, 09 Oct 2024 01:04:52 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v8 0/2] x86/boot: Improve MBI2 structure check (was: Reduce assembly code)
Date: Wed,  9 Oct 2024 09:04:37 +0100
Message-Id: <20241009080439.2411730-1-frediano.ziglio@cloud.com>
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

Frediano Ziglio (2):
  x86/boot: Align mbi2.c stack to 16 bytes
  x86/boot: Improve MBI2 structure check

 xen/arch/x86/efi/Makefile | 2 ++
 xen/arch/x86/efi/mbi2.c   | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.34.1


