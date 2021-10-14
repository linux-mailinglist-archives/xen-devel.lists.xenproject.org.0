Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD3842DB8A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 16:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209421.365874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1iO-0002RF-Do; Thu, 14 Oct 2021 14:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209421.365874; Thu, 14 Oct 2021 14:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1iO-0002PU-Ag; Thu, 14 Oct 2021 14:28:12 +0000
Received: by outflank-mailman (input) for mailman id 209421;
 Thu, 14 Oct 2021 14:28:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mb1iM-0002PN-TB
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 14:28:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mb1iM-000206-L5
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 14:28:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mb1iM-0004Vo-JQ
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 14:28:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mb1iJ-0002jr-C7; Thu, 14 Oct 2021 15:28:07 +0100
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
	bh=8csriymb1MT05IHAml9zw9rjJ21uAc5yaIKGUg4e2/I=; b=1aZ9hRRuAlAAGTYmlb/1sp/Y/o
	EVASouprwmFghfBWOcwYxyPBqgz4EVpftvITUlpV1qVrFRXWF/Kgv9EAEa5NbhdWuXh1VypvWmDpO
	BplaHTqSxPdxwdZrHNGyt7i8X9Pv6FkhI4kv2d2GdpGSnQ59npnfCUoFHlUOX7DK1zzU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24936.15991.111241.918070@mariner.uk.xensource.com>
Date: Thu, 14 Oct 2021 15:28:07 +0100
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Juergen Gross <jgross@suse.com>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Henry Wang <Henry.Wang@arm.com>,
    Bertrand Marquis <bertrand.marquis@arm.com>,
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH V7 0/2] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
In-Reply-To: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
References: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Oleksandr Tyshchenko writes ("[PATCH V7 0/2] Add handling of extended regions (safe ranges) on Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")"):
> You can find an initial discussion at [1]-[7].
> 
> The extended region (safe range) is a region of guest physical address space
> which is unused and could be safely used to create grant/foreign mappings instead
> of wasting real RAM pages from the domain memory for establishing these mappings.

Thanks.

This patch has all the required acks, but I was aware of an
outstanding concern from Andrew, as set out in his most
recent mail on the subject:
  Subject: Re: [RFC PATCH 1/3] xen: Introduce "gpaddr_bits" field to XEN_SYSCTL_physinfo
  Date: Tue, 7 Sep 2021 18:35:47 +0100
  Message-ID: <973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com>

I think it would be within the process to just commit the patch now,
but I thought it best to check as best I could that we weren't missing
anything.  The process is supposed to support our continuing
development and also our quality, so I aim to do those things.

I reviewed that mail and had a conversation with Julien about it on
irc.  My understanding is that Julien and Oleksandr's intent is that
Andrew's concerns have been addressed, although we don't have a
confirmation of that from Andrew.

In particular, I wanted to convince myself that if in fact there was
still a problem, we hadn't made a problem for ourselves with the API
here.

The new hypercalls are in unstable interfaces, so if we need to change
them in a future version (eg to make ARM migration work) that's OK.
Julien tells me that he doesn't believe there to be any impact on the
(x86) migration stream right now.

There is a new libxl stable interface.  But I think it is
inoffensive.  In particular, basically any mechanism to do this would
have that API.  And that doesn't seem to touch on the implementation
issues described by Andrew.

Therefore, I think (i) we have tried to address the issues (ii) any
reminaing problems can be dealt with as followups, without trouble.

So I have just pushed these two.

Thanks,
Ian.

