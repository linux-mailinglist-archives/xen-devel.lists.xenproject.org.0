Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E63AB235F7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 20:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079069.1440062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluAF-0005x5-7R; Tue, 12 Aug 2025 18:56:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079069.1440062; Tue, 12 Aug 2025 18:56:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluAF-0005ux-3z; Tue, 12 Aug 2025 18:56:03 +0000
Received: by outflank-mailman (input) for mailman id 1079069;
 Tue, 12 Aug 2025 18:56:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uluAD-0005uD-V9
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 18:56:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uluAD-001pCl-0s;
 Tue, 12 Aug 2025 18:56:01 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uluAD-001cZc-0Z;
 Tue, 12 Aug 2025 18:56:01 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=SIymliSzowbOlEA87MiW+fNWqjMd+iDSIaqQrVO9JTU=; b=hdQOC8pVbMtION/jWj6ee4XH6s
	+yvCN/hAJc6an3RDwpAsR6FWKQ42QNhnC3C1PkTb27P2rYGJf28k+jqoWCoEPpwfA+sXTWYFl69xT
	WunrX4pn5KyNYMMj8wT/lafHYz4+AsdvaW3Ud5kzaJIZ0ITs2kCy37UMRbJghT7Gy2xo=;
Date: Tue, 12 Aug 2025 20:55:59 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Javi Merino <javi.merino@cloud.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] CI: Turn debian/12-x86_64 into a non-root container
Message-ID: <aJuOP52xGg8hUN_H@l14>
References: <20250812162950.1903901-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812162950.1903901-1-andrew.cooper3@citrix.com>

On Tue, Aug 12, 2025 at 05:29:50PM +0100, Andrew Cooper wrote:
> From: Javi Merino <javi.merino@cloud.com>
> 
> Since commit 4611ae6fb8f9 ("CI: save toolstack artifact as cpio.gz"), the
> various automation/scripts/* no longer need to be root to correctly repack the
> initrd for test.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> 
> Xen 4.20 and later uses debian:12-x86_64 and also contains 4611ae6fb8f9 so
> this is safe to change generally.

I gave it a try, just to be sure:
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/1980442689
and staging-4.20:
    https://gitlab.com/xen-project/people/anthonyper/xen/-/pipelines/1980621317

(all the failed build should be because I was lazy and didn't rebuild
all containers or didn't select a subset of the builds. All test passed
or are skipped, which is what I was looking for)

So:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

