Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD9491C21C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 17:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750706.1158787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNDDe-0008T5-Go; Fri, 28 Jun 2024 15:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750706.1158787; Fri, 28 Jun 2024 15:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNDDe-0008Ql-Dq; Fri, 28 Jun 2024 15:08:58 +0000
Received: by outflank-mailman (input) for mailman id 750706;
 Fri, 28 Jun 2024 15:08:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KV+V=N6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sNDDd-0008Qf-5y
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 15:08:57 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56c96f57-3560-11ef-90a3-e314d9c70b13;
 Fri, 28 Jun 2024 17:08:56 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57cc30eaf0aso445395a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2024 08:08:56 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf18933sm88587466b.13.2024.06.28.08.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 08:08:54 -0700 (PDT)
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
X-Inumbo-ID: 56c96f57-3560-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719587335; x=1720192135; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtXpU0ZxaTHakcXA0kHKUl/3f8MRMH1twZOvIOZNWeQ=;
        b=sdW/qricJrOBA0TxTvxraL1ZzVR5HgmnUdhD3Js+O5ET5DSmeihobzmHBJ6Ib24KD5
         /xKH5S/uR3XMsgXqXv1f39ph9bsVsmgKJhXTNj9KckIsYPR6118GJHJY1IZ2mgbeHunD
         +7rcdROZKoxmmmGvmr0TK1PE1XyOe2fT/wJ4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587335; x=1720192135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtXpU0ZxaTHakcXA0kHKUl/3f8MRMH1twZOvIOZNWeQ=;
        b=xTJnGn0pFba+hLXeoxohA3PhLTlu7MiN9JtOIrcRghESzrNlAwu10d3ey6zHyUW77k
         8PTqT9AJJX5FNggG83QQnU8TvO2hMBIFDcuo8Lw34L2PWOngqHcMECP8Otz/a2HGZQcm
         A/BPHP34upv5aQKJbznXl/qTyBizkEvcW91+5Q3g/yBVYXDJ0p0oL2zzQXPuMCKGBs4B
         slhFHjokVLLEE5dMBAIG44KPkYnAWfhNa2Uq7yJpdD4IIETBaep2I+r1J1bhMgqpOrAa
         BsCG2IIMDy7D0jPhdHElqpy0eI1f1lTA6UCc0hqdJF9/W5lB0MN1BNRQj2yz033hcd+D
         sT7w==
X-Gm-Message-State: AOJu0Yw1/wAo1ueZC/4Z+sxPYvx71hoF8ImRUNjtxFh+vwPE3PluWhkG
	IJTTtgmT4UGlVcDDEjyHrMXzATQ3gSVquWS42uma1kNRqRVwCMExiGlIGsSBTHCSxKEfjF9vNQn
	Q5p4=
X-Google-Smtp-Source: AGHT+IGZWgKUcMtL9MNJ/SCWchycfUoPw8Um5c3Ik8tMVvFRFsVJ+tH12h/Iodq5mdGzEqmzJte4rw==
X-Received: by 2002:a50:d716:0:b0:56e:3293:3777 with SMTP id 4fb4d7f45d1cf-57d4bd74102mr13845522a12.17.1719587335286;
        Fri, 28 Jun 2024 08:08:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.20] tools/libxs: Drop XSTEST
Date: Fri, 28 Jun 2024 16:08:53 +0100
Message-Id: <20240628150853.1048006-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Appears to been missed from the previous attempt in 2007.

Fixes: fed194611785 ("xenstore: Remove broken and unmaintained test code")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/xs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index f84fd0f74c84..983d68ffd367 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -496,10 +496,6 @@ static bool read_all(int fd, void *data, unsigned int len, int nonblocking)
 	return false;
 }
 
-#ifdef XSTEST
-#define read_all read_all_choice
-#define xs_write_all write_all_choice
-#else
 /* Simple routine for writing to sockets, etc. */
 bool xs_write_all(int fd, const void *data, unsigned int len)
 {
@@ -517,7 +513,6 @@ bool xs_write_all(int fd, const void *data, unsigned int len)
 
 	return true;
 }
-#endif
 
 static int get_error(const char *errorstring)
 {
-- 
2.39.2


