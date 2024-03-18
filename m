Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4636D87E793
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 11:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694576.1083419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmASC-0003c1-Kg; Mon, 18 Mar 2024 10:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694576.1083419; Mon, 18 Mar 2024 10:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmASC-0003Zs-Hf; Mon, 18 Mar 2024 10:42:52 +0000
Received: by outflank-mailman (input) for mailman id 694576;
 Mon, 18 Mar 2024 10:42:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8te1=KY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmASB-0003Zj-IB
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 10:42:51 +0000
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [2607:f8b0:4864:20::e31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 429c4f03-e514-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 11:42:48 +0100 (CET)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-4766e56ccccso1104189137.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 03:42:47 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 t26-20020a05620a035a00b00789fb5397d4sm1142033qkm.100.2024.03.18.03.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 03:42:45 -0700 (PDT)
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
X-Inumbo-ID: 429c4f03-e514-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710758567; x=1711363367; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNXGfHICvCJmaSXUF97NFYIM8VOq6lSNbXkP8BoBeiM=;
        b=p2z8RCXaFQAAN4yepOJ8HtRpjQEcjWEQLTUl9OLoyiuWvF2FWAdPOYbIAOunHMs4sO
         Q1WhcblKf7vbd6DXDa5tk2RgmgNpD3tIbDSywlqkD47v3K09aHCriJCxVXZx41oBcDao
         GjAfIvGHPgyagA2iMXW7dkyZ/oVOUDM6Hjv3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758567; x=1711363367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SNXGfHICvCJmaSXUF97NFYIM8VOq6lSNbXkP8BoBeiM=;
        b=DEzgSNT0uMy7rP6sxsSpntEvCOiXGfcUDrdcPx8t0qTDOPTzCyAjeFpmRhhT+z/h2u
         DBmfed6hrVrIGbo2ux/nGJFoZ6vv30sVJmoKLH6s19XwkLueToPdpxXjLhTkBn3Fo7lA
         iY9FOo//gQwt8XzPCUmk0ZZm3fKRjEWxqysugfimE2oV0ruY47Al3CNA2kMidiE52krZ
         0FCbT/9y9A0sKDPKsKRfwtifDRqYC8XUcnsaMzCfMK3u0cci53G+W92v14I8d8qqNGw4
         0an3ZG4C0cKZZo0unL/4YX1fIJAcLN85qDCh/t9vy3ss3crjHrNNEjGrrwIEtgpMtO39
         SDaQ==
X-Gm-Message-State: AOJu0Yyy3mph/5lV5kuqSlVJA2VzxqOLB0068bdEW/WIbLBun96/T7Oh
	eb7M0zmzELNAhyCPUSkMBSpODjNAUOjXplY/JzvCECyM7VoPEoMXE+LkjvhtYe8=
X-Google-Smtp-Source: AGHT+IESddaQzFGXhOQLu3zE8U/OaaHxyJPeulHsVzNPdh1xUNkPYkHO7lrO3IY3+d1tq5JSRLLhZA==
X-Received: by 2002:a05:6102:d9:b0:476:7d83:9dae with SMTP id u25-20020a05610200d900b004767d839daemr2565971vsp.2.1710758565888;
        Mon, 18 Mar 2024 03:42:45 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:42:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH v2 0/3] Switch to Linux 6.1 by default on x86
Message-ID: <Zfgao9BaG20mLRuU@macbook>
References: <20240315154849.28819-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240315154849.28819-1-anthony.perard@citrix.com>

