Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A37AC07AA
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993246.1376693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1cV-0005eB-7u; Thu, 22 May 2025 08:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993246.1376693; Thu, 22 May 2025 08:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI1cV-0005ac-2S; Thu, 22 May 2025 08:49:43 +0000
Received: by outflank-mailman (input) for mailman id 993246;
 Thu, 22 May 2025 08:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI1cT-0004UT-3w
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:49:41 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2eaa07b-36e9-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 10:49:40 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a376da332aso3083459f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 01:49:40 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a36a83b63bsm16513777f8f.97.2025.05.22.01.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 01:49:39 -0700 (PDT)
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
X-Inumbo-ID: b2eaa07b-36e9-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747903780; x=1748508580; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yx4+zgGbRpsEhggPXSuzqYHsD8VxJjLcNb6O+IlJ+kk=;
        b=QZ1/ryVOxfwYLy0E/5QXXMJdFJnw0yixEDZoOZkkGp1SjQcRg8uW77BYcwwPFA+4M/
         GcpQswXz4iDbdujiiz0fO7tKhE4mmxgQ0h4SLrPgR+tBVvu4oCgmrDTz6oWLGmvbjYTM
         uxXqcH7hfLjwnNdddTcmjrjrATU7vG1h/0nU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903780; x=1748508580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yx4+zgGbRpsEhggPXSuzqYHsD8VxJjLcNb6O+IlJ+kk=;
        b=nVnm1ZohT0MPMTCnbVhMti33stppZUYnm7ARc6qGRotkyYaxEwF6hWAyZpF+Kuaw42
         8Jf16aPMiZVwegaoTkd+VNWc2qlewrMfUK8mnmSeM0FbuUcHGV9s5asl1bcx+pmjna2Z
         mbz9/m+81PQvs933U8O9qBy+cLCWMK1raUV7PO7Ph931/8rcOEubj8BzZ7K/selXM2Fi
         hRgEmKLJenZ+o/t4f/SAyAHGa7LJNsALiaGWzj6FNJcUYqdpY1Xq+GmZTx8xEQii/bhp
         WguwPt8z9LFeEdUitkskiJVGRfI6D4RtcrjmGRBRusQBq31KFNsgo93ZL9oFURV5hWdx
         A7Zg==
X-Gm-Message-State: AOJu0YzIzMpZOsPWIMZBiLMWJafkgyJxadUKCIfHpQOnbvaL5tVV+ZZ9
	IsCkyLke1Ry16ch0FUBP8QHAGnqSIN2Bsdgx8MTB+DwMzaATwBOxRHfy6Ox2ouzrdoXYt5CHbWA
	Q7k3N
X-Gm-Gg: ASbGncuzsxftjVwXegUfmiset74FoEf/cMqg9GuPsh/FViYLWPOqVK+NE7qVWTDhQjk
	YVJnN5r6rCY/8L1IqXIEPuwrEr5qsZt2M3BzaPn752Od8N4CquqlXpHaW69j52xPCNJCC00pAOJ
	DTPMAfD0Q922yrCxA8+5iIDEhyT/pGZwbLDEKMVm+P31LnbV00mMhJmeWxMZUr/lEODd0S4Lsd4
	wFKj6BNoSUwxUs/cd9QaveiHm2ZuSsDJ8aKWrlj/2G956x1bF6m84f/iNuoK1+OoXsEvy5MZGw1
	FkQu3HMVqA0c5NS6iem5HZEolby//AF7S5/qfYlf9/fTukfgZxdVoyDhiaEQ4r7otbmoOzEg3Ln
	1ldDxbOWt/B/xst4bHfY=
X-Google-Smtp-Source: AGHT+IGs65c5GaODEoeBQP2cvvjUWxKsUEUaJ4YXDd8yKvkd/ufGowoFvdMoMKg3sSjPN9c+lCHnYA==
X-Received: by 2002:a5d:64c7:0:b0:3a3:6584:3fa1 with SMTP id ffacd0b85a97d-3a365844ba6mr20445053f8f.44.1747903779803;
        Thu, 22 May 2025 01:49:39 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] x86/numa: add per-node lock profile objects
Date: Thu, 22 May 2025 10:48:14 +0200
Message-ID: <20250522084815.825-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522084815.825-1-roger.pau@citrix.com>
References: <20250522084815.825-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add some basic infrastructure to be able to use lockprofile with per NUMA
node locks.  This patch just introduces the required types, plus the
printing of the data for the newly introduced type.  There's no user of
per NUMA node locks introduced here.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/misc/xenlockprof.c    | 5 +++++
 xen/common/spinlock.c       | 1 +
 xen/include/public/sysctl.h | 3 ++-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/misc/xenlockprof.c b/tools/misc/xenlockprof.c
index 11f43a35e3c0..3fc91e832ae5 100644
--- a/tools/misc/xenlockprof.c
+++ b/tools/misc/xenlockprof.c
@@ -96,6 +96,11 @@ int main(int argc, char *argv[])
         case LOCKPROF_TYPE_PERDOM:
             sprintf(name, "domain %d lock %s", data[j].idx, data[j].name);
             break;
+
+        case LOCKPROF_TYPE_PERNODE:
+            sprintf(name, "NUMA node %d lock %s", data[j].idx, data[j].name);
+            break;
+
         default:
             sprintf(name, "unknown type(%d) %d lock %s", data[j].type,
                     data[j].idx, data[j].name);
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 38caa10a2ea2..d86e32bd67aa 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -612,6 +612,7 @@ static s_time_t lock_profile_start;
 static struct lock_profile_anc lock_profile_ancs[] = {
     [LOCKPROF_TYPE_GLOBAL] = { .name = "Global" },
     [LOCKPROF_TYPE_PERDOM] = { .name = "Domain" },
+    [LOCKPROF_TYPE_PERNODE] = { .name = "NUMA node" },
 };
 static struct lock_profile_qhead lock_profile_glb_q;
 static spinlock_t lock_profile_lock = SPIN_LOCK_UNLOCKED;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 9eca72865b87..bcf3dd3b1f31 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -582,7 +582,8 @@ struct xen_sysctl_page_offline_op {
 /* Record-type: */
 #define LOCKPROF_TYPE_GLOBAL      0   /* global lock, idx meaningless */
 #define LOCKPROF_TYPE_PERDOM      1   /* per-domain lock, idx is domid */
-#define LOCKPROF_TYPE_N           2   /* number of types */
+#define LOCKPROF_TYPE_PERNODE     2   /* pNUMA per-node lock, idx is node ID */
+#define LOCKPROF_TYPE_N           3   /* number of types */
 struct xen_sysctl_lockprof_data {
     char     name[40];     /* lock name (may include up to 2 %d specifiers) */
     int32_t  type;         /* LOCKPROF_TYPE_??? */
-- 
2.49.0


