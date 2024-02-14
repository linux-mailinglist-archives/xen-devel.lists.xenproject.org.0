Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE891855136
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 19:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681127.1059738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJbD-00066U-0x; Wed, 14 Feb 2024 18:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681127.1059738; Wed, 14 Feb 2024 18:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raJbC-00063r-UK; Wed, 14 Feb 2024 18:03:10 +0000
Received: by outflank-mailman (input) for mailman id 681127;
 Wed, 14 Feb 2024 18:03:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hroU=JX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1raJbB-00063l-FY
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 18:03:09 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ec180c2-cb63-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 19:03:08 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a389ea940f1so692839366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 10:03:07 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 vo10-20020a170907a80a00b00a3cfd838f32sm1945011ejc.178.2024.02.14.10.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 10:03:06 -0800 (PST)
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
X-Inumbo-ID: 4ec180c2-cb63-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707933787; x=1708538587; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqnw7qzhukxFfthztomyRM3QJeXI218bAfnlsrQi+Vw=;
        b=XdRYBPi/HVnndhkmA9QSR+gKFc9VXaqa6d6kleweZ8bJtg8GsPBMMuDaVFLskjRN18
         pBhNvJZFOTlFANNb0J5DJeen4vlvGn0jM/v1M5AW3cCaj3FTiDfdhn+22wbkf9mIeTob
         STLrEUumUqhgAbauNrSUG3PT3msVXh0AGVQDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707933787; x=1708538587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xqnw7qzhukxFfthztomyRM3QJeXI218bAfnlsrQi+Vw=;
        b=IvMp3GQ+Oj8Zpl+UeXin2YDzSXMd0iN7oEoTmf88hlzJ5WayN3znFvTX1Kv91IHG/s
         t720/xQGDKKEX7HttzUpC7LIXMBV9uukZPFtei2kiNxzf4uy70vIMe0Wjs/JHdlrIp0w
         sxOn4shVhYWvytNvnwcXHVqFeG0b0qMmzxvpz5MdjtzV8k1n46bGBV43fWmewg7oOq27
         LS+GmXcf5rlbBzwhz50IvQOqTaOEgkfLuke0DHgoqFwIcdZePOKtBNCC/87nm8udQtNz
         XNGsDOsW/DdScLiltFKltTLg2AHfQOqVDhNOnjxTu2YIRC9P+BZmEZ2st3lxakpJbuxe
         sq0g==
X-Gm-Message-State: AOJu0YyrrHcxemjzVTFNpOMcgUAe7SAWoZKQvVZL9JnAw2LgPZk6QNeB
	AdJ8pyeN8JiLgfJGwXNwUWZh78Vc5fhfBxxcp9OMb04FcV0KpRu7pErRHgbUGiGnT40fci1Y3gj
	J
X-Google-Smtp-Source: AGHT+IEAVzvrd5KoAqINQyYVTbYT321zhmHgHBRgOmlJfwbvml1mfCIdG+A7w2OYYdiMNArfJmnf7Q==
X-Received: by 2002:a17:906:eb50:b0:a3d:765:7bdc with SMTP id mc16-20020a170906eb5000b00a3d07657bdcmr2281592ejb.25.1707933786731;
        Wed, 14 Feb 2024 10:03:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTgblWqrgd79opw33d5uqe+v5ZQD1gL9JC+/97ThOvIRJaTKWYyhWaz/zDzkOVRlNNCrI3Q9JfK2H/k/2FFLqWj9SdPSm38zKOCJEZ1WTnuyPOBbsAOnYku50sktTL4yiMPdDJMQhmc6fFUe6KpEKxIN7bxABgOFyo3N7IEbYquAm4PWOxF43+oT3af7QQZO+ilDAwtY+HeuJXF6SUhEuuyI3e2B2ftrcbdeK4IAZ4MsxhA6D+2jWwH9qlAxEIkeIbtFeuBSeHX0kXqw==
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] build: Replace `which` with `command -v`
Date: Wed, 14 Feb 2024 18:00:39 +0000
Message-Id: <20240214180039.57527-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The `which` command is not standard, may not exist on the build host,
or may not behave as expected by the build system. It is recommended
to use `command -v` to find out if a command exist and have its path,
and it's part of a POSIX shell standard (at least, it seems to be
mandatory since IEEE Std 1003.1-2008, but was optional before).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---

Notes:
    v2:
    - also replace it in xen/build.mk
    - mention that it's a mandatory feature since edition 2008.
    - some other rework of the commit message.

 xen/Makefile | 4 ++--
 xen/build.mk | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 21832d6402..767e47d6c7 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -25,8 +25,8 @@ export XEN_BUILD_HOST	:= $(shell hostname)
 endif
 
 # Best effort attempt to find a python interpreter, defaulting to Python 3 if
-# available.  Fall back to just `python` if `which` is nowhere to be found.
-PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
+# available.  Fall back to just `python`.
+PYTHON_INTERPRETER	:= $(word 1,$(shell command -v python3 || command -v python || command -v python2) python)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
 export CHECKPOLICY	?= checkpolicy
diff --git a/xen/build.mk b/xen/build.mk
index 26dd5a8e87..0f490ca71b 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -1,6 +1,6 @@
 quiet_cmd_banner = BANNER  $@
 define cmd_banner
-    if which figlet >/dev/null 2>&1 ; then \
+    if command -v figlet >/dev/null 2>&1 ; then \
 	echo " Xen $(XEN_FULLVERSION)" | figlet -f $< > $@.tmp; \
     else \
 	echo " Xen $(XEN_FULLVERSION)" > $@.tmp; \
-- 
Anthony PERARD


