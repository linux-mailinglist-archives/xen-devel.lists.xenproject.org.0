Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E6A64E90
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916715.1321772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9ST-0004ek-Ao; Mon, 17 Mar 2025 12:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916715.1321772; Mon, 17 Mar 2025 12:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9ST-0004cl-73; Mon, 17 Mar 2025 12:20:41 +0000
Received: by outflank-mailman (input) for mailman id 916715;
 Mon, 17 Mar 2025 12:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoqB=WE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tu9P5-0000kV-CJ
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:17:11 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfefa63d-0329-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 13:17:10 +0100 (CET)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-3015001f862so2229553a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:17:10 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-30153534589sm5871270a91.25.2025.03.17.05.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 05:17:08 -0700 (PDT)
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
X-Inumbo-ID: bfefa63d-0329-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742213829; x=1742818629; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM/79HlOHxERWEVpWx4kG/2IEysanU5ldeRIleAlpYg=;
        b=GQygeimuAEtt5S0hCZSwqKYvgX+DNTGirvhepI3bkruQGeI2I/LyYALQM1cBY9eYWA
         lN6qKnbTZugQnd6dBiYPAV+vqUrq4SCxN2OXFZJHIAiUOdqT9K5RpXBhK1P/8hA8bpIK
         vzn1wIovm4Szn/jnKCWdmjPNDfvQsjONgSkAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213829; x=1742818629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZM/79HlOHxERWEVpWx4kG/2IEysanU5ldeRIleAlpYg=;
        b=Xt4i2BtDFsdo+x4By6PROyiHsWJOIzoeZIWJ5yDtos3RcBEkXQ94MjabMNy119v4il
         t17ZCF+i1vYUR4LHa524vFvJY3HkYrFmvQWhYFzvNMo8EOxQHTtwGj/b/AJ7adhz98sM
         uiRGOHqQBUSF13sZjPan/MFO/Mok4S2WYvzB4nZr7vbI7Ys2xw6ZlSE59OEEaF2LksH/
         SnTO4+Mgpz0ABaWK4hapxZhkeON2tfd/6G2GYjj5vPgapxhrbxlx9GW7+K48ZdcpW4ty
         RELZaIynLXUbH30xd/6WCJwT5x4tJ8uM/Ft79qNXMVmVpJuy7Y1S5Gxcw7pq0cJNu/og
         9cPQ==
X-Gm-Message-State: AOJu0Yy6XPcbnxt6H8rEfm/lzRZRlSoZOlotsn91b3ahCv2kJgieV32y
	j8u64NML93N7w+ufEnVYiiYIbNV9Iptk/ez4grz6XbWr8Ju/wnUmzRAIBTS7j7AuqvIxmGWWaVO
	T
X-Gm-Gg: ASbGncukjlUpzRq/ouf6kchSu9n6US1kCf4MHnq6cZ+KaK9DAdtYgIAfiUdf5mmQcmD
	nmuNLqa29TAX2K6xCf4OkayL9lJZuau1sShxK4p+4P2PbujiWgmtP1K/RhT/fcJx2V0agm1ynUX
	EEIpYNTk2ZIHvQzssKoMkE7CWDPp9qBC5k8gPybyUgmWR6ir6pI140o01NOLzx6BlU1osMvTTQf
	x8HEVNcfBDyE2NCFdclhBXWcrB0ptEsBGQ+JBWXAvppcqL2+2/sTq+YfKcTxrERfT/3Q1Q7+Uc3
	l+GwzBLerowK9hOswxuq0zc9okp4jA21W98WV/4/LVJgzI5ibE8c7l+YTXw2/lMMIA==
X-Google-Smtp-Source: AGHT+IHOmdLPPvcUMjGVSUtZ0nulxpb+FdtfqcDCBNLg9E0EZ1bAQ3xlEIMkj9aNeUhGh0B0Cycl/w==
X-Received: by 2002:a17:90b:544c:b0:2ff:692b:b15 with SMTP id 98e67ed59e1d1-30151d8eed2mr16115835a91.33.1742213828616;
        Mon, 17 Mar 2025 05:17:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 7/8] automation/console.exp: do not assume expect is always at /usr/bin/
Date: Mon, 17 Mar 2025 13:16:15 +0100
Message-ID: <20250317121616.40687-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317121616.40687-1-roger.pau@citrix.com>
References: <20250317121616.40687-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead use env to find the location of expect.

Additionally do not use the -f flag, as it's only meaningful when passing
arguments on the command line, which we never do for console.exp.  From the
expect 5.45.4 man page:

> The -f flag prefaces a file from which to read commands from.  The flag
> itself is optional as it is only useful when using the #! notation (see
> above), so  that other arguments may be supplied on the command line.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/scripts/console.exp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index 310543c33e5e..31ce97b91b63 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -1,4 +1,4 @@
-#!/usr/bin/expect -f
+#!/usr/bin/env expect
 
 if {[info exists env(TEST_TIMEOUT_OVERRIDE)]} {
     set timeout $env(TEST_TIMEOUT_OVERRIDE)
-- 
2.48.1


