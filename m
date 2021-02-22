Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BA321DEB
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 18:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88286.165881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEEpf-00044G-9f; Mon, 22 Feb 2021 17:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88286.165881; Mon, 22 Feb 2021 17:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEEpf-00043r-6S; Mon, 22 Feb 2021 17:17:15 +0000
Received: by outflank-mailman (input) for mailman id 88286;
 Mon, 22 Feb 2021 17:17:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEEpd-00043m-9x
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:17:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEEpd-000500-6L
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:17:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEEpd-0006ii-5C
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:17:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEEpZ-0001YR-My; Mon, 22 Feb 2021 17:17:09 +0000
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
	bh=A5jwKEr7w9q1MNq9LDQtTavMi2AaamSI7SEYo/eV58w=; b=GQzuoA18pq4LiQHBk3klWJl59y
	TSL3mImcg6aMKj5B2yRsDdPgAx8MR4b6dEBDbOLzgB6ikpKEfXrU5PI1HSQ0gJMY8Un9C8Sd29ckE
	T6P8ZWFQfrfaW/Rp/BuugYz3iAhbKDyQw+mySvEl5lizoxDTeSVc/B1haIGf9CMVm4ng=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24627.59157.450971.787744@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 17:17:09 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Kevin Tian <kevin.tian@intel.com>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page
In-Reply-To: <04a2869a-282f-783a-6c03-8a2d7209411a@suse.com>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
	<90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>
	<24627.38031.77928.536108@mariner.uk.xensource.com>
	<04a2869a-282f-783a-6c03-8a2d7209411a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page"):
> On 22.02.2021 12:25, Ian Jackson wrote:
> > Jan Beulich writes ("[PATCH v3 1/2][4.15] VMX: delay p2m insertion of APIC access page"):
> >> Inserting the mapping at domain creation time leads to a memory leak
> >> when the creation fails later on and the domain uses separate CPU and
> >> IOMMU page tables - the latter requires intermediate page tables to be
> >> allocated, but there's no freeing of them at present in this case. Since
> >> we don't need the p2m insertion to happen this early, avoid the problem
> >> altogether by deferring it until the last possible point.
> > 
> > Thanks.
> > 
> >>   This comes at
> >> the price of not being able to handle an error other than by crashing
> >> the domain.
> > 
> > How worried should I be about this ?
> 
> Not overly much I would say. The difference is between a failure
> (-ENOMEM) during domain creation vs the domain getting crashed
> before it gets first scheduled. This is certainly less friendly
> to the user, but lack of memory shouldn't typically happen when
> creating domains. Plus the memory talked about here is such that
> gets provided explicitly to the domain (the p2m pool), rather
> than a system wide pool.

OK, thanks.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

