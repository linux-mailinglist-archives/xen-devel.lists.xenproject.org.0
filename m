Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8BF852FF1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:55:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679879.1057641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrN8-00049V-OC; Tue, 13 Feb 2024 11:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679879.1057641; Tue, 13 Feb 2024 11:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrN8-00047y-LQ; Tue, 13 Feb 2024 11:54:46 +0000
Received: by outflank-mailman (input) for mailman id 679879;
 Tue, 13 Feb 2024 11:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZrN7-00047s-A7
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:54:45 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acf1939e-ca66-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 12:54:43 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-411c779ab2dso2488435e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:54:43 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 dn7-20020a05600c654700b00411b7c91470sm1783573wmb.12.2024.02.13.03.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:54:42 -0800 (PST)
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
X-Inumbo-ID: acf1939e-ca66-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707825283; x=1708430083; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GHforX524n+IhGAmSToWCoKgL9eYJr/QjPXWxywpgPU=;
        b=V348cra5z2uhxcDFt9+oUILKAqCADHf/gjFtYbZC2nRjihNkQCTV+mAWlKC6uYfv4I
         vtndk0zMJ7BtDVMfBLoTxcQwWWH0dM9xqXCwfeJmH5W4Ovx74xByvu3cvv5XBn0SU/7L
         UIuHCK/CAT8zml/J+GV/AfNwMHZOhhr8p7r4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707825283; x=1708430083;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHforX524n+IhGAmSToWCoKgL9eYJr/QjPXWxywpgPU=;
        b=ZlQEzbPK/bncv7HtPs7l8PxTEl0NTUDcDfrb8juVs/b9uQRZvHUVSKTgRQyl9pEH4v
         wXyouZkLt0Y8zIgHTNoZ7d1ajgTFL7JBNC7soqbmGwCPXOVvmeoKBLb32q6e2EHnx+eB
         B9MB9sYVd5mwq7yb1gFH4xjS7lXpYpeqiyu48xxf6tCi6tu0j6I8uPk8aJTv8esVduva
         +WMZWkh3739IkL42pIeTYOLm348SDxzKs1K+yeBRsRnSZUjKXnyrLj3v0/Hp3Jk3Vy+q
         djd912ODMwHNVVIF2p1pnOMIW1N645/lxPb//Z+mc1ynqJdX9sFJs9Dj9c/WYb1TL0ay
         HiYw==
X-Gm-Message-State: AOJu0YzynHrnlEMLb9zdSKyfcOWhGSbVxxNMxu23ng9UisLBaE41gfz6
	RhzpFwmBQkCNRYgEVNVEV0qXKNxOoYWwouFERA9O0X63oI5qDw00LpPmFN4KQJ4=
X-Google-Smtp-Source: AGHT+IFXm5l5BOck2+xxXz4SHFCtloMRqyP8/lk9nejBFwo0ZDoQP0BamW4yCbmxWygh/G5ZhZQ+3Q==
X-Received: by 2002:a05:600c:4e06:b0:411:c25d:7018 with SMTP id b6-20020a05600c4e0600b00411c25d7018mr890540wmq.12.1707825282890;
        Tue, 13 Feb 2024 03:54:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJyp4aSECUFfTXYBDc1lPM94AYeKAJ2OGu24M4QNLTIiJ6Hhf2U6oa+OUnDUE1cDb/nHUl7CZGV7uzgQqjKYETAXa5aLg69+jF2WMqF2nWv4RBtu5wGdRsZVLKyCVIa21AOecM2r8=
Date: Tue, 13 Feb 2024 11:54:42 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_KB
Message-ID: <54abae4a-1a39-464f-8ae7-f8e806557017@perard>
References: <2bb71b2ba88e6eb6177c27dd65f2af608a634ac2.1707261567.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bb71b2ba88e6eb6177c27dd65f2af608a634ac2.1707261567.git.w1benny@gmail.com>

On Tue, Feb 06, 2024 at 11:23:45PM +0000, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> It's located in libxl_domain_build_info, not libxl_domain_create_info.

Hi Petr,

You need a "Signed-off-by:" tag when sending patches.

We could probably add also a fixes tag
Fixes: 45ba9a7d7688 ("tools/[lib]xl: Add vmtrace_buf_size parameter")

Otherwise, patch looks fine, so with the SOB: Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

