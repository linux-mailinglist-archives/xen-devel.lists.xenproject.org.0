Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE3B8C7CC2
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 20:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723570.1128525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIu-0005H6-JU; Thu, 16 May 2024 18:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723570.1128525; Thu, 16 May 2024 18:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gIu-0005F6-Gx; Thu, 16 May 2024 18:58:12 +0000
Received: by outflank-mailman (input) for mailman id 723570;
 Thu, 16 May 2024 18:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7gIs-00050W-OI
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 18:58:10 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c78c0c0-13b6-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 20:58:09 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59e4136010so388950866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 11:58:09 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d9dsm1003072566b.132.2024.05.16.11.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 11:58:07 -0700 (PDT)
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
X-Inumbo-ID: 3c78c0c0-13b6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715885888; x=1716490688; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7RjB5NwR6WzQg0yeEc59qpmK1kkZdlkcceJ3D90NrA=;
        b=jFwUuVaf09yeB/Wxgxz6gjWQ4WjIW/8LCVvFirQOfKmNRj7AG52yeCGSxR8T/pJ5dE
         bpiX1Lm1l5kQKVVsi47S9YFpbHYC7uc9p9tOqXiAak4qOWDLFSE7Nq0bOG9T83PTiT9R
         hr/jyhy4Rq1NHrh9UlcbkhXs6F2om2d6TuyVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715885888; x=1716490688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7RjB5NwR6WzQg0yeEc59qpmK1kkZdlkcceJ3D90NrA=;
        b=CQBHXzas8b5fAoO6/gd0si8WjuRZhx8IV02WnCeuZhzj5p8ccGnBVfJLIP4ILT55yX
         eEi6Pi64o0dpi8EjsPAhQixnTVtXd9CC4dbCLZ1Bdirj9QNe/nQ7y/IQMKmrOjZl+vbc
         nGGUcUxa7HtYeeMhRz7n3ynoPcrqSqI9r8Oz+n27Q+SDpVGqZklYPs7PYxvbMZJShWG0
         E1yaXBkDVP51y8Ck5HfkZbFvq4wsONU2KNVQP9n9cb6XSfit4U1QMPP1BcKLiomREr8B
         B7q6zgsw0vGC3yi5ozCiuv/WyggxwcDxr2fzpXhRFdij79Za1MpRoGPd5dt0EQkBgOq4
         4tQA==
X-Gm-Message-State: AOJu0YynvFIDv0l4S00KcaGN3sYP3Oz11WNsEqE/ERyWX4zpyRpjHcjS
	KLd2MCGUW+yNF0SWJR12LT6IjwS9dQnwjjWOvPqitJt0X2QODsJEVJ116tZK3fMAlnNQ0TvRrRy
	n
X-Google-Smtp-Source: AGHT+IGjUYxNLa2ANB9M8W3Yq72DLYSKo/fpopvLQVj9Ov9vaL9WDbnLs5DR144E5aX43nVMPh4PcQ==
X-Received: by 2002:a17:906:130f:b0:a5a:51dc:d1a with SMTP id a640c23a62f3a-a5a51dc13bdmr1026234166b.3.1715885888168;
        Thu, 16 May 2024 11:58:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [PATCH v2 1/4] LICENSES: Add MIT-0 (MIT No Attribution)
Date: Thu, 16 May 2024 19:58:01 +0100
Message-Id: <20240516185804.3309725-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are about to import code licensed under MIT-0.  It's compatible for us to
use, so identify it as a permitted license.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Edwin Török <edwin.torok@cloud.com>

v2:
 * New
---
 LICENSES/MIT-0 | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 LICENSES/MIT-0

diff --git a/LICENSES/MIT-0 b/LICENSES/MIT-0
new file mode 100644
index 000000000000..70fb90ee3486
--- /dev/null
+++ b/LICENSES/MIT-0
@@ -0,0 +1,31 @@
+Valid-License-Identifier: MIT-0
+
+SPDX-URL: https://spdx.org/licenses/MIT-0.html
+
+Usage-Guide:
+
+  To use the MIT-0 License put the following SPDX tag/value pair into a
+  comment according to the placement guidelines in the licensing rules
+  documentation:
+    SPDX-License-Identifier: MIT-0
+
+License-Text:
+
+MIT No Attribution
+
+Copyright <year> <copyright holder>
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+SOFTWARE.
-- 
2.30.2


