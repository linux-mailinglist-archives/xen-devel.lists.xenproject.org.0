Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD387ABE4
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 17:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692640.1079990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRos-0002xF-B8; Wed, 13 Mar 2024 16:51:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692640.1079990; Wed, 13 Mar 2024 16:51:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkRos-0002vj-8P; Wed, 13 Mar 2024 16:51:10 +0000
Received: by outflank-mailman (input) for mailman id 692640;
 Wed, 13 Mar 2024 16:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CotD=KT=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rkRor-0002vd-Ks
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 16:51:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e322ebf2-e159-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 17:51:07 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-413ebcf1315so402235e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 09:51:07 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 l5-20020a05600c1d0500b00412ea52b102sm2881155wms.34.2024.03.13.09.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 09:51:06 -0700 (PDT)
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
X-Inumbo-ID: e322ebf2-e159-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710348667; x=1710953467; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a48IgrpPJ/Rmc3kWvVNrrLx58qYK0IkJ0bjzeqBQ4lM=;
        b=cOkvf6nru4iuuR8C66Oi7zp1tEe/pQfZhTHzhfu1w6o7s/OeopADGJWegK3U7d7TDi
         ULKS4bpzA9BNqJZZjSQR0HMcGJ6/W5vVzGw/wUJ/LjxrgPTDXT5BGXXyfSpwvonpXud3
         PAddkfBk3gS6oOJcKCb3jgwcS/oEN7NdckFOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710348667; x=1710953467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a48IgrpPJ/Rmc3kWvVNrrLx58qYK0IkJ0bjzeqBQ4lM=;
        b=O4UepK3T6Pu3VBmYEPyZF8cx3t/pFDrJQu9E2CHDD1cW4VWxDtehqg4pM9WKbRdqop
         jN6dDCuJd9cpP5KiBlibew0WAP4isazsdAg4WY496GNjgmS9cPuhx2K1jn0uqz2PwbBi
         cFtz5UEPKY9X2LkHHmPJslvSsGUWjFjzHDZNjCcGp6dMlwNa3F8fXDT/TcvRCrvC1WG4
         cAZMF9rrvDg/VF2Rbis84SqmkFkioL6tzdlkeiJtZFcFjFm2jdD/HXf/cDp46xjMnxvl
         +DpA08rLvnz+mh/GYa7W28/buwCGAsWO+9ohWxw8feh9IwtqDiwctG6uD0rLNarMWItF
         pMeA==
X-Gm-Message-State: AOJu0YxLzxrj17axH+Topw1fuQUkgLpD05afkVnmOKfWZinebTO1tfCy
	nMX4uNDACE1Iq5DL8TjVQdN5BzOb4pV8ZiatWlsCwaH59QPSnMlR11XpT0DBiMo=
X-Google-Smtp-Source: AGHT+IGHjkhoGd+u+DjD0/B/AmrhjOejn066tx3QHGsOxJyXFXgPSrrkIi7rNHthrbg1ncQigDa1zw==
X-Received: by 2002:a05:600c:4e91:b0:413:1810:4a48 with SMTP id f17-20020a05600c4e9100b0041318104a48mr360661wmq.22.1710348666900;
        Wed, 13 Mar 2024 09:51:06 -0700 (PDT)
Date: Wed, 13 Mar 2024 16:51:05 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [OSSTEST PATCH] ap-common: Switch to Linux 6.1 by default on x86
 + drop dom0 i386
Message-ID: <e6e2849d-dd44-4842-9c8a-d861df49ecff@perard>
References: <20240306114741.14564-1-anthony.perard@citrix.com>
 <Ze8_GPiqd9L5SzE8@macbook>
 <dfe482d8-06d8-4b32-8a28-d6e60b6535dc@perard>
 <ZfGEa_u3VZv-CuTq@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZfGEa_u3VZv-CuTq@macbook>

