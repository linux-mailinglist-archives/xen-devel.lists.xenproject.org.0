Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F68672A4
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 12:08:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685458.1066205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqA-0002ai-Uk; Mon, 26 Feb 2024 11:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685458.1066205; Mon, 26 Feb 2024 11:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYqA-0002Xq-S7; Mon, 26 Feb 2024 11:08:10 +0000
Received: by outflank-mailman (input) for mailman id 685458;
 Mon, 26 Feb 2024 11:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reYqA-0002Xk-1Y
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 11:08:10 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51fd710a-d497-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 12:08:07 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512ab55fde6so3604806e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 03:08:08 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 h11-20020a05620a21cb00b00787bc4a187dsm2316578qka.98.2024.02.26.03.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 03:08:06 -0800 (PST)
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
X-Inumbo-ID: 51fd710a-d497-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708945687; x=1709550487; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zfHZDEu0CL6ienvK3OVvGy8T3k8OJfLniKwloLIs7k=;
        b=mAkI/CMpSbEmYERyq5funrC0jkUXCjf6KUUotsySMW12qj8SHF9HTh7l16KSYVRqDu
         JUDG5/JIfOjqhc5EWAi+AD+YwwRAIhv6yH2j0qzorYzG2LqE/nDXZWCGXgnnUziQq31v
         5TpcZg1UM+szAuATQjdSF3b9EJACSpUDJMk9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708945687; x=1709550487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zfHZDEu0CL6ienvK3OVvGy8T3k8OJfLniKwloLIs7k=;
        b=Zc3YV/ZLgix0X52J92WRCJw/blcsqOqScBBhFedIyCuC5ebzGhP2TpzM/pYBacIxiW
         FZRu8w3GQno6ID1REKAUF1MjBViQHYq7xelq1gnjhdUd0Oc7bc11pfe8xA7gV/AEAFK3
         o33IrFaF1asosbMSiN0ud2euCvQxBDa1Gsdxsr1BClumxbif/xEC05AlrjRqi07FN4v3
         oP2FPKNcb6gvRtMYGtcvOGAKCoo66EJSAh1ITARSaYpR7UW1PZ1bB3Gqdm1zfgUwy0P7
         cX2/iAxo9rVAH2PpqagkuIglzGQXtGs36KM5c4xQbwr/6dj7Fmq4MxElJdAs0vkdCNcD
         C5uw==
X-Gm-Message-State: AOJu0Yy2Hbg7HQ+x9W9ldPgvQutD6ZCDkpqyaDYEUx2Z40Y00rLv0hK+
	rdef2UuEyZ2/o+0A+4wo3+hfwWr4Kdf0QZuggh1nRwYH87y6v6t7bnOElseLjg7vWHYfYhHKGKI
	j
X-Google-Smtp-Source: AGHT+IH6mDiKIwMJ4XQDxfLlYBxRYjbuLxD1ZCs8N9zpvusZjApNntSdgYJCkhlxQxTIy1ZG8qxebg==
X-Received: by 2002:a19:f710:0:b0:512:bd51:a0ea with SMTP id z16-20020a19f710000000b00512bd51a0eamr3932997lfe.9.1708945686820;
        Mon, 26 Feb 2024 03:08:06 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/4] x86/spec: improve command line parsing
Date: Mon, 26 Feb 2024 12:07:44 +0100
Message-ID: <20240226110748.80254-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

A couple of improvements for the spec-ctrl command line parsing.

Thanks, Roger.

Roger Pau Monne (4):
  x86/spec: print the built-in SPECULATIVE_HARDEN_* options
  x86/spec: fix BRANCH_HARDEN option to only be set when build-enabled
  x86/spec: fix INDIRECT_THUNK option to only be set when build-enabled
  x86/spec: do not print thunk option selection if not built-in

 docs/misc/xen-command-line.pandoc | 10 +++----
 xen/arch/x86/spec_ctrl.c          | 46 +++++++++++++++++++++++++------
 2 files changed, 42 insertions(+), 14 deletions(-)

-- 
2.43.0


