Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6938F879A89
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 18:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692045.1078891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk5n5-00029v-Ei; Tue, 12 Mar 2024 17:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692045.1078891; Tue, 12 Mar 2024 17:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk5n5-00026q-CB; Tue, 12 Mar 2024 17:19:51 +0000
Received: by outflank-mailman (input) for mailman id 692045;
 Tue, 12 Mar 2024 17:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LK31=KS=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rk5n4-00026P-MV
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 17:19:50 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baa06ab7-e094-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 18:19:48 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33e796cc90dso3858949f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 10:19:48 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 q11-20020adff94b000000b0033e95bf4796sm5989383wrr.27.2024.03.12.10.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:19:47 -0700 (PDT)
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
X-Inumbo-ID: baa06ab7-e094-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710263988; x=1710868788; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hq8LWSB3qSsVNYgo0a/9Z9B/117exxE3zbam1vD/XCA=;
        b=IbRyXdQdQfDzTArKeg4CVV+H6E80aunrkNhE7GY3tv8zCqAau13C1OJzkLlBBzhduC
         n+ZR3cTGr3uqOVcBO9JBDgkQibmBkaANjl89TBgiaXe0/8/Lx6x3bkuCXzfD4w4u+u1j
         7cnFEwsKyLmfN2v0b/iJnXbZmjmMOT7OlDbec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263988; x=1710868788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hq8LWSB3qSsVNYgo0a/9Z9B/117exxE3zbam1vD/XCA=;
        b=vGJGu1n36XATU280MwDs49h1nhZYLVznCeMEQqLdBj4OyyI3xjracHhzIJoET2Xi5z
         YAePj/2Q4IJUC5wCx/xhF+iaLk4s2EH83Y1sjGpVjHRfQQuxFdUavQYmJkRVHcTeWWY8
         bsrAy+pWEZNkYeo1Z9Tg/h85ZDC6N4+NGZrx5OnmEbIAswvFx+aLkb7oxj3T7hPxDCA5
         +1xiV0V3PavpRcKHcEaicmq6G0vg9qGYDjsONZjfUV0xZsDLAgLqi3jc+Ornhy67a6Rv
         q9kf/oMs2xX+8QWGGAzlDI0F/VIVX40CfKKbFV9q57Pdk7WliZ9PbTtw/RHJZIO1vBWp
         avEg==
X-Gm-Message-State: AOJu0YzelAYdmM+3bTYFk0TqhfeELSkTaxxuo4xMfR6eYBlnzLivoJfh
	mFis8i8z5zYCA8yxY70AkZOZHiQ7OGAfAwDdZ+D9yE7Akv8pYR1tUC9qV0vEHYk=
X-Google-Smtp-Source: AGHT+IGqgO5bPlvg9N959fq3DxWe7mHFozhK9DxZCbsVgn25el31N1p9dO6wD0B0WQX/suvwYob2GQ==
X-Received: by 2002:adf:fa0d:0:b0:33e:69db:bf9e with SMTP id m13-20020adffa0d000000b0033e69dbbf9emr59255wrr.67.1710263988174;
        Tue, 12 Mar 2024 10:19:48 -0700 (PDT)
Date: Tue, 12 Mar 2024 17:19:46 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [OSSTEST PATCH] ap-common: Switch to Linux 6.1 by default on x86
 + drop dom0 i386
Message-ID: <dfe482d8-06d8-4b32-8a28-d6e60b6535dc@perard>
References: <20240306114741.14564-1-anthony.perard@citrix.com>
 <Ze8_GPiqd9L5SzE8@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ze8_GPiqd9L5SzE8@macbook>

On Mon, Mar 11, 2024 at 06:27:52PM +0100, Roger Pau Monné wrote:
> On Wed, Mar 06, 2024 at 11:47:41AM +0000, Anthony PERARD wrote:
> > Gone, but replaced by a new test-amd64-amd64-*:
> > - test-amd64-i386-libvirt-raw
> > - test-amd64-i386-xl-vhd
> > 
> > Some test-amd64-amd64-* are also changed:
> > - test-amd64-amd64-libvirt-vhd
> > - test-amd64-amd64-qemuu-freebsd11-amd64
> > - test-amd64-amd64-qemuu-freebsd12-amd64
> > - test-amd64-amd64-xl-qcow2
> > + test-amd64-amd64-freebsd11-amd64
> > + test-amd64-amd64-freebsd12-amd64
> > + test-amd64-amd64-libvirt-qcow2
> > + test-amd64-amd64-libvirt-raw
> > + test-amd64-amd64-xl-vhd
> 
> Is this purely a name change, or there's some kind of functional
> change?

For test-amd64-amd64-qemuu-freebsd1{1,2}-amd64, it looks like the
"-qemuu" is a bug. The freebsd jobs shouldn't have used $qemuu_suffix,
as it doesn't use $qemuu_runvar. So I'm guessing $qemuu_suffix was just
the value left from a previous call of test_matrix_do_one() with
dom0arch==i386. The new name is already used by "linux-linus" branch.

As for the few changes in {xl,libvirt}-{raw,vhd,qcow2} tests, this is
because of
- f536e834f673 ("make-flight: Trim the matrix of disk format flights")
- 5c70735f177f ("fmtarches: Use dom0arches, not hardcoded arch list")
   > It's not ideal because it means tests jumping about across arches and
   > might let regressions go through but it's better than just dropping
   > them, and doing a better approach is complex.

So, for those, yes, it's different tests. It adds one "-raw" test, and
otherwise changes the toolstack used for the two other disk formats.

> I'm mostly worried whether this could lead to regressions getting in
> as osstest would detect those jobs as new instead of inheriting from
> the previous jobs.  Also the "History for test ..." won't link to jobs
> prior to the rename?

Well, those tests are already in the "linux-linus" branch and the new
"linux-6.1" branch, so we can already check manually if there's a
regression or not. So if they pass in linux-6.1, regression will be
detected, at least in the linux branch.

The rename of the freebsd jobs is unfortunate, but at least, it's going
to be the correct name, instead of having a spurious "-qemuu" suffix.

As for "history of tests " pages, no I don't think we can easly link to
to the previous job name. But that only apply to both freebsd* jobs.

We could keep the -qemuu in freebsd* jobs even if it's misleading to
someone who know what it should mean, that would keep the job name to
all branches and rename it in "linux-linus" branch. I don't know which
one is better.

> I guess I'm confused about what causes the qemuu to be dropped from
> the job names above.

It just shell script having variable been global by default.

Cheers,

-- 
Anthony PERARD

