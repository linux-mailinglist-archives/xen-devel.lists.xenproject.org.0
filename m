Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA148B042B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 10:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711240.1111054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXri-0002e5-NX; Wed, 24 Apr 2024 08:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711240.1111054; Wed, 24 Apr 2024 08:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXri-0002bc-KB; Wed, 24 Apr 2024 08:20:30 +0000
Received: by outflank-mailman (input) for mailman id 711240;
 Wed, 24 Apr 2024 08:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RmhA=L5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rzXrh-0002NH-8F
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 08:20:29 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 820acc2e-0213-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 10:20:28 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-79068f4da67so318491685a.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 01:20:28 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 p3-20020a05620a112300b0078ed3667cb8sm5934100qkk.124.2024.04.24.01.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 01:20:26 -0700 (PDT)
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
X-Inumbo-ID: 820acc2e-0213-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713946827; x=1714551627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MT0tq5z1vG1kax3lKu9NSCLY0591HEmhAata8IXOu1w=;
        b=mjgp4M9M6isajzr++U34UQPAiHZDhe6+iNGJ29JEaksfGh0tT7Fg9CYowJEr2S7OoS
         WP471gtbDBhwssSKDyvFH+CZ8Z8Iy7HiXHsG06/7xbWPapcsX8XWIaprVgBNSg5la8Ih
         ZGg9M67eMvhzX9IE/WwhCJorzrx0/ZvNUMbdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713946827; x=1714551627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MT0tq5z1vG1kax3lKu9NSCLY0591HEmhAata8IXOu1w=;
        b=g0uQZQMaedZ4d7mMdngzdKdeHWxSwFxlNNT7Lz1lof1BvxKbqOWJ4avnPtPpPyHL9J
         Vp9zDsDzpwaFc1nDwh+8nQa9A0GwiWum6Tl2SKnvLYZLsuEQadW8mPXovXsy6+0N/EeO
         vGlqBVjdA+ekIYL2EadMB2TLMp8kJN+j/85BcV5d0zyCAOgssTPjApXTK9uyOZl87qpZ
         YCLpAKX8FA3DAMwd0+nksWB+2DGMW0EGyKgGz7xAbBvcogtjuTerJInddoOKBCSClkWE
         EHVHQ/kzc8a87ja3+BA513f/AL9iahSNOKXPDNUc6e+SAGVDrGxh2vzc1MNbQZf0xQEu
         SAxw==
X-Gm-Message-State: AOJu0YwZUIvgJKe+BC2VYeVFzr17hntSgRMvAum5Jheztr3HIADO0UZ0
	dlqPb3nNOhE2QySeRehLvuKiPhHQnsR6g1VuOK0jopFgg6juI/c9gYeblIU8FKykQv0melFjXv3
	Z
X-Google-Smtp-Source: AGHT+IF3LqOybzJduhH7B0w5OzGjPnZVgZn5dJKlwQVCdPCAxQcC6Md5Xd2D3gGEw7mhbtMt90iI9A==
X-Received: by 2002:a05:620a:60c3:b0:78d:616a:9593 with SMTP id dy3-20020a05620a60c300b0078d616a9593mr1908646qkb.64.1713946826753;
        Wed, 24 Apr 2024 01:20:26 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 1/4] xen-livepatch: fix parameter name parsing
Date: Wed, 24 Apr 2024 10:19:54 +0200
Message-ID: <20240424081957.34326-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424081957.34326-1-roger.pau@citrix.com>
References: <20240424081957.34326-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's incorrect to restrict strncmp to the length of the command line input
parameter, as then a user passing a rune like:

% xen-livepatch up foo.livepatch

Would match against the "upload" command, because the string comparison has
been truncated to the length of the input argument.  Use strcmp instead which
doesn't truncate.  Otherwise in order to keep using strncmp we would need to
also check strings are of the same length before doing the comparison.

Fixes: 05bb8afedede ('xen-xsplice: Tool to manipulate xsplice payloads')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Use strcmp.

Changes since v2:
 - New in this version.
---
 tools/misc/xen-livepatch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
index 5bf9d9a32b65..2c4f69e596fa 100644
--- a/tools/misc/xen-livepatch.c
+++ b/tools/misc/xen-livepatch.c
@@ -572,13 +572,13 @@ int main(int argc, char *argv[])
         return 0;
     }
     for ( i = 0; i < ARRAY_SIZE(main_options); i++ )
-        if (!strncmp(main_options[i].name, argv[1], strlen(argv[1])))
+        if (!strcmp(main_options[i].name, argv[1]))
             break;
 
     if ( i == ARRAY_SIZE(main_options) )
     {
         for ( j = 0; j < ARRAY_SIZE(action_options); j++ )
-            if (!strncmp(action_options[j].name, argv[1], strlen(argv[1])))
+            if (!strcmp(action_options[j].name, argv[1]))
                 break;
 
         if ( j == ARRAY_SIZE(action_options) )
-- 
2.44.0


