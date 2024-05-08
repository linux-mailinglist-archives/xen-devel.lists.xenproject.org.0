Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B03F8BFB8E
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 13:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718680.1121205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4f6E-0007wD-0o; Wed, 08 May 2024 11:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718680.1121205; Wed, 08 May 2024 11:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4f6D-0007tE-TY; Wed, 08 May 2024 11:04:37 +0000
Received: by outflank-mailman (input) for mailman id 718680;
 Wed, 08 May 2024 11:04:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pq3G=ML=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1s4f6C-0006tz-Ez
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 11:04:36 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c17d6f75-0d2a-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 13:04:35 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-51f60817e34so5030888e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 04:04:35 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net ([2.223.45.79])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f882089cbsm18947595e9.48.2024.05.08.04.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 04:04:34 -0700 (PDT)
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
X-Inumbo-ID: c17d6f75-0d2a-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715166275; x=1715771075; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDHEY4Ssox3Ng1oWJa+kdpIzbH8xHGv/gTRq2AfViYw=;
        b=fd6bCGvmmlNUxOfwENrz3RRYurc7OWK+6s09HEuGoTpmZvBImXAaWUEw9/wX4csoZ5
         CtF/err6mwBS8dOI1pmPXKfe/gxoUYoC/2mnvLULZBZR2BnWonbWBXDFkmLA2XNx9w8o
         1h7PhjzkbR4dQzZgFaAXN9RgSRLZygersJKd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166275; x=1715771075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDHEY4Ssox3Ng1oWJa+kdpIzbH8xHGv/gTRq2AfViYw=;
        b=U2AttsRIvXzGkWRFpWSaASPRBR84UoJOlBh4ltRkWqy5yajAFCOYoSTy6ZWpS7Lnv9
         oIlZQpsqS+LScfq0coxmfWJ2eDt8C4hkogrGZZHDk7oS8NaM9rjCTfvF4UZM7G+n8hZH
         a60PdQiJijJznMdKQz/YGxzA/ZjazkSp6anzl/2GnzEw6orNlwtehRtDyFYu9b1N8PNC
         LZKLr3CPi10/x+ZfbjWLfKRcli9uOIyetBy1l/tR3jLG+5Gbh9AsXZs2idU67JxMVv9A
         yGJfAQuSbVlwTzo5VsyY+JChvt7l8ZuRecsCquCAbvHtcBD5f53MmVDmFog/6Q2ZrKKN
         uHrQ==
X-Gm-Message-State: AOJu0YzTzcNJDp7/abcgjtjHzyTjZhwZP2WgBQHldEcpRFXgw6EZCDXz
	iLhIdfx4rm9ZBn5FpOYwOYGAjACEe2AX0RlkGUN0RTDZ+C51k7bDSdzVULl4L3/2ERI2BkKCHXw
	H
X-Google-Smtp-Source: AGHT+IGlp2WgRocMsshp5skYmJ5RS6HmNu+5bNPhbb7IDWErEQ01aV8I7xXgkRfMdAz7VGsNVlJfzg==
X-Received: by 2002:ac2:4109:0:b0:51f:4096:dbca with SMTP id 2adb3069b0e04-5217cd48834mr1457296e87.62.1715166275046;
        Wed, 08 May 2024 04:04:35 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN PATCH v3] tools/lsevtchn: Use errno macro to handle hypercall error cases
Date: Wed,  8 May 2024 12:04:28 +0100
Message-Id: <8bde5ee38597a86334b86822de920802483a7179.1715100071.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, lsevtchn aborts its event channel enumeration when it hits
its first hypercall error, namely:
* When an event channel doesn't exist at the specified port
* When the event channel is owned by Xen

lsevtchn does not distinguish between different hypercall errors, which
results in lsevtchn missing potential relevant event channels with
higher port numbers.

Use the errno macro to distinguish between hypercall errors, and
continue event channel enumeration if the hypercall error is not
critical to enumeration.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 tools/xcutils/lsevtchn.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/xcutils/lsevtchn.c b/tools/xcutils/lsevtchn.c
index d1710613ddc5..e4b3f88fe4ec 100644
--- a/tools/xcutils/lsevtchn.c
+++ b/tools/xcutils/lsevtchn.c
@@ -3,6 +3,7 @@
 #include <stdint.h>
 #include <string.h>
 #include <stdio.h>
+#include <errno.h>
 
 #include <xenctrl.h>
 
@@ -24,7 +25,18 @@ int main(int argc, char **argv)
         status.port = port;
         rc = xc_evtchn_status(xch, &status);
         if ( rc < 0 )
-            break;
+        {
+            if ( errno == ESRCH )
+            {
+                fprintf(stderr, "Domain ID '%d' does not correspond to valid domain.\n", domid);
+                break;
+            }
+
+            if ( errno == EINVAL )
+                break;
+
+            continue;
+        }
 
         if ( status.status == EVTCHNSTAT_closed )
             continue;
-- 
2.34.1


