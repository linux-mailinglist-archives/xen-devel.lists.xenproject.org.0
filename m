Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D352A9E6
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 20:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331381.554886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1Yf-0004UX-7T; Tue, 17 May 2022 18:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331381.554886; Tue, 17 May 2022 18:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1Yf-0004RP-2X; Tue, 17 May 2022 18:04:33 +0000
Received: by outflank-mailman (input) for mailman id 331381;
 Tue, 17 May 2022 18:04:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KpkB=VZ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nr1Ye-0004RH-0W
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 18:04:32 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccb2a982-d60b-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 20:04:31 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id k126so10879291wme.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 May 2022 11:04:31 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfc6c3000000b0020c5253d8dasm12978625wrh.38.2022.05.17.11.04.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 May 2022 11:04:29 -0700 (PDT)
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
X-Inumbo-ID: ccb2a982-d60b-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=EKSmnvJVRKuNiorxmh6RKpW9+C+oBWZuirhwngUpiFA=;
        b=d8XJLJsZpEXABv6ZORuvVlkZV/eZ0n5QWvVfV1Il8MFmUInxoYkMl3Kmq2wMRGnu/Y
         tGbJqIujPWUGCNgZ/tqGy1+5cJlA7oXSk+0oDV1jG1oZ7o9gkyVG9ATGIB0RjMTRhhL3
         OB76y7+GsffV/CyOU75jAwBwYjMFeWYOacizhtdmid6sisM4pzfceqYcyTq1aNYQkZ42
         XcUOTZerZ4FvdaSvcQx0+uErEOW1VaA0Js5mUP10jFw0gcH5pu2DuTZ4HlBZo/OWP7lq
         bUhyWznZSNRpzW/t/T6xXZf95iBXy/9wwFuCzKZcv/KtEhRZzwvHKypq/MhU7fck63m3
         Gdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EKSmnvJVRKuNiorxmh6RKpW9+C+oBWZuirhwngUpiFA=;
        b=SYrOVzX9fR3vDBYJYFNh4uaDJracxOckABfwEmrgaQCBkbqigQxVor027PlY8DCfoO
         3h/nk6IAgttXiOfujdesLCH79C39xijsMbSNBY2WyB7j8DUwU5qLL5CHQSxXr7OVL9GO
         wPDo8IV0J2iCXlBqvhBzejECmbwCtxeCmmVPEtJCKnkuOFsROZSjizHUpFrba2mz3Lmn
         17JUKblGMDG7LzwPVjnKDClmrq9ywWybUB17tp4lYY3AO5JUijFMu9IV0lqhWdseRH6L
         lIjW7nUh4w6Wr6p+8E/u7KMio6GDWN12btE8qpq3jpzDP0ulR6ivcSfBZOM9r4PX0J5K
         w/cw==
X-Gm-Message-State: AOAM532o25i5m5otmyl5iSbkrZCwLiAb9Foo5Vf9+al7GwvT4KpZT7SO
	Ep/xw7wUtEi3alW2cPsV72G4yc4f9qQ=
X-Google-Smtp-Source: ABdhPJxvO8aJltdNydOcbp7B8L4owevPlqnxSW+KqTPFcqROlQBAyvV0Gb48z5sSt/DmKwKj8j4PqQ==
X-Received: by 2002:a05:600c:3caa:b0:394:8fb8:716 with SMTP id bg42-20020a05600c3caa00b003948fb80716mr32758904wmb.105.1652810670151;
        Tue, 17 May 2022 11:04:30 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [RFC PATCH 0/2] Ability to allocate DMAable pages using unpopulated-alloc 
Date: Tue, 17 May 2022 21:04:16 +0300
Message-Id: <1652810658-27810-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

The purpose of this RFC patch series is to get feedback about supporting the allocation
of DMAable pages by Linux's unpopulated-alloc.

The unpopulated-alloc feature has been enabled on Arm since the extended-regions support
reached upstream. With that (if, of course, we run new Xen version and Xen was able to
allocate extended regions), we don't allocate the real RAM pages from host memory and balloon
them out (in order to obtain physical memory space to map the guest pages into) anymore, we use
the unpopulated pages instead. And it seems that all users I have played with on Arm (I mean,
Xen PV and virtio backends) are happy with the pages provided by xen_alloc_unpopulated_pages().
It is worth mentioning that these pages are not contiguous, but this wasn't an issue so far.

There is one place, where we still steal RAM pages if user-space Xen PV backend tries
to establish grant mapping with a need to be backed by a DMA buffer for the sake of zero-copy
(see dma_alloc*() usage in gnttab_dma_alloc_pages()).

And, if I am not mistaken (there might be pitfalls which I am not aware of), we could avoid
wasting real RAM pages in that particular case also by adding an ability to allocate
unpopulated DMAable pages (which are guaranteed to be contiguous in IPA).
The benefit is quite clear here:
1. Avoid wasting real RAM pages (reducing the amount of CMA memory usable) for allocating
   physical memory space to map the granted buffer into (which can be big enough if
   we deal with Xen PV Display driver using multiple Full HD buffers) 
2. Avoid superpage shattering in Xen P2M when establishing stage-2 mapping for that
   granted buffer
3. Avoid extra operations needed for the granted buffer to be properly mapped and
   unmapped such as ballooning in/out real RAM pages

Please note, there are several TODOs (described in corresponding commit subjects),
which I will try to eliminate in next versions if we find a common ground regarding
the approach.

Any feedback/help would be highly appreciated.

Oleksandr Tyshchenko (2):
  xen/unpopulated-alloc: Introduce helpers for DMA allocations
  xen/grant-table: Use unpopulated DMAable pages instead of real RAM
    ones

 drivers/xen/grant-table.c       |  27 +++++++
 drivers/xen/unpopulated-alloc.c | 167 ++++++++++++++++++++++++++++++++++++++++
 include/xen/xen.h               |  15 ++++
 3 files changed, 209 insertions(+)

-- 
2.7.4


