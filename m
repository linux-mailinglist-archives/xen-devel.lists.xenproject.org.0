Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A17FF1CE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644744.1006170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4C-0004bs-7R; Thu, 30 Nov 2023 14:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644744.1006170; Thu, 30 Nov 2023 14:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4C-0004Zk-4M; Thu, 30 Nov 2023 14:31:00 +0000
Received: by outflank-mailman (input) for mailman id 644744;
 Thu, 30 Nov 2023 14:30:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8i4A-0004Xw-8R
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:30:58 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12efe29f-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:30:56 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40b397793aaso6086725e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 06:30:56 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b0040839fcb217sm2258963wmp.8.2023.11.30.06.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:30:55 -0800 (PST)
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
X-Inumbo-ID: 12efe29f-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701354656; x=1701959456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YB37uIZeiul8LXYiUxNbAMSZ783gJlh2AC/oVkpE9k=;
        b=eSHayK3KiQWxyyKxv2dvOh+XutUyRSWh349zfMpFuNv/k/Us0ri8muyjdHoXi2jDIX
         MzjfCYwR45QwX2BVc7ZT6ApS+u/oR/Mdo1I4u492kJHTLOCcJGM+RcXzFNuqsl3TJUv5
         Oyax1CTgXcU6bfpi/eyZh4SHOMHVmEP//mqAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354656; x=1701959456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7YB37uIZeiul8LXYiUxNbAMSZ783gJlh2AC/oVkpE9k=;
        b=uaNlzkd35Q/V6wUxSjnN1Tevnfy0BOKa+1PMHRJWKCDCGRV16AAH4dX4WvoCWaiX0c
         9ovcnpptH1CLYSDCAgOMVoaTv95SIulQrgz38dagSaVCrwFs9AH0sXhfGqUcPsNPsjxI
         5qsICW5Ma9UAWOP5qtF/TlisOswlIAY0Rb27nfFOU/z5wlCiFQQgZJC5G3rlUWPn5SO4
         j1xy5i8Vpr7TM53hPjl/xabJyfSnNklIFRToFR8Kf8lb9SFh8WiOojN89VPYHjTQLtta
         jiqZAE88rgoFRI9R4HCf0Gif82z8mpd5Fj8ejv0tS7niVtiqDpYNuKhX1LlETrwZzG9D
         GJNw==
X-Gm-Message-State: AOJu0YzA4LzgC8EsoC7+jNS06ST/XN6ojVJvdGWf2RdiYV3oXzOLcdSq
	XkmprEmev98/2rSn173enxX5XHstzu7CrCzCeRI=
X-Google-Smtp-Source: AGHT+IGk5wiVX8u7sDPjUBYqsnBCp9HjIvQBHrfkrueF3ZqUybxOG4Ktv99JpeK54r4EJg3kufojFQ==
X-Received: by 2002:a05:600c:1d08:b0:40b:2a62:a2b6 with SMTP id l8-20020a05600c1d0800b0040b2a62a2b6mr18753285wms.1.1701354655932;
        Thu, 30 Nov 2023 06:30:55 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/5] xen/livepatch: fixes for the pre-apply / post-revert hooks
Date: Thu, 30 Nov 2023 15:29:39 +0100
Message-ID: <20231130142944.46322-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The follow series contain a misc of fixes mostly related to the usage of
the pre-apply / post-revert hooks.  The norevert test is also fixed to
work as I think was expected.  Finally both the no{apply,revert}
tests are fixed to build properly, as the files where previously
unhooked from the build system completely.

I'm unsure how useful the apply and revert hooks really are, as without
calling the internal apply/revert functions the state of the payload
structure is quite likely inconsistent with the code expectations.

Thanks, Roger.

Roger Pau Monne (5):
  xen/livepatch: register livepatch regions when loaded
  xen/livepatch: search for symbols in all loaded payloads
  xen/livepatch: fix norevert test attempt to open-code revert
  xen/livepatch: fix norevert test hook setup typo
  xen/livepatch: properly build the noapply and norevert tests

 xen/common/livepatch.c                        | 95 +++++++++++--------
 xen/common/virtual_region.c                   | 40 +++-----
 xen/include/xen/livepatch.h                   | 32 +------
 xen/test/livepatch/Makefile                   |  4 +-
 .../livepatch/xen_action_hooks_norevert.c     | 24 ++---
 5 files changed, 81 insertions(+), 114 deletions(-)

-- 
2.43.0


