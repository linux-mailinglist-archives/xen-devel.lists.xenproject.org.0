Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3048932D1A8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 12:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93208.175892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHm3E-0003uQ-Cq; Thu, 04 Mar 2021 11:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93208.175892; Thu, 04 Mar 2021 11:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHm3E-0003u1-8r; Thu, 04 Mar 2021 11:21:52 +0000
Received: by outflank-mailman (input) for mailman id 93208;
 Thu, 04 Mar 2021 11:21:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHm3C-0003tw-9f
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:21:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHm3C-0001Lz-4b
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:21:50 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHm3C-0006yO-3f
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 11:21:50 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHm2y-00050F-TZ; Thu, 04 Mar 2021 11:21:36 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=xsQlyatzXrok8XO8ymfSBI8MKz1Bcgiyw9bZ+/YS5qg=; b=eNXFTkksJp1G6AqwrikeHx/vzd
	Z1ffECpBG3Ddw67dRwipNtS7IkrK5YhxbMp422VfQmaonOjnibetrQ1Cr7hdmvr1PUn9YFr5CXyHX
	XLQEmxRnv+NZWPmt1pXWWYKO+uHO/BUaItodT1QjtCNgjb2NH7WicxAoB6Bs21wTlgSE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.49856.639416.385729@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 11:21:36 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
    Charles Arnold <CARNOLD@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for
 gcc11
In-Reply-To: <1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
	<7e0584ab-8923-cb59-fac2-c2908d736f0c@xen.org>
	<1e625665-7a14-a1f6-5b93-cac6e3640c1f@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
> On 03.03.2021 20:09, Julien Grall wrote:
> > On 01/03/2021 07:57, Jan Beulich wrote:
> >> The upcoming release complains, not entirely unreasonably:
> >>
> >> In file included from rijndael.c:33:
> >> .../xen/include/crypto/rijndael.h:55:53: note: previously declared as 'const unsigned char[]'
> >>     55 | void    rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
> >>        |                                                     ^~~~~~~~~~~~~~~~~~~~~~
> >> rijndael.c:865:8: error: argument 4 of type 'u8[16]' {aka 'unsigned char[16]'} with mismatched bound [-Werror=array-parameter=]
> >>    865 |     u8 ct[16])

I think this is an erroneous compiler warning.

It has been idiomatic in some codebases for a long time to write
    const unsigned char[]
as a formal parameter for an array (of whatever size).

> >> .../xen/include/xen/string.h:101:27: error: '__builtin_memcmp' specified bound 4 exceeds source size 0 [-Werror=stringop-overread]
> >>    101 | #define memcmp(s1, s2, n) __builtin_memcmp(s1, s2, n)
> >>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> mpparse.c:722:13: note: in expansion of macro 'memcmp'
> >>    722 |         if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
> >>        |             ^~~~~~
> >>
> >> Clearly neither the 1st nor the 2nd argument have a "source size" of 0.
> > 
> > It looks like there is a report on the redhat bug tracker for it [1]. Do 
> > you know if there is a bug report on the GCC tracker as well?
> 
> I have no idea, to be honest.

This erroneous message makes me think that there is simply a bug in
this version of GCC, where formal parameters declared as
    const unsigned char[]
are treated as
    const unsigned char[0]
rather than as
    const unsigned char*

Ian.

