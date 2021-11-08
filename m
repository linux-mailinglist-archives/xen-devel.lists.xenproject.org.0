Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4632D449761
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 16:04:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223433.386141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6CD-0006oK-7Q; Mon, 08 Nov 2021 15:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223433.386141; Mon, 08 Nov 2021 15:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6CD-0006mX-3a; Mon, 08 Nov 2021 15:04:29 +0000
Received: by outflank-mailman (input) for mailman id 223433;
 Mon, 08 Nov 2021 15:04:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk6CB-0006mR-JK
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:04:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk6CB-0006XC-IT
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:04:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk6CB-0004UJ-H6
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:04:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mk6C8-0001Af-3m; Mon, 08 Nov 2021 15:04:24 +0000
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
	bh=kxBQWwT3I6ucVWO3bz1zSWjkcqM7uOedg1/GtFtu9dI=; b=GAFJjc10d9eKGUdann9lYd6Pes
	+jEWMfGqIrQijWwM+3bu3f2BXY6ILXlF4tHLTeWrUBAU3KdCYBKO6bEve+YJMAmCA3Ogli6LPUfhW
	YJuBJlLLc7FY/O4ffFNueS3mm5pzGMJqMcKXJ4SpVC6A1h5rk2MSllUjqjjUCCBRAlWM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24969.15479.681521.102446@mariner.uk.xensource.com>
Date: Mon, 8 Nov 2021 15:04:23 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>
Subject: Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU
 ACPI table parsing
In-Reply-To: <89eda99d-67da-ad97-6040-db79702636bd@suse.com>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
	<43d8cc88-aae0-5a82-7b4b-756dd54dd223@suse.com>
	<YYVQAH7OYmFSVOei@Air-de-Roger>
	<24965.21029.795504.152439@mariner.uk.xensource.com>
	<89eda99d-67da-ad97-6040-db79702636bd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v2 1/6][4.16?] x86/x2APIC: defer probe until after IOMMU ACPI table parsing"):
> On 05.11.2021 16:47, Ian Jackson wrote:
> > This part confused me.  Under what circumstances would we backport
> > this ?  AIUI it would be backporting a potentially-fragile and
> > not-readily-testable bugfix, for a theoretical scenario with a
> > straightforward workaround.
> 
> Well, I've said "candidate" for this very reason: To me, every bug
> fix is a candidate. Whether risks outweigh the potential benefits is
> then influencing whether to _actually_ take the change. A reason to
> take it despite the available workaround might be that
> "straightforward" doesn't also mean "obvious" here. IOW once you
> know what to do, doing so is easy. But one first needs to arrive
> there.

Could we not do a smaller fix that would print something in the boot
output, mabye ?  That would be a lower risk change.

So far, I think the tradeoff here isn't looking very good: a risk of
unclear magnitude for many users, vs a hard crash at boot for a set of
users we believe to be empty.

As ever, feel free to contradict me if I have the wrong end of one of
the many sticks here...

Ian.

