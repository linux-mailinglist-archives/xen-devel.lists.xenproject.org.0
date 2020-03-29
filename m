Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6B196DFF
	for <lists+xen-devel@lfdr.de>; Sun, 29 Mar 2020 16:56:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIZIU-0001On-3k; Sun, 29 Mar 2020 14:52:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jlgP=5O=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jIZIT-0001Oi-4G
 for xen-devel@lists.xenproject.org; Sun, 29 Mar 2020 14:52:21 +0000
X-Inumbo-ID: e46f980c-71cc-11ea-92cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e46f980c-71cc-11ea-92cf-bc764e2007e4;
 Sun, 29 Mar 2020 14:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jiuxIoNp2NwvvwYuGrrUOXoLd19b2PzyNnIiQnFwKVI=; b=D+yBrfIjFWUO0LvpxdDuNTTzdo
 aj1k2u6DD2YcpzwZw33suqSZ8Z067IO6QK6MACFiey7GLx20WfyV2jHJR7Xkk8krzfKYOYFCgTcrD
 umVmA+HtbRJJtMAww/hEmGGJy0ReXFD+PgDEPaVcLsmjCAHM/6gRjN6k/UnZPVMIWwo0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIZIR-000553-B2; Sun, 29 Mar 2020 14:52:19 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jIZIR-0004aT-0n; Sun, 29 Mar 2020 14:52:19 +0000
Date: Sun, 29 Mar 2020 15:52:16 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200329145216.qu52ii5zuh2uea3l@debian>
References: <20200320184240.41769-1-roger.pau@citrix.com>
 <20200320184240.41769-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320184240.41769-2-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v8 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Mar 20, 2020 at 07:42:38PM +0100, Roger Pau Monne wrote:
> Introduce a specific flag to request a HVM guest linear TLB flush,
> which is an ASID/VPID tickle that forces a guest linear to guest
> physical TLB flush for all HVM guests.
> 
> This was previously unconditionally done in each pre_flush call, but
> that's not required: HVM guests not using shadow don't require linear
> TLB flushes as Xen doesn't modify the guest page tables in that case
> (ie: when using HAP). Note that shadow paging code already takes care
> of issuing the necessary flushes when the shadow page tables are
> modified.
> 
> In order to keep the previous behavior modify all shadow code TLB
> flushes to also flush the guest linear to physical TLB. I haven't
> looked at each specific shadow code TLB flush in order to figure out
> whether it actually requires a guest TLB flush or not, so there might
> be room for improvement in that regard.
> 
> Also perform ASID/VPIT flushes when modifying the p2m tables as it's a
> requirement for AMD hardware. Finally keep the flush in
> switch_cr3_cr4, as it's not clear whether code could rely on
> switch_cr3_cr4 also performing a guest linear TLB flush. A following
> patch can remove the ASID/VPIT tickle from switch_cr3_cr4 if found to
> not be necessary.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

As far as I can tell all previous comments are addressed:

Reviewed-by: Wei Liu <wl@xen.org>

