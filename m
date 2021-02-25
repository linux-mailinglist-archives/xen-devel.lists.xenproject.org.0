Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E8132503B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 14:17:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89755.169326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGW8-0000Wz-D8; Thu, 25 Feb 2021 13:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89755.169326; Thu, 25 Feb 2021 13:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGW8-0000Wa-9u; Thu, 25 Feb 2021 13:17:20 +0000
Received: by outflank-mailman (input) for mailman id 89755;
 Thu, 25 Feb 2021 13:17:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGW7-0000WV-7C
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:17:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGW7-0000kX-0c
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:17:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lFGW6-0004Md-Vn
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:17:18 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lFGW3-0001UJ-NM; Thu, 25 Feb 2021 13:17:15 +0000
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
	bh=/hj4/BTGQFDqHsbTaogqGJRszRoCPs4wNHdfk+St+F0=; b=l1BWMYI6GII665yB6r73VrIFn/
	LWUB6pdAjgbZY0dOqPI1TGL3zCLRanfKBGPDHMqaQIkFY/OPPiRGotgHsmNdjszZDXbYebcfa5q4v
	cToB/GYKpMZOHYzhVSttPx7CjV/qjuY1jJS0BJuOWCCkz5kysul/PnbsIzzCHEfXE1II=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24631.41819.456811.665249@mariner.uk.xensource.com>
Date: Thu, 25 Feb 2021 13:17:15 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Tim Deegan <tim@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
In-Reply-To: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH][4.15] x86/shadow: suppress "fast fault path" optimization without reserved bits"):
> When none of the physical address bits in PTEs are reserved, we can't
> create any 4k (leaf) PTEs which would trigger reserved bit faults. Hence
> the present SHOPT_FAST_FAULT_PATH machinery needs to be suppressed in
> this case, which is most easily achieved by never creating any magic
> entries.
> 
> To compensate a little, eliminate sh_write_p2m_entry_post()'s impact on
> such hardware.
> 
> While at it, also avoid using an MMIO magic entry when that would
> truncate the incoming GFN.

Judging by the description I'm not sure whether this is a bugfix, or
a change to make it possible to run Xen on hardware where currently it
doesn't work at all.

I assume "none of the physical address bits in PTEs are reserved" is
a property of certain hardware, but it wasn't clear to me (i) whether
such platforms currently exists (ii) what the existing Xen code would
do in this case.

Can you enlighten me ?

Thanks,
Ian.

