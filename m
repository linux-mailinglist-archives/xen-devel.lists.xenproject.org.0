Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E076683BD5E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 10:32:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671416.1044744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSw5X-0007xw-F9; Thu, 25 Jan 2024 09:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671416.1044744; Thu, 25 Jan 2024 09:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSw5X-0007vO-C7; Thu, 25 Jan 2024 09:31:59 +0000
Received: by outflank-mailman (input) for mailman id 671416;
 Thu, 25 Jan 2024 09:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etx6=JD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rSw5W-0007vI-0d
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 09:31:58 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9402a485-bb64-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 10:31:55 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55c1ac8d2f2so5609071a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 01:31:55 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t16-20020a1709064f1000b00a3100210020sm819686eju.79.2024.01.25.01.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 01:31:54 -0800 (PST)
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
X-Inumbo-ID: 9402a485-bb64-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706175114; x=1706779914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y0SPcwmga2cwvkrapbO/X2uehAdSE4bmD8VXuP8VvNc=;
        b=CXVRgrqncyWBtKgsh7UVzPX/mLCViOE1IW4oJ40qOlw4JDOk2VYwIrfEUB39Yfj6jK
         /xSMXQLO1NYmaOBMTOqW+8N6wga5pJ3vBb1ltYql1DlCxY3Prneoz2uUjI/vsdIhbW4L
         dHQFhgIMElODge2eb2+uc9r8P2XsuaRimFlBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706175114; x=1706779914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0SPcwmga2cwvkrapbO/X2uehAdSE4bmD8VXuP8VvNc=;
        b=ZayUOH95Wtpuqg8oZIc3H8SVCxS66Naziedk+4llY3cSNFctmZkMC1lMZLJ2QqREAe
         /szuij/L6kN0BGPDyby2EhRGvdtU9eB4eodA8TEFiC86TBH2UWHTgzbOeyPlMuzsyCIL
         N5V2vOVKGX+tem9MIhnX2LJOb0sihzYd2qplgbg8CKwiJUVchXo+6BZIw4tGxWHycvzC
         INWQVzIkCljvdhjvtiYIuCcdumXJTz0vmZZSsG1XM/FLypBPLp6brOW8iZslv75d3B5p
         w0i3prY1dGWJmLvn5HFXVA+pZwOer0eOoUrPcOCkcPkgYead36LqWeHZo9VW/fJydLcp
         hfRA==
X-Gm-Message-State: AOJu0YxuhfW16mwXoysvuW+6b61Y0JiaUC+R02cG1RBOGZih+Tao1Z5O
	8Mf+FnzW5WLcEYO+nycgurbKFsvO4cXmL19kQ5DNLWbJP7c1CuKlLk4AHCrItzjCBVd12w4RLia
	4
X-Google-Smtp-Source: AGHT+IHuwt+nCN0dy3pPyX3tQguA7dbd+D6OJZEZTXhNpcRpxqU0ggL0qYWw4SQjdIlAWApYCRW1/A==
X-Received: by 2002:a17:907:a80c:b0:a31:19d7:b57d with SMTP id vo12-20020a170907a80c00b00a3119d7b57dmr449493ejc.105.1706175114471;
        Thu, 25 Jan 2024 01:31:54 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v4 0/2] x86/hvm: disable exposing HVM pirqs by default
Date: Thu, 25 Jan 2024 10:30:39 +0100
Message-ID: <20240125093041.33087-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The HVM pirq feature has been found to be buggy on some scenarios, and
given it's an optional feature, and fully undocumented, opt to disable
it by default for the time being.  Note that an xl.cfg option is
provided to allow users to enable it on a per-domain basis.

Domain migrated from older versions also get the feature enabled by
default, in order to keep compatibility.

Thanks, Roger.

Roger Pau Monne (2):
  x86/hvm: make X86_EMU_USE_PIRQ optional
  tools: don't expose XENFEAT_hvm_pirqs by default

 CHANGELOG.md                      |  2 ++
 docs/man/xl.cfg.5.pod.in          |  7 +++++++
 tools/include/libxl.h             |  7 +++++++
 tools/libs/light/libxl_create.c   |  7 +++++--
 tools/libs/light/libxl_types.idl  |  1 +
 tools/libs/light/libxl_x86.c      | 12 +++++++++---
 tools/python/xen/lowlevel/xc/xc.c |  4 +++-
 tools/xl/xl_parse.c               |  1 +
 xen/arch/x86/domain.c             |  4 +++-
 9 files changed, 38 insertions(+), 7 deletions(-)

-- 
2.43.0


