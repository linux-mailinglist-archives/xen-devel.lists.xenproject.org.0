Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE1184557C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 11:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674275.1049121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUPZ-0006vj-CH; Thu, 01 Feb 2024 10:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674275.1049121; Thu, 01 Feb 2024 10:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVUPZ-0006sa-9P; Thu, 01 Feb 2024 10:35:13 +0000
Received: by outflank-mailman (input) for mailman id 674275;
 Thu, 01 Feb 2024 10:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6jM=JK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rVUPW-0006sM-U0
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 10:35:10 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92445fb3-c0ed-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 11:35:09 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33ae6dfa923so452542f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 02:35:09 -0800 (PST)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r6-20020adfca86000000b0033aed7423e8sm10424665wrh.11.2024.02.01.02.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 02:35:08 -0800 (PST)
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
X-Inumbo-ID: 92445fb3-c0ed-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706783708; x=1707388508; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCiKinlpzlts0E4HThCuxCG1NalXkAwCr46PyLENUPc=;
        b=M9LUOs617+AOXH3uMO0bt3UJqNwDW092MZ1CeIWqNSyBsrMqg8WnSkQsLJc0eIc2wc
         TXh5yxG8GFJwirJgCt9JPTRTlf4dIq9+XJF4Z8ppCfAGWox+IiCcemmh3yxd4B9WXBxM
         xOP3X7CGR24xD7gtp6dlTYvhddsHNpb7ahFoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706783708; x=1707388508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCiKinlpzlts0E4HThCuxCG1NalXkAwCr46PyLENUPc=;
        b=ENrgldqzaws79gRZqPLmGgwODhgWPAbdPv4TElQMxqrqorizD/DmITir1hsSpKHQHe
         WOATdRPWfBPvaQHEiM5NXw4zw6+iGKWs0c2LYaKPyXHzbOYux/AS1pCn0QIAkAar7tx9
         Cv8La08uzvFblNcSU/8BQwFJKTK2dQpLwKH6z407Yiuvme+wiH3tOU3ox+V5t19RqG4L
         m7xYnvZdINnQxUrUahR5Zfood1S50dlZw1LpqN/vL4CBelrFAf+N/u594AET49PYKWBw
         BExAtyNwfkkCoaJwPftlgtsCipSYshiMAEBHquO8pvBEPqRnhCKyMl4+Qbz6oTcVBjq+
         sCzw==
X-Gm-Message-State: AOJu0YwCGOzc0mqlTiPFBoE8tpzEAZHuf8dvHmYRZYojt8iq2E6jmMJG
	QHGvhqFClBzljekKbV/qNS9zvXnryLJK5lUp3aOmOKp+DBsrWHYcdm7oU+3ivq5OKDBQO1OYhqp
	g
X-Google-Smtp-Source: AGHT+IF3IYhsbx8io/sHFiJrAGGdpXKU7tkn0zeXJuTqKsE29NOH/Gha7ryNWAFLJlbJgM1L9l+h2A==
X-Received: by 2002:a5d:4145:0:b0:33a:e9b5:b14d with SMTP id c5-20020a5d4145000000b0033ae9b5b14dmr2981336wrq.65.1706783708297;
        Thu, 01 Feb 2024 02:35:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVyhCfZlgnvrfayBS3hs4UKFkj9Aq4QmIunFjb/f/qZoIKI+kW0GSETBvLqi9tfVYRiop8+ZAnArt+922jtvVmDIp+b98rGgDSJdmJI1LxZLfx2Fbwsw7C8UqItb0WR7NU66PdqUKP8VVzsARoEdK6qmKv/JJSKlpM7+wCPyObsuVrNVLXqc63+Rf/ocEdVTQ==
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen/bitmap: Drop unused headers
Date: Thu,  1 Feb 2024 10:35:06 +0000
Message-Id: <20240201103506.549662-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing in bitmap.h uses lib.h, and there's no point including types.h when we
need to include bitops.h anyway.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 xen/include/xen/bitmap.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index b9f980e91930..9f749e3913d8 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -3,8 +3,6 @@
 
 #ifndef __ASSEMBLY__
 
-#include <xen/lib.h>
-#include <xen/types.h>
 #include <xen/bitops.h>
 
 /*
-- 
2.30.2


