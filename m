Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC881AC0D8A
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 16:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994036.1377070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Wr-0005HX-6z; Thu, 22 May 2025 14:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994036.1377070; Thu, 22 May 2025 14:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI6Wr-0005FX-3g; Thu, 22 May 2025 14:04:13 +0000
Received: by outflank-mailman (input) for mailman id 994036;
 Thu, 22 May 2025 14:04:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI6Wq-0005FJ-AJ
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 14:04:12 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2208d6c-3715-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 16:04:10 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-445b11306abso33485425e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 07:04:10 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f78aeb7fsm103243965e9.26.2025.05.22.07.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 07:04:08 -0700 (PDT)
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
X-Inumbo-ID: a2208d6c-3715-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747922649; x=1748527449; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNd1TLZwIjZh2L8Aq9WRMg/g0VDJfEai8NT+RXQuKT0=;
        b=KroUIZhJvOuIXWq998irEXZzlZGupfmWY2DmhLu6HI0BSy0Tk9ev5U44Rrrx7m9rZ+
         zITYO/vvWDGK4tdoSvakLh4Di4NAnMq3d0KHpgtrGgueepGBD01JGNok6s/RFWZW6kaH
         ptALsi7HgHCqv4inLWwfKC05I8lz1p7Le44tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747922649; x=1748527449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNd1TLZwIjZh2L8Aq9WRMg/g0VDJfEai8NT+RXQuKT0=;
        b=Zukka4j+uBTAcmxv+qMM5wiVJec9RetI2CK5x8IMOa8xA+4vcoiZlkaVwjUXc56YO1
         ujqmOg8vuVBak6WXkt1k6AfN7I/cK3eGGofD38+XVzLYXsJstkHRSbh4oTONn0IdcEbl
         f6J4cS3nj+kevGe9JVHoBNygb3rExlrX9rMj7FObyNyyMDPhr2GKiW9+Uiiwru+dHYBw
         eMLPtfdcBTWTCqDhpOZSFStp5RmXRIxo/t2zmYLg5VVlJ8q7YSz8YlSo9YQKUW+XP5Kd
         lLLYKFdJzXnCc6ZrkxX0/b9EHO5MNdtLOjM03m/tHgUhzprcSTP7Zb81fY6oX2g3EzgD
         ABww==
X-Gm-Message-State: AOJu0YzHvlr4+RM+roJapsvcO/encOdSXvQP2njQWmoGt1xjwLsgmUZN
	HGR0y4a+OSsRzYNqFQikVwGrb2rnJmq3K1YC1GlWayQ77SJpr4e3sz2+Bo21npWQ0R0HSkmRxHN
	mdH5j
X-Gm-Gg: ASbGncvoZsFcCAmk7Uw/SK5dkXXKNo+dc/SmkecJvmU6+RmsbIPWFU+AIFMrgpVUuHT
	wrLNKiPOXqIQhdRBkUpIKuNEKQ2+/Xei1Pv3bFE5SNN1UA7yalRAMAHt1Az5Fvb2G3+Bgihn1yZ
	if/qcgLhXLUTi241SRTqBWkzchTsd1SonSLqUuQvrApEoMR6ZDtuZb8T9umCBJqDBXILxDT7UXu
	1w3ZPFP1+IqCqlST6qcwSKiKJh2iT6Zx+BDyIqbewAL7vDyaCfklumSk74+6CKMhmIR4SEIAEQr
	2o9mBF3r2pmcQAVR/bCclpCWiedlK7mDYevJT9U7aQrYlrxz+h0ehhoITVEOheqCGJz4V2IrrT8
	DneHFrEjGaHnxLOOYGzk=
X-Google-Smtp-Source: AGHT+IFBSad0APJuUkl25AiE+Q62FS1rUuD/ZDEN/BzWK5tpqROfLzRlnGevS3RW8xQuZ6W0Gxo5Lg==
X-Received: by 2002:a05:600c:3d8e:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-442ff032801mr222028065e9.24.1747922648967;
        Thu, 22 May 2025 07:04:08 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/vpci: two fixes
Date: Thu, 22 May 2025 16:03:54 +0200
Message-ID: <20250522140356.5653-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Patch 1 fixes a regression reported by the Qubes ADL runner, so it's
required to unblock the testing.  Patch 2 is possibly more controversial,
it's not strictly required to unblock the testing, but might be good to
consider.

Thanks, Roger.

Roger Pau Monne (2):
  x86/vpci: fix off-by-one
  x86/vpci: refuse to map BARs at position 0

 xen/arch/x86/pci.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.49.0


