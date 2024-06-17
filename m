Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55DF90B896
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742597.1149433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGZj-0001rK-PI; Mon, 17 Jun 2024 17:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742597.1149433; Mon, 17 Jun 2024 17:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGZj-0001o7-Lu; Mon, 17 Jun 2024 17:55:27 +0000
Received: by outflank-mailman (input) for mailman id 742597;
 Mon, 17 Jun 2024 17:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGZi-0001o1-8n
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:55:26 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c58d87cb-2cd2-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 19:55:24 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57c83100cb4so5305933a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:55:24 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f3d07asm542595166b.144.2024.06.17.10.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:55:23 -0700 (PDT)
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
X-Inumbo-ID: c58d87cb-2cd2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718646923; x=1719251723; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uU+mOcCo/JALQrJDkVLj51yiAq57mhcEBnRa/6VyFWA=;
        b=Ua0M8I/wTolsXAzENXskOMVhFb60NrPdJDFi+rS5VbLdD7nKkesIPZ/MrX9XyLoNL5
         JBS3qILeKqbWaP/eN5DKTlr77BhSYnnpMqRFR4Mp3YNk6WUWj23FYbAm53pP5zWzvAkg
         QHYQMznyHcMEp7YM+coRzsfNDsUUhXF3hkgGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718646923; x=1719251723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uU+mOcCo/JALQrJDkVLj51yiAq57mhcEBnRa/6VyFWA=;
        b=cFRdO63X1A0mEuUp2VmXQ8E7V91lYmgtUR2WnYHz0zXXLypGT01It6aZBg3Qrn9qi4
         ROq45poO282iJO1A+Ig0G/ys/OPyzh2SqdCfq/veLEH4n4kNjU5jP3fjU/OqwlDdPtw3
         5Xp3gNbCk/Q6h67l1A5FI8LhaSLqzU1q1KiM1V51EMl9gPSAHBKNXnXviwKkd/Cnj7p9
         sXGUUpg3a8eN4TMcUJ71LZ4vXMcLzTNBS/QoGBAR4J6FxkIW2bONrXplK/4iaurDpl26
         L9Wj7jcenKyieWXZT8QaNn3anpwjINojdXlh3vrC7vMcgr0w/AeGwMSe2lFvYE5e31oK
         gDyw==
X-Gm-Message-State: AOJu0YzA2eZmJbyj+gQ+s8NLFwrKYM1r6REJN7Pa+8qZ0Hbsf20fuYUL
	iCKk2MailglrncRikwk9mTQz874EDPMK/FIljRCV+lBq6ChkZMruqCByidNYkIWh8l/pqClA367
	Jq7M=
X-Google-Smtp-Source: AGHT+IGcAf31PONkt7BW7uDavz9BH3MCc5gIlkFRvjxFEQcEq8CkAqf4ltS717ugXDU6V0hrLs1+uA==
X-Received: by 2002:a17:906:f2ce:b0:a6f:1045:d5e2 with SMTP id a640c23a62f3a-a6f60cee9c6mr703268366b.4.1718646923346;
        Mon, 17 Jun 2024 10:55:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] xen/ubsan: Fix UB in type_descriptor declaration
Date: Mon, 17 Jun 2024 18:55:21 +0100
Message-Id: <20240617175521.1766698-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct type_descriptor is arranged with a NUL terminated string following the
kind/info fields.

The only reason this doesn't trip UBSAN detection itself (on more modern
compilers at least) is because struct type_descriptor is only referenced in
suppressed regions.

Switch the declaration to be a real flexible member.  No functional change.

Fixes: 00fcf4dd8eb4 ("xen/ubsan: Import ubsan implementation from Linux 4.13")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.19, and for backport to all reasonable versions.  This bug deserves some
kind of irony award.
---
 xen/common/ubsan/ubsan.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/ubsan/ubsan.h b/xen/common/ubsan/ubsan.h
index a3159040fefb..3db42e75b138 100644
--- a/xen/common/ubsan/ubsan.h
+++ b/xen/common/ubsan/ubsan.h
@@ -10,7 +10,7 @@ enum {
 struct type_descriptor {
 	u16 type_kind;
 	u16 type_info;
-	char type_name[1];
+	char type_name[];
 };
 
 struct source_location {

base-commit: 8b4243a9b560c89bb259db5a27832c253d4bebc7
-- 
2.39.2


