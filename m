Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193009D5C04
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 10:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841793.1257295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3T-0003gz-KE; Fri, 22 Nov 2024 09:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841793.1257295; Fri, 22 Nov 2024 09:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEQ3T-0003fB-Gq; Fri, 22 Nov 2024 09:34:23 +0000
Received: by outflank-mailman (input) for mailman id 841793;
 Fri, 22 Nov 2024 09:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6Qa=SR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tEQ3S-0003Ql-8q
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 09:34:22 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2476440-a8b4-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 10:34:18 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-382423e1f7aso1238562f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Nov 2024 01:34:18 -0800 (PST)
Received: from localhost.localdomain ([87.115.149.99])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde16abasm21427775e9.19.2024.11.22.01.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 01:34:17 -0800 (PST)
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
X-Inumbo-ID: f2476440-a8b4-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MjkiLCJoZWxvIjoibWFpbC13cjEteDQyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYyNDc2NDQwLWE4YjQtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMjY4MDU4LjYwNDM5NSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732268057; x=1732872857; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0Aj5W+j63+NuGcn0ZB3t9CEq3oH9AJf5/KiiQiC1a0=;
        b=DltuG8wiFM11m+gahYtY7Dw01gyRWqw99t3Wbn3+JpQSMuf7D5p5E04UP7Lmq+C7iw
         rKsXZw+5/yegJ/nynOgejcDNI/gCAeRQ9+hoiJ2LFehgIPw41csRv9/E50pB3r5P5JTr
         +g9+sCrsYdDjFnU0AG5LM6b7OrYqyJAvlV2rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732268057; x=1732872857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0Aj5W+j63+NuGcn0ZB3t9CEq3oH9AJf5/KiiQiC1a0=;
        b=K658k3WzL8xo2M7Psx+PEYc4yNmDh0zcFA4AQk8d18mZim4IFRWaQFy+hbTxzHbjtP
         8HIyCcON5qcM3uE3KwPlp79OLTO8SiE6q/7DUGhM6QfOgPSEDyL6sFY+ov84fx7D1//E
         sX/t3sJYyyv75XG6b+FfsTYcHjlEaZiffuWjVeEvXaZNksK8DR3MuqOa+FIU14F28xw/
         K5TRgPl7beUDiOpvsytYUfKdxFzneHVtgwyrcahHyTQPAtYLjXPePt3AAIRURVzQhfAK
         KPMOnvT3K5NDDUgjdk4GrJrcvKX/4FO0bMVrvab10OEFPxKM0Yk6v2SQO5eu7kcUmodD
         84hw==
X-Gm-Message-State: AOJu0YzCfoA5NhOdowC+On3Aqhz8PfksH2ozl1Q3HyTm+sN0OrOPWUKw
	yamx6QVC6T/c4ILceIXC6JGUoq4Lm5D4Xnnf09ERYv4MWivuJoP5VXecd/DXrox7yA9/3bNs/WV
	8F5I=
X-Gm-Gg: ASbGncsRR0vQBkNNKqZOKvQOT9WUkzERoIHO8tUfzAEWuK7NomQUMxYRoybJQapzBsz
	zC62gpxl46AJaz7DOeI99Nr75yQbbPgsh+WVcR/vrgsaFIbM5uUgZNv0RCF2/cHEb8+Iys5pgBt
	8I933IBkBZfBqjC5szTc3VBYdtVw+ueTPk578N1TSK/jhjRjrLz4lA4LKqltCQda5tzBfxw1w3R
	iOogXNKevoflcMFd432YHa3U45nPlpkmmYmEOxuoSl2/RtXpmPMjDtGEKa/Eyr+C1Spwg==
X-Google-Smtp-Source: AGHT+IEoKDi872bJ7XgCPBqMWAU668/ao8l/n2sRLkR94Hw3rysbJY3JLdtZx/GavkwDxgBVA/W7lA==
X-Received: by 2002:a05:6000:389:b0:382:37b2:87ee with SMTP id ffacd0b85a97d-38260b581b7mr1949072f8f.21.1732268057653;
        Fri, 22 Nov 2024 01:34:17 -0800 (PST)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/4] Use an include/boot directory to override headers for boot code
Date: Fri, 22 Nov 2024 09:33:55 +0000
Message-Id: <20241122093358.478774-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122093358.478774-1-frediano.ziglio@cloud.com>
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all headers can be used by 32 bit boot code.
Allows to override some headers, we don't want to mess up with
main headers as most of the code is only 64 bit so the easy stuff should
be done for 64 bit declarations.
Boot headers should be 64 bit compatibles to avoid having multiple
declarations.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index d457876659..13d4583173 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -18,7 +18,7 @@ CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
-CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
+CFLAGS_x86_32 += -I$(srctree)/arch/x86/include/boot $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
 
 # override for 32bit binaries
 $(obj32): CFLAGS_stack_boundary :=
-- 
2.34.1


