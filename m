Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11553977E33
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 13:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798131.1208264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp4Au-0006Wy-5V; Fri, 13 Sep 2024 11:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798131.1208264; Fri, 13 Sep 2024 11:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp4Au-0006V7-1z; Fri, 13 Sep 2024 11:09:16 +0000
Received: by outflank-mailman (input) for mailman id 798131;
 Fri, 13 Sep 2024 11:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Mtl=QL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sp4As-0006V1-FD
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 11:09:14 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b326745-71c0-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 13:09:12 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso237273866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 04:09:12 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c61258sm856784766b.116.2024.09.13.04.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 04:09:09 -0700 (PDT)
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
X-Inumbo-ID: 9b326745-71c0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726225751; x=1726830551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dmBpaQ+iIGJvWiagGqJ7gg0dZzqCg5w432bFjnvFMI=;
        b=FzqZHDU5pc7AnwnltVK35z9Wya0p+Tq1jV6MfENoT4sOOAKPfFw1C3sqhF2Lm00fCY
         4S1S2CBeu7lruS5/a5xSfSnxpejFrcOveugas/ED+L6CuY1hy10YISH4qap2dK5ETjvV
         SQIS15+OOBzRV+ypEuKNNzqNjvF13VS0OO9yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726225751; x=1726830551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0dmBpaQ+iIGJvWiagGqJ7gg0dZzqCg5w432bFjnvFMI=;
        b=HME2eIIdtuGdvQjqHkgEfSLbFWvFrvtolezLFUzKP9PSB3vlHapfc3TR8Ct/onN19X
         Kc/aJ27NDanx45D1epJex7Zm4ZiYXK42lR9IhSio3Bb+QZVg2jUFFnwTO2ymQw0atZay
         ouR4nSxWXaniXk+2P7s0vgHxRjkP4beF1leSOgpdr7MigKNecuAY6se02w/FQ0ZGlz3J
         tIGp1i//+7Fp/FYn2AA+XjlZc7tprAyjdxX3Q0eJiyeSRwtbN93UmOXGUBcLz5c0Ii1o
         kmitUjSXWcX7wJU6EujYsmZwlN1AcQRnSwGGv86EaToMDPQjlZL4T8bcUy9d+qCm1RBA
         X53A==
X-Gm-Message-State: AOJu0YwZ/hpG9YLrLrnqtUqL7NC+a/dY3/XuTgxhE4VsLmCP8Rh7lOQ4
	gx3gvMdaLRtXWau9+sKICIL/HBfLYursAIFXXA1Lc6/jBIA8mzn7CjaRlnmfLoLQ2E5Os2MbrT9
	j
X-Google-Smtp-Source: AGHT+IFOSjDkZTEBQAMKmyS68hwSFEMJlxTIYoZg5ACW5bAD5DRZ3XIDgTC3UZ9V6tdfB7lGRxStww==
X-Received: by 2002:a17:907:d3cf:b0:a8d:5472:b591 with SMTP id a640c23a62f3a-a90294ac957mr625568766b.5.1726225750382;
        Fri, 13 Sep 2024 04:09:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen/ucode: Fix buffer under-run when parsing AMD containers
Date: Fri, 13 Sep 2024 12:09:07 +0100
Message-Id: <20240913110907.1902340-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Demi Marie Obenour <demi@invisiblethingslab.com>

The AMD container format has no formal spec.  It is, at best, precision
guesswork based on AMD's prior contributions to open source projects.  The
Equivalence Table has both an explicit length, and an expectation of having a
NULL entry at the end.

Xen was sanity checking the NULL entry, but without confirming that an entry
was present, resulting in a read off the front of the buffer.  With some
manual debugging/annotations this manifests as:

  (XEN) *** Buf ffff83204c00b19c, eq ffff83204c00b194
  (XEN) *** eq: 0c 00 00 00 44 4d 41 00 00 00 00 00 00 00 00 00 aa aa aa aa
                            ^-Actual buffer-------------------^
  (XEN) *** installed_cpu: 000c
  (XEN) microcode: Bad equivalent cpu table
  (XEN) Parsing microcode blob error -22

When loaded by hypercall, the 4 bytes interpreted as installed_cpu happen to
be the containing struct ucode_buf's len field, and luckily will be nonzero.

When loaded at boot, it's possible for the access to #PF if the module happens
to have been placed on a 2M boundary by the bootloader.  Under Linux, it will
commonly be the end of the CPIO header.

Drop the probe of the NULL entry; Nothing else cares.  A container without one
is well formed, insofar that we can still parse it correctly.  With this
dropped, the same container results in:

  (XEN) microcode: couldn't find any matching ucode in the provided blob!

Fixes: 4de936a38aa9 ("x86/ucode/amd: Rework parsing logic in cpu_request_microcode()")
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>

Split out of joint patch, and analyse.

I couldn't trigger any of the sanitisers with this, hence the manual
debugging.

This patch intentionally doesn't include patch 2's extra hunk changing:

  @@ -364,7 +364,8 @@ static struct microcode_patch *cf_check cpu_request_microcode(
               if ( size < sizeof(*mc) ||
                    (mc = buf)->type != UCODE_UCODE_TYPE ||
                    size - sizeof(*mc) < mc->len ||
  -                 mc->len < sizeof(struct microcode_patch) )
  +                 mc->len < sizeof(struct microcode_patch) ||
  +                 mc->len % 4 != 0 )
               {
                   printk(XENLOG_ERR "microcode: Bad microcode data\n");
                   error = -EINVAL;

Intel have a spec saying the length is mutliple of 4.  AMD do not, and have
microcode which genuinely isn't a multiple of 4.
---
 xen/arch/x86/cpu/microcode/amd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index d2a26967c6db..32490c8b7d2a 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -338,8 +338,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
         if ( size < sizeof(*et) ||
              (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
              size - sizeof(*et) < et->len ||
-             et->len % sizeof(et->eq[0]) ||
-             et->eq[(et->len / sizeof(et->eq[0])) - 1].installed_cpu )
+             et->len % sizeof(et->eq[0]) )
         {
             printk(XENLOG_ERR "microcode: Bad equivalent cpu table\n");
             error = -EINVAL;
-- 
2.39.2


