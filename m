Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8D8672A8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:08:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685461.1066235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqP-0003Uq-L1; Mon, 26 Feb 2024 11:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685461.1066235; Mon, 26 Feb 2024 11:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqP-0003SK-I3; Mon, 26 Feb 2024 11:08:25 +0000
Received: by outflank-mailman (input) for mailman id 685461;
 Mon, 26 Feb 2024 11:08:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reYqO-0002Xk-2U
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:08:24 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a9cc593-d497-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 12:08:22 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512f7332252so1722541e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:08:22 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ld24-20020a056214419800b0068f455083fbsm2742951qvb.63.2024.02.26.03.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:08:21 -0800 (PST)
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
X-Inumbo-ID: 5a9cc593-d497-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708945701; x=1709550501; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWSZ24uDxhCSDRWaKYJOr2WehsNuND623TZwFKk5HHU=;
        b=TcMy4VK5VBR+/SP4mO7gEKd0UgW1hminCLShU0J2lu6yzQQoI6OZG8fN24GmoJqEhL
         6x8T+VK5oaghG/XcDPYjcfNfxaqWHKHuhQ51SaG/OyFurmpfHrVT3dFCWi3PTVtnX9Kh
         P2lKxxiV9xfYupovw/Q8BmdegVVpYokt1fYCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945701; x=1709550501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWSZ24uDxhCSDRWaKYJOr2WehsNuND623TZwFKk5HHU=;
        b=ShBSMwGYPZOUtIcmBJffzCNfDOx3W2jL6rrqYWhiiEN4MqKawGcaXIrxABwg1jr92h
         3QMrwzpaUHHmVW89t9nPqt/PbjW9QFUqgMz+eJUrj5wdSqzMuXYfFuTE8Ue785gn8GSB
         Wwhg6VJRatzeyfWyjNLMDnpG+M8Ra1/QBKthX9tfN/qxeLac+oAaOMTDfn6G6cHguP5q
         gUlizzkcis40Pr5TaN6+wb0ysjOVTgvS2YAWBHDnpXP0i4AodIEaTIwKCEH0AtpdFU6F
         feRVOb9KgWx/dSBKtRxfDCvCHXNpk/9oux7nF4dtxOrMs7rFDv1mB8CLdvls6EEogAB5
         50mw==
X-Gm-Message-State: AOJu0YyMXC5qYg/p0nZxCIYnCsZAfp5rFiBG3sbzrsPLQ+/s2rTkzf7O
	DAGmVex/jRefkKMbOQ2+CrB2lrQyyitOZL5pRSIW+8RzOxyaJRcNfXcUWlU92ZqFg5fhe2f8icB
	+
X-Google-Smtp-Source: AGHT+IGqLUlMwqmEZc3pqD5QmoarnCv1FcAFbGiWLBw2Z/t+HGZkzTaCjkDsRXX7aggBuRmHYwlyWw==
X-Received: by 2002:a05:6512:3e0c:b0:512:b0a7:2943 with SMTP id i12-20020a0565123e0c00b00512b0a72943mr5349358lfv.5.1708945701487;
        Mon, 26 Feb 2024 03:08:21 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/4] x86/spec: fix INDIRECT_THUNK option to only be set when build-enabled
Date: Mon, 26 Feb 2024 12:07:47 +0100
Message-ID: <20240226110748.80254-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226110748.80254-1-roger.pau@citrix.com>
References: <20240226110748.80254-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Attempt to provide a more helpful error message when the user attempts to set
spec-ctrl=bti-thunk option but the support is build-time disabled.

While there also adjust the command line documentation to mention
CONFIG_INDIRECT_THUNK instead of INDIRECT_THUNK.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Adjust documentation.
 - Use IS_ENABLED() instead of #ifdef.

Changes since v1:
 - New in this version.
---
 docs/misc/xen-command-line.pandoc | 10 +++++-----
 xen/arch/x86/spec_ctrl.c          |  7 ++++++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index be76be8d5365..02896598df6f 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2417,11 +2417,11 @@ guests to use.
   performance reasons dom0 is unprotected by default.  If it is necessary to
   protect dom0 too, boot with `spec-ctrl=ibpb-entry`.
 
-If Xen was compiled with INDIRECT_THUNK support, `bti-thunk=` can be used to
-select which of the thunks gets patched into the `__x86_indirect_thunk_%reg`
-locations.  The default thunk is `retpoline` (generally preferred), with the
-alternatives being `jmp` (a `jmp *%reg` gadget, minimal overhead), and
-`lfence` (an `lfence; jmp *%reg` gadget).
+If Xen was compiled with `CONFIG_INDIRECT_THUNK` support, `bti-thunk=` can be
+used to select which of the thunks gets patched into the
+`__x86_indirect_thunk_%reg` locations.  The default thunk is `retpoline`
+(generally preferred), with the alternatives being `jmp` (a `jmp *%reg` gadget,
+minimal overhead), and `lfence` (an `lfence; jmp *%reg` gadget).
 
 On hardware supporting IBRS (Indirect Branch Restricted Speculation), the
 `ibrs=` option can be used to force or prevent Xen using the feature itself.
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 5fae80774519..ca82b9e41ccd 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -241,7 +241,12 @@ static int __init cf_check parse_spec_ctrl(const char *s)
         {
             s += 10;
 
-            if ( !cmdline_strcmp(s, "retpoline") )
+            if ( !IS_ENABLED(CONFIG_INDIRECT_THUNK) )
+            {
+                no_config_param("INDIRECT_THUNK", "spec-ctrl=bti-thunk", s, ss);
+                rc = -EINVAL;
+            }
+            else if ( !cmdline_strcmp(s, "retpoline") )
                 opt_thunk = THUNK_RETPOLINE;
             else if ( !cmdline_strcmp(s, "lfence") )
                 opt_thunk = THUNK_LFENCE;
-- 
2.43.0


