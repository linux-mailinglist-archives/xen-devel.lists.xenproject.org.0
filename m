Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E359AA79184
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935891.1337263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzTu-0002a2-NG; Wed, 02 Apr 2025 14:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935891.1337263; Wed, 02 Apr 2025 14:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzzTu-0002Wt-KA; Wed, 02 Apr 2025 14:54:18 +0000
Received: by outflank-mailman (input) for mailman id 935891;
 Wed, 02 Apr 2025 14:54:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zyr3=WU=edera.dev=alexander@srs-se1.protection.inumbo.net>)
 id 1tzzTs-0002Wn-Ry
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:54:16 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57e96866-0fd2-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 16:54:14 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-6eaf1b6ce9aso70271726d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 07:54:14 -0700 (PDT)
Received: from dell.axolotl-tone.ts.net
 ([2605:9480:312:2031:4ed7:17ff:feaa:a013])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eec97bdd78sm75399536d6.124.2025.04.02.07.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 07:54:12 -0700 (PDT)
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
X-Inumbo-ID: 57e96866-0fd2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1743605653; x=1744210453; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7ji2VHe1iwTejbRw/dZBkx2WBb2AT12F+aAca8XgHw=;
        b=BX1qir+UiMKdbzIT/s6knNXCNaoVeP2Jzx9Cw/CnBprrA8GbhcanX/Mh32GA+V93Ew
         Mj4yyQmETBAETjmOU37kLDom3A4J/WV0wWj99VlpV7NBQ6G9JeMt4+diklhd7YASoy7X
         B1H8zOjc9p6VpWuHC5nKHRl2LAURrFNMmVtny6jA0K5MRcItlqn0Jif7EXRfOpikloGW
         H3CVaAzMQbXMaKl8CeytLsGVpcbVjOMTet8m9ARssNwNkpAlDM93yd1FLZz9KqhX0F+K
         mmD0P/g67SHrhcHqX3xIp2utZEZxY4/rfp3d7v8BUf3l5uzzDZbeOyKU9tcIR8b7M3b2
         G/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743605653; x=1744210453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7ji2VHe1iwTejbRw/dZBkx2WBb2AT12F+aAca8XgHw=;
        b=TWZ9Sz+fHZ5uQhHjjh5Sn7oBdvFSb2sjc6ludAxUtMVCohoA8VIpvyyTZHPBva6c6b
         xaqQSaq0n4tX6ZWBs/+P0Q3MafE8SrPQm9N2gPLIWHvUXkFf5FXTATpwsdYcRxeeXQfq
         tC9HRcOKipny4eDPEnOW8SWxit5L77bUZBPHQmYVgPm/KgpF5SiJ11bhIhZPMP74Gf7R
         cK5GQqQZfcqJuxDc79uAq0YgYyAUjL53DWIeoTjz/GroNLPP5BU2URmkVcUHHOAgAR+r
         j5Grsvvf/LZ+I4lz8ehnjM7zkF5LAUVlEYTfpQXiOViPviouRAks6M9WThgaz3N8aydu
         QOeQ==
X-Gm-Message-State: AOJu0YxClIfjtQqCeTF54VOsc87TdQ29C8zn3jXEhIaeNTTs+Dkb0j5o
	9N0rORaADlFtKWOI9/Q8wqmUbyzzv22V7xO+YoiJQOj0npx3AYMALU3cXJ0HAUU6RJsSut3Xogd
	JQxg=
X-Gm-Gg: ASbGncuzQcyP8JZDgJrrDwF0fl8qhB6JU483yT1Rwk3nekw+++JPPGG5P0yL/U8yyaV
	CMC6NOHmCZQGy7KwGK8+REovznQriahRCgVyFDQwiPpx7Mr73QpEy985TsIOXGNkcqygOBocsBD
	h/ef405464CDXj9RQGTizdWrdILXDubJ1A0B+3GfBlhgJUkZtCoUeyLenRUO4wv8wBAIYUsjLdA
	gDPhrz2MyGtt0T4+Nwu+QVn2IONaibHp1TL4KErp5IIMesKG24ULNfX/pcHULL6yLym5gOG89Xa
	eJUaI3qGxoSpXb+ahk+ol4/7jjoqT1AHGjPjUH517BhbxxfBB6u02MmhKv+AgRDJ
X-Google-Smtp-Source: AGHT+IF8QxpbvHtdegJrm3IlWKgHT3VM906UGcvroCedLuKeYHAwbGIsTdgLZRQbjpgiwYiwiRDJDw==
X-Received: by 2002:a05:6214:500f:b0:6e6:6699:7e58 with SMTP id 6a1803df08f44-6ef02bafca3mr34542376d6.1.1743605653373;
        Wed, 02 Apr 2025 07:54:13 -0700 (PDT)
From: "Alexander M. Merritt" <alexander@edera.dev>
To: xen-devel@lists.xenproject.org
Cc: "Alexander M. Merritt" <alexander@edera.dev>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/1] drop wrappers of SVM instructions
Date: Wed,  2 Apr 2025 14:54:09 +0000
Message-ID: <cover.1743601241.git.alexander@edera.dev>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of cleanup following toolchain baseline upgrade.

As the new toolchain baseline knows the SVM instructions, this series drops
macros with SVM instructions, and updates SVM wrappers to use real instructions
rather than bytecode.

Resolves: xen-project/xen#204

Alexander M. Merritt (1):
  xen/x86: drop wrappers of SVM instructions

 xen/arch/x86/hvm/svm/svm.h           | 14 +++-----------
 xen/arch/x86/include/asm/asm-defns.h | 12 ------------
 2 files changed, 3 insertions(+), 23 deletions(-)

-- 
2.45.2


