Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1963792E5BD
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757322.1166159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrln-0007tc-M0; Thu, 11 Jul 2024 11:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757322.1166159; Thu, 11 Jul 2024 11:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrln-0007rP-JA; Thu, 11 Jul 2024 11:15:27 +0000
Received: by outflank-mailman (input) for mailman id 757322;
 Thu, 11 Jul 2024 11:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrll-0007rD-Jq
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:25 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de964e90-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:24 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6265d3ba8fso93857966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:24 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:23 -0700 (PDT)
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
X-Inumbo-ID: de964e90-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696523; x=1721301323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf25M9zoO5vZznMm7cYwnz+XBjUsPdeo20Axydvsm8w=;
        b=Fvan6j243CBQumJCIKFhAsXIZ5XZc2Z+bsKFmxHc4Wdq5MehiHeWWfjpT+/AWtGuOX
         bWpYBBhc4GSB8my4Zc8n+17nIGdjxYJJUM2u75S0d75CzYEoZYkLO+mmpU4O6YzwrubS
         W7w7Mp7I6Lj0ISC87BW5ThrrxAtkxaPY9kq6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696523; x=1721301323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gf25M9zoO5vZznMm7cYwnz+XBjUsPdeo20Axydvsm8w=;
        b=JIy4kUB4/wxpLwcA+l9YG72lzEscfrvXtQMb/DbveX+6zRPcIj2Tc9mem3LLqId2EM
         fVfRGvPuULPkpEiFMLfBk1ud0zh6sa70bYbtbe/YaaCErVPXZRLHD7S/tboLgam3SJTp
         CxrwhD/VJo3WyMBdb7CZlG6flm0fKlXbsjTZJwYiqBrV45NnlehTjqu7LIwhRE+nBWDF
         k9t/d0owNoPWNk7cvsl6QpWevh/NMc4ZIYbe1oRzttK4/Ph8qdvk1kmZkP2ANU+pEOEV
         TngXQehSV9bZ70UwzWlaKlHIpxfjCuHhEsakeWF7ZK5SlGeTIPckzMdwu+MhlmYpTjjg
         P2iQ==
X-Gm-Message-State: AOJu0YzlBrLZ+JjEhUDBfki9nhIPRhdY4V2efv0lCBYqIcHxrU308cVz
	gF4JUHSgrBIFB77qIF936Zuzjs4/uM/7t+sq+wBxwZACmIuqCFoWMnp6Qw85asq963G9h6fswSC
	R
X-Google-Smtp-Source: AGHT+IFTvR+hMp9nnt7D5X0BPm5D4ydWq3OZMDWx6U0p0uhGHSb64/n7Z/D/sb6yAfV92dmqH/P1mA==
X-Received: by 2002:a17:906:c309:b0:a77:e55a:9e91 with SMTP id a640c23a62f3a-a780b6b0e59mr547319266b.19.1720696523503;
        Thu, 11 Jul 2024 04:15:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 01/12] CI: Fix CONTAINER_UID0=1 scripts/containerize
Date: Thu, 11 Jul 2024 12:15:06 +0100
Message-Id: <20240711111517.3064810-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, most build containers use root.  Archlinux, Fedora and Yocto set up
a regular user called `user`.

For those containers, trying to containerize as root fails, because
CONTAINER_UID0=1 does nothing, whereas CONTAINER_UID0=0 forces the user away
from root.

To make CONTAINER_UID0=1 work reliably, force to root if requested.

Fixes: 17fbe6504dfd ("automation: introduce a new variable to control container user")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

v2:
 * Add fixes tag
---
 automation/scripts/containerize | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index acdef1b54813..03bc4837350c 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -51,7 +51,7 @@ esac
 
 # Use this variable to control whether root should be used
 case "_${CONTAINER_UID0}" in
-    _1)   userarg= ;;
+    _1)   userarg="-u 0" ;;
     _0|_) userarg="-u $(id -u) $userns_podman" ;;
 esac
 
-- 
2.39.2


