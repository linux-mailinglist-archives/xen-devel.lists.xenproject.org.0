Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD28CC9E9E2
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 11:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176559.1501036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjev-0004KQ-Vj; Wed, 03 Dec 2025 10:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176559.1501036; Wed, 03 Dec 2025 10:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjev-0004Ex-Re; Wed, 03 Dec 2025 10:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1176559;
 Wed, 03 Dec 2025 10:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1EAn=6J=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vQjeu-0003xM-Pm
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 10:00:28 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e53c472a-d02e-11f0-9d1a-b5c5bf9af7f9;
 Wed, 03 Dec 2025 11:00:28 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640a0812658so4284256a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 02:00:28 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-211.as6723.net. [185.5.253.211])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510615c0sm18190969a12.30.2025.12.03.02.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 02:00:26 -0800 (PST)
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
X-Inumbo-ID: e53c472a-d02e-11f0-9d1a-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764756027; x=1765360827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5UVLmBmvgKxs7oTb1qCk8tDRMlakYOYuX5/F17a/uQ=;
        b=ThFUqNI2JZsqJ8uQw0G47UgWipRo4mZl+8EbnxH/zXWWN/1ozTpipw4qK8AryZ2xBo
         6NT2EV7Q4ymtnDhoWZO8gsTvKtVfKTDjvE98ee1Eds11jfjP37MxUDIbxSOoZ9H70DBd
         kzYcIn8GYIzjsifszlNvb0AOevOEDcCZ1iWtg8ASi3HTWKl4QB+X5ybbdu8BWxic5qP8
         6TVy27ucs6dx9bwoWtboKLnWwmsjd23ENnITmkYNGzlUKeH11K7MRW6BYvwXdWaFyYnm
         6sFxU1iGyoL7qa9jsTevUiUA5yveb0PPXUYVE+5QHqMecprop/r8N2hqmPvlcp+dGuAL
         BZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764756027; x=1765360827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5UVLmBmvgKxs7oTb1qCk8tDRMlakYOYuX5/F17a/uQ=;
        b=HpZxGcV4W48U+d7n/snxH4lpoar+71B+KEQQHCE0vtmW1w3QAqP5hi0UdUdwCjOIUQ
         PIFqrHn6xxyNtgB36nnjZ0/IMbqsBEWqtAqK9fmdWPGG9L06lgoAMpzq8u/+QPjvsbgx
         Shq900GlPTgDzN4U2Tb0n7BVb3asN4hmy29CLtP0AloGxDySlXTHQgrRaHWuVKZExRkf
         MotFEH1uDNtRQp06lXFG2WFNnpC9HBRK1rhYBp4jrPRGJbF+WovQYvNhMphQhZftHt1W
         sLITQZhSDmGooTstBlkR9cvvr676CqcUP/fzHyICEezLwtjFk8gr+7bhJtj7IKwodbmj
         nOaA==
X-Gm-Message-State: AOJu0YzlkxkusJKAf5hjHNlMPo3SjjEUCTZ3x9rwzNSjSIjsAts9cbA1
	Dt1HzVVe7AkwKsbmonbMiqnaFuFNOP/l2SYV3kwzXDop3yC902/jPi5GGUn65Z3x
X-Gm-Gg: ASbGncsBvrDjSi9zmgJmzHBb8LKhRXoQJzXQoGZot3jWGrdk052eVOWJpoh72KjPqDb
	xLVUm9SLLOv9dEi+iW6KUBMyh6lcOW4Xi+623dwqWxheXZofsNA7TT0FGn94OXMU48MZoc+X7lu
	5f4H5yJnmz4htRvpJBdns76KvkFYaBQagKARkapsuP/s0EH3vhAGqGl3hgp4oZdfZ1nRkHWWR0F
	9FDTy9mCsC8Itp0Ol2F01M/6WebVwcBW9v7pGLQAN7+D6rxHNAa7ALz+7H9qcDvVr+Ez7BMX7RA
	soWqwxZ6XYx7X9TqAMFYBN+sX/H1dGYWPLoasE9Ya4uTJd2TWJiieBxgWPkiJdcwdI1dvNeGrQ4
	N0/hGiqXb1qsv/6/tGqfmbL+bAJxtvCumwVk6M5Xc0tqmg0eNljj10wcXWC5AYNBzuxh7pfna2J
	b+9XBamBX3DMKI0ncXkBOpnKqmWuQcW2f/WeYulbdXbwAzBuLCEqYtdjRu
X-Google-Smtp-Source: AGHT+IE4Ukb6uX0vF6c5uedNAyGgvE09ZzPx5FI8z/XX5GVbKvAoTMzktZobsuDRXNOCTMBTiXbB/A==
X-Received: by 2002:a05:6402:50cc:b0:640:a50b:609 with SMTP id 4fb4d7f45d1cf-6479c48ab45mr1432568a12.16.1764756027323;
        Wed, 03 Dec 2025 02:00:27 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v15 4/4] CHANGELOG: Document guest suspend/resume to RAM support on Arm
Date: Wed,  3 Dec 2025 11:57:07 +0200
Message-ID: <ba51b0ca5457566e1dbef2b6d6ff984dbc318895.1764755558.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764755558.git.xakep.amatop@gmail.com>
References: <cover.1764755558.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Mention the newly added support for guest suspend and resume to/from
RAM via vPSCI on Arm platforms.

This support is limited to non-hardware domain guests.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v15:
- no changes.
---
 CHANGELOG.md | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index adaad5ee89..18757d6677 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -10,6 +10,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ### Added
 
+ - On Arm:
+   - Support for guest suspend and resume to/from RAM via vPSCI.
+     Applies only to non-hardware domain guests.
+
 ### Removed
 
 ## [4.21.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.21.0) - 2025-11-19
-- 
2.43.0


