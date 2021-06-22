Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202493B02E9
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 13:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145854.268285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvejJ-0001KY-K4; Tue, 22 Jun 2021 11:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145854.268285; Tue, 22 Jun 2021 11:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvejJ-0001Hy-Gw; Tue, 22 Jun 2021 11:38:09 +0000
Received: by outflank-mailman (input) for mailman id 145854;
 Tue, 22 Jun 2021 11:38:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lvejI-0001Hs-HD
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:38:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lvejI-0001ds-CZ
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:38:08 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lvejI-00028M-Bd
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:38:08 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lvejE-0003Xy-Q3; Tue, 22 Jun 2021 12:38:04 +0100
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
	bh=GuDijgEM/gxBLTHzy3G1iP3qZzBVCe1tc04lGY29Sy8=; b=N30Dc9PXAtoVz2r4lnlERSbagP
	lgEaBLt4pyahPO6AHlk5byJwz7obAzWwJUfOaTCKxQHu2+VF61LLDkxD5KaXbj8fQ0SrKjoj6Yk1f
	lpqCv7gcuQ1dD0FqHYmm6aWoD5ylcrp/zOvnLPtm5mQGMZAAI/pByl+RYBhW5Dg8nL0A=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24785.52124.476428.674630@mariner.uk.xensource.com>
Date: Tue, 22 Jun 2021 12:38:04 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/5] libxencall: introduce variant of xencall2() returning
 long
In-Reply-To: <c7f93b66-bc4d-708a-6936-e0eac9e36cfa@suse.com>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
	<c7f93b66-bc4d-708a-6936-e0eac9e36cfa@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 3/5] libxencall: introduce variant of xencall2() returning long"):
> Some hypercalls, memory-op in particular, can return values requiring
> more than 31 bits to represent. Hence the underlying layers need to make
> sure they won't truncate such values.

Thanks for this.

All 5 patches:

Acked-by: Ian Jackson <iwj@xenproject.org>

Nit:

> While adding the new function to the map file, I noticed the stray
> xencall6 there. I'm taking the liberty to remove it at this occasion. If
> such a function would ever appear, it shouldn't lane in version 1.0.
                                                  ^^^^

Typo for "land", I think.

Ian.

