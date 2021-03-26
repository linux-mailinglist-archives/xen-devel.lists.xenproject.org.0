Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07B34A750
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 13:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101780.194870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlca-0007ot-QA; Fri, 26 Mar 2021 12:31:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101780.194870; Fri, 26 Mar 2021 12:31:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPlca-0007oW-Mg; Fri, 26 Mar 2021 12:31:24 +0000
Received: by outflank-mailman (input) for mailman id 101780;
 Fri, 26 Mar 2021 12:31:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlcY-0007oR-Gq
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:31:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlcY-0006at-FU
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:31:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPlcY-0002tA-EW
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 12:31:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPlcT-0002VQ-Dm; Fri, 26 Mar 2021 12:31:17 +0000
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
	bh=L0Ix2geYvQVDiYJ7wWkZqepheNuSxsiYklmbGncft6w=; b=uaSwuCY7NqsDDcF3zwfXdMAM6G
	WOTwvuDTFTRkYt6fr+ObZIB5ZShHkvf1Wgf4eUocA+ayXifIwIKRyCvR9N/Be/e7cObsB/u06WtIp
	69Jr9EInE+Zb7mFdRxX2F3abQsPxYLITJaGf+6zIQWTFw31tKYYFJNPsFUpE60AGxTxk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.54293.249916.792148@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 12:31:17 +0000
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's
 max_mapped_pfn during forking
In-Reply-To: <CABfawh=2rwOe=FCaoaLYOFnmbReonRJrujYjqBy-T+L_-dpfAw@mail.gmail.com>
References: <bdeaf7893acd6497cc2b88f3a1357d1299960e9b.1616103095.git.tamas.lengyel@intel.com>
	<CABfawhmscVPFX6QM4Sfcpo=MjPn4xrfDcBcDmqpFc7awdut2jw@mail.gmail.com>
	<24669.51029.465080.822794@mariner.uk.xensource.com>
	<CABfawh=2rwOe=FCaoaLYOFnmbReonRJrujYjqBy-T+L_-dpfAw@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Tamas K Lengyel writes ("Re: [PATCH for-4.15] x86/mem_sharing: copy parent VM's hostp2m's max_mapped_pfn during forking"):
> On Fri, Mar 26, 2021 at 7:37 AM Ian Jackson <iwj@xenproject.org> wrote:
> > Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> >
> > *Provided that it is committed today*  I'm not sure how likely that is.
> 
> Thanks, as I'm the sole maintainer of the code AFAIU it just needs a
> Reviewed-by from someone in the community.

I don't feel qualified myself, unfortunately.

But your argument in favour of having this in 4.15 seems very strong
to me so I definitely hope someone is able to do the review.

Ian.

