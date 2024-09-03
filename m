Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094B1969C7F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 13:53:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789029.1198567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slS6N-0003yS-Rn; Tue, 03 Sep 2024 11:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789029.1198567; Tue, 03 Sep 2024 11:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slS6N-0003wQ-OK; Tue, 03 Sep 2024 11:53:39 +0000
Received: by outflank-mailman (input) for mailman id 789029;
 Tue, 03 Sep 2024 11:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TnF=QB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slS6M-0003un-Mb
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 11:53:38 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27fdc753-69eb-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 13:53:38 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c23f0a9699so3157813a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 04:53:38 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c251a8719fsm3196060a12.31.2024.09.03.04.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:53:36 -0700 (PDT)
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
X-Inumbo-ID: 27fdc753-69eb-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725364417; x=1725969217; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4InCMFHxmalswkqItHnDSE8LleHBiof1C5Zu3ugQko=;
        b=kTS126kYLaqUim5VFYyg0MAhdDXDHVNoj+SOYPF6vz9Qa0Odtc6nvGlH4HCZ4G5s6z
         b4yjWx5b+PMeYRUiu7XDEp/ZAOWAK0omUvgoSX2dhK3Ib2+1QnjabQfcTJ8broIMT+J/
         dVuKmDbRTxGBXoC2iKXjFVbWgDcTSWlmHvVn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725364417; x=1725969217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4InCMFHxmalswkqItHnDSE8LleHBiof1C5Zu3ugQko=;
        b=r/0s+m6hU0/ZH35jBwlQ4D0RgThyHlsk1M/erRmEf/AUj8fG5YlkTASCrGBOHZd0Jg
         TJYhxxFteFhfEvXsgGhRjJ/ARLKtOOHBZI91Thylxrjw+mPaaHSOT26pDPcAkUtmzdcv
         jHnnGRh7KBrj2yDz+YInabwD1trz79yFAi+Zz7zw+LjEAbx29tXjZZlraWy/lJnI9XH2
         xnV9H/SjQlKfRXy7Znq8PUpJIWL5pGwGVKLiyPFh/wI/vbCf85r1uDdCpOzYF9JQDcBk
         0DAxv95w26RW0C9FatUnRdSiiffscXaPt2MhAZJ8gWpD0LZm0SrEvyFPPJmlbj4XZGbh
         yu7g==
X-Gm-Message-State: AOJu0YyUIpAqMbW231z9RfJB1FmtsmaTXuAqPtdNLAM7h3AWUPzo8pv8
	lfo/fi0prRKFUUaTGC06SJ8TyqkHjyvzINfhngYVaMfzRu+7jUae3oKXYI6n3PGXObAtv/gMm2i
	o
X-Google-Smtp-Source: AGHT+IEujUjgvdxVyMB7+BXvcMeFCIYo/tpeuo9Ezvpq12+kOWSHuUZkx1x0EPVX/6HcabGy32DQMw==
X-Received: by 2002:a05:6402:1e8c:b0:5c2:4dcc:b937 with SMTP id 4fb4d7f45d1cf-5c24dccbb4amr5415393a12.24.1725364416822;
        Tue, 03 Sep 2024 04:53:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2] x86/boot: Fix include paths for 32bit objects
Date: Tue,  3 Sep 2024 12:53:34 +0100
Message-Id: <20240903115334.3526368-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
References: <20240903104940.3514994-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most of Xen is build using -nostdinc and a fully specified include path.
However, the makefile line:

  $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic

discards XEN_CFLAGS and replaces them with CFLAGS_x86_32.

Reinstate -nostdinc, and copy all -I (and -Wa,-I) arguments from XEN_CFLAGS.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>

v2:
 * Copy all -I from XEN_CFLAGS

https://cirrus-ci.com/build/6740464739549184

Note that this misses the overall '-include ./include/xen/config.h' but it was
missing before as well.
---
 xen/arch/x86/boot/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 03d8ce3a9e48..1ec2b123305d 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -14,10 +14,7 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
-ifneq ($(abs_objtree),$(abs_srctree))
-CFLAGS_x86_32 += -I$(objtree)/include
-endif
-CFLAGS_x86_32 += -I$(srctree)/include
+CFLAGS_x86_32 += -nostdinc $(filter -I% -Wa$(comma)-I%,$(XEN_CFLAGS))
 
 # override for 32bit binaries
 $(head-bin-objs): CFLAGS_stack_boundary :=
-- 
2.39.2


