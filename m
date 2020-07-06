Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71785215DFF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 20:08:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsVX7-0003WF-8w; Mon, 06 Jul 2020 18:08:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8At=AR=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jsVX5-0003W5-Df
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 18:07:59 +0000
X-Inumbo-ID: 9f89cc96-bfb3-11ea-8496-bc764e2007e4
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f89cc96-bfb3-11ea-8496-bc764e2007e4;
 Mon, 06 Jul 2020 18:07:58 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id k5so7782703pjg.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 11:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TtTy8zAxVVVpMKoPB5sObxEUTYAxQ4ESDdw3dI7IOfA=;
 b=oaJIJFgUBmb7qZXeWwHQwIJgUXFmUxHmjzR/a7ly4+R/L5J6R2D0uaBXx6qjgig7XL
 IcTfx+7t20+5Z9InaIZohd+NXxgQroM7drjaj2oeyhSmyGQyPuwslXxB08Sr1k/TFIrt
 3vjcEts6w/HrO1mJ2/Wm0DA4nXEfBdTSDzWhRgorpzUGd6iUTNwuHKtQy8qEvPBNDmEi
 I8CN9f/N0NnZkCGRw9NQPNyVWTqZX2D6NQEQh6NkVROkIEj8xEOFG1mjUJ9J9t2fTGpK
 Vs/AuIQZd8mOC96Bsi0mfi8wSoU4KUR+ozHTEGiBwRV2YYf7jrNpWFfYb83DxP4DcZJi
 NMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TtTy8zAxVVVpMKoPB5sObxEUTYAxQ4ESDdw3dI7IOfA=;
 b=nrWuFizRdoPAtvhnYXA+oEbZSrWPXmLCG258cCPoeGEArvVCwHzAyuEe1p69JSObD6
 X3MrBuZnRbL/oGH8dwHlAtm00fDQAruwXmybq+DOou6nNj+x1X76aznstgyyKwh17wVe
 +25adqC5+G7YIQLu56FQFpqtRRAi53+CxQYhf3F75EdzBWStB5T+q+tWe6fYS6I26i7Y
 JV9KFmzArQ2VknNuUaNk9MreIKCD/6TemJtLWya1npycWX5a4ZAD57AX13v4/eyC0+ab
 WT+YPjgJvBzzLP7cM55VnllBY4VyLwLaaq5552TlUtT6kVdcFDjakOB8JMfS1YJcDOIZ
 u0Gw==
X-Gm-Message-State: AOAM531+AXkJifOtOzDLuxt6N/zkUvtfPJyIDUbkezevVpOJUrGbpKb1
 8tAbEsAdR/jneZzYLeV4jsM=
X-Google-Smtp-Source: ABdhPJzylX3osTAYA+Y6HJUZkzAC+UoJPBxpVk5NUh8tucD8BuQqoVsDbrqW5FAUg6C5IOlbZXlbQg==
X-Received: by 2002:a17:902:c206:: with SMTP id
 6mr19932000pll.30.1594058877935; 
 Mon, 06 Jul 2020 11:07:57 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.171.43.125])
 by smtp.gmail.com with ESMTPSA id 199sm20425544pgc.79.2020.07.06.11.07.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 11:07:57 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH v2 0/3] Few bug fixes and Convert to pin_user_pages*()
Date: Mon,  6 Jul 2020 23:46:09 +0530
Message-Id: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <xadimgnik@gmail.com>,
 linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This series contains few clean up, minor bug fixes and
Convert get_user_pages() to pin_user_pages().

I'm compile tested this, but unable to run-time test,
so any testing help is much appriciated.

v2:
	Addressed few review comments and compile issue.
	Patch[1/2] from v1 split into 2 in v2.

Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>

Souptick Joarder (3):
  xen/privcmd: Corrected error handling path
  xen/privcmd: Mark pages as dirty
  xen/privcmd: Convert get_user_pages*() to      pin_user_pages*()

 drivers/xen/privcmd.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

-- 
1.9.1


