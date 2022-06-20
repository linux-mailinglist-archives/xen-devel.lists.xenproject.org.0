Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656AF55218C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 17:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352828.579702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3JeC-0008De-FO; Mon, 20 Jun 2022 15:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352828.579702; Mon, 20 Jun 2022 15:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3JeC-0008Ak-BS; Mon, 20 Jun 2022 15:49:04 +0000
Received: by outflank-mailman (input) for mailman id 352828;
 Mon, 20 Jun 2022 15:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hWFk=W3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1o3JeB-0008Ae-0j
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 15:49:03 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81716efb-f0b0-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 17:49:01 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id c4so17892101lfj.12
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jun 2022 08:49:01 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a2e9349000000b0024f3d1dae94sm1690149ljh.28.2022.06.20.08.48.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jun 2022 08:49:00 -0700 (PDT)
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
X-Inumbo-ID: 81716efb-f0b0-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=BxFmrRIa+vekezXU2ndkJI53IFxQQRuwCL2hgCyh3rI=;
        b=EE5uYpfUwbW+yhCsitbDozwmKkNg4mpG4ZQahK3XlYeTGhDYoqvVpHCoT5xzpURTcc
         cjNo0lfLdmeVJ5IQ69SU5T0l5SyOsyTVRZ/JsJgYtYepPqmK4x7OlqRlJs6A+dxXh09z
         TyqSN8Ltk0iX1VNgQ3wwi4LxxDz9REMLqH6/vXtkx6JVA0buOi5ldRHYWRVIGBavD/oT
         b8au3yNt/IwMuIePkU8N12rbDfxXhc9SDjRLMjVsdttQ2o7IWrpQ6oW1nDpitO/31dHU
         cYm9lqncdKbu0sq+m+mFIPb1hRuVEeWq3M4mVzMtBEQ9S3WQW6hoqAGucaMBRHAv9N8q
         VRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BxFmrRIa+vekezXU2ndkJI53IFxQQRuwCL2hgCyh3rI=;
        b=LioC+CWrqYcQgoxErWyFYCjsEPZVjR8CJrrdhOzjFY/RlLtVwZDRteGk3F3Gr15qJ4
         re9VjFOPR+1kaUNANoLdrHorcldX8Odqtc8j1hY5OdBQyiq/fCM5TU8RZ7glFYtgbWgV
         q1bGhKPiQqNnju/5FFX/oEAQ3mTnUPU88j/bhnpVk1La2loeJv/JLDlefATpDnqxej9T
         s6mkxmdHV7KmhUYQfsGSMT7KBkI5CN1JOWekn6sZIhiESStyBQ5sHXTgxxewA48Og22Q
         ioCTNpJwgDdbT+y3nrb5um2iqPAr4cTisGtF/2VK2ahtsE+xTM2Ad0A+It870l1d25y8
         b6tA==
X-Gm-Message-State: AJIora/vqpzbO6NyrDR61BDkXdZ14quDif9eFhAiElY9Mw8his6IYdhU
	lloRjWVDeToh7fioBUVbpoCszeH3n1E=
X-Google-Smtp-Source: AGRyM1sqdWC3IbkXi29u50LPbXr7CiOhdvbGy2bBIGNkubnWBbrYqutLjzCLlsUENGqK/CS2NF49dA==
X-Received: by 2002:a05:6512:228c:b0:479:2fa9:6773 with SMTP id f12-20020a056512228c00b004792fa96773mr13621418lfu.413.1655740140978;
        Mon, 20 Jun 2022 08:49:00 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V1 0/2] Ability to allocate contiguous (was DMAable) pages using unpopulated-alloc
Date: Mon, 20 Jun 2022 18:48:54 +0300
Message-Id: <1655740136-3974-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

You can find previous discussion at [1].

The purpose of this patch series is to get feedback about supporting the allocation
of contiguous pages by Linux's unpopulated-alloc.

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
unpopulated contiguous pages (which are guaranteed to be contiguous in IPA).
The benefit is quite clear here:
1. Avoid wasting real RAM pages (reducing the amount of CMA memory usable) for allocating
   physical memory space to map the granted buffer into (which can be big enough if
   we deal with Xen PV Display driver using multiple Full HD buffers)
2. Avoid superpage shattering in Xen P2M when establishing stage-2 mapping for that
   granted buffer
3. Avoid extra operations needed for the granted buffer to be properly mapped and
   unmapped such as ballooning in/out real RAM pages
   
The corresponding series is located at [2]. In my Arm64 based environment the series works good.
Only build tested on x86.

Any feedback/help would be highly appreciated.

[1] https://lore.kernel.org/xen-devel/1652810658-27810-1-git-send-email-olekstysh@gmail.com/
[2] https://github.com/otyshchenko1/linux/commits/unpopulated-cma1

Oleksandr Tyshchenko (2):
  xen/unpopulated-alloc: Introduce helpers for contiguous allocations
  xen/grant-table: Use unpopulated contiguous pages instead of real RAM
    ones

 drivers/xen/grant-table.c       |  24 +++++
 drivers/xen/unpopulated-alloc.c | 188 +++++++++++++++++++++++++++++-----------
 include/xen/xen.h               |  20 +++++
 3 files changed, 182 insertions(+), 50 deletions(-)

-- 
2.7.4


