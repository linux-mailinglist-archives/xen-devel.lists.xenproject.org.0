Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B13891C100
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 16:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750663.1158746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNCdK-000286-7X; Fri, 28 Jun 2024 14:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750663.1158746; Fri, 28 Jun 2024 14:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNCdK-000237-1v; Fri, 28 Jun 2024 14:31:26 +0000
Received: by outflank-mailman (input) for mailman id 750663;
 Fri, 28 Jun 2024 14:31:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KV+V=N6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sNCdI-0001vh-Vg
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 14:31:24 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 174174db-355b-11ef-b4bb-af5377834399;
 Fri, 28 Jun 2024 16:31:22 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a725a918edaso110637666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2024 07:31:22 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf63390sm84944566b.69.2024.06.28.07.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 07:31:20 -0700 (PDT)
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
X-Inumbo-ID: 174174db-355b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719585081; x=1720189881; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=usddWHN3VvPsP/+TkAkPUgsqr9zRPXC4Wl8Yt4kv95M=;
        b=kfwTZ2bDwYTgpRat4GtpxRd3eE7LtfwJGrtP1qizxrV8TKotXmsQTwYuCsOcQ8Wzac
         yeKBkl9lx8TD7t0rGq4vC4IcDUgJRKAjarYtDRyFoE9uCp7OXZxlWA9oWgtcCEJ4AkM1
         IKs6SgH+sFT5pDLwU0YjCJ3B+AmcTbzl8B4Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719585081; x=1720189881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usddWHN3VvPsP/+TkAkPUgsqr9zRPXC4Wl8Yt4kv95M=;
        b=oFZ1ZIzm+PIXsppMGLw6kvE7+WP13eDY+BLytvECm9gQhagljFuFTByWuQYdRuxY9g
         /7RkT1O9pKW5RfuXh5GdasTff+HCsTstNqsD0b3Uh6tXlNn1wZQaA34wdUNMEkIyTS0R
         IZq+XDV3OmPQnLy5Se2/VgJpE2lO9PHZUC9zI3Lt8VaHkHCQ9IHg75+0WhxvMIPcDlYq
         xTLuaWqHu0KwvJIATbYMypnySEqbRru5b/eHuQ+UB7fWaZ39x2FdQ67bvN5kPjXlvASd
         W7FU00Xk+gPyKZQC4JUtx+3HB2IOEG7PxCReVSUIKwLsz33x9pPnjwQoJH7NHjFczuL8
         DImw==
X-Gm-Message-State: AOJu0YzPlcq0wqaWeuptxZf26xCe/zSgDp5yKoLj3OG0Lp3F116B0pee
	qG9XVE+x9HAfbUNLqJ1vMd4MRnHN0Fw0lO0UGiOw59LLGOM9zL5GiTezNWN7y9d3mnAM6YDPs7T
	ggUA=
X-Google-Smtp-Source: AGHT+IH+iQ4VsnMz7FBzVjp18wF8mVVBRIpazjLkDFiXvuBn4RK5HyR1uOfGgf4r+KDs01zo4sdjdQ==
X-Received: by 2002:a17:906:71db:b0:a6f:50ae:e02 with SMTP id a640c23a62f3a-a7245b85169mr1403177766b.4.1719585081193;
        Fri, 28 Jun 2024 07:31:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19(?) 0/3] tools/libxs: More CLOEXEC fixes
Date: Fri, 28 Jun 2024 15:31:13 +0100
Message-Id: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

More fixes to CLOEXEC handling in libxenstore.  For 4.19, because the first
attempt to fix this wasn't complete.

libxl is far worse, but I don't have time to get started on that mess.

Andrew Cooper (3):
  tools/libxs: Fix CLOEXEC handling in get_dev()
  tools/libxs: Fix CLOEXEC handling in get_socket()
  tools/libxs: Fix CLOEXEC handling in xs_fileno()

 tools/config.h.in     |  3 ++
 tools/configure       | 12 ++++++++
 tools/configure.ac    |  2 ++
 tools/libs/store/xs.c | 68 ++++++++++++++++++++++++++++++++++---------
 4 files changed, 72 insertions(+), 13 deletions(-)

-- 
2.39.2


