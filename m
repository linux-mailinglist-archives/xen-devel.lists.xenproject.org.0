Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D87881692
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 18:28:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696068.1086658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzk6-0004OS-52; Wed, 20 Mar 2024 17:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696068.1086658; Wed, 20 Mar 2024 17:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzk6-0004Ly-2D; Wed, 20 Mar 2024 17:28:46 +0000
Received: by outflank-mailman (input) for mailman id 696068;
 Wed, 20 Mar 2024 17:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmzk5-0004Ft-6w
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 17:28:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d43b9bc-e6df-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 18:28:44 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4146a1b6faaso661415e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 10:28:44 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 bj26-20020a0560001e1a00b0033ed84facdbsm11930968wrb.82.2024.03.20.10.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 10:28:43 -0700 (PDT)
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
X-Inumbo-ID: 4d43b9bc-e6df-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710955724; x=1711560524; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I9dN+XTUUOK5ZHJ5lslw35YULw6D3k2GJmTl0TRjSnQ=;
        b=kGjMl9oGMpil/DvHuWC7LC6si/0tEpaxg8woiZ5+uElTphcutW2TJ4Yy2ddV4NwN3F
         QuLjBJmuLK/e1U7Fmp15HoCKqDkZHH1RincP7J5tCPxly9njcXbfh3wH3s2x/uPnowce
         l8u9pl+Pp8zqSqgnd4NK/n6XGOR5PhstGHi9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710955724; x=1711560524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9dN+XTUUOK5ZHJ5lslw35YULw6D3k2GJmTl0TRjSnQ=;
        b=NGUcJ8bDJz2HXpZ+DXnuYDN2tSr53dSRea9Xcl8WhQA1cFXbXlyOu4CpXz9tXMGiip
         TMBnIT9xCS3t6PR9PBiwHLiALSXiNc+ewc7k0oi54eCYu6SWrIAHcqKtkdcRCbrYoKVY
         SXJfl19c+Cy9O5EWuIpzLlldTNa55hnuBQw2RrVcPo2lemr9Dy4ClVWbozAHubDLyqob
         7r8UBL83OfgVBaVuVvt0akARL6l8u0Dvx+INXtLrDyNfq3oLvNxIQyQdZFS8XdlV4hKr
         eBwVLmjJ6WheHRpI6e78KTXJJEixldJiugwxVjdMzOkgSZt7CGsnkaLU6IocTjgQQuCh
         gpXg==
X-Gm-Message-State: AOJu0Yxwsd7wgIayv93yyVi70Gpi2tS7mPtLDvF2QRaeXktm5UaLXkK3
	Y8rRmYCl2LKcqFJEdlR9kNJ0vEZgyfJ72qEiLW3B/16T8Sqi1NU4VOpVW1n09dANakZwK28f2wh
	3
X-Google-Smtp-Source: AGHT+IGzW3JppBGBwrkjXrmch7N+lAOKTCTxNy97HLWa2SiXPzKPaGHdw1xQg6Y0ANgI30RoyLjWjw==
X-Received: by 2002:a05:600c:4ed3:b0:413:f4d1:199e with SMTP id g19-20020a05600c4ed300b00413f4d1199emr13357327wmq.31.1710955723942;
        Wed, 20 Mar 2024 10:28:43 -0700 (PDT)
Date: Wed, 20 Mar 2024 18:28:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 00/36] Switch to Debian Bookworm
Message-ID: <Zfscylzs817fMcEk@macbook>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>

On Mon, Mar 18, 2024 at 04:55:09PM +0000, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/osstest.git br.bookworm-v1
> 
> Hi,
> 
> I intend to push this series in two waves.
> 
> First, push up to commit "Temporally switch "qemu-mainline" branch to
> Bookworm". This is to test that osstest still works fine if we need to use
> "buster" for a branch. Also upstream QEMU doesn't build on buster anymore, so
> I've included a commit to use bookworm for it.
> 
> Second, push the remaning two patches, at least a week later, which will switch
> the default debian suite.
> 
> I did run many tests, but hopefully nothing breaks.
> 
> Cheers,
> 
> Anthony PERARD (36):
>   production-config: Add bookworm debian install media filename
>   ts-xen-build-prep: Only force git protocol v2 on buster
>   mgi-common: Fix fetch_debian_package error message
>   mg-debian-installer-update: Download non-free firmware from new repo.
>   ts-host-install: fix ntp.conf path on bookworm
>   ts-host-install: fix ntp server setting
>   ts-host-install: Restart ntp service
>   preseed_create: Use new "d-i grub-installer/update-nvram" for UEFI
>     installation
>   preseed_create: osstest-erase-other-disks: workaround creating
>     /dev/sdXD files
>   preseed_create: Workaround fail grub-install on arndale
>   ts-host-install,preseed_create: Do lvm vgextend at install time
>   di_installcmdline_core: Add link_wait_timeout to install cmdline
>   Disable persistent net generator on Bookworm
>   preseed_base, ts-host-install: Change NIC NamePolicy to "mac"
>   ts-xen-build-prep: Change package selection for Bookworm
>   bl_getmenu_open: Read grub.cfg as root
>   target_editfile: Use the same user to retrieve and send
>   ts-xen-install: remove "libc6-xen" package installation
>   overlay-bookworm: Import grub's 20_linux_xen from Debian Bookworm
>   overlay-bookworm: 20_linux_xen: Fix XSM entries generation
>   ts-xtf-install: Install python symlink
>   setupboot_grub2: Parse arm64 uefi grub verbes
>   bookworm: Extend ARM clock workaround
>   ts-nested-setup, setup l1 lvm volume groupe in guest
>   ts-leak-check: add new name for udevd workers
>   ts-debian-hvm-install: Allow udev failure in install media
>   ts-debian-fixup: Fix nic names for bookworm
>   ts-debian-install: keep avoiding to use pygrub
>   ts-debian-hvm-install: Increase min guest ram size
>   bookworm: Extend guest bootloader workaround
>   ts-debian-*-install: Replace dots in hostnames by dashs
>   ts-xen-install: Fix bridge setup, ask to copy MAC addr
>   make-flight: Keep using buster for L2 guest in nested tests
>   Temporally switch "qemu-mainline" branch to Bookworm
>   Switch to Debian Bookworm as default suite
>   make-hosts-flight: default to bookworm

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I just had a look over the commit messages mostly, as I'm not very
much into perl as to provide more accurate reviews, sorry.  LGTM, just
some comments/questions on a few patches.

Thanks, Roger.

