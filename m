Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A6532ACC8
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 02:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92644.174652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGb3-0008DO-Fy; Wed, 03 Mar 2021 01:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92644.174652; Wed, 03 Mar 2021 01:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHGb3-0008Cn-BH; Wed, 03 Mar 2021 01:46:41 +0000
Received: by outflank-mailman (input) for mailman id 92644;
 Wed, 03 Mar 2021 01:46:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ma28=IB=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1lHGb1-000841-QL
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 01:46:39 +0000
Received: from mail-qk1-x72e.google.com (unknown [2607:f8b0:4864:20::72e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88826741-7be0-4128-96f9-5c5fdacf9a8b;
 Wed, 03 Mar 2021 01:46:27 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id g185so3229914qkf.6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Mar 2021 17:46:27 -0800 (PST)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 g21sm5406145qkk.72.2021.03.02.17.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 17:46:26 -0800 (PST)
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
X-Inumbo-ID: 88826741-7be0-4128-96f9-5c5fdacf9a8b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=NSsxG6jC6iAfi1izLJM576IbFfwdbov0QctCg+vigCk=;
        b=i7XvrduzFBb3vFjJ9h5JkKQLLbFxa5PxO1Guf6ZAdR1g6oa+fd0VX2/XAxWEY4a5OS
         pLDdYRz5wjNzvNtIj/LY4M9zIVmMV3E7jjbhUu5Zm5yGA9JaFvjSjC3nCJwTBsUwUzS7
         UhzcTk6DJINxpem85hn0ACPx4UN2QImq9z8S/5lkcn2nh77h1LsWm2OmJvN9XWyAadYa
         KouzKt3/O3QmrWfNCztnD0RvJLYqPUVfZC+AEYf6WYNjNGl09PlXSbLIccC4FctWvGPq
         Un1jdV6gHcpnfjROwHd0GKIuqx92xhLzbYDKmEi/TdrVmpa4JBv4hbGfMYFpveRy/329
         s5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=NSsxG6jC6iAfi1izLJM576IbFfwdbov0QctCg+vigCk=;
        b=IkrnjDTh71bdfHphEsdykIGN+rXVsNlw3YDxsqGASsbDAnpthrznniAWe7d4phgM3Y
         vo9MB0hMAcfyH43Qnrpo3aIlzhrcESM505FMPqrq+TCjwpPjdcVGwlxb+yqQ6Bae6IgD
         3WbHFVFQLhl6MIlEbjgeCinKpnBnh6QqsY7xsmWDXOvOYefY07fVwztcZjAKdce8uXHb
         NcWSU1AydTI4lE4PuGRzkqGmqX/NJ3P6klsVc233nmTz7clsjeE165y1IPMmwahfuLc4
         JzxzVOuxxKAfC+odM8t6DYSpVwARWzcFT0oESBbqHwuWzCm+/YczNFQTJ18nK57+MgGH
         6IBg==
X-Gm-Message-State: AOAM530RwaZ0MnbrQOs7B20dIbcJhu3mRNq0AUB1UouwdxICFv4N8oXX
	9/0EM9uUAmeHEDhxilgsiJ7cBT0ZtOiDYg==
X-Google-Smtp-Source: ABdhPJz4Ks5EvlScGLnpU0G+C2xgzT2jcmx7EX7joUCoj1HPTIlcK/T/y6Vn8a8yV23XO9L4Tw/lww==
X-Received: by 2002:ae9:eb57:: with SMTP id b84mr18756591qkg.271.1614735986824;
        Tue, 02 Mar 2021 17:46:26 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: george.dunlap@citrix.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 3/7] libxl: add PASS_BY_CONST_REFERENCE to idl
Date: Tue,  2 Mar 2021 20:46:15 -0500
Message-Id: <4b7f52dd28516aa286ab6db90536835b8caed022.1614734296.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1614734296.git.rosbrookn@ainfosec.com>
References: <cover.1614734296.git.rosbrookn@ainfosec.com>

Currently, there is only support for PASS_BY_{REFERENCE,VALUE} in the IDL.
As a piece of adding function support, add logic for PASS_BY_CONST_REFERENCE
so that function generation code can use Type.make_arg() for function
signatures that require const reference parameters.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/libs/light/idl.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/idl.py b/tools/libs/light/idl.py
index 20278c272a..a8a4768efc 100644
--- a/tools/libs/light/idl.py
+++ b/tools/libs/light/idl.py
@@ -4,6 +4,7 @@ import sys
 
 PASS_BY_VALUE = 1
 PASS_BY_REFERENCE = 2
+PASS_BY_CONST_REFERENCE = 3
 
 DIR_NONE = 0
 DIR_IN   = 1
@@ -40,7 +41,7 @@ class Type(object):
             raise ValueError
 
         self.passby = kwargs.setdefault('passby', PASS_BY_VALUE)
-        if self.passby not in [PASS_BY_VALUE, PASS_BY_REFERENCE]:
+        if self.passby not in [PASS_BY_VALUE, PASS_BY_REFERENCE, PASS_BY_CONST_REFERENCE]:
             raise ValueError
 
         self.private = kwargs.setdefault('private', False)
@@ -109,6 +110,8 @@ class Type(object):
 
         if passby == PASS_BY_REFERENCE:
             return "%s *%s" % (self.typename, n)
+        elif passby == PASS_BY_CONST_REFERENCE:
+            return "const %s *%s" % (self.typename, n)
         else:
             return "%s %s" % (self.typename, n)
 
@@ -116,7 +119,7 @@ class Type(object):
         if passby is None: passby = self.passby
         if isref is None: isref = self.passby == PASS_BY_REFERENCE
 
-        if passby == PASS_BY_REFERENCE:
+        if passby in [PASS_BY_REFERENCE, PASS_BY_CONST_REFERENCE]:
             if isref:
                 return "%s" % (n)
             else:
@@ -272,7 +275,7 @@ class KeyedUnion(Aggregate):
             raise ValueError
 
         kv_kwargs = dict([(x.lstrip('keyvar_'),y) for (x,y) in kwargs.items() if x.startswith('keyvar_')])
-        
+
         self.keyvar = Field(keyvar_type, keyvar_name, **kv_kwargs)
 
         for f in fields:
@@ -392,6 +395,7 @@ def parse(f):
         elif isinstance(t,type(object)) and issubclass(t, Function):
             globs[n] = t
         elif n in ['PASS_BY_REFERENCE', 'PASS_BY_VALUE',
+                   'PASS_BY_CONST_REFERENCE',
                    'DIR_NONE', 'DIR_IN', 'DIR_OUT', 'DIR_BOTH',
                    'namespace', 'hidden']:
             globs[n] = t
-- 
2.17.1


