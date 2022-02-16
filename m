Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A34B8C3B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 16:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274217.469614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2k-0000kh-0k; Wed, 16 Feb 2022 15:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274217.469614; Wed, 16 Feb 2022 15:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKM2j-0000is-Ta; Wed, 16 Feb 2022 15:16:33 +0000
Received: by outflank-mailman (input) for mailman id 274217;
 Wed, 16 Feb 2022 15:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=miT7=S7=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1nKM2i-0000ia-IA
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 15:16:32 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bc47f17-8f3b-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 16:16:31 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id g39so4399766lfv.10
 for <xen-devel@lists.xenproject.org>; Wed, 16 Feb 2022 07:16:31 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id bt2sm3082357lfb.93.2022.02.16.07.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 07:16:30 -0800 (PST)
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
X-Inumbo-ID: 6bc47f17-8f3b-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MXnLYo9xw7ZM5aZsNEA3HWbbU8vuMQcB/bLy8UKaVuQ=;
        b=ARmfTXWxdhS34dRh/av2rd2PbcIWokFO9C10alyy0EkcIfQLbfwIJVwng3jn6Ne/wS
         ZvcxSz9NkT0ftRdsmFXd3QkTMjvSHqqcbDHtAXt3HJ6Z9lPiBquJMz0uy4oaRoUgB6mz
         F9c90x1+1Se+pPmlksq9xfH6fEKalLXzR6re5ngimNIDhS3eeJxka6b6FKlmF9Z/jH0O
         266FPoja2tHluKwWu7bIGqEB0m1KpNCIwTJp+KsrPjzlfWFCox1WraIrg6MVMVxSWL/r
         j2U02Xg87Jaj6p6fmqDXpWFhz3lUdgvfbAo/WoU6q2bUYmBPPEnjRUfu2GDQw8SlPOjS
         U1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MXnLYo9xw7ZM5aZsNEA3HWbbU8vuMQcB/bLy8UKaVuQ=;
        b=pYcBFROdBUhfSPIo/+3GoNspEOSPPIpfUS1k7knezIljIJ+1tLa/zBGl0KSkBrG/nX
         jdjAhhs8YzFhU5T7rdUYX8hxCD1z3qt8hOy/xdiD6neXpQH0imh8ZP5JxG6NYWqiJKMg
         16h2Obe2Qtw/rKEiwlRMMoCrIYb6BqVqkEzpAkVXT+Nj8RRSW97LXT+cU8uXhnFstVL0
         hDJI2Qokc4OPtpyoFJ1wueSrH8komVFl2h/py8JV/jlARuJUPZnNgiqajiHKi/vXtNbl
         BXfwMWyj/qe2G/SB2/n1uteQbtUgkjx3ha8DvS6rwuIvNPiuXjlMU+Ev8TI1fnMp0qtk
         DSZA==
X-Gm-Message-State: AOAM5331pHiNc9/dV3ER+OFALxsxE3+iUjEC7IpN1SVo68bRpGRRxbh7
	SWEi1ilRy88ApdjojDFMAHMrNOjg08Q=
X-Google-Smtp-Source: ABdhPJwthWqJXtZl14ZghIYODOBpHT6wWzje4495Bm9dc+pJoerUNbnUhdeElbQLAHfMELC+WhlT5A==
X-Received: by 2002:a05:6512:3b0f:b0:42d:1ebb:dcbf with SMTP id f15-20020a0565123b0f00b0042d1ebbdcbfmr2261329lfv.275.1645024590841;
        Wed, 16 Feb 2022 07:16:30 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com,
	jbeulich@suse.com,
	julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	artem_mygaiev@epam.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 0/4] Yet another pci/vpci locking re-work
Date: Wed, 16 Feb 2022 17:16:24 +0200
Message-Id: <20220216151628.1610777-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Hello, all!

This is a yet another attempt to re-work the existing pci/vpci locking
scheme towards vPCI is going to be used for guests.
For more details on the previous attempts and their flaws please see [1], [2].

This work is based on the idea that it is possible to extend the
existing locking scheme by additionally providing a global read/write lock:

This way most of the code continues to use pcidevs_{lock|unlock}, so
only minor changes are required which do not lead to functional changes
seen by the users: these become readers with respect to the new rwlock
and they acquire _pcidevs_lock as before.

As to the writers (those which can add/remove pci devices and their
respective pdev) we need to make them use the new rwlock in write mode.
For that we introduce pcidevs_write_{un}lock helpers.

Those users, which do not add/remove pdevs and are only interested in
pdev->vpci or simple pdev's list traversal, will use
pcidevs_read_{lock|unlock} which only acquires the rwlock in read mode
without acquiring _pcidevs_lock. This is to make sure there is no
unnecessary contention for the later. For the cases when it is required
to make sure that no other CPU can access critical sections under the
read lock (modify_bars for example) it is possible to upgrade it to a
normal pcidevs_lock due to both read lock and _pcidevs_lock allow
recursion.

The series was tested on:
 - x86 PVH Dom0 and doesn't break it.
 - x86 HVM with PCI passthrough to DomU and doesn't break it.

Thank you,
Oleksandr

[1] https://lore.kernel.org/xen-devel/20180717094830.54806-2-roger.pau@citrix.com/
[2] https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/

Oleksandr Andrushchenko (4):
  pci: add rwlock to pcidevs_lock machinery
  vpci: restrict unhandled read/write operations for guests
  vpci: use pcidevs locking to protect MMIO handlers
  vpci: resolve possible clash while removing BAR overlaps

 xen/arch/x86/hvm/vmsi.c       | 24 +++++++++++--
 xen/drivers/passthrough/pci.c | 65 +++++++++++++++++++++++++++++------
 xen/drivers/vpci/header.c     | 30 ++++++++++++++--
 xen/drivers/vpci/msi.c        | 21 +++++++----
 xen/drivers/vpci/msix.c       | 55 +++++++++++++++++++++++++----
 xen/drivers/vpci/vpci.c       | 34 +++++++++++++++---
 xen/include/xen/pci.h         |  9 +++++
 xen/include/xen/vpci.h        |  2 +-
 8 files changed, 205 insertions(+), 35 deletions(-)

-- 
2.25.1


