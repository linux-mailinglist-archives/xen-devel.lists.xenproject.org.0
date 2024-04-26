Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE258B368C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 13:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712709.1113534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Jq9-0007ei-0p; Fri, 26 Apr 2024 11:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712709.1113534; Fri, 26 Apr 2024 11:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Jq8-0007dC-UO; Fri, 26 Apr 2024 11:34:04 +0000
Received: by outflank-mailman (input) for mailman id 712709;
 Fri, 26 Apr 2024 11:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LIFE=L7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s0Jq7-0007b6-13
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 11:34:03 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e04f75f4-03c0-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 13:34:01 +0200 (CEST)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3c6f785208dso522829b6e.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 04:34:01 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 xb17-20020a05620a5ad100b0078edc0a447dsm7846019qkn.68.2024.04.26.04.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 04:33:58 -0700 (PDT)
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
X-Inumbo-ID: e04f75f4-03c0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714131239; x=1714736039; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6mjIj93m9xz8b2aSM5XG/+E2T7xDy4nNpobywC1I5c=;
        b=Twu6z/JZu2a5SuhEq7ne+y1NP4RMxoAe+5oEiOf9SX52Tg/MwWeCvGz/vIZU7BDpcu
         mELPeD5aOAwbQaJA+AadT0T7Rop65mIZPN7kW/ICWOG8upfdmD81XS54CdnZ6q8EEUAM
         n9LVShoCPKACdeCLB1/acFZHwgnehqPazcyUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714131239; x=1714736039;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6mjIj93m9xz8b2aSM5XG/+E2T7xDy4nNpobywC1I5c=;
        b=N4t/5jc/8L3tKujnq8gjirW0YyEnHzQqdGjzwU7GqhvCNldKgWlJaYOpWDW9phi00T
         u5fGx9tq/z4aJHvHxmV+LI+uTEBL8qj61nzviZTq1cBu3guu9tCQl/8bk0BNkOdsOIaD
         837Py78qbUBJ7NX7zfr+ifIFptwBJpXgoyjufnu8m1tpMRkHUyC2dYPeNV9YmnU6TK81
         dZw46S9EYOQItgrYnr+ymitRZ7dDUxGACwwl/9my2woDWNliCirS1UmeiULuHV6BHpvs
         uhzrT7ybT2nqBmksiEcR0Ibb1F+aPgi0Ot0Bo5ioUfFjBqpzAOYwD1sDdCT9Xt2MT44s
         elfQ==
X-Gm-Message-State: AOJu0YxfY8N+0N8ChNfTZphuN5g1fC54HtBL/tZWFl77eI+XbEpr7xyt
	qiqTROc6Hja9Fj+qEhEGqJ+x0FDE5lA36RztvU5/1GWwWpKWhz6Nim4aU16tUefwxlbYC/JOzt+
	Q
X-Google-Smtp-Source: AGHT+IFfdcS9WIGNICK+kUzp0n8jmmrM3n//7htg6MRvG7UDKAPXbLVS11vuAZ33+xhBummvX2J8uw==
X-Received: by 2002:a05:6808:aae:b0:3c7:35ce:67a4 with SMTP id r14-20020a0568080aae00b003c735ce67a4mr2459844oij.10.1714131239339;
        Fri, 26 Apr 2024 04:33:59 -0700 (PDT)
Message-ID: <5ef9fef8-e5ee-4ce3-a78f-ee7c35e5a1a4@citrix.com>
Date: Fri, 26 Apr 2024 12:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: MISRA and -Wextra-semi
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Based on a call a long while back, I experimented with -Wextra-semi. 
This is what lead to 8e36c668ca107 "xen: Drop superfluous semi-colons".

However, there are a number of problems with getting this working
fully.  First, we need workarounds like this:

diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index d888b2314daf..12e99c6dded4 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -26,7 +26,7 @@
 
 #include <asm/config.h>
 
-#define EXPORT_SYMBOL(var)
+#define EXPORT_SYMBOL(var) typedef int var##_ignore_t
 
 /*
  * The following log levels are as follows:

to avoid a failure for users, which do legitimately have a semi-colon. 
It occurs to me that we could swap the typedef for as asm("") which
might be a little less unpleasant.

But with the simple cases taken care of, we then hit:

In file included from common/grant_table.c:3813:
common/compat/grant_table.c:10:1: error: extra ';' outside of a function
[-Werror,-Wextra-semi]
CHECK_grant_entry_v1;
^

which is quickly starting to unravel.

Finally, while Clang does have -Wextra-semi working properly for C, GCC
does this:

cc1: warning: command-line option ‘-Wextra-semi’ is valid for C++/ObjC++
but not for C

instead, which passes the cc-option-add check (which doesn't contain
-Werror), but causes the real build to fail.


So, while -Wextra-semi is definitely useful to find some hidden
problems, it seems like using it fully might be very complicated.  How
much do we care?

~Andrew

