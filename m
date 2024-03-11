Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4F987864D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 18:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691561.1077644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjjRR-0006S7-2x; Mon, 11 Mar 2024 17:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691561.1077644; Mon, 11 Mar 2024 17:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjjRR-0006Qb-0A; Mon, 11 Mar 2024 17:28:01 +0000
Received: by outflank-mailman (input) for mailman id 691561;
 Mon, 11 Mar 2024 17:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UbMp=KR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rjjRP-0006QV-Rf
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 17:27:59 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c32fa8-dfcc-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 18:27:58 +0100 (CET)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3c1ea5b42e7so1942749b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 10:27:58 -0700 (PDT)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 vv14-20020a05620a562e00b00788662eda89sm1837700qkn.15.2024.03.11.10.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 10:27:55 -0700 (PDT)
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
X-Inumbo-ID: b3c32fa8-dfcc-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710178077; x=1710782877; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N65cQcdg6uyPizXZCPwzdDvQhh5w9InmBIs0WXwkfl0=;
        b=vF2TeGruIMGKPcsjLFKKYxxcpTOaDWpOBGpcThEuM9jmu2Q+17YayV729oS6Wde/Ua
         zHxtuccIskShqD6uJYBNXRX+BcR7ozhFLIY8FhCpavWlcL9nhrfY5bdXsfeICytm01hL
         kyG9O2Jf1vnEvTDE2nUt2owrYrfHgAs8yxl8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710178077; x=1710782877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N65cQcdg6uyPizXZCPwzdDvQhh5w9InmBIs0WXwkfl0=;
        b=Z/BKPLYwpWLu/oQCgEuJSmQZT8IliAzpiwzAqU2sYaNvnTn9WKC67L+OG36gNdFtLS
         yQUvIbt+8OB+qRuxom9WnErPi0Rq7WTO8fKnrIPag3VIclAe5CWOuwTxndrVlS/WnVdW
         2wjTXEmd7V7oWHWkiyBSSlCb+DzaA10r4iEXXJIP+481Pys6wxhYkK0syHah9lzEfQSX
         uja08+WH25FHULsW3+QR+vn6l6Rp/N+eDHYq0z8HqOWV1FE25GfQiqS6UB84KjwA22VM
         nayR7gEqzd5tADXBGFwY6VJdchGJSJBlco+O0ZBIDHmRkjTkjinLzKGimw9hoSA0xpqK
         Fg5g==
X-Gm-Message-State: AOJu0YywHSIavH/X0To57aDUBEl6vREpnlfZ3vLlHsFs5KRD7UIZ7+GN
	f63TXwG8xrR3kBImdVcpjqxXVW1ZbNB/DmPk5jqaQMADD3aL32cAR82auumcP/I=
X-Google-Smtp-Source: AGHT+IHG6xMGHzeyv9S/JYSx4dG33eg2aA2qHBQ42wtSwJB9YbqyMgvv6WO8VWFbdiYRCG6BfrTI3g==
X-Received: by 2002:a05:6870:f14a:b0:220:daa3:4800 with SMTP id l10-20020a056870f14a00b00220daa34800mr8499941oac.40.1710178077192;
        Mon, 11 Mar 2024 10:27:57 -0700 (PDT)
Date: Mon, 11 Mar 2024 18:27:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [OSSTEST PATCH] ap-common: Switch to Linux 6.1 by default on x86
 + drop dom0 i386
Message-ID: <Ze8_GPiqd9L5SzE8@macbook>
References: <20240306114741.14564-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240306114741.14564-1-anthony.perard@citrix.com>

On Wed, Mar 06, 2024 at 11:47:41AM +0000, Anthony PERARD wrote:
> linux-4.19 branch in xenbits is outdated, it haven't been updated and
> tested since 2020 as it has been disabled in osstest. Also, this 4.19
> branch doesn't build on Bookworm.
> 
> So we will start to use a newer version of Linux. We switch to 6.1 for
> the Arm* tests recently, so will use that same version for x86.
> 
> Also, following commit 3a3089c94913 ("mfi-common: Drop Linux dom0 i386
> tests for newer Linux branches"), 32bit dom0 isn't tested on newer
> Linux, so we need to drop all dom0 i386 tests wherever the default
> linux branch is used. That is, this changes in jobs will apply to
> "xen-unstable" branch but also all xen stable branches, seabios, qemu,
> osstest, libvirt, so every branch that aren't "linux-*".
> 
> Here is the list jobs that changes, and whether they are replace, or
> have existing equivalents, on the "xen-unstable" branch. Changes
> compared with:
>     OSSTEST_CONFIG=standalone-config-example nice eatmydata ./standalone-generate-dump-flight-runvars
> 
> Gone, without exiting or new test-amd64-amd64-*:
> - test-amd64-i386-freebsd10-amd64
> - test-amd64-i386-freebsd10-i386

I should have removed those long time ago, as FreeBSD has been EOL for
ages.

> - test-amd64-i386-qemut-rhel6hvm-amd
> - test-amd64-i386-qemut-rhel6hvm-intel
> - test-amd64-i386-qemuu-rhel6hvm-amd
> - test-amd64-i386-qemuu-rhel6hvm-intel
> 
> Gone, but with exiting test-amd64-amd64-* equivalent:
> - test-amd64-coresched-i386-xl
> - test-amd64-i386-examine
> - test-amd64-i386-examine-bios
> - test-amd64-i386-examine-uefi
> - test-amd64-i386-libvirt
> - test-amd64-i386-libvirt-pair
> - test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm
> - test-amd64-i386-libvirt-xsm
> - test-amd64-i386-livepatch
> - test-amd64-i386-migrupgrade
> - test-amd64-i386-pair
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
> - test-amd64-i386-xl-xsm
> 
> Gone, but replaced by a new test-amd64-amd64-*:
> - test-amd64-i386-libvirt-raw
> - test-amd64-i386-xl-vhd
> 
> Some test-amd64-amd64-* are also changed:
> - test-amd64-amd64-libvirt-vhd
> - test-amd64-amd64-qemuu-freebsd11-amd64
> - test-amd64-amd64-qemuu-freebsd12-amd64
> - test-amd64-amd64-xl-qcow2
> + test-amd64-amd64-freebsd11-amd64
> + test-amd64-amd64-freebsd12-amd64
> + test-amd64-amd64-libvirt-qcow2
> + test-amd64-amd64-libvirt-raw
> + test-amd64-amd64-xl-vhd

Is this purely a name change, or there's some kind of functional
change?

I'm mostly worried whether this could lead to regressions getting in
as osstest would detect those jobs as new instead of inheriting from
the previous jobs.  Also the "History for test ..." won't link to jobs
prior to the rename?

I guess I'm confused about what causes the qemuu to be dropped from
the job names above.

Thanks, Roger.

