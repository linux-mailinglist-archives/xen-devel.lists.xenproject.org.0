Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED0861100
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 13:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684819.1064985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUK7-0007md-DJ; Fri, 23 Feb 2024 12:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684819.1064985; Fri, 23 Feb 2024 12:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdUK7-0007jJ-9u; Fri, 23 Feb 2024 12:06:39 +0000
Received: by outflank-mailman (input) for mailman id 684819;
 Fri, 23 Feb 2024 12:06:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lysb=KA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rdUK5-0006di-Pc
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 12:06:37 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdef2b12-d243-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 13:06:36 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512bde3d197so210620e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Feb 2024 04:06:36 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 da35-20020a05620a362300b007854018044bsm6336939qkb.134.2024.02.23.04.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 04:06:34 -0800 (PST)
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
X-Inumbo-ID: fdef2b12-d243-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708689995; x=1709294795; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cdfP1drv1LQ9YGslYJKltpSCLlPkSQYqQfve8zYol4=;
        b=WzJmNMYr1BCm1TZv+pfQ6eJYyox7xB7bTNJP7rUZskBurArWF4jllYZoEZWUvCIdpN
         RdhvrTJqNQQQl7wUGdFqbFwI9XgEFLJCqIX7I3B/HgL/2rgv0W32zUwX6kVOkoeOenum
         RL82WESEaMu/47eUo1R5KUOPzINgJ/v/xeLbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689995; x=1709294795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cdfP1drv1LQ9YGslYJKltpSCLlPkSQYqQfve8zYol4=;
        b=e8+8SNnST+zyTmWp4D2bttlPCkudrecNMD2zXbzYtJwHgehVvVMPDfsnatkNQEWv/r
         oq+B14tQr9DnZYv6YKWXHo0UdDboVD1Qtj44GwctKe8w/7KbQzlbXaFS+YvIaGjzrnx1
         ByCRwlNvIV6C9cuoKCUi2ETbzg8wx6byuQE96DaUQ36RPg68CifXrhggFLaaCa0KCOv/
         Efo7rb4EqNb5xx2H/dRQYwR6us3TWl9fYL0Uqz3+RiLSnTfpqZS2VexSyeXek7tbx7EP
         wOVfUqu36hGZzsX/WQN1N9rfvnKK9QKsotTQCwslwu03NaaDhYoBQdRpFZlh/DG1cAmd
         BIPw==
X-Gm-Message-State: AOJu0YxJTH1aBuuAeamw18EwEVAic0DkHeT85nPJUpncYP1UhZ/u8Rye
	fCLWPwegedebUlNfquXRGTC+IyFyvZFXPkq3naV4As01yl+fQaTQ9vzOcjktR3Mb/cuCdOjKsFL
	Y
X-Google-Smtp-Source: AGHT+IHpeNl7z21jCtIKBCr1pJW/x8CWDv/TpSnAFd34Glij7WpFsufIBx3xHtkP91uwcHGLYJlfrw==
X-Received: by 2002:a19:5f08:0:b0:512:d689:51cb with SMTP id t8-20020a195f08000000b00512d68951cbmr1104193lfb.26.1708689994947;
        Fri, 23 Feb 2024 04:06:34 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/3] x86/spec: fix INDIRECT_THUNK option to only be set when build-enabled
Date: Fri, 23 Feb 2024 13:06:16 +0100
Message-ID: <20240223120616.73503-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223120616.73503-1-roger.pau@citrix.com>
References: <20240223120616.73503-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Attempt to provide a more helpful error message when the user attempts to set
spec-ctrl=bti-thunk option but the support is build-time disabled.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/spec_ctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 4ce8a7a0b8ef..f3432f1a6c80 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -239,6 +239,7 @@ static int __init cf_check parse_spec_ctrl(const char *s)
         /* Xen's speculative sidechannel mitigation settings. */
         else if ( !strncmp(s, "bti-thunk=", 10) )
         {
+#ifdef CONFIG_INDIRECT_THUNK
             s += 10;
 
             if ( !cmdline_strcmp(s, "retpoline") )
@@ -249,6 +250,10 @@ static int __init cf_check parse_spec_ctrl(const char *s)
                 opt_thunk = THUNK_JMP;
             else
                 rc = -EINVAL;
+#else
+            no_config_param("INDIRECT_THUNK", "spec-ctrl", s, ss);
+            rc = -EINVAL;
+#endif
         }
 
         /* Bits in MSR_SPEC_CTRL. */
-- 
2.43.0


