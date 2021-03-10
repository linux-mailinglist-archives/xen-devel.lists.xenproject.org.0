Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8010334100
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 16:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96174.181728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0L5-0005pH-Tk; Wed, 10 Mar 2021 15:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96174.181728; Wed, 10 Mar 2021 15:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0L5-0005or-QL; Wed, 10 Mar 2021 15:01:31 +0000
Received: by outflank-mailman (input) for mailman id 96174;
 Wed, 10 Mar 2021 15:01:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0L3-0005oj-Pw
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:01:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0L3-0004AW-OB
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:01:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0L3-0002ho-N5
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:01:29 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lK0L0-0006Un-FX; Wed, 10 Mar 2021 15:01:26 +0000
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
	bh=9WbyLBxF8E/8hwOBC8GujDPyHGDlHGEiaRD1z6hj8Ks=; b=mUO86Tc5nQUZwpDsGrsqGrVYHB
	rEUlz9wlidDQifrbRfFutMzIxTQcLIhGMg8XbEwq1Nr1m4mmR2hml5X7T24cWkhcf5hi5w+/hQ6P9
	Yk9JK2/ZE1loCVsX0kYWsmkdtH8E1kGqUMqdg3jj9mmLlENS9R2XDyw9vFzckXT86eUM=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24648.57158.252811.988624@mariner.uk.xensource.com>
Date: Wed, 10 Mar 2021 15:01:26 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George  Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien  Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Anthony  PERARD <anthony.perard@citrix.com>,
    Christian Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Jun Nakajima <jun.nakajima@intel.com>,
    Kevin Tian <kevin.tian@intel.com>,
    Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible MSR behavior selection
In-Reply-To: <20210310145730.27951-1-roger.pau@citrix.com>
References: <20210310145730.27951-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH v3 for-4.15] x86/msr: introduce an option for compatible MSR behavior selection"):
> Introduce an option to allow selecting a behavior similar to the pre
> Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> handled by Xen result in the injection of a #GP to the guest. This
> is a behavior change since previously a #GP was only injected if
> accessing the MSR on the real hardware would also trigger a #GP, or if
> the attempted to be set bits wouldn't match the hardware values (for
> PV). The reasons for not leaking hardware MSR values and injecting a
> #GP are fully valid, so the solution proposed here should be
> considered a temporary workaround until all the required MSRs are
> properly handled.
> 
> This seems to be problematic for some guests, so introduce an option
> to fallback to this kind of legacy behavior without leaking the
> underlying MSR values to the guest.
> 
> When the option is set, for both PV and HVM don't inject a #GP to the
> guest on MSR read if reading the underlying MSR doesn't result in a
> #GP, do the same for writes and simply discard the value to be written
> on that case.
> 
> Note that for guests restored or migrated from previous Xen versions
> the option is enabled by default, in order to keep a compatible
> MSR behavior. Such compatibility is done at the libxl layer, to avoid
> higher-level toolstacks from having to know the details about this flag.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
...
> >From a release PoV there are risks of taking this patch, as it touches
> several different areas. So it could break MSR handling or domain
> creation. I think however we would be able to spot such breakages in
> osstest.
> 
> Not taking the patch would put us in an awkward position if people
> migrating from < 4.15 find their guests no longer boot (or crash on
> migration) on newer Xen versions, hence I think we need to accept the
> risk.

Thanks.  Yes.  I agree.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

