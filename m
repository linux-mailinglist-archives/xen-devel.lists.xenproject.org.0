Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D12711802
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 22:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539862.841149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2HRw-0002qK-Cr; Thu, 25 May 2023 20:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539862.841149; Thu, 25 May 2023 20:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2HRw-0002nZ-A0; Thu, 25 May 2023 20:20:40 +0000
Received: by outflank-mailman (input) for mailman id 539862;
 Thu, 25 May 2023 20:20:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JOix=BO=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q2HRv-0002nT-9m
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 20:20:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c7ee068-fb39-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 22:20:38 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DE92864A34;
 Thu, 25 May 2023 20:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D613BC433D2;
 Thu, 25 May 2023 20:20:29 +0000 (UTC)
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
X-Inumbo-ID: 9c7ee068-fb39-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685046036;
	bh=TRdhRXxXUIYfs640uIn+I4Rf6UAXCv8idpkcYdsSebM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiC2XGhNWUAmWE7pr8r3QtJ9JQsEo/jXvve3lXs2r5Y+W4R2mTSVXer6rhbIqd0H3
	 uoSQkJ728HLdXkJmf2eWWiJHTRm/fGQOsi2eZMGN8iMwau2U+ioJb0W4RoKYGYtykh
	 z9scTeHJfdOUnqeX313qP2xIMkwidI5DxymtOtruiJkZ/HiGGdvi3+NdefCU8HC/4L
	 yVF6ukcziPPo5ghUZkvreoJAGRzTQdLIctyd1RS1O+YIm3/yAJVKFl1SAT+U6nvVPE
	 TUmcZj1oUZgh7b4Odb9/HzteZyqvh1+JrTl0ADJm08qL98dpyZZ8OeR78PQJMngFPN
	 0x/EvMWBkU0Qw==
Date: Thu, 25 May 2023 23:20:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vishal Moola <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
Message-ID: <20230525202011.GZ4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com>
 <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>

On Thu, May 25, 2023 at 10:00:23AM -0700, Vishal Moola wrote:
> On Thu, May 25, 2023 at 1:56 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > Hi,
> >
> > On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote:
> > > No folio equivalents for page type operations have been defined, so
> > > define them for later folio conversions.
> >
> > Can you please elaborate why would we need folios for page table descriptors?
> 
> Thanks for the review!
> 
> These macros are for callers that care about the page type, i.e. Table and
> Buddy. Aside from accounting for those cases, the page tables don't use folios.
> These are more for the cleanliness of those callers.

But why using folio APIs for PageType will be cleaner than using page APIs?
Do you have an example?

-- 
Sincerely yours,
Mike.

