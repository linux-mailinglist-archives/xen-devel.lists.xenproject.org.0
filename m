Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28688C8746
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724139.1129337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7xjS-0004X7-Ba; Fri, 17 May 2024 13:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724139.1129337; Fri, 17 May 2024 13:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7xjS-0004To-7Z; Fri, 17 May 2024 13:34:46 +0000
Received: by outflank-mailman (input) for mailman id 724139;
 Fri, 17 May 2024 13:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJM7=MU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7xjQ-0003lA-VZ
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:34:44 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34a18ed1-1452-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 15:34:37 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2e2c70f0c97so7731961fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:34:37 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bc8esm21606970f8f.15.2024.05.17.06.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:34:35 -0700 (PDT)
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
X-Inumbo-ID: 34a18ed1-1452-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715952876; x=1716557676; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=otGmcHIqdbmt5QRbpQ0jxqZf5KUMuwh1Shw5luwAmdM=;
        b=G5CATHHC1xH3HR4Usdi85fAIwvzpN5hrpiirXzVxPKBN/GYPyPLSdCqaLa7j0YiXDf
         VjZVCxoPjXRqkbX6xDwb/l8zU61ysu5m6B31yGQtB27JCz3FeHydWPqEtRbHdM/Ds4bJ
         39+TGiLd+8MtYV3nd1GLgCqqqSsyGSYcKO2x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715952876; x=1716557676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=otGmcHIqdbmt5QRbpQ0jxqZf5KUMuwh1Shw5luwAmdM=;
        b=vYZnUZlLexVGrA3DCS7FvQO2Fzf1miQ/NIArRyMJVklIWfLLnEOjtc+xXAXqK5kNZX
         pdtnZgjzFuhFRtIHV6StS77YVUAB1OxS8YfM1kJSI/MGDtYuPR2gnOvlJ7PXaT913YtR
         k6+tP8iUFWY58O1itgiu4enGznadwqwseGefN+QqtTXraHT6zPc800nP/nxdsYDyslWD
         Tg9AexjiFmceDwc3syhVd1klxOcyGDIgVVfmlqdA86yBhxIXv2sX2cL5JcVbXrUVvCxu
         E/LyeHrPMv1pr4umpr2mBwBYFIhu0YxpR1uirY9K1SSVPo3K/a4KZ3w3EebU7p12kny6
         aGZg==
X-Gm-Message-State: AOJu0YzQIyX5aE56HBMjNs3Z/iIqSPYOKp+oiwqSDKvOFN6mY2ol3zFR
	WsO8yTBSk7DvhZZDc0Kfl1GoQMq6HQA4YwFCZM/U5Xr3157N0AuMvN32khScSxHSLW+TgvrWjRU
	n
X-Google-Smtp-Source: AGHT+IEwP/08fN7nqJ4O4SvNTBe0joZm5SNHfjWFdvR6WKRtn/JzA+wUi1hHN4HfcDkVdXYZj+uBxw==
X-Received: by 2002:a2e:96ca:0:b0:2e3:603e:469b with SMTP id 38308e7fff4ca-2e5204ccf5cmr141259241fa.40.1715952876275;
        Fri, 17 May 2024 06:34:36 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH for-4.19 v3 0/3] xen/x86: support foreign mappings for HVM/PVH
Date: Fri, 17 May 2024 15:33:49 +0200
Message-ID: <20240517133352.94347-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series attempts to solve a shortcoming of HVM/PVH guests
with the lack of support for foreign mappings.  Such lack of support
prevents using PVH based guests as stubdomains for example.

Add support in a way similar to how it's done on Arm, by iterating over
the p2m based on the maximum gfn.

Patch 2 is not strictly needed.  Moving the enablement of altp2m from an
HVM param to a create domctl flag avoids any possible race with the HVM
param changing after it's been evaluated.  Note the param can only be
set by the control domain, and libxl currently sets it at domain
create.  Also altp2m enablement is different from activation, as
activation does happen during runtime of the domain.

Thanks, Roger.

Roger Pau Monne (3):
  xen/x86: account number of foreign mappings in the p2m
  xen/x86: enable altp2m at create domain domctl
  xen/x86: remove foreign mappings from the p2m on teardown

 CHANGELOG.md                        |  1 +
 tools/libs/light/libxl_create.c     | 23 +++++++++-
 tools/libs/light/libxl_x86.c        | 26 +++++------
 tools/ocaml/libs/xc/xenctrl_stubs.c |  2 +-
 xen/arch/arm/domain.c               |  6 +++
 xen/arch/x86/domain.c               | 28 ++++++++++++
 xen/arch/x86/hvm/hvm.c              | 23 +++++++++-
 xen/arch/x86/include/asm/p2m.h      | 32 +++++++++-----
 xen/arch/x86/mm/p2m-basic.c         | 18 ++++++++
 xen/arch/x86/mm/p2m.c               | 68 +++++++++++++++++++++++++++--
 xen/include/public/domctl.h         | 20 ++++++++-
 xen/include/public/hvm/params.h     |  9 +---
 12 files changed, 215 insertions(+), 41 deletions(-)

-- 
2.44.0