On Fri, Mar 15, 2024 at 03:48:46PM +0000, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/osstest.git br.linux-6.1-v2
> 
> Hi,
> 
> A set of patch which lead to using Linux 6.1 instead of 4.19 as a default
> kernel on x86.
> 
> I've check the list of jobs changes with
> OSSTEST_CONFIG=standalone-config-example nice eatmydata ./standalone-generate-dump-flight-runvars
> 
> All branches are affected with changes, most will have the same changes as the
> branch "xen-unstable" (unless the only have a subset of those jobs like
> "libvirt"), and linux-{linus,6.1} will have the changes as listed on
> linux-linus.
> 
> Thanks,
> 
> xen-unstable:
> - test-amd64-coresched-i386-xl
> - test-amd64-i386-examine
> - test-amd64-i386-examine-bios
> - test-amd64-i386-examine-uefi
> - test-amd64-i386-freebsd10-amd64
> - test-amd64-i386-freebsd10-i386
> - test-amd64-i386-libvirt
> - test-amd64-i386-libvirt-pair
> - test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
> - test-amd64-i386-libvirt-raw
> - test-amd64-i386-libvirt-xsm
> - test-amd64-i386-livepatch
> - test-amd64-i386-migrupgrade
> - test-amd64-i386-pair
> - test-amd64-i386-qemut-rhel6hvm-amd
> - test-amd64-i386-qemut-rhel6hvm-intel
> - test-amd64-i386-qemuu-rhel6hvm-amd
> - test-amd64-i386-qemuu-rhel6hvm-intel
> - test-amd64-i386-xl
> - test-amd64-i386-xl-pvshim
> - test-amd64-i386-xl-qemut-debianhvm-amd64
> - test-amd64-i386-xl-qemut-debianhvm-i386-xsm
> - test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm
> - test-amd64-i386-xl-qemut-win7-amd64
> - test-amd64-i386-xl-qemut-ws16-amd64
> - test-amd64-i386-xl-qemuu-debianhvm-amd64
> - test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow
> - test-amd64-i386-xl-qemuu-debianhvm-i386-xsm
> - test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict
> - test-amd64-i386-xl-qemuu-ovmf-amd64
> - test-amd64-i386-xl-qemuu-win7-amd64
> - test-amd64-i386-xl-qemuu-ws16-amd64
> - test-amd64-i386-xl-shadow
> - test-amd64-i386-xl-simplat-amd64-buster
> - test-amd64-i386-xl-vhd
> - test-amd64-i386-xl-xsm
> - test-armhf-armhf-libvirt-qcow2
> - test-armhf-armhf-libvirt-raw
> - test-armhf-armhf-xl-vhd
> + test-amd64-amd64-libvirt-qcow2
> + test-amd64-amd64-libvirt-raw
> + test-amd64-amd64-xl-raw
> + test-amd64-amd64-xl-vhd
> + test-armhf-armhf-libvirt-vhd
> + test-armhf-armhf-xl-qcow2
> + test-armhf-armhf-xl-raw

The shuffling of the armhf disk formats is unfortunate, but I don't
think there's much we can do about it without hardcoding the
combinations to be fixed instead of randomly spread.  I don't think
this random spreading was a good idea, as it's easy for unrelated
changes to alter the resulting tests, thus loosing history.

> 
> linux-linus:
> - test-amd64-amd64-freebsd11-amd64
> - test-amd64-amd64-freebsd12-amd64
> - test-armhf-armhf-libvirt-qcow2
> - test-armhf-armhf-libvirt-raw
> - test-armhf-armhf-xl-vhd
> + test-amd64-amd64-libvirt-vhd
> + test-amd64-amd64-qemuu-freebsd11-amd64
> + test-amd64-amd64-qemuu-freebsd12-amd64
> + test-amd64-amd64-xl-qcow2
> + test-amd64-amd64-xl-raw
> + test-armhf-armhf-libvirt-vhd
> + test-armhf-armhf-xl-qcow2
> + test-armhf-armhf-xl-raw
> 
> Anthony PERARD (3):
>   make-fligh: Fix freebsd guest test test-id
>   mfi-common: Rework toolstack-disk_format test matrix
>   ap-common: Switch to Linux 6.1 by default on x86 + drop dom0 i386

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

