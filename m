Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313F289D717
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 12:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702228.1097134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru8pn-0000st-Mx; Tue, 09 Apr 2024 10:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702228.1097134; Tue, 09 Apr 2024 10:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru8pn-0000r3-KF; Tue, 09 Apr 2024 10:36:11 +0000
Received: by outflank-mailman (input) for mailman id 702228;
 Tue, 09 Apr 2024 10:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ru8pm-0000qw-Ox
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 10:36:10 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faa57b14-f65c-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 12:36:09 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-416632343d0so15537495e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 03:36:09 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o32-20020a05600c512000b004163321790esm14051022wms.19.2024.04.09.03.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 03:36:08 -0700 (PDT)
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
X-Inumbo-ID: faa57b14-f65c-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712658969; x=1713263769; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w3rT+xEpYur+zOIyTaMERteYIBg4r43hD9FxqZ8lYJ8=;
        b=P6kSvQy0ujrFXuvIIpcsi/QQ6v3XfuGS0XpbZy9R7AgA3PVKsus/vUQNr8yZb04mTn
         D3E0by1EQbaHP7yZckAWtXZ92o6UCIwCcsg4L/RxpSh62Wad502JZZC1M1jw3szgojJY
         EO4V/E+sPdjPDmkj8DckU6txr996tMBFnb5nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712658969; x=1713263769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3rT+xEpYur+zOIyTaMERteYIBg4r43hD9FxqZ8lYJ8=;
        b=i18xSA6gjQmpRIV959ILSvtGs1QtRt+fl1tub3+5My/0ATAB8EYet+QHjuhKIYXnov
         1fgkR56ZyKollz2cY4ktG2/S+o8W96Ly+EP/mRi7FsETsuQH0PEvifA3h29OnmPD/Wl9
         YGy88CvRuyXjWUdxJc78lyQhJZjSAAZ9N4okbrqXF1AubLmqh/OildCvWCa6dD5x6RLB
         yemiKtYsUY1eTWaaTVm8mkZteIqvM08KfCNqqPvLWSHJ8QYxwDbZ+3QBvdRHDx++Y81H
         xN15g6ah5SGCrm/xZinqEqofiArfZfbp97rw65Dt9mfL5nvbqDoqfVw7ZFXovQdrGpm5
         /Ubg==
X-Gm-Message-State: AOJu0YxK3Td8xC3UJwfvr9bIyp8mk4jCtyhgfKfq6VhnLcklk5Uo456X
	+4Tu1lPPnlTYKMCsL5axHx06wlHyIbtbEzyrgxVaXvbpfoBal0Z6FT0BUT0umoI=
X-Google-Smtp-Source: AGHT+IFzO1U2/OQc9BCsP0kcqDoJ6iGKHHRCU8op1TyOZf6mcYBEIbs9fHNW6HJruI0BS3h+rxGAjQ==
X-Received: by 2002:a05:600c:4f05:b0:416:6d1d:e2 with SMTP id l5-20020a05600c4f0500b004166d1d00e2mr4248393wmq.3.1712658969355;
        Tue, 09 Apr 2024 03:36:09 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:36:08 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2] libxl: devd: Spawn QEMU for 9pfs
Message-ID: <c5fd7030-fc65-4394-ab2c-4b85a0c21214@perard>
References: <20240407205809.60871-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240407205809.60871-1-jandryuk@gmail.com>

On Sun, Apr 07, 2024 at 04:58:09PM -0400, Jason Andryuk wrote:
> Add support for xl devd to support 9pfs in a domU.  devd need to spawn a
> pvqemu for the domain to service 9pfs as well as qdisk backends.  Rename
> num_qdisks to pvqemu_refcnt to be more generic.
> 
> Keep the qdisk-backend-pid xenstore key as well as the disk-%u log file.
> They are externally visible, so the might be used by other tooling.

nit:                              ^^^ they

> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v2:
> Retain xenstore qdisk-backend-pid and qdisk-%u logfile

Patch looks fine otherwise:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

