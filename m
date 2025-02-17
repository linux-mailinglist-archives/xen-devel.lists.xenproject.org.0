Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D635CA38CA3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 20:44:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890816.1299975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk72l-0006MQ-18; Mon, 17 Feb 2025 19:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890816.1299975; Mon, 17 Feb 2025 19:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk72k-0006Jg-T6; Mon, 17 Feb 2025 19:44:38 +0000
Received: by outflank-mailman (input) for mailman id 890816;
 Mon, 17 Feb 2025 19:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGAw=VI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tk72j-0005w6-6w
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 19:44:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98c73aec-ed67-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 20:44:27 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so32474485e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 11:44:27 -0800 (PST)
Received: from andrewcoop.. (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06d22csm161547025e9.22.2025.02.17.11.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:44:26 -0800 (PST)
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
X-Inumbo-ID: 98c73aec-ed67-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739821466; x=1740426266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nc2CIfoUyhnM2J8lcuiEwHkY+/RuqVIOqDK2tbwB/w=;
        b=iaV/oMwukuusawAueE+9avEkVHwDzGWzxsdqBiea7mEmhl0o19ynuDPyY4xQP0J/ww
         /uMXlxwr28q6RnNjZmfkXt/PtqdBbm0oHC1aGLRAEotCetlbzq1uae6YIuiPDi2deovw
         BL/CTAj2AQqkDY/Nmn6vMl58c29eE7g/kF6LY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739821466; x=1740426266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nc2CIfoUyhnM2J8lcuiEwHkY+/RuqVIOqDK2tbwB/w=;
        b=uDGrm8Ijifp4w78hvL+JwbzCSd9hmjL6PPUKtI16fmUu1WpaOfveVczP96JIuXS5VD
         FZRLDVLtyvTgM2JHSgJgBuH9hvCesf2zH9b4O93NqN8OPWY/+oV5NCr2ODqGm0WkrYxH
         yQmo5EtUDc1nJcI/tzlI0coOGeGnH4itBxPj1YdyuuQ1FKN+oSJeO/GeE95HFo0ZgdrK
         cQonNS6vkEkzBdiu0f3599gAggFwhi1xV04PATIuMtxiMCPcpbv9vZlHC2nH1wmI2lKG
         oNI5FDo4wLbQa2feJSlFAF/sP88BHIgljDk4AtC/iAIfFxuR3wFofBItjutmjgs170Hk
         L4/g==
X-Gm-Message-State: AOJu0YxLzbLZ90G3UwSKRJgW9QfKaX05NEcKigh351dAlZ2eN4+A2vDe
	Nn5ams1y23V5SAoe0Ao8i6Dh/v5f+UCuEyS2uGGYkWiYd2IwtILQqiN/suNXTYQplyikSpao/i5
	H
X-Gm-Gg: ASbGncvY60I7UVhsYUdLjkX4vxUTmukcr3mD725zbMW5kHApZd6PtMswRfManeQYOQR
	MZHThI7hTkn49thCG3CF5lKNNnUSDf6fpFYPboas9i1gKP5KEuuxSdtSJW2jnvFA3qknkfww3gR
	sMyEKRiiu9TIjwehkPgEsssFHxP5oT9wOcIbLgsgN0Mnk9dShhH+eIcrIeJGTwC4+GcoSawrTAc
	+gebR0+WoNm2RIY7SH+mNBJLjlscBVS3E5cLYUeiSnIiitlQ7EINYLosVyCXSXzzN5WaV4VSmjA
	RjzIwndv2QgDfjEk1cRvGD11jrvPze0CB9PC86t2D1W+Urs5ccet
X-Google-Smtp-Source: AGHT+IHPQrS6NoNQOy53+RfSFZIMq6lDhPKeOkmnJeQf8NByg3WieH1WtlLy2WfSZj8tH2r/SBfupw==
X-Received: by 2002:a05:600c:3baa:b0:439:9274:8203 with SMTP id 5b1f17b1804b1-439927483d7mr5700375e9.6.1739821466643;
        Mon, 17 Feb 2025 11:44:26 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.21 2/3] xen/console: Optimise parameter order of vprintk_common()
Date: Mon, 17 Feb 2025 19:44:20 +0000
Message-Id: <20250217194421.601813-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217194421.601813-1-andrew.cooper3@citrix.com>
References: <20250217194421.601813-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For ABIs which pass parameters by register (all cases that we compile Xen
for), inserting new arguments on the left hand side involves shuffling all
other parameters along by one register whereas appending a new argument
doesn't involve shuffling of existing registers.

Reorder vprintk_common()'s prefix parameter to being last.  This is a marginal
improvement on all architectures:

  Function                              old     new   delta
  vprintk                                18      12      -6  x86
  vprintk                                32      24      -8  arm32
  vprintk                                52      48      -4  arm64
  vprintk                                52      48      -4  riscv64
  vprintk                                80      72      -8  ppc64

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This taken from a security series, hence partially reviewed already.
---
 xen/drivers/char/console.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2926c97df9a4..f98142d9b9b9 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -910,7 +910,7 @@ static void printk_start_of_line(const char *prefix)
     __putstr(tstr);
 }
 
-static void vprintk_common(const char *prefix, const char *fmt, va_list args)
+static void vprintk_common(const char *fmt, va_list args, const char *prefix)
 {
     struct vps {
         bool continued, do_print;
@@ -964,7 +964,7 @@ static void vprintk_common(const char *prefix, const char *fmt, va_list args)
 
 void vprintk(const char *fmt, va_list args)
 {
-    vprintk_common("(XEN) ", fmt, args);
+    vprintk_common(fmt, args, "(XEN) ");
 }
 
 void printk(const char *fmt, ...)
@@ -984,7 +984,7 @@ void guest_printk(const struct domain *d, const char *fmt, ...)
     snprintf(prefix, sizeof(prefix), "(d%d) ", d->domain_id);
 
     va_start(args, fmt);
-    vprintk_common(prefix, fmt, args);
+    vprintk_common(fmt, args, prefix);
     va_end(args);
 }
 
-- 
2.39.5


