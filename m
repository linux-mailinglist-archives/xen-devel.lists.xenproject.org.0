Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E140C32661A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 18:08:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90480.171302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgae-0004Sa-Il; Fri, 26 Feb 2021 17:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90480.171302; Fri, 26 Feb 2021 17:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgae-0004SB-FX; Fri, 26 Feb 2021 17:07:44 +0000
Received: by outflank-mailman (input) for mailman id 90480;
 Fri, 26 Feb 2021 17:07:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRZt=H4=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lFgad-0004S6-88
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 17:07:43 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eea3539e-54db-4bee-83b4-664ea6cf34c1;
 Fri, 26 Feb 2021 17:07:42 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lFgaa-000JrX-Kt; Fri, 26 Feb 2021 17:07:40 +0000
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
X-Inumbo-ID: eea3539e-54db-4bee-83b4-664ea6cf34c1
Date: Fri, 26 Feb 2021 17:07:40 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH][4.15] x86/shadow: suppress "fast fault path"
 optimization without reserved bits
Message-ID: <YDkq3KwtfGZZTyLL@deinos.phlegethon.org>
References: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

Hi,

At 14:03 +0100 on 25 Feb (1614261809), Jan Beulich wrote:
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
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

> I wonder if subsequently we couldn't arrange for SMEP/SMAP faults to be
> utilized instead, on capable hardware (which might well be all having
> such large a physical address width).

I don't immediately see how, since we don't control the access type
that the guest will use.

> I further wonder whether SH_L1E_MMIO_GFN_MASK couldn't / shouldn't be
> widened. I don't see a reason why it would need confining to the low
> 32 bits of the PTE - using the full space up to bit 50 ought to be fine
> (i.e. just one address bit left set in the magic mask), and we wouldn't
> even need that many to encode a 40-bit GFN (i.e. the extra guarding
> added here wouldn't then be needed in the first place).

Yes, I think it could be reduced to use just one reserved address bit.
IIRC we just used such a large mask so the magic entries would be
really obvious in debugging, and there was no need to support arbitrary
address widths for emulated devices.

Cheers,

Tim.



