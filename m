Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F71BA0DB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 12:13:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT0kq-0008ET-9A; Mon, 27 Apr 2020 10:12:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fhyl=6L=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jT0ko-0008EO-Nm
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 10:12:46 +0000
X-Inumbo-ID: a3ee47ba-886f-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3ee47ba-886f-11ea-9887-bc764e2007e4;
 Mon, 27 Apr 2020 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ikXeH5pqkWd9nkgispYOKOu5xKy4tP8PB0LrN6CIN/M=; b=paeT7ovTS2gkLQosjxIwZmw7VE
 JXp/LlvIh+bmeiBBOPVq55p6FeptftX/QUbvZFyJG0RzJv3wQ+gxCYT6e0uU2JDPhIEbSjwt0slVv
 ryEVq0ZZxIApTU3+g0ATWn1VMITytz+dObtA3MhL76XkmA7X1f/pUxOlUAWN3rUDgbxY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wl@xen.org>)
 id 1jT0ki-0003iC-9I; Mon, 27 Apr 2020 10:12:40 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jT0kh-0005Ee-Vi; Mon, 27 Apr 2020 10:12:40 +0000
Date: Mon, 27 Apr 2020 11:12:35 +0100
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v11 1/3] x86/tlb: introduce a flush HVM ASIDs flag
Message-ID: <20200427101235.6xko3lvt3qajo64m@debian>
References: <20200423145611.55378-1-roger.pau@citrix.com>
 <20200423145611.55378-2-roger.pau@citrix.com>
 <59e48d80-8ce1-3f3d-c07e-5117adea272a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59e48d80-8ce1-3f3d-c07e-5117adea272a@suse.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 06:33:49PM +0200, Jan Beulich wrote:
> On 23.04.2020 16:56, Roger Pau Monne wrote:
> > Introduce a specific flag to request a HVM guest linear TLB flush,
> > which is an ASID/VPID tickle that forces a guest linear to guest
> > physical TLB flush for all HVM guests.
> > 
> > This was previously unconditionally done in each pre_flush call, but
> > that's not required: HVM guests not using shadow don't require linear
> > TLB flushes as Xen doesn't modify the pages tables the guest runs on
> > in that case (ie: when using HAP). Note that shadow paging code
> > already takes care of issuing the necessary flushes when the shadow
> > page tables are modified.
> > 
> > In order to keep the previous behavior modify all shadow code TLB
> > flushes to also flush the guest linear to physical TLB if the guest is
> > HVM. I haven't looked at each specific shadow code TLB flush in order
> > to figure out whether it actually requires a guest TLB flush or not,
> > so there might be room for improvement in that regard.
> > 
> > Also perform ASID/VPID flushes when modifying the p2m tables as it's a
> > requirement for AMD hardware. Finally keep the flush in
> > switch_cr3_cr4, as it's not clear whether code could rely on
> > switch_cr3_cr4 also performing a guest linear TLB flush. A following
> > patch can remove the ASID/VPID tickle from switch_cr3_cr4 if found to
> > not be necessary.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 

Tim, ICYMI, this patch needs your ack.

Wei.

