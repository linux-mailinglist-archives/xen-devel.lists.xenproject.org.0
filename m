Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B177A59F7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 08:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604374.941743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUGD-0004n9-Ef; Tue, 19 Sep 2023 06:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604374.941743; Tue, 19 Sep 2023 06:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiUGD-0004it-At; Tue, 19 Sep 2023 06:31:01 +0000
Received: by outflank-mailman (input) for mailman id 604374;
 Tue, 19 Sep 2023 06:30:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=72lO=FD=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qiUGB-0003Oo-MV
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 06:30:59 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17d562e5-56b6-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 08:30:58 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-401da71b85eso58487245e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 23:30:58 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (cpc92302-cmbg19-2-0-cust781.5-4.cable.virginm.net. [82.1.211.14])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c229a00b003fe17901fcdsm17068780wmf.32.2023.09.18.23.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 23:30:56 -0700 (PDT)
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
X-Inumbo-ID: 17d562e5-56b6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695105057; x=1695709857; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g919MIKAx5+o9AO35iGPbruaS4fHlMldEN8yav8BWcE=;
        b=hpratWt2hxDKzaAwAL7070sUHJgWEwWM4F8+d7yHVZr7ejLJniIhy1j7yuspk3vJGl
         7QtssuUQBuxy0Q5v3ojjoKwmYSr4xF1QCWKPkQd+dC9/KaFaksRVuINaPLi3ldyOX4hh
         HHvkOhlK8p92xN5Fla9ju3r7/YxFTRenleVy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695105057; x=1695709857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g919MIKAx5+o9AO35iGPbruaS4fHlMldEN8yav8BWcE=;
        b=wMS95TIz6pV0myGZvA1oScUcAWmwQvsOPc/kbojYlekxGwfwLzatR0Mf0caofr9Oly
         OUtAmvqxMr+iJ/utKLEOWzooVQPjUz22d9TvuILpDSVFcU/Fu0Hgpkg+Et27sv3Xpx6v
         X1NRE5HdyakUWtXNUJdxD4tfirfLFj79YwMY2K0R7THEl4h14GSSHo+Fb1hjnonmBSpz
         5Cso/99Eh6kEWidqJK+2m/QijC/MV6yK5nS5rHkCAbcmo5EkGZuKwIFHfH9U9CQ26k/m
         9k5FapuIL+/Bt/ELnZaYuHdUGjdol2Chc98nB4KZ2S8nEVT9EZK0WOR8SfMX9AvH4m8k
         Msmg==
X-Gm-Message-State: AOJu0YxEmEUiEQdFO+crmAaVIYoaqCi5tOvC4OjOB3XCIX5RFbRJ9J9B
	75DvSm9NuHbkQEDCa3TucL+w9eu58T83kr6RmP8=
X-Google-Smtp-Source: AGHT+IEoOuhldT/ru27XY4+XrosqgpSchXwnBkCf6HQeFWZOdoSoVccmrFmpW4UMah+9ZSKGVPijIg==
X-Received: by 2002:a1c:f204:0:b0:3fe:d57e:d933 with SMTP id s4-20020a1cf204000000b003fed57ed933mr9861362wmc.15.1695105057145;
        Mon, 18 Sep 2023 23:30:57 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 4/4] README: remove old note about the build system's python expectation
Date: Tue, 19 Sep 2023 07:30:29 +0100
Message-ID: <83e6857f16eb000f8368fcd9995e0411f0177c2e.1695104399.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1695104399.git.javi.merino@cloud.com>
References: <cover.1695104399.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

5852ca485263 (build: fix tools/configure in case only python3 exists,
2019-12-11) changed the configure script to test for the availability
of python3, python and python2 in that order.  It sets PYTHON to the
first one found in path.  You don't need to have a symlink to python.

Remove the outdated note from the README.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 README | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/README b/README
index f75fa536d9..a491c8dce5 100644
--- a/README
+++ b/README
@@ -184,13 +184,6 @@ Various tools, such as pygrub, have the following runtime dependencies:
           URL:    https://www.python.org/
           Debian: python
 
-Note that the build system expects `python` to be available. If your system
-only has `python2` or `python3` but not `python` (as in Linux From Scratch),
-you will need to create a symlink for it, or specify PYTHON= when invoking
-make, like (note the position of PYTHON= matters):
-
-    # make PYTHON=/usr/bin/python3
-
 Intel(R) Trusted Execution Technology Support
 =============================================
 
-- 
2.42.0


