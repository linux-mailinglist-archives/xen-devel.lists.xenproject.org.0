Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6172C375568
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123584.233135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeiQ-0004Wk-Fv; Thu, 06 May 2021 14:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123584.233135; Thu, 06 May 2021 14:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeiQ-0004Ud-Bi; Thu, 06 May 2021 14:10:58 +0000
Received: by outflank-mailman (input) for mailman id 123584;
 Thu, 06 May 2021 14:10:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeYX-0003iB-OQ
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:45 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8f56f0f-9e3a-445c-945a-17631d221a2c;
 Thu, 06 May 2021 14:00:06 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id i17so4956110qki.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:00:06 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.07.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 07:00:05 -0700 (PDT)
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
X-Inumbo-ID: f8f56f0f-9e3a-445c-945a-17631d221a2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fT9IdXW7l+JAkySBAGlsnWyPD7h3K3UgTIcjVV3hRCI=;
        b=tNt/BCVDGnQIFABGe2ZWB18X8SFKSiqnSWCqUj8FdMxLUkBTbWcJie1AAC/WPCi/wr
         yTsCdoxBmvrUix2iPiKDSJr8B0qdoGoZ+aWPqYUXLVMtjnDA0ifjuoaZPoHRiFEYWPCk
         yD42j08omdX8kbxovmFHYVdcOZ+jCXZBL996OKWjcYsCgE5gyBV+n+CxkcCFory+x7eN
         ywxS8GHY+3ititjoEiLiBO5+4bkIWxJfwcPLJ14HoUZog5AKrDJ36InkVgwmk3cIr2aW
         b8cqiGm7m8YLi/7fkluSTe90PBIsnZybF4VhRCSSpzEW/niUgAb+nOebMzCowBPSMs71
         fyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fT9IdXW7l+JAkySBAGlsnWyPD7h3K3UgTIcjVV3hRCI=;
        b=sq2ru581JBa0VdT4ZL/HlQj8bYkrK2ptl3T3nKbByNavUXnzUUdXexMqbe+zaqVgJn
         YATrQBJ4vJ5om0elzKWGW/N/SIZ8pqGE3j43eejax29wuYHLF7F1nSWUC20l2H2BqUQZ
         ZzTHIg2IRT+Nt712e0p7Htk8/hX3E26bUT0En+QYF/mMfgKdxRzTWm4PJJtZ5vAtiVFI
         NM3tjIVpq5kpdQ3N+rttsESYI0CBYHodi6Dy5OGJS+RXIGnN/DHF8D5JhcxmCQYMA9o8
         dAYN0kjrRtTqOibJQnAeFzjiMc28o5wwQ7EC/r53ZtDKrtmGB71WUSaVN8SM73aRR856
         0y4g==
X-Gm-Message-State: AOAM533NmrQWL9D6ioseVASwPBmLJKta6bq5CCmLpPcHnvgCfHsmTNVS
	zd4Sn/iUPwkohgez/lkCgYbm6cnzohw=
X-Google-Smtp-Source: ABdhPJwh1m7BK20Tg9fj5e50WDNGt2C1hyl1Lxkxwuoo3bDiYFRPyAiyclRu7H+WgfOjXHnPvzhblA==
X-Received: by 2002:a37:6691:: with SMTP id a139mr3933885qkc.229.1620309605989;
        Thu, 06 May 2021 07:00:05 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 11/13] vtpmmgr: Fix owner_auth & srk_auth parsing
Date: Thu,  6 May 2021 09:59:21 -0400
Message-Id: <20210506135923.161427-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Argument parsing only matches to before ':' and then the string with
leading ':' is passed to parse_auth_string which fails to parse.  Extend
the length to include the seperator in the match.

While here, switch the seperator to "=".  The man page documented "="
and the other tpm.* arguments already use "=".  Since it didn't work
before, we don't need to worry about backwards compatibility.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/vtpmmgr/init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
index 4ae34a4fcb..62dc5994de 100644
--- a/stubdom/vtpmmgr/init.c
+++ b/stubdom/vtpmmgr/init.c
@@ -289,16 +289,16 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
    memcpy(vtpm_globals.srk_auth, WELLKNOWN_AUTH, sizeof(TPM_AUTHDATA));
 
    for(i = 1; i < argc; ++i) {
-      if(!strncmp(argv[i], "owner_auth:", 10)) {
-         if((rc = parse_auth_string(argv[i] + 10, vtpm_globals.owner_auth)) < 0) {
+      if(!strncmp(argv[i], "owner_auth=", 11)) {
+         if((rc = parse_auth_string(argv[i] + 11, vtpm_globals.owner_auth)) < 0) {
             goto err_invalid;
          }
          if(rc == 1) {
             opts->gen_owner_auth = 1;
          }
       }
-      else if(!strncmp(argv[i], "srk_auth:", 8)) {
-         if((rc = parse_auth_string(argv[i] + 8, vtpm_globals.srk_auth)) != 0) {
+      else if(!strncmp(argv[i], "srk_auth=", 9)) {
+         if((rc = parse_auth_string(argv[i] + 9, vtpm_globals.srk_auth)) != 0) {
             goto err_invalid;
          }
       }
-- 
2.30.2


