Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868038907B7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 18:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699143.1091756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rptx4-0007R2-0l; Thu, 28 Mar 2024 17:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699143.1091756; Thu, 28 Mar 2024 17:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rptx3-0007OJ-U7; Thu, 28 Mar 2024 17:54:09 +0000
Received: by outflank-mailman (input) for mailman id 699143;
 Thu, 28 Mar 2024 17:54:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ab0Y=LC=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rptx2-0007OD-Os
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 17:54:08 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bcc8edd-ed2c-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 18:54:06 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-414866f92beso8684385e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 10:54:06 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h16-20020adff4d0000000b0033e72e104c5sm2285714wrp.34.2024.03.28.10.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 10:54:05 -0700 (PDT)
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
X-Inumbo-ID: 2bcc8edd-ed2c-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711648446; x=1712253246; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lvbGGP481GShGw2Ixv/G+6iddI9tX03SDqf7LmF6gpY=;
        b=MUUiBEs1MsmXqznprxvQ74MGRSnURDWT0AnjIzeK+dpjCPNrgvaDSFBmMVvi2fToJ/
         GAQHjO+ix3Z4vt/8CbqlfRCdGJdlLMiMqqld9yjIJSB4tpHLrl50ztF612OroXpX+MYd
         zT+6TfpDQKBWiqtOGUCoxu+GFUX2hqpMupwjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648446; x=1712253246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvbGGP481GShGw2Ixv/G+6iddI9tX03SDqf7LmF6gpY=;
        b=O4k0ltlE38pyOOU+k6dunsuVSFZIecMSLCyqEKmwJI8o80/JP43gP3CyaCBmwLR79z
         5D1yXKSb49DFbg5TU0+zOzl5O18VNaLllK5fxOAqpl0VtCArETZtMY5efwxobngdhzzj
         Ag6W8X5BC2OpsnOjM9l0aIQ/1nRYF4O2BxPMSIKUZc+Q3X0INExxxev99hKIYlopRJyb
         5DLg2PQ6UmOOfkdSChI2X43C6SnNNq1d3zRaTBeprnLT0sLmBOCeHZDo9VY1NLvfMo7Y
         R1sfmLU5EtYILbnFdYCY1xJQPNcln5wzZ4OLgaO+w5IGDc0uC4XVKS1jhvBCr0MzmU7B
         hrXQ==
X-Gm-Message-State: AOJu0YwaxPIU3z7X262/Ggokeyfgr724NRNDiyXc+fpQjRmFSwZ678qH
	5PrK6W4aK4VziTP+NKwbZASIFvaVv/v2HoXRd4wdIwvk52kwHjWeJX9JtzcMxT7BB13x2dyfP10
	I
X-Google-Smtp-Source: AGHT+IFlupp7g84BElUQl+bJ8RjExf9x0KikAwip0H3Ekf+iWdz4UPk703nfkT3KCDtZUKDYVHSlJg==
X-Received: by 2002:a5d:4cc8:0:b0:33e:c0a9:79c with SMTP id c8-20020a5d4cc8000000b0033ec0a9079cmr2654116wrt.23.1711648445764;
        Thu, 28 Mar 2024 10:54:05 -0700 (PDT)
Date: Thu, 28 Mar 2024 17:54:04 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [OSSTEST PATCH 00/36] Switch to Debian Bookworm
Message-ID: <93b8a3e8-2866-42ca-9132-1527d82928e9@perard>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318165545.3898-1-anthony.perard@citrix.com>

On Mon, Mar 18, 2024 at 04:55:09PM +0000, Anthony PERARD wrote:
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

I've pushed up to here. I'll push the last two patches later.

>   Temporally switch "qemu-mainline" branch to Bookworm

And I'll drop this one.

>   Switch to Debian Bookworm as default suite
>   make-hosts-flight: default to bookworm


Cheers,

-- 
Anthony PERARD