On Wed, Mar 13, 2024 at 11:48:11AM +0100, Roger Pau Monné wrote:
> On Tue, Mar 12, 2024 at 05:19:46PM +0000, Anthony PERARD wrote:
> > On Mon, Mar 11, 2024 at 06:27:52PM +0100, Roger Pau Monné wrote:
> > > On Wed, Mar 06, 2024 at 11:47:41AM +0000, Anthony PERARD wrote:
> > > > Gone, but replaced by a new test-amd64-amd64-*:
> > > > - test-amd64-i386-libvirt-raw
> > > > - test-amd64-i386-xl-vhd
> > > > 
> > > > Some test-amd64-amd64-* are also changed:
> > > > - test-amd64-amd64-libvirt-vhd
> > > > - test-amd64-amd64-qemuu-freebsd11-amd64
> > > > - test-amd64-amd64-qemuu-freebsd12-amd64
> > > > - test-amd64-amd64-xl-qcow2
> > > > + test-amd64-amd64-freebsd11-amd64
> > > > + test-amd64-amd64-freebsd12-amd64
> > > > + test-amd64-amd64-libvirt-qcow2
> > > > + test-amd64-amd64-libvirt-raw
> > > > + test-amd64-amd64-xl-vhd
> > > 
> > > Is this purely a name change, or there's some kind of functional
> > > change?
> > 
> > For test-amd64-amd64-qemuu-freebsd1{1,2}-amd64, it looks like the
> > "-qemuu" is a bug. The freebsd jobs shouldn't have used $qemuu_suffix,
> > as it doesn't use $qemuu_runvar. So I'm guessing $qemuu_suffix was just
> > the value left from a previous call of test_matrix_do_one() with
> > dom0arch==i386. The new name is already used by "linux-linus" branch.
> 
> FTAOD, could you mention this in the commit message?
> 
> FreeBSD doesn't use `$qemuu_runvar` because it was always using QEMU
> upstream (when the FreeBSD test was added we decided to only test with
> QEMU upstream).  So there's indeed no `-qemut` variant, but by
> dropping the -qemuu prefix it could be confused with a PV guest
> based test.

I thought "-qemuu" just meant we were using the qemu-upstream as
device-model instead of the default one, but it seems that instead no
jobs are generated with "$qemuu_suffix==''", (or only for Xen 4.2 and
older). So now I guess that all HVM tests have either -qemut or -qemuu.

We that, I guess it makes sense to keep "-qemuu" for freebsd tests. That
would just change branch "linux-linus" and "linux-6.1". I'll prepare a
new patch with that.

> > As for the few changes in {xl,libvirt}-{raw,vhd,qcow2} tests, this is
> > because of
> > - f536e834f673 ("make-flight: Trim the matrix of disk format flights")
> > - 5c70735f177f ("fmtarches: Use dom0arches, not hardcoded arch list")
> 
> Probably a dummy question, but why haven't those commits changed the
> output of make-flight earlier?  I'm fine with the change, but I don't
> really get why we are seeing it only now.

Looking at the commit message, they did some changes.

But the second commit might have made changes in a way that wasn't
intended. For example, "xl-raw" test disappear.

First commit intended to have exactly 6 jobs spread across all arches.
It used as input "i386 armhf amd64 armhf" and just check that the arch
corresponded to the current "$dom0arch". The function is called several
time with different $dom0arch.

The second mention commit changes to use $dom0arches which takes
different values " i386 amd64", then " armhf" and " arm64". The extra
space at the beginning of the string is why there's no more "xl-raw"
tests, because now '' became one of the possible dom0arch which of course
it doesn't exist. Then we have the same exact list of 3 test on armhf
and arm64, which defeat the original intention of the first mention
commit.

So, now I feel like I need to rework do_pv_debian_tests() to at least
re-add "xl-raw" test, and maybe keep only 6 toolstack-disk_format tests
spread across all arches? That could maybe reduce the number of tests on
arm64 which is the current bottleneck.

Cheers,

-- 
Anthony PERARD

