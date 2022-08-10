Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311BA58E68F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 07:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383325.618495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwY-0005aN-C9; Wed, 10 Aug 2022 05:07:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383325.618495; Wed, 10 Aug 2022 05:07:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLdwY-0005Ul-8W; Wed, 10 Aug 2022 05:07:46 +0000
Received: by outflank-mailman (input) for mailman id 383325;
 Wed, 10 Aug 2022 05:07:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CIQX=YO=gmail.com=lukas.bulwahn@srs-se1.protection.inumbo.net>)
 id 1oLdwW-0005BF-UZ
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 05:07:44 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e018c6b-186a-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 07:07:44 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id b16so17607439edd.4
 for <xen-devel@lists.xenproject.org>; Tue, 09 Aug 2022 22:07:44 -0700 (PDT)
Received: from felia.fritz.box
 (200116b826504800504e9aff21bf95aa.dip.versatel-1u1.de.
 [2001:16b8:2650:4800:504e:9aff:21bf:95aa])
 by smtp.gmail.com with ESMTPSA id
 ew12-20020a056402538c00b0043bbbaa323dsm7009781edb.0.2022.08.09.22.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 22:07:43 -0700 (PDT)
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
X-Inumbo-ID: 5e018c6b-186a-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=/QGtQjFwrpxqvD/2kl5l0yjrJcEXf60xBhPRPT4PMoA=;
        b=GAe7/3paFERirxke/DBRSvzvyfo3gWidABn7thm95giMW+HV2HqKwT8qUQuiRWv1XN
         ue5u3oJgkxX8+vB5ZTCuGdckZVwFAxgEKMwUB/reIkdRp8E8fhaerBfHmKkgcTvuPKEv
         c8ZDZOgYd4avspD/J2GsUOFl/nv+GlXPY43wEkeZtmJpqBBWGRYUPdG3JwIL8WiCftml
         40p0mA/44jsByBfIJsZxzxi0uZ3w8XW/lAAo5wrPUTXTdsm80pN1fASSj0ohcPkvmVqf
         a77AyZl8o26lasym7opxdvnGs2Hw30CUAvzh+e7vOPAyesecgnFzDfI0wcCvG7+BzBgC
         88Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=/QGtQjFwrpxqvD/2kl5l0yjrJcEXf60xBhPRPT4PMoA=;
        b=zqALxqKFtAg0Fxr9aROLX80pkOugvfzA15HSsPBwC1uorHj4nGiRu+IKbiCBHAt5K5
         T20P5eNFZacofbP9LFWUckldyydvsg+jmcwewZDJ3gbueZ7Y6eJ7lg4G6/NqG8jL6n7h
         95EBWZS2ivGyODTNMUtq9rG2AB/7mhjo0NeGEx+UZ+1CFScyQt+R6CTyLVYVCCmgiL2/
         NwVUukuUOPihySeeF+vtHyQgj+4zzIvVVWAnqXKIv8ZclOJC3ZUKuHkJBATdtM3W0L3E
         iu6a7UucplSioBj6L72HdKqRo6QWcG6P68JQ9NIQW/Ds8uhnRAjCEASUgkj1f4/Wt4BH
         Du5w==
X-Gm-Message-State: ACgBeo1s3ex0Txf26pvKAIrunnBqIngvU4SUZTCxHQd/u33xdj5EnsXC
	wfKiogNo8zoqsEMYLCx6LarG4K+9FB8=
X-Google-Smtp-Source: AA6agR50NrhEtvIkwWAt2TLZ2+KyugoS0bLjK72bNnhhj6ZmZeHTbWPqCbTWKO6YhrfRBVfwhckfCA==
X-Received: by 2002:a05:6402:c45:b0:442:c549:8e6b with SMTP id cs5-20020a0564020c4500b00442c5498e6bmr865379edb.123.1660108063872;
        Tue, 09 Aug 2022 22:07:43 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 2/4] xen: remove XEN_SCRUB_PAGES in xen.config
Date: Wed, 10 Aug 2022 07:07:10 +0200
Message-Id: <20220810050712.9539-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220810050712.9539-1-lukas.bulwahn@gmail.com>
References: <20220810050712.9539-1-lukas.bulwahn@gmail.com>

Commit 197ecb3802c0 ("xen/balloon: add runtime control for scrubbing
ballooned out pages") changed config XEN_SCRUB_PAGES to config
XEN_SCRUB_PAGES_DEFAULT. As xen.config sets 'XEN_BALLOON=y' and
XEN_SCRUB_PAGES_DEFAULT defaults to yes, there is no further need to set
this config in the xen.config file.

Remove setting XEN_SCRUB_PAGES in xen.config, which is without
effect since the commit above anyway.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 kernel/configs/xen.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/configs/xen.config b/kernel/configs/xen.config
index ff756221f112..436f806aa1ed 100644
--- a/kernel/configs/xen.config
+++ b/kernel/configs/xen.config
@@ -34,7 +34,6 @@ CONFIG_INPUT_XEN_KBDDEV_FRONTEND=m
 CONFIG_XEN_SCSI_FRONTEND=m
 # others
 CONFIG_XEN_BALLOON=y
-CONFIG_XEN_SCRUB_PAGES=y
 CONFIG_XEN_DEV_EVTCHN=m
 CONFIG_XEN_BLKDEV_FRONTEND=m
 CONFIG_XEN_NETDEV_FRONTEND=m
-- 
2.17.1


