Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA78672A7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:08:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685462.1066245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqT-0003u3-Sp; Mon, 26 Feb 2024 11:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685462.1066245; Mon, 26 Feb 2024 11:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqT-0003qC-Pu; Mon, 26 Feb 2024 11:08:29 +0000
Received: by outflank-mailman (input) for mailman id 685462;
 Mon, 26 Feb 2024 11:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reYqR-0002Xk-Un
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:08:27 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cfb0afe-d497-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 12:08:26 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512f892500cso908892e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:08:26 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bz8-20020ad44c08000000b0068fa89a5df6sm2764913qvb.124.2024.02.26.03.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:08:25 -0800 (PST)
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
X-Inumbo-ID: 5cfb0afe-d497-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708945706; x=1709550506; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2Df+PSqWP8Z0LteWDeQlgnr9scPhyhGzqXAiWsgtFg=;
        b=LYowHfAL46cSddsX8MFdRfo8+6nFN+ulhfWopCXTsEFjX4bzTxcS5BOJsQ5hAxuNp4
         G89C8XI0gywT8Zko3cQR69ZdMFUG+4wBtT8dJPfT8wyVACakHmA2ZvYsCOnmjXenyzPu
         R1FfkepzdA7BloLzrzJTC+hAWkFYERSy0Wi+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945706; x=1709550506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2Df+PSqWP8Z0LteWDeQlgnr9scPhyhGzqXAiWsgtFg=;
        b=GuszTtn1tQncMx8SCcb8hKcB79ix4u2EB1L3WXJd0GiG5Vprld0k9Ici9NhtEIHS8X
         VroDDQqxNUuys1RKgRL6kDHf5Z/K0PKXu2uyxjCcY1KSecuiOBBVNTvF2uTGpUn5epz1
         p1l2qsuIcgKOLhG94apshhtU2KkjfjxszLwXclpgIcVKxbX9GCojBrczNSJxS5VvQaf8
         h/WulDR6Qxk3mMM2Ils1i51TOJyDoyizcs523ncbNpLXZ8BhaObabm8bFTFnibMJ4D9P
         2kNUP2POhmweK13vZ4Q3r7MKZKwkpD0xtowK0YfXYXDI3LuOJxE3ESkhRd5vQCjfhgAH
         HowA==
X-Gm-Message-State: AOJu0YyHNDVfMS8wf4wiUMGNCzdFJrcxQb1WGzuTyfAZXlvHQkg9PPYh
	T+JBaPfpKbaDHDdnbG/nUBwgLXnnONr+dnSOh1A8fdkwU2aDtU+BXZ8xKQXZPQ5To+BX9+3eMhi
	0
X-Google-Smtp-Source: AGHT+IGo89SrYhBxTQ17xHUpFuNstG50fnkQUUi+pj40NDP//NHqEV1iJBMH9pNUOb5sFudl/c3IzQ==
X-Received: by 2002:a05:6512:2523:b0:512:d8ad:b454 with SMTP id be35-20020a056512252300b00512d8adb454mr4854028lfb.61.1708945705952;
        Mon, 26 Feb 2024 03:08:25 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 4/4] x86/spec: do not print thunk option selection if not built-in
Date: Mon, 26 Feb 2024 12:07:48 +0100
Message-ID: <20240226110748.80254-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226110748.80254-1-roger.pau@citrix.com>
References: <20240226110748.80254-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that the thunk built-in enable is printed as part of the "Compiled-in
support:" line, avoid printing anything in "Xen settings:" if the thunk is
disabled at build time.

Note the BTI-Thunk option printing is also adjusted to print a colon in the
same way the other options on the line do.

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - New in this version.
---
 xen/arch/x86/spec_ctrl.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ca82b9e41ccd..e8b0e62adba4 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -504,11 +504,12 @@ static void __init print_details(enum ind_thunk thunk)
                "\n");
 
     /* Settings for Xen's protection, irrespective of guests. */
-    printk("  Xen settings: BTI-Thunk %s, SPEC_CTRL: %s%s%s%s%s, Other:%s%s%s%s%s%s\n",
-           thunk == THUNK_NONE      ? "N/A" :
-           thunk == THUNK_RETPOLINE ? "RETPOLINE" :
-           thunk == THUNK_LFENCE    ? "LFENCE" :
-           thunk == THUNK_JMP       ? "JMP" : "?",
+    printk("  Xen settings: %s%sSPEC_CTRL: %s%s%s%s%s, Other:%s%s%s%s%s%s\n",
+           thunk != THUNK_NONE      ? "BTI-Thunk: " : "",
+           thunk == THUNK_NONE      ? "" :
+           thunk == THUNK_RETPOLINE ? "RETPOLINE, " :
+           thunk == THUNK_LFENCE    ? "LFENCE, " :
+           thunk == THUNK_JMP       ? "JMP, " : "?, ",
            (!boot_cpu_has(X86_FEATURE_IBRSB) &&
             !boot_cpu_has(X86_FEATURE_IBRS))         ? "No" :
            (default_xen_spec_ctrl & SPEC_CTRL_IBRS)  ? "IBRS+" :  "IBRS-",
-- 
2.43.0


