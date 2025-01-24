Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68020A1B7E6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 15:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876799.1287152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbKij-0007Qb-PI; Fri, 24 Jan 2025 14:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876799.1287152; Fri, 24 Jan 2025 14:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbKij-0007Os-MV; Fri, 24 Jan 2025 14:31:41 +0000
Received: by outflank-mailman (input) for mailman id 876799;
 Fri, 24 Jan 2025 14:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbKih-0007Oi-Oc
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 14:31:39 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb707cd5-da5f-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 15:31:38 +0100 (CET)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-218c8aca5f1so50835365ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 06:31:38 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414130esm16801875ad.111.2025.01.24.06.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 06:31:36 -0800 (PST)
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
X-Inumbo-ID: eb707cd5-da5f-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737729097; x=1738333897; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tvsWvoZq6BRKZKu3jbGoZYBysZtTlW+vOvhDwSNRv+0=;
        b=Qofug35nImLf1drtS6lu6fFdeTh+3EWNDz7lHvkhX91NXSPme/d7DkCLGqmmw/NvHr
         q4TvoE/Tmc9YWiIJ7MgVtce5tfmEf6tdWLW+ZtTxNWEKFPNCKZLZ0RXwQubpBYADqYbB
         3s1rTUkLELK4x6WgvdRHPXDM8Ca/u73A5fbkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737729097; x=1738333897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvsWvoZq6BRKZKu3jbGoZYBysZtTlW+vOvhDwSNRv+0=;
        b=W/7hJZ1OIRsvsdKYqmwkE8lmHLRqEHKGDlCIyNJSQxDjURwORMuFkjwZHxt4Y0uOJE
         cce+HEBkXmIsavz4Rb8do5uSz1aEl5BGT5A/bEHHZcInESHt2jcBlK/XulQ6jHfaQXoW
         s6oChoL9LmTC9numPBKyVLpR4qU8lHNhcd4LD6Xs0K256wS8kX8RLJVsoVYzQnHi/86Z
         TFOY8tEe8s0eo1Mw9GxA1tFaCp0detUTbcWvcLF+U7ockXxQZo2Yl0oz4ydbha680P05
         HOQKiwxXw3kbv5yjZIfJeAgvR9oOVHHMSXvnT1UP26R1NbEiD66l2P7u0BOrgVtYVWXn
         Xauw==
X-Gm-Message-State: AOJu0Yxse9BnbvWGcP1Gpw5EVu1X7Vre0j4CR89Xm2JVWmDB2oVbrKDL
	YrOqeCR/F8sqJ+mQqFVHi7U5JCJc2ETUWF47nGjD/WtxQS98ppqb7CDxTzIixLo=
X-Gm-Gg: ASbGncuEWxJPOQEDR/8IZOWNPOm7CcWa3du11LlUhULi3S7IvoNHEBKLt+4Z+aMHlOC
	GPFlr+y5LFeRYPidwgNjMJnbm0lbez1yBCJdfsGZUqf1UdzNiJD1DxApeaHKO0eJkWXzCuuaywR
	72HeyuZi/YvidclwXiIIlPBeW2LX2DL1D7OThkWaeHlmCWOavNQdSCG3Pgpd2ffMqDH9Bh8zMAz
	/430V1mB1FmLfaouXbf5Oe3Slyol430V1L4OMpc0bw5wWjgDDru2Ps3EfABFYhyHl/Qy47JulJY
	i49xhHTnUw==
X-Google-Smtp-Source: AGHT+IHShirqn2nSv9AUkshTdIGi7nAT+R5X2yHOU2NiXaSlWOXkBWZXDPw6E15Hfla6KJ9stGjGVw==
X-Received: by 2002:a17:902:d50e:b0:216:73f0:ef63 with SMTP id d9443c01a7336-21c3563c76cmr456757925ad.49.1737729097292;
        Fri, 24 Jan 2025 06:31:37 -0800 (PST)
Date: Fri, 24 Jan 2025 15:31:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Serious AMD-Vi issue
Message-ID: <Z5OkQgjd4Lt_rtr0@macbook.local>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>

On Thu, Jan 25, 2024 at 12:24:53PM -0800, Elliott Mitchell wrote:
> Apparently this was first noticed with 4.14, but more recently I've been
> able to reproduce the issue:
> 
> https://bugs.debian.org/988477
> 
> The original observation features MD-RAID1 using a pair of Samsung
> SATA-attached flash devices.  The main line shows up in `xl dmesg`:
> 
> (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I

I think I've figured out the cause for those faults, and posted a fix
here:

https://lore.kernel.org/xen-devel/20250124120112.56678-1-roger.pau@citrix.com/

Fix is patch 5/5, but you likely want to take them all to avoid
context conflicts.

Can you give it a try and see if it fixes the fault messages, plus
your issues with the disk devices?

Regards, Roger.

