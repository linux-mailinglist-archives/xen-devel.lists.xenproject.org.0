Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82DDB3C30A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 21:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1102020.1454815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us4nC-00023z-Ia; Fri, 29 Aug 2025 19:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1102020.1454815; Fri, 29 Aug 2025 19:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us4nC-00021f-Fr; Fri, 29 Aug 2025 19:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1102020;
 Fri, 29 Aug 2025 19:29:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4pU=3J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1us4nB-00021Z-56
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 19:29:45 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83fe1a0c-850e-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 21:29:44 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3cdc54cabb1so960549f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 12:29:44 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf34491a65sm4324054f8f.56.2025.08.29.12.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 12:29:41 -0700 (PDT)
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
X-Inumbo-ID: 83fe1a0c-850e-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756495783; x=1757100583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kWB8Pv2sqAgv9Nea+D2JzgKMYzdAPnpLmqubRuhPgt8=;
        b=SZ/Cf5gismCvddg6rw2HxHKF+XQNGQZ0oLVNr2pjeSSVVOy2PT/0Z+O4W/YqSaW2sV
         wlvxOs8NAFfFjuQvzjCzXvWae24L+DoFgaF1nS0sv/ao/cWa0HFs3fMqHjNG0x6roF9l
         V/0+DNDo8oei1QvKpJMK5s2O0DX0PdYLQKihw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756495783; x=1757100583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWB8Pv2sqAgv9Nea+D2JzgKMYzdAPnpLmqubRuhPgt8=;
        b=NS4titaKOH1licuksUXXggUIw7wMQ/O3RQAUEQYifiL6mOMvtcN1Gh4N1IuDILuLj1
         BQtvakBzyOdYLZIhfvz2mS/4U9jfgwIO/sBigB22GOCCYez8UA61SFCtVcXTWK8i04SN
         XBljc7ju0GwtvcrD1D0CoFnBiFWTbsdZIO9JXtKjhFw7QIlaM6Xb7OiEiWR0yUD5apay
         SZy9K/UMVcF9EBYOCU/2cEMww7xhA72wkiuk68lqnXt3yaXprbqw81hPkJgeHtMSYUXT
         bItfn4sSGkgF9XuL8qq20r/PDsqiMtuoGfBKdk0cfJSzZGqZVoBExNP/cQ4ENPPDuNoR
         5bhw==
X-Gm-Message-State: AOJu0Yy6lmfkayAol3iXWHMiRy57Tu5KETaUvcC8um58SpZLZ0mZLY35
	6ZOlNRGNpNsM3kozfU+wZc8T0tTRlXkb/sMY104Y8E33fdgGOFIdy3SM5gH/aO2PdLryLs8OmTh
	CptOU
X-Gm-Gg: ASbGncvNXnLb3pqemBOf0Itz0u3FAvXg6CQQ+tbkv7EAYR9INRNeRo/qUn+CNopl4nx
	vNxCX1Mlbjn5XVUF8xFVINkS00/RugRUMFhWVU8XNBT0Aj+MwVGoWNOVWpVrJP2ZULTy6N2KDw0
	4WuiF/x6gpvnLbgREgUJX2v8oPMqcn68pqMiPQWrcsWiQJuiuAlcan40ozqTnDlwqVsrcitBJ1u
	F2RJ4VRq1XATQQNEUaH/zBc81q5dNbCsXw0DtBmCwrCQCvDgGNIRfD0hyuhLNIOPL3sHur8MN6Q
	2L4ua1eB+wREHZs+GUbX0ExnNYNo1926ZgRj/C1NxkvjaFc4FWo2q5U9IUqwE/+hZN9Z7+/LTK7
	pyL1vU14VIErF4B7spnXWSyz71StVrHvyoFL6r07y6K6L6i3hRbaX/RzSvvaWfqTe0w2bhjBVta
	0AlY/U4fVj8JI=
X-Google-Smtp-Source: AGHT+IFVz0Q1xvsJTii6GiHVD1gt4bLIe1V4qPxG31Fi/gBSG6mI8P9dCXnVwwqgg2Fudo/3pRWdwA==
X-Received: by 2002:a05:6000:18ad:b0:3b7:9c79:32bb with SMTP id ffacd0b85a97d-3c5dcdf9bd9mr25803363f8f.44.1756495783130;
        Fri, 29 Aug 2025 12:29:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/gen-cpuid: Fix debugging for cycle detection
Date: Fri, 29 Aug 2025 20:29:39 +0100
Message-Id: <20250829192939.1090358-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jan reports the following exception when using the cycle debugging:

  Feature IBRSB, seen [IBRSB, STIBP, INTEL_PSFD, EIBRS, IPRED_CTRL, RRSBA_CTRL, RRSBA, BHI_CTRL], to_process [SSBD]
  Traceback (most recent call last):
    File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 594, in <module>
      sys.exit(main())
               ^^^^^^
    File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 588, in main
      crunch_numbers(state)
    File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 366, in crunch_numbers
      (state.names[feat], repl(seen), repl(to_process)))
                                      ^^^^^^^^^^^^^^^^
    File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 364, in repl
      return "[" + ", ".join((state.names[x] for x in l)) + "]"
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/local/xen.git/xen/../xen/tools/gen-cpuid.py", line 364, in <genexpr>
      return "[" + ", ".join((state.names[x] for x in l)) + "]"
                              ~~~~~~~~~~~^^^
  KeyError: 534
  make[2]: *** [/local/xen.git/xen/include/xen/lib/x86/Makefile:9: cpuid-autogen.h] Error 1

This is caused by commit ce8c930851a5 ("x86/cpu-policy: MSR_ARCH_CAPS feature
names") being rather lazy and marking dependenices on unknown features.

Introduce a helper to pick the known features in a range, and use it for
ARCH_CAPS.

Additionally, remove trailing whitepsace from the debug print.

Reported-by: Jan Beulich <jbeulich@suse.com>
Fixes: ce8c930851a5 ("x86/cpu-policy: MSR_ARCH_CAPS feature names")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/tools/gen-cpuid.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index 6f96d1368e9e..403369aedcd9 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -168,6 +168,10 @@ def crunch_numbers(state):
     state.hvm_shadow_max = state.pv_max         | state.raw['S'] | state.raw['s']
     state.hvm_hap_max =    state.hvm_shadow_max | state.raw['H'] | state.raw['h']
 
+    def feat_range(start, last):
+        """ Select all known features in the given range """
+        return [ x for x in state.names.keys() if start <= x <= last ]
+
     #
     # Feature dependency information.
     #
@@ -338,7 +342,7 @@ def crunch_numbers(state):
         PSFD: [EPSF],
 
         # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
-        ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
+        ARCH_CAPS: feat_range(RDCL_NO, RDCL_NO + 63),
 
         # The behaviour described by RRSBA depend on eIBRS being active.
         EIBRS: [RRSBA],
@@ -362,7 +366,7 @@ def crunch_numbers(state):
             # To debug, uncomment the following lines:
             # def repl(l):
             #     return "[" + ", ".join((state.names[x] for x in l)) + "]"
-            # sys.stderr.write("Feature %s, seen %s, to_process %s \n" % \
+            # sys.stderr.write("Feature %s, seen %s, to_process %s\n" % \
             #     (state.names[feat], repl(seen), repl(to_process)))
 
             f = to_process.pop(0)

base-commit: e7c689a249ca6b8d14a077bb0f3311eaeda2ca19
-- 
2.39.5


