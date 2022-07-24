Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5257F631
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jul 2022 19:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374201.606315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFfSj-0003CJ-Kz; Sun, 24 Jul 2022 17:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374201.606315; Sun, 24 Jul 2022 17:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFfSj-00039c-Hj; Sun, 24 Jul 2022 17:32:17 +0000
Received: by outflank-mailman (input) for mailman id 374201;
 Sun, 24 Jul 2022 17:32:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfQL=X5=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oFfSi-00039W-Ev
 for xen-devel@lists.xenproject.org; Sun, 24 Jul 2022 17:32:16 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ef30640-0b76-11ed-924f-1f966e50362f;
 Sun, 24 Jul 2022 19:32:15 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id mf4so16706276ejc.3
 for <xen-devel@lists.xenproject.org>; Sun, 24 Jul 2022 10:32:15 -0700 (PDT)
Received: from uni.. (adsl-30.37.6.163.tellas.gr. [37.6.163.30])
 by smtp.googlemail.com with ESMTPSA id
 y19-20020aa7d513000000b0043a7293a03dsm5964351edq.7.2022.07.24.10.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 10:32:14 -0700 (PDT)
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
X-Inumbo-ID: 8ef30640-0b76-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wGdFeGO04cPBh2TJfksxWvjBkowEnAQJN4GYEqmgdUE=;
        b=j5Eh7XR9052VdETaWLq4ngqaJ/QDyMBi1T+t3pPh3KKEZl7FGP+mXajO5jR2KuRTAi
         ZhY2bsJCTz2hCV7h6GoWTi6mww0Ma52B0g7wzHCYP3NiKIvaQfCYs9TOupY1jjQoauSk
         v34sPVk0508R8Nkc/2hSH8q7mVu+4kmferR5jRm2mYqPvDqxzGEtNVD7egaqJH+ncBEu
         tp+n3PbvX22C9Nw2/HGgRYHvbMQZlgqFVhWifaQwRcHSuKi4qzxtodjtCn1Btd43mUUr
         T/QUC/WV5/wCKvW31E9FJfptgG43nHe5LrrDIdUm5WAYWBNUVCNu7H15MPAlbM8DfEUc
         gPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wGdFeGO04cPBh2TJfksxWvjBkowEnAQJN4GYEqmgdUE=;
        b=wcjuGtdcblB47AJVv8lp+yR+CHGZNY0D1s2THqleNPVYw5t8TKOShW8zBzUvU0NdHv
         GEJSPu9VjG6EHnKgJ1DhcnOmLmJHLfPOo6Bj/vO4nB9KlIkDUo4k2UIvGR3mW6GP7Hm7
         f+Q5tdiOUpkzslMb7a5+ZK/gg/xXbZxlgrztwX8fAx6fVhqoH3EA5mp9IkwbcOHmsrvb
         TzhP/7M8Gqh6PyW2j0Ac9XiL9eRuAa3xFTtka+ibM8GrFw+Z98vVLFUx5Un35YSTWJ0u
         rT7zmEQpAy4JQdQmTSYKe2VXEeREgf4Ati6R4yLqpbhkct+SKEmWs9SNM1Wiw1+t16V2
         BIXA==
X-Gm-Message-State: AJIora8ZfZwTmlZCCbi8GhwOQBA3762HVjPDMU63l3zqowKE3OG4/qZT
	NaGKXlf0jBAKNAdM4O1zugOBWP4vOnw=
X-Google-Smtp-Source: AGRyM1uoYKr7LBwVgS+mFk+HjV3K0z2Cti4RUJqHqbiqU+1AeV+ViAxtsbHlDVzhDlVmoA4i4ghBWw==
X-Received: by 2002:a17:906:49d4:b0:6d6:e5ec:9a23 with SMTP id w20-20020a17090649d400b006d6e5ec9a23mr7262208ejv.79.1658683934394;
        Sun, 24 Jul 2022 10:32:14 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/hypfs: check the return value of snprintf to avoid leaking stack accidently
Date: Sun, 24 Jul 2022 20:31:59 +0300
Message-Id: <20220724173159.410535-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function snprintf() returns the number of characters that would have been
written in the buffer if the buffer size had been sufficiently large,
not counting the terminating null character.
Hence, the value returned is not guaranteed to be smaller than the buffer size.
Check the return value of snprintf to prevent leaking stack contents to the
guest by accident.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
I 've noticed that in general in xen the return value of snprintf is not
checked. Is there a particular reason for this? I mean if there is no space to
fit the entire string, is it preferable to write only a part of it instead of
failing? If that's the case, then scnprintf could be used instead below.

 xen/common/hypfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index acd258edf2..66026ad3e0 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -377,6 +377,8 @@ int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template,
     unsigned int e_namelen, e_len;
 
     e_namelen = snprintf(name, sizeof(name), template->e.name, id);
+    if ( e_namelen >= sizeof(name) )
+        return -ENOBUFS;
     e_len = DIRENTRY_SIZE(e_namelen);
     direntry.e.pad = 0;
     direntry.e.type = template->e.type;
-- 
2.34.1


