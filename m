Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7F18A1812
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 17:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703983.1100025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruvz5-0004xH-Ta; Thu, 11 Apr 2024 15:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703983.1100025; Thu, 11 Apr 2024 15:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruvz5-0004v9-Qh; Thu, 11 Apr 2024 15:05:03 +0000
Received: by outflank-mailman (input) for mailman id 703983;
 Thu, 11 Apr 2024 15:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruvz4-0004v3-OR
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 15:05:02 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de5c1451-f814-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 17:05:01 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a450bedffdfso1099767566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 08:05:01 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gb25-20020a170907961900b00a522d34fee8sm154658ejc.114.2024.04.11.08.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 08:04:59 -0700 (PDT)
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
X-Inumbo-ID: de5c1451-f814-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712847900; x=1713452700; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfK5sFYc7cZ0oHbvxhR26eCXsM2Sg2ijhwpKH9wjPgU=;
        b=SqhyIJRknzdF6gsCJyT7exhym8mRS6A931ADqd4W1TZadTgRcH4yhjqU1LX0DKrifN
         L3xzFFCe43EROzbqU2L7X96ubQnmX0s2ZVDHxd8GphCN/ymn4JXbHgSyUcMqJFSDRDJZ
         IliG5+mM7UOFfhq7/Oa1p45Nc7LR1t1pNiuqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712847900; x=1713452700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfK5sFYc7cZ0oHbvxhR26eCXsM2Sg2ijhwpKH9wjPgU=;
        b=L3ty9LxnOwkjKgE3Mof+tM4kgiN3rQQzEheZdvsiH/rIY1JBDxEy7sLNF36H3xEnyW
         rPCuiHYBN4rm+NrRlX3/bq09w7owhBoAyo3nxYIV0Kt5iXW9XpCMuI5fYYtfTQdam0AM
         2+N1X75Pw7UryEeleZBFZ02MZqWNQZXDVZiWTKiZ/JXFBFSQF+fOca84iG97jrpwMFdu
         AiAlhIq0snUhJKERlFH4/uKYxjLJB/IzYkzYQX9HTfETtZV4Zx8L37v06Fjnb+fQDW7/
         Na2jTr9rN7xnCxAVSA7HI/dIkEdb2H6phsJGMUAZNF/gR1Ry2eOofno/TRXPfjYE2Dw8
         h6+Q==
X-Gm-Message-State: AOJu0YzgjKVJQXWQFxBoM1ablGC9NAw5mnyr1tOJkbtqyqeKfxwbM+mP
	ahDqe7qmxv9ooZs0Jh8XsPqTzQdS2Sfg8FD1p014Ajs1eUlvLkmwjRHzL4+0Q2qPfmP0cfiI24o
	S2Zk=
X-Google-Smtp-Source: AGHT+IFbnYWAqukudh0Yrj4QoEfN+24mEqGPUnZv1/xSaNHQqIji0rLc/hZ/qtSe1/B4UpNdEsyhGA==
X-Received: by 2002:a17:906:f6d2:b0:a52:2f1a:d36 with SMTP id jo18-20020a170906f6d200b00a522f1a0d36mr29317ejb.38.1712847900105;
        Thu, 11 Apr 2024 08:05:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] docs/hypercall-abi: State that the hypercall page is optional
Date: Thu, 11 Apr 2024 16:04:58 +0100
Message-Id: <20240411150458.1726116-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen doesn't care (and indeed, cannot feasibly tell) whether a hypercall was
initiated from inside or outside a hypercall page.

For SEV-SNP/TDX encrypted VMs, use of a hypercall page would violate the
integrity properties wanted.

Explicitly state that the hypercall page is optional.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 docs/guest-guide/x86/hypercall-abi.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x86/hypercall-abi.rst
index 83890e1cb613..8004122ca49d 100644
--- a/docs/guest-guide/x86/hypercall-abi.rst
+++ b/docs/guest-guide/x86/hypercall-abi.rst
@@ -79,7 +79,8 @@ Hypercall Page
 ==============
 
 The hypercall page is a page of guest RAM into which Xen will write suitable
-transfer stubs.
+transfer stubs.  It is intended as a convenience for guests, but use of the
+hypercall page is not mandatory for making hypercalls to Xen.
 
 Creating a hypercall page is an isolated operation from Xen's point of view.
 It is the guests responsibility to ensure that the hypercall page, once

base-commit: 6cb501e3e6db36b1b4b6345f5af8adc0a291b404
-- 
2.30.2


