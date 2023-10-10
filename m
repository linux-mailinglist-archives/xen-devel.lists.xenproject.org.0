Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5147BFFD1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 16:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615087.956274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqE8u-00052x-Fa; Tue, 10 Oct 2023 14:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615087.956274; Tue, 10 Oct 2023 14:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqE8u-0004zl-Ck; Tue, 10 Oct 2023 14:55:28 +0000
Received: by outflank-mailman (input) for mailman id 615087;
 Tue, 10 Oct 2023 14:55:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/YEo=FY=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1qqE8t-0004xB-FB
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 14:55:27 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0badcce0-677d-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 16:55:26 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32c9f2ce71aso740316f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Oct 2023 07:55:26 -0700 (PDT)
Received: from EMEAENG6DZjqCfH.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 v6-20020adff686000000b0031980294e9fsm12775002wrp.116.2023.10.10.07.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 07:55:25 -0700 (PDT)
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
X-Inumbo-ID: 0badcce0-677d-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1696949725; x=1697554525; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/l4Hsd/Zof8XSfDIbZDzjkef1XTJ9Kr+1vkL+sFLQM=;
        b=Q5moYrswcvASRy3TA9pBOBEqJ8/SNUuJ4aTmdhYLGyZUHOHhUoZ0gzACYJWgcZ/siB
         gPlWzK7+ZaOo8f0Hfy8471dFJYFIjtsZo89d71vPa/y+CH5oNRIrhnMhTk7k+L8wntKP
         KgmOvM0L3mDzP0637xiICFwIS8v4N/bDR7jq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696949725; x=1697554525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/l4Hsd/Zof8XSfDIbZDzjkef1XTJ9Kr+1vkL+sFLQM=;
        b=MuPhiKWh5vRjcsdnQ288PuCoNDb0Za3m5zQ7bavnmC/5qvwyk1ZjjRR+7u85/nzVss
         n1IbDY0TZkkkn6fQMlfvpZw5McVO/DYAKsHAPZlY0mL+kkUE9/3spPO2zrN2kxG0AMjL
         Fopb7qX8FnOUuq8uCpg3vp1987BXP6471/FeCGYML4QBhDWOJkXxKp7+5bbGQOeXysZS
         bq0wnNpM5kEQgSUu5sDS06vXsZ92xv7AkO5mkDJyn2XUqCbd/KqJeOAWXbmbnCxzuEQq
         p81/EGGOjt1NgZWNCRnkvygkTwPJ9KKLsamBNNPuCP69Z5B/GOPsWsST/jOBo+aXUc76
         fCnA==
X-Gm-Message-State: AOJu0YzTZ/rTTACQ8HF/QmrnWmRsd42OvLgfOlFReqStcteuxw6Fmh+J
	V8//986dKfJceRTRXvOJKrc1rxiL/DNJhQx42o0=
X-Google-Smtp-Source: AGHT+IFMZcWAdQN3V33WEkI3iCxJ1rYjWGcgsUpmWqS6G1/Buep7GTvH6PcW2k1K9PF+1FGe2i5ONA==
X-Received: by 2002:adf:f005:0:b0:326:c623:3bbf with SMTP id j5-20020adff005000000b00326c6233bbfmr17284164wro.26.1696949725329;
        Tue, 10 Oct 2023 07:55:25 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Javi Merino <javi.merino@cloud.com>
Subject: [XEN PATCH v1] tools/python: Add python3 compatibility
Date: Tue, 10 Oct 2023 15:18:45 +0100
Message-ID: <efb10e537e37df1995dd8f87c28a8eb64ec9b61e.1696947009.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of the work for python3 compatibility was done in
1430c5a8cad4 (tools/python: Python 3 compatibility, 2019-12-18).  This
just adds a few builtins needed for python3.

Resolves: xen-project/xen#156

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

I haven't tested it.

 README                                     | 1 +
 tools/python/scripts/convert-legacy-stream | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/README b/README
index 855db01d36..44ed88c392 100644
--- a/README
+++ b/README
@@ -51,6 +51,7 @@ provided by your OS distributor:
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
+      - If using Python 2.7, you also need the future module.  This is not needed for Python 3.
     * Development install of curses (e.g., libncurses-dev)
     * Development install of openssl (e.g., openssl-dev)
     * Development install of x11 (e.g. xorg-x11-dev)
diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
index 7fe375a668..26a66c50fc 100755
--- a/tools/python/scripts/convert-legacy-stream
+++ b/tools/python/scripts/convert-legacy-stream
@@ -8,6 +8,9 @@ Convert a legacy migration stream to a v2 stream.
 from __future__ import print_function
 from __future__ import division
 
+from builtins import zip
+from builtins import range
+from builtins import object
 import sys
 import os, os.path
 import syslog
-- 
2.42.0


