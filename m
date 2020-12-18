Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C02DE2A9
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 13:18:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56478.98880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqEh8-0007FC-NH; Fri, 18 Dec 2020 12:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56478.98880; Fri, 18 Dec 2020 12:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqEh8-0007En-Jw; Fri, 18 Dec 2020 12:17:14 +0000
Received: by outflank-mailman (input) for mailman id 56478;
 Fri, 18 Dec 2020 12:17:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kqEh7-0007Ei-Qh
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 12:17:13 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 885e4fed-4b2d-4aa6-8fc8-52287c9d1f2f;
 Fri, 18 Dec 2020 12:17:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r3so1929610wrt.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Dec 2020 04:17:12 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (5ec3281d.skybroadband.com.
 [94.195.40.29])
 by smtp.gmail.com with ESMTPSA id o8sm13125679wrm.17.2020.12.18.04.17.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Dec 2020 04:17:11 -0800 (PST)
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
X-Inumbo-ID: 885e4fed-4b2d-4aa6-8fc8-52287c9d1f2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W0GfmlS9Ivv1AzEqj/qay42P/6AulC/Mk4gTut3f3BM=;
        b=s22c/P0Hz9c5iLW8oBggrv/zj7bH/TsjXIp1gz4GfSpIZfMSQbj0EJroB4NrYNIF4P
         mmpwVIVHGO4wysGY0n4Z1VX/X8+h1svE3xmopvFtk5zB3K1FgPuHdU7qRW2i4eFc0/om
         wHp5zxXWicOtHqrFrh1uc6HssnhRKHeKNNfwMaEKh6/glw5N+f+rMd8qCn8ZjjJCQtJL
         sD0XcJjC5+GSH5UkrL8uFR+hXnzV6dGmQbdadlMogIUqlLGY2vCAtu/z1BPY+fcJ/YnM
         37xla2pduGqT8GlFZzRB4cBp41kodr2AvAj2BiK4k9Lzzkzn0AlT9LQn7ObT3Rea51+M
         +RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W0GfmlS9Ivv1AzEqj/qay42P/6AulC/Mk4gTut3f3BM=;
        b=YQCRALPp7MrYT1wWyKIc09Co6Q/L27ZCEaU5meax04HOa/8sA+K26iJIr6BCEfjfK8
         H8edW3IoD+U+cEPUa0ARaujz0UydjyD1MFC/fdx+nZNze8u2wZ1/Wm3u7zP9egGDwY5v
         HcdT8idt8gyJDeCyV4uK1LkXPHPgGwa71ABh7eC6QYO8ZkwVffArK+Wzs/Aefxjb034c
         ucOpfHszKPZz6YdeUTR5E7RowTZuci1cSuDVUppDKK8ChbHj+SUWNh4rrwMCsBws1iuW
         LOqGDdQZedlj5KXFp1raT9Tj8LpMcrcxWSkgn9Qt4NppghObz9x/HavHj7dwUG6KhHkw
         WFhQ==
X-Gm-Message-State: AOAM531FR4aafr7AViWql4jLM92ZJGUsT/tA2uAdo1cG5ouYio7qH7o5
	a0mlaIUSo5pWosxcW/aRZqI=
X-Google-Smtp-Source: ABdhPJxXeCXVt6AqsP1RfaynziHyCWSQcRjW+Td1ums9fol7CBaf7cRsDW7NAfDxtx9oac0ieAPobw==
X-Received: by 2002:adf:ded1:: with SMTP id i17mr4148758wrn.190.1608293832189;
        Fri, 18 Dec 2020 04:17:12 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: ash.j.wilding@gmail.com
Cc: bertrand.marquis@arm.com,
	julien@xen.org,
	rahul.singh@arm.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2 00/15] xen/arm: port Linux LL/SC and LSE atomics helpers to Xen
Date: Fri, 18 Dec 2020 12:17:09 +0000
Message-Id: <20201218121709.38544-1-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201217153742.14034-1-ash.j.wilding@gmail.com>
References: <20201217153742.14034-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Having pondered note (1) in my previous email a bit more, I imagine the reason
for using a DMB instead of acq/rel semantics is to prevent accesses following
the STLXR from being reordered between it and the LDAXR.

I won't be winning any awards for this ASCII art but hopefully it helps convey
the point.

Using just an LDAXR/STLXR pair and ditching the DMB, accesses to [D] and [E]
can be reodered between the LDAXR and STLXR:

                    ...
        +---------- LDR   [A]
        |           ...
        |           ...
        |    +----- STR   [B]
        |    |      ...
    ====|====|======LDAXR [C]================
        |    |      ...                  X
        |    +----> ...                  |
        |           ...                  |
        |           ...   <----------+   |
        X           ...              |   |
    ================STLXR [C]========|===|===
                    ...              |   |
                    ...              |   |
                    LDR   [D]--------+   |
                    ...                  |
                    STR   [E]------------+
                    ...


While dropping the acq semantics from the LDAXR and using a DMB instead will
prevent accesses to [D] and [E] being reordered between the LDXR/STLXR pair,
and keeping the rel semantics on the STLXR to prevents accesses to [A] and [B]
from being reordered after the STLXR:

                    ...
        +---------- LDR   [A]
        |           ...
        |           ...
        |    +----- STR   [B]
        |    |      ...
        |    |      LDXR  [C]
        |    |      ...
        |    +----> ...
        |           ...
        X           ...
    ================STLXR [C]================
    ================DMB======================
                    ...          X    X
                    ...          |    |
                    LDR   [D]----+    |  
                    ...               |
                    STR   [E]---------+
                    ...


As mentioned in my original email, the LSE atomic is a single instruction so
we can give it acq/rel semantics and not worry about any accesses to [A], [B],
[D], or [E] being reordered relative to that atomic:

                    ...
        +---------- LDR   [A]
        |           ...
        |           ...
        |    +----- STR   [B]
        |    |      ...
        X    X      ...
    ================LDADDAL [C]================
                    ...          X    X
                    ...          |    |
                    LDR   [D]----+    |  
                    ...               |
                    STR   [E]---------+
                    ...


So, makes sense that Linux uses acq/rel and no DMB for LSE, but Linux (and Xen)
are forced to use rel semantics and a DMB for the LL/SC case.

Anyway, point (2) from my earlier email is the one that's potentially more
concerning as we only have rel semantics and no DMB on the Linux LL/SC version
of atomic_cmpxchg(), in contrast to the existing Xen LL/SC implementation being
sandwiched between two DMBs and the Linux LSE version having acq/rel semantics.

Cheers,
Ash.

