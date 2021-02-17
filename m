Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D67831E32E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 00:46:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86454.162327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCWVk-0002Ys-8G; Wed, 17 Feb 2021 23:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86454.162327; Wed, 17 Feb 2021 23:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCWVk-0002YT-5B; Wed, 17 Feb 2021 23:45:36 +0000
Received: by outflank-mailman (input) for mailman id 86454;
 Wed, 17 Feb 2021 23:45:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lCWVj-0002YO-FQ
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 23:45:35 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fae42472-e4ac-4cf7-b4fe-e80d17f5f7a5;
 Wed, 17 Feb 2021 23:45:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EC9A64D9C;
 Wed, 17 Feb 2021 23:45:33 +0000 (UTC)
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
X-Inumbo-ID: fae42472-e4ac-4cf7-b4fe-e80d17f5f7a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613605533;
	bh=ZsCe8pnh3yb9rrl+xuQd+RNHy5q8RsFnRp4dROlRyD8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rMHq/InzpRnJiAzejYqlM/h3fauhGIBceK8iyAmt2uvdtbp0L8+r4+tHBXouf5N0a
	 B4Gdz0baCTVa9+yEzV96TD/5DYcP72BinYSqcOlT86l/vCM0lpxv46+KG/feVGi0T+
	 DeG1Mm3WWyZLg2etRgrQE4iuWg9LkUXJlcgEdSi9EUTs6bDPyJutmzz/NUKKGBaqx3
	 C4I+hawB8spZFcSxzLIRbzvAdGYAQ2buabQjXihPtrdCf82WD0TIiWmSr9sqID4Jbj
	 QiQhuoaTq0ufxUH/F4HkjBWqRGBUGjtkhp76FKNJ1Rw1YCQcXHVXf8n9Axs/yzlcfT
	 lpmPpBmUY2NBg==
Date: Wed, 17 Feb 2021 15:45:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, 
    andrew.cooper3@citrix.com, wl@xen.org, iwj@xenproject.org, 
    anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
In-Reply-To: <5a574326-9560-e771-b84f-9d4f348b7f5f@suse.com>
Message-ID: <alpine.DEB.2.21.2102171529460.3234@sstabellini-ThinkPad-T480s>
References: <20210213020540.27894-1-sstabellini@kernel.org> <20210213135056.GA6191@mail-itl> <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com> <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s> <5a574326-9560-e771-b84f-9d4f348b7f5f@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2053857798-1613604828=:3234"
Content-ID: <alpine.DEB.2.21.2102171533570.3234@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2053857798-1613604828=:3234
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2102171533571.3234@sstabellini-ThinkPad-T480s>

On Wed, 17 Feb 2021, Jan Beulich wrote:
> On 16.02.2021 19:31, Stefano Stabellini wrote:
> > On Mon, 15 Feb 2021, Jan Beulich wrote:
> >> On 13.02.2021 14:50, Marek Marczykowski-Górecki wrote:
> >>> On Fri, Feb 12, 2021 at 06:05:40PM -0800, Stefano Stabellini wrote:
> >>>> If rombios, seabios and ovmf are all disabled, don't attempt to build
> >>>> hvmloader.
> >>>
> >>> What if you choose to not build any of rombios, seabios, ovmf, but use
> >>> system one instead? Wouldn't that exclude hvmloader too?
> >>
> >> Even further - one can disable all firmware and have every guest
> >> config explicitly specify the firmware to use, afaict.
> > 
> > I didn't realize there was a valid reason for wanting to build hvmloader
> > without rombios, seabios, and ovfm.
> > 
> > 
> >>> This heuristic seems like a bit too much, maybe instead add an explicit
> >>> option to skip hvmloader?
> >>
> >> +1 (If making this configurable is needed at all - is having
> >> hvmloader without needing it really a problem?)
> > 
> > The hvmloader build fails on Alpine Linux x86:
> > 
> > https://gitlab.com/xen-project/xen/-/jobs/1033722465
> > 
> > 
> > 
> > I admit I was just trying to find the fastest way to make those Alpine
> > Linux builds succeed to unblock patchew: although the Alpine Linux
> > builds are marked as "allow_failure: true" in gitlab-ci, patchew will
> > still report the whole battery of tests as "failure". As a consequence
> > the notification emails from patchew after a build of a contributed
> > patch series always says "job failed" today, making it kind of useless.
> > See attached.
> > 
> > I would love if somebody else took over this fix as I am doing this
> > after hours, but if you have a simple suggestion on how to fix the
> > Alpine Linux hvmloader builds, or skip the build when appropriate, I can
> > try to follow up.
> 
> There is an issue with the definition of uint64_t there. Initial
> errors like
> 
> hvmloader.c: In function 'init_vm86_tss':
> hvmloader.c:202:39: error: left shift count >= width of type [-Werror=shift-count-overflow]
>   202 |                   ((uint64_t)TSS_SIZE << 32) | virt_to_phys(tss));
> 
> already hint at this, but then
> 
> util.c: In function 'get_cpu_mhz':
> util.c:824:15: error: conversion from 'long long unsigned int' to 'uint64_t' {aka 'long unsigned int'} changes value from '4294967296000000' to '0' [-Werror=overflow]
>   824 |     cpu_khz = 1000000ull << 32;
> 
> is quite explicit: "aka 'long unsigned int'"? This is a 32-bit
> environment, after all. I suspect the build picks up headers
> (stdint.h here in particular) intended for 64-bit builds only.
> Can you check whether "gcc -m32" properly sets include paths
> _different_ from those plain "gcc" sets, if the headers found in
> the latter case aren't suitable for the former? Or alternatively
> is the Alpine build environment set up incorrectly, in that it
> lacks 32-bit devel packages?
> 
> As an aside I don't think it's really a good idea to have
> hvmloader depend on any external headers. Just like the
> hypervisor it's a free-standing binary, and hence ought to be
> free of any dependencies on the build/host environment.

All the automation containers are available for anybody to use, so FYI
you can repro the issue by doing inside your Xen repo:

docker run -it -v `pwd`:/build registry.gitlab.com/xen-project/xen/alpine:3.12
CC=gcc bash automation/scripts/build


I did just that and ran a simple test:

~ # gcc -m32 test.c -o test
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../libssp_nonshared.a when searching for -lssp_nonshared
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: skipping incompatible /usr/lib/libssp_nonshared.a when searching for -lssp_nonshared
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -lssp_nonshared
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/libgcc.a when searching for -lgcc
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -lgcc
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../libgcc_s.so.1 when searching for libgcc_s.so.1
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: skipping incompatible /usr/lib/libgcc_s.so.1 when searching for libgcc_s.so.1
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find libgcc_s.so.1
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: skipping incompatible /usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/libgcc.a when searching for -lgcc
/usr/lib/gcc/x86_64-alpine-linux-musl/9.3.0/../../../../x86_64-alpine-linux-musl/bin/ld: cannot find -lgcc
collect2: error: ld returned 1 exit status
~ # cat test.c 
#include <stdio.h>

int main() {
    printf("DEBUG\n");
}


Given this, I take there is no 32bit build env? A bit of Googling tells
me that gcc on Alpine Linux is compiled without multilib support.


That said I was looking at the Alpine Linux APKBUILD script:
https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/xen/APKBUILD

And I noticed this patch that looks suspicious:
https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/main/xen/musl-hvmloader-fix-stdint.patch
--8323329-2053857798-1613604828=:3234--

