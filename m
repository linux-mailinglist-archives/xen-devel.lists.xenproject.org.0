Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C2487A61B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 11:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692332.1079352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkM9h-0006Nn-Pk; Wed, 13 Mar 2024 10:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692332.1079352; Wed, 13 Mar 2024 10:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkM9h-0006Ky-N1; Wed, 13 Mar 2024 10:48:17 +0000
Received: by outflank-mailman (input) for mailman id 692332;
 Wed, 13 Mar 2024 10:48:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWe0=KT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rkM9f-0006Ks-Po
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 10:48:15 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30d2aebe-e127-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 11:48:13 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-413ea3219feso2673645e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 03:48:13 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c190f00b0041312855081sm1945081wmq.5.2024.03.13.03.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 03:48:12 -0700 (PDT)
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
X-Inumbo-ID: 30d2aebe-e127-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710326893; x=1710931693; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1MHZBsMKC4KZU3HjGb0NPMsXzwK+B0aYwVLuhPmsPWQ=;
        b=VGP7EQ0QtsFdvgnH1JUd/Bdw7fqDpWwFTg1OuMgtOzUtYgzxGSDkXI4FN54/Y6juxE
         2ayJ8P+iKUZqKYo7aOjdYT3agcEyuUCY4N3vGi6P7QQuZS/No7z4uExTPyqKpXW97CDU
         AHCM2RJWbCd5AucBKsbOuYJ/df23BdiM6Xvec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710326893; x=1710931693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MHZBsMKC4KZU3HjGb0NPMsXzwK+B0aYwVLuhPmsPWQ=;
        b=XtvN5eXRRbuF5POyCwMRLdb+56z3MNt6VlINA1ISnm5DCYH0sbeMUt80JUwcHCaZVd
         S8vGyMqMEu6MK+MqIxzZ6kLPnSSxJ1ThX4th/Uo+5aOjj9FWcS16zbL3S7syygauRMm1
         3NrA3LQvPObeN1SlvME/mok1/UD+rKdtR4rfaDPU9KRVl4IcmtqJjJfNlLiTb1dBGvTR
         flCD6qCYBT94ouV5hqTeqjJxGXPRUFnRH8/3t/Qf6dVSa51ruDSqXwaE8s+PXtLAJdOz
         14l6zNGYCNqi1cEnnL/PJSo0IQvoRAY2c/fcb295EQMRVEs20uaDMejGOkWbuDgc0nhE
         AuWg==
X-Gm-Message-State: AOJu0YwSuDmhLebSwBYtCqDvZl88FqZ511pyAHqOCZwQ8wiMzaqa6jzA
	CMSTs79vmKw0V4jWuaKxWutYQlH1nNOMmg8bP2bhovqoTfDaJsT+Flw/lT+7bC6+eJwSKuKLuzP
	M
X-Google-Smtp-Source: AGHT+IH21KididVvla4PA1cq+3YqlLYuVZYqeMv4AJZ1Doisls1KtzHi/APVr7k56w66pLNZeLupzg==
X-Received: by 2002:a05:600c:1ca4:b0:412:e70a:ab8a with SMTP id k36-20020a05600c1ca400b00412e70aab8amr9465851wms.25.1710326892900;
        Wed, 13 Mar 2024 03:48:12 -0700 (PDT)
Date: Wed, 13 Mar 2024 11:48:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [OSSTEST PATCH] ap-common: Switch to Linux 6.1 by default on x86
 + drop dom0 i386
Message-ID: <ZfGEa_u3VZv-CuTq@macbook>
References: <20240306114741.14564-1-anthony.perard@citrix.com>
 <Ze8_GPiqd9L5SzE8@macbook>
 <dfe482d8-06d8-4b32-8a28-d6e60b6535dc@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dfe482d8-06d8-4b32-8a28-d6e60b6535dc@perard>

On Tue, Mar 12, 2024 at 05:19:46PM +0000, Anthony PERARD wrote:
> On Mon, Mar 11, 2024 at 06:27:52PM +0100, Roger Pau Monné wrote:
> > On Wed, Mar 06, 2024 at 11:47:41AM +0000, Anthony PERARD wrote:
> > > Gone, but replaced by a new test-amd64-amd64-*:
> > > - test-amd64-i386-libvirt-raw
> > > - test-amd64-i386-xl-vhd
> > > 
> > > Some test-amd64-amd64-* are also changed:
> > > - test-amd64-amd64-libvirt-vhd
> > > - test-amd64-amd64-qemuu-freebsd11-amd64
> > > - test-amd64-amd64-qemuu-freebsd12-amd64
> > > - test-amd64-amd64-xl-qcow2
> > > + test-amd64-amd64-freebsd11-amd64
> > > + test-amd64-amd64-freebsd12-amd64
> > > + test-amd64-amd64-libvirt-qcow2
> > > + test-amd64-amd64-libvirt-raw
> > > + test-amd64-amd64-xl-vhd
> > 
> > Is this purely a name change, or there's some kind of functional
> > change?
> 
> For test-amd64-amd64-qemuu-freebsd1{1,2}-amd64, it looks like the
> "-qemuu" is a bug. The freebsd jobs shouldn't have used $qemuu_suffix,
> as it doesn't use $qemuu_runvar. So I'm guessing $qemuu_suffix was just
> the value left from a previous call of test_matrix_do_one() with
> dom0arch==i386. The new name is already used by "linux-linus" branch.

FTAOD, could you mention this in the commit message?

FreeBSD doesn't use `$qemuu_runvar` because it was always using QEMU
upstream (when the FreeBSD test was added we decided to only test with
QEMU upstream).  So there's indeed no `-qemut` variant, but by
dropping the -qemuu prefix it could be confused with a PV guest
based test.

> As for the few changes in {xl,libvirt}-{raw,vhd,qcow2} tests, this is
> because of
> - f536e834f673 ("make-flight: Trim the matrix of disk format flights")
> - 5c70735f177f ("fmtarches: Use dom0arches, not hardcoded arch list")

Probably a dummy question, but why haven't those commits changed the
output of make-flight earlier?  I'm fine with the change, but I don't
really get why we are seeing it only now.

>    > It's not ideal because it means tests jumping about across arches and
>    > might let regressions go through but it's better than just dropping
>    > them, and doing a better approach is complex.
> 
> So, for those, yes, it's different tests. It adds one "-raw" test, and
> otherwise changes the toolstack used for the two other disk formats.
> 
> > I'm mostly worried whether this could lead to regressions getting in
> > as osstest would detect those jobs as new instead of inheriting from
> > the previous jobs.  Also the "History for test ..." won't link to jobs
> > prior to the rename?
> 
> Well, those tests are already in the "linux-linus" branch and the new
> "linux-6.1" branch, so we can already check manually if there's a
> regression or not. So if they pass in linux-6.1, regression will be
> detected, at least in the linux branch.
> 
> The rename of the freebsd jobs is unfortunate, but at least, it's going
> to be the correct name, instead of having a spurious "-qemuu" suffix.
> 
> As for "history of tests " pages, no I don't think we can easly link to
> to the previous job name. But that only apply to both freebsd* jobs.
> 
> We could keep the -qemuu in freebsd* jobs even if it's misleading to
> someone who know what it should mean, that would keep the job name to
> all branches and rename it in "linux-linus" branch. I don't know which
> one is better.
> 
> > I guess I'm confused about what causes the qemuu to be dropped from
> > the job names above.
> 
> It just shell script having variable been global by default.

Thanks for the clarification.

Roger.

